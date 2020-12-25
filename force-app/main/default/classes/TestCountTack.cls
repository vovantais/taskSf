@IsTest
public class TestCountTack {
	@IsTest
	public static void testingCountTack(){
		Integer count = 0;
		Map<Id, Integer> modelMap = new Map<Id, Integer>();
		MyTask__c myTask = new MyTask__c(Name='test');
		Contact con = new Contact(LastName='test',CountMyTask__c=null);
		Test.startTest();
			Database.SaveResult result = Database.insert(myTask, false);
			Database.SaveResult result2 = Database.insert(myTask, false);
		Test.stopTest();
		System.assert(result.isSuccess());
		System.assert(result2.isSuccess());
		if((Trigger.isInsert) && modelMap.containsKey(myTask.OwnerId)){
			count = modelMap.get(myTask.OwnerId);
		}
			count += Trigger.isInsert ? 1 :-1;
			modelMap.put(myTask.OwnerId, count);
		System.AssertEquals(count,modelMap.size());

		for(Contact c :[SELECT OwnerId, CountMyTask__c FROM Contact WHERE OwnerId IN :modelMap.keySet()]){
			if(c.CountMyTask__c == null) {
				c.CountMyTask__c = 0;
				System.AssertEquals(0,c.CountMyTask__c);
			}
			c.CountMyTask__c += modelMap.get(c.OwnerId);
			Test.startTest();
      		Database.SaveResult result3 = Database.update(c, false);
			Test.stopTest();
			System.assert(result3.isSuccess());
			System.AssertEquals(1,count);
		}
	}
		
}
