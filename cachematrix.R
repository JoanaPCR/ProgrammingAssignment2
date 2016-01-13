## First function delivers a list of functions for a given matrix.
## Second function returns the inverse of a given matrix, by getting the matrix by using the functions from the list of the previous function.

## This function stores a given matrix by setting a list of funtions to be used further down.

makeCacheMatrix <- function(x = matrix()) {
  
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) i <<- solve
  getsolve <- function() i
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)

}


## This function gets the matrix from the list created in the first function and then returns its inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getsolve()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setsolve(i)
  i
}
