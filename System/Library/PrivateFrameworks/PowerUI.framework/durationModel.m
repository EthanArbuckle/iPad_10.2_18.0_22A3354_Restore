@implementation durationModel

+ (id)URLOfModelInThisBundle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("durationModel"), CFSTR("mlmodelc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[durationModel URLOfModelInThisBundle].cold.1();
    v4 = 0;
  }

  return v4;
}

- (durationModel)initWithMLModel:(id)a3
{
  id v5;
  durationModel *v6;
  durationModel *v7;
  durationModel *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)durationModel;
    v6 = -[durationModel init](&v10, sel_init);
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

- (durationModel)init
{
  void *v3;
  durationModel *v4;

  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[durationModel initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v3, 0);

  return v4;
}

- (durationModel)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  durationModel *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[durationModel initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v7, v6, a4);

  return v8;
}

- (durationModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  durationModel *v6;

  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[durationModel initWithMLModel:](self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (durationModel)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  durationModel *v7;

  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[durationModel initWithMLModel:](self, "initWithMLModel:", v6);
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
  v10[2] = __67__durationModel_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v10[3] = &unk_24D3FCFF0;
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

  v6 = (objc_class *)MEMORY[0x24BDC0018];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  -[durationModel predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  durationModelOutput *v12;
  void *v13;
  durationModelOutput *v14;

  v8 = a4;
  v9 = a3;
  -[durationModel model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [durationModelOutput alloc];
    objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v14 = -[durationModelOutput initWithDuration_pred:](v12, "initWithDuration_pred:");

  }
  else
  {
    v14 = 0;
  }

  return v14;
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
  -[durationModel model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__durationModel_predictionFromFeatures_completionHandler___block_invoke;
  v10[3] = &unk_24D3FD018;
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
  -[durationModel model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__durationModel_predictionFromFeatures_options_completionHandler___block_invoke;
  v13[3] = &unk_24D3FD018;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "predictionFromFeatures:options:completionHandler:", v10, v9, v13);

}

- (id)predictionFromPlugin_battery_level:(double)a3 time_from_plugin:(double)a4 med_dur_1:(double)a5 med_dur_2:(double)a6 med_dur_4:(double)a7 med_dur_8:(double)a8 med_dur_16:(double)a9 med_dur_24:(double)a10 cnt_dur_1:(double)a11 cnt_dur_2:(double)a12 cnt_dur_4:(double)a13 cnt_dur_8:(double)a14 cnt_dur_16:(double)a15 cnt_dur_24:(double)a16 std_dur_1:(double)a17 std_dur_2:(double)a18 std_dur_4:(double)a19 std_dur_8:(double)a20 std_dur_16:(double)a21 std_dur_24:(double)a22 weekday_med_dur_1:(double)a23 weekday_med_dur_2:(double)a24 weekday_med_dur_4:(double)a25 weekday_med_dur_8:(double)a26 weekday_med_dur_24:(double)a27 weekday_std_dur_4:(double)a28 error:(id *)a29
{
  durationModelInput *v31;
  void *v32;

  v31 = -[durationModelInput initWithPlugin_battery_level:time_from_plugin:med_dur_1:med_dur_2:med_dur_4:med_dur_8:med_dur_16:med_dur_24:cnt_dur_1:cnt_dur_2:cnt_dur_4:cnt_dur_8:cnt_dur_16:cnt_dur_24:std_dur_1:std_dur_2:std_dur_4:std_dur_8:std_dur_16:std_dur_24:weekday_med_dur_1:weekday_med_dur_2:weekday_med_dur_4:weekday_med_dur_8:weekday_med_dur_24:weekday_std_dur_4:]([durationModelInput alloc], "initWithPlugin_battery_level:time_from_plugin:med_dur_1:med_dur_2:med_dur_4:med_dur_8:med_dur_16:med_dur_24:cnt_dur_1:cnt_dur_2:cnt_dur_4:cnt_dur_8:cnt_dur_16:cnt_dur_24:std_dur_1:std_dur_2:std_dur_4:std_dur_8:std_dur_16:std_dur_24:weekday_med_dur_1:weekday_med_dur_2:weekday_med_dur_4:weekday_med_dur_8:weekday_med_dur_24:weekday_std_dur_4:", a3, a4, a5, a6, a7, a8, a9, a10, *(_QWORD *)&a11, *(_QWORD *)&a12, *(_QWORD *)&a13, *(_QWORD *)&a14, *(_QWORD *)&a15, *(_QWORD *)&a16, *(_QWORD *)&a17,
          *(_QWORD *)&a18,
          *(_QWORD *)&a19,
          *(_QWORD *)&a20,
          *(_QWORD *)&a21,
          *(_QWORD *)&a22,
          *(_QWORD *)&a23,
          *(_QWORD *)&a24,
          *(_QWORD *)&a25,
          *(_QWORD *)&a26,
          *(_QWORD *)&a27,
          *(_QWORD *)&a28);
  -[durationModel predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v31, a29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
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
  durationModelOutput *v16;
  void *v17;
  durationModelOutput *v18;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF60]), "initWithFeatureProviderArray:", v8);
  -[durationModel model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictionsFromBatch:options:error:", v10, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") >= 1)
    {
      v14 = 0;
      do
      {
        objc_msgSend(v12, "featuresAtIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = [durationModelOutput alloc];
        objc_msgSend(v15, "featureValueForName:", CFSTR("duration_pred"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v18 = -[durationModelOutput initWithDuration_pred:](v16, "initWithDuration_pred:");

        objc_msgSend(v13, "addObject:", v18);
        ++v14;
      }
      while (v14 < objc_msgSend(v12, "count"));
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
  _os_log_error_impl(&dword_215A71000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not load durationModel.mlmodelc in the bundle resource", v0, 2u);
}

@end
