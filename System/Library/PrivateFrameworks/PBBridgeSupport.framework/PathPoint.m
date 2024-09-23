@implementation PathPoint

- (PathPoint)initWithP:(PathPoint *)self n:(SEL)a2 r:(float)a3 l:(float)a4
{
  float v4;
  float v5;
  float v6;
  float v7;
  uint64_t v8;
  uint64_t v9;
  PathPoint *result;
  objc_super v11;

  v6 = v5;
  v7 = v4;
  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)PathPoint;
  result = -[PathPoint init](&v11, sel_init);
  if (result)
  {
    *(_QWORD *)result->_p = v9;
    *(_QWORD *)result->_n = v8;
    result->_r = v7;
    result->_l = v6;
  }
  return result;
}

- (double)p
{
  return *(double *)(a1 + 8);
}

- (void)setP:(PathPoint *)self
{
  uint64_t v2;

  *(_QWORD *)self->_p = v2;
}

- (double)n
{
  return *(double *)(a1 + 16);
}

- (void)setN:(PathPoint *)self
{
  uint64_t v2;

  *(_QWORD *)self->_n = v2;
}

- (float)r
{
  return self->_r;
}

- (void)setR:(float)a3
{
  self->_r = a3;
}

- (float)l
{
  return self->_l;
}

- (void)setL:(float)a3
{
  self->_l = a3;
}

@end
