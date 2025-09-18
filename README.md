# 🎓 Student Admission Management System

Student Admission Management System is a Salesforce-based application built with Lightning Web Components to streamline the entire admission lifecycle. It enables institutions to manage student applications, review and approve candidates, track enrollment, and generate insightful reports, all within a single, integrated platform.


This project was developed as a Salesforce Capstone Project to demonstrate real-world CRM implementation in the education domain.

---

## 🚀 Features

- **Student Application Form**: Online application form capturing personal, academic, and program details with validation.
- **Application Review & Approval**: Admission officers can review, filter, and evaluate submitted applications.
- **Admission Decision Workflow**: Accept, reject, or waitlist applicants with decision comments and automated notifications.
- **Enrollment Management**: Track enrolled students, assign courses, record fees, and monitor enrollment status.
- **Automated Notifications**: Alerts for submission, decision updates, and enrollment confirmations.
- **Reporting & Dashboards**: Admission trends, program performance, acceptance rates, and enrollment analytics.
- **Integrations**: Document upload support and hooks for payment gateways or external SIS.

---

## 🛠️ Tech Stack

- **Salesforce Platform** – Admin + Developer setup
- **Lightning Web Components (LWC)** – Custom UI components:
  - `applicationDetails` – Displays student application info
  - `decisionWorkflow` – Allows officers to make admission decisions
  - `enrollmentManager` – Handles course enrollment for accepted students
- **Apex** – Classes for business logic (e.g., `EnrollmentController`, `AdmissionDecisionPublisher`)
- **SOQL / SOSL** – Data retrieval and searches
- **Salesforce Flows** – Automations for notifications and approvals
- **Reports & Dashboards** – Visual analytics for admissions

---

## 📑 Application Lifecycle

### 1. Application Submission

- **Student Entry**: Students submit applications online via a custom LWC form.
- **Captured Data**:
  - Personal details: Name, Date of Birth, Contact Info
  - Academic records: GPA, Previous Institutions
  - Program/Course preferences
- **Validation**:
  - System checks required fields and data accuracy.
  - Optional attachments (transcripts, recommendation letters) uploaded via Salesforce Files.

### 2. Application Review & Approval

- **Officer Dashboard**: Admission officers access applications through a user-friendly LWC interface.
- **Filtering & Sorting**: Applications can be filtered (by program, status, submission date) and sorted for efficient management.
- **Comprehensive View**: Officers see all student details, supporting documents, and academic records in one consolidated view.
- **Internal Notes**: Officers can add evaluation notes/comments to applications.
  
### 3. Admission Decision Workflow

- **Decision Options**: Officers can Accept, Reject, or Waitlist applications.
- **Business Logic**:
  - Students cannot be accepted without a program/course assignment.
  - Decision triggers Platform Events or Flows:
    - **Accepted**: Moves student to enrollment stage.
    - **Rejected**: Closes the application.
    - **Waitlisted**: Keeps student in pending status until a seat is available.
- **Decision Comments**: Officers add comments which are stored in the application record.
  
### 4. Program & Course Assignment Algorithm

- **Assignment**: Accepted students are assigned to their selected program and available courses.
- **Enrollment Record Creation**:
  - Uses a junction object (`Enrollment_Course__c`) to manage many-to-many relationships between students and courses.
  - Tracks number of students per course and prevents duplicate enrollments.
- **Validation Rules**:
  - GPA eligibility per program.
  - Prevent enrolling a student in a course if already registered.

### 5. Enrollment Tracking

- **Enrollment Management**: Accepted students are enrolled in assigned courses.
- **Enrollment Records**: Track status, start/end dates, and fee payments.
- **Dashboards**:
  - Enrollment trends per program.
  - Total students enrolled per course.
  - Remaining seat availability per course.

### 6. Reporting & Analytics

- **Built-in Reports & Dashboards**:
  - Application metrics: Total submitted, accepted, rejected, waitlisted.
  - Acceptance rates by program; GPA distributions.
  - Year-wise academic trends.
- **Administrative Insights**:
  - Data-driven decisions for course planning and future enrollment forecasting.

### 7. Email Notifications & Integrations

- **Automated Emails**:
  - Acceptance: Details and next steps.
  - Rejection: Feedback or encouragement for future applications.
  - Waitlist: Pending status and guidance.
- **External Integrations**:
  - Synchronization with student portals, payment gateways, or document management via Platform Events/APIs.

---

## 🔗 Integrations

- **Document Upload**: Upload academic records, certificates, and supporting documents.
- **Student Information System (SIS) (Optional)**: Sync enrolled student data.

---

## 📊 Dashboards

- **Applications Overview**: Submitted, accepted, rejected, waitlisted.
- **Enrollment Trends**: Courses and program enrollments over time.
- **Acceptance Rates**: Institution-wide and program-specific.
- **Performance Analytics**: Patterns to optimize admissions.
- **Academic Record Trends**: Analyzes the academic records like GPA.
- **Total Fees Collected**: Analyzes the fees paid my each student and calculated total.

---

## 🚦 Installation & Setup

### 1. Clone Repository

```bash
git clone https://github.com/srivaishnavi242/Student-Admission-Management-System.git
cd Student-Admission-Management-System
```

### 2. Deploy to Salesforce

```bash
sfdx force:source:deploy -p force-app/main/default -u <your-org-alias>
```
> **Note:** Ensure profiles/permission sets are assigned for access to custom objects and LWCs.

### 3. Manual Setup

- Create sample Student Application records.
- Create Enrolled Student records linked to applications.
- Add Course records (at minimum, Name field).
- Verify LWCs on record pages:
  - `applicationDetails`
  - `decisionWorkflow`
  - `enrollmentManager`

### 4. Test in Experience Cloud / Mobile

- Lightning Pages render automatically in Salesforce Mobile App.
- LWCs can also be embedded in Experience Cloud sites.

---

## 🤝 Contributing

Contributions, bug reports, and suggestions are welcome!

- Fork the repository
- Open issues for bug reports or feature requests
- Create pull requests for proposed changes

---

## 👩‍💻 Author

Developed by [srivaishnavi242](https://github.com/srivaishnavi242)  
As part of a Salesforce Virtual Internship Capstone Project.
