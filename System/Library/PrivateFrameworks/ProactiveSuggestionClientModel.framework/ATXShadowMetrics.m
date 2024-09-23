@implementation ATXShadowMetrics

- (double)precisionAtTop1CachedPrediction
{
  unint64_t numberOfCachedPredictions;
  unint64_t numberOfCorrectTop1CachedPrediction;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfCachedPredictions = self->_numberOfCachedPredictions;
  numberOfCorrectTop1CachedPrediction = self->_numberOfCorrectTop1CachedPrediction;
  if (numberOfCachedPredictions)
    return (double)numberOfCorrectTop1CachedPrediction / (double)numberOfCachedPredictions;
  v4 = 0.0;
  if (numberOfCorrectTop1CachedPrediction)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics precisionAtTop1CachedPrediction].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)precisionAtTop2CachedPredictions
{
  unint64_t numberOfCachedPredictions;
  unint64_t numberOfCorrectTop2CachedPredictions;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfCachedPredictions = self->_numberOfCachedPredictions;
  numberOfCorrectTop2CachedPredictions = self->_numberOfCorrectTop2CachedPredictions;
  if (numberOfCachedPredictions)
    return (double)numberOfCorrectTop2CachedPredictions / (double)numberOfCachedPredictions;
  v4 = 0.0;
  if (numberOfCorrectTop2CachedPredictions)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics precisionAtTop2CachedPredictions].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)precisionAtTop4CachedPredictions
{
  unint64_t numberOfCachedPredictions;
  unint64_t numberOfCorrectTop4CachedPredictions;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfCachedPredictions = self->_numberOfCachedPredictions;
  numberOfCorrectTop4CachedPredictions = self->_numberOfCorrectTop4CachedPredictions;
  if (numberOfCachedPredictions)
    return (double)numberOfCorrectTop4CachedPredictions / (double)numberOfCachedPredictions;
  v4 = 0.0;
  if (numberOfCorrectTop4CachedPredictions)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics precisionAtTop4CachedPredictions].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)precisionAtTop8CachedPredictions
{
  unint64_t numberOfCachedPredictions;
  unint64_t numberOfCorrectTop8CachedPredictions;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfCachedPredictions = self->_numberOfCachedPredictions;
  numberOfCorrectTop8CachedPredictions = self->_numberOfCorrectTop8CachedPredictions;
  if (numberOfCachedPredictions)
    return (double)numberOfCorrectTop8CachedPredictions / (double)numberOfCachedPredictions;
  v4 = 0.0;
  if (numberOfCorrectTop8CachedPredictions)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics precisionAtTop8CachedPredictions].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)precisionOfHighConfidenceCachedPredictions
{
  unint64_t numberOfCachedHighConfidencePredictions;
  unint64_t numberOfCorrectHighConfidenceCachedPredictions;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfCachedHighConfidencePredictions = self->_numberOfCachedHighConfidencePredictions;
  numberOfCorrectHighConfidenceCachedPredictions = self->_numberOfCorrectHighConfidenceCachedPredictions;
  if (numberOfCachedHighConfidencePredictions)
    return (double)numberOfCorrectHighConfidenceCachedPredictions / (double)numberOfCachedHighConfidencePredictions;
  v4 = 0.0;
  if (numberOfCorrectHighConfidenceCachedPredictions)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics precisionOfHighConfidenceCachedPredictions].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)precisionOfMediumConfidenceCachedPredictions
{
  unint64_t numberOfCachedMediumConfidencePredictions;
  unint64_t numberOfCorrectMediumConfidenceCachedPredictions;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfCachedMediumConfidencePredictions = self->_numberOfCachedMediumConfidencePredictions;
  numberOfCorrectMediumConfidenceCachedPredictions = self->_numberOfCorrectMediumConfidenceCachedPredictions;
  if (numberOfCachedMediumConfidencePredictions)
    return (double)numberOfCorrectMediumConfidenceCachedPredictions / (double)numberOfCachedMediumConfidencePredictions;
  v4 = 0.0;
  if (numberOfCorrectMediumConfidenceCachedPredictions)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics precisionOfMediumConfidenceCachedPredictions].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)precisionOfLowConfidenceCachedPredictions
{
  unint64_t numberOfCachedLowConfidencePredictions;
  unint64_t numberOfCorrectLowConfidenceCachedPredictions;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfCachedLowConfidencePredictions = self->_numberOfCachedLowConfidencePredictions;
  numberOfCorrectLowConfidenceCachedPredictions = self->_numberOfCorrectLowConfidenceCachedPredictions;
  if (numberOfCachedLowConfidencePredictions)
    return (double)numberOfCorrectLowConfidenceCachedPredictions / (double)numberOfCachedLowConfidencePredictions;
  v4 = 0.0;
  if (numberOfCorrectLowConfidenceCachedPredictions)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics precisionOfLowConfidenceCachedPredictions].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)precisionAllCachedPredictions
{
  unint64_t numberOfCorrectCachedPredictions;
  unint64_t numberOfCachedPredictions;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfCorrectCachedPredictions = self->_numberOfCorrectCachedPredictions;
  numberOfCachedPredictions = self->_numberOfCachedPredictions;
  if (numberOfCachedPredictions)
    return (double)numberOfCorrectCachedPredictions / (double)numberOfCachedPredictions;
  v4 = 0.0;
  if (numberOfCorrectCachedPredictions)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics precisionAllCachedPredictions].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)recallAtTop1CachedPrediction
{
  unint64_t numberOfShadowEvents;
  unint64_t numberOfShadowEventTop1CacheHits;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfShadowEvents = self->_numberOfShadowEvents;
  numberOfShadowEventTop1CacheHits = self->_numberOfShadowEventTop1CacheHits;
  if (numberOfShadowEvents)
    return (double)numberOfShadowEventTop1CacheHits / (double)numberOfShadowEvents;
  v4 = 0.0;
  if (numberOfShadowEventTop1CacheHits)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics recallAtTop1CachedPrediction].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)recallAtTop2CachedPredictions
{
  unint64_t numberOfShadowEvents;
  unint64_t numberOfShadowEventTop2CacheHits;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfShadowEvents = self->_numberOfShadowEvents;
  numberOfShadowEventTop2CacheHits = self->_numberOfShadowEventTop2CacheHits;
  if (numberOfShadowEvents)
    return (double)numberOfShadowEventTop2CacheHits / (double)numberOfShadowEvents;
  v4 = 0.0;
  if (numberOfShadowEventTop2CacheHits)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics recallAtTop2CachedPredictions].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)recallAtTop4CachedPredictions
{
  unint64_t numberOfShadowEvents;
  unint64_t numberOfShadowEventTop4CacheHits;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfShadowEvents = self->_numberOfShadowEvents;
  numberOfShadowEventTop4CacheHits = self->_numberOfShadowEventTop4CacheHits;
  if (numberOfShadowEvents)
    return (double)numberOfShadowEventTop4CacheHits / (double)numberOfShadowEvents;
  v4 = 0.0;
  if (numberOfShadowEventTop4CacheHits)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics recallAtTop4CachedPredictions].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)recallAtTop8CachedPredictions
{
  unint64_t numberOfShadowEvents;
  unint64_t numberOfShadowEventTop8CacheHits;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfShadowEvents = self->_numberOfShadowEvents;
  numberOfShadowEventTop8CacheHits = self->_numberOfShadowEventTop8CacheHits;
  if (numberOfShadowEvents)
    return (double)numberOfShadowEventTop8CacheHits / (double)numberOfShadowEvents;
  v4 = 0.0;
  if (numberOfShadowEventTop8CacheHits)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics recallAtTop8CachedPredictions].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)recallOfHighConfidenceCachedPredictions
{
  unint64_t numberOfShadowEvents;
  unint64_t numberOfShadowEventHighConfidenceCacheHits;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfShadowEvents = self->_numberOfShadowEvents;
  numberOfShadowEventHighConfidenceCacheHits = self->_numberOfShadowEventHighConfidenceCacheHits;
  if (numberOfShadowEvents)
    return (double)numberOfShadowEventHighConfidenceCacheHits / (double)numberOfShadowEvents;
  v4 = 0.0;
  if (numberOfShadowEventHighConfidenceCacheHits)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics recallOfHighConfidenceCachedPredictions].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)recallOfMediumConfidenceCachedPredictions
{
  unint64_t numberOfShadowEvents;
  unint64_t numberOfShadowEventMediumConfidenceCacheHits;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfShadowEvents = self->_numberOfShadowEvents;
  numberOfShadowEventMediumConfidenceCacheHits = self->_numberOfShadowEventMediumConfidenceCacheHits;
  if (numberOfShadowEvents)
    return (double)numberOfShadowEventMediumConfidenceCacheHits / (double)numberOfShadowEvents;
  v4 = 0.0;
  if (numberOfShadowEventMediumConfidenceCacheHits)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics recallOfMediumConfidenceCachedPredictions].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)recallOfLowConfidenceCachedPredictions
{
  unint64_t numberOfShadowEvents;
  unint64_t numberOfShadowEventLowConfidenceCacheHits;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfShadowEvents = self->_numberOfShadowEvents;
  numberOfShadowEventLowConfidenceCacheHits = self->_numberOfShadowEventLowConfidenceCacheHits;
  if (numberOfShadowEvents)
    return (double)numberOfShadowEventLowConfidenceCacheHits / (double)numberOfShadowEvents;
  v4 = 0.0;
  if (numberOfShadowEventLowConfidenceCacheHits)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics recallOfLowConfidenceCachedPredictions].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)recallAllCachedPredictions
{
  unint64_t numberOfShadowEventCacheHits;
  unint64_t numberOfShadowEvents;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfShadowEventCacheHits = self->_numberOfShadowEventCacheHits;
  numberOfShadowEvents = self->_numberOfShadowEvents;
  if (numberOfShadowEvents)
    return (double)numberOfShadowEventCacheHits / (double)numberOfShadowEvents;
  v4 = 0.0;
  if (numberOfShadowEventCacheHits)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics recallAllCachedPredictions].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (double)meanReciprocalRank
{
  unint64_t numberOfShadowEventCacheHits;
  double sumOfShadowEventCacheHitReciprocalRanks;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  numberOfShadowEventCacheHits = self->_numberOfShadowEventCacheHits;
  sumOfShadowEventCacheHitReciprocalRanks = self->_sumOfShadowEventCacheHitReciprocalRanks;
  if (numberOfShadowEventCacheHits)
    return sumOfShadowEventCacheHitReciprocalRanks / (double)numberOfShadowEventCacheHits;
  v4 = 0.0;
  if (sumOfShadowEventCacheHitReciprocalRanks != 0.0)
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXShadowMetrics meanReciprocalRank].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (id)asCoreAnalyticsMessageWithModelId:(id)a3 executableType:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v20;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[25];
  _QWORD v52[27];

  v52[25] = *MEMORY[0x1E0C80C00];
  v52[0] = a3;
  v51[0] = CFSTR("modelID");
  v51[1] = CFSTR("executableType");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v45 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v50;
  v51[2] = CFSTR("cacheHitMRR");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics meanReciprocalRank](self, "meanReciprocalRank");
  objc_msgSend(v7, "numberWithDouble:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v49;
  v51[3] = CFSTR("numEvent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXShadowMetrics numberOfShadowEvents](self, "numberOfShadowEvents"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v48;
  v51[4] = CFSTR("numPrediction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXShadowMetrics numberOfCachedPredictions](self, "numberOfCachedPredictions"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v47;
  v51[5] = CFSTR("numPredictionHConf");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXShadowMetrics numberOfCachedHighConfidencePredictions](self, "numberOfCachedHighConfidencePredictions"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v46;
  v51[6] = CFSTR("numPredictionLConf");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXShadowMetrics numberOfCachedLowConfidencePredictions](self, "numberOfCachedLowConfidencePredictions"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v44;
  v51[7] = CFSTR("numPredictionMConf");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXShadowMetrics numberOfCachedMediumConfidencePredictions](self, "numberOfCachedMediumConfidencePredictions"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v43;
  v51[8] = CFSTR("numRefresh");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXShadowMetrics numberOfPredictionCacheRefreshes](self, "numberOfPredictionCacheRefreshes"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[8] = v42;
  v51[9] = CFSTR("precisionAll");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics precisionAllCachedPredictions](self, "precisionAllCachedPredictions");
  objc_msgSend(v8, "numberWithDouble:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v52[9] = v41;
  v51[10] = CFSTR("precisionAt1");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics precisionAtTop1CachedPrediction](self, "precisionAtTop1CachedPrediction");
  objc_msgSend(v9, "numberWithDouble:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52[10] = v40;
  v51[11] = CFSTR("precisionAt2");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics precisionAtTop2CachedPredictions](self, "precisionAtTop2CachedPredictions");
  objc_msgSend(v10, "numberWithDouble:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v52[11] = v39;
  v51[12] = CFSTR("precisionAt4");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics precisionAtTop4CachedPredictions](self, "precisionAtTop4CachedPredictions");
  objc_msgSend(v11, "numberWithDouble:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52[12] = v38;
  v51[13] = CFSTR("precisionAt8");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics precisionAtTop8CachedPredictions](self, "precisionAtTop8CachedPredictions");
  objc_msgSend(v12, "numberWithDouble:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v52[13] = v37;
  v51[14] = CFSTR("precisionHConf");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics precisionOfHighConfidenceCachedPredictions](self, "precisionOfHighConfidenceCachedPredictions");
  objc_msgSend(v13, "numberWithDouble:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[14] = v36;
  v51[15] = CFSTR("precisionLConf");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics precisionOfLowConfidenceCachedPredictions](self, "precisionOfLowConfidenceCachedPredictions");
  objc_msgSend(v14, "numberWithDouble:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v52[15] = v35;
  v51[16] = CFSTR("precisionMConf");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics precisionOfMediumConfidenceCachedPredictions](self, "precisionOfMediumConfidenceCachedPredictions");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52[16] = v16;
  v51[17] = CFSTR("recallAll");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics recallAllCachedPredictions](self, "recallAllCachedPredictions");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52[17] = v18;
  v51[18] = CFSTR("recallAt1");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics recallAtTop1CachedPrediction](self, "recallAtTop1CachedPrediction");
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52[18] = v20;
  v51[19] = CFSTR("recallAt2");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics recallAtTop2CachedPredictions](self, "recallAtTop2CachedPredictions");
  objc_msgSend(v21, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52[19] = v22;
  v51[20] = CFSTR("recallAt4");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics recallAtTop4CachedPredictions](self, "recallAtTop4CachedPredictions");
  objc_msgSend(v23, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52[20] = v24;
  v51[21] = CFSTR("recallAt8");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics recallAtTop8CachedPredictions](self, "recallAtTop8CachedPredictions");
  objc_msgSend(v25, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52[21] = v26;
  v51[22] = CFSTR("recallHConf");
  v27 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics recallOfHighConfidenceCachedPredictions](self, "recallOfHighConfidenceCachedPredictions");
  objc_msgSend(v27, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v52[22] = v28;
  v51[23] = CFSTR("recallLConf");
  v29 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics recallOfLowConfidenceCachedPredictions](self, "recallOfLowConfidenceCachedPredictions");
  objc_msgSend(v29, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v52[23] = v30;
  v51[24] = CFSTR("recallMConf");
  v31 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXShadowMetrics recallOfMediumConfidenceCachedPredictions](self, "recallOfMediumConfidenceCachedPredictions");
  objc_msgSend(v31, "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v52[24] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 25);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  ATXShadowMetrics *v4;
  ATXShadowMetrics *v5;
  BOOL v6;

  v4 = (ATXShadowMetrics *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXShadowMetrics isEqualToATXShadowMetrics:](self, "isEqualToATXShadowMetrics:", v5);

  return v6;
}

- (BOOL)isEqualToATXShadowMetrics:(id)a3
{
  char *v4;
  BOOL v5;

  v4 = (char *)a3;
  v5 = *(_OWORD *)&self->_numberOfCorrectTop1CachedPrediction == *(_OWORD *)(v4 + 8)
    && self->_numberOfCorrectTop4CachedPredictions == *((_QWORD *)v4 + 3)
    && self->_numberOfCorrectTop8CachedPredictions == *((_QWORD *)v4 + 4)
    && self->_numberOfCorrectHighConfidenceCachedPredictions == *((_QWORD *)v4 + 5)
    && self->_numberOfCorrectMediumConfidenceCachedPredictions == *((_QWORD *)v4 + 6)
    && self->_numberOfCorrectLowConfidenceCachedPredictions == *((_QWORD *)v4 + 7)
    && self->_numberOfCorrectCachedPredictions == *((_QWORD *)v4 + 8)
    && self->_numberOfCachedPredictions == *((_QWORD *)v4 + 9)
    && self->_numberOfCachedHighConfidencePredictions == *((_QWORD *)v4 + 10)
    && self->_numberOfCachedMediumConfidencePredictions == *((_QWORD *)v4 + 11)
    && self->_numberOfCachedLowConfidencePredictions == *((_QWORD *)v4 + 12)
    && self->_numberOfShadowEventTop1CacheHits == *((_QWORD *)v4 + 13)
    && self->_numberOfShadowEventTop2CacheHits == *((_QWORD *)v4 + 14)
    && self->_numberOfShadowEventTop4CacheHits == *((_QWORD *)v4 + 15)
    && self->_numberOfShadowEventTop8CacheHits == *((_QWORD *)v4 + 16)
    && self->_numberOfShadowEventHighConfidenceCacheHits == *((_QWORD *)v4 + 17)
    && self->_numberOfShadowEventMediumConfidenceCacheHits == *((_QWORD *)v4 + 18)
    && self->_numberOfShadowEventLowConfidenceCacheHits == *((_QWORD *)v4 + 19)
    && self->_numberOfShadowEventCacheHits == *((_QWORD *)v4 + 20)
    && self->_numberOfShadowEvents == *((_QWORD *)v4 + 21)
    && self->_numberOfPredictionCacheRefreshes == *((_QWORD *)v4 + 22)
    && self->_sumOfShadowEventCacheHitReciprocalRanks == *((double *)v4 + 23);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;

  v2 = self->_numberOfCorrectTop2CachedPredictions
     - self->_numberOfCorrectTop1CachedPrediction
     + 32 * self->_numberOfCorrectTop1CachedPrediction;
  v3 = self->_numberOfCorrectTop4CachedPredictions - v2 + 32 * v2;
  v4 = self->_numberOfCorrectTop8CachedPredictions - v3 + 32 * v3;
  v5 = self->_numberOfCorrectHighConfidenceCachedPredictions - v4 + 32 * v4;
  v6 = self->_numberOfCorrectMediumConfidenceCachedPredictions - v5 + 32 * v5;
  v7 = self->_numberOfCorrectLowConfidenceCachedPredictions - v6 + 32 * v6;
  v8 = self->_numberOfCorrectCachedPredictions - v7 + 32 * v7;
  v9 = self->_numberOfCachedPredictions - v8 + 32 * v8;
  v10 = self->_numberOfCachedHighConfidencePredictions - v9 + 32 * v9;
  v11 = self->_numberOfCachedMediumConfidencePredictions - v10 + 32 * v10;
  v12 = self->_numberOfCachedLowConfidencePredictions - v11 + 32 * v11;
  v13 = self->_numberOfShadowEventTop1CacheHits - v12 + 32 * v12;
  v14 = self->_numberOfShadowEventTop2CacheHits - v13 + 32 * v13;
  v15 = self->_numberOfShadowEventTop4CacheHits - v14 + 32 * v14;
  v16 = self->_numberOfShadowEventTop8CacheHits - v15 + 32 * v15;
  v17 = self->_numberOfShadowEventHighConfidenceCacheHits - v16 + 32 * v16;
  v18 = self->_numberOfShadowEventMediumConfidenceCacheHits - v17 + 32 * v17;
  v19 = self->_numberOfShadowEventLowConfidenceCacheHits - v18 + 32 * v18;
  v20 = self->_numberOfShadowEventCacheHits - v19 + 32 * v19;
  v21 = self->_numberOfShadowEvents - v20 + 32 * v20;
  v22 = self->_numberOfPredictionCacheRefreshes - v21 + 32 * v21;
  return (unint64_t)self->_sumOfShadowEventCacheHitReciprocalRanks - v22 + 32 * v22;
}

- (unint64_t)numberOfCorrectTop1CachedPrediction
{
  return self->_numberOfCorrectTop1CachedPrediction;
}

- (void)setNumberOfCorrectTop1CachedPrediction:(unint64_t)a3
{
  self->_numberOfCorrectTop1CachedPrediction = a3;
}

- (unint64_t)numberOfCorrectTop2CachedPredictions
{
  return self->_numberOfCorrectTop2CachedPredictions;
}

- (void)setNumberOfCorrectTop2CachedPredictions:(unint64_t)a3
{
  self->_numberOfCorrectTop2CachedPredictions = a3;
}

- (unint64_t)numberOfCorrectTop4CachedPredictions
{
  return self->_numberOfCorrectTop4CachedPredictions;
}

- (void)setNumberOfCorrectTop4CachedPredictions:(unint64_t)a3
{
  self->_numberOfCorrectTop4CachedPredictions = a3;
}

- (unint64_t)numberOfCorrectTop8CachedPredictions
{
  return self->_numberOfCorrectTop8CachedPredictions;
}

- (void)setNumberOfCorrectTop8CachedPredictions:(unint64_t)a3
{
  self->_numberOfCorrectTop8CachedPredictions = a3;
}

- (unint64_t)numberOfCorrectHighConfidenceCachedPredictions
{
  return self->_numberOfCorrectHighConfidenceCachedPredictions;
}

- (void)setNumberOfCorrectHighConfidenceCachedPredictions:(unint64_t)a3
{
  self->_numberOfCorrectHighConfidenceCachedPredictions = a3;
}

- (unint64_t)numberOfCorrectMediumConfidenceCachedPredictions
{
  return self->_numberOfCorrectMediumConfidenceCachedPredictions;
}

- (void)setNumberOfCorrectMediumConfidenceCachedPredictions:(unint64_t)a3
{
  self->_numberOfCorrectMediumConfidenceCachedPredictions = a3;
}

- (unint64_t)numberOfCorrectLowConfidenceCachedPredictions
{
  return self->_numberOfCorrectLowConfidenceCachedPredictions;
}

- (void)setNumberOfCorrectLowConfidenceCachedPredictions:(unint64_t)a3
{
  self->_numberOfCorrectLowConfidenceCachedPredictions = a3;
}

- (unint64_t)numberOfCorrectCachedPredictions
{
  return self->_numberOfCorrectCachedPredictions;
}

- (void)setNumberOfCorrectCachedPredictions:(unint64_t)a3
{
  self->_numberOfCorrectCachedPredictions = a3;
}

- (unint64_t)numberOfCachedPredictions
{
  return self->_numberOfCachedPredictions;
}

- (void)setNumberOfCachedPredictions:(unint64_t)a3
{
  self->_numberOfCachedPredictions = a3;
}

- (unint64_t)numberOfCachedHighConfidencePredictions
{
  return self->_numberOfCachedHighConfidencePredictions;
}

- (void)setNumberOfCachedHighConfidencePredictions:(unint64_t)a3
{
  self->_numberOfCachedHighConfidencePredictions = a3;
}

- (unint64_t)numberOfCachedMediumConfidencePredictions
{
  return self->_numberOfCachedMediumConfidencePredictions;
}

- (void)setNumberOfCachedMediumConfidencePredictions:(unint64_t)a3
{
  self->_numberOfCachedMediumConfidencePredictions = a3;
}

- (unint64_t)numberOfCachedLowConfidencePredictions
{
  return self->_numberOfCachedLowConfidencePredictions;
}

- (void)setNumberOfCachedLowConfidencePredictions:(unint64_t)a3
{
  self->_numberOfCachedLowConfidencePredictions = a3;
}

- (unint64_t)numberOfShadowEventTop1CacheHits
{
  return self->_numberOfShadowEventTop1CacheHits;
}

- (void)setNumberOfShadowEventTop1CacheHits:(unint64_t)a3
{
  self->_numberOfShadowEventTop1CacheHits = a3;
}

- (unint64_t)numberOfShadowEventTop2CacheHits
{
  return self->_numberOfShadowEventTop2CacheHits;
}

- (void)setNumberOfShadowEventTop2CacheHits:(unint64_t)a3
{
  self->_numberOfShadowEventTop2CacheHits = a3;
}

- (unint64_t)numberOfShadowEventTop4CacheHits
{
  return self->_numberOfShadowEventTop4CacheHits;
}

- (void)setNumberOfShadowEventTop4CacheHits:(unint64_t)a3
{
  self->_numberOfShadowEventTop4CacheHits = a3;
}

- (unint64_t)numberOfShadowEventTop8CacheHits
{
  return self->_numberOfShadowEventTop8CacheHits;
}

- (void)setNumberOfShadowEventTop8CacheHits:(unint64_t)a3
{
  self->_numberOfShadowEventTop8CacheHits = a3;
}

- (unint64_t)numberOfShadowEventHighConfidenceCacheHits
{
  return self->_numberOfShadowEventHighConfidenceCacheHits;
}

- (void)setNumberOfShadowEventHighConfidenceCacheHits:(unint64_t)a3
{
  self->_numberOfShadowEventHighConfidenceCacheHits = a3;
}

- (unint64_t)numberOfShadowEventMediumConfidenceCacheHits
{
  return self->_numberOfShadowEventMediumConfidenceCacheHits;
}

- (void)setNumberOfShadowEventMediumConfidenceCacheHits:(unint64_t)a3
{
  self->_numberOfShadowEventMediumConfidenceCacheHits = a3;
}

- (unint64_t)numberOfShadowEventLowConfidenceCacheHits
{
  return self->_numberOfShadowEventLowConfidenceCacheHits;
}

- (void)setNumberOfShadowEventLowConfidenceCacheHits:(unint64_t)a3
{
  self->_numberOfShadowEventLowConfidenceCacheHits = a3;
}

- (unint64_t)numberOfShadowEventCacheHits
{
  return self->_numberOfShadowEventCacheHits;
}

- (void)setNumberOfShadowEventCacheHits:(unint64_t)a3
{
  self->_numberOfShadowEventCacheHits = a3;
}

- (unint64_t)numberOfShadowEvents
{
  return self->_numberOfShadowEvents;
}

- (void)setNumberOfShadowEvents:(unint64_t)a3
{
  self->_numberOfShadowEvents = a3;
}

- (unint64_t)numberOfPredictionCacheRefreshes
{
  return self->_numberOfPredictionCacheRefreshes;
}

- (void)setNumberOfPredictionCacheRefreshes:(unint64_t)a3
{
  self->_numberOfPredictionCacheRefreshes = a3;
}

- (double)sumOfShadowEventCacheHitReciprocalRanks
{
  return self->_sumOfShadowEventCacheHitReciprocalRanks;
}

- (void)setSumOfShadowEventCacheHitReciprocalRanks:(double)a3
{
  self->_sumOfShadowEventCacheHitReciprocalRanks = a3;
}

- (void)precisionAtTop1CachedPrediction
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfCorrectTop1CachedPrediction != 0 while _numberOfCachedPredictions == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)precisionAtTop2CachedPredictions
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfCorrectTop2CachedPrediction != 0 while _numberOfCachedPredictions == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)precisionAtTop4CachedPredictions
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfCorrectTop4CachedPrediction != 0 while _numberOfCachedPredictions == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)precisionAtTop8CachedPredictions
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfCorrectTop8CachedPrediction != 0 while _numberOfCachedPredictions == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)precisionOfHighConfidenceCachedPredictions
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfCorrectHighConfidenceCachedPredictions != 0 while _numberOfCachedHighConfidencePredictions == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)precisionOfMediumConfidenceCachedPredictions
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfCorrectMediumConfidenceCachedPredictions != 0 while _numberOfCachedMediumConfidencePredictions == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)precisionOfLowConfidenceCachedPredictions
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfCorrectLowConfidenceCachedPredictions != 0 while _numberOfCachedLowConfidencePredictions == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)precisionAllCachedPredictions
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfCorrectCachedPrediction != 0 while _numberOfCachedPredictions == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)recallAtTop1CachedPrediction
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfShadowEventTop1CacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)recallAtTop2CachedPredictions
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfShadowEventTop2CacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)recallAtTop4CachedPredictions
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfShadowEventTop4CacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)recallAtTop8CachedPredictions
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfShadowEventTop8CacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)recallOfHighConfidenceCachedPredictions
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfShadowEventHighConfidenceCacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)recallOfMediumConfidenceCachedPredictions
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfShadowEventMediumConfidenceCacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)recallOfLowConfidenceCachedPredictions
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfShadowEventLowConfidenceCacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)recallAllCachedPredictions
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _numberOfShadowEventCacheHits != 0 while _numberOfShadowEvents == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)meanReciprocalRank
{
  OUTLINED_FUNCTION_0_0(&dword_1AA841000, a1, a3, "%s: _sumOfShadowEventCacheHitReciprocalRanks != 0 while _numberOfShadowEventCacheHits == 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
