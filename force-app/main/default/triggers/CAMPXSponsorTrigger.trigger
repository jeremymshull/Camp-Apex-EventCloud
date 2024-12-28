trigger CAMPXSponsorTrigger on CAMPX__Sponsor__c (before insert) {
  new CAMPXSponsorTriggerHandler().run();
}