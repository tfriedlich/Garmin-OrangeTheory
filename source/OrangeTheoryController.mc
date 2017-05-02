using Toybox.Timer;
using Toybox.Application;
using Toybox.WatchUi;
using Toybox.Time;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.ActivityRecording as Record;



class OrangeTheoryController{

	var mModel;    
	var isActiveWorkout = false;
	var isActiveBlock = false;
	var workoutStartTime;
	var blockStartTime;
	var workoutDuration;
	var blockDuration = 0;
	var currentBlock = "";
	var session;
	var timer;
	var rowCount = 0;
	var runCount = 0;
	var weightCount = 0;
	var curBlockCount = 0;
	var curSport;
	var curSubSport;
	function initialize() {    
        // Get the model from the application
        mModel = Application.getApp().model; 
        timer = new Timer.Timer();
        timer.start(method(:onTimer), 1000, true);                                            
    }

	
	function getBlockDuration(){
		var duration;
		if(isActiveBlock){
			blockDuration =Time.now().compare(blockStartTime);			
		}		
		return blockDuration;
	}
	
	
	function getWorkoutDuration(){
		var duration;
		if(isActiveWorkout){
			duration =Time.now().compare(workoutStartTime);
		} else {
			duration = 0;
		}		 	
		return duration;
	}
	
	
	function startWorkout(){
    	isActiveWorkout = true;
    	
    	workoutStartTime = Time.now();
    	Sys.println("Start Workout" + workoutStartTime);
    }
    
    function stopWorkout(){
    	isActiveWorkout = false;
    	timer.stop();    	    	    
    }
    
    function setActiveBlock(blockType){
    	currentBlock = blockType;    	  	
    	if(blockType.equals("Run")){    	
    		curSport = Record.SPORT_RUNNING;    		
    		curSubSport = Record.SUB_SPORT_TREADMILL;
    		runCount++;
    		curBlockCount = runCount;
    	} else if(blockType.equals("Row")){
    		curSport = Record.SPORT_ROWING;    		
    		curSubSport = Record.SUB_SPORT_INDOOR_ROWING;
    		rowCount++;
    		curBlockCount = rowCount;
    	} else if(blockType.equals("Weight")){
    		curSport = Record.SPORT_TRAINING;    		
    		curSubSport = Record.SUB_SPORT_STRENGTH_TRAINING;
    		weightCount++;
    		curBlockCount = weightCount;
    	}
    }
    
    function startBlock(){
    	isActiveBlock = true; 
    	blockStartTime = Time.now();    	    	
    	var activityName = Lang.format("$1$ Block $2$", [currentBlock, curBlockCount]);
    	session = Record.createSession({:name=>activityName, :sport=>curSport, :subSport=>curSubSport});
		session.start();	
    }
    
    function stopBlock(){
    	if(isActiveBlock){
    		isActiveBlock = false;
    		currentBlock = "*";
    		curSport = null;
    		curSubSport = null;
    		blockDuration = 0;
    		session.stop();
    		session.save();
    	}
    	
    }
	 
    function onTimer() {
        //Kick the display update
        Ui.requestUpdate();
    }
    
    // Handle timing out after exit
    function onExit() {
    	stopBlock();
    	stopWorkout();
        System.exit();        
    }

	
    
}