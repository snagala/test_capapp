//Using the tables present in the datamodel in this service.

using { anubhav.db.master, anubhav.db.transaction } from '../db/datamodel';
//Definition for the service.
service CatalogService @(path: 'CatalogService', requires: 'authenticated-user'){
//If we want to maintain authorization like oly access to read this file then
@readonly

    entity EmployeeSet as projection on master.employees;
    entity BusinesspartnerSet as projection on master.businesspartner;
    @Capabilities: { Updatable,Deletable : false}
    entity ProductSet as projection on master.product;

    //Here we are telling that we are restricting the data based on the user login country.We are keeping this peace of code in Address specifically because country present in Address entity.
    entity AddressSet @(restrict: [ 
                        { grant: ['READ'], to: 'Viewer', where: 'COUNTRY = $user.myCountry' },
                        { grant: ['WRITE'], to: 'Admin' }
                        ]) as projection on master.address;
    entity POs @(
        odata.draft.enabled : true,
        Common.DefaultValuesFunction : 'getOrderDefaults'
        ) as projection on transaction.purchaseorder{
        *,
        case OVERALL_STATUS
        when 'P' then 'Paid'
        when 'N' then 'New'
        when 'A' then 'Approved'
        when 'X' then 'Rejected'
        end as OverallStatus : String(10),

         case OVERALL_STATUS
        when 'P' then 3
        when 'N' then 2
        when 'A' then 2
        when 'X' then 1
        end as Spiderman :Integer,

        Items
    }actions{
        @cds.odata.bindingparameter.name : '_anubhav'
        @common.SideEffects : {
            TargetProperties : ['_anubhav/GROSS_AMOUNT']

        }
        action boost();

    };
    function getOrderDefaults() returns POs;
    function largestOrder() returns POs;
   
    entity PurchaseorderItems as projection on transaction.poitems;

}

