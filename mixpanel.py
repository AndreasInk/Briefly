from interpreter import interpreter
import time

def get_trend(url: str, image_name: str):
    interpreter.computer.keyboard.hotkey("command", "t")
    interpreter.computer.keyboard.write(url)
    interpreter.computer.keyboard.write("\n")
    time.sleep(4)
    image = interpreter.computer.display.screenshot()
    image.save(f"./{image_name}.png")

def check_trends():
    interpreter.computer.keyboard.hotkey("command", " ")
    interpreter.computer.keyboard.write("Arc")
    interpreter.computer.keyboard.write("\n")

    get_trend("https://mixpanel.com/project/2933233/view/3458169/app/insights#2MT27ZgWJGgu", "app_sessions")
    
check_trends()