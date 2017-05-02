using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;

class OrangeTheoryWorkoutView extends Ui.View {

	var timerGO;
	var timerCOUNT;	
	var workoutCounter = "00:00:00";
	var mController;
	
    function initialize() {
    	mController = Application.getApp().controller;
        View.initialize();
        
    }
    
 
   function onUpdate(dc){
   		var workoutDuration = mController.getWorkoutDuration();
   		var blockDuration = mController.getBlockDuration();
   		var blockMins = blockDuration / 60;
   		var blockSeconds = blockDuration % 60;
   		var mins = workoutDuration / 60;
   		var seconds = workoutDuration % 60;
   		View.findDrawableById("workoutLabel").setText(mController.currentBlock);
        View.findDrawableById("workoutCounter").setText(Lang.format("00:$1$:$2$", [mins.format("%0.2d"),seconds.format("%0.2d")]));
        View.findDrawableById("blockCounter").setText(Lang.format("00:$1$:$2$", [blockMins.format("%0.2d"),blockSeconds.format("%0.2d")]));
        View.onUpdate(dc);
   }
 
 
    
    function onLayout(dc) {
   		setLayout(Rez.Layouts.WorkoutLayout(dc)); 
    }

    
    
    
    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

 

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    
}