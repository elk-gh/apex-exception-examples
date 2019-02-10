trigger testValidationOnContact on Account (after insert) {   
    
    try{
        //System.AssertException is not catchable
        //if you want to have assertion methods, create your own and throw your own custom exception
        //https://salesforce.stackexchange.com/questions/78658/will-system-assert-have-any-impact-on-an-apex-class-or-a-test-class
        System.assertEquals(1,0,'Error');
        Contact c = new Contact(lastname = 'Hola');
        insert c;
    }
    catch(Exception e){
        e.setMessage('Error:No Crear Contactos');
        trigger.new[0].addError(e.getMessage());
    }
}
