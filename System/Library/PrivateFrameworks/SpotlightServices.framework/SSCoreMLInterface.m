@implementation SSCoreMLInterface

- (SSCoreMLInterface)initWithURL:(id)a3 error:(id *)a4
{
  MLModelAsset *v6;
  MLModelAsset *asset;
  MLModelAsset *v8;
  MLModel *v9;
  MLModel *model;
  SSCoreMLInterface *v11;

  objc_msgSend(MEMORY[0x1E0C9E950], "modelAssetWithURL:error:", a3);
  v6 = (MLModelAsset *)objc_claimAutoreleasedReturnValue();
  asset = self->asset;
  self->asset = v6;

  if (a4 && *a4
    || (v8 = self->asset) == 0
    || (-[MLModelAsset model](v8, "model"),
        v9 = (MLModel *)objc_claimAutoreleasedReturnValue(),
        model = self->model,
        self->model = v9,
        model,
        !self->model))
  {
    v11 = 0;
  }
  else
  {
    v11 = self;
  }

  return v11;
}

- (id)initSpecificModel:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  SSCoreMLInterface *v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.mlmodelc"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SSDefaultsGetAssetPath(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SSCoreMLInterface initWithURL:error:](self, "initWithURL:error:", v8, a4);

  return v9;
}

- (float)predictFromValues:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t i;
  void *v22;
  double v23;
  double v24;
  float v25;
  float v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v14), (_QWORD)v28);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v12);
  }

  v16 = objc_msgSend(v9, "count");
  v17 = objc_alloc(MEMORY[0x1E0C9E970]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v18;
  v32[1] = &unk_1E6E98268;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initForFloat32TypeWithShape:", v19);

  if (v16)
  {
    for (i = 0; i != v16; ++i)
    {
      objc_msgSend(v9, "objectAtIndex:", i, (_QWORD)v28);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      *(float *)&v24 = v24;
      *(_DWORD *)(objc_msgSend(v20, "floatPointer") + 4 * i) = LODWORD(v24);
    }
  }
  -[SSCoreMLInterface predict:error:](self, "predict:error:", v20, a4, (_QWORD)v28);
  v26 = v25;

  return v26;
}

- (float)predict:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  float v14;

  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("x_in"));

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8F8]), "initWithDictionary:error:", v8, a4);
  -[MLModel predictionFromFeatures:error:](self->model, "predictionFromFeatures:error:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "featureValueForName:", CFSTR("out"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "doubleValue");
    v14 = v13;
  }
  else
  {
    v14 = 0.0;
  }

  return v14;
}

- (float)predictFromDictionaryFeatures:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  float v13;

  v6 = (objc_class *)MEMORY[0x1E0C9E8F8];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithDictionary:error:", v7, a4);

  -[MLModel predictionFromFeatures:error:](self->model, "predictionFromFeatures:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "featureValueForName:", CFSTR("out"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "doubleValue");
    v13 = v12;
  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (id)getVersionString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[MLModelAsset regressor](self->asset, "regressor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E868]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    if (!objc_msgSend(v7, "length"))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E888]);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MLModelAsset regressor](self->asset, "regressor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E870]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)getInputDescriptionsByName
{
  void *v2;
  void *v3;

  -[MLModel modelDescription](self->model, "modelDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDescriptionsByName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->model, 0);
  objc_storeStrong((id *)&self->asset, 0);
}

@end
