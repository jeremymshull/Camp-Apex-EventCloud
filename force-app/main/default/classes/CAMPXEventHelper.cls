public with sharing class CAMPXEventHelper {

    public static void setEventStatus(List<CAMPX__Event__c> newEvtList) {
        for(CAMPX__Event__c evt : newEvtList) {
            evt.CAMPX__Status__c = 'Planning';
        }
    }

    public static void setStatusChangedDate(List<CAMPX__Event__c> newEvtList, Map<Id,CAMPX__Event__c> oldEvtMap) {
        for(CAMPX__Event__c evt : newEvtList) {
            if(oldEvtMap == null || !oldEvtMap.containsKey(evt.ID)) {
                evt.CAMPX__StatusChangeDate__c = Datetime.now();
            }

            else if(evt.CAMPX__Status__c != oldEvtMap.get(evt.Id).CAMPX__Status__c) {
                evt.CAMPX__StatusChangeDate__c = Datetime.now();
            }

        }
    }
}