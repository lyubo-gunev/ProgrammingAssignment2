# Functions to compute the inverse of a matrix or retrieving it from cache if
# it was already calculated.


# This first function is a list of functions which read in the matrix
# and serve as placeholder.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}


# Calculates the inverse of matrix or retrieves
# a inverse from cache if the inverse was already calculated for this specific matrix.
# Otherwise the new inverse is calculated and stored as "inv"

cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinv(inv)
  inv
}



