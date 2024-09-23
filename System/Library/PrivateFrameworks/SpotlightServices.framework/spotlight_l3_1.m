@implementation spotlight_l3_1

+ (id)URLOfModelInThisBundle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("spotlight_l3_1"), CFSTR("mlmodelc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[spotlight_l3_1 URLOfModelInThisBundle].cold.1();
    v4 = 0;
  }

  return v4;
}

- (spotlight_l3_1)initWithMLModel:(id)a3
{
  id v5;
  spotlight_l3_1 *v6;
  spotlight_l3_1 *v7;
  spotlight_l3_1 *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)spotlight_l3_1;
  v6 = -[spotlight_l3_1 init](&v10, sel_init);
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_model, a3), v7->_model))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (spotlight_l3_1)init
{
  void *v3;
  spotlight_l3_1 *v4;

  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[spotlight_l3_1 initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v3, 0);

  return v4;
}

- (spotlight_l3_1)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  spotlight_l3_1 *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[spotlight_l3_1 initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v7, v6, a4);

  return v8;
}

- (spotlight_l3_1)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  spotlight_l3_1 *v6;

  objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[spotlight_l3_1 initWithMLModel:](self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (spotlight_l3_1)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  spotlight_l3_1 *v7;

  objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[spotlight_l3_1 initWithMLModel:](self, "initWithMLModel:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "URLOfModelInThisBundle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadContentsOfURL:configuration:completionHandler:", v8, v7, v6);

}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0C9E940];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__spotlight_l3_1_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v10[3] = &unk_1E6E43A68;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "loadContentsOfURL:configuration:completionHandler:", a3, a4, v10);

}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0C9E9B0];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  -[spotlight_l3_1 predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  spotlight_l3_1Output *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  spotlight_l3_1Output *v17;

  v8 = a4;
  v9 = a3;
  -[spotlight_l3_1 model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [spotlight_l3_1Output alloc];
    objc_msgSend(v11, "featureValueForName:", CFSTR("y"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "multiArrayValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("id_features"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "multiArrayValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[spotlight_l3_1Output initWithY:id_features:](v12, "initWithY:id_features:", v14, v16);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[spotlight_l3_1 model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__spotlight_l3_1_predictionFromFeatures_completionHandler___block_invoke;
  v10[3] = &unk_1E6E43A90;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "predictionFromFeatures:completionHandler:", v7, v10);

}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[spotlight_l3_1 model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__spotlight_l3_1_predictionFromFeatures_options_completionHandler___block_invoke;
  v13[3] = &unk_1E6E43A90;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "predictionFromFeatures:options:completionHandler:", v10, v9, v13);

}

- (id)predictionFromId_features:(id)a3 dense_features:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  spotlight_l3_1Input *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = -[spotlight_l3_1Input initWithId_features:dense_features:]([spotlight_l3_1Input alloc], "initWithId_features:dense_features:", v9, v8);

  -[spotlight_l3_1 predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  spotlight_l3_1Output *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  spotlight_l3_1Output *v21;
  void *v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8E0]), "initWithFeatureProviderArray:", v8);
  -[spotlight_l3_1 model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictionsFromBatch:options:error:", v10, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") >= 1)
    {
      v23 = v10;
      v24 = v9;
      v25 = v8;
      v14 = 0;
      do
      {
        objc_msgSend(v12, "featuresAtIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = [spotlight_l3_1Output alloc];
        objc_msgSend(v15, "featureValueForName:", CFSTR("y"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "multiArrayValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("id_features"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "multiArrayValue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[spotlight_l3_1Output initWithY:id_features:](v16, "initWithY:id_features:", v18, v20);

        objc_msgSend(v13, "addObject:", v21);
        ++v14;
      }
      while (v14 < objc_msgSend(v12, "count"));
      v9 = v24;
      v8 = v25;
      v10 = v23;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

+ (void)URLOfModelInThisBundle
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1B86C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not load spotlight_l3_1.mlmodelc in the bundle resource", v0, 2u);
}

@end
