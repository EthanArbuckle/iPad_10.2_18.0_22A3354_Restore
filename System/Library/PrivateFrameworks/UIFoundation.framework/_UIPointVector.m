@implementation _UIPointVector

- (_UIPointVector)init
{
  _UIPointVector *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPointVector;
  result = -[_UIPointVector init](&v3, sel_init);
  if (result)
  {
    result->_count = 0;
    result->_capacity = 0;
    *(_QWORD *)result->_vectors = 0;
  }
  return result;
}

- (void)addVector:(_UIPointVector *)self
{
  __int128 v2;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v8 = v2;
  v4 = -[_UIPointVector count](self, "count") + 1;
  if (v4 >= -[_UIPointVector capacity](self, "capacity"))
  {
    -[_UIPointVector setCapacity:](self, "setCapacity:", 2 * -[_UIPointVector capacity](self, "capacity"));
    v5 = -[_UIPointVector capacity](self, "capacity");
    if (v5 <= 1)
      v6 = 1;
    else
      v6 = v5;
    -[_UIPointVector setCapacity:](self, "setCapacity:", v6);
    -[_UIPointVector setVectors:](self, "setVectors:", malloc_type_realloc((void *)-[_UIPointVector vectors](self, "vectors"), 16 * -[_UIPointVector capacity](self, "capacity"), 0x1000040451B5BE8uLL));
  }
  v7 = -[_UIPointVector vectors](self, "vectors");
  *(_OWORD *)(v7 + 16 * -[_UIPointVector count](self, "count")) = v8;
  -[_UIPointVector setCount:](self, "setCount:", -[_UIPointVector count](self, "count") + 1);
}

- (void)removeVectorAtIndex:(unint64_t)a3
{
  if (-[_UIPointVector count](self, "count") > a3)
  {
    memmove((void *)(-[_UIPointVector vectors](self, "vectors") + 16 * a3), (const void *)(-[_UIPointVector vectors](self, "vectors") + 16 * a3 + 16), 16 * (-[_UIPointVector count](self, "count") + ~a3));
    -[_UIPointVector setCount:](self, "setCount:", -[_UIPointVector count](self, "count") - 1);
  }
}

- (__n128)vectorAtIndex:(uint64_t)a3
{
  return *(__n128 *)(objc_msgSend(a1, "vectors") + 16 * a3);
}

- (__n128)lastVector
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "vectors");
  return *(__n128 *)(v2 + 16 * objc_msgSend(a1, "count") - 16);
}

- (void)clear
{
  -[_UIPointVector setCount:](self, "setCount:", 0);
}

- (void)reset
{
  if (-[_UIPointVector vectors](self, "vectors"))
  {
    free((void *)-[_UIPointVector vectors](self, "vectors"));
    -[_UIPointVector setVectors:](self, "setVectors:", 0);
  }
  -[_UIPointVector setCapacity:](self, "setCapacity:", 0);
  -[_UIPointVector setCount:](self, "setCount:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[_UIPointVector reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)_UIPointVector;
  -[_UIPointVector dealloc](&v3, sel_dealloc);
}

- (uint64_t)vectors
{
  return *(_QWORD *)(a1 + 24);
}

- (void)setVectors:(_UIPointVector *)self
{
  uint64_t v2;

  *(_QWORD *)self->_vectors = v2;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

@end
