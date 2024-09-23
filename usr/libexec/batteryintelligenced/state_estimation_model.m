@implementation state_estimation_model

+ (id)URLOfModelInThisBundle
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("state_estimation_model"), CFSTR("mlmodelc")));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100020310();
    v5 = 0;
  }

  return v5;
}

- (state_estimation_model)initWithMLModel:(id)a3
{
  id v5;
  state_estimation_model *v6;
  state_estimation_model *v7;
  state_estimation_model *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)state_estimation_model;
    v6 = -[state_estimation_model init](&v10, "init");
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

- (state_estimation_model)init
{
  id v3;
  void *v4;
  state_estimation_model *v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[state_estimation_model initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v4, 0);

  return v5;
}

- (state_estimation_model)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  state_estimation_model *v9;

  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[state_estimation_model initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v8, v6, a4);

  return v9;
}

- (state_estimation_model)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  state_estimation_model *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", a3, a4));
  if (v5)
  {
    self = -[state_estimation_model initWithMLModel:](self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (state_estimation_model)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  state_estimation_model *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:configuration:error:](MLModel, "modelWithContentsOfURL:configuration:error:", a3, a4, a5));
  if (v6)
  {
    self = -[state_estimation_model initWithMLModel:](self, "initWithMLModel:", v6);
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
  v8[2] = sub_10001BF28;
  v8[3] = &unk_10002CBD0;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[state_estimation_model predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v6, v7, a4));

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  state_estimation_modelOutput *v12;
  void *v13;
  void *v14;
  state_estimation_modelOutput *v15;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[state_estimation_model model](self, "model"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v8, a5));

  if (v11)
  {
    v12 = [state_estimation_modelOutput alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("health_state_estimation")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "multiArrayValue"));
    v15 = -[state_estimation_modelOutput initWithHealth_state_estimation:](v12, "initWithHealth_state_estimation:", v14);

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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[state_estimation_model model](self, "model"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001C190;
  v10[3] = &unk_10002CBF8;
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[state_estimation_model model](self, "model"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001C330;
  v13[3] = &unk_10002CBF8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "predictionFromFeatures:options:completionHandler:", v10, v9, v13);

}

- (id)predictionFromDaily_history_input:(id)a3 usage_history_input:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  state_estimation_modelInput *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = -[state_estimation_modelInput initWithDaily_history_input:usage_history_input:]([state_estimation_modelInput alloc], "initWithDaily_history_input:usage_history_input:", v9, v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[state_estimation_model predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v10, a5));
  return v11;
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
  state_estimation_modelOutput *v16;
  void *v17;
  void *v18;
  state_estimation_modelOutput *v19;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)MLArrayBatchProvider), "initWithFeatureProviderArray:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[state_estimation_model model](self, "model"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "predictionsFromBatch:options:error:", v10, v9, a5));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v12, "count")));
    if ((uint64_t)objc_msgSend(v12, "count") >= 1)
    {
      v21 = v9;
      v22 = v8;
      v14 = 0;
      do
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "featuresAtIndex:", v14, v21, v22));
        v16 = [state_estimation_modelOutput alloc];
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "featureValueForName:", CFSTR("health_state_estimation")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "multiArrayValue"));
        v19 = -[state_estimation_modelOutput initWithHealth_state_estimation:](v16, "initWithHealth_state_estimation:", v18);

        objc_msgSend(v13, "addObject:", v19);
        ++v14;
      }
      while (v14 < (uint64_t)objc_msgSend(v12, "count"));
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

@end
