public with sharing class CAMPXSponsorHelper {
    
    public static void setEventStatus(List<CAMPX__Sponsor__c> newSponList) {
        for(CAMPX__Sponsor__c spon : newSponList) {
            if(spon.CAMPX__Status__c == null) {
                spon.CAMPX__Status__c = 'Pending';
            }
        }
    }

    public static void addNullEmailError(List<CAMPX__Sponsor__c> newSponList) {
        for(CAMPX__Sponsor__c spon : newSponList) {
            if(spon.CAMPX__Email__c == null) {
                spon.addError('A sponsor can not be created without an email address');
            }
        }
    }
}