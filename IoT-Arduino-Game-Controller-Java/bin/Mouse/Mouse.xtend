package Mouse

import java.awt.AWTException
import java.awt.GraphicsDevice
import java.awt.GraphicsEnvironment
import java.awt.MouseInfo
import java.awt.Robot
import java.util.Random

class Mouse {
	public static final int FIVE_SECONDS = 5000
	static package GraphicsDevice gd = GraphicsEnvironment::getLocalGraphicsEnvironment().getDefaultScreenDevice()
	// Get Screen Height & Width
	public static final int MAX_Y = gd.getDisplayMode().getHeight()
	public static final int MAX_X = gd.getDisplayMode().getWidth()
	static package int mouseX = MouseInfo::getPointerInfo().getLocation().x
	static package int mouseY = MouseInfo::getPointerInfo().getLocation().y
	static package Random random = new Random()

	def private static void refreshMouseInfo() {
		mouseX = MouseInfo::getPointerInfo().getLocation().x
		mouseY = MouseInfo::getPointerInfo().getLocation().y
	}

	def private static void Move(int x, int y) throws AWTException {
		refreshMouseInfo()
		var Robot robot = new Robot()
		robot.mouseMove(x, y)
	}

	def private static void animateMove(int x, int y) throws AWTException, InterruptedException {
		refreshMouseInfo()
		var Robot robot = new Robot()
		while (x !== mouseX && x !== mouseY) {
			Thread::sleep(5)
			refreshMouseInfo()
			if (mouseX > x) {
				robot.mouseMove(mouseX - 1, y)
			} else if (mouseX < x) {
				robot.mouseMove(mouseX + 1, y)
			} else if (mouseY > y) {
				robot.mouseMove(x, mouseY - 1)
			} else if (mouseY < y) {
				robot.mouseMove(x, mouseY + 1)
			}

		}

	}

	def static void main(String[] args) throws AWTException, InterruptedException {
		animateMove(5000, 600)
	}

}
