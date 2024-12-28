public with sharing class CAMPXSponsorTriggerHandler extends TriggerHandler {
    private List<CAMPX__Sponsor__c> newSponList;
    private List<CAMPX__Sponsor__c> oldSponList;
    private Map<Id, CAMPX__Sponsor__c> newSponMap;
    private Map<Id, CAMPX__Sponsor__c> oldSponMap;

    public CAMPXSponsorTriggerHandler() {
        this.newSponList = (List<CAMPX__Sponsor__c>) Trigger.new;
        this.oldSponList = (List<CAMPX__Sponsor__c>) Trigger.old;

        this.newSponMap = (Map<Id, CAMPX__Sponsor__c>) Trigger.newMap;
        this.oldSponMap = (Map<Id, CAMPX__Sponsor__c>) Trigger.oldMap;
    }

    public override void beforeInsert() {
        CAMPXSponsorHelper.setEventStatus(newSponList);
        CAMPXSponsorHelper.addNullEmailError(newSponList);
    }
}