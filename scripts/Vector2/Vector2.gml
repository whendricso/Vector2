/**
* Vector2 struct containing common operations for Cartesian vectors
* @param {real} _x The x component of the vector
* @param {real} _y The y component of the vector
*/
function Vector2(_x,_y) constructor {
    x=_x
    y=_y
    
    static UP = new Vector2(0,-1)
    static DOWN = new Vector2(0,1)
    static LEFT = new Vector2(-1,0)
    static RIGHT = new Vector2(1,0)
    static ONE = new Vector2(1,1)
    static ZERO = new Vector2(0,0)
    
    /*@desc slope method returns the slope of this Vector2
    * @returns {real} The change over distance, or, "rise over run" of this vector
    */
    static slope = function(){
        if x != 0
            return y/x
        else
            return infinity
    }
    //@desc magnitude method returns the length of the vector
    //@returns {real} the length of this vector
    static magnitude = function(){
        return sqrt(sqr(x)+sqr(y))
    }
    //@desc normalized method returns a copy of the vector with length 1
    //@returns {Struct.Vector2}
    static normalized = function(){
        var _lng = magnitude()
        if _lng != 0
            return new Vector2(x/_lng,y/_lng)
        else
            return new Vector2(0,0)
    }
    //@desc normalizedRW normalizes and overwrites this vector. It does not return a value
    static normalizedRW = function(){
        var _lng = magnitude()
        if _lng != 0 {
            x=x/_lng
            y=y/_lng
        }
    }
    /*  @desc add method combines two vectors additively
    *  @param {Struct.Vector2} _a the first vector
    *  @param {Struct.Vector2} _b the second vector
    * @returns {Struct.Vector2}
    */
    static add = function(_a,_b){
        return new Vector2(_a.x+_b.x,_a.y+_b.y) 	
    }
    //@desc addRW adds _a to and overwrites this vector. It does not return a value
    //@param {Struct.Vector2} _a the vector to add to this one
    static addRW = function(_a){
        x+=_a.x
        y+=_a.y
    }
    /*  @desc subtract method returns a difference vector
    *  @param {Struct.Vector2} _a the first vector
    *  @param {Struct.Vector2} _b the second vector
    * @returns {Struct.Vector2}
        */
    static subtract = function(_a,_b){
        return new Vector2(_a.x-_b.x,_a.y-_b.y)
    }
    //@desc subtractRW subtracts _a from this vector and overwrires it. It does not return a value
    //@param {Struct.Vector2} _a the vector to add to this one
    static subtractRW = function(_a){
        x-=_a.x
        y-=_a.y
    }
    /*  @desc componentMultiply method scales each component of _a by _b in the form v2 = (_a.x*_b.x, _a.y*_b.y)
    *  @param {Struct.Vector2} _a the first vector
    *  @param {Struct.Vector2} _b the second vector
    * @returns {Struct.Vector2}
        */
    static componentMultiply = function(_a,_b){
        return new Vector2(_a.x*_b.x,_a.y*_b.y)
    }
    /* @desc scale method adjusts the length of the vector. Use normalize first if you wish to set the length
    *  @param {Struct.Vector2} _a the first vector
    *  @param {real} _s the scalar
    *  @returns {Struct.Vector2}
    */
    /*  @desc componentMultiplyRW method scales each component of this vector by _a in the form v2 = (_x*_a.x, y*_a.y)
    *  @param {Struct.Vector2} _a the vector to scale by
    * @returns {Struct.Vector2}
        */
    static componentMultiplyRW = function(_a){
        x=x*_a.x
        y=y*_a.y
    }

    /*  @desc scale returns a vector _a multiplied by the scalar _s
    *  @param {Struct.Vector2} _a the vector to multiply
    *  @param {real} _s a real number scalar
    *  @returns {Struct.Vector2}
    */
    static scale = function(_a,_s){
        return new Vector2(_a.x*_s,_a.y*_s) 
    }
    //@desc scaleRW scales this vector by _s and overwites it. No value is returned
    //@param {real} _s The 1-dimensional scalar to multiply this vector by 
    static scaleRW = function(_s){
        x=x*_s
        y=y*_s
    }
    //@desc rnd method rounds each component to the nearest integer
    //@returns {Struct.Vector2}
    static rnd = function(){
        return new Vector2(round(x),round(y)) 
    }
    //@desc rndRW rounds each component of this vector and rewrites it. It returns no value
    static rndRW = function() {
        x=round(x)
        y=round(y)
    }
    //@desc flr method rounds down to the nearest integer
    //@returns {Struct.Vector2}
    static flr = function(){
        return new Vector2(floor(x),floor(y))
    }
    //@desc flrRW rounds each component of this vector down and rewrites it. no value returned
    static flrRW = function() {
        x=floor(x)
        y=floor(y)
    }
    //@desc cling method rounds up to the nearest integer
    //@returns {Struct.Vector2}
    static cling = function(){
        return new Vector2(ceil(x),ceil(y))
    }
    //@desc clingRW rounds up to the nearest integer and overwites this vector. returns no value
    static clingRW = function(){
        x=ceil(x)
        y=ceil(y)
    }
    /*  @desc dot method returns the dot product of two vectors
    *  @param {Struct.Vector2} _a the first vector
    *  @param {Struct.Vector2} _b the second vector
    * * @returns {real}
        */
    static dot = function(_a,_b){
        return _a.x*_b.x+_a.y*_b.y 
    }
    /*  @desc angle method returns the angle between two vectors in degrees
    *  @param {Struct.Vector2} _a the first vector
    *  @param {Struct.Vector2} _b the second vector
    *  @returns {real}
    */
    static angle = function(_a,_b){
        return arctan2((_b.y-_a.y),(_b.x-_a.x))*(180/pi) % 360
    }
    /*  @desc lerpV2 method returns a new vector interpolated between _a and _b by _t
        *  @param {Struct.Vector2} _a the first vector
        *  @param {Struct.Vector2} _b the second vector
        *  @param {real} _t the time factor of interpolation
        *  @returns {Struct.Vector2}
        */
    static lerpV2 = function(_a,_b,_t){
        return new Vector2(lerp(_a.x,_b.x,_t),lerp(_a.y,_b.y,_t))
    }
    /*  @desc lerpV2RW method interpolates this vector between _a and _b by _t, overwriting it
            *  @param {Struct.Vector2} _a the first vector
            *  @param {Struct.Vector2} _b the second vector
            *  @param {real} _t the time factor of interpolation
            */
    static lerpV2RW = function(_a,_b,_t){
        x=lerp(_a.x,_b.x,_t)
        y=lerp(_a.y,_b.y,_t)
    }
    /*  @desc reflect method returns a reflection of _a around the surface normal _n
            *  @param {Struct.Vector2} _a the vector to reflect
            *  @param {Struct.Vector2} _n the surface normal to reflect around
            *  @returns {Struct.Vector2}
            */
    static reflect = function(_a,_n){
        _n = _n.normalized()
        return subtract(_a, scale(_n,scale(dot(_a,_n),2)))
    }
    //@desc reflectRW reflects this vector around the normal _n and modifies it
    //@param {Struct.Vector2} _n The surface normal we want to reflect around
    static reflectRW = function(_n){
        _n.normalizedRW()
        self.subtractRW(scale(_n,scale(dot(self,_n),2)))
    }
    /* @desc rotate function returns a vector rotated by a number of radians
    * @param {Struct.Vector2} _a the vector to rotate
    * @param {real} _r the how far to rotate, in radians
    * @returns {Struct.Vector2}
    */
    static rotate = function(_a,_r){
        return new Vector2(_a.x*cos(_r)-_a.y*sin(_r),_a.x*sin(_r)+_a.y*cos(_r))
    }
    //@desc rotateRW rotates this vector br _r radians and modifies it. returns nothing
    //@param {real} _r radians we wish to rotate by
    static rotateRW = function(_r){
        x=x*cos(_r)-y*sin(_r)
        y=x*sin(_r)+y*cos(_r)
    }
    //@desc overwrites this vector with new data without alocating/dealocating memory
    //@param {real} _x the x component
    //@param {real} _y the y component
    static rewrite = function(_x,_y){
        x=_x
        y=_y
    }
    //@desc Get a copy of this vector instead of a reference
    //@return {Struct.Vector2} A copy of this vector
    copy = function() {
        return new Vector2(x,y)
    }
}
