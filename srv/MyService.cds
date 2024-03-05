using { anubhav.db.master } from '../db/datamodel';

//Here we will write the definition of the service
//In js file we will write the implementation part of the service.
//Now we are developing the simple service with hello function.
service MyService @(path: 'MyService') {
    function hello(name: String) returns String;

    @readonly
    entity ReadEmployeeSrv as projection on master.employees;



}