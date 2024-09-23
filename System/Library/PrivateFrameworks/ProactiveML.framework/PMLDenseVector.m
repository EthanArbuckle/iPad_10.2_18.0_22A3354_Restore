@implementation PMLDenseVector

- (const)ptr
{
  return (const float *)-[NSMutableData bytes](self->_data, "bytes");
}

- (unint64_t)count
{
  return -[NSMutableData length](self->_data, "length") >> 2;
}

- (NSData)data
{
  return (NSData *)self->_data;
}

- (PMLDenseVector)init
{
  PMLDenseVector *v2;
  uint64_t v3;
  NSMutableData *data;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PMLDenseVector;
  v2 = -[PMLDenseVector init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    data = v2->_data;
    v2->_data = (NSMutableData *)v3;

  }
  return v2;
}

- (PMLDenseVector)initWithCount:(unint64_t)a3
{
  PMLDenseVector *v4;
  uint64_t v5;
  NSMutableData *data;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)PMLDenseVector;
  v4 = -[PMLDenseVector init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 4 * a3);
    data = v4->_data;
    v4->_data = (NSMutableData *)v5;

    if (!v4->_data)
    {
      v8 = (void *)MEMORY[0x24BDBCE88];
      v13 = CFSTR("count");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "exceptionWithName:reason:userInfo:", CFSTR("PMLMutableDenseVectorAllocationFailure"), CFSTR("Failed to allocate NSData."), v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v11);
    }
  }
  return v4;
}

- (PMLDenseVector)initWithFloats:(const float *)a3 count:(unint64_t)a4
{
  PMLDenseVector *v6;
  uint64_t v7;
  NSMutableData *data;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PMLDenseVector;
  v6 = -[PMLDenseVector init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", a3, 4 * a4);
    data = v6->_data;
    v6->_data = (NSMutableData *)v7;

  }
  return v6;
}

- (PMLDenseVector)initWithFloatsNoCopy:(float *)a3 count:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  _BOOL8 v5;
  PMLDenseVector *v8;
  uint64_t v9;
  NSMutableData *data;
  objc_super v12;

  v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PMLDenseVector;
  v8 = -[PMLDenseVector init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytesNoCopy:length:freeWhenDone:", a3, 4 * a4, v5);
    data = v8->_data;
    v8->_data = (NSMutableData *)v9;

  }
  return v8;
}

- (PMLDenseVector)initWithFloatsNoCopy:(float *)a3 count:(unint64_t)a4 deallocator:(id)a5
{
  id v8;
  PMLDenseVector *v9;
  uint64_t v10;
  NSMutableData *data;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PMLDenseVector;
  v9 = -[PMLDenseVector init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytesNoCopy:length:deallocator:", a3, 4 * a4, v8);
    data = v9->_data;
    v9->_data = (NSMutableData *)v10;

  }
  return v9;
}

- (PMLDenseVector)initWithData:(id)a3
{
  id v4;
  PMLDenseVector *v5;
  uint64_t v6;
  NSMutableData *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLDenseVector;
  v5 = -[PMLDenseVector init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    data = v5->_data;
    v5->_data = (NSMutableData *)v6;

  }
  return v5;
}

- (PMLDenseVector)initWithNumbers:(id)a3
{
  id v4;
  PMLDenseVector *v5;
  NSMutableData *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  NSMutableData *data;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PMLDenseVector;
  v5 = -[PMLDenseVector init](&v13, sel_init);
  if (v5)
  {
    v6 = (NSMutableData *)objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 4 * objc_msgSend(v4, "count")));
    v7 = -[NSMutableData mutableBytes](v6, "mutableBytes");
    if (objc_msgSend(v4, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "floatValue");
        *(_DWORD *)(v7 + 4 * v8) = v10;

        ++v8;
      }
      while (v8 < objc_msgSend(v4, "count"));
    }
    data = v5->_data;
    v5->_data = v6;

  }
  return v5;
}

- (id)sliceFrom:(int)a3 to:(int)a4
{
  int v8;
  PMLMutableDenseVector *v9;
  void *v11;
  void *v12;
  void *v13;

  if (a3 < 0 || -[PMLDenseVector count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLDenseVector.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("start >= 0 && start < self.count"));

  }
  if (a4 < 1 || -[PMLDenseVector count](self, "count") < a4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLDenseVector.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("end > 0 && end <= self.count"));

  }
  v8 = a4 - a3;
  if (a4 < a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLDenseVector.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("end >= start"));

  }
  v9 = objc_retainAutorelease(-[PMLDenseVector initWithCount:]([PMLMutableDenseVector alloc], "initWithCount:", v8));
  memcpy(-[PMLMutableDenseVector mutablePtr](v9, "mutablePtr"), -[PMLDenseVector ptr](objc_retainAutorelease(self), "ptr") + 4 * a3, 4 * v8);
  return v9;
}

- (id)vecByAppendingVec:(id)a3
{
  NSMutableData *v4;
  void *v5;
  void *v6;
  PMLMutableDenseVector *v7;

  v4 = self->_data;
  objc_msgSend(a3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", objc_msgSend(v5, "length") + -[NSMutableData length](v4, "length"));
  objc_msgSend(v6, "appendData:", v4);

  objc_msgSend(v6, "appendData:", v5);
  v7 = -[PMLMutableDenseVector initWithMutableData:]([PMLMutableDenseVector alloc], "initWithMutableData:", v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PMLDenseVector initWithData:](+[PMLMutableDenseVector allocWithZone:](PMLMutableDenseVector, "allocWithZone:", a3), "initWithData:", self->_data);
}

- (float)cosineDistanceFrom:(id)a3
{
  id v5;
  uint64_t v6;
  int v7;
  PMLDenseVector *v8;
  const float *v9;
  id v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  void *v17;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6 != -[PMLDenseVector count](self, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLDenseVector.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("other.count == self.count"));

  }
  v7 = -[PMLDenseVector count](self, "count");
  v8 = objc_retainAutorelease(self);
  v9 = -[PMLDenseVector ptr](v8, "ptr");
  v10 = objc_retainAutorelease(v5);
  v11 = cblas_sdot(v7, v9, 1, (const float *)objc_msgSend(v10, "ptr"), 1);
  -[PMLDenseVector l2norm](v8, "l2norm");
  v13 = v12;
  objc_msgSend(v10, "l2norm");
  v15 = v14;

  return 1.0 - (float)(v11 / (float)(v13 * v15));
}

- (float)l1norm
{
  return cblas_sasum(-[PMLDenseVector count](self, "count"), -[PMLDenseVector ptr](objc_retainAutorelease(self), "ptr"), 1);
}

- (float)l2norm
{
  return cblas_snrm2(-[PMLDenseVector count](self, "count"), -[PMLDenseVector ptr](objc_retainAutorelease(self), "ptr"), 1);
}

- (float)minValue
{
  PMLDenseVector *v2;
  uint64_t v3;
  unint64_t v4;
  float v5;

  v2 = objc_retainAutorelease(self);
  v3 = -[PMLDenseVector ptr](v2, "ptr");
  if (!-[PMLDenseVector count](v2, "count"))
    return 3.4028e38;
  v4 = 0;
  v5 = 3.4028e38;
  do
  {
    if (v5 >= *(float *)(v3 + 4 * v4))
      v5 = *(float *)(v3 + 4 * v4);
    ++v4;
  }
  while (v4 < -[PMLDenseVector count](v2, "count"));
  return v5;
}

- (float)maxValue
{
  PMLDenseVector *v2;
  uint64_t v3;
  unint64_t v4;
  float v5;

  v2 = objc_retainAutorelease(self);
  v3 = -[PMLDenseVector ptr](v2, "ptr");
  if (!-[PMLDenseVector count](v2, "count"))
    return 1.1755e-38;
  v4 = 0;
  v5 = 1.1755e-38;
  do
  {
    if (v5 < *(float *)(v3 + 4 * v4))
      v5 = *(float *)(v3 + 4 * v4);
    ++v4;
  }
  while (v4 < -[PMLDenseVector count](v2, "count"));
  return v5;
}

- (float)density
{
  unint64_t v3;
  float v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __25__PMLDenseVector_density__block_invoke;
  v6[3] = &unk_24D3DB860;
  v6[4] = &v7;
  -[PMLDenseVector enumerateNonZeroValuesWithBlock:](self, "enumerateNonZeroValuesWithBlock:", v6);
  v3 = v8[3];
  v4 = (float)v3 / (float)-[PMLDenseVector count](self, "count");
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)enumerateValuesWithBlock:(id)a3
{
  PMLDenseVector *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void (**v9)(id, _QWORD, float);

  v9 = (void (**)(id, _QWORD, float))a3;
  v4 = objc_retainAutorelease(self);
  v5 = -[PMLDenseVector ptr](v4, "ptr");
  v6 = -[PMLDenseVector count](v4, "count");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      v9[2](v9, i, *(float *)(v5 + 4 * i));
  }

}

- (void)enumerateNonZeroValuesWithBlock:(id)a3
{
  PMLDenseVector *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a3;
  v4 = objc_retainAutorelease(self);
  v5 = -[PMLDenseVector ptr](v4, "ptr");
  v6 = -[PMLDenseVector count](v4, "count");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      if (*(float *)(v5 + 4 * i) != 0.0)
        v9[2](v9, i);
    }
  }

}

- (float)valueAt:(unint64_t)a3
{
  void *v7;

  if (-[PMLDenseVector count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLDenseVector.m"), 202, CFSTR("Index %tu out of bounds (vector length: %tu)"), a3, -[PMLDenseVector count](self, "count"));

  }
  return -[PMLDenseVector ptr](objc_retainAutorelease(self), "ptr")[4 * a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

uint64_t __25__PMLDenseVector_density__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

+ (id)denseVectorFromNumbers:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNumbers:", v4);

  return v5;
}

@end
