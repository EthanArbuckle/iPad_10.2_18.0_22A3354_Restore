@implementation PMLPassThroughTracker

- (PMLPassThroughTracker)initWithPlanId:(id)a3 numberOfBuckets:(unint64_t)a4
{
  id v8;
  PMLPassThroughTracker *v9;
  PMLPassThroughTracker *v10;
  uint64_t v11;
  NSMutableArray *results;
  uint64_t v13;
  NSLock *resultsLock;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  if (v8)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLPassThroughTracker.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("planId"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLPassThroughTracker.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("buckets"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PMLPassThroughTracker;
  v9 = -[PMLPassThroughTracker init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_planId, a3);
    v10->_quantizationNumberOfBuckets = a4;
    v11 = objc_opt_new();
    results = v10->_results;
    v10->_results = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    resultsLock = v10->_resultsLock;
    v10->_resultsLock = (NSLock *)v13;

  }
  return v10;
}

- (id)trackWeights:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6
{
  NSString *planId;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  NSMutableArray *results;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[6];

  v28[5] = *MEMORY[0x24BDAC8D0];
  planId = self->_planId;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  +[AWDProactiveModelFittingModelInfo modelInfoFromPlanId:](AWDProactiveModelFittingModelInfo, "modelInfoFromPlanId:", planId);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = a4;
  +[PMLProtoBufTracker messageForWeights:scaleFactor:minibatchStats:evaluationMetrics:modelInfo:numberOfBuckets:](PMLProtoBufTracker, "messageForWeights:scaleFactor:minibatchStats:evaluationMetrics:modelInfo:numberOfBuckets:", v13, v12, v11, v14, self->_quantizationNumberOfBuckets, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[PMLSparseVector sparseVectorFromDense:](PMLSparseVector, "sparseVectorFromDense:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock lock](self->_resultsLock, "lock");
  results = self->_results;
  v28[0] = v17;
  v27[0] = CFSTR("weights");
  v27[1] = CFSTR("scaleFactor");
  *(float *)&v19 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v20;
  v28[2] = v12;
  v27[2] = CFSTR("minibatchStats");
  v27[3] = CFSTR("evaluationMetrics");
  v27[4] = CFSTR("AWDWeightsMessage");
  v28[3] = v11;
  v28[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](results, "addObject:", v21);

  v22 = (void *)-[NSMutableArray copy](self->_results, "copy");
  -[NSLock unlock](self->_resultsLock, "unlock");
  v25 = CFSTR("results");
  v26 = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)trackGradient:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6 serverIteration:(unint64_t)a7
{
  NSString *planId;
  id v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  NSMutableArray *results;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[6];

  v30[5] = *MEMORY[0x24BDAC8D0];
  planId = self->_planId;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  +[AWDProactiveModelFittingModelInfo modelInfoFromPlanId:](AWDProactiveModelFittingModelInfo, "modelInfoFromPlanId:", planId);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v17 = a4;
  +[PMLProtoBufTracker messageForGradient:scaleFactor:minibatchStats:evaluationMetrics:serverIteration:modelInfo:numberOfBuckets:](PMLProtoBufTracker, "messageForGradient:scaleFactor:minibatchStats:evaluationMetrics:serverIteration:modelInfo:numberOfBuckets:", v15, v14, v13, a7, v16, self->_quantizationNumberOfBuckets, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[PMLSparseVector sparseVectorFromDense:](PMLSparseVector, "sparseVectorFromDense:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock lock](self->_resultsLock, "lock");
  results = self->_results;
  v30[0] = v19;
  v29[0] = CFSTR("gradient");
  v29[1] = CFSTR("scaleFactor");
  *(float *)&v21 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v22;
  v30[2] = v14;
  v29[2] = CFSTR("minibatchStats");
  v29[3] = CFSTR("evaluationMetrics");
  v29[4] = CFSTR("AWDGradientMessage");
  v30[3] = v13;
  v30[4] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](results, "addObject:", v23);

  v24 = (void *)-[NSMutableArray copy](self->_results, "copy");
  -[NSLock unlock](self->_resultsLock, "unlock");
  v27 = CFSTR("results");
  v28 = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)trackEvaluationMetrics:(id)a3 minibatchStats:(id)a4
{
  NSLock *resultsLock;
  id v7;
  id v8;
  NSMutableArray *results;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  resultsLock = self->_resultsLock;
  v7 = a4;
  v8 = a3;
  -[NSLock lock](resultsLock, "lock");
  results = self->_results;
  v16[0] = CFSTR("minibatchStats");
  v16[1] = CFSTR("evaluationMetrics");
  v17[0] = v7;
  v17[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](results, "addObject:", v10);

  v11 = (void *)-[NSMutableArray copy](self->_results, "copy");
  -[NSLock unlock](self->_resultsLock, "unlock");
  v14 = CFSTR("results");
  v15 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)toPlistWithChunks:(id)a3
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (PMLPassThroughTracker)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PMLPassThroughTracker *v12;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;

  v7 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("planId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLPassThroughTracker.m"), 108, CFSTR("Can't instantiate %@. Missing \"planId\" dependency."), v16);

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("buckets"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLPassThroughTracker.m"), 109, CFSTR("Can't instantiate %@. Missing \"buckets\" dependency."), v19);

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("planId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("buckets"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PMLPassThroughTracker initWithPlanId:numberOfBuckets:](self, "initWithPlanId:numberOfBuckets:", v10, v11);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsLock, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_planId, 0);
}

@end
