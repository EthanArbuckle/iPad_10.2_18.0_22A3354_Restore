@implementation RangeBiasEstimatorModelDataTransformer

- (RangeBiasEstimatorModelDataTransformer)initWithContentsOfURL:(id)a3
{
  id v4;
  NSObject *v5;
  RangeBiasEstimatorModelDataTransformer *v6;
  uint64_t v7;
  id v8;
  MLModel *dataTransformerModel;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  RangeBiasEstimatorModelDataTransformer *v17;
  id v19;
  objc_super v20;
  uint8_t buf[16];

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#bias-est, Initializing RangeBiasEstimatorModelDataTransformer", buf, 2u);
  }
  v20.receiver = self;
  v20.super_class = (Class)RangeBiasEstimatorModelDataTransformer;
  v6 = -[RangeBiasEstimatorModelDataTransformer init](&v20, "init");
  if (v6)
  {
    v19 = 0;
    v7 = objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v4, &v19));
    v8 = v19;
    dataTransformerModel = v6->_dataTransformerModel;
    v6->_dataTransformerModel = (MLModel *)v7;

    if (v8)
    {
      v10 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003ED944((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
    }
    else
    {
      if (v6->_dataTransformerModel)
      {
        v17 = v6;
        goto LABEL_11;
      }
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003ED918();
    }
    v17 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v17 = 0;
LABEL_12:

  return v17;
}

- (id)applyTransformation:(id)a3
{
  id v4;
  NSObject *v5;
  MLModel *dataTransformerModel;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  RangeBiasEstimatorInput *v11;
  void *v12;
  RangeBiasEstimatorInput *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  uint8_t buf[16];

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#bias-est, Apply standardization on data", buf, 2u);
  }
  dataTransformerModel = self->_dataTransformerModel;
  v22 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MLModel predictionFromFeatures:error:](dataTransformerModel, "predictionFromFeatures:error:", v4, &v22));
  v8 = v22;
  v9 = v8;
  if (!v7 || v8)
  {
    v14 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003ED9A8((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);
    v13 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "featureValueForName:", CFSTR("transformed_features")));
    v11 = [RangeBiasEstimatorInput alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "multiArrayValue"));
    v13 = -[RangeBiasEstimatorInput initWithData:](v11, "initWithData:", v12);

  }
  return v13;
}

- (MLModel)dataTransformerModel
{
  return self->_dataTransformerModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTransformerModel, 0);
}

@end
