@implementation PMLImmutableLogisticRegressionModel

- (PMLImmutableLogisticRegressionModel)initWithWeights:(id)a3 intercept:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  PMLImmutableLogisticRegressionModel *v7;
  PMLImmutableLogisticRegressionModel *v8;

  v4 = a4;
  v6 = objc_retainAutorelease(a3);
  v7 = -[PMLImmutableLogisticRegressionModel initWithFloatsNoCopy:count:intercept:](self, "initWithFloatsNoCopy:count:intercept:", objc_msgSend(v6, "values"), objc_msgSend(v6, "length"), v4);
  v8 = v7;
  if (v7)
    objc_storeStrong(&v7->_backingObject, v6);

  return v8;
}

- (PMLImmutableLogisticRegressionModel)initWithChunk:(id)a3 intercept:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  PMLImmutableLogisticRegressionModel *v7;
  PMLImmutableLogisticRegressionModel *v8;

  v4 = a4;
  v6 = objc_retainAutorelease(a3);
  v7 = -[PMLImmutableLogisticRegressionModel initWithFloatsNoCopy:count:intercept:](self, "initWithFloatsNoCopy:count:intercept:", objc_msgSend(v6, "vector"), objc_msgSend(v6, "count"), v4);
  v8 = v7;
  if (v7)
    objc_storeStrong(&v7->_backingObject, v6);

  return v8;
}

- (PMLImmutableLogisticRegressionModel)initWithFloatsNoCopy:(const float *)a3 count:(int)a4 intercept:(BOOL)a5
{
  PMLImmutableLogisticRegressionModel *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PMLImmutableLogisticRegressionModel;
  result = -[PMLImmutableLogisticRegressionModel init](&v9, sel_init);
  if (result)
  {
    result->_weights = a3;
    result->_length = a4;
    result->_intercept = a5;
  }
  return result;
}

- (id)toChunk
{
  return +[PMLDataChunkDenseFloatVector chunkWithVector:count:](PMLDataChunkDenseFloatVector, "chunkWithVector:count:", self->_weights, self->_length);
}

- (BOOL)intercept
{
  return self->_intercept;
}

- (unint64_t)outputDimension
{
  return 2;
}

- (id)predict:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t length;
  int v9;
  id v10;
  const sparse_index *v11;
  id v12;
  float v13;
  double v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (self->_intercept)
  {
    objc_msgSend(v5, "vectorWithConstantColumn");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  length = self->_length;
  if (objc_msgSend(v6, "length") != length)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLImmutableLogisticRegressionModel.m"), 71, CFSTR("Invalid covariates, length: %tu but model weights length: %d"), objc_msgSend(v6, "length"), self->_length);

  }
  v9 = objc_msgSend(v6, "numberOfNonZeroValues");
  v10 = objc_retainAutorelease(v6);
  v11 = (const sparse_index *)objc_msgSend(v10, "sparseIndices");
  v12 = objc_retainAutorelease(v10);
  v13 = sparse_inner_product_dense_float(v9, (const float *)objc_msgSend(v12, "sparseValues"), v11, self->_weights, 1);
  v14 = 1.0 / (expf(-v13) + 1.0);
  v15 = v14;
  *(float *)&v14 = v15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1.0 - v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backingObject, 0);
}

- (id)toPlistWithChunks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("WEIGHTS");
  v4 = a3;
  -[PMLImmutableLogisticRegressionModel toChunk](self, "toChunk");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  internChunk(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[1] = CFSTR("INTERCEPT");
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PMLImmutableLogisticRegressionModel intercept](self, "intercept"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PMLImmutableLogisticRegressionModel)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  PMLImmutableLogisticRegressionModel *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("INTERCEPT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WEIGHTS"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[PMLImmutableLogisticRegressionModel(PMLPlistAndChunksSerialization) initWithPlist:chunks:context:]", "PMLDictionaryParameters.m", 203, "[__expr isKindOfClass:[NSNumber class]]");
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v13, "unsignedIntegerValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[PMLImmutableLogisticRegressionModel(PMLPlistAndChunksSerialization) initWithPlist:chunks:context:]", "PMLDictionaryParameters.m", 204, "[__expr isKindOfClass:[PMLDataChunkDenseFloatVector class]]");
  v15 = -[PMLImmutableLogisticRegressionModel initWithChunk:intercept:](self, "initWithChunk:intercept:", v14, v12);

  return v15;
}

@end
