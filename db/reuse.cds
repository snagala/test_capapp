namespace com.ey.reuse;

  //If we want to make changes for any of the datatype size in more then one table then we can use this Guid then use that where ever we want.
    type Guid : String(32);
    //Incase if you need to add changes to more than one field then we will use aspects.
    aspect Address{
        street : String(32);
        landmark : String(48);
        city : String(32);
        Country : String(2)
    }