## this code will create a matrix in a cache and inverse the matrix

## the code below will create a matrix and set values to objects that are only
##  within the function's environment. 

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
      x <<- y
      i <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) i <<- inverse
    getinverse <- function() i
    list (set=set,get=get,
          setinverse = setinverse,
          getmean=getmean)
}

## This function will inverse the matrix within a cache, enabling you to continue with other code 

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
      message("getting cached data")
      return(i)
    }
    data <- x$get()
    i <- solve(data,...)
    x$setinverse(i)
    i
        ## Return a matrix that is the inverse of 'x'
}