@isTest
public class AWSUtilityTest {
    static testmethod void testGetS3File() {
		StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('getS3');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);
        HTTPResponse result = AWSUtility.getS3file ('sfdc-training', 'FinancialAdvisors.json');
        
        System.assertNotEquals(null,result,'The callout returned a null response.');
        System.assertEquals(200,result.getStatusCode(),'The status code is not 200.');
        System.assertEquals('application/json;charset=UTF-8',result.getHeader('Content-Type'),'The content type value is not expected.');  
      
        // Verify the array contains 3 items     
        List<JSON2Apex> financialAccounts = Json2Apex.parse(result.getBody());
        List<JSON2Apex.Financial_Advisor> financialAdvisors = financialAccounts[0].Accounts;
        System.assertEquals(3, financialAdvisors.size(),'The array should only contain 3 Financial Advisors.');          
    
    }
}