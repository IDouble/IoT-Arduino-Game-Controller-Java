package Mouse
import java.awt.AWTException
import java.awt.GraphicsDevice
import java.awt.GraphicsEnvironment
import java.awt.MouseInfo
import java.awt.Robot
import java.awt.event.InputEvent
import java.util.Random
class Mouse {
	static package GraphicsDevice gd=GraphicsEnvironment::getLocalGraphicsEnvironment().getDefaultScreenDevice()
	// Get Screen Height & Width
	public static final int MAX_Y=gd.getDisplayMode().getHeight()
	// Gets the Monitor Height & Width (Works with multiple Monitors)
	public static final int MAX_X=gd.getDisplayMode().getWidth()
	static package int mouseX=MouseInfo::getPointerInfo().getLocation().x
	static package int mouseY=MouseInfo::getPointerInfo().getLocation().y
	static package Random random=new Random()
	def static void refreshMouseInfo() {
		//updates the Actual Position of the Mouse
		mouseX=MouseInfo::getPointerInfo().getLocation().x mouseY=MouseInfo::getPointerInfo().getLocation().y 
	}
	def static void move(int x, int y) throws AWTException {
		//Moves the Mouse to the position
		refreshMouseInfo() var Robot robot=new Robot() 
		robot.mouseMove(x, y) 
	}
	//Moving Mouse in Directions
	def static void moveUp() throws AWTException {
		//Moves the Mouse to the position
		refreshMouseInfo() var Robot robot=new Robot() 
		robot.mouseMove(mouseX, (mouseY=mouseY - 1)) 
	}
	def static void moveDown() throws AWTException {
		//Moves the Mouse to the position
		refreshMouseInfo() var Robot robot=new Robot() 
		robot.mouseMove(mouseX, (mouseY=mouseY + 1)) 
	}
	def static void moveLeft() throws AWTException {
		//Moves the Mouse to the position
		refreshMouseInfo() var Robot robot=new Robot() 
		robot.mouseMove((mouseX=mouseX - 1), mouseY) 
	}
	def static void moveRight() throws AWTException {
		//Moves the Mouse to the position
		refreshMouseInfo() var Robot robot=new Robot() 
		robot.mouseMove((mouseX=mouseX + 1), mouseY) 
	}
	//Moving Mouse in Directions with adjustable Mouse Speed
	def static void moveUp(Integer speed) throws AWTException {
		//Moves the Mouse to the position
		refreshMouseInfo() var Robot robot=new Robot() 
		robot.mouseMove(mouseX, mouseY-=speed) 
	}
	def static void moveDown(Integer speed) throws AWTException {
		//Moves the Mouse to the position
		refreshMouseInfo() var Robot robot=new Robot() 
		robot.mouseMove(mouseX, mouseY+=speed) 
	}
	def static void moveLeft(Integer speed) throws AWTException {
		//Moves the Mouse to the position
		refreshMouseInfo() var Robot robot=new Robot() 
		robot.mouseMove(mouseX-=speed, mouseY) 
	}
	def static void moveRight(Integer speed) throws AWTException {
		//Moves the Mouse to the position
		refreshMouseInfo() var Robot robot=new Robot() 
		robot.mouseMove(mouseX+=speed, mouseY) 
	}
	//Mouse Click
	def static void click() throws AWTException {
		var Robot robot=new Robot() 
		robot.mousePress(InputEvent::BUTTON1_MASK) robot.mouseRelease(InputEvent::BUTTON1_MASK) 
	}
	def static void animateMove(int x, int y, int speed) throws AWTException, InterruptedException {
		//Makes a Mouse animation to the Point
		refreshMouseInfo() var Robot robot=new Robot() 
		while (x !== mouseX || y !== mouseY) {
			Thread::sleep(speed) refreshMouseInfo() if (mouseX > x) {
				robot.mouseMove(mouseX - 1, mouseY) 
			} else if (mouseX < x) {
				robot.mouseMove(mouseX + 1, mouseY) 
			} else if (mouseY < y) {
				robot.mouseMove(mouseX, mouseY + 1) 
			} else if (mouseY > y) {
				robot.mouseMove(mouseX, mouseY - 1) 
			}
			
		}
		
	}
	
}