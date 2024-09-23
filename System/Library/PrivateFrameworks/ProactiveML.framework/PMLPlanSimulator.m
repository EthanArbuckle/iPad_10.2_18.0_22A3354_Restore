@implementation PMLPlanSimulator

- (PMLPlanSimulator)initWithStores:(id)a3 sessionDescriptor:(id)a4 seed:(unint64_t)a5
{
  id v9;
  id v10;
  PMLPlanSimulator *v11;
  PMLPlanSimulator *v12;
  uint64_t v13;
  _PASRng *rng;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PMLPlanSimulator;
  v11 = -[PMLPlanSimulator init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_stores, a3);
    objc_storeStrong((id *)&v12->_sessionDescriptor, a4);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A628]), "initWithSeed:", a5);
    rng = v12->_rng;
    v12->_rng = (_PASRng *)v13;

  }
  return v12;
}

- (id)_randomStore
{
  return -[NSArray objectAtIndexedSubscript:](self->_stores, "objectAtIndexedSubscript:", -[_PASRng next](self->_rng, "next") % -[NSArray count](self->_stores, "count"));
}

- (id)_randomStores:(unint64_t)a3
{
  void *i;
  void *v6;

  for (i = (void *)objc_opt_new(); a3; --a3)
  {
    -[PMLPlanSimulator _randomStore](self, "_randomStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v6);

  }
  return i;
}

- (id)runParallelPlansWithPlanId:(id)a3 tracker:(id)a4 noiseScaleFactors:(id)a5 noiseMinimumMagnitude:(float)a6 weights:(id)a7 serverIteration:(unint64_t)a8 useIntercept:(BOOL)a9 noiseMechanism:(int64_t)a10 usingRandomlySelected:(unint64_t)a11
{
  float var1;
  float var0;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  PMLPlanSimulator *v38;
  id v39;
  id v40;
  unint64_t v41;
  int64_t v42;
  float v43;
  float v44;
  float v45;
  BOOL v46;

  var1 = a5.var1;
  var0 = a5.var0;
  v19 = a3;
  v20 = a4;
  v21 = a7;
  -[PMLPlanSimulator _randomStores:](self, "_randomStores:", a11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_opt_new();
  dispatch_get_global_queue(33, 0);
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __169__PMLPlanSimulator_runParallelPlansWithPlanId_tracker_noiseScaleFactors_noiseMinimumMagnitude_weights_serverIteration_useIntercept_noiseMechanism_usingRandomlySelected___block_invoke;
  block[3] = &unk_24D3DAD68;
  v43 = var0;
  v44 = var1;
  v45 = a6;
  v41 = a8;
  v42 = a10;
  v35 = v22;
  v36 = v20;
  v37 = v19;
  v38 = self;
  v39 = v21;
  v46 = a9;
  v25 = v23;
  v40 = v25;
  v26 = v21;
  v27 = v19;
  v28 = v20;
  v29 = v22;
  dispatch_apply(a11, v24, block);

  v30 = v40;
  v31 = v25;

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rng, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
  objc_storeStrong((id *)&self->_stores, 0);
}

void __169__PMLPlanSimulator_runParallelPlansWithPlanId_tracker_noiseScaleFactors_noiseMinimumMagnitude_weights_serverIteration_useIntercept_noiseMechanism_usingRandomlySelected___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  PMLDiffPrivacyNoiseStrategy *v7;
  double v8;
  double v9;
  double v10;
  PMLDiffPrivacyNoiseStrategy *v11;
  PMLLogRegTrainingPlan *v12;
  double v13;
  double v14;
  PMLLogRegTrainingPlan *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v4 = (void *)MEMORY[0x2199EA600]();
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (a2 + *(_DWORD *)(a1 + 80) + 1);
  v7 = [PMLDiffPrivacyNoiseStrategy alloc];
  LODWORD(v8) = *(_DWORD *)(a1 + 100);
  LODWORD(v9) = *(_DWORD *)(a1 + 104);
  LODWORD(v10) = *(_DWORD *)(a1 + 96);
  v11 = -[PMLDiffPrivacyNoiseStrategy initWithMaxIterationCount:noiseScaleFactors:minimumMagnitude:seed:noiseMechanism:inplaceNorm:](v7, "initWithMaxIterationCount:noiseScaleFactors:minimumMagnitude:seed:noiseMechanism:inplaceNorm:", 1, v6, *(_QWORD *)(a1 + 88), 0, v10, v8, v9);
  v12 = [PMLLogRegTrainingPlan alloc];
  LOBYTE(v19) = 1;
  BYTE2(v18) = *(_BYTE *)(a1 + 108);
  LOWORD(v18) = 0;
  LODWORD(v13) = 1017370378;
  LODWORD(v14) = 953267991;
  v15 = -[PMLLogRegTrainingPlan initWithStore:tracker:noiseStrategy:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentServerIteration:currentModelWeights:localLearningRate:stoppingThreshold:localMinimumIterations:localGradientIterations:useOnlyAppleInternalSessions:skew:threshold:isMultiLabel:intercept:positiveLabel:evaluationLevel:reportScale:](v12, "initWithStore:tracker:noiseStrategy:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentServerIteration:currentModelWeights:localLearningRate:stoppingThreshold:localMinimumIterations:localGradientIterations:useOnlyAppleInternalSessions:skew:threshold:isMultiLabel:intercept:positiveLabel:evaluationLevel:reportScale:", v5, *(_QWORD *)(a1 + 40), v11, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 16), 1, v13, v14, 0.0, 0.5, 1, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), 100, 1,
          v18,
          1,
          2,
          v19);
  -[PMLLogRegTrainingPlan runWithError:](v15, "runWithError:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = *(id *)(a1 + 72);
    objc_sync_enter(v17);
    objc_msgSend(*(id *)(a1 + 72), "addObject:", v16);
    objc_sync_exit(v17);

  }
  objc_autoreleasePoolPop(v4);
}

+ (id)simulatorWithDbPaths:(id)a3 sessionDescriptor:(id)a4 sessionsInBatch:(unint64_t)a5 maxSessionsLimit:(unint64_t)a6 seed:(unint64_t)a7
{
  id v13;
  id v14;
  void *v15;
  size_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void *v32;
  id v33;
  id v34;
  id v35;
  SEL v36;
  id v37;
  unint64_t v38;

  v13 = a3;
  v14 = a4;
  if (!objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PMLPlanSimulator.m"), 91, CFSTR("Can't instantiate simulator, need at least one db file."));

  }
  if (a5 != a6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PMLPlanSimulator.m"), 92, CFSTR("Multiple batches not supported in simulation."));

  }
  v15 = (void *)objc_opt_new();
  v16 = objc_msgSend(v13, "count");
  dispatch_get_global_queue(33, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x24BDAC760];
  v30 = 3221225472;
  v31 = __97__PMLPlanSimulator_simulatorWithDbPaths_sessionDescriptor_sessionsInBatch_maxSessionsLimit_seed___block_invoke;
  v32 = &unk_24D3DAD40;
  v18 = v13;
  v33 = v18;
  v36 = a2;
  v37 = a1;
  v19 = v14;
  v34 = v19;
  v38 = a6;
  v20 = v15;
  v35 = v20;
  dispatch_apply(v16, v17, &v29);

  v21 = (void *)objc_opt_new();
  if (objc_msgSend(v18, "count", v29, v30, v31, v32))
  {
    v22 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v24);

      ++v22;
    }
    while (v22 < objc_msgSend(v18, "count"));
  }
  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStores:sessionDescriptor:seed:", v21, v19, a7);

  return v25;
}

void __97__PMLPlanSimulator_simulatorWithDbPaths_sessionDescriptor_sessionsInBatch_maxSessionsLimit_seed___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  PMLTrainingStore *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)MEMORY[0x2199EA600]();
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), CFSTR("PMLPlanSimulator.m"), 98, CFSTR("Can't instantiate simulator, no db at %@"), v5);

  }
  v8 = -[PMLTrainingStore initWithPath:]([PMLTrainingStore alloc], "initWithPath:", v5);
  +[PMLInMemoryCachedStore cachedStoreFromRealStore:sessionDescriptor:sessionsLimit:](PMLInMemoryCachedStore, "cachedStoreFromRealStore:sessionDescriptor:sessionsLimit:", v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(id *)(a1 + 48);
  objc_sync_enter(v10);
  v11 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v12);

  objc_sync_exit(v10);
  objc_autoreleasePoolPop(v4);
}

@end
