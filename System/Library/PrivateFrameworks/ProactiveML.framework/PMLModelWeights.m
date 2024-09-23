@implementation PMLModelWeights

- (id)toPlistWithChunks:(id)a3
{
  PMLModelWeights *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = objc_retainAutorelease(self);
  v5 = a3;
  +[PMLDataChunkDenseFloatVector chunkWithVector:count:](PMLDataChunkDenseFloatVector, "chunkWithVector:count:", -[PMLModelWeights values](v4, "values"), -[PMLModelWeights length](v4, "length"));
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
  PMLModelWeights *v10;
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
  v12 = -[PMLModelWeights initModelWeightsFromFloats:](v10, "initModelWeightsFromFloats:", v11);

  return v12;
}

- (PMLModelWeights)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  PMLModelWeights *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[PMLModelWeights(PMLPlistAndChunksSerialization) initWithPlist:chunks:context:]", "PMLDictionaryParameters.m", 137, "[__expr isKindOfClass:[NSNumber class]]");
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v11, "unsignedIntegerValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v11, "unsignedIntegerValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    -[PMLModelWeights migrateDenseDoubleVectorToDenseFloatVector:](self, "migrateDenseDoubleVectorToDenseFloatVector:", v14);
    v15 = (PMLModelWeights *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      __assert_rtn("-[PMLModelWeights(PMLPlistAndChunksSerialization) initWithPlist:chunks:context:]", "PMLDictionaryParameters.m", 146, "[__expr isKindOfClass:[PMLDataChunkDenseFloatVector class]]");
    objc_msgSend(v14, "toVec");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self = (PMLModelWeights *)-[PMLModelWeights initModelWeightsFromFloats:](self, "initModelWeightsFromFloats:", v16);

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
  PMLMutableDenseVector *v10;
  float *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VALUES"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SHAPE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != objc_msgSend(v8, "unsignedIntegerValue"))
    __assert_rtn("-[PMLModelWeights(PMLMobileAssetParameterGetStrategy) initFromDictionary:]", "PMLDictionaryParameters.m", 51, "weightArray.count == [shapeArray[0] unsignedIntegerValue]");

  v9 = v5;
  v10 = objc_retainAutorelease(-[PMLDenseVector initWithCount:]([PMLMutableDenseVector alloc], "initWithCount:", objc_msgSend(v9, "count")));
  v11 = -[PMLMutableDenseVector mutablePtr](v10, "mutablePtr");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "floatValue", (_QWORD)v20);
        *(_DWORD *)v11++ = v17;
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  v18 = -[PMLModelWeights initModelWeightsFromFloats:](self, "initModelWeightsFromFloats:", v10);
  return v18;
}

- (id)toDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  PMLModelWeights *v6;
  double v7;
  void *v8;
  PMLModelWeights *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (-[PMLModelWeights length](self, "length") >= 1)
  {
    v4 = 0;
    do
    {
      v5 = (void *)MEMORY[0x24BDD16E0];
      v6 = objc_retainAutorelease(self);
      LODWORD(v7) = (_DWORD)-[PMLModelWeights values](v6, "values")[4 * v4];
      objc_msgSend(v5, "numberWithFloat:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v8);

      ++v4;
    }
    while (v4 < -[PMLModelWeights length](v6, "length"));
  }
  v16[0] = CFSTR("VALUES");
  v9 = objc_retainAutorelease(self);
  arrayFromFloats((int *)-[PMLModelWeights values](v9, "values"), -[PMLModelWeights length](v9, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("SHAPE");
  v17[0] = v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PMLModelWeights length](v9, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = &unk_24D3EAA30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)initModelWeightsFromFloats:(id)a3
{
  id v5;
  PMLModelWeights *v6;
  PMLModelWeights *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLModelWeights;
  v6 = -[PMLModelWeights init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (PMLModelWeights)initWithCount:(int)a3
{
  PMLMutableDenseVector *v4;
  PMLModelWeights *v5;

  v4 = -[PMLDenseVector initWithCount:]([PMLMutableDenseVector alloc], "initWithCount:", a3);
  v5 = -[PMLModelWeights initModelWeightsFromFloats:](self, "initModelWeightsFromFloats:", v4);

  return v5;
}

- (float)values
{
  return -[PMLMutableDenseVector mutablePtr](self->_data, "mutablePtr");
}

- (id)asMutableDenseVector
{
  return self->_data;
}

- (int)length
{
  return -[PMLDenseVector count](self->_data, "count");
}

- (void)processValuesInPlaceWithBlock:(id)a3
{
  -[PMLMutableDenseVector processValuesInPlaceWithBlock:](self->_data, "processValuesInPlaceWithBlock:", a3);
}

- (id)weightsByAppendingWeights:(id)a3
{
  void *v3;
  void *v4;

  -[PMLDenseVector vecByAppendingVec:](self->_data, "vecByAppendingVec:", *((_QWORD *)a3 + 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PMLModelWeights modelWeightsFromFloats:](PMLModelWeights, "modelWeightsFromFloats:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sliceFrom:(int)a3 to:(int)a4
{
  void *v4;
  void *v5;

  -[PMLDenseVector sliceFrom:to:](self->_data, "sliceFrom:to:", *(_QWORD *)&a3, *(_QWORD *)&a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PMLModelWeights modelWeightsFromFloats:](PMLModelWeights, "modelWeightsFromFloats:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copy
{
  -[PMLModelWeights sliceFrom:to:](self, "sliceFrom:to:", 0, -[PMLModelWeights length](self, "length"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

+ (id)modelWeightsFromFloats:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PMLModelWeights initModelWeightsFromFloats:]([PMLModelWeights alloc], "initModelWeightsFromFloats:", v3);

  return v4;
}

+ (id)modelWeightsOfLength:(int)a3 rng:(id)a4
{
  id v6;
  id v7;
  PMLMutableDenseVector *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  float *v13;
  float *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  PMLMutableDenseVector *v24;
  void *v25;
  id v27;

  v6 = a4;
  v7 = objc_alloc((Class)a1);
  v8 = [PMLMutableDenseVector alloc];
  v9 = v6;
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;
  v13 = (float *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], CFSTR("malloc failed"), 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v14 = v13;
  v15 = a3;
  if (a3 >= 1)
  {
    v16 = 0;
    v17 = a3;
    do
    {
      v18 = v12;
      do
      {
        do
        {
          v19 = (float)((float)(unint64_t)objc_msgSend(v18, "next") * 5.421e-20) * 2.0 + -1.0;
          v20 = (float)((float)(unint64_t)objc_msgSend(v18, "next") * 5.421e-20) * 2.0 + -1.0;
          v21 = (float)(v20 * v20) + (float)(v19 * v19);
        }
        while (v21 >= 1.0);
      }
      while (v21 < 7.81e-306);
      v22 = logf(v21) * -2.0 / v21;
      v23 = sqrtf(v22) * v19;

      v14[v16++] = v23;
    }
    while (v16 != v17);
  }

  v24 = -[PMLDenseVector initWithFloatsNoCopy:count:freeWhenDone:](v8, "initWithFloatsNoCopy:count:freeWhenDone:", v14, v15, 1);
  v25 = (void *)objc_msgSend(v7, "initModelWeightsFromFloats:", v24);

  return v25;
}

+ (id)modelWeightsOfLength:(int)a3
{
  return (id)objc_msgSend(a1, "modelWeightsOfLength:rng:", *(_QWORD *)&a3, 0);
}

+ (id)modelWeightsOfLength:(int)a3 rngSeed:(unint64_t)a4
{
  uint64_t v4;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7A628]), "initWithSeed:", a4);
  objc_msgSend(a1, "modelWeightsOfLength:rng:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)zeroWeightsOfLength:(int)a3
{
  id v4;
  PMLMutableDenseVector *v5;
  void *v6;

  v4 = objc_alloc((Class)a1);
  v5 = -[PMLDenseVector initWithCount:]([PMLMutableDenseVector alloc], "initWithCount:", a3);
  v6 = (void *)objc_msgSend(v4, "initModelWeightsFromFloats:", v5);

  return v6;
}

+ (id)constWeightsOfLength:(int)a3 value:(float)a4
{
  id v6;
  PMLMutableDenseVector *v7;
  float *v8;
  uint64_t v9;
  float *v10;
  PMLMutableDenseVector *v11;
  void *v12;
  id v14;

  v6 = objc_alloc((Class)a1);
  v7 = [PMLMutableDenseVector alloc];
  v8 = (float *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], CFSTR("malloc failed"), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  if (a3 >= 1)
  {
    v9 = a3;
    v10 = v8;
    do
    {
      *v10++ = a4;
      --v9;
    }
    while (v9);
  }
  v11 = -[PMLDenseVector initWithFloatsNoCopy:count:freeWhenDone:](v7, "initWithFloatsNoCopy:count:freeWhenDone:", v8, a3, 1);
  v12 = (void *)objc_msgSend(v6, "initModelWeightsFromFloats:", v11);

  return v12;
}

+ (id)weightsFromNumbers:(id)a3
{
  id v3;
  _DWORD *v4;
  _DWORD *v5;
  unint64_t v6;
  void *v7;
  int v8;
  PMLMutableDenseVector *v9;
  void *v10;
  id v12;

  v3 = a3;
  v4 = malloc_type_calloc(objc_msgSend(v3, "count"), 4uLL, 0x100004052888210uLL);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], CFSTR("malloc failed"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v5 = v4;
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v5[v6] = v8;

      ++v6;
    }
    while (v6 < objc_msgSend(v3, "count"));
  }
  v9 = -[PMLDenseVector initWithFloatsNoCopy:count:freeWhenDone:]([PMLMutableDenseVector alloc], "initWithFloatsNoCopy:count:freeWhenDone:", v5, objc_msgSend(v3, "count"), 1);
  +[PMLModelWeights modelWeightsFromFloats:](PMLModelWeights, "modelWeightsFromFloats:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
