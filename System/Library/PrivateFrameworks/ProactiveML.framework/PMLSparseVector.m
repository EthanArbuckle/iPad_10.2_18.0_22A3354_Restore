@implementation PMLSparseVector

- (PMLSparseVector)initWithLength:(unint64_t)a3 numberOfNonZeroValues:(unint64_t)a4 indicesData:(id)a5 valuesData:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v10 = objc_retainAutorelease(a5);
  v11 = a6;
  v12 = objc_msgSend(v10, "bytes");
  v13 = objc_retainAutorelease(v11);
  v14 = objc_msgSend(v13, "bytes");

  return -[PMLSparseVector initWithLength:numberOfNonZeroValues:indices:values:](self, "initWithLength:numberOfNonZeroValues:indices:values:", a3, a4, v12, v14);
}

- (PMLSparseVector)initWithLength:(unint64_t)a3 numberOfNonZeroValues:(unint64_t)a4 indices:(int64_t *)a5 values:(float *)a6
{
  PMLSparseVector *result;
  void *v13;
  void *v14;
  objc_super v15;

  if (a4 && (!a5 || !a6))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSparseVector.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfNonZeroValues == 0 || (indices && values)"));

  }
  if (a3 < a4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSparseVector.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("length>=numberOfNonZeroValues"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PMLSparseVector;
  result = -[PMLSparseVector init](&v15, sel_init);
  if (result)
  {
    result->_length = a3;
    result->_numberOfNonZeroValues = a4;
    result->_sparseIndices = a5;
    result->_sparseValues = a6;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_sparseIndices);
  free(self->_sparseValues);
  v3.receiver = self;
  v3.super_class = (Class)PMLSparseVector;
  -[PMLSparseVector dealloc](&v3, sel_dealloc);
}

- (id)indicesData
{
  size_t numberOfNonZeroValues;
  _DWORD *v4;
  unint64_t v5;
  int64_t *sparseIndices;
  _DWORD *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v12;

  numberOfNonZeroValues = self->_numberOfNonZeroValues;
  if (numberOfNonZeroValues)
  {
    v4 = malloc_type_calloc(numberOfNonZeroValues, 4uLL, 0x100004052888210uLL);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], CFSTR("malloc failed"), 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v12);
    }
    v5 = self->_numberOfNonZeroValues;
    if (v5)
    {
      sparseIndices = self->_sparseIndices;
      v7 = v4;
      v8 = self->_numberOfNonZeroValues;
      do
      {
        v9 = *sparseIndices++;
        *v7++ = v9;
        --v8;
      }
      while (v8);
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v4, 4 * v5, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)objc_opt_new();
  }
  return v10;
}

- (id)valuesData
{
  id v3;
  float *sparseValues;
  unint64_t v5;
  _QWORD v7[5];

  if (!self->_numberOfNonZeroValues)
    return (id)objc_opt_new();
  v3 = objc_alloc(MEMORY[0x24BDBCE50]);
  sparseValues = self->_sparseValues;
  v5 = 4 * self->_numberOfNonZeroValues;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__PMLSparseVector_valuesData__block_invoke;
  v7[3] = &unk_24D3DBED0;
  v7[4] = self;
  return (id)objc_msgSend(v3, "initWithBytesNoCopy:length:deallocator:", sparseValues, v5, v7);
}

- (id)indicesAsUInt16Data
{
  size_t numberOfNonZeroValues;
  _WORD *v4;
  unint64_t v5;
  int64_t *sparseIndices;
  _WORD *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v13;
  id v14;

  if (self->_length >= 0xFFFF)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSparseVector.m"), 137, CFSTR("Too big vector."));

  }
  numberOfNonZeroValues = self->_numberOfNonZeroValues;
  if (numberOfNonZeroValues)
  {
    v4 = malloc_type_calloc(numberOfNonZeroValues, 2uLL, 0x1000040BDFB0063uLL);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], CFSTR("malloc failed"), 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v14);
    }
    v5 = self->_numberOfNonZeroValues;
    if (v5)
    {
      sparseIndices = self->_sparseIndices;
      v7 = v4;
      v8 = self->_numberOfNonZeroValues;
      do
      {
        v9 = *sparseIndices++;
        *v7++ = v9;
        --v8;
      }
      while (v8);
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v4, 2 * v5, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)objc_opt_new();
  }
  return v10;
}

- (id)quantizedValuesAsUInt8DataWithMin:(float)a3 max:(float)a4
{
  size_t numberOfNonZeroValues;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  id v13;

  numberOfNonZeroValues = self->_numberOfNonZeroValues;
  if (numberOfNonZeroValues)
  {
    v8 = malloc_type_calloc(numberOfNonZeroValues, 1uLL, 0x100004077774924uLL);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], CFSTR("malloc failed"), 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v13);
    }
    if (self->_numberOfNonZeroValues)
    {
      v9 = 0;
      do
      {
        v8[v9] = vcvtms_s32_f32((float)(self->_sparseValues[v9] - a3) / (float)((float)(a4 - a3) / 255.0));
        ++v9;
        v10 = self->_numberOfNonZeroValues;
      }
      while (v9 < v10);
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)objc_opt_new();
  }
  return v11;
}

- (float)minValue
{
  unint64_t numberOfNonZeroValues;
  float *sparseValues;
  float result;
  float v5;
  float v6;

  numberOfNonZeroValues = self->_numberOfNonZeroValues;
  if (!numberOfNonZeroValues)
    return 3.4028e38;
  sparseValues = self->_sparseValues;
  result = 3.4028e38;
  do
  {
    v5 = *sparseValues++;
    v6 = v5;
    if (result >= v5)
      result = v6;
    --numberOfNonZeroValues;
  }
  while (numberOfNonZeroValues);
  return result;
}

- (float)maxValue
{
  unint64_t numberOfNonZeroValues;
  float *sparseValues;
  float result;
  float v5;
  float v6;

  numberOfNonZeroValues = self->_numberOfNonZeroValues;
  if (!numberOfNonZeroValues)
    return 1.1755e-38;
  sparseValues = self->_sparseValues;
  result = 1.1755e-38;
  do
  {
    v5 = *sparseValues++;
    v6 = v5;
    if (result < v5)
      result = v6;
    --numberOfNonZeroValues;
  }
  while (numberOfNonZeroValues);
  return result;
}

- (float)l1norm
{
  return cblas_sasum(self->_numberOfNonZeroValues, self->_sparseValues, 1);
}

- (float)l2norm
{
  return cblas_snrm2(self->_numberOfNonZeroValues, self->_sparseValues, 1);
}

- (float)maxAbsValue
{
  unint64_t numberOfNonZeroValues;
  float *sparseValues;
  float result;

  numberOfNonZeroValues = self->_numberOfNonZeroValues;
  if (!numberOfNonZeroValues)
    return 0.0;
  sparseValues = self->_sparseValues;
  result = sparseValues[cblas_isamax(numberOfNonZeroValues, sparseValues, 1)];
  if (result < 0.0)
    return -result;
  return result;
}

- (void)scaleInPlaceWithInversedFactor:(float)a3
{
  if (a3 > 0.0)
    cblas_sscal(self->_numberOfNonZeroValues, 1.0 / a3, self->_sparseValues, 1);
}

- (void)applyOneHotNormalization
{
  unint64_t numberOfNonZeroValues;
  float *sparseValues;
  float v4;

  numberOfNonZeroValues = self->_numberOfNonZeroValues;
  if (numberOfNonZeroValues)
  {
    sparseValues = self->_sparseValues;
    do
    {
      if (*sparseValues == 0.0)
        v4 = 0.0;
      else
        v4 = 1.0;
      *sparseValues++ = v4;
      --numberOfNonZeroValues;
    }
    while (numberOfNonZeroValues);
  }
}

- (void)scaleWithVectorNormalization:(int64_t)a3
{
  double v3;
  NSObject *v5;
  uint8_t v6[16];

  switch(a3)
  {
    case -1:
      return;
    case 0:
      goto LABEL_9;
    case 1:
      -[PMLSparseVector l1norm](self, "l1norm");
      goto LABEL_10;
    case 2:
      -[PMLSparseVector l2norm](self, "l2norm");
      goto LABEL_10;
    case 3:
      -[PMLSparseVector maxAbsValue](self, "maxAbsValue");
      goto LABEL_10;
    case 4:
      -[PMLSparseVector applyOneHotNormalization](self, "applyOneHotNormalization");
LABEL_9:
      *(float *)&v3 = (float)self->_numberOfNonZeroValues;
LABEL_10:
      -[PMLSparseVector scaleInPlaceWithInversedFactor:](self, "scaleInPlaceWithInversedFactor:", v3);
      break;
    default:
      PML_LogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_fault_impl(&dword_2159BB000, v5, OS_LOG_TYPE_FAULT, "PMLSparseVector: unknown vector normalization method", v6, 2u);
      }

      break;
  }
}

- (void)setLength:(unint64_t)a3
{
  void *v6;

  if (self->_numberOfNonZeroValues > a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSparseVector.m"), 251, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("length >= _numberOfNonZeroValues"));

  }
  self->_length = a3;
}

- (void)setNumberOfNonZeroValues:(unint64_t)a3
{
  void *v6;

  if (self->_length < a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSparseVector.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_length >= numberOfNonZeroValues"));

  }
  self->_numberOfNonZeroValues = a3;
  self->_sparseIndices = (int64_t *)reallocf(self->_sparseIndices, 8 * a3);
  self->_sparseValues = (float *)reallocf(self->_sparseValues, 4 * a3);
}

- (void)setSparseValues:(float *)a3
{
  float *sparseValues;
  BOOL v6;
  void *v8;

  sparseValues = self->_sparseValues;
  if (sparseValues)
    v6 = sparseValues == a3;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSparseVector.m"), 265, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_sparseValues == NULL || _sparseValues != sparseValues"));

    sparseValues = self->_sparseValues;
  }
  free(sparseValues);
  self->_sparseValues = a3;
}

- (void)setSparseIndices:(int64_t *)a3
{
  int64_t *sparseIndices;
  BOOL v6;
  void *v8;

  sparseIndices = self->_sparseIndices;
  if (sparseIndices)
    v6 = sparseIndices == a3;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSparseVector.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_sparseIndices == NULL || _sparseIndices != sparseIndices"));

    sparseIndices = self->_sparseIndices;
  }
  free(sparseIndices);
  self->_sparseIndices = a3;
}

- (void)enumerateNonZeroValuesWithBlock:(id)a3
{
  unint64_t v5;

  if (self->_numberOfNonZeroValues)
  {
    v5 = 0;
    do
    {
      (*((void (**)(id, int64_t, float))a3 + 2))(a3, self->_sparseIndices[v5], self->_sparseValues[v5]);
      ++v5;
    }
    while (v5 < self->_numberOfNonZeroValues);
  }
}

- (void)processNonZeroValuesInPlaceWithBlock:(id)a3
{
  unint64_t v5;
  float *sparseValues;
  float v7;

  if (self->_numberOfNonZeroValues)
  {
    v5 = 0;
    sparseValues = self->_sparseValues;
    do
    {
      v7 = (*((float (**)(id, int64_t, float))a3 + 2))(a3, self->_sparseIndices[v5], sparseValues[v5]);
      sparseValues = self->_sparseValues;
      sparseValues[v5++] = v7;
    }
    while (v5 < self->_numberOfNonZeroValues);
  }
}

- (void)sparseVectorToDense:(float *)a3 length:(unint64_t)a4
{
  +[PMLSparseVector sparseVectorWithLength:numberOfNonZeroValues:isSparseIndexInt64:sparseIndices:sparseValues:toDenseValues:withLength:](PMLSparseVector, "sparseVectorWithLength:numberOfNonZeroValues:isSparseIndexInt64:sparseIndices:sparseValues:toDenseValues:withLength:", self->_length, self->_numberOfNonZeroValues, 1, self->_sparseIndices, self->_sparseValues, a3, a4);
}

- (void)convertToBagOfIds
{
  unint64_t numberOfNonZeroValues;
  int64_t v3;
  int64_t *sparseIndices;
  float *sparseValues;

  numberOfNonZeroValues = self->_numberOfNonZeroValues;
  self->_length = numberOfNonZeroValues;
  if (numberOfNonZeroValues)
  {
    v3 = 0;
    sparseIndices = self->_sparseIndices;
    sparseValues = self->_sparseValues;
    do
    {
      sparseValues[v3] = (float)sparseIndices[v3];
      sparseIndices[v3] = v3;
      ++v3;
    }
    while (numberOfNonZeroValues != v3);
  }
}

- (void)addStartId:(int64_t)a3 endId:(int64_t)a4 paddingId:(int64_t)a5 withMaxVectorLength:(unint64_t)a6
{
  unint64_t length;
  unint64_t v13;
  float *sparseValues;
  unint64_t v15;
  unint64_t v16;
  int64_t *sparseIndices;
  float *v18;
  void *v19;
  void *v20;

  if (self->_length == self->_numberOfNonZeroValues)
  {
    if (a6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSparseVector.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_length == _numberOfNonZeroValues"));

    if (a6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLSparseVector.m"), 349, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maxVectorLength"));

LABEL_3:
  if (self->_length >= a6)
    length = a6;
  else
    length = self->_length;
  self->_length = a6;
  -[PMLSparseVector setNumberOfNonZeroValues:](self, "setNumberOfNonZeroValues:", a6);
  if (a3)
  {
    if (length >= a6 - 1)
      v13 = a6 - 1;
    else
      v13 = length;
    memmove(self->_sparseValues + 1, self->_sparseValues, 4 * v13);
    sparseValues = self->_sparseValues;
    self->_sparseIndices[v13] = v13;
    *sparseValues = (float)a3;
  }
  if (a3)
    v15 = length + 1;
  else
    v15 = length;
  if (v15 < a6)
  {
    v16 = v15;
    sparseIndices = self->_sparseIndices;
    v18 = self->_sparseValues;
    do
    {
      sparseIndices[v16] = v16;
      v18[v16++] = (float)a5;
    }
    while (v16 < a6);
  }
  if (a4)
  {
    if (v15 >= a6 - 1)
      v15 = a6 - 1;
    self->_sparseValues[v15] = (float)a4;
  }
}

- (float)valueAtIndex:(unint64_t)a3
{
  float v5;
  uint64_t v6;
  PMLSparseVector *v7;

  v5 = 0.0;
  if (-[PMLSparseVector numberOfNonZeroValues](self, "numberOfNonZeroValues"))
  {
    v6 = 0;
    while (1)
    {
      v7 = objc_retainAutorelease(self);
      if (-[PMLSparseVector sparseIndices](v7, "sparseIndices")[8 * v6] == a3)
        break;
      if (++v6 >= -[PMLSparseVector numberOfNonZeroValues](v7, "numberOfNonZeroValues"))
        return v5;
    }
    return -[PMLSparseVector sparseValues](objc_retainAutorelease(v7), "sparseValues")[4 * v6];
  }
  return v5;
}

- (PMLSparseVector)vectorWithConstantColumn
{
  void *v3;
  void *v4;
  PMLSparseVector *v5;
  PMLSparseVector *v6;
  unint64_t numberOfNonZeroValues;

  v3 = malloc_type_calloc(self->_numberOfNonZeroValues + 1, 8uLL, 0x100004000313F17uLL);
  v4 = malloc_type_calloc(self->_numberOfNonZeroValues + 1, 4uLL, 0x100004052888210uLL);
  v5 = objc_retainAutorelease(self);
  memcpy(v3, -[PMLSparseVector sparseIndices](v5, "sparseIndices"), 8 * self->_numberOfNonZeroValues);
  v6 = objc_retainAutorelease(v5);
  memcpy(v4, -[PMLSparseVector sparseValues](v6, "sparseValues"), 4 * self->_numberOfNonZeroValues);
  numberOfNonZeroValues = self->_numberOfNonZeroValues;
  *((_QWORD *)v3 + numberOfNonZeroValues) = v6->_length;
  *((_DWORD *)v4 + numberOfNonZeroValues) = 1065353216;
  return -[PMLSparseVector initWithLength:numberOfNonZeroValues:indices:values:]([PMLSparseVector alloc], "initWithLength:numberOfNonZeroValues:indices:values:", -[PMLSparseVector length](v6, "length") + 1, -[PMLSparseVector numberOfNonZeroValues](v6, "numberOfNonZeroValues") + 1, v3, v4);
}

- (unint64_t)length
{
  return self->_length;
}

- (unint64_t)numberOfNonZeroValues
{
  return self->_numberOfNonZeroValues;
}

- (int64_t)sparseIndices
{
  return self->_sparseIndices;
}

- (float)sparseValues
{
  return self->_sparseValues;
}

id __29__PMLSparseVector_valuesData__block_invoke()
{
  return (id)objc_opt_self();
}

+ (id)sparseVectorFromDense:(const float *)a3 length:(unint64_t)a4
{
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  float *v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  void *v14;

  if (!a4)
    goto LABEL_12;
  v7 = 0;
  v8 = 0;
  do
  {
    if (a3[v7] != 0.0)
      ++v8;
    ++v7;
  }
  while (a4 != v7);
  if (v8)
  {
    v9 = malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
    v10 = (float *)malloc_type_calloc(v8, 4uLL, 0x100004052888210uLL);
    v11 = 0;
    v12 = 0;
    do
    {
      v13 = a3[v11];
      if (v13 != 0.0)
      {
        v9[v12] = v11;
        v10[v12++] = v13;
      }
      ++v11;
    }
    while (a4 != v11);
    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLength:numberOfNonZeroValues:indices:values:", a4, v8, v9, v10);
  }
  else
  {
LABEL_12:
    objc_msgSend(a1, "sparseVectorEmptyWithLength:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

+ (id)sparseVectorFromDense:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "ptr");
  v6 = objc_msgSend(v4, "count");

  return (id)objc_msgSend(a1, "sparseVectorFromDense:length:", v5, v6);
}

+ (id)sparseVectorEmptyWithLength:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithLength:numberOfNonZeroValues:indices:values:", a3, 0, 0, 0);
}

+ (id)sparseVectorWithLength:(unint64_t)a3 numberOfNonZeroValues:(unint64_t)a4 block:(id)a5
{
  void (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  PMLSparseVector *v10;
  PMLSparseVector *v11;

  v7 = (void (**)(id, void *, void *))a5;
  if (a4)
  {
    v8 = malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
    v9 = malloc_type_malloc(4 * a4, 0x100004052888210uLL);
    v7[2](v7, v8, v9);
    v10 = -[PMLSparseVector initWithLength:numberOfNonZeroValues:indices:values:]([PMLSparseVector alloc], "initWithLength:numberOfNonZeroValues:indices:values:", a3, a4, v8, v9);
  }
  else
  {
    +[PMLSparseVector sparseVectorEmptyWithLength:](PMLSparseVector, "sparseVectorEmptyWithLength:", a3);
    v10 = (PMLSparseVector *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

+ (void)sparseVectorWithLength:(unint64_t)a3 numberOfNonZeroValues:(unint64_t)a4 isSparseIndexInt64:(BOOL)a5 sparseIndices:(const void *)a6 sparseValues:(const float *)a7 toDenseValues:(float *)a8 withLength:(unint64_t)a9
{
  _BOOL4 v12;
  NSObject *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v12 = a5;
  v23 = *MEMORY[0x24BDAC8D0];
  if (a9 != a3)
  {
    PML_LogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v19 = 134218240;
      v20 = a3;
      v21 = 2048;
      v22 = a9;
      _os_log_impl(&dword_2159BB000, v15, OS_LOG_TYPE_INFO, "PMLSparseVector: dimensions do not match between source sparse vector (%llu) and destination dense vector (%llu)", (uint8_t *)&v19, 0x16u);
    }

  }
  if (a3 == a4)
  {
    if (a3 >= a9)
      v16 = a9;
    else
      v16 = a3;
    memcpy(a8, a7, 4 * v16);
    if (a3 < a9)
      bzero(&a8[v16], 4 * (a9 - v16));
  }
  else
  {
    bzero(a8, 4 * a9);
    if (a4)
    {
      v17 = 0;
      do
      {
        if (v12)
          v18 = *((_QWORD *)a6 + v17);
        else
          v18 = *((int *)a6 + v17);
        if (v18 < a9)
          a8[v18] = a7[v17];
        ++v17;
      }
      while (a4 != v17);
    }
  }
}

+ (id)sparseVectorFromNumbers:(id)a3
{
  id v4;
  _DWORD *v5;
  _DWORD *v6;
  unint64_t v7;
  void *v8;
  int v9;
  void *v10;
  id v12;

  v4 = a3;
  v5 = malloc_type_calloc(objc_msgSend(v4, "count"), 4uLL, 0x100004052888210uLL);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], CFSTR("malloc failed"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v6 = v5;
  if (objc_msgSend(v4, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v6[v7] = v9;

      ++v7;
    }
    while (v7 < objc_msgSend(v4, "count"));
  }
  objc_msgSend(a1, "sparseVectorFromDense:length:", v6, objc_msgSend(v4, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  free(v6);

  return v10;
}

+ (id)sparseVectorFromNumbers:(id)a3 indices:(id)a4 length:(unint64_t)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  float *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  unint64_t v22;
  _QWORD *v23;
  float *v24;
  void *v25;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v10 = malloc_type_calloc(objc_msgSend(v8, "count"), 8uLL, 0x100004000313F17uLL);
    v11 = (float *)malloc_type_calloc(objc_msgSend(v8, "count"), 4uLL, 0x100004052888210uLL);
    if (objc_msgSend(v8, "count"))
    {
      v12 = 0;
      v13 = 0;
      do
      {
        objc_msgSend(v8, "objectAtIndex:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "floatValue");
        v16 = v15;

        objc_msgSend(v9, "objectAtIndex:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "unsignedIntegerValue");

        if (v16 != 0.0)
        {
          v10[v13] = v18;
          v11[v13++] = v16;
        }
        ++v12;
      }
      while (v12 < objc_msgSend(v8, "count"));
    }
    v19 = objc_alloc((Class)a1);
    v20 = objc_msgSend(v8, "count");
    v21 = v19;
    v22 = a5;
    v23 = v10;
    v24 = v11;
  }
  else
  {
    v21 = objc_alloc((Class)a1);
    v22 = a5;
    v20 = 0;
    v23 = 0;
    v24 = 0;
  }
  v25 = (void *)objc_msgSend(v21, "initWithLength:numberOfNonZeroValues:indices:values:", v22, v20, v23, v24);

  return v25;
}

@end
