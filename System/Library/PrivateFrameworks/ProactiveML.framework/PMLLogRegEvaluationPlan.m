@implementation PMLLogRegEvaluationPlan

- (PMLLogRegEvaluationPlan)initWithStore:(id)a3 tracker:(id)a4 planId:(id)a5 sessionDescriptor:(id)a6 maxSessionsLimit:(unint64_t)a7 sessionsInBatch:(unint64_t)a8 currentModelWeights:(id)a9 intercept:(BOOL)a10 skew:(double)a11 threshold:(double)a12 isMultiLabel:(BOOL)a13 positiveLabel:(unint64_t)a14 evaluationLevel:(unint64_t)a15
{
  id v24;
  id v25;
  id v26;
  id v27;
  PMLLogRegEvaluationPlan *v28;
  PMLLogRegEvaluationPlan *v29;
  void *v31;
  id obj;
  id v34;
  id v35;
  objc_super v36;

  v24 = a3;
  obj = a4;
  v25 = a4;
  v34 = a5;
  v26 = a5;
  v27 = a6;
  v35 = a9;
  if (!+[PMLPlanDescriptor isValidPlanId:](PMLPlanDescriptor, "isValidPlanId:", v26))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLLogRegEvaluationPlan.m"), 59, CFSTR("Invalid planId. Must be <name>-<version>-<locale> but got %@"), v26);

  }
  v36.receiver = self;
  v36.super_class = (Class)PMLLogRegEvaluationPlan;
  v28 = -[PMLLogRegEvaluationPlan init](&v36, sel_init);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_store, a3);
    objc_storeStrong((id *)&v29->_tracker, obj);
    objc_storeStrong((id *)&v29->_planId, v34);
    objc_storeStrong((id *)&v29->_sessionDescriptor, a6);
    v29->_maxSessionsLimit = a7;
    v29->_sessionsInBatch = a8;
    objc_storeStrong((id *)&v29->_currentModelWeights, a9);
    v29->_intercept = a10;
    v29->_isMultiLabel = a13;
    v29->_positiveLabel = a14;
    v29->_skew = a11;
    v29->_threshold = a12;
    v29->_evaluationLevel = a15;
  }

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
  -[PMLTrainingStore loadSessionsForModel:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:](store, "loadSessionsForModel:excludeItemIdsUsedWithin:limit:onlyAppleInternal:positiveLabel:skew:block:", sessionDescriptor, self->_sessionsInBatch, 0, self->_positiveLabel, v6);

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
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  _QWORD v12[4];

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5506;
  v10 = __Block_byref_object_dispose__5507;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__PMLLogRegEvaluationPlan_runWithError___block_invoke;
  v5[3] = &unk_24D3DBE80;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = v12;
  -[PMLLogRegEvaluationPlan loadSessionsWithBlock:](self, "loadSessionsWithBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(v12, 8);
  return v3;
}

- (id)toPlistWithChunks:(id)a3
{
  PMLSessionDescriptor *sessionDescriptor;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[13];
  _QWORD v22[15];

  v22[13] = *MEMORY[0x24BDAC8D0];
  v22[0] = self->_planId;
  v21[0] = CFSTR("PLAN_ID");
  v21[1] = CFSTR("SESSIONS_MODEL_HANDLE");
  sessionDescriptor = self->_sessionDescriptor;
  v5 = a3;
  -[PMLSessionDescriptor toPlistWithChunks:](sessionDescriptor, "toPlistWithChunks:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v20;
  v21[2] = CFSTR("SESSIONS_LIMIT");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_maxSessionsLimit);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v19;
  v21[3] = CFSTR("SESSIONS_IN_BATCH");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_sessionsInBatch);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  v21[4] = CFSTR("WEIGHTS");
  -[PMLModelWeights toPlistWithChunks:](self->_currentModelWeights, "toPlistWithChunks:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v6;
  v21[5] = CFSTR("INTERCEPT");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_intercept);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v7;
  v21[6] = CFSTR("IS_MULTI_LABEL");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isMultiLabel);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v8;
  v21[7] = CFSTR("POSITIVE_LABEL");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_positiveLabel);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v9;
  v21[8] = CFSTR("SKEW");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_skew);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v10;
  v21[9] = CFSTR("TRACKER");
  -[PMLEvaluationTrackerProtocol toPlistWithChunks:](self->_tracker, "toPlistWithChunks:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v22[9] = v11;
  v21[10] = CFSTR("THRESHOLD");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_threshold);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v12;
  v21[11] = CFSTR("TRACKER_TYPE");
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v14;
  v21[12] = CFSTR("EVALUATION_LEVEL");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_evaluationLevel);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[12] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (PMLLogRegEvaluationPlan)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  PMLSessionDescriptor *v14;
  void *v15;
  PMLSessionDescriptor *v16;
  PMLModelWeights *v17;
  void *v18;
  PMLModelWeights *v19;
  objc_class *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  PMLLogRegEvaluationPlan *v29;
  char v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  char v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  PMLModelWeights *v57;
  PMLSessionDescriptor *v58;
  void *v59;
  id v60;
  NSString *v61;
  PMLLogRegEvaluationPlan *v62;
  const __CFString *v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TRAINING_STORE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (objc_class *)objc_opt_class();
    NSStringFromClass(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLLogRegEvaluationPlan.m"), 182, CFSTR("Can't instantiate %@. Missing \"store\" dependency."), v44);

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLAN_ID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [PMLSessionDescriptor alloc];
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SESSIONS_MODEL_HANDLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PMLSessionDescriptor initWithPlist:chunks:context:](v14, "initWithPlist:chunks:context:", v15, v10, v11);

  if (v16)
  {
    v17 = [PMLModelWeights alloc];
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("WEIGHTS"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PMLModelWeights initWithPlist:chunks:context:](v17, "initWithPlist:chunks:context:", v18, v10, v11);

    if (v19)
    {
      v62 = self;
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TRACKER_TYPE"));
      v61 = (NSString *)objc_claimAutoreleasedReturnValue();
      v20 = NSClassFromString(v61);
      v57 = v19;
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (objc_class *)objc_opt_class();
        NSStringFromClass(v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, v62, CFSTR("PMLLogRegEvaluationPlan.m"), 196, CFSTR("Can't instantiate %@. Unknown tracker class: %@"), v47, v61);

      }
      v21 = [v20 alloc];
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TRACKER"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = CFSTR("planId");
      v64[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithPlist:chunks:context:", v22, v10, v23);

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("tracker"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v59 = v13;
      v60 = v10;
      v58 = v16;
      if (v25)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("tracker"));
        v26 = objc_claimAutoreleasedReturnValue();

        v27 = v11;
        v28 = (void *)v26;
      }
      else
      {
        v27 = v11;
        v28 = v24;
      }
      v56 = v27;
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("TRAINING_STORE"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SESSIONS_LIMIT"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v55, "unsignedIntegerValue");
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SESSIONS_IN_BATCH"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v54, "unsignedIntegerValue");
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("INTERCEPT"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v53, "BOOLValue");
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SKEW"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "doubleValue");
      v32 = v31;
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("THRESHOLD"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "doubleValue");
      v35 = v34;
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IS_MULTI_LABEL"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "BOOLValue");
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("POSITIVE_LABEL"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "unsignedIntegerValue");
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("EVALUATION_LEVEL"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE1(v48) = v37;
      LOBYTE(v48) = v30;
      v19 = v57;
      self = -[PMLLogRegEvaluationPlan initWithStore:tracker:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentModelWeights:intercept:skew:threshold:isMultiLabel:positiveLabel:evaluationLevel:](v62, "initWithStore:tracker:planId:sessionDescriptor:maxSessionsLimit:sessionsInBatch:currentModelWeights:intercept:skew:threshold:isMultiLabel:positiveLabel:evaluationLevel:", v49, v28, v59, v58, v52, v50, v32, v35, v57, v48, v39, objc_msgSend(v40, "unsignedIntegerValue"));

      v13 = v59;
      v16 = v58;

      v29 = self;
      v10 = v60;
      v11 = v56;
    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (NSString)planId
{
  return self->_planId;
}

- (PMLTrainingStore)store
{
  return self->_store;
}

- (PMLEvaluationTrackerProtocol)tracker
{
  return self->_tracker;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planId, 0);
  objc_storeStrong((id *)&self->_currentModelWeights, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

void __40__PMLLogRegEvaluationPlan_runWithError___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  double v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  unint64_t v27;
  double v28;
  float v29;
  unint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  double v34;
  float v35;
  unint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  double v40;
  float v41;
  unint64_t v42;
  void *v43;
  void *v44;
  unint64_t v45;
  double v46;
  float v47;
  unint64_t v48;
  double v49;
  double v50;
  void *v51;
  _QWORD *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  _BYTE *v60;
  _QWORD *v61;
  void *v62;
  _QWORD v63[5];
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  PML_LogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = a1[4];
    v8 = *(_QWORD *)(v7 + 104);
    v9 = *(_QWORD *)(v7 + 24);
    *(_DWORD *)buf = 138412802;
    v65 = v8;
    v66 = 2112;
    v67 = v9;
    v68 = 2048;
    v69 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_2159BB000, v6, OS_LOG_TYPE_INFO, "Evaluating plan %@ (descriptor: %@, available %lu sessions)", buf, 0x20u);
  }

  if (objc_msgSend(v5, "count"))
  {
    v60 = a3;
    +[PMLLogisticRegressionModel solverWithWeights:andIntercept:](PMLLogisticRegressionModel, "solverWithWeights:andIntercept:", *(_QWORD *)(a1[4] + 48), *(unsigned __int8 *)(a1[4] + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "covariates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCovariates:", v11);

    v12 = (void *)a1[4];
    objc_msgSend(v5, "outcomes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "normalizeRegressor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObjective:", v14);

    objc_msgSend(v5, "covariates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v10;
    objc_msgSend(v10, "batchPredict:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __40__PMLLogRegEvaluationPlan_runWithError___block_invoke_11;
    v63[3] = &unk_24D3DBE58;
    v63[4] = a1[4];
    v17 = (void *)MEMORY[0x2199EA798](v63);
    objc_msgSend(v5, "outcomes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "denseVector");
    v61 = a1;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PMLClassificationEvaluationMetrics f1Score:predictions:predicate:](PMLClassificationEvaluationMetrics, "f1Score:predictions:predicate:", v19, v16, v17);
    v21 = v20;

    LODWORD(v22) = v21;
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3, v22);
    v24 = v23;
    objc_msgSend(v5, "outcomes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "denseVector");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = +[PMLClassificationEvaluationMetrics truePositives:predictions:predicate:](PMLClassificationEvaluationMetrics, "truePositives:predictions:predicate:", v26, v16, v17);

    *(float *)&v28 = (float)v27;
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3, v28);
    v30 = vcvtas_u32_f32(v29);
    objc_msgSend(v5, "outcomes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "denseVector");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = +[PMLClassificationEvaluationMetrics trueNegatives:predictions:predicate:](PMLClassificationEvaluationMetrics, "trueNegatives:predictions:predicate:", v32, v16, v17);

    *(float *)&v34 = (float)v33;
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3, v34);
    v36 = vcvtas_u32_f32(v35);
    objc_msgSend(v5, "outcomes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "denseVector");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = +[PMLClassificationEvaluationMetrics falsePositives:predictions:predicate:](PMLClassificationEvaluationMetrics, "falsePositives:predictions:predicate:", v38, v16, v17);

    *(float *)&v40 = (float)v39;
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3, v40);
    v42 = vcvtas_u32_f32(v41);
    objc_msgSend(v5, "outcomes");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "denseVector");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = +[PMLClassificationEvaluationMetrics falseNegatives:predictions:predicate:](PMLClassificationEvaluationMetrics, "falseNegatives:predictions:predicate:", v44, v16, v17);

    *(float *)&v46 = (float)v45;
    +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3, v46);
    v48 = vcvtas_u32_f32(v47);
    LODWORD(v49) = 0;
    LODWORD(v50) = v24;
    +[AWDProactiveModelFittingEvalMetrics evalMetricsWithRmse:f1:truePositives:trueNegatives:falsePositives:falseNegatives:](AWDProactiveModelFittingEvalMetrics, "evalMetricsWithRmse:f1:truePositives:trueNegatives:falsePositives:falseNegatives:", v30, v36, v42, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (_QWORD *)v61[4];
    if (v52[12] >= 2uLL)
    {
      objc_msgSend(v5, "outcomes");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "denseVector");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[PMLClassificationEvaluationMetrics addScoresForOutcomes:predictions:predicate:metrics:](PMLClassificationEvaluationMetrics, "addScoresForOutcomes:predictions:predicate:metrics:", v54, v16, v17, v51);

      v52 = (_QWORD *)v61[4];
    }
    v55 = (void *)v52[2];
    objc_msgSend(v5, "minibatchStatsForPositiveLabel:", v52[10]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "trackEvaluationMetrics:minibatchStats:", v51, v56);
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = *(_QWORD *)(v61[5] + 8);
    v59 = *(void **)(v58 + 40);
    *(_QWORD *)(v58 + 40) = v57;

    *(_QWORD *)(*(_QWORD *)(v61[6] + 8) + 24) += objc_msgSend(v5, "count");
    if (*(_QWORD *)(*(_QWORD *)(v61[6] + 8) + 24) >= *(_QWORD *)(v61[4] + 32))
      *v60 = 1;

  }
}

BOOL __40__PMLLogRegEvaluationPlan_runWithError___block_invoke_11(uint64_t a1, float a2)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 88) < a2;
}

@end
