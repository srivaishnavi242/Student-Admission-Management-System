import { LightningElement, api, track } from 'lwc';
import publishDecision from '@salesforce/apex/AdmissionDecisionPublisher.publishDecision';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class DecisionWorkflow extends LightningElement {
  @api recordId; // Student_Application__c recordId on record page
  @track decision = '';
  @track comments = '';

  options = [
    { label: 'Accepted', value: 'Accepted' },
    { label: 'Rejected', value: 'Rejected' },
    { label: 'Waitlisted', value: 'Waitlisted' }
  ];

  handleDecisionChange(e) { this.decision = e.detail.value; }
  handleCommentsChange(e) { this.comments = e.target.value; }

  handleSubmit() {
    if (!this.decision) {
      this.showToast('Error', 'Select a decision', 'error');
      return;
    }
    publishDecision({ studentAppId: this.recordId, decision: this.decision, comments: this.comments })
      .then(() => {
        this.showToast('Success', 'Decision submitted', 'success');
        this.dispatchEvent(new CustomEvent('decisiondone'));
      })
      .catch(error => {
        this.showToast('Error', error.body?.message || error.message, 'error');
      });
  }

  showToast(title, message, variant) {
    this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
  }
}
