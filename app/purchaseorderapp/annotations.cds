using CatalogService as service from '../../srv/CatalogService';


annotate service.POs with @(UI: {
    SelectionFields: [
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        GROSS_AMOUNT,
        OVERALL_STATUS,
    ],

    LineItem       : [
        {
            $Type: 'UI.DataField',
            Value: PO_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.COMPANY_NAME,
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },
        {
            $Type: 'UI.DataField',
            Value: GROSS_AMOUNT,
        },
        {
            $Type: 'UI.DataFieldForAction',
            Label: 'boost',
            Inline : true,
            Action : 'CatalogService.boost',

        },
        {
            $Type      : 'UI.DataField',
            Value      : OverallStatus,
            Criticality: Spiderman
        }

    ],

    HeaderInfo: {
        TypeName      : 'Purchase Order',
        TypeNamePlural: 'Purchase Orders',
        Title         : {
            Label: 'PO Id',
            Value: PO_ID
        },
        Description   : {
            Label: 'Company',
            Value: PARTNER_GUID.COMPANY_NAME
        }

    },
   Facets  : [
    {
        $Type : 'UI.CollectionFacet',
        Label : 'More details',
        Facets : [
            {
                 $Type : 'UI.ReferenceFacet',
                Label : 'More Info',
                Target : '@UI.Identification'
            },
            {
                 $Type : 'UI.ReferenceFacet',
                Label : 'Prices',
                Target : '@UI.FieldGroup#Spiderman'
            },
            {
                 $Type : 'UI.ReferenceFacet',
                Label : 'Status',
                Target : '@UI.FieldGroup#Superman'
            }

        ],
    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : 'PO Items',
        Target : 'Items/@UI.LineItem'

    }
       
   ],
   Identification  : [
    {
        $Type : 'UI.DataField',
        Value : PO_ID,
    },
     {
        $Type : 'UI.DataField',
        Value : PARTNER_GUID_NODE_KEY,
    },
       
   ],
   FieldGroup #Spiderman : {
    $Type : 'UI.FieldGroupType',
    Data :[
        {
             $Type : 'UI.DataField',
             Value : GROSS_AMOUNT
        },
          {
             $Type : 'UI.DataField',
             Value : NET_AMOUNT
        },
          {
             $Type : 'UI.DataField',
             Value : TAX_AMOUNT
        }

    ],

   },
    FieldGroup #Superman : {
    $Type : 'UI.FieldGroupType',
     Data :[
        {
             $Type : 'UI.DataField',
             Value : OVERALL_STATUS
        },
          {
             $Type : 'UI.DataField',
             Value : CURRENCY_code
        }
         

    ],

   }


}
);

//Code for value help.

annotate CatalogService.POs with {
    PARTNER_GUID@(
        Common : { 
            Text : PARTNER_GUID.COMPANY_NAME,
         },
         ValueList.entity: CatalogService.BusinesspartnerSet
    )
};

annotate CatalogService.PurchaseorderItems with {
    PRODUCT_GUID@(
        Common : { 
            Text : PRODUCT_GUID.DESCRIPTION,
         },
         ValueList.entity: CatalogService.ProductSet
    )
};

@cds.odata.valuelist
annotate CatalogService.BusinesspartnerSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : COMPANY_NAME,
    }]
);

@cds.odata.valuelist
annotate CatalogService.ProductSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : DESCRIPTION,
    }]
);
annotate service.PurchaseorderItems with @(
    UI:{
        LineItem  : [
            {
            $Type: 'UI.DataField',
            Value: PO_ITEM_POS,
        },
        {
            $Type: 'UI.DataField',
            Value: PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type: 'UI.DataField',
            Value: GROSS_AMOUNT,
        },
        {
            $Type: 'UI.DataField',
            Value: NET_AMOUNT,
        },
        {
            $Type      : 'UI.DataField',
            Value      : TAX_AMOUNT,
           
        },
         {
            $Type      : 'UI.DataField',
            Value      : CURRENCY_code,
           
        }
        ],
        HeaderInfo  : {
            TypeName : 'Item',
            TypeNamePlural : 'Items',
            Title : { Value : PO_ITEM_POS},
            Description : {Value : PRODUCT_GUID.DESCRIPTION }
        },
         Facets : [
            {
                 $Type : 'UI.ReferenceFacet',
                Label : 'Item Info',
                Target : '@UI.Identification'
            },
         ],

        Identification  : [
    {
            $Type: 'UI.DataField',
            Value: PO_ITEM_POS,
        },
        {   
            $Type: 'UI.DataField',
            Value: PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type: 'UI.DataField',
            Value: GROSS_AMOUNT,
        },
        {
            $Type: 'UI.DataField',
            Value: NET_AMOUNT,
        },
        {
            $Type      : 'UI.DataField',
            Value      : TAX_AMOUNT,
           
        },
         {
            $Type      : 'UI.DataField',
            Value      : CURRENCY_code,
           
        }
       
   ],
    }

);

