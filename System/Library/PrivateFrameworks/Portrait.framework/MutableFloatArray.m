@implementation MutableFloatArray

- (MutableFloatArray)initWithCount:(unint64_t)a3
{
  return -[MutableFloatArray initWithCount:capacity:](self, "initWithCount:capacity:", a3, a3);
}

- (MutableFloatArray)initWithCount:(unint64_t)a3 capacity:(unint64_t)a4
{
  unint64_t v5;
  unint64_t v6;
  MutableFloatArray *result;
  objc_super v8;

  if (a4 <= a3)
    v5 = a3;
  else
    v5 = a4;
  if (v5 <= 0x10)
    v6 = 16;
  else
    v6 = v5;
  v8.receiver = self;
  v8.super_class = (Class)MutableFloatArray;
  result = -[FloatArray initWithCount:](&v8, sel_initWithCount_, v6);
  result->_start = result->super._buffer;
  result->super._count = a3;
  result->_capacity = v6;
  return result;
}

- (MutableFloatArray)initWithZeros:(unint64_t)a3
{
  return -[MutableFloatArray initWithZeros:capacity:](self, "initWithZeros:capacity:", a3, a3);
}

- (MutableFloatArray)initWithZeros:(unint64_t)a3 capacity:(unint64_t)a4
{
  unint64_t v5;
  unint64_t v6;
  MutableFloatArray *result;
  objc_super v8;

  if (a4 <= a3)
    v5 = a3;
  else
    v5 = a4;
  if (v5 <= 0x10)
    v6 = 16;
  else
    v6 = v5;
  v8.receiver = self;
  v8.super_class = (Class)MutableFloatArray;
  result = -[FloatArray initWithZeros:](&v8, sel_initWithZeros_, v6);
  result->_start = result->super._buffer;
  result->super._count = a3;
  result->_capacity = v6;
  return result;
}

- (MutableFloatArray)initWithFloat:(float)a3 repeatCount:(unint64_t)a4 capacity:(unint64_t)a5
{
  MutableFloatArray *v6;
  MutableFloatArray *v7;
  float __A;

  __A = a3;
  v6 = -[MutableFloatArray initWithCount:capacity:](self, "initWithCount:capacity:", a4, a5);
  v7 = v6;
  if (v6)
    vDSP_vfill(&__A, v6->super._buffer, 1, a4);
  return v7;
}

- (float)floatAtIndex:(unint64_t)a3
{
  if (self->super._count <= a3)
    -[MutableFloatArray floatAtIndex:].cold.1();
  return self->_start[a3];
}

- (const)floats
{
  return self->_start;
}

- (float)mutableFloats
{
  return self->_start;
}

- (void)setFloat:(float)a3 atIndex:(unint64_t)a4
{
  if (self->super._count <= a4)
    -[MutableFloatArray setFloat:atIndex:].cold.1();
  self->_start[a4] = a3;
}

- (void)setFloat:(float)a3 inRange:(_NSRange)a4
{
  float __A;

  __A = a3;
  if (a4.location + a4.length > self->super._count)
    -[MutableFloatArray setFloat:inRange:].cold.1();
  vDSP_vfill(&__A, &self->_start[a4.location], 1, a4.length);
}

- (void)setFloats:(const float *)a3 inRange:(_NSRange)a4
{
  if (a4.location + a4.length > self->super._count)
    -[MutableFloatArray setFloats:inRange:].cold.1();
  memcpy(&self->_start[a4.location], a3, 4 * a4.length);
}

- (void)appendFloat:(float)a3
{
  float *start;
  float *buffer;
  float *v7;
  float **p_buffer;
  unint64_t capacity;
  float *v10;
  unint64_t count;

  start = self->_start;
  p_buffer = &self->super._buffer;
  buffer = self->super._buffer;
  v7 = p_buffer[1];
  capacity = self->_capacity;
  if (&start[(_QWORD)v7] >= &buffer[capacity])
  {
    if (buffer >= start)
    {
      self->_capacity = 2 * capacity;
      v10 = (float *)malloc_type_realloc(buffer, 8 * capacity, 0x100004052888210uLL);
      if (!v10)
        -[MutableFloatArray appendFloat:].cold.1();
      start = v10;
      self->super._buffer = v10;
    }
    else
    {
      memmove(buffer, start, 4 * (_QWORD)v7);
      start = self->super._buffer;
    }
    self->_start = start;
  }
  count = self->super._count;
  self->super._count = count + 1;
  start[count] = a3;
}

- (void)removeFromStart:(unint64_t)a3
{
  unint64_t count;
  unint64_t v4;

  count = self->super._count;
  if (count >= a3)
    v4 = a3;
  else
    v4 = self->super._count;
  self->_start += v4;
  self->super._count = count - v4;
}

- (void)addConstant:(float)a3
{
  MutableFloatArray *v3;
  const float *v4;
  MutableFloatArray *v5;
  float __B;

  __B = a3;
  v3 = objc_retainAutorelease(self);
  v4 = -[MutableFloatArray floats](v3, "floats");
  v5 = objc_retainAutorelease(v3);
  vDSP_vsadd(v4, 1, &__B, -[MutableFloatArray mutableFloats](v5, "mutableFloats"), 1, -[FloatArray count](v5, "count"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FloatArray initWithFloatArray:]([FloatArray alloc], "initWithFloatArray:", self);
}

- (void)floatAtIndex:.cold.1()
{
  __assert_rtn("-[MutableFloatArray floatAtIndex:]", "FloatArray.m", 230, "index < _count");
}

- (void)setFloat:atIndex:.cold.1()
{
  __assert_rtn("-[MutableFloatArray setFloat:atIndex:]", "FloatArray.m", 243, "index < _count");
}

- (void)setFloat:inRange:.cold.1()
{
  __assert_rtn("-[MutableFloatArray setFloat:inRange:]", "FloatArray.m", 248, "NSMaxRange(range) <= _count");
}

- (void)setFloats:inRange:.cold.1()
{
  __assert_rtn("-[MutableFloatArray setFloats:inRange:]", "FloatArray.m", 253, "NSMaxRange(range) <= _count");
}

- (void)appendFloat:.cold.1()
{
  __assert_rtn("-[MutableFloatArray appendFloat:]", "FloatArray.m", 269, "!\"out of memory allocating FloatArray buffer\");
}

@end
