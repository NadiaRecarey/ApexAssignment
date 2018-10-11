global class Integration{

    public String getUsersFromS3(){
        HTTPResponse resp = AWSUtility.getS3file ('sfdc-training', 'FinancialAdvisors.json');
        return resp.getBody();
    }

    public void upsertUsers(String json){

        /*PARSE JSON*/
        List<JSON2Apex> financialAccounts = Json2Apex.parse(json);
        

        /*UPSERT FINANCIAL ADVISORS*/
        List<Financial_Advisor__c> financialAdvisors = new List<Financial_Advisor__c>();

        for (JSON2Apex j2a : financialAccounts){
            for(Json2Apex.Financial_Advisor fa : j2a.Accounts){
                String[] aod = fa.AsOfDate.split('/');
                Financial_Advisor__c f = new Financial_Advisor__c(
                                            Account_Number__c = fa.AccountNumber,
                                            Name = fa.AccountName,
                                            Account_Status__c = fa.AccountStatus,
                                            As_Of_Date__c = date.parse(aod[1]+'/'+aod[0]+'/'+aod[2])
                                            );
                financialAdvisors.add(f);
            } 
        }

        upsert financialAdvisors Account_Number__c;

        List<Financial_Advisor__c> fasMAP = new List<Financial_Advisor__c>([SELECT ID,Account_Number__c FROM Financial_Advisor__c]);
        MAP<String, ID> allFARecords = new MAP<String,ID>();
        for(Financial_Advisor__c record: fasMAP) {
            allFARecords.put(record.Account_Number__c, record.ID);
        }
        
        /*UPSERT CUSTOMERS*/ 
        List<Customer__c> custs = new List<Customer__c>();

        for (JSON2Apex j2a : financialAccounts){
            for(Json2Apex.Financial_Advisor acc : j2a.Accounts){      
                for (JSON2Apex.Customers c : acc.Customers){
                    Customer__c cust = new Customer__c(
                                    First_Name__c = c.FirstName,
                                    Last_Name__c = c.LastName,
                                    Email__c = c.Email,
                                    Phone__c = c.Phone,
                                    Address__c = c.Address,
                                    Customer_Number__c = c.CustomerNumber,
                                    Account_Customer_Number__c = acc.AccountNumber + c.CustomerNumber,
                                    Financial_Advisor__c = allFARecords.get(acc.AccountNumber)
                                    );
                    custs.add(cust);
                }
            }
        }

        upsert custs Account_Customer_Number__c;
         

        /*DELETE*/         
        List<String> ids = new List<String>();
        for(Financial_Advisor__c fac : financialAdvisors)
            ids.add(fac.Id);
        for(Customer__c cc : custs)
            ids.add(cc.Id);

        List<Financial_Advisor__c> fasToDelete = new List<Financial_Advisor__c>();
        List<Customer__c> cusToDelete = new List<Customer__c>();

        List<Financial_Advisor__c> salesforceFAS = [SELECT Id FROM Financial_Advisor__c];
        
        for (Financial_Advisor__c sffas : salesforceFAS)
            if (!ids.contains(sffas.Id)) 
                fasToDelete.add(sffas);

        delete fasToDelete;
            
        List<Customer__c> salesforceCus = [SELECT Id FROM Customer__c];    
        for(Customer__c cus : salesforceCus)
            if(!ids.contains(cus.Id))
                cusToDelete.add(cus);
            
        delete cusToDelete;
   } 
 
}