	@IsTest
public class TestDefaultvalue {
	@IsTest static void testChangeFieldTask(){
		MyTask__c myTask = new MyTask__c();
		myTask.Name='Test';
		myTask.Test__c='test comment';
		insert myTask;
		defaultvalue testValue = new defaultvalue();

		testValue.changeFieldTask();
		List<MyTask__c> my = [SELECT Id FROM MyTask__c];
		Integer i = my.size();
	   system.assertEquals(1,i);
	}
}
