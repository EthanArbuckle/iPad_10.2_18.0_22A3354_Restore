@implementation PMLFidesTracker

- (PMLFidesTracker)initWithPlanId:(id)a3
{
  id v6;
  PMLFidesTracker *v7;
  PMLFidesTracker *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLFidesTracker.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("planId"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PMLFidesTracker;
  v7 = -[PMLFidesTracker init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_planId, a3);

  return v8;
}

- (id)trackWeights:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6
{
  NSString *planId;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x24BDAC8D0];
  planId = self->_planId;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  +[PMLPlanDescriptor descriptorFromPlanId:](PMLPlanDescriptor, "descriptorFromPlanId:", planId);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = CFSTR("plan");
  v22[0] = CFSTR("name");
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v22[1] = CFSTR("version");
  objc_msgSend(v12, "version");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  v22[2] = CFSTR("locale");
  objc_msgSend(v12, "locale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v24[1] = CFSTR("minibatchStats");
  objc_msgSend(v10, "toDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v25[1] = v17;
  v24[2] = CFSTR("evaluationMetrics");
  objc_msgSend(v9, "toDictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v25[2] = v18;
  v24[3] = CFSTR("weights");
  objc_msgSend(v11, "data");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v24[4] = CFSTR("serverIteration");
  v25[3] = v19;
  v25[4] = &unk_24D3EAD60;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)trackGradient:(id)a3 scaleFactor:(float)a4 minibatchStats:(id)a5 evaluationMetrics:(id)a6 serverIteration:(unint64_t)a7
{
  NSString *planId;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[5];
  _QWORD v28[6];

  v28[5] = *MEMORY[0x24BDAC8D0];
  planId = self->_planId;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  +[PMLPlanDescriptor descriptorFromPlanId:](PMLPlanDescriptor, "descriptorFromPlanId:", planId);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("plan");
  v25[0] = CFSTR("name");
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v25[1] = CFSTR("version");
  objc_msgSend(v13, "version");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  v25[2] = CFSTR("locale");
  objc_msgSend(v13, "locale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v27[1] = CFSTR("minibatchStats");
  objc_msgSend(v11, "toDictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v28[1] = v18;
  v27[2] = CFSTR("evaluationMetrics");
  objc_msgSend(v10, "toDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2] = v19;
  v27[3] = CFSTR("gradient");
  objc_msgSend(v12, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v28[3] = v20;
  v27[4] = CFSTR("serverIteration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)trackEvaluationMetrics:(id)a3 minibatchStats:(id)a4
{
  NSString *planId;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  planId = self->_planId;
  v6 = a4;
  v7 = a3;
  +[PMLPlanDescriptor descriptorFromPlanId:](PMLPlanDescriptor, "descriptorFromPlanId:", planId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = CFSTR("plan");
  v17[0] = CFSTR("name");
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v17[1] = CFSTR("version");
  objc_msgSend(v8, "version");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  v17[2] = CFSTR("locale");
  objc_msgSend(v8, "locale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v19[1] = CFSTR("minibatchStats");
  objc_msgSend(v6, "toDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v20[1] = v13;
  v19[2] = CFSTR("evaluationMetrics");
  objc_msgSend(v7, "toDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v20[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
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
  -[PMLFidesTracker trackPrecisionAtK:minibatchStats:](self, "trackPrecisionAtK:minibatchStats:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)trackPrecisionAtK:(id)a3 minibatchStats:(id)a4
{
  NSString *planId;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  planId = self->_planId;
  v6 = a4;
  v7 = a3;
  +[PMLPlanDescriptor descriptorFromPlanId:](PMLPlanDescriptor, "descriptorFromPlanId:", planId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __52__PMLFidesTracker_trackPrecisionAtK_minibatchStats___block_invoke;
  v21 = &unk_24D3DBD18;
  v22 = v9;
  v10 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v18);

  v25[0] = CFSTR("plan");
  v23[0] = CFSTR("name");
  objc_msgSend(v8, "name", v18, v19, v20, v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v23[1] = CFSTR("version");
  objc_msgSend(v8, "version");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v12;
  v23[2] = CFSTR("locale");
  objc_msgSend(v8, "locale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v25[1] = CFSTR("minibatchStats");
  objc_msgSend(v6, "toDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v25[2] = CFSTR("precisionAtK");
  v26[1] = v15;
  v26[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)toPlistWithChunks:(id)a3
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (PMLFidesTracker)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  PMLFidesTracker *v10;
  void *v12;
  objc_class *v13;
  void *v14;

  v7 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("planId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLFidesTracker.m"), 176, CFSTR("Can't instantiate %@. Missing \"planId\" dependency."), v14);

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("planId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PMLFidesTracker initWithPlanId:](self, "initWithPlanId:", v9);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planId, 0);
}

void __52__PMLFidesTracker_trackPrecisionAtK_minibatchStats___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "stringValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v6);

}

@end
