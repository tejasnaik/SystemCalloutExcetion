public class DmlCalloutController {
    public string leadid{get;set;}
    
    public DmlCalloutController (){
        this.leadid = 'constructor';
    }
    public void save(){
        System.debug('Perform dml');
        Lead l = new Lead();
        l.lastname = 'testcallout';
        l.company = 'testcompany';
        insert l;
        this.leadid = l.id;
        
    }
    
    @RemoteAction
    public static List<string> makeCallout(String leadid){
        List<String> anilmallst = new List<String>();
        System.debug('Lead id @@@' + leadid);
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for (Object animal: animals) {
                System.debug(animal);
                anilmallst.add((String)animal);
            }
            return anilmallst;
        }
        return null;
    }
}