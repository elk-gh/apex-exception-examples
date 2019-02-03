trigger testValidationOnContact on Account (after insert) {

    try{
        Contact c = new Contact(lastname = 'Hola');
        insert c;
    }
    catch(Exception e){
        e.setMessage('Error:No Crear Contactos');
        trigger.new[0].addError(e.getMessage());
    }
}