ROUND I PYTHON QUESTIONS

# QUESTION 1 - DATES

import datetime
def is_date_format_correct(date:str)->bool:
"""
# This function takes in a date in string format and returns true if the date matches the format YYYY-MM-DD and false if it doesn't
"""
	date_str = '1999-01-01'
	format = '%Y-%m-%d'
	date = True
	try: 
		date = bool(datetime.strptime(date_str, format))
		print(date)
	except ValueError:
		date = False

# QUESTION 2 - CODE FLOW

for i in range(1, 11):
	if i==6:
		print(i)
	else:
		print(i, end=',')
        
# QUESTION 3 - LIST COMPREHENSIONS

def compute_prev_date(dates_list:list):
"""
"""
return [ ]

# QUESTION 4 - BASIC eXCEPTION HANDLING

def main():
    qty = None
    cost = None
    
    def fetch_quantity():
        """
        Returns a number, any number
        """
        ...
        return ...
        
    def fetch_cost():
        """
        Returns a number, any number
        """
        ...
        return ...
        
    def compute_cost_per_quantity():
        qty = fetch_quantity()
        cost = fetch_cost()
        cost_per_quantity = cost/qty
        
        return cost_per_quantity
        
    cost_per_quantity = compute_cost_per_quantity()
    a = 1 + 2 + cost_per_quantity
    b = 4 + 5
    print(a+b)
    
# QUESTION 5 DJANGO REST FRAMEWORK

from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view

@api_view(['GET'])
def get_params():
    """
    """
    
    content = {}
    return Response(content, status=status.HTTP_200_OK)
    
# QUESTION 6 - OOP

class TestMath:
    def test_add(x,y):
        x=10
        y=10
        return x + y
        
    def test_subtract(x,y):
        x=10
        y=10
        return x - y

    def test_milutiply(x,y):
        x=10
        y=10
        return x * y
        
Answers:
class TestMath
{
    x = 10
    y = 10
    
    public function test_add()
    {
        return x + y
    }
    
    public function test_subtract()
    {
        return x - y
    }
    
    public function test_milutiply()
    {
        return x * y
    }
}