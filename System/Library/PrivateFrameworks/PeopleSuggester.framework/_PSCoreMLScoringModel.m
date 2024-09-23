@implementation _PSCoreMLScoringModel

- (_PSCoreMLScoringModel)init
{
  _PSCoreMLScoringModel *v2;
  objc_super v4;
  pthread_mutexattr_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)_PSCoreMLScoringModel;
  v2 = -[_PSCoreMLScoringModel init](&v4, sel_init);
  if (v2)
  {
    v5.__sig = 0;
    *(_QWORD *)v5.__opaque = 0;
    pthread_mutexattr_init(&v5);
    pthread_mutexattr_settype(&v5, 2);
    pthread_mutex_init(&v2->_lock, &v5);
  }
  return v2;
}

- (void)loadModel
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  LCFModelStore *v6;
  LCFModelStore *modelStore;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  const __CFString *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 buf;
  Class (*v36)(uint64_t);
  void *v37;
  uint64_t *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_DEFAULT, "_PSCoreMLScoringModel: loading model", (uint8_t *)&buf, 2u);
  }

  pthread_mutex_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0D15900], "peopleDirectory");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v4 = (void *)getLCFModelStoreClass_softClass;
  v34 = getLCFModelStoreClass_softClass;
  if (!getLCFModelStoreClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v36 = __getLCFModelStoreClass_block_invoke;
    v37 = &unk_1E43FEA00;
    v38 = &v31;
    __getLCFModelStoreClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v32[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v31, 8);
  v6 = (LCFModelStore *)objc_msgSend([v5 alloc], "init:modelStoreRootURL:", CFSTR("com.apple.proactive.shareheet.peoplesuggester"), v29);
  modelStore = self->_modelStore;
  self->_modelStore = v6;

  -[LCFModelStore clear](self->_modelStore, "clear");
  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v8 = (void *)getTRIClientClass_softClass_2;
  v34 = getTRIClientClass_softClass_2;
  if (!getTRIClientClass_softClass_2)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v36 = __getTRIClientClass_block_invoke_2;
    v37 = &unk_1E43FEA00;
    v38 = &v31;
    __getTRIClientClass_block_invoke_2((uint64_t)&buf);
    v8 = (void *)v32[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v31, 8);
  objc_msgSend(v9, "clientWithIdentifier:", 210);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "levelForFactor:withNamespaceName:", CFSTR("compiledOnDeviceShareSheetCoreMLModel"), CFSTR("COREML_SYSTEMS_PEOPLE_SUGGESTER"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11
    || (objc_msgSend(v11, "directoryValue"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "path"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = v14 == 0,
        v14,
        v13,
        v15))
  {
    v20 = 0;
    goto LABEL_13;
  }
  v16 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v12, "directoryValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fileURLWithPath:isDirectory:", v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v19;
  if (!v20
    || (-[_PSCoreMLScoringModel loadCoreMLModel:config:](self, "loadCoreMLModel:config:", v20, 0),
        (v21 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bundlePath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "stringByAppendingPathComponent:", CFSTR("compiledShareSheetModel.mlmodelc"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v26);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    -[_PSCoreMLScoringModel loadCoreMLModel:config:](self, "loadCoreMLModel:config:", v23, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      v22 = CFSTR("coreML_Build");
    else
      v22 = CFSTR("nil_model");

    goto LABEL_17;
  }
  v22 = CFSTR("coreML_Trial");
  v23 = v20;
LABEL_17:
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v22);
  -[_PSCoreMLScoringModel setModelURL:](self, "setModelURL:", v27);

  -[_PSCoreMLScoringModel setMlModel:](self, "setMlModel:", v21);
  -[_PSCoreMLScoringModel loadModelMetadata](self, "loadModelMetadata");
  pthread_mutex_unlock(&self->_lock);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v23;
    _os_log_impl(&dword_1A07F4000, v28, OS_LOG_TYPE_INFO, "ML Model successfully loaded by _PSCoreMLScoringModel, model name: %@", (uint8_t *)&buf, 0xCu);
  }

}

- (void)unloadModel
{
  _opaque_pthread_mutex_t *p_lock;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[_PSCoreMLScoringModel setMlModel:](self, "setMlModel:", 0);
  -[_PSCoreMLScoringModel setMetadata:](self, "setMetadata:", 0);
  -[_PSCoreMLScoringModel setInputFeatureName:](self, "setInputFeatureName:", 0);
  -[_PSCoreMLScoringModel setNumCandidatesFeatureName:](self, "setNumCandidatesFeatureName:", 0);
  -[_PSCoreMLScoringModel setOutputFeatureName:](self, "setOutputFeatureName:", 0);
  -[_PSCoreMLScoringModel setInputShape:](self, "setInputShape:", 0);
  -[_PSCoreMLScoringModel setMlModelInitialized:](self, "setMlModelInitialized:", 0);
  pthread_mutex_unlock(p_lock);
}

- (_PSCoreMLScoringModel)initWithCoreMLModel:(id)a3
{
  id v4;
  _PSCoreMLScoringModel *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[_PSCoreMLScoringModel init](self, "init");
  pthread_mutex_lock(&v5->_lock);
  if (v4)
  {
    -[_PSCoreMLScoringModel setMlModelInitialized:](v5, "setMlModelInitialized:", 1);
    -[_PSCoreMLScoringModel setMlModel:](v5, "setMlModel:", v4);
    objc_msgSend(v4, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modelDisplayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0C99E98]);
      objc_msgSend(v4, "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "modelDisplayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v8, "initWithString:", v10);
      -[_PSCoreMLScoringModel setModelURL:](v5, "setModelURL:", v11);

    }
    -[_PSCoreMLScoringModel loadModelMetadata](v5, "loadModelMetadata");
  }
  pthread_mutex_lock(&v5->_lock);

  return v5;
}

- (id)loadCoreMLModel:(id)a3 config:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 buf;
  Class (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;

  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v10 = (void *)getMLModelConfigurationClass_softClass_2;
    v22 = getMLModelConfigurationClass_softClass_2;
    if (!getMLModelConfigurationClass_softClass_2)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v24 = __getMLModelConfigurationClass_block_invoke_2;
      v25 = &unk_1E43FEA00;
      v26 = &v19;
      __getMLModelConfigurationClass_block_invoke_2((uint64_t)&buf);
      v10 = (void *)v20[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v19, 8);
    v9 = (id)objc_opt_new();

  }
  objc_msgSend(v9, "setComputeUnits:", 0);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v12 = (void *)getMLModelClass_softClass_8;
  v22 = getMLModelClass_softClass_8;
  if (!getMLModelClass_softClass_8)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v24 = __getMLModelClass_block_invoke_8;
    v25 = &unk_1E43FEA00;
    v26 = &v19;
    __getMLModelClass_block_invoke_8((uint64_t)&buf);
    v12 = (void *)v20[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v19, 8);
  v18 = 0;
  objc_msgSend(v13, "modelWithContentsOfURL:configuration:error:", v5, v9, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18;
  if (v15)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1A07F4000, v16, OS_LOG_TYPE_INFO, "Couldn't load ML model, error: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  return v14;
}

- (void)loadProductionModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  -[_PSCoreMLScoringModel mlModel](self, "mlModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (v4)
    {
      -[_PSCoreMLScoringModel setMlModel:](self, "setMlModel:", v4);
    }
    else
    {
      -[LCFModelStore getModelURL:](self->_modelStore, "getModelURL:", CFSTR("compiledShareSheetModel.mlmodelc"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[LCFModelStore getModelConfig:](self->_modelStore, "getModelConfig:", CFSTR("compiledShareSheetModel.mlmodelc"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSCoreMLScoringModel loadCoreMLModel:config:](self, "loadCoreMLModel:config:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSCoreMLScoringModel setMlModel:](self, "setMlModel:", v8);

      -[_PSCoreMLScoringModel setModelURL:](self, "setModelURL:", v6);
      -[_PSCoreMLScoringModel mlModel](self, "mlModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[_PSCoreMLScoringModel loadProductionModel:].cold.1();

      }
    }
  }

}

- (void)loadModelMetadata
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Could not load model metadata as model was not present", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (id)featureOrderFromMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v21;

  -[_PSCoreMLScoringModel metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("feature_order"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB36D8];
    -[_PSCoreMLScoringModel metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("feature_order"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v5, "JSONObjectWithData:options:error:", v8, 8, &v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v21;

    if (v9)
    {
      objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_46);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[_PSCoreMLScoringModel featureOrderFromMetadata].cold.2();

      v11 = 0;
    }

  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_PSCoreMLScoringModel featureOrderFromMetadata].cold.1(v10, v12, v13, v14, v15, v16, v17, v18);
    v11 = 0;
  }

  return v11;
}

- (int64_t)getModelTypeWithModelMetadata:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;
  NSObject *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("model_type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("item")) & 1) != 0)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("set")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("gbdt")) & 1) != 0)
  {
    v5 = 2;
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[_PSCoreMLScoringModel getModelTypeWithModelMetadata:].cold.1();

    v5 = 3;
  }

  return v5;
}

- (id)getModelDescription
{
  _opaque_pthread_mutex_t *p_lock;
  void *v4;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[MLModel modelDescription](self->_mlModel, "modelDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_lock);
  return v4;
}

- (id)getModelPath
{
  _opaque_pthread_mutex_t *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[_PSCoreMLScoringModel modelURL](self, "modelURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_lock);
  return v5;
}

- (BOOL)isSetModel
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_PSCoreMLScoringModel modelType](self, "modelType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", &unk_1E442B690);

  return v3;
}

- (BOOL)isGBDTModel
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_PSCoreMLScoringModel modelType](self, "modelType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", &unk_1E442B6A8);

  return v3;
}

- (id)reformatCandidateDictionaryIntoFeatureTensor:(id)a3 candidateList:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  id v44;
  id v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  NSObject *v54;
  _BOOL8 v55;
  uint8_t buf[8];
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v8 = a4;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[_PSCoreMLScoringModel reformatCandidateDictionaryIntoFeatureTensor:candidateList:error:].cold.4(self, v9);

  v10 = -[_PSCoreMLScoringModel isSetModel](self, "isSetModel");
  -[_PSCoreMLScoringModel featureOrderFromMetadata](self, "featureOrderFromMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v12 = 2;
  else
    v12 = 1;
  -[_PSCoreMLScoringModel inputShape](self, "inputShape", v46);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedLongValue");
  v16 = objc_msgSend(v11, "count");

  if (v15 == v16)
  {
    v17 = objc_alloc((Class)getMLMultiArrayClass_1());
    -[_PSCoreMLScoringModel inputShape](self, "inputShape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithShape:dataType:error:", v18, 65568, a5);

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      v22 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

      v23 = v47;
      if (v22)
      {
        v24 = (void *)objc_opt_new();
        v25 = (void *)objc_opt_new();
      }
      else
      {
        v25 = 0;
        v24 = 0;
      }
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v35, OS_LOG_TYPE_DEFAULT, "Copying feature vectors into feature tensor", buf, 2u);
      }

      v36 = v10;
      +[_PSCandidate selfCandidate](_PSCandidate, "selfCandidate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __90___PSCoreMLScoringModel_reformatCandidateDictionaryIntoFeatureTensor_candidateList_error___block_invoke;
      v48[3] = &unk_1E4402078;
      v55 = v36;
      v49 = v8;
      v50 = v47;
      v51 = v11;
      v39 = v38;
      v52 = v39;
      v40 = v25;
      v53 = v40;
      v21 = v24;
      v54 = v21;
      objc_msgSend(v19, "getMutableBytesWithHandler:", v48);
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        -[_PSCoreMLScoringModel reformatCandidateDictionaryIntoFeatureTensor:candidateList:error:].cold.3();

      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        -[_PSCoreMLScoringModel reformatCandidateDictionaryIntoFeatureTensor:candidateList:error:].cold.2();

      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v43, OS_LOG_TYPE_INFO, "Finished reformatting candidate dictionary into feature tensor", buf, 2u);
      }

      v44 = v19;
    }
    else
    {
      v23 = v47;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[_PSCoreMLScoringModel reformatCandidateDictionaryIntoFeatureTensor:candidateList:error:].cold.1((uint64_t)a5, v21, v29, v30, v31, v32, v33, v34);
    }

    v28 = v19;
    goto LABEL_26;
  }
  if (a5)
  {
    v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v57 = *MEMORY[0x1E0CB2D50];
    v58[0] = CFSTR("feature list length doesn't match shape");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", CFSTR("com.apple.PeopleSuggester"), 1, v19);
    v28 = 0;
    *a5 = v27;
    v23 = v47;
LABEL_26:

    goto LABEL_27;
  }
  v28 = 0;
  v23 = v47;
LABEL_27:

  return v28;
}

- (id)predictWithFeatureProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  id v16;

  v4 = a3;
  -[_PSCoreMLScoringModel mlModel](self, "mlModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v5, "predictionFromFeatures:error:", v4, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v16;
  if (v7)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_PSCoreMLScoringModel predictWithFeatureProvider:].cold.2();
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    -[_PSCoreMLScoringModel outputFeatureName](self, "outputFeatureName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", &unk_1E442B6C0);

    if (v13)
    {
      objc_msgSend(v11, "multiArrayValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[_PSCoreMLScoringModel predictWithFeatureProvider:].cold.1(v11, v14);

      v9 = 0;
    }

  }
  return v9;
}

- (id)scoreCandidatesWithGBDTModel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSCandidateScoringGBDTModel-Inference", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(v4, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSCoreMLScoringModel batchPredictWithFeatureDictArray:](self, "batchPredictWithFeatureDictArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSCandidateScoringGBDTModel-Inference", (const char *)&unk_1A0908603, buf, 2u);
  }

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "_PSCandidateScoringCoreMLModel - People Suggester run inference with the GBDT model", buf, 2u);
  }

  v10 = objc_msgSend(v7, "count");
  if (v10 == objc_msgSend(v4, "count"))
  {
    v11 = (void *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v4;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v12);
          v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17);
          objc_msgSend(v7, "objectAtIndexedSubscript:", v15 + v17, (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v18);

          ++v17;
        }
        while (v14 != v17);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        v15 += v17;
      }
      while (v14);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v11;
}

- (id)scoreCandidatesWithCoreMLModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v29;
  _QWORD v30[4];
  id v31;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_104_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v37 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_DEFAULT, "Scoring %tu candidates using CoreML ranker", buf, 0xCu);
  }

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSCandidateScoringCoreMLModel-Inference", " enableTelemetry=YES ", buf, 2u);
  }

  +[_PSFeaturePreprocessor encodeFeatureVectors:](_PSFeaturePreprocessor, "encodeFeatureVectors:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  -[_PSCoreMLScoringModel reformatCandidateDictionaryIntoFeatureTensor:candidateList:error:](self, "reformatCandidateDictionaryIntoFeatureTensor:candidateList:error:", v9, v6, &v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v35;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    -[_PSCoreMLScoringModel inputFeatureName](self, "inputFeatureName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v14);

    if (-[_PSCoreMLScoringModel isSetModel](self, "isSetModel"))
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[_PSCoreMLScoringModel scoreCandidatesWithCoreMLModel:].cold.6();

      v34 = v11;
      v16 = (void *)objc_msgSend(objc_alloc((Class)getMLMultiArrayClass_1()), "initWithShape:dataType:error:", &unk_1E442CE50, 65600, &v34);
      v17 = v34;

      if (v17)
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[_PSCoreMLScoringModel scoreCandidatesWithCoreMLModel:].cold.5();
LABEL_19:
        v19 = MEMORY[0x1E0C9AA70];
LABEL_31:

        v11 = v17;
        goto LABEL_32;
      }
      objc_msgSend(v16, "setObject:atIndexedSubscript:", v12, 0);
      -[_PSCoreMLScoringModel numCandidatesFeatureName](self, "numCandidatesFeatureName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v20);

      v11 = 0;
    }
    v33 = v11;
    v16 = (void *)objc_msgSend(objc_alloc((Class)getMLDictionaryFeatureProviderClass_3()), "initWithDictionary:error:", v13, &v33);
    v17 = v33;

    if (v17)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[_PSCoreMLScoringModel scoreCandidatesWithCoreMLModel:].cold.4();
      goto LABEL_19;
    }
    -[_PSCoreMLScoringModel predictWithFeatureProvider:](self, "predictWithFeatureProvider:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "squeeze");
    v18 = objc_claimAutoreleasedReturnValue();

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSCandidateScoringCoreMLModel-Inference", " enableTelemetry=YES ", buf, 2u);
    }

    -[NSObject shape](v18, "shape");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "count") == 1)
    {
      v23 = -[NSObject count](v18, "count");
      if (v23 >= (int)-[NSObject intValue](v12, "intValue"))
      {
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", (int)-[NSObject intValue](v12, "intValue"));
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __56___PSCoreMLScoringModel_scoreCandidatesWithCoreMLModel___block_invoke_108;
        v30[3] = &unk_1E44020E0;
        v26 = v25;
        v31 = v26;
        v32 = v18;
        objc_msgSend(v6, "enumerateObjectsUsingBlock:", v30);
        v27 = v32;
        v24 = v26;

        v19 = v24;
        goto LABEL_30;
      }
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[_PSCoreMLScoringModel scoreCandidatesWithCoreMLModel:].cold.2(v18, (uint64_t)v12, v24);
    }
    else
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[_PSCoreMLScoringModel scoreCandidatesWithCoreMLModel:].cold.3();
    }
    v19 = MEMORY[0x1E0C9AA70];
LABEL_30:

    goto LABEL_31;
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[_PSCoreMLScoringModel scoreCandidatesWithCoreMLModel:].cold.1();
  v19 = MEMORY[0x1E0C9AA70];
LABEL_32:

  return v19;
}

- (id)scoreCandidates:(id)a3 predictionContext:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint8_t v18[16];
  uint8_t buf[16];

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  pthread_mutex_lock(&self->_lock);
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetLoadMLModel", " enableTelemetry=YES ", buf, 2u);
  }

  if (!self->_mlModelInitialized)
    -[_PSCoreMLScoringModel loadModel](self, "loadModel");
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetLoadMLModel", (const char *)&unk_1A0908603, v18, 2u);
  }

  -[_PSCoreMLScoringModel mlModel](self, "mlModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v6[2](v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      -[_PSCoreMLScoringModel metadata](self, "metadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[_PSCoreMLScoringModel inputFeatureName](self, "inputFeatureName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          if (-[_PSCoreMLScoringModel isGBDTModel](self, "isGBDTModel"))
            -[_PSCoreMLScoringModel scoreCandidatesWithGBDTModel:](self, "scoreCandidatesWithGBDTModel:", v11);
          else
            -[_PSCoreMLScoringModel scoreCandidatesWithCoreMLModel:](self, "scoreCandidatesWithCoreMLModel:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
      }
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[_PSCoreMLScoringModel scoreCandidates:predictionContext:].cold.3();
    }
    else
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[_PSCoreMLScoringModel scoreCandidates:predictionContext:].cold.2();
    }

    v15 = (void *)MEMORY[0x1E0C9AA70];
LABEL_23:

    goto LABEL_24;
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    -[_PSCoreMLScoringModel scoreCandidates:predictionContext:].cold.1();

  v15 = (void *)MEMORY[0x1E0C9AA70];
LABEL_24:
  -[_PSCoreMLScoringModel unloadModel](self, "unloadModel");
  pthread_mutex_unlock(&self->_lock);

  return v15;
}

- (id)batchPredictWithFeatureDictArray:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  objc_class *v21;
  MLModel *mlModel;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  void *v34;
  id obj;
  _PSCoreMLScoringModel *v36;
  id v37;
  uint8_t buf;
  _BYTE v39[15];
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v36 = self;
  -[_PSCoreMLScoringModel featureOrderFromMetadata](self, "featureOrderFromMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v33;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v45 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          v9 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
          v10 = objc_alloc((Class)getMLMultiArrayClass_1());
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 0;
          v13 = (void *)objc_msgSend(v10, "initWithShape:dataType:error:", v12, 65600, &v43);
          v14 = v43;

          if (v14)
          {
            +[_PSLogging generalChannel](_PSLogging, "generalChannel");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              -[_PSCoreMLScoringModel batchPredictWithFeatureDictArray:].cold.4();

            goto LABEL_28;
          }
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __58___PSCoreMLScoringModel_batchPredictWithFeatureDictArray___block_invoke;
          v41[3] = &unk_1E43FEED8;
          v41[4] = v8;
          v15 = v13;
          v42 = v15;
          objc_msgSend(v4, "enumerateObjectsUsingBlock:", v41);
          -[_PSCoreMLScoringModel inputFeatureName](v36, "inputFeatureName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

          v17 = objc_alloc((Class)getMLDictionaryFeatureProviderClass_3());
          v40 = 0;
          v18 = (void *)objc_msgSend(v17, "initWithDictionary:error:", v9, &v40);
          v14 = v40;
          if (v14)
          {
            +[_PSLogging generalChannel](_PSLogging, "generalChannel");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              -[_PSCoreMLScoringModel batchPredictWithFeatureDictArray:].cold.3(&buf, v39, v19);

          }
          else
          {
            objc_msgSend(v34, "addObject:", v18);
          }

          if (v14)
          {
            v24 = 0;
            goto LABEL_37;
          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        if (v5)
          continue;
        break;
      }
    }

    v49 = 0;
    v50 = &v49;
    v51 = 0x2050000000;
    v20 = (void *)getMLArrayBatchProviderClass_softClass_3;
    v52 = getMLArrayBatchProviderClass_softClass_3;
    if (!getMLArrayBatchProviderClass_softClass_3)
    {
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __getMLArrayBatchProviderClass_block_invoke_3;
      v48[3] = &unk_1E43FEA00;
      v48[4] = &v49;
      __getMLArrayBatchProviderClass_block_invoke_3((uint64_t)v48);
      v20 = (void *)v50[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v49, 8);
    obj = (id)objc_msgSend([v21 alloc], "initWithFeatureProviderArray:", v34);
    mlModel = v36->_mlModel;
    v37 = 0;
    -[MLModel predictionsFromBatch:error:](mlModel, "predictionsFromBatch:error:", obj, &v37);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v37;
    if (v14)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[_PSCoreMLScoringModel batchPredictWithFeatureDictArray:].cold.2();

LABEL_28:
      v24 = 0;
    }
    else
    {
      if (objc_msgSend(v9, "count") >= 1)
      {
        v26 = 0;
        do
        {
          objc_msgSend(v9, "featuresAtIndex:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "featureValueForName:", CFSTR("classProbability"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "dictionaryValue");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v29, "count") == 2)
          {
            objc_msgSend(v29, "objectForKeyedSubscript:", &unk_1E442B6D8);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObject:", v30);

          }
          ++v26;
        }
        while (v26 < objc_msgSend(v9, "count"));
      }
      v24 = (void *)objc_msgSend(v32, "copy");
    }

LABEL_37:
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_PSCoreMLScoringModel batchPredictWithFeatureDictArray:].cold.1();
    v24 = 0;
  }

  return v24;
}

- (id)getSuggestionProxiesForCandidateToFeatureVectorDictGetter:(id)a3 predictionContext:(id)a4 messageInteractionCache:(id)a5 shareInteractionCache:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  _PSSuggestionProxy *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  _PSSuggestionProxy *v25;
  void *v26;
  void *v27;
  _PSSuggestionProxy *v28;
  NSObject *v29;
  void *v31;
  void *v32;
  _PSSuggestionProxy *obj;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  _PSSuggestionProxy *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v34 = (id)objc_opt_new();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_INFO, "_PSCoreMLScoringModel ranking", buf, 2u);
  }

  v31 = v9;
  v32 = v8;
  -[_PSCoreMLScoringModel scoreCandidates:predictionContext:](self, "scoreCandidates:predictionContext:", v8, v9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "keysSortedByValueUsingComparator:", &__block_literal_global_115);
  v11 = (_PSSuggestionProxy *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v42 = v11;
    _os_log_impl(&dword_1A07F4000, v12, OS_LOG_TYPE_INFO, "_PSCoreMLScoringModel sorted score array: %{private}@", buf, 0xCu);
  }

  -[_PSCoreMLScoringModel getModelPath](self, "getModelPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v11;
  v14 = -[_PSSuggestionProxy countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v35, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "candidateIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bundleId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSConstants sharePlayBundleId](_PSConstants, "sharePlayBundleId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqual:", v22);

        if (v23)
        {
          objc_msgSend(v18, "recipientsId");
          v24 = objc_claimAutoreleasedReturnValue();

          v20 = (void *)v24;
        }
        v25 = [_PSSuggestionProxy alloc];
        objc_msgSend(v18, "bundleId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@\n Score: %@"), v13, v19);
        v28 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:reason:reasonType:modelScore:](v25, "initWithBundleID:interactionRecipients:contactID:reason:reasonType:modelScore:", v26, v20, 0, v27, v13, v19);

        if (v28)
        {
          objc_msgSend(v34, "addObject:", v28);
          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v28;
            _os_log_impl(&dword_1A07F4000, v29, OS_LOG_TYPE_DEFAULT, "suggestionProxy: %@", buf, 0xCu);
          }

        }
      }
      v15 = -[_PSSuggestionProxy countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v15);
  }

  return v34;
}

- (_opaque_pthread_mutex_t)lock
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[1].__opaque[32];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[1].__opaque[16];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  v4 = *(_OWORD *)self[2].__opaque;
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[48];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setLock:(_opaque_pthread_mutex_t *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->__sig;
  v4 = *(_OWORD *)&a3->__opaque[8];
  v5 = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_lock.__opaque[40] = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_lock.__opaque[24] = v5;
  *(_OWORD *)&self->_lock.__opaque[8] = v4;
  *(_OWORD *)&self->_lock.__sig = v3;
}

- (MLModel)mlModel
{
  return self->_mlModel;
}

- (void)setMlModel:(id)a3
{
  objc_storeStrong((id *)&self->_mlModel, a3);
}

- (BOOL)mlModelInitialized
{
  return self->_mlModelInitialized;
}

- (void)setMlModelInitialized:(BOOL)a3
{
  self->_mlModelInitialized = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSArray)inputShape
{
  return self->_inputShape;
}

- (void)setInputShape:(id)a3
{
  objc_storeStrong((id *)&self->_inputShape, a3);
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelURL, a3);
}

- (NSString)inputFeatureName
{
  return self->_inputFeatureName;
}

- (void)setInputFeatureName:(id)a3
{
  objc_storeStrong((id *)&self->_inputFeatureName, a3);
}

- (NSString)numCandidatesFeatureName
{
  return self->_numCandidatesFeatureName;
}

- (void)setNumCandidatesFeatureName:(id)a3
{
  objc_storeStrong((id *)&self->_numCandidatesFeatureName, a3);
}

- (NSString)outputFeatureName
{
  return self->_outputFeatureName;
}

- (void)setOutputFeatureName:(id)a3
{
  objc_storeStrong((id *)&self->_outputFeatureName, a3);
}

- (int64_t)modelType
{
  return self->_modelType;
}

- (void)setModelType:(int64_t)a3
{
  self->_modelType = a3;
}

- (LCFModelStore)modelStore
{
  return self->_modelStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelStore, 0);
  objc_storeStrong((id *)&self->_outputFeatureName, 0);
  objc_storeStrong((id *)&self->_numCandidatesFeatureName, 0);
  objc_storeStrong((id *)&self->_inputFeatureName, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_inputShape, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_mlModel, 0);
}

- (void)loadProductionModel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Failed to load ML Model with URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)featureOrderFromMetadata
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Could not decode feature list. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getModelTypeWithModelMetadata:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1A07F4000, v0, OS_LOG_TYPE_FAULT, "Metadata %@ resulted in unknown model type", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)reformatCandidateDictionaryIntoFeatureTensor:(uint64_t)a3 candidateList:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "_PSCandidateScoringCoreMLModel: error creating MLMultiArray: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)reformatCandidateDictionaryIntoFeatureTensor:candidateList:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, v0, v1, "Missing candidates per feature %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)reformatCandidateDictionaryIntoFeatureTensor:candidateList:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, v0, v1, "Missing features per candidate %{private}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)reformatCandidateDictionaryIntoFeatureTensor:(void *)a1 candidateList:(NSObject *)a2 error:.cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "inputShape");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, a2, v4, "Reformatting candidate dictionary into feature tensor, with input shape: %@", v5);

  OUTLINED_FUNCTION_9_0();
}

- (void)predictWithFeatureProvider:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_ERROR, "Model output type was %@ instead of MLFeatureTypeMultiArray", v4, 0xCu);

  OUTLINED_FUNCTION_9_0();
}

- (void)predictWithFeatureProvider:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Predictions returned error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)scoreCandidatesWithCoreMLModel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Error creating tensor: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)scoreCandidatesWithCoreMLModel:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_5();
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1A07F4000, a3, OS_LOG_TYPE_ERROR, "prediction count (%ld) < candidate count (%@)", v5, 0x16u);
  OUTLINED_FUNCTION_9_0();
}

- (void)scoreCandidatesWithCoreMLModel:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Unexpected output shape %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)scoreCandidatesWithCoreMLModel:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Model returned error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)scoreCandidatesWithCoreMLModel:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "numCandidatesTensor returned an error during creation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)scoreCandidatesWithCoreMLModel:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, v0, v1, "Setting number of candidates to %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)scoreCandidates:predictionContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_1A07F4000, v0, v1, "_PSCandidateScoringCoreMLModel - model was missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)scoreCandidates:predictionContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_1A07F4000, v0, v1, "_PSCandidateScoringCoreMLModel - candidateToFeatureVectorDict was missing or empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)scoreCandidates:predictionContext:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_1A07F4000, v0, v1, "_PSCandidateScoringCoreMLModel - model metadata was missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)batchPredictWithFeatureDictArray:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "no features", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)batchPredictWithFeatureDictArray:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "_PSCandidateScoringCoreMLModel - People Suggester ML model, predictionsFromBatch failure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)batchPredictWithFeatureDictArray:(os_log_t)log .cold.3(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A07F4000, log, OS_LOG_TYPE_ERROR, "MLDictionaryFeatureProvider call failure", buf, 2u);
}

- (void)batchPredictWithFeatureDictArray:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "MLMultiArray creation failure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
