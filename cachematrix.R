## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# The following function 'makeCacheMatrix' creates a special matrix, 
# namely a list containing a function to
# 1. set the values of a matrix
# 2. get the values of a matrix
# 3. set the values of the corresponding inverse matrix
# 4. get the values of the corresponding inverse matrix

makeCacheMatrix<-function(x=matrix()){
    m<-NULL
    set<-function(y){
        x<<-y
        m<<-NULL
    }
    
get<-function()x
setsolve<-function(solve) m<<-solve
getsolve<-function()m
list(set=set,get=get,setsolve=setsolve,getsolve=getsolve)
}


# The following function 'cacheSolve' calculates the inverse of the special 'matrix' 
# created in the above function 'makeCacheMatrix'. 
# It first checks to see if the inverse has already been calculated. 
# If so, it gets the inverse from the cache and skips the computation.
# Otherwise it calculates the inverse of the matrix and 
# set the inverse in the cache via the setsolve function.

cacheSolve<-function(x,...){
## Return a matrix that is the inverse of 'x'
    m<-x$getsolve()
    if(!is.null(m)){
        message("getting cached data")
        return(m)
    }
data<-x$get()
m<-solve(data,...)
x$setsolve(m)
m
}
