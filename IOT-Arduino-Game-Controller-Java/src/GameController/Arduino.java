package GameController;

import java.awt.AWTException;

import org.sintef.jarduino.*;
import Mouse.Mouse;

public class Arduino extends JArduino {
	//Constructor taking a String describing the serial port where the Arduino Board is connected (eg, "COM7")
	public Arduino(String port) {
	   super(port);
	}

	private DigitalState buttonLeft;
	private DigitalState buttonUp;
	private DigitalState buttonDown;
	private DigitalState buttonRight;
	
	private DigitalState buttonMouseLeft;
	
	private DigitalState buttonExit;
	
	private Integer speed;
	
	private Mouse mouse = new Mouse();
	
	@Override
    protected void loop() {
        buttonLeft = digitalRead(DigitalPin.PIN_2);
        buttonDown = digitalRead(DigitalPin.PIN_4);
        buttonUp = digitalRead(DigitalPin.PIN_5); 
        buttonRight = digitalRead(DigitalPin.PIN_10);
        
        buttonMouseLeft = digitalRead(DigitalPin.PIN_6); 
        buttonExit = digitalRead(DigitalPin.PIN_7); 
        
        speed = (int) analogRead(AnalogPin.A_0) / 8;
        
        System.out.println(buttonLeft.toString() + buttonUp + buttonDown + buttonRight + " // MOUSE // " + buttonMouseLeft);
        
        if(buttonLeft.toString().equals("LOW") ){
        	try {
				mouse.moveLeft(speed);
			} catch (AWTException e) {
				e.printStackTrace();
			}
        }else if(buttonUp.toString().equals("LOW") ){
        	try {
				mouse.moveUp(speed);
			} catch (AWTException e) {
				e.printStackTrace();
			}
        }else if(buttonDown.toString().equals("LOW") ){
        	try {
				mouse.moveDown(speed);
			} catch (AWTException e) {
				e.printStackTrace();
			}
        }else if(buttonRight.toString().equals("LOW") ){
        	try {
				mouse.moveRight(speed);
			} catch (AWTException e) {
				e.printStackTrace();
			}
        }else if(buttonMouseLeft.toString().equals("LOW") ){
        	try {
				mouse.click();
			} catch (AWTException e) {
				e.printStackTrace();
			}
        }else if(buttonExit.toString().equals("LOW") ){
        	try {
        		System.out.println("EXIT PRESSED");
        		System.exit(0);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
        //delay(1000); // wait for a second
    }
	
	@Override
    protected void setup() {
        pinMode(DigitalPin.PIN_2, PinMode.INPUT);
        // PIN 3 was broken on this Arduino
        pinMode(DigitalPin.PIN_10, PinMode.INPUT);
        pinMode(DigitalPin.PIN_4, PinMode.INPUT);
        pinMode(DigitalPin.PIN_5, PinMode.INPUT);
        pinMode(DigitalPin.PIN_6, PinMode.INPUT);
        pinMode(DigitalPin.PIN_7, PinMode.INPUT);
    }
	
}
