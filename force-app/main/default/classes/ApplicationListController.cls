public with sharing class ApplicationListController {

    public class PaginatedResult {
        @AuraEnabled public List<Student_Application__c> records;
        @AuraEnabled public Integer totalSize;
    }

    @AuraEnabled(cacheable=true)
    public static PaginatedResult getApplications(Integer pageSize, Integer pageNumber, String statusFilter) {
        if (pageSize == null || pageSize <= 0) pageSize = 10;
        if (pageNumber == null || pageNumber < 1) pageNumber = 1;
        Integer offsetVal = (pageNumber - 1) * pageSize;

        List<Student_Application__c> apps;
        Integer total = 0;

        if (String.isBlank(statusFilter)) {
            apps = [
                SELECT Id, Applicant_First_Name__c, Applicant_Last_Name__c,
                       Email__c, Status__c, Submitted_Date__c
                FROM Student_Application__c
                ORDER BY Submitted_Date__c DESC
                LIMIT :pageSize OFFSET :offsetVal
            ];
            total = [SELECT COUNT() FROM Student_Application__c];
        } else {
            apps = [
                SELECT Id, Applicant_First_Name__c, Applicant_Last_Name__c,
                       Email__c, Status__c, Submitted_Date__c
                FROM Student_Application__c
                WHERE Status__c = :statusFilter
                ORDER BY Submitted_Date__c DESC
                LIMIT :pageSize OFFSET :offsetVal
            ];
            total = [SELECT COUNT() FROM Student_Application__c WHERE Status__c = :statusFilter];
        }

        PaginatedResult res = new PaginatedResult();
        res.records = apps;
        res.totalSize = total;
        return res;
    }
}
