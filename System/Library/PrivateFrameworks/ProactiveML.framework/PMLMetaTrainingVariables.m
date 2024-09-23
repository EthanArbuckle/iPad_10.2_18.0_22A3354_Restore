@implementation PMLMetaTrainingVariables

- (PMLMetaTrainingVariables)initWithPlanId:(id)a3 store:(id)a4 noiseStrategy:(id)a5 sessionDescriptor:(id)a6 maxSessionsToTrainOn:(unint64_t)a7 trainingSetSize:(unint64_t)a8 labelsToTrainOn:(id)a9 currentServerIteration:(unint64_t)a10 lossThresholdForStopping:(double)a11 epochsPerBatch:(unint64_t)a12 probThreshold:(double)a13 evaluationLevel:(unint64_t)a14 reportScale:(BOOL)a15 summableMetricsOnly:(BOOL)a16
{
  id v23;
  id v24;
  id v25;
  id v26;
  PMLMetaTrainingVariables *v27;
  void *v29;
  id v33;
  objc_super v34;

  v23 = a3;
  v33 = a4;
  v24 = a5;
  v25 = a6;
  v26 = a9;
  v34.receiver = self;
  v34.super_class = (Class)PMLMetaTrainingVariables;
  v27 = -[PMLMetaTrainingVariables init](&v34, sel_init);
  if (v27)
  {
    if (!+[PMLPlanDescriptor isValidPlanId:](PMLPlanDescriptor, "isValidPlanId:", v23))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v27, CFSTR("PMLEspressoTrainingPlan.m"), 79, CFSTR("Invalid planId. Must be <name>-<version>-<locale> but got %@"), v23);

    }
    objc_storeStrong((id *)&v27->_planId, a3);
    objc_storeStrong((id *)&v27->_store, a4);
    objc_storeStrong((id *)&v27->_noiseStrategy, a5);
    objc_storeStrong((id *)&v27->_sessionDescriptor, a6);
    v27->_maxSessionsToTrainOn = a7;
    v27->_trainingSetSize = a8;
    objc_storeStrong((id *)&v27->_labelsToTrainOn, a9);
    v27->_currentServerIteration = a10;
    v27->_lossThresholdForStopping = a11;
    v27->_epochsPerBatch = a12;
    v27->_probThreshold = a13;
    v27->_evaluationLevel = a14;
    v27->_reportScale = a15;
    v27->_summableMetricsOnly = a16;
  }

  return v27;
}

- (BOOL)isEqualToMetaTrainingVariables:(id)a3
{
  id *v4;
  NSString *planId;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  PMLSessionDescriptor *sessionDescriptor;
  PMLSessionDescriptor *v11;
  PMLSessionDescriptor *v12;
  PMLSessionDescriptor *v13;
  BOOL v14;
  unint64_t maxSessionsToTrainOn;
  unint64_t trainingSetSize;
  NSArray *labelsToTrainOn;
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  char v21;
  unint64_t currentServerIteration;
  double lossThresholdForStopping;
  double v24;
  unint64_t epochsPerBatch;
  double probThreshold;
  double v27;
  unint64_t evaluationLevel;
  int reportScale;
  int summableMetricsOnly;
  PMLNoiseStrategy *noiseStrategy;
  void *v32;
  char v33;

  v4 = (id *)a3;
  planId = self->_planId;
  v6 = (NSString *)v4[1];
  if (planId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = planId;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
LABEL_23:
      v33 = 0;
      goto LABEL_24;
    }
  }
  sessionDescriptor = self->_sessionDescriptor;
  v11 = (PMLSessionDescriptor *)v4[4];
  if (sessionDescriptor == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = sessionDescriptor;
    v14 = -[PMLSessionDescriptor isEqual:](v13, "isEqual:", v12);

    if (!v14)
      goto LABEL_23;
  }
  maxSessionsToTrainOn = self->_maxSessionsToTrainOn;
  if (maxSessionsToTrainOn != objc_msgSend(v4, "maxSessionsToTrainOn"))
    goto LABEL_23;
  trainingSetSize = self->_trainingSetSize;
  if (trainingSetSize != objc_msgSend(v4, "trainingSetSize"))
    goto LABEL_23;
  labelsToTrainOn = self->_labelsToTrainOn;
  v18 = (NSArray *)v4[7];
  if (labelsToTrainOn == v18)
  {

  }
  else
  {
    v19 = v18;
    v20 = labelsToTrainOn;
    v21 = -[NSArray isEqual:](v20, "isEqual:", v19);

    if ((v21 & 1) == 0)
      goto LABEL_23;
  }
  currentServerIteration = self->_currentServerIteration;
  if (currentServerIteration != objc_msgSend(v4, "currentServerIteration"))
    goto LABEL_23;
  lossThresholdForStopping = self->_lossThresholdForStopping;
  objc_msgSend(v4, "lossThresholdForStopping");
  if (lossThresholdForStopping != v24)
    goto LABEL_23;
  epochsPerBatch = self->_epochsPerBatch;
  if (epochsPerBatch != objc_msgSend(v4, "epochsPerBatch"))
    goto LABEL_23;
  probThreshold = self->_probThreshold;
  objc_msgSend(v4, "probThreshold");
  if (probThreshold != v27)
    goto LABEL_23;
  evaluationLevel = self->_evaluationLevel;
  if (evaluationLevel != objc_msgSend(v4, "evaluationLevel"))
    goto LABEL_23;
  reportScale = self->_reportScale;
  if (reportScale != objc_msgSend(v4, "reportScale"))
    goto LABEL_23;
  summableMetricsOnly = self->_summableMetricsOnly;
  if (summableMetricsOnly != objc_msgSend(v4, "summableMetricsOnly"))
    goto LABEL_23;
  noiseStrategy = self->_noiseStrategy;
  objc_msgSend(v4, "noiseStrategy");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[PMLNoiseStrategy isMemberOfClass:](noiseStrategy, "isMemberOfClass:", objc_opt_class());

LABEL_24:
  return v33;
}

- (BOOL)isEqual:(id)a3
{
  PMLMetaTrainingVariables *v4;
  PMLMetaTrainingVariables *v5;
  BOOL v6;

  v4 = (PMLMetaTrainingVariables *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PMLMetaTrainingVariables isEqualToMetaTrainingVariables:](self, "isEqualToMetaTrainingVariables:", v5);

  return v6;
}

- (PMLMetaTrainingVariables)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  PMLSessionDescriptor *v13;
  void *v14;
  PMLSessionDescriptor *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  char v45;
  PMLMetaTrainingVariables *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  PMLMetaTrainingVariables *v50;
  void *v51;
  void *v52;
  void *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  PMLSessionDescriptor *v58;
  void *v59;
  void *v60;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TRAINING_STORE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLEspressoTrainingPlan.m"), 135, CFSTR("Can't instantiate %@. Missing \"store\" dependency."), v41);

  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TRAINING_STORE"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLAN_ID"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [PMLSessionDescriptor alloc];
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SESSIONS_MODEL_HANDLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PMLSessionDescriptor initWithPlist:chunks:context:](v13, "initWithPlist:chunks:context:", v14, v10, v11);

  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLEspressoTrainingPlan.m"), 143, CFSTR("Session descriptor must be nonnull for PMLEspressoTrainingPlan initWithPlist"));

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NOISE_STRATEGY_TYPE"));
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x24BE7A5C8], "isInternalBuild") & 1) == 0
    && (objc_msgSend(MEMORY[0x24BE7A5C8], "isBetaBuild") & 1) == 0
    && objc_msgSend(CFSTR("PMLNoNoiseStrategy"), "isEqualToString:", v16))
  {

    v16 = CFSTR("PMLDiffPrivacyNoiseStrategy");
  }
  v58 = v15;
  if (objc_msgSend(CFSTR("PMLSeparatedDPNoiseStrategy"), "isEqualToString:", v16))
  {
    v17 = (void *)objc_msgSend(v11, "mutableCopy");
    -[PMLSessionDescriptor name](v15, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PMLSeparatedDPNoiseStrategy getPFLIdentifier:](PMLSeparatedDPNoiseStrategy, "getPFLIdentifier:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("PFL_ID"));

    v11 = v17;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLUGIN_SHOULD_ADD_NOISE_AND_ENCRYPT_RESULT"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v20;
  if (v20 && (objc_msgSend(v20, "BOOLValue") & 1) == 0)
  {
    PML_LogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2159BB000, v21, OS_LOG_TYPE_DEFAULT, "PMLEspressoTrainingPlan running with no noise strategy since pluginShouldAddNoiseAndEncryptResult set to false", buf, 2u);
    }

    v16 = CFSTR("PMLNoNoiseStrategy");
    v45 = 1;
  }
  else
  {
    v45 = 0;
  }
  v54 = v16;
  v22 = objc_alloc(NSClassFromString(&v16->isa));
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NOISE_STRATEGY"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "initWithPlist:chunks:context:", v23, v10, v11);

  v55 = v11;
  v56 = v10;
  v51 = (void *)v24;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLEspressoTrainingPlan.m"), 169, CFSTR("Noise strategy must be nonnull for PMLEspressoTrainingPlan initWithPlist"));

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SESSIONS_LIMIT"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v53, "unsignedIntegerValue");
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SESSIONS_IN_BATCH"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v52, "unsignedIntegerValue");
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LABELS_TO_TRAIN_ON"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SERVER_ITERATION"));
  v46 = self;
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v48, "unsignedIntegerValue");
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("STOPPING_THRESHOLD"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  v29 = v28;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MIN_ITERATIONS"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "unsignedIntegerValue");
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("THRESHOLD"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "doubleValue");
  v34 = v33;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("EVALUATION_LEVEL"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "unsignedIntegerValue");
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("REPORT_SCALE"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v44) = v45;
  LOBYTE(v44) = objc_msgSend(v37, "BOOLValue");
  v50 = -[PMLMetaTrainingVariables initWithPlanId:store:noiseStrategy:sessionDescriptor:maxSessionsToTrainOn:trainingSetSize:labelsToTrainOn:currentServerIteration:lossThresholdForStopping:epochsPerBatch:probThreshold:evaluationLevel:reportScale:summableMetricsOnly:](v46, "initWithPlanId:store:noiseStrategy:sessionDescriptor:maxSessionsToTrainOn:trainingSetSize:labelsToTrainOn:currentServerIteration:lossThresholdForStopping:epochsPerBatch:probThreshold:evaluationLevel:reportScale:summableMetricsOnly:", v59, v60, v51, v58, v49, v47, v29, v34, v25, v26, v31, v36, v44);

  return v50;
}

- (id)toPlistWithChunks:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  unint64_t currentServerIteration;
  NSArray *labelsToTrainOn;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[14];
  _QWORD v23[16];

  v23[14] = *MEMORY[0x24BDAC8D0];
  v23[0] = self->_planId;
  v22[0] = CFSTR("PLAN_ID");
  v22[1] = CFSTR("NOISE_STRATEGY_TYPE");
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v21;
  v22[2] = CFSTR("NOISE_STRATEGY");
  -[PMLNoiseStrategy toPlistWithChunks:](self->_noiseStrategy, "toPlistWithChunks:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v20;
  v22[3] = CFSTR("SESSIONS_MODEL_HANDLE");
  -[PMLSessionDescriptor toPlistWithChunks:](self->_sessionDescriptor, "toPlistWithChunks:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v23[3] = v19;
  v22[4] = CFSTR("SESSIONS_LIMIT");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_maxSessionsToTrainOn);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v6;
  v22[5] = CFSTR("SESSIONS_IN_BATCH");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_trainingSetSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  labelsToTrainOn = self->_labelsToTrainOn;
  currentServerIteration = self->_currentServerIteration;
  v23[5] = v7;
  v23[6] = labelsToTrainOn;
  v22[6] = CFSTR("LABELS_TO_TRAIN_ON");
  v22[7] = CFSTR("SERVER_ITERATION");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", currentServerIteration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v10;
  v22[8] = CFSTR("STOPPING_THRESHOLD");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lossThresholdForStopping);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v11;
  v22[9] = CFSTR("MIN_ITERATIONS");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_epochsPerBatch);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v12;
  v22[10] = CFSTR("THRESHOLD");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_probThreshold);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[10] = v13;
  v22[11] = CFSTR("EVALUATION_LEVEL");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_evaluationLevel);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[11] = v14;
  v22[12] = CFSTR("REPORT_SCALE");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_reportScale);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[12] = v15;
  v22[13] = CFSTR("SUMMABLE_METRICS_ONLY");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_summableMetricsOnly);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[13] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)planId
{
  return self->_planId;
}

- (PMLTrainingStore)store
{
  return self->_store;
}

- (PMLNoiseStrategy)noiseStrategy
{
  return self->_noiseStrategy;
}

- (PMLSessionDescriptor)sessionDescriptor
{
  return self->_sessionDescriptor;
}

- (unint64_t)maxSessionsToTrainOn
{
  return self->_maxSessionsToTrainOn;
}

- (unint64_t)trainingSetSize
{
  return self->_trainingSetSize;
}

- (NSArray)labelsToTrainOn
{
  return self->_labelsToTrainOn;
}

- (unint64_t)currentServerIteration
{
  return self->_currentServerIteration;
}

- (double)lossThresholdForStopping
{
  return self->_lossThresholdForStopping;
}

- (unint64_t)epochsPerBatch
{
  return self->_epochsPerBatch;
}

- (double)probThreshold
{
  return self->_probThreshold;
}

- (unint64_t)evaluationLevel
{
  return self->_evaluationLevel;
}

- (BOOL)reportScale
{
  return self->_reportScale;
}

- (BOOL)summableMetricsOnly
{
  return self->_summableMetricsOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsToTrainOn, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
  objc_storeStrong((id *)&self->_noiseStrategy, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_planId, 0);
}

@end
