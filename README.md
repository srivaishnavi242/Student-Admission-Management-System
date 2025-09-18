# Student-Admission-Management-System

Student Admission Management System is a Salesforce-based application built with Lightning Web Components to streamline the entire admission lifecycle. It enables institutions to manage student applications, review and approve candidates, track enrollment, and generate insightful reports, all within a single, integrated platform. This project was developed as a Salesforce Capstone Project to demonstrate real-world CRM implementation in the education domain.

## 🚀 Features

- **Student Application Form** – Online application with validation for personal, academic, and program details.
- **Application Review & Approval** – Officers can review, filter, and evaluate applications.
- **Admission Decision Workflow** – Accept, reject, or waitlist applicants with comments and automated notifications.
- **Enrollment Management** – Track accepted students’ enrollment status, course selections, and fee payments.
- **Automated Notifications** – Email/SMS alerts for submission, status changes, and enrollment confirmation.
- **Reporting & Dashboards** – Key metrics like application counts, acceptance rates, and enrollment trends.
- **Integrations** – Payment gateway for fees, document uploads, and Student Information System (SIS).

## 🛠️ Tech Stack

- **Salesforce Platform** (Admin + Developer)
- **Lightning Web Components (LWC)** – Custom UI components
- **Apex** – Business logic, triggers, classes
- **SOQL / SOSL** – Data retrieval and search
- **Salesforce Flows** – Process automation (notifications, approvals)
- **Reports & Dashboards** – Visual analytics
- **External Integrations** – Payment, SIS, Document Management

## 📂 Repository Structure

```
/docs         # Project documents, screenshots, user guides
/src          # Salesforce metadata (Apex classes, LWC, Flows)
README.md     # Project overview and documentation
```

## 🎯 Use Cases

### Application Submission
- Students fill and submit applications online
- Data validation ensures accuracy before submission

### Review & Approval
- Officers access submitted applications
- Filter, sort, and check supporting documents

### Decision Workflow
- Mark applications as Accepted / Rejected / Waitlisted
- Automated notifications sent to applicants

### Enrollment Tracking
- Accepted students select courses and update fee status
- Enrollment progress visible in dashboards

### Reporting & Analytics
- Dashboards for admission trends, program performance, and enrollment data

## 🔗 Integrations

- **Payment Gateway** – Online fee payment tracking
- **Document Upload** – Academic record and certificate submission
- **Student Information System (SIS)** – Sync enrolled student records

## 📊 Dashboards

- **Applications Overview** – Total submitted, accepted, rejected, waitlisted
- **Enrollment Trends** – Course/program enrollments over time
- **Acceptance Rates** – Institution-wide and program-specific
- **Performance Analytics** – Identify patterns to optimize admissions

## 🚦 Installation & Setup

### Clone the Repository

```bash
git clone https://github.com/<your-username>/Student-Admission-Management-System.git
```

### Deploy to Salesforce

- Use Salesforce CLI (`sfdx`) to deploy `/src` metadata to your Salesforce org
- Assign profiles and permission sets to users

### Configure Integrations

- Setup Payment Gateway mock credentials in Custom Settings
- Configure SIS/document storage if required

### Demo Data

- Import sample data (students, applications, programs) for testing

## 🤝 Contributing

Contributions, suggestions, and bug reports are welcome!

- Fork the repo and create a pull request
- Open issues for bugs or new feature ideas

## 👩‍💻 Author

Developed by [srivaishnavi242](https://github.com/srivaishnavi242)  
As part of a Salesforce Virtual Internship Capstone Project.