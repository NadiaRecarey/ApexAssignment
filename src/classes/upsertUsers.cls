global class upsertUsers implements Schedulable {
    
    /**
    * @description Scheduled process to update, insert or delete users from a json in a aws s3 bucket
    */
    global static void execute(SchedulableContext ctx) {
        makeCallout();
    }

    @future (callout=true)
    static void makeCallout(){ 
        /* get the file */
        String resp = AWSUtility.getS3file ('sfdc-training', 'FinancialAdvisors.json');
        /* integrate data on salesforce */
        FinancialAdvisorsIntegration.upsertUsers(resp); 
    }
}