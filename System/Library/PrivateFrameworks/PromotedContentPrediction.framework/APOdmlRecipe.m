@implementation APOdmlRecipe

- (APOdmlRecipe)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  APOdmlRecipe *v6;
  uint64_t v7;
  NSString *modelType;
  const char *v9;
  uint64_t v10;
  NSString *modelFileName;
  const char *v12;
  uint64_t v13;
  NSString *lossName;
  const char *v15;
  uint64_t v16;
  NSString *labelName;
  const char *v18;
  uint64_t v19;
  NSString *learningRateName;
  const char *v21;
  uint64_t v22;
  NSString *functionInitName;
  const char *v24;
  uint64_t v25;
  NSString *isTrainingName;
  const char *v27;
  uint64_t v28;
  NSNumber *isCounterfactual;
  const char *v30;
  uint64_t v31;
  NSDictionary *privacyParams;
  const char *v33;
  uint64_t v34;
  NSNumber *l2NormBound;
  const char *v36;
  uint64_t v37;
  NSNumber *learningRate;
  const char *v39;
  uint64_t v40;
  NSNumber *localIterationsCount;
  const char *v42;
  uint64_t v43;
  NSArray *trainLayers;
  const char *v45;
  uint64_t v46;
  NSNumber *weightBySamples;
  const char *v48;
  uint64_t v49;
  NSNumber *shouldShuffle;
  const char *v51;
  uint64_t v52;
  NSDictionary *desSettings;
  const char *v54;
  uint64_t v55;
  NSString *iCloudServiceKey;
  const char *v57;
  uint64_t v58;
  NSNumber *maxNorm;
  const char *v60;
  uint64_t v61;
  NSNumber *minTrainingSamples;
  const char *v63;
  uint64_t v64;
  NSNumber *normBinCount;
  const char *v66;
  uint64_t v67;
  NSArray *weightNames;
  const char *v69;
  uint64_t v70;
  NSNumber *batchSize;
  const char *v72;
  uint64_t v73;
  NSDictionary *featureValueConfig;
  const char *v75;
  uint64_t v76;
  NSDictionary *modelOutputConfig;
  const char *v78;
  uint64_t v79;
  NSArray *augmentedDESRecords;
  const char *v81;
  uint64_t v82;
  NSNumber *augmentedDESRecordsLimit;
  const char *v84;
  uint64_t v85;
  NSNumber *augmentedDESRecordsRatio;
  const char *v87;
  uint64_t v88;
  NSNumber *augmentedDESRecordsTruePercentage;
  const char *v90;
  uint64_t v91;
  NSString *augmentedDESRecordsTargetKey;
  const char *v93;
  uint64_t v94;
  NSArray *inputNames;
  const char *v96;
  uint64_t v97;
  NSArray *outputNames;
  const char *v99;
  void *v100;
  APOdmlRecipe *v101;
  const char *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  APOdmlRecipe *coreMLRecipe;
  objc_super v108;

  v4 = a3;
  v108.receiver = self;
  v108.super_class = (Class)APOdmlRecipe;
  v6 = -[APOdmlRecipe init](&v108, sel_init);
  if (v6)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("ModelType"));
    v7 = objc_claimAutoreleasedReturnValue();
    modelType = v6->_modelType;
    v6->_modelType = (NSString *)v7;

    objc_msgSend_objectForKeyedSubscript_(v4, v9, (uint64_t)CFSTR("ModelFileName"));
    v10 = objc_claimAutoreleasedReturnValue();
    modelFileName = v6->_modelFileName;
    v6->_modelFileName = (NSString *)v10;

    objc_msgSend_objectForKeyedSubscript_(v4, v12, (uint64_t)CFSTR("LossName"));
    v13 = objc_claimAutoreleasedReturnValue();
    lossName = v6->_lossName;
    v6->_lossName = (NSString *)v13;

    objc_msgSend_objectForKeyedSubscript_(v4, v15, (uint64_t)CFSTR("LabelName"));
    v16 = objc_claimAutoreleasedReturnValue();
    labelName = v6->_labelName;
    v6->_labelName = (NSString *)v16;

    objc_msgSend_objectForKeyedSubscript_(v4, v18, (uint64_t)CFSTR("LearningRateName"));
    v19 = objc_claimAutoreleasedReturnValue();
    learningRateName = v6->_learningRateName;
    v6->_learningRateName = (NSString *)v19;

    objc_msgSend_objectForKeyedSubscript_(v4, v21, (uint64_t)CFSTR("InitName"));
    v22 = objc_claimAutoreleasedReturnValue();
    functionInitName = v6->_functionInitName;
    v6->_functionInitName = (NSString *)v22;

    objc_msgSend_objectForKeyedSubscript_(v4, v24, (uint64_t)CFSTR("IsTrainingName"));
    v25 = objc_claimAutoreleasedReturnValue();
    isTrainingName = v6->_isTrainingName;
    v6->_isTrainingName = (NSString *)v25;

    objc_msgSend_objectForKeyedSubscript_(v4, v27, (uint64_t)CFSTR("IsCounterfactual"));
    v28 = objc_claimAutoreleasedReturnValue();
    isCounterfactual = v6->_isCounterfactual;
    v6->_isCounterfactual = (NSNumber *)v28;

    objc_msgSend_objectForKeyedSubscript_(v4, v30, (uint64_t)CFSTR("CentralDifferentialPrivacyParameters"));
    v31 = objc_claimAutoreleasedReturnValue();
    privacyParams = v6->_privacyParams;
    v6->_privacyParams = (NSDictionary *)v31;

    objc_msgSend_objectForKeyedSubscript_(v4, v33, (uint64_t)CFSTR("L2NormBound"));
    v34 = objc_claimAutoreleasedReturnValue();
    l2NormBound = v6->_l2NormBound;
    v6->_l2NormBound = (NSNumber *)v34;

    objc_msgSend_objectForKeyedSubscript_(v4, v36, (uint64_t)CFSTR("LearningRate"));
    v37 = objc_claimAutoreleasedReturnValue();
    learningRate = v6->_learningRate;
    v6->_learningRate = (NSNumber *)v37;

    objc_msgSend_objectForKeyedSubscript_(v4, v39, (uint64_t)CFSTR("NumLocalIterations"));
    v40 = objc_claimAutoreleasedReturnValue();
    localIterationsCount = v6->_localIterationsCount;
    v6->_localIterationsCount = (NSNumber *)v40;

    objc_msgSend_objectForKeyedSubscript_(v4, v42, (uint64_t)CFSTR("TrainLayers"));
    v43 = objc_claimAutoreleasedReturnValue();
    trainLayers = v6->_trainLayers;
    v6->_trainLayers = (NSArray *)v43;

    objc_msgSend_objectForKeyedSubscript_(v4, v45, (uint64_t)CFSTR("WeightBySamples"));
    v46 = objc_claimAutoreleasedReturnValue();
    weightBySamples = v6->_weightBySamples;
    v6->_weightBySamples = (NSNumber *)v46;

    objc_msgSend_objectForKeyedSubscript_(v4, v48, (uint64_t)CFSTR("shouldShuffle"));
    v49 = objc_claimAutoreleasedReturnValue();
    shouldShuffle = v6->_shouldShuffle;
    v6->_shouldShuffle = (NSNumber *)v49;

    objc_msgSend_objectForKeyedSubscript_(v4, v51, (uint64_t)CFSTR("des_settings"));
    v52 = objc_claimAutoreleasedReturnValue();
    desSettings = v6->_desSettings;
    v6->_desSettings = (NSDictionary *)v52;

    objc_msgSend_objectForKeyedSubscript_(v4, v54, (uint64_t)CFSTR("iCloudAggServiceKey"));
    v55 = objc_claimAutoreleasedReturnValue();
    iCloudServiceKey = v6->_iCloudServiceKey;
    v6->_iCloudServiceKey = (NSString *)v55;

    objc_msgSend_objectForKeyedSubscript_(v4, v57, (uint64_t)CFSTR("maxNorm"));
    v58 = objc_claimAutoreleasedReturnValue();
    maxNorm = v6->_maxNorm;
    v6->_maxNorm = (NSNumber *)v58;

    objc_msgSend_objectForKeyedSubscript_(v4, v60, (uint64_t)CFSTR("minTrainingSamples"));
    v61 = objc_claimAutoreleasedReturnValue();
    minTrainingSamples = v6->_minTrainingSamples;
    v6->_minTrainingSamples = (NSNumber *)v61;

    objc_msgSend_objectForKeyedSubscript_(v4, v63, (uint64_t)CFSTR("normBinCount"));
    v64 = objc_claimAutoreleasedReturnValue();
    normBinCount = v6->_normBinCount;
    v6->_normBinCount = (NSNumber *)v64;

    objc_msgSend_objectForKeyedSubscript_(v4, v66, (uint64_t)CFSTR("WeightNames"));
    v67 = objc_claimAutoreleasedReturnValue();
    weightNames = v6->_weightNames;
    v6->_weightNames = (NSArray *)v67;

    objc_msgSend_objectForKeyedSubscript_(v4, v69, (uint64_t)CFSTR("batchSize"));
    v70 = objc_claimAutoreleasedReturnValue();
    batchSize = v6->_batchSize;
    v6->_batchSize = (NSNumber *)v70;

    objc_msgSend_objectForKeyedSubscript_(v4, v72, (uint64_t)CFSTR("featureValueConfig"));
    v73 = objc_claimAutoreleasedReturnValue();
    featureValueConfig = v6->_featureValueConfig;
    v6->_featureValueConfig = (NSDictionary *)v73;

    objc_msgSend_objectForKeyedSubscript_(v4, v75, (uint64_t)CFSTR("modelOutputConfig"));
    v76 = objc_claimAutoreleasedReturnValue();
    modelOutputConfig = v6->_modelOutputConfig;
    v6->_modelOutputConfig = (NSDictionary *)v76;

    objc_msgSend_objectForKeyedSubscript_(v4, v78, (uint64_t)CFSTR("augmentedDESRecords"));
    v79 = objc_claimAutoreleasedReturnValue();
    augmentedDESRecords = v6->_augmentedDESRecords;
    v6->_augmentedDESRecords = (NSArray *)v79;

    objc_msgSend_objectForKeyedSubscript_(v4, v81, (uint64_t)CFSTR("augmentedDESRecordsLimit"));
    v82 = objc_claimAutoreleasedReturnValue();
    augmentedDESRecordsLimit = v6->_augmentedDESRecordsLimit;
    v6->_augmentedDESRecordsLimit = (NSNumber *)v82;

    objc_msgSend_objectForKeyedSubscript_(v4, v84, (uint64_t)CFSTR("augmentedDESRecordsRatio"));
    v85 = objc_claimAutoreleasedReturnValue();
    augmentedDESRecordsRatio = v6->_augmentedDESRecordsRatio;
    v6->_augmentedDESRecordsRatio = (NSNumber *)v85;

    objc_msgSend_objectForKeyedSubscript_(v4, v87, (uint64_t)CFSTR("augmentedDESRecordsTruePercentage"));
    v88 = objc_claimAutoreleasedReturnValue();
    augmentedDESRecordsTruePercentage = v6->_augmentedDESRecordsTruePercentage;
    v6->_augmentedDESRecordsTruePercentage = (NSNumber *)v88;

    objc_msgSend_objectForKeyedSubscript_(v4, v90, (uint64_t)CFSTR("augmentedDESRecordsTargetKey"));
    v91 = objc_claimAutoreleasedReturnValue();
    augmentedDESRecordsTargetKey = v6->_augmentedDESRecordsTargetKey;
    v6->_augmentedDESRecordsTargetKey = (NSString *)v91;

    objc_msgSend_objectForKeyedSubscript_(v4, v93, (uint64_t)CFSTR("InputNames"));
    v94 = objc_claimAutoreleasedReturnValue();
    inputNames = v6->_inputNames;
    v6->_inputNames = (NSArray *)v94;

    objc_msgSend_objectForKeyedSubscript_(v4, v96, (uint64_t)CFSTR("OutputNames"));
    v97 = objc_claimAutoreleasedReturnValue();
    outputNames = v6->_outputNames;
    v6->_outputNames = (NSArray *)v97;

    objc_msgSend_objectForKeyedSubscript_(v4, v99, (uint64_t)CFSTR("MILModel"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
    {
      v101 = [APOdmlRecipe alloc];
      objc_msgSend_objectForKeyedSubscript_(v4, v102, (uint64_t)CFSTR("MILModel"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = objc_msgSend_initWithDictionary_(v101, v104, (uint64_t)v103);
      coreMLRecipe = v6->_coreMLRecipe;
      v6->_coreMLRecipe = (APOdmlRecipe *)v105;

    }
  }

  return v6;
}

- (APOdmlRecipe)initWithMLRTask:(id)a3
{
  void *v4;
  const char *v5;
  APOdmlRecipe *v6;
  BOOL v7;
  uint64_t v8;
  NSString *modelType;
  const char *v10;
  uint64_t v11;
  NSString *modelFileName;
  const char *v13;
  uint64_t v14;
  NSString *lossName;
  const char *v16;
  uint64_t v17;
  NSString *labelName;
  const char *v19;
  uint64_t v20;
  NSString *learningRateName;
  const char *v22;
  uint64_t v23;
  NSString *functionInitName;
  const char *v25;
  uint64_t v26;
  NSString *isTrainingName;
  const char *v28;
  uint64_t v29;
  NSNumber *isCounterfactual;
  const char *v31;
  uint64_t v32;
  NSDictionary *privacyParams;
  const char *v34;
  uint64_t v35;
  NSNumber *l2NormBound;
  const char *v37;
  uint64_t v38;
  NSNumber *learningRate;
  const char *v40;
  uint64_t v41;
  NSNumber *localIterationsCount;
  const char *v43;
  uint64_t v44;
  NSArray *trainLayers;
  const char *v46;
  uint64_t v47;
  NSNumber *weightBySamples;
  const char *v49;
  uint64_t v50;
  NSNumber *shouldShuffle;
  const char *v52;
  uint64_t v53;
  NSDictionary *desSettings;
  const char *v55;
  uint64_t v56;
  NSString *iCloudServiceKey;
  const char *v58;
  uint64_t v59;
  NSNumber *maxNorm;
  const char *v61;
  uint64_t v62;
  NSNumber *minTrainingSamples;
  const char *v64;
  uint64_t v65;
  NSNumber *normBinCount;
  const char *v67;
  uint64_t v68;
  NSArray *weightNames;
  const char *v70;
  uint64_t v71;
  NSNumber *batchSize;
  const char *v73;
  uint64_t v74;
  NSDictionary *featureValueConfig;
  const char *v76;
  uint64_t v77;
  NSDictionary *modelOutputConfig;
  const char *v79;
  uint64_t v80;
  NSArray *augmentedDESRecords;
  const char *v82;
  uint64_t v83;
  NSNumber *augmentedDESRecordsLimit;
  const char *v85;
  uint64_t v86;
  NSNumber *augmentedDESRecordsRatio;
  const char *v88;
  uint64_t v89;
  NSNumber *augmentedDESRecordsTruePercentage;
  const char *v91;
  uint64_t v92;
  NSString *augmentedDESRecordsTargetKey;
  objc_super v95;

  objc_msgSend_parameters(a3, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v95.receiver = self;
  v95.super_class = (Class)APOdmlRecipe;
  v6 = -[APOdmlRecipe init](&v95, sel_init);
  if (v6)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("ModelType"));
    v8 = objc_claimAutoreleasedReturnValue();
    modelType = v6->_modelType;
    v6->_modelType = (NSString *)v8;

    objc_msgSend_objectForKeyedSubscript_(v4, v10, (uint64_t)CFSTR("ModelFileName"));
    v11 = objc_claimAutoreleasedReturnValue();
    modelFileName = v6->_modelFileName;
    v6->_modelFileName = (NSString *)v11;

    objc_msgSend_objectForKeyedSubscript_(v4, v13, (uint64_t)CFSTR("LossName"));
    v14 = objc_claimAutoreleasedReturnValue();
    lossName = v6->_lossName;
    v6->_lossName = (NSString *)v14;

    objc_msgSend_objectForKeyedSubscript_(v4, v16, (uint64_t)CFSTR("LabelName"));
    v17 = objc_claimAutoreleasedReturnValue();
    labelName = v6->_labelName;
    v6->_labelName = (NSString *)v17;

    objc_msgSend_objectForKeyedSubscript_(v4, v19, (uint64_t)CFSTR("LearningRateName"));
    v20 = objc_claimAutoreleasedReturnValue();
    learningRateName = v6->_learningRateName;
    v6->_learningRateName = (NSString *)v20;

    objc_msgSend_objectForKeyedSubscript_(v4, v22, (uint64_t)CFSTR("InitName"));
    v23 = objc_claimAutoreleasedReturnValue();
    functionInitName = v6->_functionInitName;
    v6->_functionInitName = (NSString *)v23;

    objc_msgSend_objectForKeyedSubscript_(v4, v25, (uint64_t)CFSTR("IsTrainingName"));
    v26 = objc_claimAutoreleasedReturnValue();
    isTrainingName = v6->_isTrainingName;
    v6->_isTrainingName = (NSString *)v26;

    objc_msgSend_objectForKeyedSubscript_(v4, v28, (uint64_t)CFSTR("IsCounterfactual"));
    v29 = objc_claimAutoreleasedReturnValue();
    isCounterfactual = v6->_isCounterfactual;
    v6->_isCounterfactual = (NSNumber *)v29;

    objc_msgSend_objectForKeyedSubscript_(v4, v31, (uint64_t)CFSTR("CentralDifferentialPrivacyParameters"));
    v32 = objc_claimAutoreleasedReturnValue();
    privacyParams = v6->_privacyParams;
    v6->_privacyParams = (NSDictionary *)v32;

    objc_msgSend_objectForKeyedSubscript_(v4, v34, (uint64_t)CFSTR("L2NormBound"));
    v35 = objc_claimAutoreleasedReturnValue();
    l2NormBound = v6->_l2NormBound;
    v6->_l2NormBound = (NSNumber *)v35;

    objc_msgSend_objectForKeyedSubscript_(v4, v37, (uint64_t)CFSTR("LearningRate"));
    v38 = objc_claimAutoreleasedReturnValue();
    learningRate = v6->_learningRate;
    v6->_learningRate = (NSNumber *)v38;

    objc_msgSend_objectForKeyedSubscript_(v4, v40, (uint64_t)CFSTR("NumLocalIterations"));
    v41 = objc_claimAutoreleasedReturnValue();
    localIterationsCount = v6->_localIterationsCount;
    v6->_localIterationsCount = (NSNumber *)v41;

    objc_msgSend_objectForKeyedSubscript_(v4, v43, (uint64_t)CFSTR("TrainLayers"));
    v44 = objc_claimAutoreleasedReturnValue();
    trainLayers = v6->_trainLayers;
    v6->_trainLayers = (NSArray *)v44;

    objc_msgSend_objectForKeyedSubscript_(v4, v46, (uint64_t)CFSTR("WeightBySamples"));
    v47 = objc_claimAutoreleasedReturnValue();
    weightBySamples = v6->_weightBySamples;
    v6->_weightBySamples = (NSNumber *)v47;

    objc_msgSend_objectForKeyedSubscript_(v4, v49, (uint64_t)CFSTR("shouldShuffle"));
    v50 = objc_claimAutoreleasedReturnValue();
    shouldShuffle = v6->_shouldShuffle;
    v6->_shouldShuffle = (NSNumber *)v50;

    objc_msgSend_objectForKeyedSubscript_(v4, v52, (uint64_t)CFSTR("des_settings"));
    v53 = objc_claimAutoreleasedReturnValue();
    desSettings = v6->_desSettings;
    v6->_desSettings = (NSDictionary *)v53;

    objc_msgSend_objectForKeyedSubscript_(v4, v55, (uint64_t)CFSTR("iCloudAggServiceKey"));
    v56 = objc_claimAutoreleasedReturnValue();
    iCloudServiceKey = v6->_iCloudServiceKey;
    v6->_iCloudServiceKey = (NSString *)v56;

    objc_msgSend_objectForKeyedSubscript_(v4, v58, (uint64_t)CFSTR("maxNorm"));
    v59 = objc_claimAutoreleasedReturnValue();
    maxNorm = v6->_maxNorm;
    v6->_maxNorm = (NSNumber *)v59;

    objc_msgSend_objectForKeyedSubscript_(v4, v61, (uint64_t)CFSTR("minTrainingSamples"));
    v62 = objc_claimAutoreleasedReturnValue();
    minTrainingSamples = v6->_minTrainingSamples;
    v6->_minTrainingSamples = (NSNumber *)v62;

    objc_msgSend_objectForKeyedSubscript_(v4, v64, (uint64_t)CFSTR("normBinCount"));
    v65 = objc_claimAutoreleasedReturnValue();
    normBinCount = v6->_normBinCount;
    v6->_normBinCount = (NSNumber *)v65;

    objc_msgSend_objectForKeyedSubscript_(v4, v67, (uint64_t)CFSTR("WeightNames"));
    v68 = objc_claimAutoreleasedReturnValue();
    weightNames = v6->_weightNames;
    v6->_weightNames = (NSArray *)v68;

    objc_msgSend_objectForKeyedSubscript_(v4, v70, (uint64_t)CFSTR("batchSize"));
    v71 = objc_claimAutoreleasedReturnValue();
    batchSize = v6->_batchSize;
    v6->_batchSize = (NSNumber *)v71;

    objc_msgSend_objectForKeyedSubscript_(v4, v73, (uint64_t)CFSTR("featureValueConfig"));
    v74 = objc_claimAutoreleasedReturnValue();
    featureValueConfig = v6->_featureValueConfig;
    v6->_featureValueConfig = (NSDictionary *)v74;

    objc_msgSend_objectForKeyedSubscript_(v4, v76, (uint64_t)CFSTR("modelOutputConfig"));
    v77 = objc_claimAutoreleasedReturnValue();
    modelOutputConfig = v6->_modelOutputConfig;
    v6->_modelOutputConfig = (NSDictionary *)v77;

    objc_msgSend_objectForKeyedSubscript_(v4, v79, (uint64_t)CFSTR("augmentedDESRecords"));
    v80 = objc_claimAutoreleasedReturnValue();
    augmentedDESRecords = v6->_augmentedDESRecords;
    v6->_augmentedDESRecords = (NSArray *)v80;

    objc_msgSend_objectForKeyedSubscript_(v4, v82, (uint64_t)CFSTR("augmentedDESRecordsLimit"));
    v83 = objc_claimAutoreleasedReturnValue();
    augmentedDESRecordsLimit = v6->_augmentedDESRecordsLimit;
    v6->_augmentedDESRecordsLimit = (NSNumber *)v83;

    objc_msgSend_objectForKeyedSubscript_(v4, v85, (uint64_t)CFSTR("augmentedDESRecordsRatio"));
    v86 = objc_claimAutoreleasedReturnValue();
    augmentedDESRecordsRatio = v6->_augmentedDESRecordsRatio;
    v6->_augmentedDESRecordsRatio = (NSNumber *)v86;

    objc_msgSend_objectForKeyedSubscript_(v4, v88, (uint64_t)CFSTR("augmentedDESRecordsTruePercentage"));
    v89 = objc_claimAutoreleasedReturnValue();
    augmentedDESRecordsTruePercentage = v6->_augmentedDESRecordsTruePercentage;
    v6->_augmentedDESRecordsTruePercentage = (NSNumber *)v89;

    objc_msgSend_objectForKeyedSubscript_(v4, v91, (uint64_t)CFSTR("augmentedDESRecordsTargetKey"));
    v92 = objc_claimAutoreleasedReturnValue();
    augmentedDESRecordsTargetKey = v6->_augmentedDESRecordsTargetKey;
    v6->_augmentedDESRecordsTargetKey = (NSString *)v92;

  }
  return v6;
}

- (id)sentinelValuesForFeature:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;

  v4 = a3;
  objc_msgSend_featureValueConfig(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(v9, v10, (uint64_t)CFSTR("sentinelValueSet"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)rangeBoundaryForFeature:(id)a3 upperBound:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  __CFString **v13;
  void *v14;

  v4 = a4;
  v6 = a3;
  objc_msgSend_featureValueConfig(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v9, v10, (uint64_t)v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = kAPOdmlConfigMax;
  if (!v4)
    v13 = kAPOdmlConfigMin;
  objc_msgSend_objectForKey_(v11, v12, (uint64_t)*v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)sentinelValuesForOutput
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_modelOutputConfig(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("sentinelValueSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)rangeBoundaryForOutput:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  const char *v5;
  void *v6;
  __CFString **v7;
  void *v8;

  v3 = a3;
  objc_msgSend_modelOutputConfig(self, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = kAPOdmlConfigMax;
  if (!v3)
    v7 = kAPOdmlConfigMin;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)*v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)modelType
{
  return self->_modelType;
}

- (NSString)modelFileName
{
  return self->_modelFileName;
}

- (NSString)lossName
{
  return self->_lossName;
}

- (NSString)labelName
{
  return self->_labelName;
}

- (NSString)learningRateName
{
  return self->_learningRateName;
}

- (NSString)functionInitName
{
  return self->_functionInitName;
}

- (NSString)isTrainingName
{
  return self->_isTrainingName;
}

- (NSNumber)isCounterfactual
{
  return self->_isCounterfactual;
}

- (NSString)iCloudServiceKey
{
  return self->_iCloudServiceKey;
}

- (NSNumber)l2NormBound
{
  return self->_l2NormBound;
}

- (NSNumber)learningRate
{
  return self->_learningRate;
}

- (NSNumber)localIterationsCount
{
  return self->_localIterationsCount;
}

- (NSNumber)weightBySamples
{
  return self->_weightBySamples;
}

- (NSNumber)shouldShuffle
{
  return self->_shouldShuffle;
}

- (NSNumber)minTrainingSamples
{
  return self->_minTrainingSamples;
}

- (NSNumber)maxNorm
{
  return self->_maxNorm;
}

- (NSNumber)normBinCount
{
  return self->_normBinCount;
}

- (NSDictionary)desSettings
{
  return self->_desSettings;
}

- (NSDictionary)privacyParams
{
  return self->_privacyParams;
}

- (NSArray)trainLayers
{
  return self->_trainLayers;
}

- (NSArray)weightNames
{
  return self->_weightNames;
}

- (NSNumber)batchSize
{
  return self->_batchSize;
}

- (NSDictionary)featureValueConfig
{
  return self->_featureValueConfig;
}

- (NSDictionary)modelOutputConfig
{
  return self->_modelOutputConfig;
}

- (NSArray)augmentedDESRecords
{
  return self->_augmentedDESRecords;
}

- (NSNumber)augmentedDESRecordsLimit
{
  return self->_augmentedDESRecordsLimit;
}

- (NSString)augmentedDESRecordsTargetKey
{
  return self->_augmentedDESRecordsTargetKey;
}

- (NSNumber)augmentedDESRecordsTruePercentage
{
  return self->_augmentedDESRecordsTruePercentage;
}

- (NSNumber)augmentedDESRecordsRatio
{
  return self->_augmentedDESRecordsRatio;
}

- (NSArray)inputNames
{
  return self->_inputNames;
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (APOdmlRecipe)coreMLRecipe
{
  return self->_coreMLRecipe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreMLRecipe, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_augmentedDESRecordsRatio, 0);
  objc_storeStrong((id *)&self->_augmentedDESRecordsTruePercentage, 0);
  objc_storeStrong((id *)&self->_augmentedDESRecordsTargetKey, 0);
  objc_storeStrong((id *)&self->_augmentedDESRecordsLimit, 0);
  objc_storeStrong((id *)&self->_augmentedDESRecords, 0);
  objc_storeStrong((id *)&self->_modelOutputConfig, 0);
  objc_storeStrong((id *)&self->_featureValueConfig, 0);
  objc_storeStrong((id *)&self->_batchSize, 0);
  objc_storeStrong((id *)&self->_weightNames, 0);
  objc_storeStrong((id *)&self->_trainLayers, 0);
  objc_storeStrong((id *)&self->_privacyParams, 0);
  objc_storeStrong((id *)&self->_desSettings, 0);
  objc_storeStrong((id *)&self->_normBinCount, 0);
  objc_storeStrong((id *)&self->_maxNorm, 0);
  objc_storeStrong((id *)&self->_minTrainingSamples, 0);
  objc_storeStrong((id *)&self->_shouldShuffle, 0);
  objc_storeStrong((id *)&self->_weightBySamples, 0);
  objc_storeStrong((id *)&self->_localIterationsCount, 0);
  objc_storeStrong((id *)&self->_learningRate, 0);
  objc_storeStrong((id *)&self->_l2NormBound, 0);
  objc_storeStrong((id *)&self->_iCloudServiceKey, 0);
  objc_storeStrong((id *)&self->_isCounterfactual, 0);
  objc_storeStrong((id *)&self->_isTrainingName, 0);
  objc_storeStrong((id *)&self->_functionInitName, 0);
  objc_storeStrong((id *)&self->_learningRateName, 0);
  objc_storeStrong((id *)&self->_labelName, 0);
  objc_storeStrong((id *)&self->_lossName, 0);
  objc_storeStrong((id *)&self->_modelFileName, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
}

@end
