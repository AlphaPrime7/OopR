#OOP in R

#We know this works easily with generic R classes but how do I elevate past generic classes?

#Very easy example using the distance between 2 points
#The impetus of OOP is isolating a class for QC in order to ensure procedures are
#mostly or only performed on the special class

#EXAMPLE-make the vector here a special class
#' x is a vector
twin_indices = function(x){
  class(x) = c('twin_points')
  return(x)
}

#just for fun, i define a special procedure for this new class
x = c(3,10)
y = twin_indices(x)
twinpoint_distance <- function(x) {
  UseMethod("twinpoint_distance")
}

twinpoint_distance.twin_points = function(x){
  dist = (x[2] - x[1])^2
  return(dist)
}

twinpoint_distance.default = function(x){
  dist = (x[2] - x[1])^3
  return(dist)
}

twinpoint_distance.numeric = function(x){
  dist = (x[2] - x[1])^4
  return(dist)
}

twinpoint_distance.twin_points(y) #this works out and picks out the right method (49)
twinpoint_distance(y)
twinpoint_distance(x) #conversely, the default method yields 2401 (picks correct again)
twinpoint_distance.numeric(y)
#We dont run into issues here bc the - operator does not discrimate based on object class
#this is not the case if a data frame is stripped of its data frame class and more examples.


