@implementation PTCinematographyNetworkFloatOutputStream

- (PTCinematographyNetworkFloatOutputStream)initWithDestination:(float *)a3 count:(unint64_t)a4
{
  PTCinematographyNetworkFloatOutputStream *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PTCinematographyNetworkFloatOutputStream;
  result = -[PTCinematographyNetworkFloatOutputStream init](&v7, sel_init);
  if (result)
  {
    result->_fp = a3;
    result->_count = a4;
    result->_index = 0;
  }
  return result;
}

- (unint64_t)remainingCount
{
  unint64_t index;
  unint64_t count;
  BOOL v4;
  unint64_t v5;

  count = self->_count;
  index = self->_index;
  v4 = count >= index;
  v5 = count - index;
  if (v4)
    return v5;
  else
    return 0;
}

- (void)writeZerosWithCount:(unint64_t)a3
{
  bzero(&self->_fp[self->_index], 4 * a3);
  self->_index += a3;
}

- (void)writeFloat:(float)a3
{
  float *fp;
  unint64_t index;

  fp = self->_fp;
  index = self->_index;
  self->_index = index + 1;
  fp[index] = a3;
}

- (void)writeFloats:(float *)a3 count:(unint64_t)a4
{
  memmove(&self->_fp[self->_index], a3, 4 * a4);
}

- (void)writeOneHot:(unint64_t)a3 count:(unint64_t)a4
{
  float *fp;
  unint64_t index;
  float v6;

  if (a4)
  {
    fp = self->_fp;
    index = self->_index;
    do
    {
      if (a3)
        v6 = 0.0;
      else
        v6 = 1.0;
      fp[index++] = v6;
      --a3;
      --a4;
    }
    while (a4);
    self->_index = index;
  }
}

- (float)fp
{
  return self->_fp;
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end
