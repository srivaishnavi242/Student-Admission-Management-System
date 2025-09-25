public with sharing class AdmissionDecisionPublisher {

    @AuraEnabled
    public static void publishDecision(Id studentAppId, String decision, String comments) {
        if (studentAppId == null) {
            throw new AuraHandledException('studentAppId is required');
        }

        // Fetch the application
        Student_Application__c app = [
            SELECT Id, Status__c, Program__c
            FROM Student_Application__c
            WHERE Id = :studentAppId
            LIMIT 1
        ];

        // Optional validation: ensure Program is selected if Accepted
        if (decision == 'Accepted' && app.Program__c == null) {
            throw new AuraHandledException('Program must be selected before marking application as Accepted.');
        }

        // Update the Student Application record
        app.Status__c = decision;
        app.Decision_Comments__c = comments;
        update app;

        // Publish the platform event
        Application_Decision__e evt = new Application_Decision__e(
            Application_Id__c = String.valueOf(studentAppId),
            Decision__c = decision,
            Officer_Id__c = UserInfo.getUserId(),
            Comments__c = comments,
            Decision_Date__c = System.now()
        );
        EventBus.publish(evt);
    }
}
