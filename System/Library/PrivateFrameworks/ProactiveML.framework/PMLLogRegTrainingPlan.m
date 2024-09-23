@implementation PMLLogRegTrainingPlan

- (PMLLogRegTrainingPlan)initWithStore:(id)a3 tracker:(id)a4 noiseStrategy:(id)a5 planId:(id)a6 sessionDescriptor:(id)a7 maxSessionsLimit:(unint64_t)a8 sessionsInBatch:(unint64_t)a9 currentServerIteration:(unint64_t)a10 currentModelWeights:(id)a11 localLearningRate:(float)a12 stoppingThreshold:(float)a13 localMinimumIterations:(unint64_t)a14 localGradientIterations:(unint64_t)a15 useOnlyAppleInternalSessions:(BOOL)a16 skew:(double)a17 threshold:(double)a18 isMultiLabel:(BOOL)a19 intercept:(BOOL)a20 positiveLabel:(unint64_t)a21 evaluationLevel:(unint64_t)a22 reportScale:(BOOL)a23
{
  id v34;
  id v35;
  PMLLogRegTrainingPlan *v36;
  PMLLogRegTrainingPlan *v37;
  unint64_t v38;
  int v39;
  unint64_t v40;
  id v42;
  void *v43;
  id v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;

  v34 = a3;
  v48 = a4;
  v47 = a5;
  v35 = a6;
  v46 = a7;
  v45 = a11;
  if (!+[PMLPlanDescriptor isValidPlanId:](PMLPlanDescriptor, "isValidPlanId:", v35))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLLogRegTrainingPlan.m"), 94, CFSTR("Invalid planId. Must be <name>-<version>-<locale> but got %@"), v35);

  }
  v49.receiver = self;
  v49.super_class = (Class)PMLLogRegTrainingPlan;
  v36 = -[PMLLogRegTrainingPlan init](&v49, sel_init);
  v37 = v36;
  if (v36)
  {
    v42 = v34;
    v38 = a9;
    objc_storeStrong((id *)&v36->_store, a3);
    objc_storeStrong((id *)&v37->_tracker, a4);
    objc_storeStrong((id *)&v37->_noiseStrategy, a5);
    objc_storeStrong((id *)&v37->_planId, a6);
    objc_storeStrong((id *)&v37->_sessionDescriptor, a7);
    if ((objc_msgSend(MEMORY[0x24BE7A5C8], "isInternalBuild") & 1) == 0)
    {
      v39 = objc_msgSend(MEMORY[0x24BE7A5C8], "isBetaBuild");
      if (a9 <= 1)
        v40 = 1;
      else
        v40 = a9;
      if (!v39)
        v38 = v40;
    }
    v37->_maxSessionsLimit = a8;
    v37->_sessionsInBatch = v38;
    v37->_currentServerIteration = a10;
    objc_storeStrong((id *)&v37->_currentModelWeights, a11);
    v37->_localLearningRate = a12;
    v37->_stoppingThreshold = a13;
    v37->_localMinimumIterations = a14;
    v37->_localGradientIterations = a15;
    v37->_useOnlyAppleInternalSessions = a16;
    v37->_isMultiLabel = a19;
    v37->_skew = a17;
    v37->_threshold = a18;
    v37->_intercept = a20;
    v34 = v42;
    v37->_positiveLabel = a21;
    v37->_evaluationLevel = a22;
    v37->_reportScale = a23;
  }

  return v37;
}

- (id)evaluationMetricsForPredictions:(id)a3 objectives:(id)a4 predicate:(id)a5 start:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  int v16;
  int v17;
  double v18;
  float v19;
  unint64_t v20;
  double v21;
  float v22;
  unint64_t v23;
  double v24;
  float v25;
  unint64_t v26;
  double v27;
  unint64_t v28;
  void *v29;
  double v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self->_evaluationLevel)
  {
    +[PMLClassificationEvaluationMetrics f1Score:predictions:predicate:](PMLClassificationEvaluationMetrics, "f1Score:predictions:predicate:", v11, v10, v12);
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3);
    v17 = v16;
    *(float *)&v18 = (float)+[PMLClassificationEvaluationMetrics truePositives:predictions:predicate:](PMLClassificationEvaluationMetrics, "truePositives:predictions:predicate:", v11, v10, v12);
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3, v18);
    v20 = vcvtas_u32_f32(v19);
    *(float *)&v21 = (float)+[PMLClassificationEvaluationMetrics trueNegatives:predictions:predicate:](PMLClassificationEvaluationMetrics, "trueNegatives:predictions:predicate:", v11, v10, v12);
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3, v21);
    v23 = vcvtas_u32_f32(v22);
    *(float *)&v24 = (float)+[PMLClassificationEvaluationMetrics falsePositives:predictions:predicate:](PMLClassificationEvaluationMetrics, "falsePositives:predictions:predicate:", v11, v10, v12);
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3, v24);
    v26 = vcvtas_u32_f32(v25);
    *(float *)&v27 = (float)+[PMLClassificationEvaluationMetrics falseNegatives:predictions:predicate:](PMLClassificationEvaluationMetrics, "falseNegatives:predictions:predicate:", v11, v10, v12);
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3, v27);
    v28 = vcvtas_u32_f32(*(float *)&v14);
  }
  else
  {
    v20 = 0;
    v23 = 0;
    v26 = 0;
    v28 = 0;
    v17 = 0;
  }
  LODWORD(v14) = 0;
  LODWORD(v15) = v17;
  +[AWDProactiveModelFittingEvalMetrics evalMetricsWithRmse:f1:truePositives:trueNegatives:falsePositives:falseNegatives:](AWDProactiveModelFittingEvalMetrics, "evalMetricsWithRmse:f1:truePositives:trueNegatives:falsePositives:falseNegatives:", v20, v23, v26, v28, v14, v15);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_evaluationLevel >= 2)
    +[PMLClassificationEvaluationMetrics addScoresForOutcomes:predictions:predicate:metrics:](PMLClassificationEvaluationMetrics, "addScoresForOutcomes:predictions:predicate:metrics:", v11, v10, v12, v29);
  objc_msgSend(v13, "timeIntervalSinceNow");
  *(float *)&v30 = v30;
  *(float *)&v30 = fabsf(*(float *)&v30);
  +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3, v30);
  objc_msgSend(v29, "setSecsToExecute:");

  return v29;
}

- (void)loadSessionsWithBlock:(id)a3
{
  PMLTrainingStore *store;
  PMLSessionDescriptor *sessionDescriptor;
  id v6;

  store = self->_store;
  sessionDescriptor = self->_sessionDescriptor;
  v6 = a3;
  +[PMLTrainingStore lastUsedTimestampLimit](PMLTrainingStore, "lastUsedTimestampLimit");
  -[PMLTrainingStore loadSessionsForModel:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:](store, "loadSessionsForModel:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:", sessionDescriptor, self->_sessionsInBatch, self->_useOnlyAppleInternalSessions, self->_positiveLabel, v6);

}

- (id)normalizeRegressor:(id)a3
{
  id v4;
  void *v5;
  PMLMutableDenseVector *v6;
  id v7;
  uint64_t v8;
  PMLMutableDenseVector *v9;
  uint64_t v10;
  unint64_t v11;
  float v12;
  id v13;

  v4 = a3;
  v5 = v4;
  if (self->_isMultiLabel)
  {
    v6 = -[PMLDenseVector initWithCount:]([PMLMutableDenseVector alloc], "initWithCount:", (int)objc_msgSend(v4, "count"));
    v7 = objc_retainAutorelease(v5);
    v8 = objc_msgSend(v7, "values");
    v9 = objc_retainAutorelease(v6);
    v10 = -[PMLMutableDenseVector mutablePtr](v9, "mutablePtr");
    if (objc_msgSend(v7, "count"))
    {
      v11 = 0;
      do
      {
        if (*(float *)(v8 + 4 * v11) == (float)self->_positiveLabel)
          v12 = 1.0;
        else
          v12 = 0.0;
        *(float *)(v10 + 4 * v11++) = v12;
      }
      while (v11 < (int)objc_msgSend(v7, "count"));
    }
    +[PMLModelRegressor modelRegressorFromFloats:](PMLModelRegressor, "modelRegressorFromFloats:", v9);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v4;
  }

  return v13;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %@>"), v5, self->_planId);

  return (NSString *)v6;
}

- (id)runWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v15;
  void *v16;
  objc_class *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  _QWORD *v26;
  __int128 *p_buf;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[4];
  _QWORD v35[3];
  _QWORD v36[3];
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PML_LogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v22;
      _os_log_error_impl(&dword_2159BB000, v15, OS_LOG_TYPE_ERROR, "Attempted to use PMLSeparatedDPNoiseStrategy with non-Fides tracker: %@.", (uint8_t *)&buf, 0xCu);

    }
    if (!a3)
    {
      v8 = (id)MEMORY[0x24BDBD1B8];
      return v8;
    }
    v16 = (void *)MEMORY[0x24BDD1540];
    v42[0] = CFSTR("PlanClass");
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v42[1] = CFSTR("NoiseStrategy");
    v43[0] = v6;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("ProactiveMLErrorDomain"), 6, v20);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v8 = (id)MEMORY[0x24BDBD1B8];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__661;
    v40 = __Block_byref_object_dispose__662;
    v41 = 0;
    v41 = (id)objc_opt_new();
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__661;
    v32 = __Block_byref_object_dispose__662;
    v33 = 0;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __38__PMLLogRegTrainingPlan_runWithError___block_invoke;
    v23[3] = &unk_24D3DAE30;
    v23[4] = self;
    v25 = &v28;
    v26 = v34;
    v6 = v5;
    v24 = v6;
    p_buf = &buf;
    -[PMLLogRegTrainingPlan loadSessionsWithBlock:](self, "loadSessionsWithBlock:", v23);
    if (a3 && (v7 = (void *)v29[5]) != 0)
    {
      v8 = 0;
      *a3 = objc_retainAutorelease(v7);
    }
    else
    {
      +[PMLPlanDescriptor descriptorFromPlanId:](PMLPlanDescriptor, "descriptorFromPlanId:", self->_planId);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = CFSTR("name");
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v10;
      v35[1] = CFSTR("version");
      objc_msgSend(v9, "version");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v11;
      v35[2] = CFSTR("locale");
      objc_msgSend(v9, "locale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setObject:forKeyedSubscript:", v13, CFSTR("plan"));

      v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(v34, 8);
    _Block_object_dispose(&buf, 8);

  }
  return v8;
}

- (id)toPlistWithChunks:(id)a3
{
  NSString *planId;
  PMLSessionDescriptor *sessionDescriptor;
  id v6;
  double v7;
  double v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[24];
  _QWORD v35[26];

  v35[24] = *MEMORY[0x24BDAC8D0];
  planId = self->_planId;
  v34[0] = CFSTR("PLAN_ID");
  v34[1] = CFSTR("IS_SYNCHRONOUS");
  v35[0] = planId;
  v35[1] = MEMORY[0x24BDBD1C8];
  v34[2] = CFSTR("SESSIONS_MODEL_HANDLE");
  sessionDescriptor = self->_sessionDescriptor;
  v6 = a3;
  -[PMLSessionDescriptor toPlistWithChunks:](sessionDescriptor, "toPlistWithChunks:", v6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v33;
  v34[3] = CFSTR("SESSIONS_LIMIT");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_maxSessionsLimit);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v32;
  v34[4] = CFSTR("SESSIONS_IN_BATCH");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_sessionsInBatch);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v31;
  v34[5] = CFSTR("WEIGHTS");
  -[PMLModelWeights toPlistWithChunks:](self->_currentModelWeights, "toPlistWithChunks:", v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v30;
  v34[6] = CFSTR("LEARNING_RATE");
  *(float *)&v7 = self->_localLearningRate;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v29;
  v34[7] = CFSTR("STOPPING_THRESHOLD");
  *(float *)&v8 = self->_stoppingThreshold;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v28;
  v34[8] = CFSTR("MIN_ITERATIONS");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_localMinimumIterations);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v27;
  v34[9] = CFSTR("GRADIENT_ITERATIONS");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_localGradientIterations);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v26;
  v34[10] = CFSTR("SERVER_ITERATION");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_currentServerIteration);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[10] = v25;
  v34[11] = CFSTR("IS_MULTI_LABEL");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isMultiLabel);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[11] = v24;
  v34[12] = CFSTR("POSITIVE_LABEL");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_positiveLabel);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[12] = v23;
  v34[13] = CFSTR("NOISE_STRATEGY_TYPE");
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[13] = v22;
  v34[14] = CFSTR("NOISE_STRATEGY");
  -[PMLNoiseStrategy toPlistWithChunks:](self->_noiseStrategy, "toPlistWithChunks:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[14] = v21;
  v34[15] = CFSTR("ONLY_INTERNAL_SESSIONS");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useOnlyAppleInternalSessions);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[15] = v10;
  v34[16] = CFSTR("INTERCEPT");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_intercept);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[16] = v11;
  v34[17] = CFSTR("TRACKER");
  -[PMLLogRegTrackerProtocol toPlistWithChunks:](self->_tracker, "toPlistWithChunks:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v35[17] = v12;
  v34[18] = CFSTR("TRACKER_TYPE");
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[18] = v14;
  v34[19] = CFSTR("SKEW");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_skew);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[19] = v15;
  v34[20] = CFSTR("THRESHOLD");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_threshold);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[20] = v16;
  v34[21] = CFSTR("EVALUATION_LEVEL");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_evaluationLevel);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[21] = v17;
  v34[22] = CFSTR("REPORT_SCALE");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_reportScale);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[23] = CFSTR("BEFORE_NOISE_SCALING");
  v35[22] = v18;
  v35[23] = &unk_24D3EAA00;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (PMLLogRegTrainingPlan)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PMLSessionDescriptor *v11;
  void *v12;
  PMLSessionDescriptor *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  PMLModelWeights *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSString *v29;
  objc_class *v30;
  id v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  int v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  char v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  double v48;
  double v49;
  PMLLogRegTrainingPlan *v50;
  void *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  char v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  NSString *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  __CFString *v82;
  PMLSessionDescriptor *v83;
  void *v84;
  void *v85;
  void *v86;
  id v88;
  uint8_t buf[16];
  const __CFString *v90;
  _QWORD v91[3];

  v91[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v88 = a4;
  v9 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TRAINING_STORE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (objc_class *)objc_opt_class();
    NSStringFromClass(v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLLogRegTrainingPlan.m"), 369, CFSTR("Can't instantiate %@. Missing \"store\" dependency."), v54);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLAN_ID"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [PMLSessionDescriptor alloc];
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SESSIONS_MODEL_HANDLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PMLSessionDescriptor initWithPlist:chunks:context:](v11, "initWithPlist:chunks:context:", v12, v88, v9);

  if (v13)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NOISE_STRATEGY_TYPE"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(MEMORY[0x24BE7A5C8], "isInternalBuild") & 1) == 0
      && (objc_msgSend(MEMORY[0x24BE7A5C8], "isBetaBuild") & 1) == 0
      && objc_msgSend(CFSTR("PMLNoNoiseStrategy"), "isEqualToString:", v14))
    {

      v14 = CFSTR("PMLDiffPrivacyNoiseStrategy");
    }
    if (objc_msgSend(CFSTR("PMLSeparatedDPNoiseStrategy"), "isEqualToString:", v14))
    {
      v15 = (void *)objc_msgSend(v9, "mutableCopy");
      -[PMLSessionDescriptor name](v13, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PMLSeparatedDPNoiseStrategy getPFLIdentifier:](PMLSeparatedDPNoiseStrategy, "getPFLIdentifier:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("PFL_ID"));

      v9 = v15;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLUGIN_SHOULD_ADD_NOISE_AND_ENCRYPT_RESULT"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18 && (objc_msgSend(v18, "BOOLValue") & 1) == 0)
    {
      PML_LogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2159BB000, v20, OS_LOG_TYPE_DEFAULT, "PMLLogRegTrainingPlan running with no noise strategy since pluginShouldAddNoiseAndEncryptResult set to false", buf, 2u);
      }

      v14 = CFSTR("PMLNoNoiseStrategy");
    }
    v21 = objc_alloc(NSClassFromString(&v14->isa));
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NOISE_STRATEGY"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "initWithPlist:chunks:context:", v22, v88, v9);

    v24 = (void *)v23;
    if (v23)
    {
      v85 = (void *)v23;
      v25 = [PMLModelWeights alloc];
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WEIGHTS"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[PMLModelWeights initWithPlist:chunks:context:](v25, "initWithPlist:chunks:context:", v26, v88, v9);

      v28 = (void *)v27;
      if (v27)
      {
        v83 = v13;
        v84 = (void *)v27;
        v81 = v19;
        v82 = v14;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TRACKER_TYPE"));
        v29 = (NSString *)objc_claimAutoreleasedReturnValue();
        v30 = NSClassFromString(v29);
        if (!v30)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (objc_class *)objc_opt_class();
          NSStringFromClass(v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLLogRegTrainingPlan.m"), 407, CFSTR("Can't instantiate %@. Unknown tracker class: %@"), v57, v29);

        }
        v31 = [v30 alloc];
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TRACKER"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = CFSTR("planId");
        v91[0] = v86;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, &v90, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (void *)objc_msgSend(v31, "initWithPlist:chunks:context:", v32, v88, v33);

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TRAINING_STORE"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SESSIONS_LIMIT"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v80, "unsignedIntegerValue");
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SESSIONS_IN_BATCH"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v79, "unsignedIntegerValue");
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SERVER_ITERATION"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v78, "unsignedIntegerValue");
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LEARNING_RATE"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "floatValue");
        v35 = v34;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("STOPPING_THRESHOLD"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "floatValue");
        v37 = v36;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MIN_ITERATIONS"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v72, "unsignedIntegerValue");
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("GRADIENT_ITERATIONS"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v70, "unsignedIntegerValue");
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ONLY_INTERNAL_SESSIONS"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v68, "BOOLValue");
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SKEW"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "doubleValue");
        v39 = v38;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("THRESHOLD"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "doubleValue");
        v41 = v40;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IS_MULTI_LABEL"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        HIDWORD(v59) = objc_msgSend(v62, "BOOLValue");
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("INTERCEPT"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v60, "BOOLValue");
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("POSITIVE_LABEL"));
        v66 = v29;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "unsignedIntegerValue");
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("EVALUATION_LEVEL"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "unsignedIntegerValue");
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("REPORT_SCALE"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v59) = objc_msgSend(v47, "BOOLValue");
        BYTE2(v58) = v42;
        BYTE1(v58) = BYTE4(v59);
        LOBYTE(v58) = v61;
        LODWORD(v48) = v35;
        LODWORD(v49) = v37;
        v24 = v85;
        v50 = objc_retain(-[PMLLogRegTrainingPlan initWithStore:tracker:noiseStrategy:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentServerIteration:currentModelWeights:localLearningRate:stoppingThreshold:localMinimumIterations:localGradientIterations:useOnlyAppleInternalSessions:skew:threshold:isMultiLabel:intercept:positiveLabel:evaluationLevel:reportScale:](self, "initWithStore:tracker:noiseStrategy:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentServerIteration:currentModelWeights:localLearningRate:stoppingThreshold:localMinimumIterations:localGradientIterations:useOnlyAppleInternalSessions:skew:threshold:isMultiLabel:intercept:positiveLabel:evaluationLevel:reportScale:", v75, v77, v85, v86, v83, v73, v48, v49, v39, v41, v71, v69, v84,
                  v64,
                  v63,
                  v58,
                  v44,
                  v46,
                  v59));

        v13 = v83;
        v28 = v84;
        self = v50;
        v19 = v81;
        v14 = v82;
      }
      else
      {
        v50 = 0;
        v24 = v85;
      }

    }
    else
    {
      v50 = 0;
    }

  }
  else
  {
    v50 = 0;
  }

  return v50;
}

- (NSString)planId
{
  return self->_planId;
}

- (PMLTrainingStore)store
{
  return self->_store;
}

- (PMLLogRegTrackerProtocol)tracker
{
  return self->_tracker;
}

- (unint64_t)currentServerIteration
{
  return self->_currentServerIteration;
}

- (PMLSessionDescriptor)sessionDescriptor
{
  return self->_sessionDescriptor;
}

- (unint64_t)maxSessionsLimit
{
  return self->_maxSessionsLimit;
}

- (PMLModelWeights)currentModelWeights
{
  return self->_currentModelWeights;
}

- (float)localLearningRate
{
  return self->_localLearningRate;
}

- (float)stoppingThreshold
{
  return self->_stoppingThreshold;
}

- (unint64_t)localMinimumIterations
{
  return self->_localMinimumIterations;
}

- (unint64_t)localGradientIterations
{
  return self->_localGradientIterations;
}

- (BOOL)useOnlyAppleInternalSessions
{
  return self->_useOnlyAppleInternalSessions;
}

- (BOOL)isMultiLabel
{
  return self->_isMultiLabel;
}

- (unint64_t)positiveLabel
{
  return self->_positiveLabel;
}

- (BOOL)intercept
{
  return self->_intercept;
}

- (unint64_t)evaluationLevel
{
  return self->_evaluationLevel;
}

- (BOOL)reportScale
{
  return self->_reportScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planId, 0);
  objc_storeStrong((id *)&self->_currentModelWeights, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
  objc_storeStrong((id *)&self->_noiseStrategy, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

void __38__PMLLogRegTrainingPlan_runWithError___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  float v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  float v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  _BYTE *v61;
  void *v62;
  void *v63;
  uint8_t v64[8];
  _QWORD v65[5];
  uint64_t v66;
  void *v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  PML_LogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(void **)(a1[4] + 32);
    *(float *)buf = 5.778e-34;
    v69 = v7;
    v70 = 2048;
    v71 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_2159BB000, v6, OS_LOG_TYPE_INFO, "Training model: %@ (available %lu sessions)", buf, 0x16u);
  }

  if (objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(*(id *)(a1[4] + 64), "length");
    objc_msgSend(v5, "covariates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "numberOfColumns") + *(unsigned __int8 *)(a1[4] + 145);

    if (v10 != v8)
    {
      v38 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v5, "covariates");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v38, "initWithFormat:", CFSTR("Cannot train model with covariates of length %tu but model weights of length %d (planid = %@)"), objc_msgSend(v39, "numberOfColumns"), objc_msgSend(*(id *)(a1[4] + 64), "length"), *(_QWORD *)(a1[4] + 152));

      PML_LogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        *(float *)buf = 5.7779e-34;
        v69 = v15;
        _os_log_fault_impl(&dword_2159BB000, v40, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
      }

      v41 = (void *)MEMORY[0x24BDD1540];
      v66 = *MEMORY[0x24BDD0FC8];
      v67 = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("ProactiveMLErrorDomain"), 100, v42);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = *(_QWORD *)(a1[6] + 8);
      v45 = *(void **)(v44 + 40);
      *(_QWORD *)(v44 + 40) = v43;

      *a3 = 1;
      goto LABEL_33;
    }
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += objc_msgSend(v5, "count");
    v11 = (void *)objc_msgSend(*(id *)(a1[4] + 64), "copy");
    v12 = a1[4];
    LODWORD(v13) = *(_DWORD *)(v12 + 80);
    LODWORD(v14) = *(_DWORD *)(v12 + 84);
    +[PMLLogisticRegressionModel solverWithWeights:andIntercept:learningRate:minIterations:stoppingThreshold:](PMLLogisticRegressionModel, "solverWithWeights:andIntercept:learningRate:minIterations:stoppingThreshold:", v11, *(unsigned __int8 *)(v12 + 145), *(_QWORD *)(v12 + 88), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v65[0] = MEMORY[0x24BDAC760];
    v65[1] = 3221225472;
    v65[2] = __38__PMLLogRegTrainingPlan_runWithError___block_invoke_22;
    v65[3] = &unk_24D3DBE58;
    v65[4] = a1[4];
    v16 = MEMORY[0x2199EA798](v65);
    objc_msgSend(v5, "covariates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCovariates:", v17);

    v18 = (void *)a1[4];
    objc_msgSend(v5, "outcomes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "normalizeRegressor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObjective:", v20);

    v21 = *(_QWORD *)(a1[4] + 56);
    objc_msgSend(v5, "covariates");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "batchPredict:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)a1[4];
    objc_msgSend(v5, "outcomes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "denseVector");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)v23;
    v63 = (void *)v16;
    objc_msgSend(v24, "evaluationMetricsForPredictions:objectives:predicate:start:", v23, v26, v16, a1[5]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v61 = a3;
      objc_msgSend(v15, "computeAvgGradientWithIterations:", *(_QWORD *)(a1[4] + 72));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "gradient");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "loss");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)buf = 1.0;
      v31 = objc_msgSend(*(id *)(a1[4] + 24), "scaleAndAddNoiseToDenseVector:usingNorm:scaleFactor:", v29, *(unsigned __int8 *)(a1[4] + 144), buf);
      if ((v31 & 1) != 0)
      {
        v32 = a1[4];
        if (*(_BYTE *)(v32 + 144))
          v33 = *(float *)buf;
        else
          v33 = 1.0;
        v34 = *(void **)(v32 + 16);
        objc_msgSend(v5, "minibatchStatsForPositiveLabel:", *(_QWORD *)(v32 + 128));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v36 = v33;
        objc_msgSend(v34, "trackGradient:scaleFactor:minibatchStats:evaluationMetrics:serverIteration:", v29, v35, v27, *(_QWORD *)(a1[4] + 56), v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "setDictionary:", v37);
          if (v30)
            objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "setObject:forKeyedSubscript:", v30, CFSTR("loss"));
        }
      }
      else
      {
        PML_LogHandle();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v64 = 0;
          _os_log_error_impl(&dword_2159BB000, v54, OS_LOG_TYPE_ERROR, "scaleAndAddNoiseToDenseVector failed", v64, 2u);
        }

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ProactiveMLErrorDomain"), 7, 0);
        v55 = objc_claimAutoreleasedReturnValue();
        v56 = *(_QWORD *)(a1[6] + 8);
        v37 = *(void **)(v56 + 40);
        *(_QWORD *)(v56 + 40) = v55;
      }

      if (!v31)
        goto LABEL_32;
    }
    else
    {
      objc_msgSend(v15, "solve");
      objc_msgSend(v15, "weights");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "asMutableDenseVector");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      *(float *)buf = 1.0;
      if ((objc_msgSend(*(id *)(a1[4] + 24), "scaleAndAddNoiseToDenseVector:usingNorm:scaleFactor:", v47, *(unsigned __int8 *)(a1[4] + 144), buf) & 1) == 0)
      {
        PML_LogHandle();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v64 = 0;
          _os_log_error_impl(&dword_2159BB000, v57, OS_LOG_TYPE_ERROR, "scaleAndAddNoiseToDenseVector failed", v64, 2u);
        }

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ProactiveMLErrorDomain"), 7, 0);
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = *(_QWORD *)(a1[6] + 8);
        v60 = *(void **)(v59 + 40);
        *(_QWORD *)(v59 + 40) = v58;

        goto LABEL_32;
      }
      v61 = a3;
      v48 = a1[4];
      if (*(_BYTE *)(v48 + 144))
        v49 = *(float *)buf;
      else
        v49 = 1.0;
      v50 = *(void **)(v48 + 16);
      objc_msgSend(v5, "minibatchStatsForPositiveLabel:", *(_QWORD *)(v48 + 128));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v52 = v49;
      objc_msgSend(v50, "trackWeights:scaleFactor:minibatchStats:evaluationMetrics:", v47, v51, v27, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
        objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "setDictionary:", v53);

    }
    if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) >= *(_QWORD *)(a1[4] + 40))
      *v61 = 1;
LABEL_32:

LABEL_33:
  }

}

BOOL __38__PMLLogRegTrainingPlan_runWithError___block_invoke_22(uint64_t a1, float a2)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 112) < a2;
}

+ (id)planWithStore:(id)a3 tracker:(id)a4 sessionDescriptor:(id)a5 arguments:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  PMLLogRegTrainingPlan *v49;
  double v50;
  double v51;
  PMLLogRegTrainingPlan *v52;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  char v58;
  uint64_t v59;
  char v60;
  void *v61;
  uint64_t v62;
  __CFString *v63;
  void *v64;

  v9 = a6;
  v57 = a5;
  v56 = a4;
  v10 = a3;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("noiseStrategy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_opt_new();
  v64 = v13;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("planId"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = CFSTR("FiM_logreg-1.0-en");
  if (v14)
    v16 = (__CFString *)v14;
  v63 = v16;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("serverIteration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("serverIteration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v18, "unsignedIntegerValue");

  }
  else
  {
    v62 = 0;
  }

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("intercept"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("generateWeightsOfLength"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "intValue");

  +[PMLModelWeights modelWeightsOfLength:rngSeed:](PMLModelWeights, "modelWeightsOfLength:rngSeed:", v21, 1234567);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("localLearningRate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("localLearningRate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "floatValue");
    v25 = v24;

  }
  else
  {
    v25 = 1017370378;
  }

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("stoppingThreshold"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("stoppingThreshold"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");
    v29 = v28;

  }
  else
  {
    v29 = 953267991;
  }

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("localMinimumIterations"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("localMinimumIterations"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v31, "unsignedIntegerValue");

  }
  else
  {
    v59 = 100;
  }

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("localGradientIterations"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "unsignedIntegerValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("reportScale"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v34, "BOOLValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("useOnlyAppleInternalSessions"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "BOOLValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sessionsInBatch"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "integerValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("maxSessionsLimit"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "unsignedIntegerValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("positiveLabel"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("positiveLabel"));
    v42 = v33;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "unsignedIntegerValue");

    v33 = v42;
    v45 = v44;
  }
  else
  {
    v45 = 1;
  }
  v46 = v41 != 0;
  if (!v40)
    v40 = 100;
  if (v38 <= 1)
    v47 = 1;
  else
    v47 = v38;
  if (v33 <= 1)
    v48 = 1;
  else
    v48 = v33;
  v49 = [PMLLogRegTrainingPlan alloc];
  LOBYTE(v55) = v58;
  BYTE2(v54) = v60;
  BYTE1(v54) = v46;
  LOBYTE(v54) = v36;
  LODWORD(v50) = v25;
  LODWORD(v51) = v29;
  v52 = -[PMLLogRegTrainingPlan initWithStore:tracker:noiseStrategy:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentServerIteration:currentModelWeights:localLearningRate:stoppingThreshold:localMinimumIterations:localGradientIterations:useOnlyAppleInternalSessions:skew:threshold:isMultiLabel:intercept:positiveLabel:evaluationLevel:reportScale:](v49, "initWithStore:tracker:noiseStrategy:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentServerIteration:currentModelWeights:localLearningRate:stoppingThreshold:localMinimumIterations:localGradientIterations:useOnlyAppleInternalSessions:skew:threshold:isMultiLabel:intercept:positiveLabel:evaluationLevel:reportScale:", v10, v56, v64, v63, v57, v40, v50, v51, 0.5, 0.5, v47, v62, v61, v59, v48,
          v54,
          v45,
          2,
          v55);

  return v52;
}

@end
