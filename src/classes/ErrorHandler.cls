public class ErrorHandler {

	public static void handleError(Integer line, String msg, String type){
        sendMail(msg);
        logError(line, msg, type);
    }

    public static void sendMail(String msg){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        User sysAdmin = [SELECT Id,Email FROM User WHERE Profile.Name = 'System Administrator'];
        String[] toAddresses = new String[] { sysAdmin.Email }; 
        mail.setToAddresses(toAddresses);
        mail.setSubject('Error while updating users');
        mail.setPlainTextBody('The following exception has occurred: ' + msg);
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }

    public static void logError(Integer line, String msg, String type){
        Log__c l = new Log__c(Error_Line__c = line,
                                Error_Message__c = msg,
                                Error_Type__c = type
                        );
        insert l;
    }
}