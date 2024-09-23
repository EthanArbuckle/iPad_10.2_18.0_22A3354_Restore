@implementation _LTLanguageDetector

- (_LTLanguageDetector)initWithSelfLoggingManager:(id)a3
{
  id v5;
  _LTLanguageDetector *v6;
  _LTLanguageDetector *v7;
  NSMutableArray *v8;
  NSMutableArray *acousticResults;
  _LTLanguageDetectionResult *lastResult;
  NSMutableDictionary *partialSpeechResultConfidences;
  NSMutableDictionary *finalSpeechResults;
  NSMutableDictionary *modelVersions;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *resultQueue;
  dispatch_queue_t v17;
  OS_dispatch_queue *finalResultWaitQueue;
  _LTOfflineAssetManager *v19;
  void *v20;
  id v21;
  NSObject *v22;
  _LTLanguageDetector *v23;
  void *v24;
  objc_class *v25;
  id v26;
  void *v27;
  uint64_t v28;
  CSLanguageDetector *csLanguageDetector;
  _LTLanguageDetectorFeatureCombinationModel *v30;
  void *v31;
  uint64_t v32;
  _LTLanguageDetectorFeatureCombinationModel *featureCombinationModel;
  id v34;
  void *v35;
  uint64_t v36;
  NSSet *lowConfidenceLanguagePairs;
  id v39;
  objc_super v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)_LTLanguageDetector;
  v6 = -[_LTLanguageDetector init](&v40, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_samplingRate = 16000.0;
    v6->_audioBitDepth = 2;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    acousticResults = v7->_acousticResults;
    v7->_acousticResults = v8;

    lastResult = v7->_lastResult;
    v7->_lastResult = 0;

    v7->_havePartialASRConfidences = 0;
    *(_DWORD *)&v7->_endAudioCalled = 0;
    partialSpeechResultConfidences = v7->_partialSpeechResultConfidences;
    v7->_partialSpeechResultConfidences = 0;

    finalSpeechResults = v7->_finalSpeechResults;
    v7->_finalSpeechResults = 0;

    modelVersions = v7->_modelVersions;
    v7->_modelVersions = 0;

    v7->_minimumAcousticLanguageDetectorResults = _LTPreferencesMinimumAcousticLanguageDetectionResults();
    v7->_maximumAcousticLanguageDetectorResults = _LTPreferencesMaximumAcousticLanguageDetectionResults();
    v14 = _LTOSLogLID();
    v7->_lidSignpostID = os_signpost_id_generate(v14);
    v15 = dispatch_queue_create("com.apple.translation.lid.result", 0);
    resultQueue = v7->_resultQueue;
    v7->_resultQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_create("com.apple.translation.lid.finalResult", 0);
    finalResultWaitQueue = v7->_finalResultWaitQueue;
    v7->_finalResultWaitQueue = (OS_dispatch_queue *)v17;

    v19 = objc_alloc_init(_LTOfflineAssetManager);
    v39 = 0;
    -[_LTOfflineAssetManager languageDetectorAssetWithError:](v19, "languageDetectorAssetWithError:", &v39);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v39;
    if (v21)
    {
      v22 = _LTOSLogLID();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[_LTLanguageDetector initWithSelfLoggingManager:].cold.1();
      v23 = 0;
    }
    else
    {
      v42 = 0;
      v43 = &v42;
      v44 = 0x2050000000;
      v24 = (void *)getCSLanguageDetectorClass_softClass;
      v45 = getCSLanguageDetectorClass_softClass;
      if (!getCSLanguageDetectorClass_softClass)
      {
        v41[0] = MEMORY[0x24BDAC760];
        v41[1] = 3221225472;
        v41[2] = __getCSLanguageDetectorClass_block_invoke;
        v41[3] = &unk_251A120D0;
        v41[4] = &v42;
        __getCSLanguageDetectorClass_block_invoke((uint64_t)v41);
        v24 = (void *)v43[3];
      }
      v25 = objc_retainAutorelease(v24);
      _Block_object_dispose(&v42, 8);
      v26 = [v25 alloc];
      objc_msgSend(v20, "languageDetectorModelURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "initWithModelURL:", v27);
      csLanguageDetector = v7->_csLanguageDetector;
      v7->_csLanguageDetector = (CSLanguageDetector *)v28;

      -[CSLanguageDetector setDelegate:](v7->_csLanguageDetector, "setDelegate:", v7);
      v30 = [_LTLanguageDetectorFeatureCombinationModel alloc];
      objc_msgSend(v20, "featureCombinationConfigUrl");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[_LTLanguageDetectorFeatureCombinationModel initWithConfig:](v30, "initWithConfig:", v31);
      featureCombinationModel = v7->_featureCombinationModel;
      v7->_featureCombinationModel = (_LTLanguageDetectorFeatureCombinationModel *)v32;

      v7->_featureCombinationModelSupported = 0;
      objc_storeStrong((id *)&v7->_selfLoggingManager, a3);
      v34 = objc_alloc(MEMORY[0x24BDBCF20]);
      _LTPreferencesGetLanguageDetectorUnsupportedPairs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "initWithArray:", v35);
      lowConfidenceLanguagePairs = v7->_lowConfidenceLanguagePairs;
      v7->_lowConfidenceLanguagePairs = (NSSet *)v36;

      v23 = v7;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)startLanguageDetectionWithContext:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  NSMutableArray *v9;
  NSMutableArray *acousticResults;
  _LTLanguageDetectionResult *lastResult;
  NSMutableDictionary *v12;
  NSMutableDictionary *partialSpeechResultConfidences;
  id v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  id v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *finalSpeechResults;
  NSMutableDictionary *v24;
  NSMutableDictionary *modelVersions;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t lidSignpostID;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  double sourceLocaleConfidenceThreshold;
  double targetLocaleConfidenceThreshold;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  id v47;
  double samplingRate;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE buf[24];
  void *v56;
  uint64_t *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_context, a3);
  objc_storeWeak((id *)&self->_delegate, v8);
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  acousticResults = self->_acousticResults;
  self->_acousticResults = v9;

  lastResult = self->_lastResult;
  self->_lastResult = 0;

  self->_havePartialASRConfidences = 0;
  *(_DWORD *)&self->_endAudioCalled = 0;
  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  partialSpeechResultConfidences = self->_partialSpeechResultConfidences;
  self->_partialSpeechResultConfidences = v12;

  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = self->_partialSpeechResultConfidences;
  objc_msgSend(v7, "localePair");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sourceLocale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v14, v17);

  v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = self->_partialSpeechResultConfidences;
  objc_msgSend(v7, "localePair");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "targetLocale");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v18, v21);

  v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  finalSpeechResults = self->_finalSpeechResults;
  self->_finalSpeechResults = v22;

  v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  modelVersions = self->_modelVersions;
  self->_modelVersions = v24;

  if (objc_msgSend(v7, "autodetectLanguage"))
  {
    _LTOSLogLID();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    lidSignpostID = self->_lidSignpostID;
    if (lidSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2491B9000, v27, OS_SIGNPOST_INTERVAL_BEGIN, lidSignpostID, "LID", "Start", buf, 2u);
    }

    if (objc_msgSend(v7, "lidThreshold") < 0)
    {
      objc_msgSend(v7, "localePair");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      self->_sourceLocaleConfidenceThreshold = _LTPreferencesLanguageDetectorThresholdsForLocale(v32);

      objc_msgSend(v7, "localePair");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "reversedPair");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      self->_targetLocaleConfidenceThreshold = _LTPreferencesLanguageDetectorThresholdsForLocale(v34);

      v35 = _LTOSLogLID();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        sourceLocaleConfidenceThreshold = self->_sourceLocaleConfidenceThreshold;
        targetLocaleConfidenceThreshold = self->_targetLocaleConfidenceThreshold;
        *(_DWORD *)buf = 134218240;
        *(double *)&buf[4] = sourceLocaleConfidenceThreshold;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = targetLocaleConfidenceThreshold;
        _os_log_impl(&dword_2491B9000, v35, OS_LOG_TYPE_INFO, "Confidence thresholds for source %f and target %f", buf, 0x16u);
      }
      if ((float)(self->_sourceLocaleConfidenceThreshold + self->_targetLocaleConfidenceThreshold) <= 1.0)
      {
        v38 = _LTOSLogLID();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          -[_LTLanguageDetector startLanguageDetectionWithContext:delegate:].cold.1();
      }
    }
    else
    {
      v29 = _LTOSLogLID();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = v29;
        v31 = objc_msgSend(v7, "lidThreshold");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v31;
        _os_log_impl(&dword_2491B9000, v30, OS_LOG_TYPE_INFO, "Overriding confidence thresholds, setting to %ld", buf, 0xCu);

      }
      self->_sourceLocaleConfidenceThreshold = (float)objc_msgSend(v7, "lidThreshold") / 1000.0;
      self->_targetLocaleConfidenceThreshold = (float)objc_msgSend(v7, "lidThreshold") / 1000.0;
    }
    objc_msgSend(v7, "localePair");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "sourceLocale");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_ltCsLocaleIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "localePair");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "targetLocale");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_ltCsLocaleIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = 0;
    v52 = &v51;
    v53 = 0x2050000000;
    v45 = (void *)getCSLanguageDetectorOptionClass_softClass;
    v54 = getCSLanguageDetectorOptionClass_softClass;
    if (!getCSLanguageDetectorOptionClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getCSLanguageDetectorOptionClass_block_invoke;
      v56 = &unk_251A120D0;
      v57 = &v51;
      __getCSLanguageDetectorOptionClass_block_invoke((uint64_t)buf);
      v45 = (void *)v52[3];
    }
    v46 = objc_retainAutorelease(v45);
    _Block_object_dispose(&v51, 8);
    v47 = objc_alloc_init(v46);
    samplingRate = self->_samplingRate;
    *(float *)&samplingRate = samplingRate;
    objc_msgSend(v47, "setSamplingRate:", samplingRate);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v41, v44, 0, v51);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setDictationLanguages:", v49);

    -[CSLanguageDetector resetForNewRequest:](self->_csLanguageDetector, "resetForNewRequest:", v47);
    if (self->_featureCombinationModel)
    {
      objc_msgSend(v7, "localePair");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      self->_featureCombinationModelSupported = _LTPreferencesLanguageDetectorFeatureCombinationModelSupportedForLocale(v50);

    }
    else
    {
      self->_featureCombinationModelSupported = 0;
    }

  }
}

- (void)sendLIDResult:(id)a3
{
  id v4;
  _LTSpeechTranslationDelegate **p_delegate;
  id WeakRetained;
  char v7;
  NSObject *v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  if (!self->_finalLIDResultSent)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      self->_finalLIDResultSent = objc_msgSend(v4, "isFinal");
      v8 = _LTOSLogLID();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = v8;
        if (objc_msgSend(v4, "isFinal"))
          v10 = CFSTR("final");
        else
          v10 = CFSTR("intermediate");
        objc_msgSend(v4, "dominantLanguage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_ltLocaleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543874;
        v15 = v10;
        v16 = 2114;
        v17 = v12;
        v18 = 1024;
        v19 = objc_msgSend(v4, "isConfident");
        _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_INFO, "Sending out new %{public}@ LID result, detected %{public}@, confident %{BOOL}i", (uint8_t *)&v14, 0x1Cu);

      }
      v13 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v13, "languageDetectionResult:", v4);

    }
  }

}

- (BOOL)haveFinalASRResults
{
  NSMutableDictionary *finalSpeechResults;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  finalSpeechResults = self->_finalSpeechResults;
  -[_LTTranslationContext localePair](self->_context, "localePair");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](finalSpeechResults, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_finalSpeechResults;
  -[_LTTranslationContext localePair](self->_context, "localePair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "targetLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v7, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v11 = v10 == 0;
  else
    v11 = 1;
  v12 = !v11;

  return v12;
}

- (BOOL)haveAtLeastOneFinalASRResult
{
  NSMutableDictionary *finalSpeechResults;
  void *v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  finalSpeechResults = self->_finalSpeechResults;
  -[_LTTranslationContext localePair](self->_context, "localePair");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](finalSpeechResults, "objectForKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = self->_finalSpeechResults;
  -[_LTTranslationContext localePair](self->_context, "localePair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "targetLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v7, "objectForKey:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  return (v6 | v10) != 0;
}

- (void)sendFinalLanguageDetectionResult:(BOOL)a3
{
  _BOOL4 v3;
  _LTLanguageDetectionResult *lastResult;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  NSObject *v10;
  NSMutableArray *acousticResults;
  NSObject *v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  _LTLanguageDetectorFeatureCombinationModel *featureCombinationModel;
  _LTTranslationContext *context;
  NSMutableArray *v18;
  NSMutableDictionary *partialSpeechResultConfidences;
  NSMutableDictionary *finalSpeechResults;
  NSMutableDictionary *modelVersions;
  _BOOL8 useFinalThresholds;
  _LTLanguageDetectionResult *v23;
  _LTLanguageDetectionResult *v24;
  _LTLanguageDetectionResult *v25;
  int v26;
  int v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v3 = a3;
  v35 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  if (self->_finalLIDResultSent)
    return;
  lastResult = self->_lastResult;
  self->_lastResult = 0;

  v6 = -[_LTLanguageDetector haveFinalASRResults](self, "haveFinalASRResults");
  v7 = -[_LTLanguageDetector haveAtLeastOneFinalASRResult](self, "haveAtLeastOneFinalASRResult");
  if (self->_havePartialASRConfidences)
  {
    v8 = v7;
    v9 = -[NSMutableArray count](self->_acousticResults, "count") >= self->_minimumAcousticLanguageDetectorResults || v8;
    if (!((self->_endAudioCalled || v6) | v9))
      return;
  }
  else if (!v6)
  {
    return;
  }
  self->_useFinalThresholds |= (v6 || v3) | (-[NSMutableArray count](self->_acousticResults, "count") >= self->_maximumAcousticLanguageDetectorResults);
  v10 = _LTOSLogLID();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    acousticResults = self->_acousticResults;
    v12 = v10;
    v13 = -[NSMutableArray count](acousticResults, "count");
    v14 = CFSTR(", partial ASR confidences");
    if (!self->_havePartialASRConfidences)
      v14 = &stru_251A15610;
    *(_DWORD *)buf = 134218498;
    v30 = v13;
    v31 = 2114;
    v32 = v14;
    if (v6)
      v15 = CFSTR(", final ASR results");
    else
      v15 = &stru_251A15610;
    v33 = 2114;
    v34 = v15;
    _os_log_impl(&dword_2491B9000, v12, OS_LOG_TYPE_INFO, "Computing new LID result, with %zu acoustic results%{public}@%{public}@", buf, 0x20u);

  }
  featureCombinationModel = self->_featureCombinationModel;
  context = self->_context;
  v18 = self->_acousticResults;
  partialSpeechResultConfidences = self->_partialSpeechResultConfidences;
  finalSpeechResults = self->_finalSpeechResults;
  modelVersions = self->_modelVersions;
  useFinalThresholds = self->_useFinalThresholds;
  LOBYTE(v28) = -[_LTLanguageDetector isLowConfidencePair](self, "isLowConfidencePair");
  -[_LTLanguageDetectorFeatureCombinationModel estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:](featureCombinationModel, "estimateLanguage:languageDetectionResults:partialSpeechResultConfidences:finalSpeechResults:modelVersions:useFinalThresholds:isLowConfidencePair:", context, v18, partialSpeechResultConfidences, finalSpeechResults, modelVersions, useFinalThresholds, v28);
  v23 = (_LTLanguageDetectionResult *)objc_claimAutoreleasedReturnValue();
  v24 = self->_lastResult;
  self->_lastResult = v23;

  v25 = self->_lastResult;
  if (v25)
  {
    if (self->_havePartialASRConfidences)
    {
      v26 = -[_LTLanguageDetectionResult isConfident](v25, "isConfident");
      if (-[NSMutableArray count](self->_acousticResults, "count") >= self->_maximumAcousticLanguageDetectorResults)
        v27 = 1;
      else
        v27 = v26;
      if (((v6 | v27) & 1) == 0 && !v3)
        return;
      v25 = self->_lastResult;
    }
    else if (!v6)
    {
      return;
    }
    -[_LTLanguageDetectionResult setIsFinal:](v25, "setIsFinal:", 1);
    -[_LTLanguageDetector sendLIDResult:](self, "sendLIDResult:", self->_lastResult);
    -[_LTLanguageDetector endAudio](self, "endAudio");
  }
}

- (void)addSpeechRecognitionResult:(id)a3
{
  id v4;
  NSObject *resultQueue;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (-[_LTTranslationContext autodetectLanguage](self->_context, "autodetectLanguage"))
  {
    objc_initWeak(&location, self);
    resultQueue = self->_resultQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke;
    block[3] = &unk_251A10FD0;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_async(resultQueue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)addSpeechAudioData:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 && -[_LTTranslationContext autodetectLanguage](self->_context, "autodetectLanguage"))
  {
    if (self->_finalLIDResultSent)
    {
      v5 = _LTOSLogLID();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[_LTLanguageDetector addSpeechAudioData:].cold.1();
    }
    else
    {
      v6 = (unint64_t)objc_msgSend(v4, "length") / self->_audioBitDepth;
      _LTOSLogLID();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v7))
      {
        v8 = 134217984;
        v9 = v6;
        _os_signpost_emit_with_name_impl(&dword_2491B9000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LID Audio Data", "NumSamples: %ld", (uint8_t *)&v8, 0xCu);
      }

      -[CSLanguageDetector addSamples:numSamples:](self->_csLanguageDetector, "addSamples:numSamples:", v4, v6);
    }
  }

}

- (void)endAudio
{
  NSObject *resultQueue;
  _QWORD v4[4];
  id v5;
  id location;

  if (!self->_endAudioCalled)
  {
    if (-[_LTTranslationContext autodetectLanguage](self->_context, "autodetectLanguage"))
      -[CSLanguageDetector endAudio](self->_csLanguageDetector, "endAudio");
    objc_initWeak(&location, self);
    resultQueue = self->_resultQueue;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __31___LTLanguageDetector_endAudio__block_invoke;
    v4[3] = &unk_251A111A0;
    objc_copyWeak(&v5, &location);
    dispatch_async(resultQueue, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)cancelLanguageDetection
{
  -[CSLanguageDetector cancelCurrentRequest](self->_csLanguageDetector, "cancelCurrentRequest");
}

- (BOOL)forceLanguageDetectionResult
{
  _LTLanguageDetector *v2;
  NSObject *resultQueue;
  _QWORD v5[6];
  id v6;
  id location;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v2 = self;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_initWeak(&location, self);
  resultQueue = v2->_resultQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51___LTLanguageDetector_forceLanguageDetectionResult__block_invoke;
  v5[3] = &unk_251A12080;
  objc_copyWeak(&v6, &location);
  v5[4] = v2;
  v5[5] = &v8;
  dispatch_sync(resultQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

- (BOOL)isLowConfidencePair
{
  NSSet *lowConfidenceLanguagePairs;
  void *v5;
  void *v6;

  if ((_LTPreferencesDebugForceLowConfidenceLID() & 1) != 0)
    return 1;
  lowConfidenceLanguagePairs = self->_lowConfidenceLanguagePairs;
  -[_LTTranslationContext localePair](self->_context, "localePair");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "canonicalLocalePair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(lowConfidenceLanguagePairs) = -[NSSet containsObject:](lowConfidenceLanguagePairs, "containsObject:", v6);

  return (char)lowConfidenceLanguagePairs;
}

- (void)languageDetectorDidDetectLanguageWithConfidence:(id)a3 confidence:(id)a4 isConfident:(BOOL)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *resultQueue;
  id v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  os_signpost_id_t lidSignpostID;
  NSObject *v40;
  void *v41;
  id v42;
  uint8_t v43[16];
  _QWORD block[4];
  id v45;
  id v46;
  id v47;
  char v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  int v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v7 = a4;
  _LTOSLogLID();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v7;
    _os_signpost_emit_with_name_impl(&dword_2491B9000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CS-LID Result", "confidence: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationContext localePair](self->_context, "localePair");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_ltCsLocaleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_9;
  -[_LTTranslationContext localePair](self->_context, "localePair");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sourceLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v15);

  objc_msgSend(v13, "floatValue");
  if (v16 < self->_sourceLocaleConfidenceThreshold || (objc_msgSend(v13, "floatValue"), v17 == 0.5))
  {
LABEL_9:
    v19 = 0;
    v21 = 0;
  }
  else
  {
    -[_LTTranslationContext localePair](self->_context, "localePair");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sourceLocale");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = _LTOSLogLID();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[_LTLanguageDetector languageDetectorDidDetectLanguageWithConfidence:confidence:isConfident:].cold.2(v20, v13);
    v21 = 1;
  }
  -[_LTTranslationContext localePair](self->_context, "localePair");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "targetLocale");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_ltCsLocaleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
    goto LABEL_15;
  -[_LTTranslationContext localePair](self->_context, "localePair");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "targetLocale");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, v27);

  objc_msgSend(v25, "floatValue");
  if (v28 < self->_targetLocaleConfidenceThreshold || (objc_msgSend(v25, "floatValue"), v29 == 0.5))
  {
LABEL_15:
    if (!v21)
      goto LABEL_18;
    v31 = (uint64_t)v19;
  }
  else
  {
    -[_LTTranslationContext localePair](self->_context, "localePair");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "targetLocale");
    v31 = objc_claimAutoreleasedReturnValue();

    v32 = _LTOSLogLID();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      -[_LTLanguageDetector languageDetectorDidDetectLanguageWithConfidence:confidence:isConfident:].cold.1(v32, v25);
  }
  v21 = !-[_LTLanguageDetector isLowConfidencePair](self, "isLowConfidencePair");
  v19 = (void *)v31;
LABEL_18:
  v33 = _LTOSLogLID();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v40 = v33;
    objc_msgSend(v19, "localeIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v50 = v41;
    v51 = 1024;
    v52 = v21;
    v53 = 2114;
    v54 = v7;
    _os_log_debug_impl(&dword_2491B9000, v40, OS_LOG_TYPE_DEBUG, "Acoustic LID detected %{public}@ (confident: %{BOOL}i): %{public}@", buf, 0x1Cu);

  }
  objc_initWeak((id *)buf, self);
  resultQueue = self->_resultQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94___LTLanguageDetector_languageDetectorDidDetectLanguageWithConfidence_confidence_isConfident___block_invoke;
  block[3] = &unk_251A120A8;
  objc_copyWeak(&v47, (id *)buf);
  v35 = v9;
  v45 = v35;
  v48 = v21;
  v36 = v19;
  v46 = v36;
  dispatch_async(resultQueue, block);
  _LTOSLogLID();
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = v37;
  lidSignpostID = self->_lidSignpostID;
  if (lidSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)v43 = 0;
    _os_signpost_emit_with_name_impl(&dword_2491B9000, v38, OS_SIGNPOST_INTERVAL_BEGIN, lidSignpostID, "LID", "End", v43, 2u);
  }

  objc_destroyWeak(&v47);
  objc_destroyWeak((id *)buf);

}

- (NSMutableArray)acousticResults
{
  return self->_acousticResults;
}

- (void)setAcousticResults:(id)a3
{
  objc_storeStrong((id *)&self->_acousticResults, a3);
}

- (_LTLanguageDetectionResult)lastResult
{
  return self->_lastResult;
}

- (void)setLastResult:(id)a3
{
  objc_storeStrong((id *)&self->_lastResult, a3);
}

- (BOOL)featureCombinationModelSupported
{
  return self->_featureCombinationModelSupported;
}

- (void)setFeatureCombinationModelSupported:(BOOL)a3
{
  self->_featureCombinationModelSupported = a3;
}

- (_LTLanguageDetectorFeatureCombinationModel)featureCombinationModel
{
  return self->_featureCombinationModel;
}

- (void)setFeatureCombinationModel:(id)a3
{
  objc_storeStrong((id *)&self->_featureCombinationModel, a3);
}

- (double)samplingRate
{
  return self->_samplingRate;
}

- (void)setSamplingRate:(double)a3
{
  self->_samplingRate = a3;
}

- (int64_t)audioBitDepth
{
  return self->_audioBitDepth;
}

- (void)setAudioBitDepth:(int64_t)a3
{
  self->_audioBitDepth = a3;
}

- (_LTDSELFLoggingManager)selfLoggingManager
{
  return self->_selfLoggingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfLoggingManager, 0);
  objc_storeStrong((id *)&self->_featureCombinationModel, 0);
  objc_storeStrong((id *)&self->_lastResult, 0);
  objc_storeStrong((id *)&self->_acousticResults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_finalResultWaitQueue, 0);
  objc_storeStrong((id *)&self->_resultQueue, 0);
  objc_storeStrong((id *)&self->_lowConfidenceLanguagePairs, 0);
  objc_storeStrong((id *)&self->_modelVersions, 0);
  objc_storeStrong((id *)&self->_finalSpeechResults, 0);
  objc_storeStrong((id *)&self->_partialSpeechResultConfidences, 0);
  objc_storeStrong((id *)&self->_csLanguageDetector, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithSelfLoggingManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Failed to obtain LID asset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)startLanguageDetectionWithContext:delegate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Invalid source and target confidence threshold configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addSpeechAudioData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Already sent final LID result, ignoring additional audio data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)languageDetectorDidDetectLanguageWithConfidence:(void *)a1 confidence:(void *)a2 isConfident:.cold.1(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "floatValue");
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_5_1(&dword_2491B9000, v4, v5, "Confident in target language (%lf) with threshold %lf", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_3();
}

- (void)languageDetectorDidDetectLanguageWithConfidence:(void *)a1 confidence:(void *)a2 isConfident:.cold.2(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "floatValue");
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_5_1(&dword_2491B9000, v4, v5, "Confident in source language (%lf) with threshold %lf", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_3();
}

@end
