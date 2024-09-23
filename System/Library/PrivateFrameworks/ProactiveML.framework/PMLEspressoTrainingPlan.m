@implementation PMLEspressoTrainingPlan

- (PMLEspressoTrainingPlan)initWithMetaTrainingVariables:(id)a3 espressoTrainingVariables:(id)a4
{
  id v7;
  id v8;
  PMLEspressoTrainingPlan *v9;
  uint64_t v10;
  NSString *planId;
  uint64_t v12;
  ETTaskDefinition *taskDefinition;
  void *v14;
  ETTaskDefinition *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  PMLEspressoTrainingPlan *v23;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PMLEspressoTrainingPlan;
  v9 = -[PMLEspressoTrainingPlan init](&v26, sel_init);
  if (!v9)
    goto LABEL_12;
  objc_msgSend(v7, "planId");
  v10 = objc_claimAutoreleasedReturnValue();
  planId = v9->_planId;
  v9->_planId = (NSString *)v10;

  objc_storeStrong((id *)&v9->_mtv, a3);
  objc_storeStrong((id *)&v9->_etv, a4);
  v12 = -[PMLEspressoTrainingPlan _newTaskForTraining](v9, "_newTaskForTraining");
  taskDefinition = v9->_taskDefinition;
  v9->_taskDefinition = (ETTaskDefinition *)v12;

  if (!v9->_taskDefinition)
  {
    PML_LogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2159BB000, v22, OS_LOG_TYPE_ERROR, "Unable to create task definition, returning nil for PMLEspressoTrainingPlan", buf, 2u);
    }

    goto LABEL_10;
  }
  v14 = (void *)MEMORY[0x2199EA600]();
  v15 = v9->_taskDefinition;
  -[PMLEspressoTrainingVariables globalsToGetGradientsFor](v9->_etv, "globalsToGetGradientsFor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLEspressoTrainingVariables layerWeightsToGetGradientsFor](v9->_etv, "layerWeightsToGetGradientsFor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLEspressoTrainingVariables layerBiasesToGetGradientsFor](v9->_etv, "layerBiasesToGetGradientsFor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v19 = +[PMLEspressoTrainingPlan _getModelParametersForTask:globalNames:weightNames:biasNames:error:](PMLEspressoTrainingPlan, "_getModelParametersForTask:globalNames:weightNames:biasNames:error:", v15, v16, v17, v18, &v25);
  v20 = v25;

  if (!v20)
  {
    objc_autoreleasePoolPop(v14);
LABEL_12:
    v23 = v9;
    goto LABEL_13;
  }
  PML_LogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v20;
    _os_log_error_impl(&dword_2159BB000, v21, OS_LOG_TYPE_ERROR, "Unable to fetch parameters requested in weights and biases during validation, returning nil for PMLEspressoTrainingPlan: %@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v14);
LABEL_10:
  v23 = 0;
LABEL_13:

  return v23;
}

- (id)_newTaskForTraining
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  _QWORD v28[2];
  _QWORD v29[2];
  void *v30;
  _QWORD v31[3];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE2F3B8]);
  -[PMLEspressoTrainingVariables trainingNetworkPath](self->_etv, "trainingNetworkPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLEspressoTrainingVariables inputName](self->_etv, "inputName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLEspressoTrainingVariables outputName](self->_etv, "outputName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLEspressoTrainingVariables inputName](self->_etv, "inputName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v21;
  -[PMLEspressoTrainingVariables trueLabelName](self->_etv, "trueLabelName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLEspressoTrainingVariables lossValueName](self->_etv, "lossValueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v5;
  -[PMLEspressoTrainingVariables trainingOutputName](self->_etv, "trainingOutputName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLEspressoTrainingVariables trainingControlVariableName](self->_etv, "trainingControlVariableName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLEspressoTrainingVariables initializerName](self->_etv, "initializerName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v10 = (void *)objc_msgSend(v3, "initWithTrainingNetworkPath:inferenceInputs:inferenceOutputs:trainingInputs:trainingOutputs:trainingControlVariableName:withInitializer:error:", v20, v17, v18, v4, v7, v8, v9, &v25);
  v11 = v25;

  if (!v10 || v11)
  {
    PML_LogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v11;
      _os_log_error_impl(&dword_2159BB000, v12, OS_LOG_TYPE_ERROR, "Unable to successfully initialize model: %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  v24 = 0;
  v12 = objc_msgSend(objc_alloc(MEMORY[0x24BE2F3D0]), "initWithTrainingModelDefinition:forPlatform:error:", v10, 1, &v24);
  v13 = v24;
  v11 = v13;
  if (!v12 || v13)
  {
    PML_LogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v11;
      _os_log_error_impl(&dword_2159BB000, v15, OS_LOG_TYPE_ERROR, "Unable to create task definition: %@", buf, 0xCu);
    }

LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v12 = v12;
  v14 = v12;
LABEL_12:

  return v14;
}

- (id)runWithError:(id *)a3
{
  void *v5;
  ETTaskDefinition *taskDefinition;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  ETTaskDefinition *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  PMLMutableDenseVector *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  ETDataProvider *trainingPredictions;
  ETDataProvider *groundTruth;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  uint8_t v55[8];
  _QWORD v56[8];
  _QWORD v57[4];
  id obj;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[3];
  uint8_t v69[4];
  uint64_t v70;
  __int128 buf;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__2735;
  v63 = __Block_byref_object_dispose__2736;
  v64 = 0;
  v5 = (void *)objc_opt_class();
  taskDefinition = self->_taskDefinition;
  -[PMLEspressoTrainingVariables globalsToGetGradientsFor](self->_etv, "globalsToGetGradientsFor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLEspressoTrainingVariables layerWeightsToGetGradientsFor](self->_etv, "layerWeightsToGetGradientsFor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMLEspressoTrainingVariables layerBiasesToGetGradientsFor](self->_etv, "layerBiasesToGetGradientsFor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(v60 + 5);
  obj = (id)v60[5];
  objc_msgSend(v5, "_getModelParametersForTask:globalNames:weightNames:biasNames:error:", taskDefinition, v7, v8, v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);

  if (v11)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v72 = 0x2020000000;
    v73 = 0;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x2020000000;
    v57[3] = 0;
    -[PMLMetaTrainingVariables store](self->_mtv, "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PMLMetaTrainingVariables sessionDescriptor](self->_mtv, "sessionDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PMLTrainingStore lastUsedTimestampLimit](PMLTrainingStore, "lastUsedTimestampLimit");
    v15 = v14;
    -[PMLMetaTrainingVariables labelsToTrainOn](self->_mtv, "labelsToTrainOn");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PMLMetaTrainingVariables trainingSetSize](self->_mtv, "trainingSetSize");
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __40__PMLEspressoTrainingPlan_runWithError___block_invoke;
    v56[3] = &unk_24D3DB970;
    v56[4] = self;
    v56[5] = &buf;
    v56[6] = &v59;
    v56[7] = v57;
    objc_msgSend(v12, "loadDataForModel:privacyBudgetRefreshPeriod:labels:batchSize:block:", v13, v16, v17, v56, v15);

    if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 24))
    {
      PML_LogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v69 = 0;
        _os_log_error_impl(&dword_2159BB000, v21, OS_LOG_TYPE_ERROR, "Returning nil since no training was done", v69, 2u);
      }

      goto LABEL_15;
    }
    if (v60[5])
    {
      PML_LogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v69 = 0;
        _os_log_error_impl(&dword_2159BB000, v18, OS_LOG_TYPE_ERROR, "Returning nil and early from training since an error occurred during training", v69, 2u);
      }

      if (a3)
      {
LABEL_20:
        v20 = 0;
        *a3 = objc_retainAutorelease((id)v60[5]);
        goto LABEL_36;
      }
LABEL_15:
      v20 = 0;
LABEL_36:
      _Block_object_dispose(v57, 8);
      _Block_object_dispose(&buf, 8);
      goto LABEL_37;
    }
    v22 = (void *)objc_opt_class();
    v23 = self->_taskDefinition;
    -[PMLEspressoTrainingVariables globalsToGetGradientsFor](self->_etv, "globalsToGetGradientsFor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PMLEspressoTrainingVariables layerWeightsToGetGradientsFor](self->_etv, "layerWeightsToGetGradientsFor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PMLEspressoTrainingVariables layerBiasesToGetGradientsFor](self->_etv, "layerBiasesToGetGradientsFor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_calculateGradientInPlaceForTask:startingParameters:globalNames:weightNames:biasNames:", v23, v11, v24, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v60[5];
    v60[5] = v27;

    if (v60[5])
    {
      PML_LogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v51 = v60[5];
        *(_DWORD *)v69 = 138412290;
        v70 = v51;
        _os_log_error_impl(&dword_2159BB000, v29, OS_LOG_TYPE_ERROR, "Returning nil since an error occurred when calculating the gradient: %@", v69, 0xCu);
      }

      if (a3)
        goto LABEL_20;
      goto LABEL_15;
    }
    v30 = -[PMLMutableDenseVector initWithMutableData:]([PMLMutableDenseVector alloc], "initWithMutableData:", v11);
    if (!+[PMLEspressoTrainingPlan isValidGradient:error:](PMLEspressoTrainingPlan, "isValidGradient:error:", v30, a3))goto LABEL_34;
    *(_DWORD *)v69 = 1065353216;
    -[PMLMetaTrainingVariables noiseStrategy](self->_mtv, "noiseStrategy");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "scaleAndAddNoiseToDenseVector:usingNorm:scaleFactor:", v30, -[PMLMetaTrainingVariables reportScale](self->_mtv, "reportScale"), v69);

    if ((v32 & 1) != 0)
    {
      -[PMLMetaTrainingVariables planId](self->_mtv, "planId");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[PMLPlanDescriptor descriptorFromPlanId:](PMLPlanDescriptor, "descriptorFromPlanId:", v33);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)objc_opt_new();
      v67[0] = CFSTR("plan");
      v65[0] = CFSTR("name");
      objc_msgSend(v54, "name");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v52;
      v65[1] = CFSTR("version");
      objc_msgSend(v54, "version");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v66[1] = v34;
      v65[2] = CFSTR("locale");
      objc_msgSend(v54, "locale");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v66[2] = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v36;
      v67[1] = CFSTR("gradient");
      -[PMLDenseVector data](v30, "data");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v37;
      v67[2] = CFSTR("serverIteration");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PMLMetaTrainingVariables currentServerIteration](self->_mtv, "currentServerIteration"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v68[2] = v38;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, v67, 3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addEntriesFromDictionary:", v39);

      v53 = -[PMLMetaTrainingVariables summableMetricsOnly](self->_mtv, "summableMetricsOnly");
      if (objc_msgSend(MEMORY[0x24BE7A5C8], "isInternalBuild"))
        v40 = 1.0;
      else
        v40 = 0.01;
      trainingPredictions = self->_trainingPredictions;
      groundTruth = self->_groundTruth;
      -[PMLEspressoTrainingVariables trueLabelName](self->_etv, "trueLabelName");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[PMLEspressoTrainingVariables trainingOutputName](self->_etv, "trainingOutputName");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PMLEspressoTrainingVariables lossValueName](self->_etv, "lossValueName");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[PMLMetaTrainingVariables probThreshold](self->_mtv, "probThreshold");
      +[PMLEspressoTrainingPlan _calculateTrainingMetricsWithSamplingProb:groundTruthProvider:predictionsProvider:trueLabelName:trainingOutputName:lossValueName:probThreshold:includeSummableOnly:](PMLEspressoTrainingPlan, "_calculateTrainingMetricsWithSamplingProb:groundTruthProvider:predictionsProvider:trueLabelName:trainingOutputName:lossValueName:probThreshold:includeSummableOnly:", groundTruth, trainingPredictions, v43, v44, v45, v53, v40, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
        objc_msgSend(v20, "addEntriesFromDictionary:", v47);

      goto LABEL_35;
    }
    PML_LogHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v55 = 0;
      _os_log_error_impl(&dword_2159BB000, v49, OS_LOG_TYPE_ERROR, "scaleAndAddNoiseToDenseVector failed", v55, 2u);
    }

    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ProactiveMLErrorDomain"), 7, 0);
      v20 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_34:
      v20 = 0;
    }
LABEL_35:

    goto LABEL_36;
  }
  PML_LogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v48 = v60[5];
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v48;
    _os_log_error_impl(&dword_2159BB000, v19, OS_LOG_TYPE_ERROR, "Returning nil since unable to snapshot starting model parameters: %@", (uint8_t *)&buf, 0xCu);
  }

  v20 = 0;
  if (a3)
    *a3 = objc_retainAutorelease((id)v60[5]);
LABEL_37:

  _Block_object_dispose(&v59, 8);
  return v20;
}

- (id)_updateResultsReferenceCallback:(id)a3
{
  id v5;
  void *v6;
  _QWORD v8[5];

  objc_storeStrong((id *)&self->_groundTruth, a3);
  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__PMLEspressoTrainingPlan__updateResultsReferenceCallback___block_invoke;
  v8[3] = &unk_24D3DBA10;
  v8[4] = self;
  v6 = (void *)MEMORY[0x2199EA798](v8);

  return v6;
}

- (BOOL)isEqualToEspressoTrainingPlan:(id)a3
{
  _QWORD *v4;
  NSString *planId;
  void *v6;
  BOOL v7;

  v4 = a3;
  planId = self->_planId;
  objc_msgSend(v4, "planId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSString isEqual:](planId, "isEqual:", v6)
    && -[PMLMetaTrainingVariables isEqualToMetaTrainingVariables:](self->_mtv, "isEqualToMetaTrainingVariables:", v4[3])
    && -[PMLEspressoTrainingVariables isEqualToEspressoTrainingVariables:](self->_etv, "isEqualToEspressoTrainingVariables:", v4[4]);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PMLEspressoTrainingPlan *v4;
  PMLEspressoTrainingPlan *v5;
  BOOL v6;

  v4 = (PMLEspressoTrainingPlan *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PMLEspressoTrainingPlan isEqualToEspressoTrainingPlan:](self, "isEqualToEspressoTrainingPlan:", v5);

  return v6;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<PMLEspressoTrainingPlan '%@'>"), self->_planId);
}

- (PMLEspressoTrainingPlan)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  PMLMetaTrainingVariables *v11;
  void *v12;
  PMLMetaTrainingVariables *v13;
  PMLEspressoTrainingVariables *v14;
  void *v15;
  NSObject *v16;
  PMLEspressoTrainingPlan *v17;
  NSObject *v18;
  uint8_t v20[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [PMLMetaTrainingVariables alloc];
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("META_TRAINING_VARIABLES"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PMLMetaTrainingVariables initWithPlist:chunks:context:](v11, "initWithPlist:chunks:context:", v12, v9, v10);

  if (!v13)
  {
    PML_LogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2159BB000, v16, OS_LOG_TYPE_ERROR, "Unable to init PMLEspressoTrainingPlan because unable to init PMLMetaTrainingVariables", buf, 2u);
    }
    goto LABEL_9;
  }
  v14 = [PMLEspressoTrainingVariables alloc];
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ESPRESSO_TRAINING_VARIABLES"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PMLEspressoTrainingVariables initWithPlist:chunks:context:](v14, "initWithPlist:chunks:context:", v15, v9, v10);

  if (!v16)
  {
    PML_LogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_error_impl(&dword_2159BB000, v18, OS_LOG_TYPE_ERROR, "Unable to init PMLEspressoTrainingPlan because unable to init PMLEspressoTrainingVariables", v20, 2u);
    }

    v16 = 0;
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  self = -[PMLEspressoTrainingPlan initWithMetaTrainingVariables:espressoTrainingVariables:](self, "initWithMetaTrainingVariables:espressoTrainingVariables:", v13, v16);
  v17 = self;
LABEL_10:

  return v17;
}

- (id)toPlistWithChunks:(id)a3
{
  PMLMetaTrainingVariables *mtv;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("META_TRAINING_VARIABLES");
  mtv = self->_mtv;
  v5 = a3;
  -[PMLMetaTrainingVariables toPlistWithChunks:](mtv, "toPlistWithChunks:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("ESPRESSO_TRAINING_VARIABLES");
  v11[0] = v6;
  -[PMLEspressoTrainingVariables toPlistWithChunks:](self->_etv, "toPlistWithChunks:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)planId
{
  return self->_planId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groundTruth, 0);
  objc_storeStrong((id *)&self->_trainingPredictions, 0);
  objc_storeStrong((id *)&self->_etv, 0);
  objc_storeStrong((id *)&self->_mtv, 0);
  objc_storeStrong((id *)&self->_taskDefinition, 0);
  objc_storeStrong((id *)&self->_planId, 0);
}

uint64_t __59__PMLEspressoTrainingPlan__updateResultsReferenceCallback___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), obj);
  return 1;
}

void __40__PMLEspressoTrainingPlan_runWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, _BYTE *a5)
{
  id v8;
  id v9;
  PMLEspressoDataProvider *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  PMLEspressoDataProvider *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  const __CFString *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  id obj;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  uint8_t buf[4];
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v10 = [PMLEspressoDataProvider alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "inputName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "inputDim");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "trueLabelName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PMLEspressoDataProvider initWithRowsData:labelsData:inputName:inputDim:trueLabelName:](v10, "initWithRowsData:labelsData:inputName:inputDim:trueLabelName:", v8, v9, v11, v12, v13);

    if (v14)
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 16);
      v17 = objc_msgSend(*(id *)(v15 + 24), "epochsPerBatch");
      v30 = *MEMORY[0x24BE2F398];
      objc_msgSend(*(id *)(a1 + 32), "_updateResultsReferenceCallback:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v20 + 40);
      LODWORD(v16) = objc_msgSend(v16, "doTrainingOnData:forNumberOfEpochs:withCallback:error:", v14, v17, v19, &obj);
      objc_storeStrong((id *)(v20 + 40), obj);

      if ((_DWORD)v16 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v8, "count");
        v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        if (v28 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "maxSessionsToTrainOn"))
          goto LABEL_12;
        goto LABEL_11;
      }
      PML_LogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v35 = v22;
        _os_log_error_impl(&dword_2159BB000, v21, OS_LOG_TYPE_ERROR, "Training was unsuccessful: %@", buf, 0xCu);
      }
    }
    else
    {
      PML_LogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = CFSTR("Unable to convert session batch data into espresso data provider");
        _os_log_error_impl(&dword_2159BB000, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      v24 = (void *)MEMORY[0x24BDD1540];
      v32 = *MEMORY[0x24BDD0FC8];
      v33 = CFSTR("Unable to convert session batch data into espresso data provider");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("ProactiveMLErrorDomain"), 200, v21);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

    }
LABEL_11:
    *a5 = 1;
LABEL_12:

  }
}

+ (int)argmax:(id)a3
{
  id v3;
  unint64_t v4;
  int v5;
  float v6;
  void *v7;
  float v8;
  float v9;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    v5 = -1;
    v6 = -3.4028e38;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v9 = v8;

      if (v6 < v9)
      {
        v6 = v9;
        v5 = v4;
      }
      ++v4;
    }
    while (objc_msgSend(v3, "count") > v4);
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

+ (unint64_t)numberOfParametersInTensor:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "shape");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v7 *= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "unsignedIntegerValue");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (BOOL)isValidGradient:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  float *v8;
  void *v9;
  BOOL v10;
  unint64_t v11;
  float v12;
  float v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_msgSend(v5, "count");
    v7 = objc_msgSend(objc_retainAutorelease(v5), "ptr");
    if (v6)
    {
      v8 = (float *)v7;
      v9 = (void *)MEMORY[0x2199EA600]();
      v10 = 0;
      v11 = 0;
      v12 = *v8;
      if (fabsf(*v8) == INFINITY)
      {
LABEL_9:
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Gradient contains %f at index %lu"), v12, v11);
        PML_LogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v14;
          _os_log_error_impl(&dword_2159BB000, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        v16 = (void *)MEMORY[0x24BDD1540];
        v21 = *MEMORY[0x24BDD0FC8];
        v22 = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("ProactiveMLErrorDomain"), 203, v17);
        v18 = (id)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v9);
        if (a4)
          v19 = v10;
        else
          v19 = 1;
        if ((v19 & 1) == 0)
        {
          v18 = objc_retainAutorelease(v18);
          v10 = 0;
          *a4 = v18;
        }
        goto LABEL_18;
      }
      v11 = 0;
      while (1)
      {
        objc_autoreleasePoolPop(v9);
        if (v6 - 1 == v11)
          break;
        v9 = (void *)MEMORY[0x2199EA600]();
        v12 = v8[v11 + 1];
        v13 = fabsf(v12);
        ++v11;
        if (v13 >= INFINITY && v13 <= INFINITY)
        {
          v10 = v11 >= v6;
          goto LABEL_9;
        }
      }
    }
    v18 = 0;
    v10 = 1;
LABEL_18:

    goto LABEL_19;
  }
  v10 = 1;
LABEL_19:

  return v10;
}

+ (id)_iterateModelParametersForTask:(id)a3 globalNames:(id)a4 weightNames:(id)a5 biasNames:(id)a6 block:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t (**v14)(id, uint64_t, const __CFString *, _QWORD);
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  char v51;
  NSObject *v52;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;
  void *v75;
  uint8_t buf[4];
  uint64_t v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v57 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (uint64_t (**)(id, uint64_t, const __CFString *, _QWORD))a7;
  v15 = objc_msgSend(v11, "count");
  v16 = objc_msgSend(v12, "count") + v15;
  if (!(v16 + objc_msgSend(v13, "count")))
    goto LABEL_2;
  v55 = v12;
  v56 = v11;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v18 = v11;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  v54 = v13;
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v69;
LABEL_5:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v69 != v21)
        objc_enumerationMutation(v18);
      v23 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v22);
      v24 = (void *)MEMORY[0x2199EA600]();
      objc_msgSend(v57, "getTensorNamed:", v23);
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25)
        break;
      v26 = (void *)v25;
      v27 = v14[2](v14, v25, CFSTR("global"), v23);

      objc_autoreleasePoolPop(v24);
      if ((v27 & 1) == 0)
      {

        v17 = 0;
        goto LABEL_47;
      }
      if (v20 == ++v22)
      {
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
        v13 = v54;
        if (v20)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    PML_LogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    v11 = v56;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v77 = v23;
      _os_log_error_impl(&dword_2159BB000, v28, OS_LOG_TYPE_ERROR, "An error occured when attempting to get parameters for global variable: %@", buf, 0xCu);
    }

    v29 = (void *)MEMORY[0x24BDD1540];
    v74 = *MEMORY[0x24BDD0FC8];
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unable to find global variable named: %@"), v23);
    v75 = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("ProactiveMLErrorDomain"), 202, v31);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v24);
    v13 = v54;
    v12 = v55;
    if (v17)
      goto LABEL_48;
  }
  else
  {
LABEL_12:

    v12 = v55;
    v11 = v56;
  }
  v67 = 0u;
  v65 = 0u;
  v66 = 0u;
  v64 = 0u;
  v32 = v12;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
  if (v33)
  {
    v34 = v33;
    v17 = 0;
    v35 = *(_QWORD *)v65;
    while (2)
    {
      v36 = 0;
      v37 = v17;
      do
      {
        if (*(_QWORD *)v65 != v35)
          objc_enumerationMutation(v32);
        v38 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v36);
        v39 = (void *)MEMORY[0x2199EA600]();
        v63 = v37;
        objc_msgSend(v57, "getParameterOfType:forLayerNamed:error:", 1, v38, &v63);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v63;

        if (!v40)
        {
          PML_LogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v77 = v38;
            _os_log_error_impl(&dword_2159BB000, v42, OS_LOG_TYPE_ERROR, "An error occured when attempting to get weight for layer: %@", buf, 0xCu);
          }

          objc_autoreleasePoolPop(v39);
          goto LABEL_31;
        }
        v41 = v14[2](v14, (uint64_t)v40, CFSTR("weight"), v38);

        objc_autoreleasePoolPop(v39);
        if ((v41 & 1) == 0)
          goto LABEL_46;
        ++v36;
        v37 = v17;
      }
      while (v34 != v36);
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
      if (v34)
        continue;
      break;
    }
LABEL_31:

    v12 = v55;
    v11 = v56;
    v13 = v54;
    if (v17)
      goto LABEL_48;
  }
  else
  {

  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v32 = v13;
  v43 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
  if (!v43)
  {

LABEL_2:
    v17 = 0;
    goto LABEL_48;
  }
  v44 = v43;
  v17 = 0;
  v45 = *(_QWORD *)v60;
  while (2)
  {
    v46 = 0;
    v47 = v17;
    do
    {
      if (*(_QWORD *)v60 != v45)
        objc_enumerationMutation(v32);
      v48 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v46);
      v49 = (void *)MEMORY[0x2199EA600]();
      v58 = v47;
      objc_msgSend(v57, "getParameterOfType:forLayerNamed:error:", 2, v48, &v58);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v58;

      if (!v50)
      {
        PML_LogHandle();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v77 = v48;
          _os_log_error_impl(&dword_2159BB000, v52, OS_LOG_TYPE_ERROR, "An error occured when attempting to get bias for layer: %@", buf, 0xCu);
        }

        objc_autoreleasePoolPop(v49);
        goto LABEL_46;
      }
      v51 = v14[2](v14, (uint64_t)v50, CFSTR("bias"), v48);

      objc_autoreleasePoolPop(v49);
      if ((v51 & 1) == 0)
        goto LABEL_46;
      ++v46;
      v47 = v17;
    }
    while (v44 != v46);
    v44 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    if (v44)
      continue;
    break;
  }
LABEL_46:

LABEL_47:
  v12 = v55;
  v11 = v56;
  v13 = v54;
LABEL_48:

  return v17;
}

+ (id)_getModelParametersForTask:(id)a3 globalNames:(id)a4 weightNames:(id)a5 biasNames:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v15 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __94__PMLEspressoTrainingPlan__getModelParametersForTask_globalNames_weightNames_biasNames_error___block_invoke;
  v28[3] = &unk_24D3DB998;
  v28[4] = &v29;
  v28[5] = &v33;
  +[PMLEspressoTrainingPlan _iterateModelParametersForTask:globalNames:weightNames:biasNames:block:](PMLEspressoTrainingPlan, "_iterateModelParametersForTask:globalNames:weightNames:biasNames:block:", v11, v12, v13, v14, v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if (a7)
    {
      v17 = objc_retainAutorelease(v16);
      v18 = 0;
      *a7 = v17;
    }
    else
    {
      v18 = 0;
    }
  }
  else if (v34[3] && v30[3])
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    v19 = objc_alloc(MEMORY[0x24BDBCEC8]);
    v20 = (void *)objc_msgSend(v19, "initWithLength:", v30[3]);
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __94__PMLEspressoTrainingPlan__getModelParametersForTask_globalNames_weightNames_biasNames_error___block_invoke_2;
    v24[3] = &unk_24D3DB9C0;
    v21 = v20;
    v25 = v21;
    v26 = v27;
    +[PMLEspressoTrainingPlan _iterateModelParametersForTask:globalNames:weightNames:biasNames:block:](PMLEspressoTrainingPlan, "_iterateModelParametersForTask:globalNames:weightNames:biasNames:block:", v11, v12, v13, v14, v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v22;
    if (v22)
    {
      v18 = 0;
      if (a7)
        *a7 = objc_retainAutorelease(v22);
    }
    else
    {
      v18 = v21;
    }

    _Block_object_dispose(v27, 8);
  }
  else
  {
    v18 = (id)objc_opt_new();
    v17 = 0;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

+ (id)_calculateGradientInPlaceForTask:(id)a3 startingParameters:(id)a4 globalNames:(id)a5 weightNames:(id)a6 biasNames:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[8];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[4];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_msgSend(v12, "length");
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2735;
  v28 = __Block_byref_object_dispose__2736;
  v29 = 0;
  v17 = objc_retainAutorelease(v12);
  v18 = objc_msgSend(v17, "mutableBytes");
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __113__PMLEspressoTrainingPlan__calculateGradientInPlaceForTask_startingParameters_globalNames_weightNames_biasNames___block_invoke;
  v23[3] = &unk_24D3DB9E8;
  v23[4] = v30;
  v23[5] = &v24;
  v23[6] = v16 >> 2;
  v23[7] = v18;
  +[PMLEspressoTrainingPlan _iterateModelParametersForTask:globalNames:weightNames:biasNames:block:](PMLEspressoTrainingPlan, "_iterateModelParametersForTask:globalNames:weightNames:biasNames:block:", v11, v13, v14, v15, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19 || (v20 = (void *)v25[5]) != 0)
    v21 = v20;
  else
    v21 = 0;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v30, 8);

  return v21;
}

+ (id)_calculateTrainingMetricsWithSamplingProb:(double)a3 groundTruthProvider:(id)a4 predictionsProvider:(id)a5 trueLabelName:(id)a6 trainingOutputName:(id)a7 lossValueName:(id)a8 probThreshold:(double)a9 includeSummableOnly:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  double v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  double v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  double v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  void *v49;
  double v50;
  unint64_t v51;
  uint64_t v52;
  float v53;
  void *v54;
  double v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  float *v61;
  float v62;
  void *v63;
  void *v64;
  unsigned int v65;
  void *v66;
  float v67;
  double v68;
  unint64_t v69;
  void *v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  double v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  NSObject *v87;
  NSObject *v88;
  double v90;
  double v91;
  BOOL v92;
  unint64_t v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  void *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id obj;
  id v104;
  id v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint8_t buf[4];
  double v117;
  __int16 v118;
  double v119;
  __int16 v120;
  double v121;
  _BYTE v122[128];
  _QWORD v123[2];
  _BYTE v124[128];
  _QWORD v125[4];

  v125[1] = *MEMORY[0x24BDAC8D0];
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  if (a3 <= 0.0 || a3 > 1.0)
  {
    PML_LogHandle();
    *(double *)&v83 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v117 = a3;
      _os_log_error_impl(&dword_2159BB000, v83, OS_LOG_TYPE_ERROR, "Sampling probability is invalid value %f", buf, 0xCu);
    }
    goto LABEL_56;
  }
  *(double *)&v22 = COERCE_DOUBLE(objc_msgSend(v17, "numberOfDataPoints"));
  *(double *)&v23 = COERCE_DOUBLE(objc_msgSend(v18, "numberOfDataPoints"));
  v24 = *(double *)&v23;
  if (*(double *)&v22 == 0.0 || *(double *)&v23 == 0.0)
  {
    PML_LogHandle();
    *(double *)&v83 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v117 = *(double *)&v22;
      v118 = 2048;
      v119 = v24;
      _os_log_impl(&dword_2159BB000, v83, OS_LOG_TYPE_DEFAULT, "Returning nil for training metrics since 0 points for ground truth %tu and / or training results %tu", buf, 0x16u);
    }
LABEL_56:
    v73 = 0;
    goto LABEL_85;
  }
  v92 = a10;
  v101 = v21;
  v102 = v20;
  v100 = v19;
  v125[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v125, 1);
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
  v26 = v18;
  if (v25)
  {
    v27 = v25;
    v28 = *(_QWORD *)v113;
    v96 = v24;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v113 != v28)
          objc_enumerationMutation(obj);
        v30 = *(double *)(*((_QWORD *)&v112 + 1) + 8 * i);
        v31 = (void *)MEMORY[0x2199EA600]();
        v111 = 0;
        objc_msgSend(v17, "dataPointAtIndex:error:", 0, &v111);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v111;
        if (*(double *)&v33 != 0.0)
        {
          v83 = v33;
          PML_LogHandle();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v117 = *(double *)&v83;
            _os_log_error_impl(&dword_2159BB000, v84, OS_LOG_TYPE_ERROR, "Unable to get ground truth value for key validation: %@", buf, 0xCu);
          }
          goto LABEL_62;
        }
        objc_msgSend(v32, "objectForKeyedSubscript:", *(_QWORD *)&v30);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
        {
          PML_LogHandle();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v117 = v30;
            v118 = 2112;
            v119 = 0.0;
            _os_log_error_impl(&dword_2159BB000, v84, OS_LOG_TYPE_ERROR, "Unable to get %@ key for ground truth: %@", buf, 0x16u);
          }
          *(double *)&v83 = 0.0;
LABEL_62:
          v18 = v26;
          v19 = v100;
          v81 = obj;

          objc_autoreleasePoolPop(v31);
          v73 = 0;
          v82 = obj;
          v21 = v101;
          v20 = v102;
          goto LABEL_84;
        }

        objc_autoreleasePoolPop(v31);
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
      v18 = v26;
      v24 = v96;
    }
    while (v27);
  }

  v123[0] = v102;
  v123[1] = v101;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v123, 2);
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v99 = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v107, v122, 16);
  if (!v35)
    goto LABEL_23;
  v36 = v35;
  v37 = *(_QWORD *)v108;
  v97 = v24;
  do
  {
    for (j = 0; j != v36; ++j)
    {
      if (*(_QWORD *)v108 != v37)
        objc_enumerationMutation(v99);
      v39 = *(double *)(*((_QWORD *)&v107 + 1) + 8 * j);
      v40 = (void *)MEMORY[0x2199EA600]();
      v106 = 0;
      objc_msgSend(v26, "dataPointAtIndex:error:", 0, &v106);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v106;
      if (*(double *)&v42 != 0.0)
      {
        v83 = v42;
        PML_LogHandle();
        v85 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v117 = *(double *)&v83;
          _os_log_error_impl(&dword_2159BB000, v85, OS_LOG_TYPE_ERROR, "Unable to get training result for key validation: %@", buf, 0xCu);
        }
        goto LABEL_68;
      }
      objc_msgSend(v41, "objectForKeyedSubscript:", *(_QWORD *)&v39);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
      {
        PML_LogHandle();
        v85 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v117 = v39;
          v118 = 2112;
          v119 = 0.0;
          _os_log_error_impl(&dword_2159BB000, v85, OS_LOG_TYPE_ERROR, "Unable to get %@ key for training result: %@", buf, 0x16u);
        }
        *(double *)&v83 = 0.0;
LABEL_68:
        v18 = v26;
        v19 = v100;
        v81 = obj;

        objc_autoreleasePoolPop(v40);
        v73 = 0;
        v82 = v99;
        v86 = v99;
        v21 = v101;
        v20 = v102;
        goto LABEL_83;
      }

      objc_autoreleasePoolPop(v40);
    }
    v36 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v107, v122, 16);
    v18 = v26;
    v24 = v97;
  }
  while (v36);
LABEL_23:

  if (v22 != *(_QWORD *)&v24)
  {
    PML_LogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = v24;
      *(double *)&v46 = COERCE_DOUBLE(objc_msgSend(v17, "numberOfDataPoints"));
      v47 = COERCE_DOUBLE(objc_msgSend(v18, "numberOfDataPoints"));
      *(_DWORD *)buf = 134218240;
      v117 = *(double *)&v46;
      v24 = v45;
      v118 = 2048;
      v119 = v47;
      _os_log_impl(&dword_2159BB000, v44, OS_LOG_TYPE_DEFAULT, "The number of ground truth values %tu does not match number of inference results %tu", buf, 0x16u);
    }

  }
  if (v22 < *(_QWORD *)&v24)
    v24 = *(double *)&v22;
  v94 = (void *)objc_opt_new();
  v18 = v26;
  v98 = (void *)objc_opt_new();
  v48 = objc_opt_new();
  v49 = (void *)v48;
  v50 = 0.0;
  v93 = 0;
  v51 = 0;
  v90 = v24;
  if (*(_QWORD *)&v24 <= 1uLL)
    v52 = 1;
  else
    v52 = *(_QWORD *)&v24;
  v53 = 0.0;
  v95 = (void *)v48;
  while (2)
  {
    v54 = (void *)MEMORY[0x2199EA600]();
    objc_msgSend(v49, "nextDouble");
    if (v55 > a3)
    {
      PML_LogHandle();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_2159BB000, v56, OS_LOG_TYPE_DEBUG, "Skipping row for metrics calculation", buf, 2u);
      }
      goto LABEL_44;
    }
    v105 = 0;
    objc_msgSend(v17, "dataPointAtIndex:error:", *(_QWORD *)&v50, &v105);
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = v105;
    if (*(double *)&v57 != 0.0)
    {
      v83 = v57;
      PML_LogHandle();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v117 = v50;
        v118 = 2112;
        v119 = *(double *)&v83;
        _os_log_error_impl(&dword_2159BB000, v87, OS_LOG_TYPE_ERROR, "Unable to get ground truth at index %tu: %@", buf, 0x16u);
      }

      goto LABEL_75;
    }
    v104 = 0;
    objc_msgSend(v18, "dataPointAtIndex:error:", *(_QWORD *)&v50, &v104);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v104;
    if (*(double *)&v59 != 0.0)
    {
      v83 = v59;
      PML_LogHandle();
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v117 = v50;
        v118 = 2112;
        v119 = *(double *)&v83;
        _os_log_error_impl(&dword_2159BB000, v88, OS_LOG_TYPE_ERROR, "Unable to get inference results at index %tu: %@", buf, 0x16u);
      }

LABEL_75:
      objc_autoreleasePoolPop(v54);
      v73 = 0;
      v19 = v100;
      v21 = v101;
      v20 = v102;
      v81 = obj;
      v82 = v99;
LABEL_80:
      v86 = v94;
      goto LABEL_82;
    }
    -[NSObject objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", v100);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (float *)objc_msgSend(v60, "dataPointer");

    v62 = *v61;
    objc_msgSend(v58, "objectForKeyedSubscript:", v102);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "dataArray");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = +[PMLEspressoTrainingPlan argmax:](PMLEspressoTrainingPlan, "argmax:", v64);
    if ((v65 & 0x80000000) == 0 && v65 == (int)v62)
    {
      objc_msgSend(v64, "objectAtIndexedSubscript:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "floatValue");
      v68 = v67;

      v69 = v93;
      if (v68 > a9)
        v69 = v93 + 1;
      v93 = v69;
    }
    ++v51;
    objc_msgSend(v58, "objectForKeyedSubscript:", v101, *(_QWORD *)&v90);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v53 + *(float *)objc_msgSend(v70, "dataPointer");

    objc_msgSend(v94, "addObject:", v64);
    *(float *)&v71 = v62;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "addObject:", v72);

    v49 = v95;
LABEL_44:

    objc_autoreleasePoolPop(v54);
    if (v52 != ++*(_QWORD *)&v50)
      continue;
    break;
  }
  v73 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v51);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setObject:forKeyedSubscript:", v74, CFSTR("numberOfSamples"));

  if (v51)
    v75 = &unk_24D3EACD0;
  else
    v75 = &unk_24D3EACE8;
  objc_msgSend(v73, "setObject:forKeyedSubscript:", v75, CFSTR("isSampled"), *(_QWORD *)&v90);
  if (v51)
  {
    *(float *)&v76 = v53 / (float)v51;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setObject:forKeyedSubscript:", v77, CFSTR("loss"));

    *(float *)&v78 = (float)v93 / (float)v51;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setObject:forKeyedSubscript:", v79, CFSTR("accuracy"));

    PML_LogHandle();
    v80 = objc_claimAutoreleasedReturnValue();
    v19 = v100;
    v81 = obj;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v117 = v91;
      v118 = 2048;
      v119 = (float)(v53 / (float)v51);
      v120 = 2048;
      v121 = (float)((float)v93 / (float)v51);
      _os_log_impl(&dword_2159BB000, v80, OS_LOG_TYPE_INFO, "Number of data points: %tu, Loss: %f, Accuracy: %f", buf, 0x20u);
    }
    v21 = v101;
    v20 = v102;
    v82 = v99;
  }
  else
  {
    objc_msgSend(v73, "setObject:forKeyedSubscript:", &unk_24D3EACE8, CFSTR("loss"));
    objc_msgSend(v73, "setObject:forKeyedSubscript:", &unk_24D3EACE8, CFSTR("accuracy"));
    PML_LogHandle();
    v80 = objc_claimAutoreleasedReturnValue();
    v19 = v100;
    v21 = v101;
    v20 = v102;
    v81 = obj;
    v82 = v99;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2159BB000, v80, OS_LOG_TYPE_INFO, "Not adding loss or accuracy metrics as no rows were sampled", buf, 2u);
    }
  }

  if (v92)
  {
    *(double *)&v83 = 0.0;
    goto LABEL_80;
  }
  v86 = v94;
  objc_msgSend(v73, "setObject:forKeyedSubscript:", v94, CFSTR("predictions"));
  objc_msgSend(v73, "setObject:forKeyedSubscript:", v98, CFSTR("groundTruth"));
  *(double *)&v83 = 0.0;
LABEL_82:

LABEL_83:
LABEL_84:

LABEL_85:
  return v73;
}

BOOL __113__PMLEspressoTrainingPlan__calculateGradientInPlaceForTask_startingParameters_globalNames_weightNames_biasNames___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = +[PMLEspressoTrainingPlan numberOfParametersInTensor:](PMLEspressoTrainingPlan, "numberOfParametersInTensor:", v7);
  v11 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + v10;
  v12 = a1[6];
  if (v11 > v12)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD0FC8];
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unable to in place update gradient since number of starting and ending parameters don't match for tensor type %@ name %@"), v8, v9);
    v22[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("ProactiveMLErrorDomain"), 201, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1[5] + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
  else
  {
    v13 = v10;
    catlas_saxpby(v10, -1.0, (const float *)objc_msgSend(v7, "dataPointer"), 1, 1.0, (float *)(a1[7] + 4 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24)), 1);
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += v13;
  }

  return v11 <= v12;
}

uint64_t __94__PMLEspressoTrainingPlan__getModelParametersForTask_globalNames_weightNames_biasNames_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += 4
                                                               * +[PMLEspressoTrainingPlan numberOfParametersInTensor:](PMLEspressoTrainingPlan, "numberOfParametersInTensor:", a2);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return 1;
}

uint64_t __94__PMLEspressoTrainingPlan__getModelParametersForTask_globalNames_weightNames_biasNames_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  v4 = 4
     * +[PMLEspressoTrainingPlan numberOfParametersInTensor:](PMLEspressoTrainingPlan, "numberOfParametersInTensor:", v3);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = objc_msgSend(v3, "dataPointer");

  objc_msgSend(v5, "replaceBytesInRange:withBytes:", v6, v4, v7);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v4;
  return 1;
}

@end
