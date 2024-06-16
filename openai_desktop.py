from interpreter import interpreter
from dotenv import load_dotenv
import time
load_dotenv()

interpreter.os = True
interpreter.llm.supports_vision = True
interpreter.llm.model = "gpt-4o"

def chat_with_gpt(request: str, estimatedLength: int = 10):
    interpreter.computer.keyboard.hotkey("option", " ")

    interpreter.computer.keyboard.write(request)
    interpreter.computer.keyboard.write("\n")
    time.sleep(estimatedLength)
    return interpreter.computer.mouse.click("Copy")

