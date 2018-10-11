public class AWSUtility {

	public static HTTPResponse getS3file (String bucketName, String fileName) {
         
        String formattedDateString = DateTime.now().formatGMT('EEE, dd MMM yyyy HH:mm:ss z');
        String host = 's3.amazonaws.com';
         
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://' + bucketName + '.' + host + '/' + fileName);
        req.setHeader('Host', bucketName + '.' + host);
        req.setHeader('Connection', 'keep-alive');
        req.setHeader('Date', formattedDateString);
        req.setHeader('ACL', 'public-read-write');          
        
        //GET KEY & SECRET FROM CUSTOM SETTINGS
        S3_Bucket__c bucket = S3_Bucket__c.getValues('training');
        String key = bucket.Key__c;
        String secret = bucket.Secret__c;

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