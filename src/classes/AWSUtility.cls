public class AWSUtility {

    /**
    * @description Returns the http response of callout to aws s3 bucket
    *
    * @param bucketName is the name of the bucket 
    * @param fileName name of the file to get
    *
    * @return httpRespone of the callout 
    */
    public static HttpResponse getS3file (String bucketName, String fileName) {
        
        String formattedDateString = DateTime.now().formatGMT('EEE, dd MMM yyyy HH:mm:ss z');
        String host = 's3.amazonaws.com';

        /* make the http request to get json from the s3 bucket */ 
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://' + bucketName + '.' + host + '/' + fileName);
        req.setHeader('Host', bucketName + '.' + host);
        req.setHeader('Connection', 'keep-alive');
        req.setHeader('Date', formattedDateString);
        req.setHeader('ACL', 'public-read-write');          
        
        /* get key and secret from custom settings */ 
        S3_Bucket__c bucket = S3_Bucket__c.getValues('training');
        String key = bucket.Key__c;
        String secret = bucket.Secret__c;

        /* sign url and set it to the authorization header of request */
        String stringToSign = 'GET\n\n' + '\n' + formattedDateString + '\n/' + bucketname + '/' + filename;
         
        Blob mac = Crypto.generateMac('HMACSHA1', blob.valueOf(stringToSign), blob.valueof(secret));
        String signed = EncodingUtil.base64Encode(mac);
        String authHeader = 'AWS' + ' ' + key + ':' + signed;
        
        req.setHeader('Authorization', authHeader);
        Http http = new Http();
        HTTPResponse resp;
         
        resp = http.send(req);
        
        return resp;
    }
}