public with sharing class defaultvalue{
	public string strDefault {get; set;}
	public List<MyTask__c> myTask { get; set; }
	public defaultvalue(){
		myTask = [SELECT Id,Name,Test__c FROM MyTask__c ORDER BY Name LIMIT 1];
		strDefault=myTask[0].Test__c;
	}
	public void changeFieldTask(){
		myTask =[SELECT Id,Name,Test__c FROM MyTask__c ORDER BY Name LIMIT 1];
		myTask[0].Test__c = strDefault ;
		update myTask;
		strDefault='';
	}
}
