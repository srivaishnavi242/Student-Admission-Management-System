import { LightningElement, track } from 'lwc';
import getApplications from '@salesforce/apex/ApplicationListController.getApplications';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const COLUMNS = [
  { label: 'App. Number', fieldName: 'Name', type: 'text' },
  { label: 'Applicant', fieldName: 'ApplicantDisplay', type: 'text' },
  { label: 'Email', fieldName: 'Email__c', type: 'email' },
  { label: 'Status', fieldName: 'Status__c', type: 'text' },
  { label: 'Submitted', fieldName: 'Submitted_Date__c', type: 'date' },
  {
    type: 'action',
    typeAttributes: { rowActions: [{ label: 'View', name: 'view' }] }
  }
];

export default class ApplicationList extends NavigationMixin(LightningElement) {
  @track data = [];
  columns = COLUMNS;
  pageSize = 10;
  pageNumber = 1;
  totalSize = 0;
  statusFilter = null;
  searchTerm = null;
  isLoading = false;

  statusOptions = [
    { label: 'All', value: '' },
    { label: 'Submitted', value: 'Submitted' },
    { label: 'Under Review', value: 'Under Review' },
    { label: 'Accepted', value: 'Accepted' },
    { label: 'Rejected', value: 'Rejected' },
    { label: 'Waitlisted', value: 'Waitlisted' }
  ];

  connectedCallback() {
    this.loadData();
  }

  get totalPages() {
    return Math.ceil(this.totalSize / this.pageSize) || 1;
  }
  get isFirstPage() {
    return this.pageNumber <= 1;
  }
  get isLastPage() {
    return this.pageNumber >= this.totalPages;
  }

  loadData() {
    this.isLoading = true;
    getApplications({ pageSize: this.pageSize, pageNumber: this.pageNumber, statusFilter: this.statusFilter })
      .then(result => {
        // result.records is List<Student_Application__c>
        this.totalSize = result.totalSize || 0;
        this.data = (result.records || []).map(r => ({
          Id: r.Id,
          Name: r.Name,
          ApplicantDisplay: `${r.Applicant_First_Name__c || ''} ${r.Applicant_Last_Name__c || ''}`.trim(),
          Email__c: r.Email__c,
          Status__c: r.Status__c,
          Submitted_Date__c: r.Submitted_Date__c
        }));
      })
      .catch(error => {
        this.dispatchEvent(new ShowToastEvent({ title: 'Error loading applications', message: error.body?.message || error.message, variant: 'error' }));
        this.data = [];
        this.totalSize = 0;
      })
      .finally(() => { this.isLoading = false; });
  }

  nextPage() {
    if (!this.isLastPage) {
      this.pageNumber++;
      this.loadData();
    }
  }
  prevPage() {
    if (this.pageNumber > 1) {
      this.pageNumber--;
      this.loadData();
    }
  }

  onStatusChange(e) {
    this.statusFilter = e.detail.value || null;
    this.pageNumber = 1;
    this.loadData();
  }

  onSearch(e) {
    // optional: your ApplicationListController does not accept searchTerm in the version above.
    // If you added searchTerm to Apex, call it here. Otherwise ignore or implement client-side filter.
    // Placeholder: no-op or implement custom code.
  }

  handleRowAction(event) {
    const actionName = event.detail.action.name;
    const row = event.detail.row;
    if (actionName === 'view') {
      this[NavigationMixin.Navigate]({
        type: 'standard__recordPage',
        attributes: {
          recordId: row.Id,
          actionName: 'view',
          objectApiName: 'Student_Application__c'
        }
      });
    }
  }
}
