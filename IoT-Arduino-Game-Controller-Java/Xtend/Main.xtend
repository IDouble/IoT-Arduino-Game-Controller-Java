package GameController

import org.sintef.jarduino.JArduino

class Main {
	def static void main(String[] args) {
		var JArduino arduino = new Arduino("COM4")
		arduino.runArduinoProcess()
	}

}
