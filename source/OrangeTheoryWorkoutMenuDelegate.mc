using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class OrangeTheoryWorkoutMenuDelegate extends Ui.MenuInputDelegate {

	var mController;
    function initialize() {
    	mController = Application.getApp().controller;
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :StartBlock) {
        	mController.startBlock();
            Sys.println("Start Block");
            var view = new OrangeTheoryWorkoutView();
        	Ui.switchToView( view, new OrangeTheoryWorkoutDelegate(view) , Ui.SLIDE_UP);
        } else if (item == :EndWorkout) {
        	Sys.println("Stop Workout");
        	mController.stopBlock();
        	mController.stopWorkout();        	        
            Sys.println("End Workout");
        } else if (item == :RestartWorkout) {
        	mController.restartWorkout();
            Sys.println("Restart Workout");
        } else if(item == :PauseBlock){
        	Sys.println("Paused");
        } else if(item == :EndBlock){
        	mController.stopBlock();
        	
        }        
    }

}