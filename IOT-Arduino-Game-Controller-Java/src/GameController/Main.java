package GameController;

import org.sintef.jarduino.JArduino;

public class Main {

	public static void main(String[] args) {
		JArduino arduino = new Arduino("COM4");
        arduino.runArduinoProcess();
	}

}
