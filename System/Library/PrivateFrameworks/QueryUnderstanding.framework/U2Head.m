@implementation U2Head

void __60__U2Head_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  U2Head *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[U2Head initWithMLModel:]([U2Head alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (U2Head)initWithMLModel:(id)a3
{
  id v5;
  U2Head *v6;
  U2Head *v7;
  U2Head *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)U2Head;
  v6 = -[U2Head init](&v10, sel_init);
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_model, a3), v7->_model))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (MLModel)model
{
  return self->_model;
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
  v10[2] = __60__U2Head_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v10[3] = &unk_2515EC2C0;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "loadContentsOfURL:configuration:completionHandler:", a3, a4, v10);

}

+ (id)URLOfModelInThisBundle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("U2Head"), CFSTR("mlmodelc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[U2Head URLOfModelInThisBundle].cold.1();
    v4 = 0;
  }

  return v4;
}

- (U2Head)init
{
  void *v3;
  U2Head *v4;

  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[U2Head initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v3, 0);

  return v4;
}

- (U2Head)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  U2Head *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[U2Head initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v7, v6, a4);

  return v8;
}

- (U2Head)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  U2Head *v6;

  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[U2Head initWithMLModel:](self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (U2Head)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  U2Head *v7;

  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[U2Head initWithMLModel:](self, "initWithMLModel:", v6);
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

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x24BDC0018];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  -[U2Head predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  U2HeadOutput *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  U2HeadOutput *v21;

  v8 = a4;
  v9 = a3;
  -[U2Head model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [U2HeadOutput alloc];
    objc_msgSend(v11, "featureValueForName:", CFSTR("top_arg_ids"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "multiArrayValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("arg_conf_scores"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "multiArrayValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("intent_scores"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "multiArrayValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("safety_head_scores"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "multiArrayValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[U2HeadOutput initWithTop_arg_ids:arg_conf_scores:intent_scores:safety_head_scores:](v12, "initWithTop_arg_ids:arg_conf_scores:intent_scores:safety_head_scores:", v14, v16, v18, v20);

  }
  else
  {
    v21 = 0;
  }

  return v21;
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
  -[U2Head model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__U2Head_predictionFromFeatures_completionHandler___block_invoke;
  v10[3] = &unk_2515EC2E8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "predictionFromFeatures:completionHandler:", v7, v10);

}

void __51__U2Head_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  U2HeadOutput *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  U2HeadOutput *v14;
  uint64_t v15;
  void (*v16)(uint64_t, _QWORD, U2HeadOutput *);
  id v17;
  id v18;

  v18 = a2;
  if (v18)
  {
    v17 = a3;
    v5 = [U2HeadOutput alloc];
    objc_msgSend(v18, "featureValueForName:", CFSTR("top_arg_ids"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "multiArrayValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "featureValueForName:", CFSTR("arg_conf_scores"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "multiArrayValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "featureValueForName:", CFSTR("intent_scores"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "multiArrayValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "featureValueForName:", CFSTR("safety_head_scores"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "multiArrayValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[U2HeadOutput initWithTop_arg_ids:arg_conf_scores:intent_scores:safety_head_scores:](v5, "initWithTop_arg_ids:arg_conf_scores:intent_scores:safety_head_scores:", v7, v9, v11, v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void (**)(uint64_t, _QWORD, U2HeadOutput *))(v15 + 16);
    v14 = a3;
    v16(v15, 0, v14);
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
  -[U2Head model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__U2Head_predictionFromFeatures_options_completionHandler___block_invoke;
  v13[3] = &unk_2515EC2E8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "predictionFromFeatures:options:completionHandler:", v10, v9, v13);

}

void __59__U2Head_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  U2HeadOutput *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  U2HeadOutput *v14;
  uint64_t v15;
  void (*v16)(uint64_t, _QWORD, U2HeadOutput *);
  id v17;
  id v18;

  v18 = a2;
  if (v18)
  {
    v17 = a3;
    v5 = [U2HeadOutput alloc];
    objc_msgSend(v18, "featureValueForName:", CFSTR("top_arg_ids"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "multiArrayValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "featureValueForName:", CFSTR("arg_conf_scores"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "multiArrayValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "featureValueForName:", CFSTR("intent_scores"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "multiArrayValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "featureValueForName:", CFSTR("safety_head_scores"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "multiArrayValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[U2HeadOutput initWithTop_arg_ids:arg_conf_scores:intent_scores:safety_head_scores:](v5, "initWithTop_arg_ids:arg_conf_scores:intent_scores:safety_head_scores:", v7, v9, v11, v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void (**)(uint64_t, _QWORD, U2HeadOutput *))(v15 + 16);
    v14 = a3;
    v16(v15, 0, v14);
  }

}

- (id)predictionFromInput_mask:(id)a3 input_span_features:(id)a4 sequence_output:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  U2HeadInput *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[U2HeadInput initWithInput_mask:input_span_features:sequence_output:]([U2HeadInput alloc], "initWithInput_mask:input_span_features:sequence_output:", v12, v11, v10);

  -[U2Head predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
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
  U2HeadOutput *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  U2HeadOutput *v24;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF60]), "initWithFeatureProviderArray:", v8);
  -[U2Head model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictionsFromBatch:options:error:", v10, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") >= 1)
    {
      v26 = v10;
      v27 = v9;
      v28 = v8;
      v29 = v13;
      v14 = 0;
      v30 = v12;
      do
      {
        objc_msgSend(v12, "featuresAtIndex:", v14, v26, v27, v28);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = [U2HeadOutput alloc];
        objc_msgSend(v15, "featureValueForName:", CFSTR("top_arg_ids"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "multiArrayValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("arg_conf_scores"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "multiArrayValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("intent_scores"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "multiArrayValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("safety_head_scores"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "multiArrayValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[U2HeadOutput initWithTop_arg_ids:arg_conf_scores:intent_scores:safety_head_scores:](v16, "initWithTop_arg_ids:arg_conf_scores:intent_scores:safety_head_scores:", v17, v19, v21, v23);

        v13 = v29;
        v12 = v30;

        objc_msgSend(v29, "addObject:", v24);
        ++v14;
      }
      while (v14 < objc_msgSend(v30, "count"));
      v9 = v27;
      v8 = v28;
      v10 = v26;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

+ (void)URLOfModelInThisBundle
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_244EAA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not load U2Head.mlmodelc in the bundle resource", v0, 2u);
}

@end
