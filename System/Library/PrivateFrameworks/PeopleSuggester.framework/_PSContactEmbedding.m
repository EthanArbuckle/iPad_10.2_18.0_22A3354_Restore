@implementation _PSContactEmbedding

- (_PSContactEmbedding)init
{
  void *v3;
  _PSContactEmbedding *v4;

  +[_PSContactEmbeddingUtilities loadModelFromUrlResource:](_PSContactEmbeddingUtilities, "loadModelFromUrlResource:", CFSTR("cloud_mlp_with_embedding"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    self = -[_PSContactEmbedding initWithModel:](self, "initWithModel:", v3);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (_PSContactEmbedding)initWithModel:(id)a3
{
  id v5;
  _PSContactEmbedding *v6;
  _PSContactEmbedding *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSContactEmbedding;
  v6 = -[_PSContactEmbedding init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

- (id)getEmbeddingForContact:(id)a3
{
  id v4;
  _PSContactEmbeddingFeatureExtractor *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(_PSContactEmbeddingFeatureExtractor);
  -[_PSContactEmbeddingFeatureExtractor featureInputForContact:](v5, "featureInputForContact:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSContactEmbedding getEmbeddingFromFeatureDict:](self, "getEmbeddingFromFeatureDict:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getEmbeddingsForContacts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _PSContactEmbeddingFeatureExtractor *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = objc_alloc_init(_PSContactEmbeddingFeatureExtractor);
  -[_PSContactEmbeddingFeatureExtractor featureInputsForContacts:](v17, "featureInputsForContacts:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1A1AFCA24]();
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSContactEmbedding getEmbeddingFromFeatureDict:](self, "getEmbeddingFromFeatureDict:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v15, v13);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)getEmbeddingFromFeatureDict:(id)a3
{
  void *v4;
  objc_class *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  id v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  +[_PSContactEmbeddingUtilities prepareFeatureInputFromFeatureDict:](_PSContactEmbeddingUtilities, "prepareFeatureInputFromFeatureDict:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v36, "setObject:forKey:", v37, CFSTR("input1"));
  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v4 = (void *)getMLDictionaryFeatureProviderClass_softClass_2;
  v48 = getMLDictionaryFeatureProviderClass_softClass_2;
  if (!getMLDictionaryFeatureProviderClass_softClass_2)
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __getMLDictionaryFeatureProviderClass_block_invoke_2;
    v44[3] = &unk_1E43FEA00;
    v44[4] = &v45;
    __getMLDictionaryFeatureProviderClass_block_invoke_2((uint64_t)v44);
    v4 = (void *)v46[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v45, 8);
  v43 = 0;
  v35 = (void *)objc_msgSend([v5 alloc], "initWithDictionary:error:", v36, &v43);
  v34 = v43;
  if (v34)
  {
    +[_PSLogging contactEmbeddingChannel](_PSLogging, "contactEmbeddingChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[_PSContactEmbedding getEmbeddingFromFeatureDict:].cold.2((uint64_t)v34, v6, v8, v9, v10, v11, v12, v13);
      v14 = 0;
      v7 = v6;
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    -[_PSContactEmbedding model](self, "model");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(v15, "predictionFromFeatures:error:", v35, &v42);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v42;

    if (v32)
    {
      +[_PSLogging contactEmbeddingChannel](_PSLogging, "contactEmbeddingChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[_PSContactEmbedding getEmbeddingFromFeatureDict:].cold.1((uint64_t)v32, v17, v18, v19, v20, v21, v22, v23);
      v14 = 0;
    }
    else
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v24 = objc_msgSend(&unk_1E442CBB0, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v39 != v25)
              objc_enumerationMutation(&unk_1E442CBB0);
            v27 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_msgSend(v16, "featureValueForName:", v27, v32);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectValue");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            -[_PSContactEmbedding convertToNSArrayFromMLMultiArray:](self, "convertToNSArrayFromMLMultiArray:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKey:](v17, "setObject:forKey:", v30, v27);

          }
          v24 = objc_msgSend(&unk_1E442CBB0, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
        }
        while (v24);
      }
      v14 = -[NSObject copy](v17, "copy", v32);
    }

    v7 = v32;
  }

  return v14;
}

- (id)convertToNSArrayFromMLMultiArray:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:atIndexedSubscript:", v7, i);

    }
  }
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)getEmbeddingFromFeatureDict:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Error while getting output from contact embedding model: %@", a5, a6, a7, a8, 2u);
}

- (void)getEmbeddingFromFeatureDict:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Error while preparing input for contact embedding model: %@", a5, a6, a7, a8, 2u);
}

@end
