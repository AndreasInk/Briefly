from xcode import build_prj
import interpreter
from dotenv import load_dotenv
load_dotenv()

interpreter.max_budget = 5
interpreter.os = True
interpreter.llm.supports_vision = True
interpreter.llm.model = "gpt-4o"

python_script = interpreter.computer.ai.chat("Write a single python script (one code block) to analyze my mixpanel data")

print(python_script)