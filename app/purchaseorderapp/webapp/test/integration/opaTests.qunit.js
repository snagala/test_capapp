sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'app/com/purchaseorderapp/test/integration/FirstJourney',
		'app/com/purchaseorderapp/test/integration/pages/POsList',
		'app/com/purchaseorderapp/test/integration/pages/POsObjectPage',
		'app/com/purchaseorderapp/test/integration/pages/PurchaseorderItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, PurchaseorderItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('app/com/purchaseorderapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePurchaseorderItemsObjectPage: PurchaseorderItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);