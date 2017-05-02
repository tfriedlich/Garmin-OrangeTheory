using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class OrangeTheoryApp extends App.AppBase {

	var model;
    var controller;
    
    function initialize() {
        AppBase.initialize();
        model = new $.OrangeTheoryModel();
        controller = new $.OrangeTheoryController();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {    
        return [ new OrangeTheoryView(), new OrangeTheoryDelegate() ];
    }
    

}
