({
    packItem : function(component, event, helper) {
			let changeAtttr = event.getSource().get('v.lable');
			console.log(changeAtttr);
			component.set("v.item.Packed__c", true);
			component.set("v.Packed!", disabled='true');
    },
})
