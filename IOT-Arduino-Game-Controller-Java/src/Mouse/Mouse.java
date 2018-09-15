package Mouse;

/**
 * A simple Mouse Library for controlling the Mouse with Java.
 *
 * @author Alpay Yildirim
 * @version 1.0
 */

import java.awt.AWTException;
import java.awt.GraphicsDevice;
import java.awt.GraphicsEnvironment;
import java.awt.MouseInfo;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.util.Random;

public class Mouse {
	
	static GraphicsDevice gd = GraphicsEnvironment.getLocalGraphicsEnvironment().getDefaultScreenDevice(); // Get Screen Height & Width
    public static final int MAX_Y = gd.getDisplayMode().getHeight(); // Gets the Monitor Height & Width (Works with multiple Monitors)
    public static final int MAX_X = gd.getDisplayMode().getWidth();
    static int mouseX = MouseInfo.getPointerInfo().getLocation().x;
    static int mouseY = MouseInfo.getPointerInfo().getLocation().y;
    static Random random = new Random();
    
    
    public static void refreshMouseInfo(){ //updates the Actual Position of the Mouse
    	mouseX = MouseInfo.getPointerInfo().getLocation().x;
        mouseY = MouseInfo.getPointerInfo().getLocation().y;
    }
    
    public static void move(int x,int y) throws AWTException{ //Moves the Mouse to the position
    	refreshMouseInfo();
    	Robot robot = new Robot(); 
    	robot.mouseMove(x,y);
    }
    
    //Moving Mouse in Directions
    
    public static void moveUp() throws AWTException{ //Moves the Mouse to the position
    	refreshMouseInfo();
    	Robot robot = new Robot();
    	robot.mouseMove(mouseX,--mouseY );
    }
    
    public static void moveDown() throws AWTException{ //Moves the Mouse to the position
    	refreshMouseInfo();
    	Robot robot = new Robot();
    	robot.mouseMove(mouseX,++mouseY );
    }
    
    public static void moveLeft() throws AWTException{ //Moves the Mouse to the position
    	refreshMouseInfo();
    	Robot robot = new Robot();
    	robot.mouseMove(--mouseX,mouseY );
    }
    
    public static void moveRight() throws AWTException{ //Moves the Mouse to the position
    	refreshMouseInfo();
    	Robot robot = new Robot();
    	robot.mouseMove(++mouseX,mouseY );
    }
    
    //Moving Mouse in Directions with adjustable Mouse Speed
    
    public static void moveUp(Integer speed) throws AWTException{ //Moves the Mouse to the position
    	refreshMouseInfo();
    	Robot robot = new Robot();
    	robot.mouseMove(mouseX,mouseY -= speed );
    }
    
    public static void moveDown(Integer speed) throws AWTException{ //Moves the Mouse to the position
    	refreshMouseInfo();
    	Robot robot = new Robot();
    	robot.mouseMove(mouseX,mouseY += speed );
    }
    
    public static void moveLeft(Integer speed) throws AWTException{ //Moves the Mouse to the position
    	refreshMouseInfo();
    	Robot robot = new Robot();
    	robot.mouseMove(mouseX -= speed,mouseY );
    }
    
    public static void moveRight(Integer speed) throws AWTException{ //Moves the Mouse to the position
    	refreshMouseInfo();
    	Robot robot = new Robot();
    	robot.mouseMove(mouseX += speed,mouseY );
    }
    
    //Mouse Click
    
    public static void click() throws AWTException{
        Robot robot = new Robot();    
        robot.mousePress(InputEvent.BUTTON1_MASK);
        robot.mouseRelease(InputEvent.BUTTON1_MASK);
    }
    
    
    public static void animateMove(int x,int y,int speed) throws AWTException, InterruptedException{ //Makes a Mouse animation to the Point
    	refreshMouseInfo();
    	Robot robot = new Robot();
    	
    	while(x != mouseX || y != mouseY){
    		Thread.sleep(speed);
    		refreshMouseInfo();
    		if(mouseX > x){
    			robot.mouseMove(mouseX - 1,mouseY);
    		}else if(mouseX < x){
    			robot.mouseMove(mouseX + 1,mouseY);
    		}else if(mouseY < y){
    			robot.mouseMove(mouseX,mouseY + 1);
    		}else if(mouseY > y){
    			robot.mouseMove(mouseX,mouseY - 1);
    		}
    	}
    }
}