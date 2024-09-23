@implementation PMLMultiLabelLogisticRegressionModel

- (PMLMultiLabelLogisticRegressionModel)initWithWeightsArray:(id)a3 andIntercept:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  PMLMultiLabelLogisticRegressionModel *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        +[PMLLogisticRegressionModel withWeights:andIntercept:](PMLLogisticRegressionModel, "withWeights:andIntercept:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), v4, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = -[PMLMultiLabelLogisticRegressionModel initWithModels:](self, "initWithModels:", v7);
  return v14;
}

- (PMLMultiLabelLogisticRegressionModel)initWithModels:(id)a3
{
  id v5;
  PMLMultiLabelLogisticRegressionModel *v6;
  PMLMultiLabelLogisticRegressionModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLMultiLabelLogisticRegressionModel;
  v6 = -[PMLMultiLabelLogisticRegressionModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_models, a3);

  return v7;
}

- (unint64_t)outputDimension
{
  return -[NSArray count](self->_models, "count");
}

- (id)predict:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id j;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](self->_models, "count"));
  if (v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->_models;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "predict:", v4, (_QWORD)v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "firstObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v13);

          }
          else
          {
            objc_msgSend(v5, "addObject:", &unk_24D3EAA48);
          }

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    j = v5;
  }
  else
  {
    v15 = -[PMLMultiLabelLogisticRegressionModel outputDimension](self, "outputDimension");
    for (j = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v15); v15; --v15)
      objc_msgSend(j, "addObject:", &unk_24D3EAA48);
  }

  return j;
}

- (id)toPlistWithChunks:(id)a3
{
  id v4;
  PMLPlistClassWrapper *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const __CFString *v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[PMLPlistClassWrapper initWithClassNameKey:]([PMLPlistClassWrapper alloc], "initWithClassNameKey:", CFSTR("CLASS_NAME"));
  v6 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_models;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        -[PMLPlistClassWrapper writeToPlistWithObject:andChunks:](v5, "writeToPlistWithObject:andChunks:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), v4, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v9);
  }

  v19 = CFSTR("MULTI_LABEL_REGRESSION_MODELS");
  v20 = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (PMLMultiLabelLogisticRegressionModel)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  PMLPlistClassWrapper *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  PMLMultiLabelLogisticRegressionModel *v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[PMLPlistClassWrapper initWithClassNameKey:]([PMLPlistClassWrapper alloc], "initWithClassNameKey:", CFSTR("CLASS_NAME"));
  v11 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MULTI_LABEL_REGRESSION_MODELS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        -[PMLPlistClassWrapper readObjectWithPlist:chunks:context:](v10, "readObjectWithPlist:chunks:context:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16), v8, v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  v18 = -[PMLMultiLabelLogisticRegressionModel initWithModels:](self, "initWithModels:", v11);
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_models, 0);
}

@end
