@implementation _OSHighBatteryDrainHighChargeDurationModel

+ (id)URLOfModelInThisBundle
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("_OSHighBatteryDrainHighChargeDurationModel"), CFSTR("mlmodelc")));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10003FEFC();
    v5 = 0;
  }

  return v5;
}

- (_OSHighBatteryDrainHighChargeDurationModel)initWithMLModel:(id)a3
{
  id v5;
  _OSHighBatteryDrainHighChargeDurationModel *v6;
  _OSHighBatteryDrainHighChargeDurationModel *v7;
  _OSHighBatteryDrainHighChargeDurationModel *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)_OSHighBatteryDrainHighChargeDurationModel;
    v6 = -[_OSHighBatteryDrainHighChargeDurationModel init](&v10, "init");
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

- (_OSHighBatteryDrainHighChargeDurationModel)init
{
  id v3;
  void *v4;
  _OSHighBatteryDrainHighChargeDurationModel *v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[_OSHighBatteryDrainHighChargeDurationModel initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v4, 0);

  return v5;
}

- (_OSHighBatteryDrainHighChargeDurationModel)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _OSHighBatteryDrainHighChargeDurationModel *v9;

  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[_OSHighBatteryDrainHighChargeDurationModel initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v8, v6, a4);

  return v9;
}

- (_OSHighBatteryDrainHighChargeDurationModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  _OSHighBatteryDrainHighChargeDurationModel *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", a3, a4));
  if (v5)
  {
    self = -[_OSHighBatteryDrainHighChargeDurationModel initWithMLModel:](self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_OSHighBatteryDrainHighChargeDurationModel)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  _OSHighBatteryDrainHighChargeDurationModel *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:configuration:error:](MLModel, "modelWithContentsOfURL:configuration:error:", a3, a4, a5));
  if (v6)
  {
    self = -[_OSHighBatteryDrainHighChargeDurationModel initWithMLModel:](self, "initWithMLModel:", v6);
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
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "URLOfModelInThisBundle"));
  objc_msgSend(a1, "loadContentsOfURL:configuration:completionHandler:", v8, v7, v6);

}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v7;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100030FB0;
  v8[3] = &unk_1000612D0;
  v9 = a5;
  v7 = v9;
  +[MLModel loadContentsOfURL:configuration:completionHandler:](MLModel, "loadContentsOfURL:configuration:completionHandler:", a3, a4, v8);

}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init((Class)MLPredictionOptions);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_OSHighBatteryDrainHighChargeDurationModel predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v6, v7, a4));

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _OSHighBatteryDrainHighChargeDurationModelOutput *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _OSHighBatteryDrainHighChargeDurationModelOutput *v17;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_OSHighBatteryDrainHighChargeDurationModel model](self, "model"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v8, a5));

  if (v11)
  {
    v12 = [_OSHighBatteryDrainHighChargeDurationModelOutput alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("label")));
    v14 = objc_msgSend(v13, "int64Value");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("classProbability")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dictionaryValue"));
    v17 = -[_OSHighBatteryDrainHighChargeDurationModelOutput initWithLabel:classProbability:](v12, "initWithLabel:classProbability:", v14, v16);

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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_OSHighBatteryDrainHighChargeDurationModel model](self, "model"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100031248;
  v10[3] = &unk_1000612F8;
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_OSHighBatteryDrainHighChargeDurationModel model](self, "model"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100031418;
  v13[3] = &unk_1000612F8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "predictionFromFeatures:options:completionHandler:", v10, v9, v13);

}

- (id)predictionFromActivity:(double)a3 n_events_prior:(double)a4 batt_weekday_percentile_prior:(double)a5 dist_from_total_mean:(double)a6 drain_since_last_plugin:(double)a7 max_batt_12:(double)a8 mean_activity:(double)a9 mean_daily_plugins:(double)a10 net_drain_since_max:(double)a11 recent_drain_1:(double)a12 recent_drain_15min:(double)a13 recent_drain_3:(double)a14 start_time_secs:(double)a15 user_mean_drain:(double)a16 value:(double)a17 error:(id *)a18
{
  _OSHighBatteryDrainHighChargeDurationModelInput *v20;
  void *v21;

  v20 = -[_OSHighBatteryDrainHighChargeDurationModelInput initWithActivity:n_events_prior:batt_weekday_percentile_prior:dist_from_total_mean:drain_since_last_plugin:max_batt_12:mean_activity:mean_daily_plugins:net_drain_since_max:recent_drain_1:recent_drain_15min:recent_drain_3:start_time_secs:user_mean_drain:value:]([_OSHighBatteryDrainHighChargeDurationModelInput alloc], "initWithActivity:n_events_prior:batt_weekday_percentile_prior:dist_from_total_mean:drain_since_last_plugin:max_batt_12:mean_activity:mean_daily_plugins:net_drain_since_max:recent_drain_1:recent_drain_15min:recent_drain_3:start_time_secs:user_mean_drain:value:", a3, a4, a5, a6, a7, a8, a9, a10, *(_QWORD *)&a11, *(_QWORD *)&a12, *(_QWORD *)&a13, *(_QWORD *)&a14, *(_QWORD *)&a15, *(_QWORD *)&a16, *(_QWORD *)&a17);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_OSHighBatteryDrainHighChargeDurationModel predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v20, a18));

  return v21;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _OSHighBatteryDrainHighChargeDurationModelOutput *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _OSHighBatteryDrainHighChargeDurationModelOutput *v21;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)MLArrayBatchProvider), "initWithFeatureProviderArray:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_OSHighBatteryDrainHighChargeDurationModel model](self, "model"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "predictionsFromBatch:options:error:", v10, v9, a5));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v12, "count")));
    if ((uint64_t)objc_msgSend(v12, "count") >= 1)
    {
      v23 = v10;
      v24 = v9;
      v25 = v8;
      v14 = 0;
      do
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "featuresAtIndex:", v14));
        v16 = [_OSHighBatteryDrainHighChargeDurationModelOutput alloc];
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "featureValueForName:", CFSTR("label")));
        v18 = objc_msgSend(v17, "int64Value");
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "featureValueForName:", CFSTR("classProbability")));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dictionaryValue"));
        v21 = -[_OSHighBatteryDrainHighChargeDurationModelOutput initWithLabel:classProbability:](v16, "initWithLabel:classProbability:", v18, v20);

        objc_msgSend(v13, "addObject:", v21);
        ++v14;
      }
      while (v14 < (uint64_t)objc_msgSend(v12, "count"));
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

@end
