namespace com.ey.school; //nmae space is used for identification purpose
using{ com.ey.reuse as reuse} from './reuse';
using{ cuid,temporal,managed } from '@sap/cds/common'; // These are the standard Aspects

context master {
    //If we want to make changes for any of the datatype size in more then one table then we can use this Guid then use that where ever we want.
 
    //Incase if you need to add changes to more than one field then we will use aspects.
   
    //Creating our first database table
    entity student :reuse.Address{
        key id : reuse.Guid;
        name : String(80);

//example for foregin key relationship
        class : Association to one class;
        age : Int16;

    }

    entity class : reuse.Address{
        key id : reuse.Guid;
        clasName :String(80);
        teacher : String(80);
        semesters: Int16;
    }
    //Localized is used to convert this particular text in different language.
    entity book: cuid {
        name : localized String(32);
        author : String(80);

    }

}

    //cuid is for creating the default foregin keys.
    //Temporal valid to valid from
    //managed is for created by changed by
    context Transaction {
        entity subs : cuid,temporal,managed{
            student : Association to one master.student;
            book : Association to one master.book;
            
        }
    }


