@implementation BackTapRNN

+ (id)URLOfModelInThisBundle
{
  NSObject *log;
  os_log_type_t type;
  id v5;
  uint8_t v6[7];
  char v7;
  id location;
  id v9[3];
  id v10;

  v9[2] = a1;
  v9[1] = (id)a2;
  v5 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9[0] = (id)objc_msgSend(v5, "pathForResource:ofType:", CFSTR("BackTapRNN"), CFSTR("mlmodelc"));

  if (v9[0])
  {
    v10 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v9[0]);
  }
  else
  {
    location = MEMORY[0x24BDACB70];
    v7 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = location;
      type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_error_impl(&dword_228CDB000, log, type, "Could not load BackTapRNN.mlmodelc in the bundle resource", v6, 2u);
    }
    objc_storeStrong(&location, 0);
    v10 = 0;
  }
  objc_storeStrong(v9, 0);
  return v10;
}

- (BackTapRNN)initWithMLModel:(id)a3
{
  id v3;
  objc_super v5;
  int v6;
  id location[2];
  id v8;
  BackTapRNN *v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v3 = v8;
    v8 = 0;
    v5.receiver = v3;
    v5.super_class = (Class)BackTapRNN;
    v8 = -[BackTapRNN init](&v5, sel_init);
    objc_storeStrong(&v8, v8);
    if (v8)
      objc_storeStrong((id *)v8 + 1, location[0]);
    v9 = (BackTapRNN *)v8;
    v6 = 1;
  }
  else
  {
    v9 = 0;
    v6 = 1;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v9;
}

- (BackTapRNN)init
{
  id v4;
  BackTapRNN *v5;
  BackTapRNN *v6;

  v6 = self;
  v4 = (id)objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v6 = 0;
  v6 = -[BackTapRNN initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:");
  v5 = v6;

  objc_storeStrong((id *)&v6, 0);
  return v5;
}

- (BackTapRNN)initWithConfiguration:(id)a3 error:(id *)a4
{
  BackTapRNN *v5;
  id v6;
  BackTapRNN *v7;
  id location[2];
  BackTapRNN *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = v9;
  v6 = (id)objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v9 = 0;
  v9 = -[BackTapRNN initWithContentsOfURL:configuration:error:](v5, "initWithContentsOfURL:configuration:error:");
  v7 = v9;

  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v7;
}

- (BackTapRNN)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v4;
  id v7[2];
  id location[2];
  id v9;
  BackTapRNN *v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = a4;
  v7[0] = (id)objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", location[0], a4);
  if (v7[0])
  {
    v4 = v9;
    v9 = 0;
    v9 = (id)objc_msgSend(v4, "initWithMLModel:", v7[0]);
    v10 = (BackTapRNN *)v9;
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v9, 0);
  return v10;
}

- (BackTapRNN)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v5;
  id v9[2];
  id v10;
  id location[2];
  id v12;
  BackTapRNN *v13;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9[1] = a5;
  v9[0] = (id)objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", location[0], v10, a5);
  if (v9[0])
  {
    v5 = v12;
    v12 = 0;
    v12 = (id)objc_msgSend(v5, "initWithMLModel:", v9[0]);
    v13 = (BackTapRNN *)v12;
  }
  else
  {
    v13 = 0;
  }
  objc_storeStrong(v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v13;
}

+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id location[2];
  id v9;

  v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = v9;
  v6 = (id)objc_msgSend(v9, "URLOfModelInThisBundle");
  objc_msgSend(v5, "loadContentsOfURL:configuration:completionHandler:");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(_QWORD *, void *, void *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v9 = (void *)MEMORY[0x24BDBFFC8];
  v7 = location[0];
  v8 = v17;
  v10 = MEMORY[0x24BDAC760];
  v11 = -1073741824;
  v12 = 0;
  v13 = __64__BackTapRNN_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v14 = &unk_24F18F8E8;
  v15 = v16;
  objc_msgSend(v9, "loadContentsOfURL:configuration:completionHandler:", v7, v8);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __64__BackTapRNN_loadContentsOfURL_configuration_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  BackTapRNN *v3;
  id v6[2];
  id v7;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = 0;
  objc_storeStrong(&v7, a3);
  v6[1] = a1;
  if (location[0])
  {
    v3 = [BackTapRNN alloc];
    v6[0] = -[BackTapRNN initWithMLModel:](v3, "initWithMLModel:", location[0]);
    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong(v6, 0);
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v5;
  BackTapRNN *v6;
  id v7;
  id v8;
  id location[2];
  BackTapRNN *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = v10;
  v5 = location[0];
  v7 = objc_alloc_init(MEMORY[0x24BDC0018]);
  v8 = -[BackTapRNN predictionFromFeatures:options:error:](v6, "predictionFromFeatures:options:error:", v5);

  objc_storeStrong(location, 0);
  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  BackTapRNNOutput *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  MLModel *v13;
  id v14[2];
  id v15;
  id location[2];
  BackTapRNN *v17;
  BackTapRNNOutput *v18;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14[1] = a5;
  v13 = -[BackTapRNN model](v17, "model");
  v14[0] = -[MLModel predictionFromFeatures:options:error:](v13, "predictionFromFeatures:options:error:", location[0], v15, a5);

  if (v14[0])
  {
    v6 = [BackTapRNNOutput alloc];
    v10 = (id)objc_msgSend(v14[0], "featureValueForName:", CFSTR("output"));
    v9 = (id)objc_msgSend(v10, "multiArrayValue");
    v8 = (id)objc_msgSend(v14[0], "featureValueForName:", CFSTR("updated_history"));
    v7 = (id)objc_msgSend(v8, "multiArrayValue");
    v18 = -[BackTapRNNOutput initWithOutput:updated_history:](v6, "initWithOutput:updated_history:", v9);

  }
  else
  {
    v18 = 0;
  }
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v18;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v5;
  MLModel *v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(_QWORD *, void *, void *);
  void *v11;
  id v12;
  id v13;
  id location[2];
  BackTapRNN *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v6 = -[BackTapRNN model](v15, "model");
  v5 = location[0];
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __55__BackTapRNN_predictionFromFeatures_completionHandler___block_invoke;
  v11 = &unk_24F18F910;
  v12 = v13;
  -[MLModel predictionFromFeatures:completionHandler:](v6, "predictionFromFeatures:completionHandler:", v5);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __55__BackTapRNN_predictionFromFeatures_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  BackTapRNNOutput *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v10[2];
  id v11;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11 = 0;
  objc_storeStrong(&v11, a3);
  v10[1] = a1;
  if (location[0])
  {
    v3 = [BackTapRNNOutput alloc];
    v7 = (id)objc_msgSend(location[0], "featureValueForName:", CFSTR("output"));
    v6 = (id)objc_msgSend(v7, "multiArrayValue");
    v5 = (id)objc_msgSend(location[0], "featureValueForName:", CFSTR("updated_history"));
    v4 = (id)objc_msgSend(v5, "multiArrayValue");
    v10[0] = -[BackTapRNNOutput initWithOutput:updated_history:](v3, "initWithOutput:updated_history:", v6);

    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong(v10, 0);
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  MLModel *v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(_QWORD *, void *, void *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id location[2];
  BackTapRNN *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v9 = -[BackTapRNN model](v19, "model");
  v7 = location[0];
  v8 = v17;
  v10 = MEMORY[0x24BDAC760];
  v11 = -1073741824;
  v12 = 0;
  v13 = __63__BackTapRNN_predictionFromFeatures_options_completionHandler___block_invoke;
  v14 = &unk_24F18F910;
  v15 = v16;
  -[MLModel predictionFromFeatures:options:completionHandler:](v9, "predictionFromFeatures:options:completionHandler:", v7, v8);

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __63__BackTapRNN_predictionFromFeatures_options_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  BackTapRNNOutput *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v10[2];
  id v11;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11 = 0;
  objc_storeStrong(&v11, a3);
  v10[1] = a1;
  if (location[0])
  {
    v3 = [BackTapRNNOutput alloc];
    v7 = (id)objc_msgSend(location[0], "featureValueForName:", CFSTR("output"));
    v6 = (id)objc_msgSend(v7, "multiArrayValue");
    v5 = (id)objc_msgSend(location[0], "featureValueForName:", CFSTR("updated_history"));
    v4 = (id)objc_msgSend(v5, "multiArrayValue");
    v10[0] = -[BackTapRNNOutput initWithOutput:updated_history:](v3, "initWithOutput:updated_history:", v6);

    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong(v10, 0);
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (id)predictionFromModel_input:(id)a3 history:(id)a4 error:(id *)a5
{
  BackTapRNNInput *v5;
  id v9;
  id v10[2];
  id v11;
  id location[2];
  BackTapRNN *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10[1] = a5;
  v5 = [BackTapRNNInput alloc];
  v10[0] = -[BackTapRNNInput initWithModel_input:history:](v5, "initWithModel_input:history:", location[0], v11);
  v9 = -[BackTapRNN predictionFromFeatures:error:](v13, "predictionFromFeatures:error:", v10[0], a5);
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v5;
  BackTapRNNOutput *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  MLModel *v15;
  BackTapRNNOutput *v16;
  id v17;
  uint64_t i;
  id v19;
  int v20;
  id v21;
  id v22[2];
  id v23;
  id location[2];
  BackTapRNN *v25;
  id v26;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22[1] = a5;
  v5 = objc_alloc(MEMORY[0x24BDBFF60]);
  v22[0] = (id)objc_msgSend(v5, "initWithFeatureProviderArray:", location[0]);
  v15 = -[BackTapRNN model](v25, "model");
  v21 = -[MLModel predictionsFromBatch:options:error:](v15, "predictionsFromBatch:options:error:", v22[0], v23, a5);

  if (v21)
  {
    v19 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    for (i = 0; ; ++i)
    {
      v12 = i;
      if (v12 >= objc_msgSend(v21, "count"))
        break;
      v17 = (id)objc_msgSend(v21, "featuresAtIndex:", i);
      v7 = [BackTapRNNOutput alloc];
      v11 = (id)objc_msgSend(v17, "featureValueForName:", CFSTR("output"));
      v10 = (id)objc_msgSend(v11, "multiArrayValue");
      v9 = (id)objc_msgSend(v17, "featureValueForName:", CFSTR("updated_history"));
      v8 = (id)objc_msgSend(v9, "multiArrayValue");
      v16 = -[BackTapRNNOutput initWithOutput:updated_history:](v7, "initWithOutput:updated_history:", v10);

      objc_msgSend(v19, "addObject:", v16);
      objc_storeStrong((id *)&v16, 0);
      objc_storeStrong(&v17, 0);
    }
    v26 = v19;
    v20 = 1;
    objc_storeStrong(&v19, 0);
  }
  else
  {
    v26 = 0;
    v20 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  return v26;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
