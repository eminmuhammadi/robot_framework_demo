from robot.api.deco import library, keyword
from robot.api import logger

@library
class Calculator:
    @keyword("Add")
    def add(self, a, b):
        return float(a) + float(b)

    @keyword("Subtract")
    def substract(self, a, b):
        return float(a) - float(b)

    @keyword("Multiply")
    def multiply(self, a, b):
        return float(a) * float(b)

    @keyword("Divide")
    def divide(self, a, b):
        if float(b) == 0:
            logger.error("Attempted to divide by zero.")
            raise ValueError("Division by zero is not allowed.")
        return float(a) / float(b)