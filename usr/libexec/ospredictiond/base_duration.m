@implementation base_duration

+ (id)URLOfModelInThisBundle
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("base_duration"), CFSTR("mlmodelc")));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10003FF84();
    v5 = 0;
  }

  return v5;
}

- (base_duration)initWithMLModel:(id)a3
{
  id v5;
  base_duration *v6;
  base_duration *v7;
  base_duration *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)base_duration;
    v6 = -[base_duration init](&v10, "init");
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

- (base_duration)init
{
  id v3;
  void *v4;
  base_duration *v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[base_duration initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v4, 0);

  return v5;
}

- (base_duration)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  base_duration *v9;

  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[base_duration initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v8, v6, a4);

  return v9;
}

- (base_duration)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  base_duration *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", a3, a4));
  if (v5)
  {
    self = -[base_duration initWithMLModel:](self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (base_duration)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  base_duration *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:configuration:error:](MLModel, "modelWithContentsOfURL:configuration:error:", a3, a4, a5));
  if (v6)
  {
    self = -[base_duration initWithMLModel:](self, "initWithMLModel:", v6);
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
  v8[2] = sub_100033314;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[base_duration predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v6, v7, a4));

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  base_durationOutput *v12;
  void *v13;
  base_durationOutput *v14;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[base_duration model](self, "model"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v8, a5));

  if (v11)
  {
    v12 = [base_durationOutput alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred")));
    objc_msgSend(v13, "doubleValue");
    v14 = -[base_durationOutput initWithDuration_pred:](v12, "initWithDuration_pred:");

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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[base_duration model](self, "model"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003356C;
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[base_duration model](self, "model"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000336F4;
  v13[3] = &unk_1000612F8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "predictionFromFeatures:options:completionHandler:", v10, v9, v13);

}

- (id)predictionFromClassic_time_between_uses_med_dur_1:(double)a3 classic_time_between_uses_med_dur_2:(double)a4 classic_time_between_uses_med_dur_4:(double)a5 classic_time_between_uses_med_dur_24:(double)a6 classic_time_between_uses_std_dur_1:(double)a7 classic_time_between_uses_std_dur_2:(double)a8 classic_time_between_uses_std_dur_4:(double)a9 classic_time_between_uses_std_dur_24:(double)a10 hour:(double)a11 is_weekend:(double)a12 hour_plus_0:(double)a13 hour_plus_1:(double)a14 hour_plus_2:(double)a15 hour_plus_3:(double)a16 hour_plus_4:(double)a17 hour_plus_5:(double)a18 hours_until_use:(double)a19 meaningful_undercharge_rolling_average:(double)a20 error:(id *)a21
{
  base_durationInput *v23;
  void *v24;

  v23 = -[base_durationInput initWithClassic_time_between_uses_med_dur_1:classic_time_between_uses_med_dur_2:classic_time_between_uses_med_dur_4:classic_time_between_uses_med_dur_24:classic_time_between_uses_std_dur_1:classic_time_between_uses_std_dur_2:classic_time_between_uses_std_dur_4:classic_time_between_uses_std_dur_24:hour:is_weekend:hour_plus_0:hour_plus_1:hour_plus_2:hour_plus_3:hour_plus_4:hour_plus_5:hours_until_use:meaningful_undercharge_rolling_average:]([base_durationInput alloc], "initWithClassic_time_between_uses_med_dur_1:classic_time_between_uses_med_dur_2:classic_time_between_uses_med_dur_4:classic_time_between_uses_med_dur_24:classic_time_between_uses_std_dur_1:classic_time_between_uses_std_dur_2:classic_time_between_uses_std_dur_4:classic_time_between_uses_std_dur_24:hour:is_weekend:hour_plus_0:hour_plus_1:hour_plus_2:hour_plus_3:hour_plus_4:hour_plus_5:hours_until_use:meaningful_undercharge_rolling_average:", a3, a4, a5, a6, a7, a8, a9, a10, *(_QWORD *)&a11, *(_QWORD *)&a12, *(_QWORD *)&a13, *(_QWORD *)&a14, *(_QWORD *)&a15, *(_QWORD *)&a16,
          *(_QWORD *)&a17,
          *(_QWORD *)&a18,
          *(_QWORD *)&a19,
          *(_QWORD *)&a20);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[base_duration predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v23, a21));

  return v24;
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
  base_durationOutput *v16;
  void *v17;
  base_durationOutput *v18;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)MLArrayBatchProvider), "initWithFeatureProviderArray:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[base_duration model](self, "model"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "predictionsFromBatch:options:error:", v10, v9, a5));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v12, "count")));
    if ((uint64_t)objc_msgSend(v12, "count") >= 1)
    {
      v14 = 0;
      do
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "featuresAtIndex:", v14));
        v16 = [base_durationOutput alloc];
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "featureValueForName:", CFSTR("duration_pred")));
        objc_msgSend(v17, "doubleValue");
        v18 = -[base_durationOutput initWithDuration_pred:](v16, "initWithDuration_pred:");

        objc_msgSend(v13, "addObject:", v18);
        ++v14;
      }
      while (v14 < (uint64_t)objc_msgSend(v12, "count"));
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
