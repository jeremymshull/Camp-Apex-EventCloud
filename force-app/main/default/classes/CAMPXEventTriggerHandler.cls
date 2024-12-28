public with sharing class CAMPXEventTriggerHandler extends TriggerHandler {
    private List<CAMPX__Event__c> newEvtList;
    private List<CAMPX__Event__c> oldEvtList;
    private Map<Id, CAMPX__Event__c> newEvtMap;
    private Map<Id, CAMPX__Event__c> oldEvtMap;

    public CAMPXEventTriggerHandler() {
        this.newEvtList = (List<CAMPX__Event__c>) Trigger.new;
        this.oldEvtList = (List<CAMPX__Event__c>) Trigger.old;

        this.newEvtMap = (Map<Id, CAMPX__Event__c>) Trigger.newMap;
        this.oldEvtMap = (Map<Id, CAMPX__Event__c>) Trigger.oldMap;
    }

    public override void beforeInsert() {
        // beforeInsert logic
        CAMPXEventHelper.setEventStatus(newEvtList);
        CAMPXEventHelper.setStatusChangedDate(newEvtList, oldEvtMap);
    }

    public override void beforeUpdate() {
        CAMPXEventHelper.setStatusChangedDate(newEvtList, oldEvtMap);
    }
}