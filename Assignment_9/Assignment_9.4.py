# This is problem to convert all the negative coordinates to a positive coordinates;
# The agenda is to get all the coordinates in 0 or positive values keeping the relative distance same;
# We can add or delete any number from the coordinates ; however graph should not be changed;

# Input: [(1,-2), (-2, 4), (-1,-1),(-8, -3), (0, 4), (10,-3)]
# Output : [(9,6), (6, 12), (7,7),(0, 5), (8, 12), (18,5)]


coordinates = [(1,-2), (-2, 4), (-1,-1),(-8, -3), (0, 4), (10,-3)]

min_x = 0
min_y = 0 
for x,y in coordinates:
    if(x<min_x):
        min_x = x
    if(y<min_y):
        min_y = y

positive_coordinates = [(c[0]-min_x,c[1]-min_y) for c in coordinates]
print(positive_coordinates)