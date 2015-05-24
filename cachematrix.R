## This assignmen is intended to reduce the amount of effort needed to perform matrix inversion through the use of lexical scoping
## Two functions are created in order to perform and compute the matrix inversion
## The first function creates a matrix that can cache its inverse

#The makeCacheMatrix function sets and gets the value of the matrix
#This function also sets and gets value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  xinv <- NULL
  set <- function(y){
    x <<- y
    xinv <<- NULL
  }
  get <- function()x
  setinverse <- function(inv) xinv <<- inv
  getinverse <- function() xinv
  list( set= set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## The second function returns the inverse of the matrix.
## 

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)){
      message("getting cached data")
      return(m) 
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m  
  
  
        
}
