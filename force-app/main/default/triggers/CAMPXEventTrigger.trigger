trigger CAMPXEventTrigger on CAMPX__Event__c (before insert, before update) {
  new CAMPXEventTriggerHandler().run();
}