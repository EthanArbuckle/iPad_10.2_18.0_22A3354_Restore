@implementation PMLProtoBufTracker

- (PMLProtoBufTracker)initWithAdapter:(id)a3 modelInfo:(id)a4
{
  return -[PMLProtoBufTracker initWithAdapter:modelInfo:quantizationBuckets:](self, "initWithAdapter:modelInfo:quantizationBuckets:", a3, a4, 0xFFFFLL);
}

- (PMLProtoBufTracker)initWithAdapter:(id)a3 modelInfo:(id)a4 quantizationBuckets:(unint64_t)a5
{
  id v10;
  id v11;
  void *v12;
  PMLProtoBufTracker *v13;
  PMLProtoBufTracker *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLProtoBufTracker.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adapter"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLProtoBufTracker.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modelInfo"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PMLProtoBufTracker;
  v13 = -[PMLProtoBufTracker init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_adapter, a3);
    objc_storeStrong((id *)&v14->_modelInfo, a4);
    v14->_quantizationNumberOfBuckets = a5;
  }

  return v14;
}

- (id)trackWeights:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6
{
  AWDProactiveModelFittingModelInfo *modelInfo;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  NSObject *v17;
  AWDProactiveModelFittingModelInfo *v19;
  int v20;
  AWDProactiveModelFittingModelInfo *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  modelInfo = self->_modelInfo;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = (void *)-[AWDProactiveModelFittingModelInfo copy](modelInfo, "copy");
  *(float *)&v15 = a4;
  +[PMLProtoBufTracker messageForWeights:scaleFactor:minibatchStats:evaluationMetrics:modelInfo:numberOfBuckets:](PMLProtoBufTracker, "messageForWeights:scaleFactor:minibatchStats:evaluationMetrics:modelInfo:numberOfBuckets:", v13, v12, v11, v14, self->_quantizationNumberOfBuckets, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  PML_LogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v19 = self->_modelInfo;
    v20 = 138412290;
    v21 = v19;
    _os_log_debug_impl(&dword_2159BB000, v17, OS_LOG_TYPE_DEBUG, "Sending weights for model %@", (uint8_t *)&v20, 0xCu);
  }

  -[PMLTrackerAdapterProtocol postMetricId:message:](self->_adapter, "postMetricId:message:", 5636100, v16);
  return 0;
}

- (id)trackGradient:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6 serverIteration:(unint64_t)a7
{
  AWDProactiveModelFittingModelInfo *modelInfo;
  id v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  NSObject *v19;
  AWDProactiveModelFittingModelInfo *v21;
  int v22;
  AWDProactiveModelFittingModelInfo *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  modelInfo = self->_modelInfo;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = (void *)-[AWDProactiveModelFittingModelInfo copy](modelInfo, "copy");
  *(float *)&v17 = a4;
  +[PMLProtoBufTracker messageForGradient:scaleFactor:minibatchStats:evaluationMetrics:serverIteration:modelInfo:numberOfBuckets:](PMLProtoBufTracker, "messageForGradient:scaleFactor:minibatchStats:evaluationMetrics:serverIteration:modelInfo:numberOfBuckets:", v15, v14, v13, a7, v16, self->_quantizationNumberOfBuckets, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  PML_LogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v21 = self->_modelInfo;
    v22 = 138412290;
    v23 = v21;
    _os_log_debug_impl(&dword_2159BB000, v19, OS_LOG_TYPE_DEBUG, "Sending gradient for model %@", (uint8_t *)&v22, 0xCu);
  }

  -[PMLTrackerAdapterProtocol postMetricId:message:](self->_adapter, "postMetricId:message:", 5636101, v18);
  return 0;
}

- (id)trackEvaluationMetrics:(id)a3 minibatchStats:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  NSObject *v12;
  AWDProactiveModelFittingModelInfo *modelInfo;
  int v15;
  AWDProactiveModelFittingModelInfo *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = (void *)-[AWDProactiveModelFittingModelInfo copy](self->_modelInfo, "copy");
  objc_msgSend(v8, "setModelInfo:", v9);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  objc_msgSend(v8, "setTimestamp:", (unint64_t)v11);

  objc_msgSend(v8, "setMinibatchStats:", v6);
  objc_msgSend(v8, "setEvaluationMetrics:", v7);

  PML_LogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    modelInfo = self->_modelInfo;
    v15 = 138412290;
    v16 = modelInfo;
    _os_log_debug_impl(&dword_2159BB000, v12, OS_LOG_TYPE_DEBUG, "Sending evaluation metrics for %@", (uint8_t *)&v15, 0xCu);
  }

  -[PMLTrackerAdapterProtocol postMetricId:message:](self->_adapter, "postMetricId:message:", 5636102, v8);
  return 0;
}

- (id)trackPrecisionAtK:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;

  v4 = a3;
  LODWORD(v5) = 0;
  +[AWDProactiveModelFittingMinibatchStats statsWithSize:support:](AWDProactiveModelFittingMinibatchStats, "statsWithSize:support:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLProtoBufTracker trackPrecisionAtK:minibatchStats:](self, "trackPrecisionAtK:minibatchStats:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)trackPrecisionAtK:(id)a3 minibatchStats:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  NSObject *v13;
  AWDProactiveModelFittingModelInfo *modelInfo;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  AWDProactiveModelFittingModelInfo *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = (void *)-[AWDProactiveModelFittingModelInfo copy](self->_modelInfo, "copy");
  objc_msgSend(v8, "setModelInfo:", v9);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  objc_msgSend(v8, "setTimestamp:", (unint64_t)v11);

  objc_msgSend(v8, "setMinibatchStats:", v6);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __55__PMLProtoBufTracker_trackPrecisionAtK_minibatchStats___block_invoke;
  v16[3] = &unk_24D3DBD18;
  v12 = v8;
  v17 = v12;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v16);

  PML_LogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    modelInfo = self->_modelInfo;
    *(_DWORD *)buf = 138412290;
    v19 = modelInfo;
    _os_log_debug_impl(&dword_2159BB000, v13, OS_LOG_TYPE_DEBUG, "Sending evaluation metrics for %@", buf, 0xCu);
  }

  -[PMLTrackerAdapterProtocol postMetricId:message:](self->_adapter, "postMetricId:message:", 5636102, v12);
  return 0;
}

- (id)toPlistWithChunks:(id)a3
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("TRACKER_ADAPTER_CLASS");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("TRACKER_QUANTIZATION_BUCKETS");
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_quantizationNumberOfBuckets);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PMLProtoBufTracker)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PMLProtoBufTracker *v16;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TRACKER_ADAPTER_CLASS"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!NSClassFromString(v10))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLProtoBufTracker.m"), 218, CFSTR("Can't instantiate %@. Unknown class: %@"), v20, v10);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("planId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLProtoBufTracker.m"), 219, CFSTR("Can't instantiate %@. Missing \"planId\" dependency."), v23);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("planId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[AWDProactiveModelFittingModelInfo modelInfoFromPlanId:](AWDProactiveModelFittingModelInfo, "modelInfoFromPlanId:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TRACKER_QUANTIZATION_BUCKETS"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[PMLProtoBufTracker initWithAdapter:modelInfo:quantizationBuckets:](self, "initWithAdapter:modelInfo:quantizationBuckets:", v14, v13, objc_msgSend(v15, "unsignedLongLongValue"));
  return v16;
}

- (PMLTrackerAdapterProtocol)adapter
{
  return self->_adapter;
}

- (AWDProactiveModelFittingModelInfo)modelInfo
{
  return self->_modelInfo;
}

- (unint64_t)quantizationNumberOfBuckets
{
  return self->_quantizationNumberOfBuckets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
}

void __55__PMLProtoBufTracker_trackPrecisionAtK_minibatchStats___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  double v10;
  id v11;

  v5 = a3;
  v6 = a2;
  v11 = (id)objc_opt_new();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v11, "setK:", v7);
  objc_msgSend(v5, "floatValue");
  v9 = v8;

  LODWORD(v10) = v9;
  objc_msgSend(v11, "setPrecision:", v10);
  objc_msgSend(*(id *)(a1 + 32), "addPrecisionAtK:", v11);

}

+ (id)awdTrackerForPlanId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  +[AWDProactiveModelFittingModelInfo modelInfoFromPlanId:](AWDProactiveModelFittingModelInfo, "modelInfoFromPlanId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAdapter:modelInfo:", v5, v6);
  return v7;
}

+ (id)parsecTrackerForPlanId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  +[AWDProactiveModelFittingModelInfo modelInfoFromPlanId:](AWDProactiveModelFittingModelInfo, "modelInfoFromPlanId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAdapter:modelInfo:", v5, v6);
  return v7;
}

+ (id)messageForWeights:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6 modelInfo:(id)a7 numberOfBuckets:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  float v21;
  void *v22;

  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a3;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setModelInfo:", v13);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSince1970");
  objc_msgSend(v17, "setTimestamp:", (unint64_t)v19);

  objc_msgSend(v17, "setMinibatchStats:", v15);
  objc_msgSend(v17, "setEvaluationMetrics:", v14);

  *(float *)&v20 = a4;
  objc_msgSend(v17, "setWeightsScaleFactor:", v20);
  objc_msgSend(v16, "density");
  if (v21 >= 0.5)
  {
    +[AWDProactiveModelFittingQuantizedDenseVector quantizedDenseVectorFromDenseVector:numberOfBuckets:](AWDProactiveModelFittingQuantizedDenseVector, "quantizedDenseVectorFromDenseVector:numberOfBuckets:", v16, a8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setDenseQuantizedWeights:", v22);
  }
  else
  {
    +[AWDProactiveModelFittingQuantizedSparseVector quantizedSparseVectorFromDenseVector:numberOfBuckets:](AWDProactiveModelFittingQuantizedSparseVector, "quantizedSparseVectorFromDenseVector:numberOfBuckets:", v16, a8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setSparseQuantizedWeights:", v22);
  }

  return v17;
}

+ (id)messageForGradient:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6 serverIteration:(unint64_t)a7 modelInfo:(id)a8 numberOfBuckets:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  float v23;
  void *v24;

  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setModelInfo:", v15);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSince1970");
  objc_msgSend(v19, "setTimestamp:", (unint64_t)v21);

  objc_msgSend(v19, "setMinibatchStats:", v17);
  objc_msgSend(v19, "setEvaluationMetrics:", v16);

  *(float *)&v22 = a4;
  objc_msgSend(v19, "setGradientScaleFactor:", v22);
  objc_msgSend(v19, "setIteration:", a7);
  objc_msgSend(v18, "density");
  if (v23 >= 0.5)
  {
    +[AWDProactiveModelFittingQuantizedDenseVector quantizedDenseVectorFromDenseVector:numberOfBuckets:](AWDProactiveModelFittingQuantizedDenseVector, "quantizedDenseVectorFromDenseVector:numberOfBuckets:", v18, a9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setDenseQuantizedGradient:", v24);
  }
  else
  {
    +[AWDProactiveModelFittingQuantizedSparseVector quantizedSparseVectorFromDenseVector:numberOfBuckets:](AWDProactiveModelFittingQuantizedSparseVector, "quantizedSparseVectorFromDenseVector:numberOfBuckets:", v18, a9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setSparseQuantizedGradient:", v24);
  }

  return v19;
}

@end
