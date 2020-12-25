trigger UpdateMyTaskFieldComment on MyTask__c (before insert, before update) {
		for(MyTask__c myTask : Trigger.New) {
				if(myTask.Comment__c == NULL){
					myTask.Comment__c='Updated from trigger';
				}
		}
}