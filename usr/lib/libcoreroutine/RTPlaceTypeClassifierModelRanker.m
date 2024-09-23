@implementation RTPlaceTypeClassifierModelRanker

+ (id)URLOfModelInThisBundle
{
  void *v2;
  void *v3;
  void *v4;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("RTPlaceTypeClassifierModelRanker"), CFSTR("mlmodelc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not load RTPlaceTypeClassifierModelRanker.mlmodelc in the bundle resource", v6, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (RTPlaceTypeClassifierModelRanker)initWithMLModel:(id)a3
{
  id v5;
  RTPlaceTypeClassifierModelRanker *v6;
  RTPlaceTypeClassifierModelRanker *v7;
  RTPlaceTypeClassifierModelRanker *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTPlaceTypeClassifierModelRanker;
  v6 = -[RTPlaceTypeClassifierModelRanker init](&v10, sel_init);
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_model, a3), v7->_model))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (RTPlaceTypeClassifierModelRanker)init
{
  void *v3;
  RTPlaceTypeClassifierModelRanker *v4;

  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RTPlaceTypeClassifierModelRanker initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v3, 0);

  return v4;
}

- (RTPlaceTypeClassifierModelRanker)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  RTPlaceTypeClassifierModelRanker *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RTPlaceTypeClassifierModelRanker initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v7, v6, a4);

  return v8;
}

- (RTPlaceTypeClassifierModelRanker)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  RTPlaceTypeClassifierModelRanker *v6;

  objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[RTPlaceTypeClassifierModelRanker initWithMLModel:](self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (RTPlaceTypeClassifierModelRanker)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  RTPlaceTypeClassifierModelRanker *v7;

  objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[RTPlaceTypeClassifierModelRanker initWithMLModel:](self, "initWithMLModel:", v6);
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
  v10[2] = __86__RTPlaceTypeClassifierModelRanker_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v10[3] = &unk_1E929B510;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "loadContentsOfURL:configuration:completionHandler:", a3, a4, v10);

}

void __86__RTPlaceTypeClassifierModelRanker_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  RTPlaceTypeClassifierModelRanker *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[RTPlaceTypeClassifierModelRanker initWithMLModel:]([RTPlaceTypeClassifierModelRanker alloc], "initWithMLModel:", v4);
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

  v6 = (objc_class *)MEMORY[0x1E0C9E9B0];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  -[RTPlaceTypeClassifierModelRanker predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  RTPlaceTypeClassifierModelRankerOutput *v12;
  void *v13;
  RTPlaceTypeClassifierModelRankerOutput *v14;

  v8 = a4;
  v9 = a3;
  -[RTPlaceTypeClassifierModelRanker model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [RTPlaceTypeClassifierModelRankerOutput alloc];
    objc_msgSend(v11, "featureValueForName:", CFSTR("target"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v14 = -[RTPlaceTypeClassifierModelRankerOutput initWithTarget:](v12, "initWithTarget:");

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)predictionFromMean_daily_longest_charging_duration_bucketed:(double)a3 mean_daily_longest_screen_lock_duration_bucketed:(double)a4 mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:(double)a5 mean_daily_total_charging_duration_bucketed:(double)a6 mean_daily_total_screen_lock_duration_bucketed:(double)a7 mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed:(double)a8 mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed:(double)a9 median_daily_longest_charging_duration_bucketed:(double)a10 median_daily_longest_screen_lock_duration_bucketed:(double)a11 median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:(double)a12 median_daily_total_charging_duration_bucketed:(double)a13 median_daily_total_screen_lock_duration_bucketed:(double)a14 median_daily_total_uninterrupted_WiFi_connection_duration_bucketed:(double)a15 percentage_of_days_with_charging_bucketed:(double)a16 percentage_of_days_with_screen_lock_bucketed:(double)a17 percentage_of_days_with_uninterrupted_WiFi_connection_bucketed:(double)a18 is_iPhone:(double)a19 is_iPad:(double)a20 is_Watch:(double)a21 error:(id *)a22
{
  RTPlaceTypeClassifierModelRankerInput *v24;
  void *v25;

  v24 = -[RTPlaceTypeClassifierModelRankerInput initWithMean_daily_longest_charging_duration_bucketed:mean_daily_longest_screen_lock_duration_bucketed:mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_total_charging_duration_bucketed:mean_daily_total_screen_lock_duration_bucketed:mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed:median_daily_longest_charging_duration_bucketed:median_daily_longest_screen_lock_duration_bucketed:median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:median_daily_total_charging_duration_bucketed:median_daily_total_screen_lock_duration_bucketed:median_daily_total_uninterrupted_WiFi_connection_duration_bucketed:percentage_of_days_with_charging_bucketed:percentage_of_days_with_screen_lock_bucketed:percentage_of_days_with_uninterrupted_WiFi_connection_bucketed:is_iPhone:is_iPad:is_Watch:]([RTPlaceTypeClassifierModelRankerInput alloc], "initWithMean_daily_longest_charging_duration_bucketed:mean_daily_longest_screen_lock_duration_bucketed:mean_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_total_charging_duration_bucketed:mean_daily_total_screen_lock_duration_bucketed:mean_daily_total_uninterrupted_WiFi_connection_duration_bucketed:mean_daily_uninterrupted_WiFi_connection_stability_ratio_bucketed:median_daily_longest_charging_duration_bucketed:median_daily_longest_screen_lock_duration_bucketed:median_daily_longest_uninterrupted_WiFi_connection_duration_bucketed:median_daily_total_charging_duration_bucketed:median_daily_total_screen_lock_duration_bucketed:median_daily_total_uninterrupted_WiFi_connection_duration_bucketed:percentage_of_days_with_charging_bucketed:percentage_of_days_with_screen_lock_bucketed:percentage_of_days_with_uninterrupted_WiFi_connection_bucketed:is_iPhone:is_iPad:is_Watch:", a3, a4, a5, a6, a7, a8, a9, a10, *(_QWORD *)&a11,
          *(_QWORD *)&a12,
          *(_QWORD *)&a13,
          *(_QWORD *)&a14,
          *(_QWORD *)&a15,
          *(_QWORD *)&a16,
          *(_QWORD *)&a17,
          *(_QWORD *)&a18,
          *(_QWORD *)&a19,
          *(_QWORD *)&a20,
          *(_QWORD *)&a21);
  -[RTPlaceTypeClassifierModelRanker predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v24, a22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
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
  RTPlaceTypeClassifierModelRankerOutput *v16;
  void *v17;
  RTPlaceTypeClassifierModelRankerOutput *v18;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8E0]), "initWithFeatureProviderArray:", v8);
  -[RTPlaceTypeClassifierModelRanker model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictionsFromBatch:options:error:", v10, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") >= 1)
    {
      v14 = 0;
      do
      {
        objc_msgSend(v12, "featuresAtIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = [RTPlaceTypeClassifierModelRankerOutput alloc];
        objc_msgSend(v15, "featureValueForName:", CFSTR("target"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v18 = -[RTPlaceTypeClassifierModelRankerOutput initWithTarget:](v16, "initWithTarget:");

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

@end
