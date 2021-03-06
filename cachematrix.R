## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


##	The makeCacheMatrix creates a special "matrix", 
##	which is really a list containing a function to
##
##	1.  set the value of the matrix
##	2.  get the value of the matrix
##	3.  calculate the inverse of the matrix
##	4.  get the value of the inverse of the matrix 

makeCacheMatrix <- function(x = matrix()) {

        # At the beginning the cache is NULL
        cache <- NULL
        
        # set the value of the matrix
        setMatrix <- function(newValue) {
                x <<- newValue
                # erase the cache as it is a new matrix
                cache <<- NULL
        }
        # get the value of the matrix
        getMatrix <- function() {
                x
        }
        # calculate the inverse of the matrix
        cacheInverse <- function(solve) {
                cache <<- solve
        }
        # get the value of the inverse of the matrix
        getInverse <- function() {
                cache
        }
        # return the list
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        # read the cache
        inverse <- x$getInverse()
        # return the cache if not NULL
        if(!is.null(inverse)) {
                return(inverse)
        }
        # if not, do the inverse of the matrix
        data <- x$getMatrix()
        inverse <- solve(data)
        x$cacheInverse(inverse)
        
        # return the inverse
        inverse
}
