@implementation nccp_wra_qmaxp_seq_model

+ (id)URLOfModelInThisBundle
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("nccp_wra_qmaxp_seq_model"), CFSTR("mlmodelc")));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100020288();
    v5 = 0;
  }

  return v5;
}

- (nccp_wra_qmaxp_seq_model)initWithMLModel:(id)a3
{
  id v5;
  nccp_wra_qmaxp_seq_model *v6;
  nccp_wra_qmaxp_seq_model *v7;
  nccp_wra_qmaxp_seq_model *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)nccp_wra_qmaxp_seq_model;
    v6 = -[nccp_wra_qmaxp_seq_model init](&v10, "init");
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

- (nccp_wra_qmaxp_seq_model)init
{
  id v3;
  void *v4;
  nccp_wra_qmaxp_seq_model *v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[nccp_wra_qmaxp_seq_model initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v4, 0);

  return v5;
}

- (nccp_wra_qmaxp_seq_model)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  nccp_wra_qmaxp_seq_model *v9;

  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[nccp_wra_qmaxp_seq_model initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v8, v6, a4);

  return v9;
}

- (nccp_wra_qmaxp_seq_model)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  nccp_wra_qmaxp_seq_model *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", a3, a4));
  if (v5)
  {
    self = -[nccp_wra_qmaxp_seq_model initWithMLModel:](self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (nccp_wra_qmaxp_seq_model)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  nccp_wra_qmaxp_seq_model *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:configuration:error:](MLModel, "modelWithContentsOfURL:configuration:error:", a3, a4, a5));
  if (v6)
  {
    self = -[nccp_wra_qmaxp_seq_model initWithMLModel:](self, "initWithMLModel:", v6);
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
  v8[2] = sub_10001A138;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[nccp_wra_qmaxp_seq_model predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v6, v7, a4));

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  nccp_wra_qmaxp_seq_modelOutput *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  nccp_wra_qmaxp_seq_modelOutput *v21;
  void *v22;
  nccp_wra_qmaxp_seq_modelOutput *v23;
  void *v25;
  void *v26;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[nccp_wra_qmaxp_seq_model model](self, "model"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v8, a5));

  if (v11)
  {
    v12 = [nccp_wra_qmaxp_seq_modelOutput alloc];
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q10_forecast")));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "multiArrayValue"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q25_forecast")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "multiArrayValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q50_forecast")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "multiArrayValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q75_forecast")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "multiArrayValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q90_forecast")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "multiArrayValue"));
    v21 = v12;
    v22 = (void *)v13;
    v23 = -[nccp_wra_qmaxp_seq_modelOutput initWithNccp_wra_qmaxp_q10_forecast:nccp_wra_qmaxp_q25_forecast:nccp_wra_qmaxp_q50_forecast:nccp_wra_qmaxp_q75_forecast:nccp_wra_qmaxp_q90_forecast:](v21, "initWithNccp_wra_qmaxp_q10_forecast:nccp_wra_qmaxp_q25_forecast:nccp_wra_qmaxp_q50_forecast:nccp_wra_qmaxp_q75_forecast:nccp_wra_qmaxp_q90_forecast:", v13, v14, v16, v18, v20);

  }
  else
  {
    v23 = 0;
  }

  return v23;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[nccp_wra_qmaxp_seq_model model](self, "model"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001A48C;
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[nccp_wra_qmaxp_seq_model model](self, "model"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001A70C;
  v13[3] = &unk_10002CBF8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "predictionFromFeatures:options:completionHandler:", v10, v9, v13);

}

- (id)predictionFromDaily_history_input:(id)a3 usage_history_input:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  nccp_wra_qmaxp_seq_modelInput *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = -[nccp_wra_qmaxp_seq_modelInput initWithDaily_history_input:usage_history_input:]([nccp_wra_qmaxp_seq_modelInput alloc], "initWithDaily_history_input:usage_history_input:", v9, v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[nccp_wra_qmaxp_seq_model predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v10, a5));
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  nccp_wra_qmaxp_seq_modelOutput *v22;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  nccp_wra_qmaxp_seq_modelOutput *v29;
  void *v30;
  void *v31;
  void *v32;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)MLArrayBatchProvider), "initWithFeatureProviderArray:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[nccp_wra_qmaxp_seq_model model](self, "model"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "predictionsFromBatch:options:error:", v10, v9, a5));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v12, "count")));
    if ((uint64_t)objc_msgSend(v12, "count") >= 1)
    {
      v24 = v10;
      v25 = v9;
      v26 = v8;
      v27 = v13;
      v14 = 0;
      do
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "featuresAtIndex:", v14));
        v29 = [nccp_wra_qmaxp_seq_modelOutput alloc];
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q10_forecast")));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "multiArrayValue"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q25_forecast")));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "multiArrayValue"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q50_forecast")));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "multiArrayValue"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q75_forecast")));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "multiArrayValue"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "featureValueForName:", CFSTR("nccp_wra_qmaxp_q90_forecast")));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "multiArrayValue"));
        v22 = -[nccp_wra_qmaxp_seq_modelOutput initWithNccp_wra_qmaxp_q10_forecast:nccp_wra_qmaxp_q25_forecast:nccp_wra_qmaxp_q50_forecast:nccp_wra_qmaxp_q75_forecast:nccp_wra_qmaxp_q90_forecast:](v29, "initWithNccp_wra_qmaxp_q10_forecast:nccp_wra_qmaxp_q25_forecast:nccp_wra_qmaxp_q50_forecast:nccp_wra_qmaxp_q75_forecast:nccp_wra_qmaxp_q90_forecast:", v28, v16, v17, v19, v21);

        v13 = v27;
        objc_msgSend(v27, "addObject:", v22);

        ++v14;
      }
      while (v14 < (uint64_t)objc_msgSend(v12, "count"));
      v9 = v25;
      v8 = v26;
      v10 = v24;
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
