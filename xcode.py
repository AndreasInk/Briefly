from interpreter import interpreter
from dotenv import load_dotenv
import time
load_dotenv()

interpreter.os = True
interpreter.llm.supports_vision = True
interpreter.llm.model = "gpt-4o"

def build_prj():
    interpreter.computer.keyboard.hotkey("command", " ")

    interpreter.computer.keyboard.write("Briefly.xcodeproj")
    interpreter.computer.keyboard.write("\n")

    interpreter.computer.keyboard.hotkey("command", "r")
