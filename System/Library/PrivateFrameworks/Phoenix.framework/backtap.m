@implementation backtap

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
  v9[0] = (id)objc_msgSend(v5, "pathForResource:ofType:", CFSTR("backtap"), CFSTR("mlmodelc"));

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
      _os_log_error_impl(&dword_228CDB000, log, type, "Could not load backtap.mlmodelc in the bundle resource", v6, 2u);
    }
    objc_storeStrong(&location, 0);
    v10 = 0;
  }
  objc_storeStrong(v9, 0);
  return v10;
}

- (backtap)initWithMLModel:(id)a3
{
  id v3;
  objc_super v5;
  int v6;
  id location[2];
  id v8;
  backtap *v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v3 = v8;
    v8 = 0;
    v5.receiver = v3;
    v5.super_class = (Class)backtap;
    v8 = -[backtap init](&v5, sel_init);
    objc_storeStrong(&v8, v8);
    if (v8)
      objc_storeStrong((id *)v8 + 1, location[0]);
    v9 = (backtap *)v8;
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

- (backtap)init
{
  id v4;
  backtap *v5;
  backtap *v6;

  v6 = self;
  v4 = (id)objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v6 = 0;
  v6 = -[backtap initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:");
  v5 = v6;

  objc_storeStrong((id *)&v6, 0);
  return v5;
}

- (backtap)initWithConfiguration:(id)a3 error:(id *)a4
{
  backtap *v5;
  id v6;
  backtap *v7;
  id location[2];
  backtap *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = v9;
  v6 = (id)objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v9 = 0;
  v9 = -[backtap initWithContentsOfURL:configuration:error:](v5, "initWithContentsOfURL:configuration:error:");
  v7 = v9;

  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v7;
}

- (backtap)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v4;
  id v7[2];
  id location[2];
  id v9;
  backtap *v10;

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
    v10 = (backtap *)v9;
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

- (backtap)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v5;
  id v9[2];
  id v10;
  id location[2];
  id v12;
  backtap *v13;

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
    v13 = (backtap *)v12;
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
  v13 = __61__backtap_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v14 = &unk_24F18F8E8;
  v15 = v16;
  objc_msgSend(v9, "loadContentsOfURL:configuration:completionHandler:", v7, v8);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v5;
  backtap *v6;
  id v7;
  id v8;
  id location[2];
  backtap *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = v10;
  v5 = location[0];
  v7 = objc_alloc_init(MEMORY[0x24BDC0018]);
  v8 = -[backtap predictionFromFeatures:options:error:](v6, "predictionFromFeatures:options:error:", v5);

  objc_storeStrong(location, 0);
  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  backtapOutput *v6;
  id v7;
  id v8;
  MLModel *v11;
  id v12[2];
  id v13;
  id location[2];
  backtap *v15;
  backtapOutput *v16;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12[1] = a5;
  v11 = -[backtap model](v15, "model");
  v12[0] = -[MLModel predictionFromFeatures:options:error:](v11, "predictionFromFeatures:options:error:", location[0], v13, a5);

  if (v12[0])
  {
    v6 = [backtapOutput alloc];
    v8 = (id)objc_msgSend(v12[0], "featureValueForName:", CFSTR("model_output"));
    v7 = (id)objc_msgSend(v8, "multiArrayValue");
    v16 = -[backtapOutput initWithModel_output:](v6, "initWithModel_output:");

  }
  else
  {
    v16 = 0;
  }
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v16;
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
  backtap *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v6 = -[backtap model](v15, "model");
  v5 = location[0];
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __52__backtap_predictionFromFeatures_completionHandler___block_invoke;
  v11 = &unk_24F18F910;
  v12 = v13;
  -[MLModel predictionFromFeatures:completionHandler:](v6, "predictionFromFeatures:completionHandler:", v5);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
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
  backtap *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v9 = -[backtap model](v19, "model");
  v7 = location[0];
  v8 = v17;
  v10 = MEMORY[0x24BDAC760];
  v11 = -1073741824;
  v12 = 0;
  v13 = __60__backtap_predictionFromFeatures_options_completionHandler___block_invoke;
  v14 = &unk_24F18F910;
  v15 = v16;
  -[MLModel predictionFromFeatures:options:completionHandler:](v9, "predictionFromFeatures:options:completionHandler:", v7, v8);

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (id)predictionFromModel_input:(id)a3 error:(id *)a4
{
  backtapInput *v4;
  id v7;
  id v8[2];
  id location[2];
  backtap *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8[1] = a4;
  v4 = [backtapInput alloc];
  v8[0] = -[backtapInput initWithModel_input:](v4, "initWithModel_input:", location[0]);
  v7 = -[backtap predictionFromFeatures:error:](v10, "predictionFromFeatures:error:", v8[0], a4);
  objc_storeStrong(v8, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v5;
  backtapOutput *v7;
  id v8;
  id v9;
  uint64_t v10;
  MLModel *v13;
  backtapOutput *v14;
  id v15;
  uint64_t i;
  id v17;
  int v18;
  id v19;
  id v20[2];
  id v21;
  id location[2];
  backtap *v23;
  id v24;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v20[1] = a5;
  v5 = objc_alloc(MEMORY[0x24BDBFF60]);
  v20[0] = (id)objc_msgSend(v5, "initWithFeatureProviderArray:", location[0]);
  v13 = -[backtap model](v23, "model");
  v19 = -[MLModel predictionsFromBatch:options:error:](v13, "predictionsFromBatch:options:error:", v20[0], v21, a5);

  if (v19)
  {
    v17 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
    for (i = 0; ; ++i)
    {
      v10 = i;
      if (v10 >= objc_msgSend(v19, "count"))
        break;
      v15 = (id)objc_msgSend(v19, "featuresAtIndex:", i);
      v7 = [backtapOutput alloc];
      v9 = (id)objc_msgSend(v15, "featureValueForName:", CFSTR("model_output"));
      v8 = (id)objc_msgSend(v9, "multiArrayValue");
      v14 = -[backtapOutput initWithModel_output:](v7, "initWithModel_output:");

      objc_msgSend(v17, "addObject:", v14);
      objc_storeStrong((id *)&v14, 0);
      objc_storeStrong(&v15, 0);
    }
    v24 = v17;
    v18 = 1;
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v24 = 0;
    v18 = 1;
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v24;
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
