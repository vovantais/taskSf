trigger countTack on MyTask__c (after insert, after delete) {
	Map<Id, Integer> modelMap = new Map<Id, Integer>();
	Integer count = 0;
		for(MyTask__c my :(Trigger.isInsert ? Trigger.new : Trigger.old)) {
		if(modelMap.containsKey(my.OwnerId)) {
		count = modelMap.get(my.OwnerId);
		}
		count += Trigger.isInsert ? 1 :-1;
		modelMap.put(my.OwnerId, count);
		}
		List<Contact> cont = [SELECT OwnerId, CountMyTask__c FROM Contact WHERE OwnerId IN :modelMap.keySet()];
		for(Contact c : cont) {
			if(c.CountMyTask__c == null) {
				c.CountMyTask__c = 0;
			}
			c.CountMyTask__c += modelMap.get(c.OwnerId);
		}
		update(cont);
}
