@isTest(SeeAllData=true)
private class UpsertUsersTest {

    public static String CRON_EXP = '0 0 0 28 2 ? 2022';
    
    static testmethod void testScheduledJob() {

        Test.startTest();
         String jobId = System.schedule('testScheduledJob', CRON_EXP, new upsertUsers()); 
        Test.stopTest();

        List<Financial_Advisor__c> fas = [SELECT Id FROM Financial_Advisor__c];
        System.assertEquals(200, fas.size());
            
    }
}