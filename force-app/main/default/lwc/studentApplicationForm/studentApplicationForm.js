import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class StudentApplicationForm extends LightningElement {
  handleSuccess(event) {
    const id = event.detail.id;
    this.dispatchEvent(new ShowToastEvent({
      title: 'Application Created',
      message: `Application created (Id: ${id})`,
      variant: 'success'
    }));
    // optionally reset fields: not needed for record-edit-form (it clears)
  }
}
