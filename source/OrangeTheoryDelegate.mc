using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
class OrangeTheoryDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(), new OrangeTheoryMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }
    
    function onSelect() {
 		//Running Button       
        Ui.pushView(new Rez.Menus.MainMenu(), new OrangeTheoryMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }
    
    function onNextPage(){
    //Up Button
       Sys.println("NextPage");
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