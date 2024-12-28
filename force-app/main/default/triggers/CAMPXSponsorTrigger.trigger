trigger CAMPXSponsorTrigger on CAMPX__Sponsor__c (before insert, before update) {
  new CAMPXSponsorTriggerHandler().run();
}