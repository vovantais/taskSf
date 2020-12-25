@isTest
public class TestUpdateMyTaskComment {
	@isTest static void testTaskComment () {
		MyTask__c myTask = new MyTask__c();
		myTask.Name='Test';
		myTask.Comment__c=NULL;
		insert myTask;
		ApexPages.StandardController sc = new ApexPages.StandardController(myTask);
		UpdateMyTaskComment updateComment = new UpdateMyTaskComment(sc);

		updateComment.updateFeild();

		List<MyTask__c> my = [SELECT Id FROM MyTask__c];
		Integer i = my.size();
	   System.AssertEquals(1,i);	
   }
}
