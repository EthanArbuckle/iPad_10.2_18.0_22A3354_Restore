@implementation ScandiumRIrRatioModel

+ (id)URLOfModelInThisBundle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("ScandiumRIrRatioModel"), CFSTR("mlmodelc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[ScandiumRIrRatioModel URLOfModelInThisBundle].cold.1();
    v4 = 0;
  }

  return v4;
}

- (ScandiumRIrRatioModel)initWithMLModel:(id)a3
{
  id v5;
  ScandiumRIrRatioModel *v6;
  ScandiumRIrRatioModel *v7;
  ScandiumRIrRatioModel *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)ScandiumRIrRatioModel_0;
    v6 = -[ScandiumRIrRatioModel init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_model, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (ScandiumRIrRatioModel)init
{
  void *v3;
  ScandiumRIrRatioModel *v4;

  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ScandiumRIrRatioModel initWithContentsOfURL:error:]_0(self, "initWithContentsOfURL:error:", v3, 0);

  return v4;
}

- (ScandiumRIrRatioModel)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  ScandiumRIrRatioModel *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ScandiumRIrRatioModel initWithContentsOfURL:configuration:error:]_0(self, "initWithContentsOfURL:configuration:error:", v7, v6, a4);

  return v8;
}

- (ScandiumRIrRatioModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  ScandiumRIrRatioModel *v6;

  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[ScandiumRIrRatioModel initWithMLModel:]_0(self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ScandiumRIrRatioModel)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  ScandiumRIrRatioModel *v7;

  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[ScandiumRIrRatioModel initWithMLModel:]_0(self, "initWithMLModel:", v6);
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
  v8 = (void *)MEMORY[0x24BDBFFC8];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__ScandiumRIrRatioModel_loadContentsOfURL_configuration_completionHandler___block_invoke_0;
  v10[3] = &unk_25169D870;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "loadContentsOfURL:configuration:completionHandler:", a3, a4, v10);

}

void __75__ScandiumRIrRatioModel_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  ScandiumRIrRatioModel *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[ScandiumRIrRatioModel initWithMLModel:]_0([ScandiumRIrRatioModel alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x24BDC0018];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  -[ScandiumRIrRatioModel predictionFromFeatures:options:error:]_0(self, "predictionFromFeatures:options:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  ScandiumRIrRatioModelOutput *v12;
  void *v13;
  void *v14;
  ScandiumRIrRatioModelOutput *v15;

  v8 = a4;
  v9 = a3;
  -[ScandiumRIrRatioModel model]_0(self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [ScandiumRIrRatioModelOutput alloc];
    objc_msgSend(v11, "featureValueForName:", CFSTR("Identity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "multiArrayValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ScandiumRIrRatioModelOutput initWithIdentity:]_0(v12, "initWithIdentity:", v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
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
  -[ScandiumRIrRatioModel model]_0(self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__ScandiumRIrRatioModel_predictionFromFeatures_completionHandler___block_invoke_0;
  v10[3] = &unk_25169D898;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "predictionFromFeatures:completionHandler:", v7, v10);

}

void __66__ScandiumRIrRatioModel_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  ScandiumRIrRatioModelOutput *v6;
  void *v7;
  void *v8;
  ScandiumRIrRatioModelOutput *v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, ScandiumRIrRatioModelOutput *);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = a3;
    v6 = [ScandiumRIrRatioModelOutput alloc];
    objc_msgSend(v12, "featureValueForName:", CFSTR("Identity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiArrayValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ScandiumRIrRatioModelOutput initWithIdentity:]_0(v6, "initWithIdentity:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, ScandiumRIrRatioModelOutput *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

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
  -[ScandiumRIrRatioModel model]_0(self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __74__ScandiumRIrRatioModel_predictionFromFeatures_options_completionHandler___block_invoke_0;
  v13[3] = &unk_25169D898;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "predictionFromFeatures:options:completionHandler:", v10, v9, v13);

}

void __74__ScandiumRIrRatioModel_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  ScandiumRIrRatioModelOutput *v6;
  void *v7;
  void *v8;
  ScandiumRIrRatioModelOutput *v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, ScandiumRIrRatioModelOutput *);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = a3;
    v6 = [ScandiumRIrRatioModelOutput alloc];
    objc_msgSend(v12, "featureValueForName:", CFSTR("Identity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiArrayValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ScandiumRIrRatioModelOutput initWithIdentity:]_0(v6, "initWithIdentity:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, ScandiumRIrRatioModelOutput *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

}

- (id)predictionFromIr:(id)a3 red:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  ScandiumRIrRatioModelInput *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = -[ScandiumRIrRatioModelInput initWithIr:red:]_0([ScandiumRIrRatioModelInput alloc], "initWithIr:red:", v9, v8);

  -[ScandiumRIrRatioModel predictionFromFeatures:error:]_0(self, "predictionFromFeatures:error:", v10, a5);
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
  ScandiumRIrRatioModelOutput *v16;
  void *v17;
  void *v18;
  ScandiumRIrRatioModelOutput *v19;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF60]), "initWithFeatureProviderArray:", v8);
  -[ScandiumRIrRatioModel model]_0(self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictionsFromBatch:options:error:", v10, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") >= 1)
    {
      v21 = v9;
      v22 = v8;
      v14 = 0;
      do
      {
        objc_msgSend(v12, "featuresAtIndex:", v14, v21, v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = [ScandiumRIrRatioModelOutput alloc];
        objc_msgSend(v15, "featureValueForName:", CFSTR("Identity"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "multiArrayValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[ScandiumRIrRatioModelOutput initWithIdentity:]_0(v16, "initWithIdentity:", v18);

        objc_msgSend(v13, "addObject:", v19);
        ++v14;
      }
      while (v14 < objc_msgSend(v12, "count"));
      v9 = v21;
      v8 = v22;
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

void __75__ScandiumRIrRatioModel_loadContentsOfURL_configuration_completionHandler___block_invoke_0(uint64_t a1, void *a2)
{
  ScandiumRIrRatioModel *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[ScandiumRIrRatioModel initWithMLModel:]_0([ScandiumRIrRatioModel alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __66__ScandiumRIrRatioModel_predictionFromFeatures_completionHandler___block_invoke_0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  ScandiumRIrRatioModelOutput *v6;
  void *v7;
  void *v8;
  ScandiumRIrRatioModelOutput *v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, ScandiumRIrRatioModelOutput *);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = a3;
    v6 = [ScandiumRIrRatioModelOutput alloc];
    objc_msgSend(v12, "featureValueForName:", CFSTR("Identity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiArrayValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ScandiumRIrRatioModelOutput initWithIdentity:]_0(v6, "initWithIdentity:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, ScandiumRIrRatioModelOutput *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

}

void __74__ScandiumRIrRatioModel_predictionFromFeatures_options_completionHandler___block_invoke_0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  ScandiumRIrRatioModelOutput *v6;
  void *v7;
  void *v8;
  ScandiumRIrRatioModelOutput *v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, ScandiumRIrRatioModelOutput *);
  id v12;

  v12 = a2;
  if (v12)
  {
    v5 = a3;
    v6 = [ScandiumRIrRatioModelOutput alloc];
    objc_msgSend(v12, "featureValueForName:", CFSTR("Identity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiArrayValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ScandiumRIrRatioModelOutput initWithIdentity:]_0(v6, "initWithIdentity:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, ScandiumRIrRatioModelOutput *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }

}

+ (void)URLOfModelInThisBundle
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2457F9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not load ScandiumRIrRatioModel.mlmodelc in the bundle resource", v0, 2u);
}

@end
