using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.Lang as Lang;

class OrangeTheoryWorkoutDelegate extends Ui.BehaviorDelegate {


    //function initialize() {
    //    BehaviorDelegate.initialize();       
    //}

    var parentView;
	var mController;
	
	
	
    function initialize(view) {
        parentView = view;
        mController = Application.getApp().controller;        
        if(!mController.isActiveWorkout){
        	mController.startWorkout();
        }
        
        BehaviorDelegate.initialize();
    }



    function onMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(), new OrangeTheoryMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }
    
    function onSelect() {
 		//Running Button       
        if(mController.isActiveWorkout == false){
        	//No Workout Running, start workout and block
        	//timer.start(method(:onTimer), 1000, true);
        	mController.startWorkout();        	        	
        } else if(mController.isActiveBlock == false){
        	//Current Workout, no block. Start block
        	if(mController.curSport == null){        		
        		Ui.pushView(new Rez.Menus.MainMenu(), new OrangeTheoryMenuDelegate(), Ui.SLIDE_UP);
        	} else {        		
        		Ui.pushView(new Rez.Menus.workoutMenuInactive(), new OrangeTheoryWorkoutMenuDelegate(), Ui.SLIDE_UP);
        	}
        	        	
        } else {
        	Sys.println("Other");
        	Ui.pushView(new Rez.Menus.workoutMenuActive(), new OrangeTheoryWorkoutMenuDelegate(), Ui.SLIDE_UP);
        	//Current workout, started block. Stop block
        		
        }
        return true;
    }
    
    function onNextPage(){
    //Up Button
       Sys.println("NextPage");
       Ui.requestUpdate();
        return true;
    }
    
    function onPreviousPage(){
       Sys.println("PrevPage");
        return true;
    }
    
    function onBack(){
       Sys.println("Back");
        return true;
    }
    
    function onNextMode(){
       Sys.println("NextMode");
        return true;
    }
    
    function onPreviousMode(){
       Sys.println("PrevMode");
        return true;
    }
    

}