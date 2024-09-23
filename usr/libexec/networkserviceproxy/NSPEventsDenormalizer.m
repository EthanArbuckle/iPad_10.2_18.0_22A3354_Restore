@implementation NSPEventsDenormalizer

+ (id)URLOfModelInThisBundle
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("NSPEventsDenormalizer"), CFSTR("mlmodelc")));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load NSPEventsDenormalizer.mlmodelc in the bundle resource", v7, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (NSPEventsDenormalizer)initWithMLModel:(id)a3
{
  id v5;
  NSPEventsDenormalizer *v6;
  NSPEventsDenormalizer *v7;
  NSPEventsDenormalizer *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NSPEventsDenormalizer;
  v6 = -[NSPEventsDenormalizer init](&v10, "init");
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_model, a3), v7->_model))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (NSPEventsDenormalizer)init
{
  id v3;
  void *v4;
  NSPEventsDenormalizer *v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[NSPEventsDenormalizer initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v4, 0);

  return v5;
}

- (NSPEventsDenormalizer)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  NSPEventsDenormalizer *v9;

  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[NSPEventsDenormalizer initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v8, v6, a4);

  return v9;
}

- (NSPEventsDenormalizer)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  NSPEventsDenormalizer *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", a3, a4));
  if (v5)
  {
    self = -[NSPEventsDenormalizer initWithMLModel:](self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSPEventsDenormalizer)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  NSPEventsDenormalizer *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:configuration:error:](MLModel, "modelWithContentsOfURL:configuration:error:", a3, a4, a5));
  if (v6)
  {
    self = -[NSPEventsDenormalizer initWithMLModel:](self, "initWithMLModel:", v6);
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
  v8[2] = sub_100048328;
  v8[3] = &unk_1000F5D18;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsDenormalizer predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v6, v7, a4));

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSPEventsDenormalizerOutput *v12;
  void *v13;
  void *v14;
  NSPEventsDenormalizerOutput *v15;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsDenormalizer model](self, "model"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v8, a5));

  if (v11)
  {
    v12 = [NSPEventsDenormalizerOutput alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("Identity")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "multiArrayValue"));
    v15 = -[NSPEventsDenormalizerOutput initWithIdentity:](v12, "initWithIdentity:", v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)predictionFromDenormalizer_input:(id)a3 error:(id *)a4
{
  id v6;
  NSPEventsDenormalizerInput *v7;
  void *v8;

  v6 = a3;
  v7 = -[NSPEventsDenormalizerInput initWithDenormalizer_input:]([NSPEventsDenormalizerInput alloc], "initWithDenormalizer_input:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsDenormalizer predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v7, a4));
  return v8;
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
  NSPEventsDenormalizerOutput *v16;
  void *v17;
  void *v18;
  NSPEventsDenormalizerOutput *v19;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)MLArrayBatchProvider), "initWithFeatureProviderArray:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsDenormalizer model](self, "model"));
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
        v16 = [NSPEventsDenormalizerOutput alloc];
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "featureValueForName:", CFSTR("Identity")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "multiArrayValue"));
        v19 = -[NSPEventsDenormalizerOutput initWithIdentity:](v16, "initWithIdentity:", v18);

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
