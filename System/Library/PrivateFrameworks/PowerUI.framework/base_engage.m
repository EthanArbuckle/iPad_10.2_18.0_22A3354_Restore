@implementation base_engage

+ (id)URLOfModelInThisBundle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("base_engage"), CFSTR("mlmodelc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[base_engage URLOfModelInThisBundle].cold.1();
    v4 = 0;
  }

  return v4;
}

- (base_engage)initWithMLModel:(id)a3
{
  id v5;
  base_engage *v6;
  base_engage *v7;
  base_engage *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)base_engage;
    v6 = -[base_engage init](&v10, sel_init);
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

- (base_engage)init
{
  void *v3;
  base_engage *v4;

  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[base_engage initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v3, 0);

  return v4;
}

- (base_engage)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  base_engage *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[base_engage initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v7, v6, a4);

  return v8;
}

- (base_engage)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  base_engage *v6;

  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[base_engage initWithMLModel:](self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (base_engage)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  base_engage *v7;

  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[base_engage initWithMLModel:](self, "initWithMLModel:", v6);
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
  v10[2] = __65__base_engage_loadContentsOfURL_configuration_completionHandler___block_invoke;
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
  -[base_engage predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  base_engageOutput *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  base_engageOutput *v17;

  v8 = a4;
  v9 = a3;
  -[base_engage model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [base_engageOutput alloc];
    objc_msgSend(v11, "featureValueForName:", CFSTR("engage"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "int64Value");
    objc_msgSend(v11, "featureValueForName:", CFSTR("classProbability"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[base_engageOutput initWithEngage:classProbability:](v12, "initWithEngage:classProbability:", v14, v16);

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
  -[base_engage model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__base_engage_predictionFromFeatures_completionHandler___block_invoke;
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
  -[base_engage model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__base_engage_predictionFromFeatures_options_completionHandler___block_invoke;
  v13[3] = &unk_24D3FD018;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "predictionFromFeatures:options:completionHandler:", v10, v9, v13);

}

- (id)predictionFromClassic_time_between_uses_med_dur_1:(double)a3 classic_time_between_uses_med_dur_2:(double)a4 classic_time_between_uses_med_dur_4:(double)a5 classic_time_between_uses_med_dur_24:(double)a6 classic_time_between_uses_std_dur_1:(double)a7 classic_time_between_uses_std_dur_2:(double)a8 classic_time_between_uses_std_dur_4:(double)a9 classic_time_between_uses_std_dur_24:(double)a10 hour:(double)a11 is_weekend:(double)a12 hour_plus_0:(double)a13 hour_plus_1:(double)a14 hour_plus_2:(double)a15 hour_plus_3:(double)a16 hour_plus_4:(double)a17 hour_plus_5:(double)a18 hours_until_use:(double)a19 meaningful_undercharge_rolling_average:(double)a20 error:(id *)a21
{
  base_engageInput *v23;
  void *v24;

  v23 = -[base_engageInput initWithClassic_time_between_uses_med_dur_1:classic_time_between_uses_med_dur_2:classic_time_between_uses_med_dur_4:classic_time_between_uses_med_dur_24:classic_time_between_uses_std_dur_1:classic_time_between_uses_std_dur_2:classic_time_between_uses_std_dur_4:classic_time_between_uses_std_dur_24:hour:is_weekend:hour_plus_0:hour_plus_1:hour_plus_2:hour_plus_3:hour_plus_4:hour_plus_5:hours_until_use:meaningful_undercharge_rolling_average:]([base_engageInput alloc], "initWithClassic_time_between_uses_med_dur_1:classic_time_between_uses_med_dur_2:classic_time_between_uses_med_dur_4:classic_time_between_uses_med_dur_24:classic_time_between_uses_std_dur_1:classic_time_between_uses_std_dur_2:classic_time_between_uses_std_dur_4:classic_time_between_uses_std_dur_24:hour:is_weekend:hour_plus_0:hour_plus_1:hour_plus_2:hour_plus_3:hour_plus_4:hour_plus_5:hours_until_use:meaningful_undercharge_rolling_average:", a3, a4, a5, a6, a7, a8, a9, a10, *(_QWORD *)&a11, *(_QWORD *)&a12, *(_QWORD *)&a13, *(_QWORD *)&a14, *(_QWORD *)&a15, *(_QWORD *)&a16,
          *(_QWORD *)&a17,
          *(_QWORD *)&a18,
          *(_QWORD *)&a19,
          *(_QWORD *)&a20);
  -[base_engage predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v23, a21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
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
  base_engageOutput *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  base_engageOutput *v21;
  void *v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF60]), "initWithFeatureProviderArray:", v8);
  -[base_engage model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictionsFromBatch:options:error:", v10, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
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
        v16 = [base_engageOutput alloc];
        objc_msgSend(v15, "featureValueForName:", CFSTR("engage"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "int64Value");
        objc_msgSend(v15, "featureValueForName:", CFSTR("classProbability"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "dictionaryValue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[base_engageOutput initWithEngage:classProbability:](v16, "initWithEngage:classProbability:", v18, v20);

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
  _os_log_error_impl(&dword_215A71000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not load base_engage.mlmodelc in the bundle resource", v0, 2u);
}

@end
