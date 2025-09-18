import { LightningElement, api, track } from 'lwc';
import getCourses from '@salesforce/apex/EnrollmentController.getCourses';
import enrollCourses from '@salesforce/apex/EnrollmentController.enrollCourses';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class EnrollmentManager extends LightningElement {
  @api recordId; // place this LWC on Enrolled_Student record page (recordId = Enrolled_Student__c.Id)
  @track options = [];
  @track selectedValues = [];
  isLoading = false;

  connectedCallback() {
    this.loadCourses();
  }

  loadCourses() {
    this.isLoading = true;
    getCourses()
      .then(result => {
        this.options = (result || []).map(c => ({ label: c.Name, value: c.Id }));
      })
      .catch(error => {
        this.showToast('Error loading courses', error.body?.message || error.message, 'error');
      })
      .finally(() => this.isLoading = false);
  }

  handleChange(e) {
    this.selectedValues = e.detail.value;
  }

  handleEnroll() {
    if (!this.recordId) {
      this.showToast('Error', 'Component must be on an Enrolled Student record page', 'error');
      return;
    }
    if (!this.selectedValues || this.selectedValues.length === 0) {
      this.showToast('Error', 'Select at least one course', 'error');
      return;
    }

    enrollCourses({ studentId: this.recordId, courseIds: this.selectedValues })
      .then(res => {
        this.showToast('Success', `Enrolled in ${res.length} course(s)`, 'success');
        // optionally refresh or dispatch event
      })
      .catch(error => {
        this.showToast('Error enrolling student', error.body?.message || error.message, 'error');
      });
  }

  showToast(title, message, variant) {
    this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
  }
}
