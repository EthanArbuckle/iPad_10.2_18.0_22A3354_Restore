@implementation PPScoreInterpreterCoreMLModel

- (PPScoreInterpreterCoreMLModel)initWithModelPath:(id)a3 features:(id)a4 outputSpecification:(id)a5
{
  id v9;
  id v10;
  id v11;
  PPScoreInterpreterCoreMLModel *v12;
  PPScoreInterpreterCoreMLModel *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PPScoreInterpreterCoreMLModel;
  v12 = -[PPScoreInterpreterCoreMLModel init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_coreMLModelPath, a3);
    -[PPScoreInterpreterCoreMLModel loadInstanceVariablesFromFeatures:outputSpecification:](v13, "loadInstanceVariablesFromFeatures:outputSpecification:", v10, v11);
  }

  return v13;
}

- (void)loadCoreMLModelIfNotAlreadyLoaded
{
  void *v3;
  void *v4;
  MLModel *v5;
  id v6;
  MLModel *coreMLModel;
  NSString *coreMLModelPath;
  id v9;
  uint8_t buf[4];
  NSString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_coreMLModel)
  {
    if (self->_coreMLModelPath)
    {
      v3 = (void *)MEMORY[0x1E0C9E940];
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      objc_msgSend(v3, "modelWithContentsOfURL:error:", v4, &v9);
      v5 = (MLModel *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      coreMLModel = self->_coreMLModel;
      self->_coreMLModel = v5;

      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          coreMLModelPath = self->_coreMLModelPath;
          *(_DWORD *)buf = 138412546;
          v11 = coreMLModelPath;
          v12 = 2112;
          v13 = v6;
          _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "error initializing %@ model: %@", buf, 0x16u);
        }
      }

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = 0;
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "error finding %@ model in assets", buf, 0xCu);
    }
  }
}

- (void)loadInstanceVariablesFromFeatures:(id)a3 outputSpecification:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSArray *v11;
  NSArray *coreMLInputFeatures;
  NSString *v13;
  NSString *coreMLModelOutputName;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSArray *v19;
  NSArray *argumentsToEvaluate;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v21 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __87__PPScoreInterpreterCoreMLModel_loadInstanceVariablesFromFeatures_outputSpecification___block_invoke;
  v22[3] = &unk_1E7E185C8;
  v9 = v8;
  v23 = v9;
  v10 = v7;
  v24 = v10;
  objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v22);
  v11 = (NSArray *)objc_msgSend(v10, "copy");
  coreMLInputFeatures = self->_coreMLInputFeatures;
  self->_coreMLInputFeatures = v11;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("outputName"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  coreMLModelOutputName = self->_coreMLModelOutputName;
  self->_coreMLModelOutputName = v13;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("outputIndexedSubscript"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v9, "mutableCopy");
  v17 = v16;
  if (v15)
  {
    objc_msgSend(v16, "addObject:", v15);
    v18 = 1;
  }
  else
  {
    v18 = 0;
  }
  self->_hasOutputIndexedSubscript = v18;
  v19 = (NSArray *)objc_msgSend(v17, "copy");
  argumentsToEvaluate = self->_argumentsToEvaluate;
  self->_argumentsToEvaluate = v19;

}

- (unint64_t)numberOfFeatures
{
  return -[NSArray count](self->_coreMLInputFeatures, "count");
}

- (id)featureAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_coreMLInputFeatures, "objectAtIndexedSubscript:", a3);
}

- (double)predictionForEvaluatedFeatures:(id)a3 withOutputIndexedSubscript:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  MLModel *coreMLModel;
  void *v10;
  id v11;
  double v12;
  void *v13;
  double v14;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PPScoreInterpreterCoreMLModel loadCoreMLModelIfNotAlreadyLoaded](self, "loadCoreMLModelIfNotAlreadyLoaded");
  v17 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8F8]), "initWithDictionary:error:", v6, &v17);
  v8 = v17;
  if (v7)
  {
    coreMLModel = self->_coreMLModel;
    v16 = v8;
    -[MLModel predictionFromFeatures:error:](coreMLModel, "predictionFromFeatures:error:", v7, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;

    if (v11)
    {
      v12 = -31337.0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v11;
        _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "ScoreInterpreter - CoreMLModel - Error in predictionFromFeatures: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v10, "featureValueForName:", self->_coreMLModelOutputName);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPScoreInterpreterCoreMLModel scoreForOutputValue:outputIndexedSubscript:](PPScoreInterpreterCoreMLModel, "scoreForOutputValue:outputIndexedSubscript:", v13, a4);
      v12 = v14;

    }
    v8 = v11;
  }
  else
  {
    v12 = -31337.0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v8;
      _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "ScoreInterpreter - CoreMLModel - Error in initializing MLDictionaryFeatureProvider: %@", buf, 0xCu);
    }
  }

  return v12;
}

- (NSArray)argumentsToEvaluate
{
  return self->_argumentsToEvaluate;
}

- (BOOL)hasOutputIndexedSubscript
{
  return self->_hasOutputIndexedSubscript;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argumentsToEvaluate, 0);
  objc_storeStrong((id *)&self->_coreMLInputFeatures, 0);
  objc_storeStrong((id *)&self->_coreMLModelOutputName, 0);
  objc_storeStrong((id *)&self->_coreMLModel, 0);
  objc_storeStrong((id *)&self->_coreMLModelPath, 0);
}

void __87__PPScoreInterpreterCoreMLModel_loadInstanceVariablesFromFeatures_outputSpecification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PPScoreInterpreterCoreMLModelFeature *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = -[PPScoreInterpreterCoreMLModelFeature initWithFeatureName:]([PPScoreInterpreterCoreMLModelFeature alloc], "initWithFeatureName:", v7);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

+ (double)scoreForOutputValue:(id)a3 outputIndexedSubscript:(int64_t)a4
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "type");
  switch(v6)
  {
    case 1:
      v7 = (double)objc_msgSend(v5, "int64Value");
      break;
    case 2:
      objc_msgSend(v5, "doubleValue");
      v7 = v8;
      break;
    case 5:
      objc_msgSend(v5, "multiArrayValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v7 = v11;
      goto LABEL_6;
    case 6:
      objc_msgSend(v5, "dictionaryValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v7 = v13;

LABEL_6:
      break;
    default:
      v7 = -31337.0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v15 = 134217984;
        v16 = v6;
        _os_log_error_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "ScoreInterpreter - CoreMLModel - No valid outputType found for %td", (uint8_t *)&v15, 0xCu);
      }
      break;
  }

  return v7;
}

@end
