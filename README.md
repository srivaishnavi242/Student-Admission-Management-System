# 🎓 Student Admission Management System

Student Admission Management System is a Salesforce-based application built with Lightning Web Components to streamline the entire admission lifecycle. It enables institutions to manage student applications, review and approve candidates, track enrollment, and generate insightful reports, all within a single, integrated platform. This project was developed as a Salesforce Capstone Project to demonstrate real-world CRM implementation in the education domain.

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

### Application Submission
- Students submit applications online.
- System validates personal details, program, and contact info.

### Review & Approval
- Officers access applications via LWC UI.
- Can filter, sort, and view uploaded documents.

### Decision Workflow
- Accept, Reject, or Waitlist applications.
- Comments and automated notifications handled through Apex and Flows.

### Enrollment Tracking
- Accepted students assigned to courses.
- Track enrollment status, start/end dates, and fee payments.
- Dashboard shows enrollment trends per program.

### Reporting & Analytics
- Admission performance by program.
- Total submitted, accepted, rejected, and waitlisted applications.
- Enrollment trends and student distribution.

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
