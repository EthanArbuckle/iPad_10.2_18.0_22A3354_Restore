@implementation REMLModel

+ (unint64_t)featureBitWidth
{
  __objc2_class **v3;

  if (_fetchedInternalBuildOnceToken_12 != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken_12, &__block_literal_global_129);
  if (_isInternalDevice_12)
  {
    if (REGetDisableAllModelPredictions_onceToken != -1)
      dispatch_once(&REGetDisableAllModelPredictions_onceToken, &__block_literal_global_130_0);
    if (REGetDisableAllModelPredictions__REValueDisableAllModelPredictions)
      return 64;
  }
  if (_fetchedInternalBuildOnceToken_12 != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken_12, &__block_literal_global_138_0);
  if (!_isInternalDevice_12)
    goto LABEL_15;
  if (REGetDisableMLModel_onceToken != -1)
    dispatch_once(&REGetDisableMLModel_onceToken, &__block_literal_global_139_0);
  if (REGetDisableMLModel__REValueDisableMLModel)
    v3 = off_24CF89A68;
  else
LABEL_15:
    v3 = off_24CF89358;
  return -[__objc2_class featureBitWidth](*v3, "featureBitWidth");
}

- (BOOL)requiresDirectory
{
  return 0;
}

- (void)setMetricsRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_metricsRecorder, a3);
}

+ (REMLModel)modelWithFeatureSet:(id)a3 priorMean:(float)a4 modelVarianceEpsilon:(float)a5
{
  id v7;
  void *v8;
  void *v9;
  __objc2_class *v10;
  id v11;
  double v12;
  double v13;
  void *v14;

  v7 = a3;
  v8 = (void *)objc_opt_class();
  if (objc_msgSend(v8, "isSubclassOfClass:", objc_opt_class())
    && (v9 = (void *)objc_opt_class(), (objc_msgSend(v9, "isEqual:", objc_opt_class()) & 1) == 0))
  {
    v10 = (__objc2_class *)objc_opt_class();
  }
  else
  {
    if (_fetchedInternalBuildOnceToken_12 != -1)
      dispatch_once(&_fetchedInternalBuildOnceToken_12, &__block_literal_global_129);
    if (!_isInternalDevice_12)
      goto LABEL_10;
    if (REGetDisableAllModelPredictions_onceToken != -1)
      dispatch_once(&REGetDisableAllModelPredictions_onceToken, &__block_literal_global_130_0);
    if (REGetDisableAllModelPredictions__REValueDisableAllModelPredictions)
    {
      v10 = REMLModel;
    }
    else
    {
LABEL_10:
      if (_fetchedInternalBuildOnceToken_12 != -1)
        dispatch_once(&_fetchedInternalBuildOnceToken_12, &__block_literal_global_138_0);
      if (!_isInternalDevice_12)
        goto LABEL_17;
      if (REGetDisableMLModel_onceToken != -1)
        dispatch_once(&REGetDisableMLModel_onceToken, &__block_literal_global_139_0);
      if (REGetDisableMLModel__REValueDisableMLModel)
        v10 = REStaticMLModel;
      else
LABEL_17:
        v10 = REBayesianMLModel;
    }
  }
  v11 = [v10 alloc];
  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  v14 = (void *)objc_msgSend(v11, "initWithFeatureSet:priorMean:modelVarianceEpsilon:", v7, v12, v13);

  return (REMLModel *)v14;
}

- (void)setWantsPredictionCache:(BOOL)a3
{
  if (self->_wantsPredictionCache != a3)
  {
    self->_wantsPredictionCache = a3;
    if (!a3)
      -[REConcurrentDictionary removeAllObjects](self->_predictionCache, "removeAllObjects");
  }
}

- (void)setSimulationExploreExploitModulator:(float)a3
{
  self->_simulationExploreExploitModulator = a3;
}

- (void)setMetricsInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_metricsInteraction, a3);
}

- (void)setExploreExploitModulator:(float)a3
{
  self->_exploreExploitModulator = a3;
}

- (void)setAllowsExploreExploit:(BOOL)a3
{
  self->_allowsExploreExploit = a3;
}

- (REMLModel)initWithFeatureSet:(id)a3 priorMean:(float)a4 modelVarianceEpsilon:(float)a5
{
  REMLModel *result;

  result = -[REMLModel init](self, "init", a3);
  if (result)
  {
    result->_priorMean = a4;
    result->_varianceEpsilon = a5;
  }
  return result;
}

- (REMLModel)init
{
  REMLModel *v2;
  REConcurrentDictionary *v3;
  REConcurrentDictionary *predictionCache;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMLModel;
  v2 = -[REMLModel init](&v7, sel_init);
  if (v2)
  {
    v3 = -[REConcurrentDictionary initWeakToStrongDictionary]([REConcurrentDictionary alloc], "initWeakToStrongDictionary");
    predictionCache = v2->_predictionCache;
    v2->_predictionCache = v3;

    v2->_wantsPredictionCache = 0;
    v2->_allowsExploreExploit = 1;
    v5 = (void *)objc_opt_class();
    v2->_implementsDebugSaving = RESubclassOverridesMethod(v2, v5, (uint64_t)sel__saveDebugModelToURL_error_);
  }
  return v2;
}

- (float)varianceEpsilon
{
  return self->_varianceEpsilon;
}

- (float)priorMean
{
  return self->_priorMean;
}

+ (unint64_t)maxFeatureCount
{
  if (_fetchedInternalBuildOnceToken_12 != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken_12, &__block_literal_global_129);
  if (_isInternalDevice_12)
  {
    if (REGetDisableAllModelPredictions_onceToken != -1)
      dispatch_once(&REGetDisableAllModelPredictions_onceToken, &__block_literal_global_130_0);
    if (REGetDisableAllModelPredictions__REValueDisableAllModelPredictions)
      return -1;
  }
  if (_fetchedInternalBuildOnceToken_12 != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken_12, &__block_literal_global_138_0);
  if (!_isInternalDevice_12)
    return +[REBayesianMLModel maxFeatureCount](REBayesianMLModel, "maxFeatureCount");
  if (REGetDisableMLModel_onceToken != -1)
    dispatch_once(&REGetDisableMLModel_onceToken, &__block_literal_global_139_0);
  if (REGetDisableMLModel__REValueDisableMLModel)
    return -1;
  else
    return +[REBayesianMLModel maxFeatureCount](REBayesianMLModel, "maxFeatureCount");
}

- (BOOL)wantsPredictionCache
{
  return self->_wantsPredictionCache;
}

- (void)_clearCache
{
  if (-[REMLModel wantsPredictionCache](self, "wantsPredictionCache"))
    -[REConcurrentDictionary removeAllObjects](self->_predictionCache, "removeAllObjects");
}

- (id)predictWithFeatures:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = -[REMLModel wantsPredictionCache](self, "wantsPredictionCache");
  if (!v5
    || (-[REConcurrentDictionary objectForKey:](self->_predictionCache, "objectForKey:", v4),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[REMLModel _predictWithFeatures:](self, "_predictWithFeatures:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[REConcurrentDictionary setObject:forKey:](self->_predictionCache, "setObject:forKey:", v6, v4);
  }
  v7 = v6;

  return v7;
}

- (id)predictionSetWithFeatures:(id)a3
{
  id v4;
  REMLPredictionSet *v5;
  void *v6;
  REMLPredictionSet *v7;

  v4 = a3;
  v5 = [REMLPredictionSet alloc];
  -[REMLModel predictWithFeatures:](self, "predictWithFeatures:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[REMLPredictionSet initWithPrediction:](v5, "initWithPrediction:", v6);
  return v7;
}

- (id)_predictWithFeatures:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;

  LODWORD(v3) = 0.5;
  LODWORD(v4) = 0;
  LODWORD(v5) = 0;
  LODWORD(v6) = 0;
  return +[REMLPrediction predictionWithProbability:mean:variance:pessimistic:](REMLPrediction, "predictionWithProbability:mean:variance:pessimistic:", a3, v3, v4, v5, v6);
}

- (BOOL)saveModelToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  id v13;

  v6 = a3;
  if (self->_implementsDebugSaving)
  {
    if (_fetchedInternalBuildOnceToken_12 != -1)
      dispatch_once(&_fetchedInternalBuildOnceToken_12, &__block_literal_global_86);
    if (_isInternalDevice_12)
    {
      objc_msgSend(v6, "URLByAppendingPathExtension:", CFSTR("debug"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v8 = -[REMLModel _saveDebugModelToURL:error:](self, "_saveDebugModelToURL:error:", v7, &v13);
      v9 = v13;
      if (!v8)
      {
        RELogForDomain(4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[REMLModel saveModelToURL:error:].cold.1((uint64_t)v9, v10);

      }
    }
  }
  v11 = -[REMLModel _saveModelToURL:error:](self, "_saveModelToURL:error:", v6, a4);

  return v11;
}

uint64_t __34__REMLModel_saveModelToURL_error___block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_12 = result;
  return result;
}

- (BOOL)_saveModelToURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)_loadModelFromURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)_saveDebugModelToURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)clearModel
{
  -[REConcurrentDictionary removeAllObjects](self->_predictionCache, "removeAllObjects");
  -[REMLModel _clearModel](self, "_clearModel");
}

- (int64_t)_getNumberOfCoordinates
{
  return 0;
}

- (float)_getAveragePrediction
{
  return 0.0;
}

- (float)_getNormalizedEntropy
{
  return 0.0;
}

- (unint64_t)_getTotalExampleCount
{
  return 0;
}

- (unint64_t)_getTotalPositiveCount
{
  return 0;
}

- (NSString)name
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (unint64_t)featureBitWidth
{
  return objc_msgSend((id)objc_opt_class(), "featureBitWidth");
}

- (unint64_t)maxFeatureCount
{
  return objc_msgSend((id)objc_opt_class(), "maxFeatureCount");
}

- (BOOL)allowsExploreExploit
{
  return self->_allowsExploreExploit;
}

- (float)exploreExploitModulator
{
  return self->_exploreExploitModulator;
}

- (void)setPriorMean:(float)a3
{
  self->_priorMean = a3;
}

- (void)setVarianceEpsilon:(float)a3
{
  self->_varianceEpsilon = a3;
}

- (float)simulationExploreExploitModulator
{
  return self->_simulationExploreExploitModulator;
}

- (RERelevanceEngineMetricsRecorder)metricsRecorder
{
  return self->_metricsRecorder;
}

- (NSString)metricsInteraction
{
  return self->_metricsInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsInteraction, 0);
  objc_storeStrong((id *)&self->_metricsRecorder, 0);
  objc_storeStrong((id *)&self->_predictionCache, 0);
}

- (void)saveModelToURL:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_2132F7000, a2, OS_LOG_TYPE_DEBUG, "Unable to save debug model: %@", (uint8_t *)&v2, 0xCu);
}

@end
