package GameController

import java.awt.AWTException
import org.sintef.jarduino.*
import Mouse.Mouse

class Arduino extends JArduino {
	// Constructor taking a String describing the serial port where the Arduino Board is connected (eg, "COM7")
	new(String port) {
		super(port)
	}

	DigitalState buttonLeft
	DigitalState buttonUp
	DigitalState buttonDown
	DigitalState buttonRight
	DigitalState buttonMouseLeft
	DigitalState buttonExit
	Integer speed
	Mouse mouse = new Mouse()

	override protected void loop() {
		buttonLeft = digitalRead(DigitalPin::PIN_2)
		buttonDown = digitalRead(DigitalPin::PIN_4)
		buttonUp = digitalRead(DigitalPin::PIN_5)
		buttonRight = digitalRead(DigitalPin::PIN_10)
		buttonMouseLeft = digitalRead(DigitalPin::PIN_6)
		buttonExit = digitalRead(DigitalPin::PIN_7)
		speed = analogRead(AnalogPin::A_0) as int / 8
		System::out.println(
			'''«buttonLeft.toString()»«buttonUp»«buttonDown»«buttonRight» // MOUSE // «buttonMouseLeft»'''.toString)
		if (buttonLeft.toString().equals("LOW")) {
			try {
				mouse::moveLeft(speed)
			} catch (AWTException e) {
				e.printStackTrace()
			}

		} else if (buttonUp.toString().equals("LOW")) {
			try {
				mouse::moveUp(speed)
			} catch (AWTException e) {
				e.printStackTrace()
			}

		} else if (buttonDown.toString().equals("LOW")) {
			try {
				mouse::moveDown(speed)
			} catch (AWTException e) {
				e.printStackTrace()
			}

		} else if (buttonRight.toString().equals("LOW")) {
			try {
				mouse::moveRight(speed)
			} catch (AWTException e) {
				e.printStackTrace()
			}

		} else if (buttonMouseLeft.toString().equals("LOW")) {
			try {
				mouse::click()
			} catch (AWTException e) {
				e.printStackTrace()
			}

		} else if (buttonExit.toString().equals("LOW")) {
			try {
				System::out.println("EXIT PRESSED")
				System::exit(0)
			} catch (Exception e) {
				e.printStackTrace()
			}

		}
	// delay(1000); // wait for a second
	}

	override protected void setup() {
		pinMode(DigitalPin::PIN_2, PinMode::INPUT) // PIN 3 was broken on this Arduino
		pinMode(DigitalPin::PIN_10, PinMode::INPUT)
		pinMode(DigitalPin::PIN_4, PinMode::INPUT)
		pinMode(DigitalPin::PIN_5, PinMode::INPUT)
		pinMode(DigitalPin::PIN_6, PinMode::INPUT)
		pinMode(DigitalPin::PIN_7, PinMode::INPUT)
	}

}
