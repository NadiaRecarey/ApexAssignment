@isTest
public class FinancialAdvisorsIntegrationTest {
	   static testmethod void testAddAll() {

        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('[{"Accounts":[{"AccountNumber":"ac2ac724-5eee-482f-8aeb-55c1ec23d71d","AccountName":"Jabbertype","AccountStatus":"Inactive","AsOfDate":"9/27/2016","Customers":[{"FirstName":"Nonnah","LastName":"Drayton","Email":"no\'neill0@diigo.com","Phone":"375-(586)345-1801","Address":"7956LusterTerrace","CustomerNumber":"0fc81d74-cad8-49e0-9567-9e8d0a612a7a"},{"FirstName":"Foster","LastName":"Tackes","Email":"fmeneo1@quantcast.com","Phone":"30-(400)275-3547","Address":"12074LakewoodGardensAlley","CustomerNumber":"5cd44ecd-e310-4277-9328-4023b8fc6987"},{"FirstName":"Nicoli","LastName":"Furmagier","Email":"ncauson2@themeforest.net","Phone":"970-(336)587-8052","Address":"2HuxleyPoint","CustomerNumber":"9da711a3-2e87-48de-8774-0296526541d2"},{"FirstName":"Filberte","LastName":"Teasdale-Markie","Email":"fgowdy3@hibu.com","Phone":"380-(747)331-9641","Address":"2BluejayCrossing","CustomerNumber":"5b1c778a-c7c0-4bbd-9a36-43d79283330d"}]},{"AccountNumber":"a8c090d6-165e-424a-8e57-7fb57f69313c","AccountName":"Wikizz","AccountStatus":"Active","AsOfDate":"10/3/2016","Customers":[{"FirstName":"Nonnah","LastName":"Swindells","Email":"ngrinyakin0@spiegel.de","Phone":"86-(178)738-2183","Address":"4AlgomaDrive","CustomerNumber":"128bf918-0d4a-4755-9e38-ab065ae3a9b4"},{"FirstName":"Jessika","LastName":"Antonescu","Email":"jwadlow1@mail.ru","Phone":"351-(785)244-5709","Address":"00MaywoodParkway","CustomerNumber":"d0269c28-42d6-4a1f-a605-fb22a6c598d5"},{"FirstName":"Odey","LastName":"McElvogue","Email":"obirchall2@dedecms.com","Phone":"963-(970)720-2612","Address":"23719PetterlePlace","CustomerNumber":"99a12bc8-c162-4c75-afb1-022ebb1165c7"},{"FirstName":"Lee","LastName":"Casillas","Email":"lcoase3@cnbc.com","Phone":"358-(576)398-2215","Address":"28592BlueBillParkCenter","CustomerNumber":"d22cf9ac-b565-4687-8462-d14445bbbb1a"}]},{"AccountNumber":"b8b17453-fefd-4755-a494-f810def3cd36","AccountName":"Yadel","AccountStatus":"Inactive","AsOfDate":"9/17/2016","Customers":[{"FirstName":"Sansone","LastName":"Ducker","Email":"sbirds0@tripadvisor.com","Phone":"86-(771)935-2121","Address":"72KilldeerStreet","CustomerNumber":"8e09e740-32b4-4c7e-9fa7-ff463dab8d91"},{"FirstName":"Jeralee","LastName":"McGirr","Email":"jjerschke1@ow.ly","Phone":"46-(560)441-1059","Address":"24153WeepingBirchWay","CustomerNumber":"3122a79f-0e8c-4f2e-be85-9ce618f5b8de"},{"FirstName":"Esme","LastName":"Fibbens","Email":"edelacourt2@ucoz.ru","Phone":"60-(549)189-1306","Address":"897SurreyJunction","CustomerNumber":"d7196130-50b7-4ed7-96c9-b729e43ebb5e"}]}]}]');
        response.setStatusCode(200);

        FinancialAdvisorsIntegration.upsertUsers(response.getBody());

        List<Financial_Advisor__c> sffas = new List<Financial_Advisor__c>([SELECT id FROM Financial_Advisor__c]);
        System.assertequals(3,sffas.size(),'There should be 3 records for Financial_Advisor__c');

        List<Customer__c> sfcus = new List<Customer__c>([SELECT id FROM Customer__c]);
        System.assertequals(11,sfcus.size(),'There should be 11 records for Customer__c');
    }

    static testmethod void testDeleteCustomer(){

        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('[{"Accounts":[{"AccountNumber":"ac2ac724-5eee-482f-8aeb-55c1ec23d71d","AccountName":"Jabbertype","AccountStatus":"Inactive","AsOfDate":"9/27/2016","Customers":[{"FirstName":"Nonnah","LastName":"Drayton","Email":"no\'neill0@diigo.com","Phone":"375-(586)345-1801","Address":"7956LusterTerrace","CustomerNumber":"0fc81d74-cad8-49e0-9567-9e8d0a612a7a"},{"FirstName":"Foster","LastName":"Tackes","Email":"fmeneo1@quantcast.com","Phone":"30-(400)275-3547","Address":"12074LakewoodGardensAlley","CustomerNumber":"5cd44ecd-e310-4277-9328-4023b8fc6987"},{"FirstName":"Nicoli","LastName":"Furmagier","Email":"ncauson2@themeforest.net","Phone":"970-(336)587-8052","Address":"2HuxleyPoint","CustomerNumber":"9da711a3-2e87-48de-8774-0296526541d2"},{"FirstName":"Filberte","LastName":"Teasdale-Markie","Email":"fgowdy3@hibu.com","Phone":"380-(747)331-9641","Address":"2BluejayCrossing","CustomerNumber":"5b1c778a-c7c0-4bbd-9a36-43d79283330d"}]},{"AccountNumber":"a8c090d6-165e-424a-8e57-7fb57f69313c","AccountName":"Wikizz","AccountStatus":"Active","AsOfDate":"10/3/2016","Customers":[{"FirstName":"Nonnah","LastName":"Swindells","Email":"ngrinyakin0@spiegel.de","Phone":"86-(178)738-2183","Address":"4AlgomaDrive","CustomerNumber":"128bf918-0d4a-4755-9e38-ab065ae3a9b4"},{"FirstName":"Jessika","LastName":"Antonescu","Email":"jwadlow1@mail.ru","Phone":"351-(785)244-5709","Address":"00MaywoodParkway","CustomerNumber":"d0269c28-42d6-4a1f-a605-fb22a6c598d5"},{"FirstName":"Odey","LastName":"McElvogue","Email":"obirchall2@dedecms.com","Phone":"963-(970)720-2612","Address":"23719PetterlePlace","CustomerNumber":"99a12bc8-c162-4c75-afb1-022ebb1165c7"},{"FirstName":"Lee","LastName":"Casillas","Email":"lcoase3@cnbc.com","Phone":"358-(576)398-2215","Address":"28592BlueBillParkCenter","CustomerNumber":"d22cf9ac-b565-4687-8462-d14445bbbb1a"}]},{"AccountNumber":"b8b17453-fefd-4755-a494-f810def3cd36","AccountName":"Yadel","AccountStatus":"Inactive","AsOfDate":"9/17/2016","Customers":[{"FirstName":"Sansone","LastName":"Ducker","Email":"sbirds0@tripadvisor.com","Phone":"86-(771)935-2121","Address":"72KilldeerStreet","CustomerNumber":"8e09e740-32b4-4c7e-9fa7-ff463dab8d91"},{"FirstName":"Jeralee","LastName":"McGirr","Email":"jjerschke1@ow.ly","Phone":"46-(560)441-1059","Address":"24153WeepingBirchWay","CustomerNumber":"3122a79f-0e8c-4f2e-be85-9ce618f5b8de"}]}]}]');
        response.setStatusCode(200);

        FinancialAdvisorsIntegration.upsertUsers(response.getBody());

        List<Financial_Advisor__c> sffas = new List<Financial_Advisor__c>([SELECT id FROM Financial_Advisor__c]);
        System.assertequals(3, sffas.size(),'There should be 3 records for Financial_Advisor__c');

        List<Customer__c> sfcus = new List<Customer__c>([SELECT id FROM Customer__c]);
        System.assertequals(10, sfcus.size(),'There should be 10 records for Customer__c');

    }

    static testmethod void testDeleteFA(){
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('[{"Accounts":[{"AccountNumber":"ac2ac724-5eee-482f-8aeb-55c1ec23d71d","AccountName":"Jabbertype","AccountStatus":"Inactive","AsOfDate":"9/27/2016","Customers":[{"FirstName":"Nonnah","LastName":"Drayton","Email":"no\'neill0@diigo.com","Phone":"375-(586)345-1801","Address":"7956LusterTerrace","CustomerNumber":"0fc81d74-cad8-49e0-9567-9e8d0a612a7a"},{"FirstName":"Foster","LastName":"Tackes","Email":"fmeneo1@quantcast.com","Phone":"30-(400)275-3547","Address":"12074LakewoodGardensAlley","CustomerNumber":"5cd44ecd-e310-4277-9328-4023b8fc6987"},{"FirstName":"Nicoli","LastName":"Furmagier","Email":"ncauson2@themeforest.net","Phone":"970-(336)587-8052","Address":"2HuxleyPoint","CustomerNumber":"9da711a3-2e87-48de-8774-0296526541d2"},{"FirstName":"Filberte","LastName":"Teasdale-Markie","Email":"fgowdy3@hibu.com","Phone":"380-(747)331-9641","Address":"2BluejayCrossing","CustomerNumber":"5b1c778a-c7c0-4bbd-9a36-43d79283330d"}]},{"AccountNumber":"a8c090d6-165e-424a-8e57-7fb57f69313c","AccountName":"Wikizz","AccountStatus":"Active","AsOfDate":"10/3/2016","Customers":[{"FirstName":"Nonnah","LastName":"Swindells","Email":"ngrinyakin0@spiegel.de","Phone":"86-(178)738-2183","Address":"4AlgomaDrive","CustomerNumber":"128bf918-0d4a-4755-9e38-ab065ae3a9b4"},{"FirstName":"Jessika","LastName":"Antonescu","Email":"jwadlow1@mail.ru","Phone":"351-(785)244-5709","Address":"00MaywoodParkway","CustomerNumber":"d0269c28-42d6-4a1f-a605-fb22a6c598d5"},{"FirstName":"Odey","LastName":"McElvogue","Email":"obirchall2@dedecms.com","Phone":"963-(970)720-2612","Address":"23719PetterlePlace","CustomerNumber":"99a12bc8-c162-4c75-afb1-022ebb1165c7"},{"FirstName":"Lee","LastName":"Casillas","Email":"lcoase3@cnbc.com","Phone":"358-(576)398-2215","Address":"28592BlueBillParkCenter","CustomerNumber":"d22cf9ac-b565-4687-8462-d14445bbbb1a"}]}]}]');
        response.setStatusCode(200);

        FinancialAdvisorsIntegration.upsertUsers(response.getBody());

        List<Financial_Advisor__c> sffas = new List<Financial_Advisor__c>([SELECT id FROM Financial_Advisor__c]);
        System.assertequals(2,sffas.size(),'There should be 2 records for Financial_Advisor__c');

        List<Customer__c> sfcus = new List<Customer__c>([SELECT id FROM Customer__c]);
        System.assertequals(8, sfcus.size(),'There should be 10 records for Customer__c');
    }

    static testmethod void testError(){
       try {
            //esme and jeralee have the same customer number
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setBody('[{"Accounts":[{"AccountNumber":"ac2ac724-5eee-482f-8aeb-55c1ec23d71d","AccountName":"Jabbertype","AccountStatus":"Inactive","AsOfDate":"9/27/2016","Customers":[{"FirstName":"Nonnah","LastName":"Drayton","Email":"no\'neill0@diigo.com","Phone":"375-(586)345-1801","Address":"7956LusterTerrace","CustomerNumber":"0fc81d74-cad8-49e0-9567-9e8d0a612a7a"},{"FirstName":"Foster","LastName":"Tackes","Email":"fmeneo1@quantcast.com","Phone":"30-(400)275-3547","Address":"12074LakewoodGardensAlley","CustomerNumber":"5cd44ecd-e310-4277-9328-4023b8fc6987"},{"FirstName":"Nicoli","LastName":"Furmagier","Email":"ncauson2@themeforest.net","Phone":"970-(336)587-8052","Address":"2HuxleyPoint","CustomerNumber":"9da711a3-2e87-48de-8774-0296526541d2"},{"FirstName":"Filberte","LastName":"Teasdale-Markie","Email":"fgowdy3@hibu.com","Phone":"380-(747)331-9641","Address":"2BluejayCrossing","CustomerNumber":"5b1c778a-c7c0-4bbd-9a36-43d79283330d"}]},{"AccountNumber":"a8c090d6-165e-424a-8e57-7fb57f69313c","AccountName":"Wikizz","AccountStatus":"Active","AsOfDate":"10/3/2016","Customers":[{"FirstName":"Nonnah","LastName":"Swindells","Email":"ngrinyakin0@spiegel.de","Phone":"86-(178)738-2183","Address":"4AlgomaDrive","CustomerNumber":"128bf918-0d4a-4755-9e38-ab065ae3a9b4"},{"FirstName":"Jessika","LastName":"Antonescu","Email":"jwadlow1@mail.ru","Phone":"351-(785)244-5709","Address":"00MaywoodParkway","CustomerNumber":"d0269c28-42d6-4a1f-a605-fb22a6c598d5"},{"FirstName":"Odey","LastName":"McElvogue","Email":"obirchall2@dedecms.com","Phone":"963-(970)720-2612","Address":"23719PetterlePlace","CustomerNumber":"99a12bc8-c162-4c75-afb1-022ebb1165c7"},{"FirstName":"Lee","LastName":"Casillas","Email":"lcoase3@cnbc.com","Phone":"358-(576)398-2215","Address":"28592BlueBillParkCenter","CustomerNumber":"d22cf9ac-b565-4687-8462-d14445bbbb1a"}]},{"AccountNumber":"b8b17453-fefd-4755-a494-f810def3cd36","AccountName":"Yadel","AccountStatus":"Inactive","AsOfDate":"9/17/2016","Customers":[{"FirstName":"Sansone","LastName":"Ducker","Email":"sbirds0@tripadvisor.com","Phone":"86-(771)935-2121","Address":"72KilldeerStreet","CustomerNumber":"8e09e740-32b4-4c7e-9fa7-ff463dab8d91"},{"FirstName":"Jeralee","LastName":"McGirr","Email":"jjerschke1@ow.ly","Phone":"46-(560)441-1059","Address":"24153WeepingBirchWay","CustomerNumber":"d7196130-50b7-4ed7-96c9-b729e43ebb5e"},{"FirstName":"Esme","LastName":"Fibbens","Email":"edelacourt2@ucoz.ru","Phone":"60-(549)189-1306","Address":"897SurreyJunction","CustomerNumber":"d7196130-50b7-4ed7-96c9-b729e43ebb5e"}]}]}]');
            response.setStatusCode(200);

            FinancialAdvisorsIntegration.upsertUsers(response.getBody());

        } catch(DMLException e) {
            System.assert(e.getMessage().contains('System.DmlException: Upsert failed'));
        }
    }
}