public with sharing class UpdateMyTaskComment {
	public MyTask__c myTask;
   public UpdateMyTaskComment(ApexPages.StandardController controller) {
      this.myTask = (MyTask__c)controller.getRecord();
      this.myTask = myTask;
	}
	public Pagereference updateFeild() {
			myTask.Comment__c = 'Updated from Button';
			update myTask;
			return new pagereference('https://senla-a-dev-ed.lightning.force.com/lightning/r/MyTask__c/'+myTask.Id+'/view');
   } 
}
