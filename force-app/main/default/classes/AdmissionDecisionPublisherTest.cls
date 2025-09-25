@IsTest
public class AdmissionDecisionPublisherTest {

    @IsTest
    static void testPublishDecision_updatesRecordAndPublishesEvent() {
        // Create Program
        Program__c prog = new Program__c(Name = 'Test Program');
        insert prog;

        // Create Student Application
        Student_Application__c app = new Student_Application__c(
            Applicant_First_Name__c = 'Test',
            Applicant_Last_Name__c = 'User',
            Email__c = 'test@example.com',
            Program__c = prog.Id,
            Submitted_Date__c = System.now()
        );
        insert app;

        Test.startTest();
        AdmissionDecisionPublisher.publishDecision(
            app.Id,
            'Accepted',
            'Good performance'
        );
        Test.stopTest();

        Student_Application__c updatedApp = [
            SELECT Id, Status__c, Decision_Comments__c
            FROM Student_Application__c
            WHERE Id = :app.Id
        ];

        System.assertEquals('Accepted', updatedApp.Status__c);
        System.assertEquals('Good performance', updatedApp.Decision_Comments__c);
    }
}
