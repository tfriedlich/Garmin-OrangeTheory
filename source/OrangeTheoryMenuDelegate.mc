using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class OrangeTheoryMenuDelegate extends Ui.MenuInputDelegate {

	var mController;
    function initialize() {
    	mController = Application.getApp().controller;
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :RunBlock) {
        	mController.setActiveBlock("Run");
        	//mController.currentBlock = "Run";        	
            Sys.println("Run Block");
        } else if (item == :RowBlock) {
        	//mController.currentBlock = "Row";
        	mController.setActiveBlock("Row");
            Sys.println("Row Block");
        } else if (item == :WeightBlock) {
        	//mController.currentBlock = "Weight";
        	mController.setActiveBlock("Weight");
            Sys.println("Weight Block");
        } else if (item == :EndWorkout) {        
        	mController.stopBlock();
        	mController.stopWorkout();        	                    
        }
        var view = new OrangeTheoryWorkoutView();
        Ui.switchToView( view, new OrangeTheoryWorkoutDelegate(view) , Ui.SLIDE_UP);
    }

}