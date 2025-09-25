@IsTest
private class ApplicationListControllerTest {
    @IsTest
    static void testGetApplications_pagination() {
        // Create a Program record
        Program__c prog = new Program__c(
            Name = 'Test Program'
        );
        insert prog;

        // Create 12 Student Applications
        List<Student_Application__c> apps = new List<Student_Application__c>();
        for (Integer i = 0; i < 12; i++) {
            apps.add(new Student_Application__c(
                Applicant_First_Name__c = 'Fn' + i,
                Applicant_Last_Name__c  = 'Ln' + i,
                Email__c                = 'test' + i + '@example.com',
                Program__c              = prog.Id,
                Status__c               = 'Submitted',
                Submitted_Date__c       = System.now()
            ));
        }
        insert apps;

        // Call the method under test
        Test.startTest();
        ApplicationListController.PaginatedResult res =
            ApplicationListController.getApplications(5, 1, null);
        Test.stopTest();

        // Assertions
        System.assertNotEquals(null, res, 'Result should not be null');
        System.assert(res.records.size() <= 5, 'Should return at most 5 apps');
        System.assert(res.totalSize >= 12, 'Total size should reflect all apps');
    }
}
