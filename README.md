# Vector2
Common Operations for Cartesian Vectors

## Usage:
Vector2 is implemented as a constructor in GML. To perform vector operations, we must first create a struct instance by calling this constructor. In this example, let’s create an orbiter:
```js
//create event
v2 = new Vector2(16,16)//offset vector
va=v2//vector a, our output vector. Will be immediately overwritten
```

```js
//step event
v2 = v2.rotate(degtorad(3))//rotate the offset vector by 3 degrees/step
va = v2.add(v2,new Vector2(x,y))//add the offset to object world position
```

```js
//draw event
draw_sprite(sprOrbiter,va.x,va.y)//draw sprite at offset
```

In this example, we create two Vector2’s, one to represent a 16x16 pixel offset which we will modify each frame (v2), and one to represent the absolute world position where we want to draw the sprite (va). Then in the Step event, we rotate v2 by 3 degrees and add this result to our object’s position to get the correct position to draw our orbiter sprite. Finally, in the Draw event, we draw the orbiter at it’s new position.

Vector2 is designed to work in a similar way to other game engines. When you use the new keyword or use any of the methods accessible through dot notation, a new struct is created in memory. If you instead modify the x & y components directly, the original vector is modified. This is because the methods inside Vector2 always return a new vector rather than modifying the existing one. This behavior is similar to that of other game engines, so many lessons from those engines apply here.

Methods:
Vector2 has a number of common vector operations available to help you finish your game:

All methods that return a Vector2 can re-write their value instead by appending “RW” to the end of the method name as follows:
```js
v2 = new Vector2(1,0)//facing to the right
v2.rotateRW(pi)//now, facing left
```
constructor

`v2 = new Vector2(1,2)`

Creates a new vector and populates it with an x and y component.

To perform any Vector2 operation, you must create at least one instance of it using the new keyword and assign it to a variable as seen above. Usage information below:

Slope

`v2.slope()`

Returns the slope of the vector, calculayed as y/x

magnitude

`v2.magnitude()`

Returns the length of the vector

normalized

`v2.normalized()`

Returns a copy of this Vector2 with length 1

add

`v2.add(_a, _b)`

returns a new Vector2 that is the sum of vectors _a and _b

subtract

`v2.subtract(_a, _b)`

Returns a new Vector2 representing the difference between _a and _b

componentMultiply

`v2.componentMulitply(_a, _b)`

Returns _a scaled by _b on a per-component basis (_a.x * _b.x, _a.y * _b.y)

scale

`v2.scale(_a, _s)`

Returns _a scaled by _s, a real value scalar.

rnd

`v2.rnd()`

Returns a copy of this vector with each component rounded to the nearest integer.

flr

`v2.flr()`

Returns a copy of this vector with each component rounded down.

cling

`v2.cling()`

Returns a copy of this vector with each component rounded up.

dot

`v2.dot(_a, _b)`

Returns the dot product between _a and _b.

angle

`v2.angle(_a, _b)`

Returns the angle between _a and _b in degrees.

lerpV2

`v2.rnd()`

Returns a copy of this vector with each component rounded to the nearest integer.

reflect

`v2.reflect(_a, _n)`

Returns vector _a reflected from surface normal _n. _n is automatically normalized if it’s length isn’t already equal to one.

rotate

`v2.angle(_r)`

Returns this vector rotated by _r radians. To rotate by degrees, pass degtorad(degrees) into _r.

