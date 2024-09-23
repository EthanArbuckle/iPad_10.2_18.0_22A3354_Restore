@implementation FidesPHSEvaluatorDataSource

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.LighthouseShareSheetPFLPlugin", "EvaluationDataSource");
    v3 = (void *)sLog_0;
    sLog_0 = (uint64_t)v2;

  }
}

+ (id)defaultRecipeParams
{
  _QWORD v3[23];
  _QWORD v4[24];

  v4[23] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("NumLocalIterations");
  v3[1] = CFSTR("LearningRate");
  v4[0] = &unk_1E442ABF8;
  v4[1] = &unk_1E442CFA8;
  v3[2] = CFSTR("LearningRateDecay");
  v3[3] = CFSTR("TrainLayers");
  v4[2] = &unk_1E442CFB8;
  v4[3] = MEMORY[0x1E0C9AA60];
  v3[4] = CFSTR("InputSplice");
  v3[5] = CFSTR("ClassLearningRates");
  v4[4] = MEMORY[0x1E0C9AA60];
  v4[5] = MEMORY[0x1E0C9AA60];
  v3[6] = CFSTR("LabelMap");
  v3[7] = CFSTR("GradientNormFactor");
  v4[6] = MEMORY[0x1E0C9AA70];
  v4[7] = &unk_1E442CFC8;
  v3[8] = CFSTR("BatchSize");
  v3[9] = CFSTR("L2NormBound");
  v4[8] = &unk_1E442ABF8;
  v4[9] = &unk_1E442CFD8;
  v3[10] = CFSTR("GradientNormType");
  v3[11] = CFSTR("ObjectiveFunction");
  v4[10] = CFSTR("NoGradNorm");
  v4[11] = CFSTR("xent");
  v3[12] = CFSTR("FrozenComponentIds");
  v3[13] = CFSTR("ClassThreshold");
  v4[12] = &stru_1E4402490;
  v4[13] = &unk_1E442AC10;
  v3[14] = CFSTR("GBDTQuestions");
  v3[15] = CFSTR("ComputeFirstOrderGradients");
  v4[14] = &unk_1E442C868;
  v4[15] = MEMORY[0x1E0C9AAB0];
  v3[16] = CFSTR("ComputeSecondOrderGradients");
  v3[17] = CFSTR("ReportGradientsBothSidesOfSplit");
  v4[16] = MEMORY[0x1E0C9AAB0];
  v4[17] = MEMORY[0x1E0C9AAB0];
  v3[18] = CFSTR("ReportNodeSumGradients");
  v3[19] = CFSTR("ReportPerFeatureResultDifference");
  v4[18] = MEMORY[0x1E0C9AAB0];
  v4[19] = MEMORY[0x1E0C9AAA0];
  v3[20] = CFSTR("ReportPerNodeResultDifference");
  v3[21] = CFSTR("WeightVector");
  v4[20] = MEMORY[0x1E0C9AAA0];
  v4[21] = MEMORY[0x1E0C9AA60];
  v3[22] = CFSTR("TranslateVector");
  v4[22] = MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 23);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (FidesPHSEvaluatorDataSource)initWithRecipe:(id)a3 inputVectors:(id)a4 targetVector:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  FidesPHSEvaluatorDataSource *v12;
  FidesPHSEvaluatorDataSource *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *recipe;
  FidesPHSEvaluatorDataSource *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)FidesPHSEvaluatorDataSource;
  v12 = -[FidesPHSEvaluatorDataSource init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_inputVectors, a4);
    objc_storeStrong((id *)&v13->_targetVector, a5);
    +[FidesPHSEvaluatorDataSource defaultRecipeParams](FidesPHSEvaluatorDataSource, "defaultRecipeParams");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "addEntriesFromDictionary:", v9);
    v16 = objc_msgSend(v15, "copy");
    recipe = v13->_recipe;
    v13->_recipe = (NSDictionary *)v16;

    v18 = v13;
  }

  return v13;
}

- (int)numLocalIterations
{
  void *v2;
  void *v3;
  int v4;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NumLocalIterations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (float)learningRate
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LearningRate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (float)learningRateDecay
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LearningRateDecay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (id)layersToTrain
{
  void *v2;
  void *v3;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("TrainLayers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)labelMap
{
  void *v2;
  void *v3;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LabelMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)inputSplice
{
  void *v2;
  void *v3;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("InputSplice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)classLearningRates
{
  void *v2;
  void *v3;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ClassLearningRates"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (float)gradNormFactor
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("GradientNormFactor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (int)batchSize
{
  void *v2;
  void *v3;
  int v4;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("BatchSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (float)l2NormBound
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("L2NormBound"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (id)gradNormType
{
  void *v2;
  void *v3;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("GradientNormType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)objectiveFunction
{
  void *v2;
  void *v3;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ObjectiveFunction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)freezeComponents
{
  void *v2;
  void *v3;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FrozenComponentIds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)classThreshold
{
  void *v2;
  void *v3;
  int v4;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ClassThreshold"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (NSArray)GBDTQuestions
{
  void *v2;
  void *v3;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("GBDTQuestions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)computeFirstOrderGradients
{
  void *v2;
  void *v3;
  char v4;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ComputeFirstOrderGradients"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)computeSecondOrderGradients
{
  void *v2;
  void *v3;
  char v4;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ComputeSecondOrderGradients"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)reportGradientsBothSidesOfSplit
{
  void *v2;
  void *v3;
  char v4;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ReportGradientsBothSidesOfSplit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)reportNodeSumGradients
{
  void *v2;
  void *v3;
  char v4;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ReportNodeSumGradients"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)reportPerFeatureResultDifference
{
  void *v2;
  void *v3;
  char v4;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ReportPerFeatureResultDifference"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)reportPerNodeResultDifference
{
  void *v2;
  void *v3;
  char v4;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ReportPerNodeResultDifference"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSArray)weightVector
{
  void *v2;
  void *v3;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("WeightVector"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)translateVector
{
  void *v2;
  void *v3;

  -[FidesPHSEvaluatorDataSource recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("TranslateVector"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)inputVectors
{
  return self->_inputVectors;
}

- (NSArray)targetVector
{
  return self->_targetVector;
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_storeStrong((id *)&self->_records, a3);
}

- (NSArray)recordInfos
{
  return self->_recordInfos;
}

- (void)setRecordInfos:(id)a3
{
  objc_storeStrong((id *)&self->_recordInfos, a3);
}

- (NSArray)recordDatas
{
  return self->_recordDatas;
}

- (void)setRecordDatas:(id)a3
{
  objc_storeStrong((id *)&self->_recordDatas, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordDatas, 0);
  objc_storeStrong((id *)&self->_recordInfos, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_targetVector, 0);
  objc_storeStrong((id *)&self->_inputVectors, 0);
}

@end
