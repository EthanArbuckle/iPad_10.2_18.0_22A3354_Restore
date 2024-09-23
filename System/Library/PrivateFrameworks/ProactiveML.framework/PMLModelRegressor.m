@implementation PMLModelRegressor

- (id)toPlistWithChunks:(id)a3
{
  PMLModelRegressor *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = objc_retainAutorelease(self);
  v5 = a3;
  +[PMLDataChunkDenseFloatVector chunkWithVector:count:](PMLDataChunkDenseFloatVector, "chunkWithVector:count:", -[PMLModelRegressor values](v4, "values"), -[PMLModelRegressor count](v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  internChunk(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)migrateDenseDoubleVectorToDenseFloatVector:(id)a3
{
  id v4;
  float *v5;
  uint64_t v6;
  id v7;
  float v8;
  void *v9;
  PMLModelRegressor *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = (float *)malloc_type_malloc(4 * (int)objc_msgSend(v4, "count"), 0x100004052888210uLL);
  if ((int)objc_msgSend(v4, "count") >= 1)
  {
    v6 = 0;
    do
    {
      v7 = objc_retainAutorelease(v4);
      v8 = *(double *)(objc_msgSend(v7, "vector") + 8 * v6);
      v5[v6++] = v8;
    }
    while (v6 < (int)objc_msgSend(v7, "count"));
  }
  +[PMLDataChunkDenseFloatVector chunkWithVector:count:](PMLDataChunkDenseFloatVector, "chunkWithVector:count:", v5, objc_msgSend(v4, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  free(v5);
  v10 = self;
  objc_msgSend(v9, "toVec");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PMLModelRegressor initModelRegressorFromFloats:](v10, "initModelRegressorFromFloats:", v11);

  return v12;
}

- (PMLModelRegressor)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  PMLModelRegressor *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[PMLModelRegressor(PMLPlistAndChunksSerialization) initWithPlist:chunks:context:]", "PMLDictionaryParameters.m", 178, "[__expr isKindOfClass:[NSNumber class]]");
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v11, "unsignedIntegerValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v11, "unsignedIntegerValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    -[PMLModelRegressor migrateDenseDoubleVectorToDenseFloatVector:](self, "migrateDenseDoubleVectorToDenseFloatVector:", v14);
    v15 = (PMLModelRegressor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      __assert_rtn("-[PMLModelRegressor(PMLPlistAndChunksSerialization) initWithPlist:chunks:context:]", "PMLDictionaryParameters.m", 186, "[__expr isKindOfClass:[PMLDataChunkDenseFloatVector class]]");
    objc_msgSend(v14, "toVec");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self = (PMLModelRegressor *)-[PMLModelRegressor initModelRegressorFromFloats:](self, "initModelRegressorFromFloats:", v16);

    v15 = self;
  }

  return v15;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _DWORD *v10;
  unint64_t v11;
  void *v12;
  int v13;
  PMLDenseVector *v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VALUES"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SHAPE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != objc_msgSend(v8, "unsignedIntegerValue"))
    __assert_rtn("-[PMLModelRegressor(PMLMobileAssetParameterGetStrategy) initFromDictionary:]", "PMLDictionaryParameters.m", 73, "regressorArray.count == [shapeArray[0] unsignedIntegerValue]");

  v9 = v5;
  v10 = malloc_type_malloc(4 * objc_msgSend(v9, "count"), 0x100004052888210uLL);
  if (objc_msgSend(v9, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatValue");
      v10[v11] = v13;

      ++v11;
    }
    while (v11 < objc_msgSend(v9, "count"));
  }
  v14 = -[PMLDenseVector initWithFloatsNoCopy:count:freeWhenDone:]([PMLDenseVector alloc], "initWithFloatsNoCopy:count:freeWhenDone:", v10, objc_msgSend(v9, "count"), 1);

  v15 = -[PMLModelRegressor initModelRegressorFromFloats:](self, "initModelRegressorFromFloats:", v14);
  return v15;
}

- (id)toDictionary
{
  PMLModelRegressor *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("VALUES");
  v2 = objc_retainAutorelease(self);
  arrayFromFloats((int *)-[PMLModelRegressor values](v2, "values"), -[PMLModelRegressor count](v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("SHAPE");
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PMLModelRegressor count](v2, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = &unk_24D3EAA30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)denseVector
{
  return self->_data;
}

- (id)initModelRegressorFromFloats:(id)a3
{
  id v5;
  PMLModelRegressor *v6;
  PMLModelRegressor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLModelRegressor;
  v6 = -[PMLModelRegressor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (PMLModelRegressor)initWithRegressorFromFloat:(float)a3
{
  PMLDenseVector *v4;
  PMLModelRegressor *v5;
  float v7;

  v7 = a3;
  v4 = -[PMLDenseVector initWithFloats:count:]([PMLDenseVector alloc], "initWithFloats:count:", &v7, 1);
  v5 = -[PMLModelRegressor initModelRegressorFromFloats:](self, "initModelRegressorFromFloats:", v4);

  return v5;
}

- (id)regressorFor:(int)a3
{
  double v3;

  LODWORD(v3) = (_DWORD)-[PMLModelRegressor values](objc_retainAutorelease(self), "values")[4 * a3];
  return +[PMLModelRegressor modelRegressorFromFloat:](PMLModelRegressor, "modelRegressorFromFloat:", v3);
}

- (const)values
{
  return -[PMLDenseVector ptr](self->_data, "ptr");
}

- (const)inverseValues
{
  return -[PMLDenseVector ptr](self->_data, "ptr");
}

- (int)count
{
  return -[PMLDenseVector count](self->_data, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

+ (id)modelRegressorFromFloats:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PMLModelRegressor initModelRegressorFromFloats:]([PMLModelRegressor alloc], "initModelRegressorFromFloats:", v3);

  return v4;
}

+ (id)modelRegressorFromFloat:(float)a3
{
  PMLModelRegressor *v4;
  double v5;

  v4 = [PMLModelRegressor alloc];
  *(float *)&v5 = a3;
  return -[PMLModelRegressor initWithRegressorFromFloat:](v4, "initWithRegressorFromFloat:", v5);
}

+ (id)regressorVectorFrom:(id)a3
{
  id v4;
  PMLMutableDenseVector *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = -[PMLDenseVector initWithCount:]([PMLMutableDenseVector alloc], "initWithCount:", objc_msgSend(v4, "count"));
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    do
    {
      v7 = (void *)MEMORY[0x2199EA600]();
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      *(_DWORD *)(-[PMLMutableDenseVector mutablePtr](objc_retainAutorelease(v5), "mutablePtr") + 4 * v6) = v9;

      objc_autoreleasePoolPop(v7);
      ++v6;
    }
    while (v6 < objc_msgSend(v4, "count"));
  }
  objc_msgSend(a1, "modelRegressorFromFloats:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
