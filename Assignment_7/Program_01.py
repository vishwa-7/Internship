# 1. Write a Python script to sort (ascending and descending) a dictionary by value.

import operator
d = { 1: 2,
      2: 4, 
      3: 3, 
      4: 1, 
      5: 7 }
print('Original dictionary : ',d)
sorted_d = sorted(d.items(), key=operator.itemgetter(1))
print('Dictionary in ascending order by value : ',sorted_d)
sorted_d = dict( sorted(d.items(), key=operator.itemgetter(1),reverse=True))
print('Dictionary in descending order by value : ',sorted_d)
