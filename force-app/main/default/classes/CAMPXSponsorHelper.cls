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

    public static void setTierBasedOnContribution(List<CAMPX__Sponsor__c> newSponList) {
        for(CAMPX__Sponsor__c spon : newSponList) {
            Decimal contribution = spon.CAMPX__ContributionAmount__c;
            
            if (contribution != null && contribution > 0 && contribution < 1000) {
                spon.CAMPX__Tier__c = 'Bronze';
            }
            else if (contribution >= 1000 && contribution < 5000) {
                spon.CAMPX__Tier__c = 'Silver';
            }
            else if (contribution >= 5000) {
                spon.CAMPX__Tier__c = 'Gold';
            } else {
                spon.CAMPX__Tier__c = null;
            }
            
        }
    }

    public static void validateSponsorEventBeforeAccepting(List<CAMPX__Sponsor__c> newSponList) {
        for(CAMPX__Sponsor__c spon : newSponList) {
            if(spon.CAMPX__Status__c == 'Accepted' && spon.CAMPX__Event__c == null) {
                spon.addError('A Sponsor must be associated with an event before being Accepted.');
            }
        }
    }
}