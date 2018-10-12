global class upsertUsers implements Schedulable {
    
    /**
    * @description sheduled process to update, insert or delete users from a json in a aws s3 bucket
    */
    global void execute(SchedulableContext ctx) {
        /* get the file */
        HttpResponse resp = AWSUtility.getS3file ('sfdc-training', 'FinancialAdvisors.json');
        /* integrate data on salesforce */
        Integration.upsertUsers(resp); 
    }
    
}