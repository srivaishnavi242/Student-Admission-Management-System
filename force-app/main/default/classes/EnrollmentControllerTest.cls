@IsTest
public class EnrollmentControllerTest {
    @IsTest
    static void testEnrollCourses_createsEnrollments() {
        // Step 1: Create Enrolled Student (assuming Application__c is optional or has default)
        Enrolled_Student__c student = new Enrolled_Student__c();
        insert student;

        // Step 2: Create Courses
        Course__c c1 = new Course__c(Name = 'Course 1');
        Course__c c2 = new Course__c(Name = 'Course 2');
        insert new List<Course__c>{c1, c2};

        // Step 3: Call the method under test
        Test.startTest();
        List<Enrollment_Course__c> enrollments = EnrollmentController.enrollCourses(
            student.Id,
            new List<Id>{c1.Id, c2.Id}
        );
        Test.stopTest();

        // Step 4: Verify enrollments were created
        System.assertEquals(2, enrollments.size(), 'Two enrollments should be created');
        for (Enrollment_Course__c ec : enrollments) {
            System.assertEquals(student.Id, ec.Student__c, 'Student ID should match');
        }
    }

    @IsTest
    static void testGetCourses_returnsCourses() {
        // Insert some sample courses
        insert new Course__c(Name = 'Sample Course');

        Test.startTest();
        List<Course__c> courses = EnrollmentController.getCourses();
        Test.stopTest();

        System.assert(courses.size() > 0, 'At least one course should be returned');
    }
}
