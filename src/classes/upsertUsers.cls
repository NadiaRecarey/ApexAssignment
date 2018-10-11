global class upsertUsers implements Schedulable {
    
    global void execute(SchedulableContext ctx) {
        Integration integ = new Integration();
        String json = integ.getUsersFromS3();
        integ.upsertUsers(json);
    }

}