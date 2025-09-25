public with sharing class EnrollmentController {
    @AuraEnabled
    public static List<Enrollment_Course__c> enrollCourses(Id studentId, List<Id> courseIds) {
        if (studentId == null || courseIds == null || courseIds.isEmpty()) {
            return new List<Enrollment_Course__c>();
        }

        // Get the Enrolled Student record to find its Application__c
        Enrolled_Student__c enrolled = [
            SELECT Id, Application__c
            FROM Enrolled_Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        List<Enrollment_Course__c> inserts = new List<Enrollment_Course__c>();
        for (Id cId : courseIds) {
            inserts.add(new Enrollment_Course__c(
                Student__c      = studentId,
                Course__c       = cId,
                Application__c  = enrolled.Application__c
            ));
        }
        insert inserts;
        return inserts;
    }

    @AuraEnabled(cacheable=true)
    public static List<Course__c> getCourses() {
        return [
            SELECT Id, Name 
            FROM Course__c 
            ORDER BY Name 
            LIMIT 500
        ];
    }
}
