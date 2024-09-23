@implementation FloatArray

- (FloatArray)init
{
  return -[FloatArray initWithCount:](self, "initWithCount:", 0);
}

- (FloatArray)initWithCount:(unint64_t)a3
{
  FloatArray *v4;
  FloatArray *v5;
  FloatArray *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FloatArray;
  v4 = -[FloatArray init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_count = a3;
    v4->_buffer = (float *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
    v6 = v5;
  }

  return v5;
}

- (FloatArray)initWithZeros:(unint64_t)a3
{
  FloatArray *v4;
  FloatArray *v5;
  FloatArray *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FloatArray;
  v4 = -[FloatArray init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_count = a3;
    v4->_buffer = (float *)malloc_type_calloc(a3, 4uLL, 0x100004052888210uLL);
    v6 = v5;
  }

  return v5;
}

- (FloatArray)initWithFloat:(float)a3 repeatCount:(unint64_t)a4
{
  FloatArray *v5;
  FloatArray *v6;
  float __A;

  __A = a3;
  v5 = -[FloatArray initWithCount:](self, "initWithCount:");
  v6 = v5;
  if (v5)
    vDSP_vfill(&__A, v5->_buffer, 1, a4);
  return v6;
}

- (FloatArray)initWithFloatArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "floats");
  v6 = objc_msgSend(v4, "count");

  return -[FloatArray initWithFloats:count:](self, "initWithFloats:count:", v5, v6);
}

- (FloatArray)initWithFloats:(const float *)a3 count:(unint64_t)a4
{
  FloatArray *v6;
  FloatArray *v7;

  v6 = -[FloatArray initWithCount:](self, "initWithCount:", a4);
  v7 = v6;
  if (v6)
    memcpy(v6->_buffer, a3, 4 * a4);
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_buffer);
  v3.receiver = self;
  v3.super_class = (Class)FloatArray;
  -[FloatArray dealloc](&v3, sel_dealloc);
}

- (float)floatAtIndex:(unint64_t)a3
{
  if (self->_count <= a3)
    -[FloatArray floatAtIndex:].cold.1();
  return self->_buffer[a3];
}

- (const)floats
{
  return self->_buffer;
}

- (BOOL)isEqualToFloatArray:(id)a3
{
  double v3;

  LODWORD(v3) = 0;
  return -[FloatArray isEqualToFloatArray:tolerance:](self, "isEqualToFloatArray:tolerance:", a3, v3);
}

- (BOOL)isEqualToFloatArray:(id)a3 tolerance:(float)a4
{
  id v6;
  unint64_t v7;
  float v8;
  BOOL v9;

  v6 = a3;
  v7 = -[FloatArray count](self, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    -[FloatArray maximumDifferenceWithFloatArray:](self, "maximumDifferenceWithFloatArray:", v6);
    v9 = v8 <= a4;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (float)maximumDifferenceWithFloatArray:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  const float *v8;
  id v9;
  float *v10;
  const float *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;

  v4 = a3;
  v5 = -[FloatArray count](self, "count");
  v6 = objc_msgSend(v4, "count");
  if (v5 >= v6)
    v7 = v6;
  else
    v7 = v5;
  v8 = -[FloatArray floats](objc_retainAutorelease(self), "floats");
  v9 = objc_retainAutorelease(v4);
  v10 = (float *)objc_msgSend(v9, "floats");
  if (v7 < 1)
  {
    v12 = 0.0;
  }
  else
  {
    v11 = &v8[v7];
    v12 = 0.0;
    do
    {
      v13 = *v8++;
      v14 = v13;
      v15 = *v10++;
      v16 = v14 - v15;
      if (v16 < 0.0)
        v16 = -v16;
      if (v12 < v16)
        v12 = v16;
    }
    while (v8 < v11);
  }

  return v12;
}

- (float)mean
{
  FloatArray *v2;
  float __C;

  __C = 0.0;
  v2 = objc_retainAutorelease(self);
  vDSP_meanv(-[FloatArray floats](v2, "floats"), 1, &__C, -[FloatArray count](v2, "count"));
  return __C;
}

- (unint64_t)argMinimum
{
  FloatArray *v2;
  vDSP_Length v4;
  float __C;

  __C = 0.0;
  v4 = 0;
  v2 = objc_retainAutorelease(self);
  vDSP_minvi(-[FloatArray floats](v2, "floats"), 1, &__C, &v4, -[FloatArray count](v2, "count"));
  return v4;
}

- (id)addingConstant:(float)a3
{
  MutableFloatArray *v4;
  FloatArray *v5;
  const float *v6;
  MutableFloatArray *v7;
  float __B;

  __B = a3;
  v4 = -[MutableFloatArray initWithCount:]([MutableFloatArray alloc], "initWithCount:", -[FloatArray count](self, "count"));
  v5 = objc_retainAutorelease(self);
  v6 = -[FloatArray floats](v5, "floats");
  v7 = objc_retainAutorelease(v4);
  vDSP_vsadd(v6, 1, &__B, -[MutableFloatArray mutableFloats](v7, "mutableFloats"), 1, -[FloatArray count](v5, "count"));
  return v7;
}

- (id)subtracting:(id)a3
{
  _QWORD *v4;
  void *v5;
  MutableFloatArray *v6;
  id v7;
  const float *v8;
  FloatArray *v9;
  const float *v10;
  MutableFloatArray *v11;

  v4 = a3;
  if (self->_count != v4[2])
    -[FloatArray subtracting:].cold.1();
  v5 = v4;
  v6 = -[MutableFloatArray initWithCount:]([MutableFloatArray alloc], "initWithCount:", self->_count);
  v7 = objc_retainAutorelease(v5);
  v8 = (const float *)objc_msgSend(v7, "floats");
  v9 = objc_retainAutorelease(self);
  v10 = -[FloatArray floats](v9, "floats");
  v11 = objc_retainAutorelease(v6);
  vDSP_vsub(v8, 1, v10, 1, -[MutableFloatArray mutableFloats](v11, "mutableFloats"), 1, -[FloatArray count](v9, "count"));

  return v11;
}

- (FloatArray)initWithArray:(id)a3
{
  id v4;
  FloatArray *v5;
  unint64_t v6;
  void *v7;
  float v8;

  v4 = a3;
  v5 = -[FloatArray initWithCount:](self, "initWithCount:", objc_msgSend(v4, "count"));
  if (v5 && objc_msgSend(v4, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v5->_buffer[v6] = v8;

      ++v6;
    }
    while (v6 < objc_msgSend(v4, "count"));
  }

  return v5;
}

- (id)asArray
{
  void *v3;
  FloatArray *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  v4 = objc_retainAutorelease(self);
  v5 = -[FloatArray floats](v4, "floats");
  if (v4->_count)
  {
    v7 = v5;
    v8 = 0;
    do
    {
      LODWORD(v6) = *(_DWORD *)(v7 + 4 * v8);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v9);

      ++v8;
    }
    while (v8 < v4->_count);
  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (FloatArray)initWithData:(id)a3
{
  id v4;
  FloatArray *v5;
  id v6;

  v4 = a3;
  if ((objc_msgSend(v4, "length") & 3) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_retainAutorelease(v4);
    self = -[FloatArray initWithFloats:count:](self, "initWithFloats:count:", objc_msgSend(v6, "bytes"), (unint64_t)objc_msgSend(v6, "length") >> 2);
    v5 = self;
  }

  return v5;
}

- (id)asData
{
  void *v2;
  FloatArray *v3;

  v2 = (void *)MEMORY[0x1E0C99D50];
  v3 = objc_retainAutorelease(self);
  return (id)objc_msgSend(v2, "dataWithBytes:length:", -[FloatArray floats](v3, "floats"), 4 * -[FloatArray count](v3, "count"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FloatArray initWithFloatArray:]([MutableFloatArray alloc], "initWithFloatArray:", self);
}

- (unint64_t)count
{
  return self->_count;
}

- (void)floatAtIndex:.cold.1()
{
  __assert_rtn("-[FloatArray floatAtIndex:]", "FloatArray.m", 71, "index < _count");
}

- (void)subtracting:.cold.1()
{
  __assert_rtn("-[FloatArray subtracting:]", "FloatArray.m", 130, "_count == array->_count");
}

@end
