@IsTest
public class TestUpdateMyTaskFieldComment {
	@IsTest
   public static void testFieldComment() {
		MyTask__c myTask = new MyTask__c(Comment__c='Updated from trigger');
		Test.startTest();
			Database.SaveResult result = Database.insert(myTask,false);
		Test.stopTest();
		System.assert(!result.isSuccess());
   }
}
