@implementation PGPhotosChallengeMetricEvent

- (PGPhotosChallengeMetricEvent)initWithWorkingContext:(id)a3 questionMetricType:(unsigned __int16)a4 metricEventFetchHelper:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  PGPhotosChallengeMetricEvent *v11;
  PGPhotosChallengeMetricEvent *v12;
  id *p_workingContext;
  id v14;
  PGPhotosChallengeMetricEvent *v15;
  PGEventLabelingConfiguration *v16;
  PGEventLabelingConfiguration *eventLabelingConfiguration;
  CLSCurationSession *v18;
  CLSCurationSession *curationSession;
  id v20;
  void *v21;
  uint64_t v22;
  CLSCurationContext *curationContext;
  uint64_t v24;
  NSString *questionTypeString;
  _QWORD v27[4];
  PGPhotosChallengeMetricEvent *v28;
  objc_super v29;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)PGPhotosChallengeMetricEvent;
  v11 = -[PGPhotosChallengeMetricEvent init](&v29, sel_init);
  v12 = v11;
  if (v11)
  {
    p_workingContext = (id *)&v11->_workingContext;
    objc_storeStrong((id *)&v11->_workingContext, a3);
    v14 = *p_workingContext;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __97__PGPhotosChallengeMetricEvent_initWithWorkingContext_questionMetricType_metricEventFetchHelper___block_invoke;
    v27[3] = &unk_1E84353C0;
    v15 = v12;
    v28 = v15;
    objc_msgSend(v14, "performSynchronousConcurrentGraphReadUsingBlock:", v27);
    v16 = objc_alloc_init(PGEventLabelingConfiguration);
    eventLabelingConfiguration = v15->_eventLabelingConfiguration;
    v15->_eventLabelingConfiguration = v16;

    v18 = (CLSCurationSession *)objc_alloc_init(MEMORY[0x1E0D77E18]);
    curationSession = v15->_curationSession;
    v15->_curationSession = v18;

    v20 = objc_alloc(MEMORY[0x1E0D77E08]);
    objc_msgSend(*p_workingContext, "photoLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithPhotoLibrary:curationSession:", v21, v15->_curationSession);
    curationContext = v15->_curationContext;
    v15->_curationContext = (CLSCurationContext *)v22;

    +[PGPhotosChallengeMetricEvent stringFromQuestionMetricType:](PGPhotosChallengeMetricEvent, "stringFromQuestionMetricType:", v6);
    v24 = objc_claimAutoreleasedReturnValue();
    questionTypeString = v15->_questionTypeString;
    v15->_questionTypeString = (NSString *)v24;

    v15->_questionMetricType = v6;
    objc_storeStrong((id *)&v15->_metricsCache, a5);
    v15->_graphSchemaVersion = 615;
    v15->_questionVersion = 10;
    v15->_algorithmVersion = objc_msgSend((id)objc_opt_class(), "algorithmVersionFromQuestionMetricType:withEventLabelingConfiguration:", v6, v15->_eventLabelingConfiguration);

  }
  return v12;
}

- (id)identifier
{
  return CFSTR("com.apple.Photos.Intelligence.PhotosChallenge");
}

- (BOOL)shouldReportMetrics
{
  return -[PGManagerWorkingContext isGraphReady](self->_workingContext, "isGraphReady");
}

- (void)gatherMetricsWithProgressBlock:(id)a3
{
  void *v4;
  PGPhotosChallengeMetricEvent *v5;
  void *v6;
  PGPhotosChallengeMetricEvent *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PGPhotosChallengeMetricEventFetchHelper questionsForQuestionMetricType:](self->_metricsCache, "questionsForQuestionMetricType:", self->_questionMetricType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    switch(self->_questionMetricType)
    {
      case 1u:
      case 2u:
      case 3u:
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
      case 9u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
      case 0x10u:
      case 0x11u:
      case 0x12u:
      case 0x13u:
      case 0x14u:
      case 0x15u:
      case 0x16u:
      case 0x17u:
      case 0x18u:
      case 0x19u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForMeaningQuestions:questionMetricType:progressBlock:](self, "_gatherMetricsForMeaningQuestions:questionMetricType:progressBlock:", v4);
        break;
      case 0x1Au:
      case 0x1Bu:
      case 0x1Cu:
      case 0x1Du:
      case 0x1Eu:
      case 0x1Fu:
      case 0x20u:
      case 0x21u:
      case 0x22u:
      case 0x23u:
      case 0x24u:
      case 0x25u:
      case 0x26u:
      case 0x27u:
      case 0x28u:
      case 0x29u:
      case 0x2Au:
      case 0x2Bu:
      case 0x2Cu:
      case 0x2Du:
      case 0x2Eu:
      case 0x2Fu:
      case 0x30u:
      case 0x31u:
      case 0x32u:
      case 0x33u:
        v5 = self;
        v6 = v4;
        goto LABEL_6;
      case 0x34u:
      case 0x35u:
      case 0x36u:
      case 0x37u:
      case 0x38u:
      case 0x39u:
      case 0x3Au:
      case 0x3Bu:
      case 0x3Cu:
      case 0x3Du:
      case 0x3Eu:
      case 0x3Fu:
      case 0x40u:
      case 0x41u:
      case 0x42u:
      case 0x43u:
      case 0x44u:
      case 0x45u:
      case 0x46u:
      case 0x47u:
      case 0x48u:
      case 0x49u:
      case 0x4Au:
      case 0x4Bu:
      case 0x4Cu:
      case 0x4Du:
        v5 = self;
        v6 = v4;
LABEL_6:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForExhaustiveMomentLabelingQuestions:questionMetricType:isEventLabelingMetricEvent:progressBlock:](v5, "_gatherMetricsForExhaustiveMomentLabelingQuestions:questionMetricType:isEventLabelingMetricEvent:progressBlock:", v6);
        break;
      case 0x4Eu:
      case 0x4Fu:
      case 0x50u:
      case 0x51u:
      case 0x52u:
      case 0x53u:
      case 0x54u:
      case 0x55u:
      case 0x56u:
      case 0x57u:
      case 0x58u:
      case 0x59u:
      case 0x5Au:
      case 0x5Bu:
      case 0x5Cu:
        v7 = self;
        v8 = v4;
        goto LABEL_10;
      case 0x5Du:
      case 0x5Eu:
      case 0x5Fu:
      case 0x60u:
      case 0x61u:
      case 0x62u:
      case 0x63u:
      case 0x64u:
      case 0x65u:
      case 0x66u:
      case 0x67u:
      case 0x68u:
      case 0x69u:
      case 0x6Au:
        v7 = self;
        v8 = v4;
LABEL_10:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForRelationshipQuestions:questionMetricType:progressBlock:useGraphInference:](v7, "_gatherMetricsForRelationshipQuestions:questionMetricType:progressBlock:useGraphInference:", v8);
        break;
      case 0x6Bu:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForBusinessQuestions:progressBlock:](self, "_gatherMetricsForBusinessQuestions:progressBlock:", v4, v9);
        break;
      case 0x6Cu:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForPublicEventQuestions:progressBlock:](self, "_gatherMetricsForPublicEventQuestions:progressBlock:", v4, v9);
        break;
      case 0x6Du:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForTripKeyQuestions:progressBlock:](self, "_gatherMetricsForTripKeyQuestions:progressBlock:", v4, v9);
        break;
      case 0x6Eu:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForHolidayQuestions:progressBlock:](self, "_gatherMetricsForHolidayQuestions:progressBlock:", v4, v9);
        break;
      case 0x6Fu:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForFrequentLocationQuestions:questionMetricType:progressBlock:](self, "_gatherMetricsForFrequentLocationQuestions:questionMetricType:progressBlock:", v4, 111, v9);
        break;
      case 0x70u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForNamingQuestions:progressBlock:](self, "_gatherMetricsForNamingQuestions:progressBlock:", v4, v9);
        break;
      case 0x71u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForAgeCategoryQuestions:progressBlock:](self, "_gatherMetricsForAgeCategoryQuestions:progressBlock:", v4, v9);
        break;
      case 0x72u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForPetQuestions:progressBlock:](self, "_gatherMetricsForPetQuestions:progressBlock:", v4, v9);
        break;
      case 0x73u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForPetKnowledgeQuestions:progressBlock:](self, "_gatherMetricsForPetKnowledgeQuestions:progressBlock:", v4, v9);
        break;
      case 0x74u:
      case 0x78u:
      case 0x79u:
      case 0x7Au:
      case 0x7Bu:
      case 0x7Cu:
      case 0x7Du:
      case 0x7Eu:
      case 0x7Fu:
      case 0x80u:
      case 0x81u:
      case 0x82u:
      case 0x83u:
      case 0x84u:
      case 0x85u:
      case 0x86u:
      case 0x87u:
      case 0x88u:
      case 0x89u:
      case 0x8Au:
      case 0x8Bu:
      case 0x8Cu:
      case 0x8Du:
      case 0x8Eu:
      case 0x8Fu:
      case 0x90u:
      case 0x91u:
      case 0x92u:
      case 0x93u:
      case 0x94u:
      case 0x95u:
      case 0x96u:
      case 0x97u:
      case 0x98u:
      case 0x99u:
      case 0x9Au:
      case 0x9Bu:
      case 0x9Cu:
      case 0x9Du:
      case 0x9Eu:
      case 0x9Fu:
      case 0xA0u:
      case 0xA1u:
      case 0xA2u:
      case 0xA3u:
      case 0xA4u:
      case 0xA5u:
      case 0xA6u:
      case 0xA7u:
      case 0xA8u:
      case 0xA9u:
      case 0xAAu:
      case 0xABu:
      case 0xACu:
      case 0xADu:
      case 0xAEu:
      case 0xAFu:
      case 0xB0u:
      case 0xB1u:
      case 0xB2u:
      case 0xB3u:
      case 0xB4u:
      case 0xB5u:
      case 0xB6u:
      case 0xB7u:
      case 0xB8u:
      case 0xB9u:
      case 0xBAu:
      case 0xBBu:
      case 0xBCu:
      case 0xBDu:
      case 0xBEu:
      case 0xBFu:
      case 0xC0u:
      case 0xC1u:
      case 0xC2u:
      case 0xC3u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForMemoryQuestions:questionMetricType:progressBlock:](self, "_gatherMetricsForMemoryQuestions:questionMetricType:progressBlock:", v4);
        break;
      case 0x75u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForMemoryMusicQuestions:progressBlock:](self, "_gatherMetricsForMemoryMusicQuestions:progressBlock:", v4, v9);
        break;
      case 0xC4u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForSyndicatedAssetsQuestions:progressBlock:](self, "_gatherMetricsForSyndicatedAssetsQuestions:progressBlock:", v4, v9);
        break;
      case 0xC5u:
      case 0xC6u:
      case 0xC7u:
      case 0xC8u:
      case 0xC9u:
      case 0xCAu:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForPersonActivityMeaningQuestions:questionMetricType:progressBlock:](self, "_gatherMetricsForPersonActivityMeaningQuestions:questionMetricType:progressBlock:", v4);
        break;
      case 0xCBu:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForSharedLibraryAssetsQuestions:progressBlock:](self, "_gatherMetricsForSharedLibraryAssetsQuestions:progressBlock:", v4, v9);
        break;
      case 0xCCu:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForSharedLibraryStartQuestions:progressBlock:](self, "_gatherMetricsForSharedLibraryStartQuestions:progressBlock:", v4, v9);
        break;
      case 0xCDu:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForCameraLibrarySwitchQuestions:progressBlock:](self, "_gatherMetricsForCameraLibrarySwitchQuestions:progressBlock:", v4, v9);
        break;
      case 0xCEu:
      case 0xCFu:
      case 0xD0u:
      case 0xD1u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForWallpaperQuestions:questionMetricType:progressBlock:](self, "_gatherMetricsForWallpaperQuestions:questionMetricType:progressBlock:", v4);
        break;
      case 0xD2u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForTripTitlingQuestions:progressBlock:](self, "_gatherMetricsForTripTitlingQuestions:progressBlock:", v4, v9);
        break;
      case 0xD3u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForHighlightTitlingQuestions:progressBlock:](self, "_gatherMetricsForHighlightTitlingQuestions:progressBlock:", v4, v9);
        break;
      case 0xD4u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForLocationRepresentativeAssetQuestions:questionMetricType:progressBlock:](self, "_gatherMetricsForLocationRepresentativeAssetQuestions:questionMetricType:progressBlock:", v4, 212, v9);
        break;
      case 0xD5u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForExternalAssetRelevanceQuestions:questionMetricType:progressBlock:](self, "_gatherMetricsForExternalAssetRelevanceQuestions:questionMetricType:progressBlock:", v4, 213, v9);
        break;
      case 0xD6u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForStoryPromptSuggestionsQuestions:progressBlock:](self, "_gatherMetricsForStoryPromptSuggestionsQuestions:progressBlock:", v4, v9);
        break;
      default:
        break;
    }
  }

}

- (void)_gatherMetricsForExhaustiveMomentLabelingQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 isEventLabelingMetricEvent:(BOOL)a5 progressBlock:(id)a6
{
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  void (**v11)(void *, _BYTE *, double);
  double v12;
  double v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  double Current;
  void *v19;
  void *v20;
  double v21;
  NSObject *v22;
  __CFString *v23;
  __CFString *v24;
  PGPrecisionRecallEvaluation *v25;
  void *v26;
  char v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v7 = a5;
  v8 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(void *, _BYTE *, double))_Block_copy(a6);
  v12 = 0.0;
  if (!v11 || (v13 = CFAbsoluteTimeGetCurrent(), v13 < 0.01))
  {
LABEL_7:
    objc_msgSend((id)objc_opt_class(), "meaningLabelFromMeaningQuestionMetricType:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "loggingConnection");
      v16 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v29 = v8;
        _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "Unhandled Meaning Type: %d", buf, 8u);
      }
      goto LABEL_32;
    }
    -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPhotosChallengeMetricEvent groundTruthByMomentUUIDFromExhaustiveMomentLabelingQuestions:meaningLabel:withMetricsCache:](self, "groundTruthByMomentUUIDFromExhaustiveMomentLabelingQuestions:meaningLabel:withMetricsCache:", v10, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    -[NSObject allKeys](v16, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v12 >= 0.01)
      {
        v27 = 0;
        v11[2](v11, &v27, 0.5);
        if (v27)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v29 = 729;
            v30 = 2080;
            v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_31;
        }
        v12 = Current;
      }
      -[PGPhotosChallengeMetricEvent _meaningInferenceResultsForMeaningLabel:momentUUIDs:isEventLabelingMetricEvent:](self, "_meaningInferenceResultsForMeaningLabel:momentUUIDs:isEventLabelingMetricEvent:", v14, v17, v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFAbsoluteTimeGetCurrent();
      if (v21 - v12 >= 0.01)
      {
        v27 = 0;
        v11[2](v11, &v27, 0.9);
        if (v27)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_30:

LABEL_31:
LABEL_32:

            goto LABEL_33;
          }
          *(_DWORD *)buf = 67109378;
          v29 = 732;
          v30 = 2080;
          v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v22 = MEMORY[0x1E0C81028];
LABEL_29:
          _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_30;
        }
        v12 = v21;
      }
    }
    else
    {
      -[PGPhotosChallengeMetricEvent _meaningInferenceResultsForMeaningLabel:momentUUIDs:isEventLabelingMetricEvent:](self, "_meaningInferenceResultsForMeaningLabel:momentUUIDs:isEventLabelingMetricEvent:", v14, v17, v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = CFSTR("exhaustiveMomentLabeling");
    if (v7)
      v23 = CFSTR("exhaustiveMomentLabelingForEventLabeling");
    v24 = v23;
    v25 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", v24, v14);

    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v25);
    -[PGPhotosChallengeMetricEvent evaluation](self, "evaluation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "evaluateWithGroundTruthResults:andInferenceResults:", v16, v20);

    if (!v11)
      goto LABEL_30;
    if (CFAbsoluteTimeGetCurrent() - v12 < 0.01)
      goto LABEL_30;
    v27 = 0;
    v11[2](v11, &v27, 1.0);
    if (!v27 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_30;
    *(_DWORD *)buf = 67109378;
    v29 = 737;
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    v22 = MEMORY[0x1E0C81028];
    goto LABEL_29;
  }
  v27 = 0;
  v11[2](v11, &v27, 0.0);
  if (!v27)
  {
    v12 = v13;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v29 = 719;
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_33:

}

- (id)_meaningInferenceResultsForMeaningLabel:(id)a3 momentUUIDs:(id)a4 isEventLabelingMetricEvent:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  PGManagerWorkingContext *workingContext;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  PGPhotosChallengeMetricEvent *v18;
  id v19;
  id v20;
  BOOL v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || +[PGEventLabelingConfiguration isEventLabelingEnabled](PGEventLabelingConfiguration, "isEventLabelingEnabled"))
  {
    workingContext = self->_workingContext;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __111__PGPhotosChallengeMetricEvent__meaningInferenceResultsForMeaningLabel_momentUUIDs_isEventLabelingMetricEvent___block_invoke;
    v16[3] = &unk_1E84353E8;
    v17 = v9;
    v18 = self;
    v19 = v8;
    v21 = v5;
    v12 = v10;
    v20 = v12;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v16);
    v13 = v20;
    v14 = v12;

  }
  return v10;
}

- (id)_meaningLabelsOfMomentNode:(id)a3 forMeaningLabel:(id)a4 isEventLabelingMetricEvent:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    if (!-[PGEventLabelingConfiguration useEventLabelingToInferWithMeaningLabel:](self->_eventLabelingConfiguration, "useEventLabelingToInferWithMeaningLabel:", v9))
    {
      v11 = 0;
      goto LABEL_11;
    }
    if (+[PGEventLabelingConfiguration usePrimaryMeaningDomainForEventLabelingMeanings](PGEventLabelingConfiguration, "usePrimaryMeaningDomainForEventLabelingMeanings"))
    {
      goto LABEL_8;
    }
  }
  else if (!+[PGEventLabelingConfiguration isEventLabelingEnabled](PGEventLabelingConfiguration, "isEventLabelingEnabled")|| !+[PGEventLabelingConfiguration usePrimaryMeaningDomainForEventLabelingMeanings](PGEventLabelingConfiguration, "usePrimaryMeaningDomainForEventLabelingMeanings"))
  {
LABEL_8:
    objc_msgSend(v8, "meaningLabelsIncludingParents");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v8, "alternativeMeaningLabelsIncludingParents");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v11 = (void *)v10;
LABEL_11:

  return v11;
}

- (void)_gatherMetricsForMeaningQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(void *, _BYTE *, double);
  double v10;
  double v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  double Current;
  PGPhotosChallengeMetricEvent *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  NSObject *v32;
  PGPrecisionRecallEvaluation *v33;
  void *v34;
  PGPhotosChallengeMetricEvent *v35;
  void (**v36)(void *, _BYTE *, double);
  id v37;
  os_log_t log;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char v43;
  uint8_t v44[128];
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v6 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(void *, _BYTE *, double))_Block_copy(a5);
  v10 = 0.0;
  if (!v9 || (v11 = CFAbsoluteTimeGetCurrent(), v11 < 0.01))
  {
LABEL_7:
    objc_msgSend((id)objc_opt_class(), "meaningLabelFromMeaningQuestionMetricType:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "loggingConnection");
      v26 = objc_claimAutoreleasedReturnValue();

      log = v26;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v46 = v6;
        _os_log_error_impl(&dword_1CA237000, v26, OS_LOG_TYPE_ERROR, "Unhandled Meaning Type: %d", buf, 8u);
      }
      goto LABEL_47;
    }
    v35 = self;
    v36 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v37 = v8;
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v40;
      v17 = *MEMORY[0x1E0D78060];
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v19, "additionalInfo");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", v12);

          if (v22)
            -[NSObject addObject:](log, "addObject:", v19);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v15);
    }

    v9 = v36;
    if (v36)
    {
      Current = CFAbsoluteTimeGetCurrent();
      v24 = v35;
      if (Current - v10 >= 0.01)
      {
        v43 = 0;
        v36[2](v36, &v43, 0.1);
        if (v43)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v46 = 839;
            v47 = 2080;
            v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v8 = v37;
          goto LABEL_47;
        }
        v10 = Current;
      }
    }
    else
    {
      v24 = v35;
    }
    -[PGPhotosChallengeMetricEvent _groundTruthByAssetIdentifiersFromQuestions:](v24, "_groundTruthByAssetIdentifiersFromQuestions:", log);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v29 = CFAbsoluteTimeGetCurrent();
      v8 = v37;
      if (v29 - v10 >= 0.01)
      {
        v43 = 0;
        v36[2](v36, &v43, 0.5);
        if (v43)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v46 = 843;
            v47 = 2080;
            v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_46;
        }
        v10 = v29;
      }
      -[PGPhotosChallengeMetricEvent _meaningInferenceResultsForMeaningLabel:assetIds:](v24, "_meaningInferenceResultsForMeaningLabel:assetIds:", v12, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFAbsoluteTimeGetCurrent();
      if (v31 - v10 >= 0.01)
      {
        v43 = 0;
        v36[2](v36, &v43, 0.9);
        if (v43)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_45:

LABEL_46:
LABEL_47:

            goto LABEL_48;
          }
          *(_DWORD *)buf = 67109378;
          v46 = 846;
          v47 = 2080;
          v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v32 = MEMORY[0x1E0C81028];
LABEL_44:
          _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_45;
        }
        v10 = v31;
      }
    }
    else
    {
      -[PGPhotosChallengeMetricEvent _meaningInferenceResultsForMeaningLabel:assetIds:](v24, "_meaningInferenceResultsForMeaningLabel:assetIds:", v12, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v37;
    }
    v33 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("meaning"), v12);
    -[PGPhotosChallengeMetricEvent setEvaluation:](v24, "setEvaluation:", v33);

    -[PGPhotosChallengeMetricEvent evaluation](v24, "evaluation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "evaluateWithGroundTruthResults:andInferenceResults:", v27, v30);

    if (!v36)
      goto LABEL_45;
    if (CFAbsoluteTimeGetCurrent() - v10 < 0.01)
      goto LABEL_45;
    v43 = 0;
    v36[2](v36, &v43, 1.0);
    if (!v43 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_45;
    *(_DWORD *)buf = 67109378;
    v46 = 850;
    v47 = 2080;
    v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    v32 = MEMORY[0x1E0C81028];
    goto LABEL_44;
  }
  v43 = 0;
  v9[2](v9, &v43, 0.0);
  if (!v43)
  {
    v10 = v11;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v46 = 822;
    v47 = 2080;
    v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_48:

}

- (id)_meaningInferenceResultsForMeaningLabel:(id)a3 assetIds:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PGManagerWorkingContext *workingContext;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  workingContext = self->_workingContext;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__PGPhotosChallengeMetricEvent__meaningInferenceResultsForMeaningLabel_assetIds___block_invoke;
  v16[3] = &unk_1E8435410;
  v16[4] = self;
  v17 = v7;
  v18 = v6;
  v10 = v8;
  v19 = v10;
  v11 = v6;
  v12 = v7;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v16);
  v13 = v19;
  v14 = v10;

  return v14;
}

- (void)_gatherMetricsForPersonActivityMeaningQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(void *, _BYTE *, double);
  double v10;
  double v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  double Current;
  PGPhotosChallengeMetricEvent *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  NSObject *v31;
  PGPrecisionRecallEvaluation *v32;
  void *v33;
  PGPhotosChallengeMetricEvent *v34;
  void (**v35)(void *, _BYTE *, double);
  id v36;
  os_log_t log;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char v42;
  uint8_t v43[128];
  uint8_t buf[4];
  int v45;
  __int16 v46;
  const char *v47;
  uint64_t v48;

  v6 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(void *, _BYTE *, double))_Block_copy(a5);
  v10 = 0.0;
  if (!v9 || (v11 = CFAbsoluteTimeGetCurrent(), v11 < 0.01))
  {
LABEL_7:
    objc_msgSend((id)objc_opt_class(), "personActivityMeaningLabelFromMeaningQuestionMetricType:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "loggingConnection");
      v25 = objc_claimAutoreleasedReturnValue();

      log = v25;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v45 = v6;
        _os_log_error_impl(&dword_1CA237000, v25, OS_LOG_TYPE_ERROR, "Unhandled Person Activity Meaning Type: %d", buf, 8u);
      }
      goto LABEL_47;
    }
    v34 = self;
    v35 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v36 = v8;
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v39 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v18, "additionalInfo");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("personActivityMeaningLabel"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", v12);

          if (v21)
            -[NSObject addObject:](log, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v15);
    }

    v9 = v35;
    if (v35)
    {
      Current = CFAbsoluteTimeGetCurrent();
      v23 = v34;
      if (Current - v10 >= 0.01)
      {
        v42 = 0;
        v35[2](v35, &v42, 0.1);
        if (v42)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v45 = 902;
            v46 = 2080;
            v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v8 = v36;
          goto LABEL_47;
        }
        v10 = Current;
      }
    }
    else
    {
      v23 = v34;
    }
    -[PGPhotosChallengeMetricEvent _groundTruthByAssetIdentifiersFromQuestions:](v23, "_groundTruthByAssetIdentifiersFromQuestions:", log);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v28 = CFAbsoluteTimeGetCurrent();
      v8 = v36;
      if (v28 - v10 >= 0.01)
      {
        v42 = 0;
        v35[2](v35, &v42, 0.5);
        if (v42)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v45 = 906;
            v46 = 2080;
            v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_46;
        }
        v10 = v28;
      }
      -[PGPhotosChallengeMetricEvent _personActivityMeaningInferenceResultsForPersonActivityMeaningLabel:assetIds:](v23, "_personActivityMeaningInferenceResultsForPersonActivityMeaningLabel:assetIds:", v12, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFAbsoluteTimeGetCurrent();
      if (v30 - v10 >= 0.01)
      {
        v42 = 0;
        v35[2](v35, &v42, 0.9);
        if (v42)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_45:

LABEL_46:
LABEL_47:

            goto LABEL_48;
          }
          *(_DWORD *)buf = 67109378;
          v45 = 909;
          v46 = 2080;
          v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v31 = MEMORY[0x1E0C81028];
LABEL_44:
          _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_45;
        }
        v10 = v30;
      }
    }
    else
    {
      -[PGPhotosChallengeMetricEvent _personActivityMeaningInferenceResultsForPersonActivityMeaningLabel:assetIds:](v23, "_personActivityMeaningInferenceResultsForPersonActivityMeaningLabel:assetIds:", v12, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v36;
    }
    v32 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("personActivityMeaning"), v12);
    -[PGPhotosChallengeMetricEvent setEvaluation:](v23, "setEvaluation:", v32);

    -[PGPhotosChallengeMetricEvent evaluation](v23, "evaluation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "evaluateWithGroundTruthResults:andInferenceResults:", v26, v29);

    if (!v35)
      goto LABEL_45;
    if (CFAbsoluteTimeGetCurrent() - v10 < 0.01)
      goto LABEL_45;
    v42 = 0;
    v35[2](v35, &v42, 1.0);
    if (!v42 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_45;
    *(_DWORD *)buf = 67109378;
    v45 = 913;
    v46 = 2080;
    v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    v31 = MEMORY[0x1E0C81028];
    goto LABEL_44;
  }
  v42 = 0;
  v9[2](v9, &v42, 0.0);
  if (!v42)
  {
    v10 = v11;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v45 = 885;
    v46 = 2080;
    v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_48:

}

- (id)_personActivityMeaningInferenceResultsForPersonActivityMeaningLabel:(id)a3 assetIds:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PGManagerWorkingContext *workingContext;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  workingContext = self->_workingContext;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __109__PGPhotosChallengeMetricEvent__personActivityMeaningInferenceResultsForPersonActivityMeaningLabel_assetIds___block_invoke;
  v16[3] = &unk_1E8435410;
  v16[4] = self;
  v17 = v7;
  v18 = v6;
  v10 = v8;
  v19 = v10;
  v11 = v6;
  v12 = v7;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v16);
  v13 = v19;
  v14 = v10;

  return v14;
}

- (void)_gatherMetricsForRelationshipQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5 useGraphInference:(BOOL)a6
{
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  void *v19;
  double Current;
  id v21;
  id v22;
  PGManagerWorkingContext *workingContext;
  id v24;
  id v25;
  double v26;
  int v27;
  char v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  double v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  double v36;
  __CFString *v37;
  PGPrecisionRecallEvaluation *v38;
  void *v39;
  _BOOL4 v40;
  id v41;
  unsigned int v42;
  id v43;
  void (**v45)(void *, _QWORD *, double);
  NSObject *oslog;
  void *v47;
  unsigned __int8 v48;
  _QWORD v49[4];
  id v50;
  PGPhotosChallengeMetricEvent *v51;
  id v52;
  uint64_t *p_buf;
  uint64_t *v54;
  __int16 v55;
  BOOL v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  int v67;
  int v68;
  __int16 v69;
  const char *v70;
  uint64_t buf;
  __int128 v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _BYTE v76[128];
  uint64_t v77;

  v40 = a6;
  v42 = a4;
  v77 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v41 = a5;
  v7 = 0.0;
  v45 = (void (**)(void *, _QWORD *, double))_Block_copy(v41);
  if (!v45 || (v8 = CFAbsoluteTimeGetCurrent(), v8 < 0.01))
  {
LABEL_7:
    objc_msgSend((id)objc_opt_class(), "relationshipLabelFromRelationshipQuestionMetricType:", v42);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v47)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "loggingConnection");
      oslog = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 67109120;
        HIDWORD(buf) = v42;
        _os_log_error_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_ERROR, "Unhandled Relationship Type: %d", (uint8_t *)&buf, 8u);
      }
      goto LABEL_62;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    oslog = objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v9 = v43;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v64;
      v12 = *MEMORY[0x1E0D780D8];
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v64 != v11)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_msgSend(v14, "additionalInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v47);

          if (v17)
          {
            if (objc_msgSend(v14, "entityType") == 4)
            {
              v18 = objc_msgSend(v14, "state") == 3;
              goto LABEL_22;
            }
            -[NSObject addObject:](oslog, "addObject:", v14);
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
        if (v10)
          continue;
        break;
      }
    }
    v18 = 0;
LABEL_22:

    if (v45)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v7 >= 0.01)
      {
        LOBYTE(v57) = 0;
        v45[2](v45, &v57, 0.1);
        if ((_BYTE)v57)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            buf = 0x3CD04000202;
            LOWORD(v72) = 2080;
            *(_QWORD *)((char *)&v72 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
          }
          goto LABEL_62;
        }
        v7 = Current;
      }
    }
    buf = 0;
    *(_QWORD *)&v72 = &buf;
    *((_QWORD *)&v72 + 1) = 0x3032000000;
    v73 = __Block_byref_object_copy__65140;
    v74 = __Block_byref_object_dispose__65141;
    v75 = 0;
    v57 = 0;
    v58 = &v57;
    v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__65140;
    v61 = __Block_byref_object_dispose__65141;
    v62 = 0;
    if (v18)
    {
      v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      workingContext = self->_workingContext;
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __122__PGPhotosChallengeMetricEvent__gatherMetricsForRelationshipQuestions_questionMetricType_progressBlock_useGraphInference___block_invoke;
      v49[3] = &unk_1E8435460;
      v24 = v21;
      v50 = v24;
      v51 = self;
      v55 = v42;
      v56 = v40;
      v25 = v22;
      v52 = v25;
      p_buf = &buf;
      v54 = &v57;
      -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v49);
      if (v45 && (v26 = CFAbsoluteTimeGetCurrent(), v26 - v7 >= 0.01))
      {
        v48 = 0;
        ((void (**)(void *, unsigned __int8 *, double))v45)[2](v45, &v48, 0.5);
        if (v48)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v67 = 67109378;
            v68 = 998;
            v69 = 2080;
            v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v67, 0x12u);
          }
          v28 = 0;
          v27 = 1;
        }
        else
        {
          v27 = 0;
          v28 = 1;
        }
      }
      else
      {
        v27 = 0;
        v28 = 1;
        v26 = v7;
      }

      if ((v28 & 1) == 0)
        goto LABEL_61;
      goto LABEL_52;
    }
    -[PGPhotosChallengeMetricEvent _groundTruthByPersonUUIDFromQuestions:](self, "_groundTruthByPersonUUIDFromQuestions:", oslog);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *(void **)(v72 + 40);
    *(_QWORD *)(v72 + 40) = v29;

    objc_msgSend(*(id *)(v72 + 40), "allKeys");
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      v32 = CFAbsoluteTimeGetCurrent();
      if (v32 - v7 >= 0.01)
      {
        v48 = 0;
        ((void (**)(void *, unsigned __int8 *, double))v45)[2](v45, &v48, 0.5);
        if (v48)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v67 = 67109378;
            v68 = 1003;
            v69 = 2080;
            v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            v33 = MEMORY[0x1E0C81028];
LABEL_59:
            _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v67, 0x12u);
            goto LABEL_60;
          }
          goto LABEL_60;
        }
        v7 = v32;
      }
    }
    -[PGPhotosChallengeMetricEvent _relationshipInferenceResultsForQuestionMetricType:personUUIDs:useGraphInference:](self, "_relationshipInferenceResultsForQuestionMetricType:personUUIDs:useGraphInference:", v42, v31, v40);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v58[5];
    v58[5] = v34;

    if (v45)
    {
      v36 = CFAbsoluteTimeGetCurrent();
      if (v36 - v7 >= 0.01)
      {
        v48 = 0;
        ((void (**)(void *, unsigned __int8 *, double))v45)[2](v45, &v48, 0.9);
        if (v48)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v67 = 67109378;
            v68 = 1007;
            v69 = 2080;
            v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            v33 = MEMORY[0x1E0C81028];
            goto LABEL_59;
          }
LABEL_60:

LABEL_61:
          _Block_object_dispose(&v57, 8);

          _Block_object_dispose(&buf, 8);
LABEL_62:

          goto LABEL_63;
        }
        v7 = v36;
      }
    }

    v27 = 0;
    v26 = v7;
LABEL_52:
    v37 = CFSTR("relationshipTag");
    if (v40)
      v37 = CFSTR("relationship");
    v31 = v37;
    v38 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", v31, v47);
    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v38);

    -[PGPhotosChallengeMetricEvent evaluation](self, "evaluation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "evaluateWithGroundTruthResults:andInferenceResults:", *(_QWORD *)(v72 + 40), v58[5]);

    if (!v45)
      goto LABEL_60;
    if (CFAbsoluteTimeGetCurrent() - v26 < 0.01)
      goto LABEL_60;
    v48 = 0;
    ((void (**)(void *, unsigned __int8 *, double))v45)[2](v45, &v48, 1.0);
    if (!(v48 | v27) || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_60;
    v67 = 67109378;
    v68 = 1013;
    v69 = 2080;
    v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    v33 = MEMORY[0x1E0C81028];
    goto LABEL_59;
  }
  LOBYTE(v57) = 0;
  v45[2](v45, &v57, 0.0);
  if (!(_BYTE)v57)
  {
    v7 = v8;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 0x3B604000202;
    LOWORD(v72) = 2080;
    *(_QWORD *)((char *)&v72 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_63:

}

- (unint64_t)_relationshipTagFromQuestionMetricType:(unsigned __int16)a3
{
  if ((a3 - 93) > 0xC)
    return 0;
  else
    return qword_1CA8ED650[(unsigned __int16)(a3 - 93)];
}

- (BOOL)_relationshipInferenceResultForPersonNode:(id)a3 questionMetricType:(unsigned __int16)a4 useGraphInference:(BOOL)a5
{
  if (a5)
    return -[PGPhotosChallengeMetricEvent _relatonshipInferenceResultForPersonNode:questionMetricType:](self, "_relatonshipInferenceResultForPersonNode:questionMetricType:", a3, a4);
  else
    return -[PGPhotosChallengeMetricEvent _relationshipTagInferenceResultForPersonNode:questionMetricType:](self, "_relationshipTagInferenceResultForPersonNode:questionMetricType:", a3, a4);
}

- (BOOL)_relationshipTagInferenceResultForPersonNode:(id)a3 questionMetricType:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  unint64_t v7;
  char v8;

  v4 = a4;
  v6 = a3;
  v7 = -[PGPhotosChallengeMetricEvent _relationshipTagFromQuestionMetricType:](self, "_relationshipTagFromQuestionMetricType:", v4);
  if (v7)
    v8 = objc_msgSend(v6, "isTaggedWithRelationship:withConfidence:", v7, 0.5);
  else
    v8 = 0;

  return v8;
}

- (BOOL)_relatonshipInferenceResultForPersonNode:(id)a3 questionMetricType:(unsigned __int16)a4
{
  int v4;
  id v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  switch(v4)
  {
    case 'N':
      v7 = objc_msgSend(v5, "isInferredMemberOfMyFamily");
      goto LABEL_17;
    case 'O':
      v7 = objc_msgSend(v5, "isMyInferredFriend");
      goto LABEL_17;
    case 'P':
      v7 = objc_msgSend(v5, "isMyInferredCoworker");
      goto LABEL_17;
    case 'Q':
      v7 = objc_msgSend(v5, "isMyInferredPartner");
      goto LABEL_17;
    case 'R':
      v7 = objc_msgSend(v5, "isMyInferredParent");
      goto LABEL_17;
    case 'S':
      v7 = objc_msgSend(v5, "isMyInferredSibling");
      goto LABEL_17;
    case 'T':
      v7 = objc_msgSend(v5, "isMyInferredChild");
      goto LABEL_17;
    case 'U':
      objc_msgSend(v5, "graph");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "meNodeWithFallbackInferredMeNode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToNode:", v10);

      break;
    case 'V':
      v7 = objc_msgSend(v5, "isMyInferredMother");
      goto LABEL_17;
    case 'W':
      v7 = objc_msgSend(v5, "isMyInferredFather");
      goto LABEL_17;
    case 'X':
      v7 = objc_msgSend(v5, "isMyInferredSon");
      goto LABEL_17;
    case 'Y':
      v7 = objc_msgSend(v5, "isMyInferredDaughter");
      goto LABEL_17;
    case 'Z':
      v7 = objc_msgSend(v5, "isMyInferredBrother");
      goto LABEL_17;
    case '[':
      v7 = objc_msgSend(v5, "isMyInferredSister");
LABEL_17:
      v8 = v7;
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (id)_relationshipInferenceResultsForQuestionMetricType:(unsigned __int16)a3 personUUIDs:(id)a4 useGraphInference:(BOOL)a5
{
  id v8;
  void *v9;
  PGManagerWorkingContext *workingContext;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  unsigned __int16 v19;
  BOOL v20;

  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  workingContext = self->_workingContext;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __113__PGPhotosChallengeMetricEvent__relationshipInferenceResultsForQuestionMetricType_personUUIDs_useGraphInference___block_invoke;
  v16[3] = &unk_1E8435488;
  v16[4] = self;
  v17 = v8;
  v19 = a3;
  v20 = a5;
  v11 = v9;
  v18 = v11;
  v12 = v8;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v16);
  v13 = v18;
  v14 = v11;

  return v14;
}

- (void)_gatherMetricsForBusinessQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double v8;
  double v9;
  void *v10;
  void *v11;
  double Current;
  void *v13;
  double v14;
  NSObject *v15;
  PGPrecisionRecallEvaluation *v16;
  void *v17;
  char v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  v8 = 0.0;
  if (!v7 || (v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    -[PGPhotosChallengeMetricEvent _groundTruthForBusinessFromQuestions:](self, "_groundTruthForBusinessFromQuestions:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 1150;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        v8 = Current;
      }
      -[PGPhotosChallengeMetricEvent _businessInferenceResultsForBusinessIdByAssetIds:](self, "_businessInferenceResultsForBusinessIdByAssetIds:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFAbsoluteTimeGetCurrent();
      if (v14 - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          *(_DWORD *)buf = 67109378;
          v20 = 1153;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v15 = MEMORY[0x1E0C81028];
LABEL_24:
          _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_25;
        }
        v8 = v14;
      }
    }
    else
    {
      -[PGPhotosChallengeMetricEvent _businessInferenceResultsForBusinessIdByAssetIds:](self, "_businessInferenceResultsForBusinessIdByAssetIds:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("business"), CFSTR("business"));
    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v16);

    -[PGPhotosChallengeMetricEvent evaluation](self, "evaluation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "evaluateWithGroundTruthResults:andInferenceResults:", v10, v13);

    if (!v7)
      goto LABEL_25;
    if (CFAbsoluteTimeGetCurrent() - v8 < 0.01)
      goto LABEL_25;
    v18 = 0;
    v7[2](v7, &v18, 1.0);
    if (!v18 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_25;
    *(_DWORD *)buf = 67109378;
    v20 = 1157;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_24;
  }
  v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v20 = 1146;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:

}

- (id)_groundTruthForBusinessFromQuestions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  NSObject *v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v25;
    *(_QWORD *)&v7 = 138412290;
    v22 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "entityIdentifier", v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "assetByAssetIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v11, "additionalInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("businessUUID"));
          v17 = objc_claimAutoreleasedReturnValue();

          v28 = v12;
          v29 = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "state") == 2)
            v19 = MEMORY[0x1E0C9AAB0];
          else
            v19 = MEMORY[0x1E0C9AAA0];
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v18);

        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "loggingConnection");
          v17 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            v31 = v12;
            _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Failed to find asset with uuid: '%@'", buf, 0xCu);
          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_businessInferenceResultsForBusinessIdByAssetIds:(id)a3
{
  id v4;
  void *v5;
  PGManagerWorkingContext *workingContext;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__PGPhotosChallengeMetricEvent__businessInferenceResultsForBusinessIdByAssetIds___block_invoke;
  v12[3] = &unk_1E84354B0;
  v12[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (void)_gatherMetricsForPublicEventQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double v8;
  double v9;
  void *v10;
  void *v11;
  double Current;
  void *v13;
  double v14;
  NSObject *v15;
  PGPrecisionRecallEvaluation *v16;
  void *v17;
  char v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  v8 = 0.0;
  if (!v7 || (v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    -[PGPhotosChallengeMetricEvent _groundTruthForPublicEventFromQuestions:](self, "_groundTruthForPublicEventFromQuestions:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 1228;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        v8 = Current;
      }
      -[PGPhotosChallengeMetricEvent _publicEventInferenceResultsForPublicEventIdByAssetIds:](self, "_publicEventInferenceResultsForPublicEventIdByAssetIds:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFAbsoluteTimeGetCurrent();
      if (v14 - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          *(_DWORD *)buf = 67109378;
          v20 = 1231;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v15 = MEMORY[0x1E0C81028];
LABEL_24:
          _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_25;
        }
        v8 = v14;
      }
    }
    else
    {
      -[PGPhotosChallengeMetricEvent _publicEventInferenceResultsForPublicEventIdByAssetIds:](self, "_publicEventInferenceResultsForPublicEventIdByAssetIds:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("publicEvent"), CFSTR("publicEvent"));
    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v16);

    -[PGPhotosChallengeMetricEvent evaluation](self, "evaluation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "evaluateWithGroundTruthResults:andInferenceResults:", v10, v13);

    if (!v7)
      goto LABEL_25;
    if (CFAbsoluteTimeGetCurrent() - v8 < 0.01)
      goto LABEL_25;
    v18 = 0;
    v7[2](v7, &v18, 1.0);
    if (!v18 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_25;
    *(_DWORD *)buf = 67109378;
    v20 = 1235;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_24;
  }
  v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v20 = 1224;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:

}

- (id)_groundTruthForPublicEventFromQuestions:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  NSObject *v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v27;
    *(_QWORD *)&v6 = 138412290;
    v23 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "entityIdentifier", v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "assetByAssetIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v10, "additionalInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("publicEventMUID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v17, "unsignedIntegerValue"));
          v18 = objc_claimAutoreleasedReturnValue();

          v30 = v11;
          v31 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "state") == 2)
            v20 = MEMORY[0x1E0C9AAB0];
          else
            v20 = MEMORY[0x1E0C9AAA0];
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v20, v19);

        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "loggingConnection");
          v18 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v23;
            v33 = v11;
            _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "Failed to find asset with uuid: '%@'", buf, 0xCu);
          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v7);
  }

  return v25;
}

- (id)_publicEventInferenceResultsForPublicEventIdByAssetIds:(id)a3
{
  id v4;
  void *v5;
  PGManagerWorkingContext *workingContext;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__PGPhotosChallengeMetricEvent__publicEventInferenceResultsForPublicEventIdByAssetIds___block_invoke;
  v12[3] = &unk_1E84354B0;
  v12[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (void)_gatherMetricsForTripKeyQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double v8;
  double Current;
  NSObject *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  PGPrecisionRecallEvaluation *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  unsigned __int8 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  v8 = 0.0;
  if (v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v38 = 0;
      v7[2](v7, &v38, 0.0);
      if (v38)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v41 = 1302;
          v42 = 2080;
          v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v10 = MEMORY[0x1E0C81028];
LABEL_33:
          _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_34;
        }
        goto LABEL_34;
      }
      v8 = Current;
    }
  }
  v11 = objc_msgSend(v6, "count");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v6;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v12)
  {
    v13 = v12;
    v30 = v6;
    v31 = 0;
    v32 = 0;
    v14 = 1.0 / (double)v11;
    v15 = *(_QWORD *)v35;
    v16 = 0.0;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v16 = v14 + v16;
        if (v7)
        {
          v19 = CFAbsoluteTimeGetCurrent();
          if (v19 - v8 >= 0.01)
          {
            buf[0] = 0;
            v7[2](v7, buf, v16);
            if (buf[0])
            {
              v26 = 1;
              v8 = v19;
              goto LABEL_26;
            }
            v8 = v19;
          }
        }
        -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache", v30);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "tripKeyAssetIdentifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "entityIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "containsObject:", v22);

        if (v23)
        {
          if (objc_msgSend(v18, "state") == 2)
          {
            ++v32;
          }
          else
          {
            v24 = objc_msgSend(v18, "state");
            v25 = v31;
            if (v24 == 3)
              v25 = v31 + 1;
            v31 = v25;
          }
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v13)
        continue;
      break;
    }
    v26 = 0;
LABEL_26:
    v6 = v30;
    v27 = v31;
    v28 = v32;
  }
  else
  {
    v28 = 0;
    v27 = 0;
    v26 = 0;
  }

  v29 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:truePositives:falsePositives:falseNegatives:trueNegatives:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:truePositives:falsePositives:falseNegatives:trueNegatives:", CFSTR("tripKeyAsset"), CFSTR("tripKeyAsset"), v28, v27, 0, 0);
  -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v29);

  if (v7)
  {
    if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
    {
      v38 = 0;
      v7[2](v7, &v38, 1.0);
      if (v38 | v26)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v41 = 1325;
          v42 = 2080;
          v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v10 = MEMORY[0x1E0C81028];
          goto LABEL_33;
        }
      }
    }
  }
LABEL_34:

}

- (void)_gatherMetricsForHolidayQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double v8;
  double v9;
  void *v10;
  void *v11;
  double Current;
  void *v13;
  double v14;
  NSObject *v15;
  PGPrecisionRecallEvaluation *v16;
  void *v17;
  char v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  v8 = 0.0;
  if (!v7 || (v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    -[PGPhotosChallengeMetricEvent _groundTruthForHolidayFromQuestions:](self, "_groundTruthForHolidayFromQuestions:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 1336;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        v8 = Current;
      }
      -[PGPhotosChallengeMetricEvent _holidayInferenceResultsForHolidayNameByAssetIds:](self, "_holidayInferenceResultsForHolidayNameByAssetIds:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFAbsoluteTimeGetCurrent();
      if (v14 - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          *(_DWORD *)buf = 67109378;
          v20 = 1339;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v15 = MEMORY[0x1E0C81028];
LABEL_24:
          _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_25;
        }
        v8 = v14;
      }
    }
    else
    {
      -[PGPhotosChallengeMetricEvent _holidayInferenceResultsForHolidayNameByAssetIds:](self, "_holidayInferenceResultsForHolidayNameByAssetIds:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("holiday"), CFSTR("holiday"));
    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v16);

    -[PGPhotosChallengeMetricEvent evaluation](self, "evaluation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "evaluateWithGroundTruthResults:andInferenceResults:", v10, v13);

    if (!v7)
      goto LABEL_25;
    if (CFAbsoluteTimeGetCurrent() - v8 < 0.01)
      goto LABEL_25;
    v18 = 0;
    v7[2](v7, &v18, 1.0);
    if (!v18 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_25;
    *(_DWORD *)buf = 67109378;
    v20 = 1343;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_24;
  }
  v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v20 = 1332;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:

}

- (id)_groundTruthForHolidayFromQuestions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  NSObject *v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v25;
    *(_QWORD *)&v7 = 138412290;
    v22 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "entityIdentifier", v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "assetByAssetIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v11, "additionalInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("holidayName"));
          v17 = objc_claimAutoreleasedReturnValue();

          v28 = v12;
          v29 = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "state") == 2)
            v19 = MEMORY[0x1E0C9AAB0];
          else
            v19 = MEMORY[0x1E0C9AAA0];
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v18);

        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "loggingConnection");
          v17 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            v31 = v12;
            _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Failed to find asset with uuid: '%@'", buf, 0xCu);
          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_holidayInferenceResultsForHolidayNameByAssetIds:(id)a3
{
  id v4;
  void *v5;
  PGManagerWorkingContext *workingContext;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__PGPhotosChallengeMetricEvent__holidayInferenceResultsForHolidayNameByAssetIds___block_invoke;
  v12[3] = &unk_1E84354B0;
  v12[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (void)_gatherMetricsForFrequentLocationQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  id v7;
  void (**v8)(void *, _BYTE *, double);
  double Current;
  double v10;
  double v11;
  NSObject *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  NSObject *v19;
  PGPrecisionRecallEvaluation *v20;
  void *v21;
  char v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(void *, _BYTE *, double))_Block_copy(a5);
  if (!v8)
  {
    v10 = 0.0;
    goto LABEL_14;
  }
  Current = CFAbsoluteTimeGetCurrent();
  v10 = 0.0;
  if (Current >= 0.01)
  {
    v11 = Current;
    v22 = 0;
    v8[2](v8, &v22, 0.0);
    if (v22)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v24 = 1409;
        v25 = 2080;
        v26 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGPhotosChallengeMetricEvent.m";
        v12 = MEMORY[0x1E0C81028];
LABEL_12:
        _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_34;
      }
      goto LABEL_34;
    }
    v10 = v11;
  }
  v13 = CFAbsoluteTimeGetCurrent();
  if (v13 - v10 < 0.01)
  {
LABEL_14:
    -[PGPhotosChallengeMetricEvent _groundTruthForFrequentLocationFromQuestions:](self, "_groundTruthForFrequentLocationFromQuestions:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v16 = CFAbsoluteTimeGetCurrent();
      if (v16 - v10 >= 0.01)
      {
        v22 = 0;
        v8[2](v8, &v22, 0.5);
        if (v22)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v24 = 1417;
            v25 = 2080;
            v26 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_33;
        }
        v10 = v16;
      }
      -[PGPhotosChallengeMetricEvent _frequentLocationInferenceResultsForLocationByAssetIds:locationType:](self, "_frequentLocationInferenceResultsForLocationByAssetIds:locationType:", v15, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFAbsoluteTimeGetCurrent();
      if (v18 - v10 >= 0.01)
      {
        v22 = 0;
        v8[2](v8, &v22, 0.9);
        if (v22)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_32:

LABEL_33:
            goto LABEL_34;
          }
          *(_DWORD *)buf = 67109378;
          v24 = 1420;
          v25 = 2080;
          v26 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v19 = MEMORY[0x1E0C81028];
LABEL_31:
          _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_32;
        }
        v10 = v18;
      }
    }
    else
    {
      -[PGPhotosChallengeMetricEvent _frequentLocationInferenceResultsForLocationByAssetIds:locationType:](self, "_frequentLocationInferenceResultsForLocationByAssetIds:locationType:", v15, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("frequentlocation"), CFSTR("locationType"));
    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v20);

    -[PGPhotosChallengeMetricEvent evaluation](self, "evaluation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "evaluateWithGroundTruthResults:andInferenceResults:", v14, v17);

    if (!v8)
      goto LABEL_32;
    if (CFAbsoluteTimeGetCurrent() - v10 < 0.01)
      goto LABEL_32;
    v22 = 0;
    v8[2](v8, &v22, 1.0);
    if (!v22 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_32;
    *(_DWORD *)buf = 67109378;
    v24 = 1424;
    v25 = 2080;
    v26 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    v19 = MEMORY[0x1E0C81028];
    goto LABEL_31;
  }
  v22 = 0;
  v8[2](v8, &v22, 0.1);
  if (!v22)
  {
    v10 = v13;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v24 = 1413;
    v25 = 2080;
    v26 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    v12 = MEMORY[0x1E0C81028];
    goto LABEL_12;
  }
LABEL_34:

}

- (id)_groundTruthForFrequentLocationFromQuestions:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v42;
    v8 = *MEMORY[0x1E0D77FD0];
    v37 = *MEMORY[0x1E0D78028];
    v35 = *MEMORY[0x1E0D78048];
    v36 = *MEMORY[0x1E0D78030];
    v34 = *MEMORY[0x1E0D78058];
    *(_QWORD *)&v5 = 138412290;
    v33 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if (objc_msgSend(v10, "state", v33) == 2)
        {
          objc_msgSend(v10, "additionalInfo");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v10, "entityIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "assetByAssetIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              objc_msgSend(v10, "additionalInfo");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", v8);
              v18 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v10, "additionalInfo");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", v37);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v10, "additionalInfo");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKeyedSubscript:", v36);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              v23 = objc_alloc(MEMORY[0x1E0C9E3B8]);
              objc_msgSend(v20, "doubleValue");
              v25 = v24;
              objc_msgSend(v22, "doubleValue");
              v27 = (void *)objc_msgSend(v23, "initWithLatitude:longitude:", v25, v26);
              v45 = v13;
              v46 = v27;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if ((-[NSObject isEqualToString:](v18, "isEqualToString:", v35) & 1) != 0
                || (v29 = -[NSObject isEqualToString:](v18, "isEqualToString:", v34), v30 = MEMORY[0x1E0C9AAA0], v29))
              {
                v30 = MEMORY[0x1E0C9AAB0];
              }
              objc_msgSend(v38, "setObject:forKeyedSubscript:", v30, v28);

            }
            else
            {
              +[PGLogging sharedLogging](PGLogging, "sharedLogging");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "loggingConnection");
              v18 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v33;
                v48 = v13;
                _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "Failed to find asset with uuid: '%@'", buf, 0xCu);
              }
            }

          }
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v6);
  }

  return v38;
}

- (id)_frequentLocationInferenceResultsForLocationByAssetIds:(id)a3 locationType:(id)a4
{
  id v6;
  id v7;
  PGManagerWorkingContext *workingContext;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__65140;
  v19 = __Block_byref_object_dispose__65141;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __100__PGPhotosChallengeMetricEvent__frequentLocationInferenceResultsForLocationByAssetIds_locationType___block_invoke;
  v12[3] = &unk_1E8435578;
  v9 = v6;
  v13 = v9;
  v14 = &v15;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v12);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)_gatherMetricsForNamingQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double v8;
  double v9;
  void *v10;
  void *v11;
  double Current;
  void *v13;
  double v14;
  NSObject *v15;
  PGPrecisionRecallEvaluation *v16;
  void *v17;
  char v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  v8 = 0.0;
  if (!v7 || (v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    -[PGPhotosChallengeMetricEvent _groundTruthForNamingFromQuestions:](self, "_groundTruthForNamingFromQuestions:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 1508;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        v8 = Current;
      }
      -[PGPhotosChallengeMetricEvent _namingInferenceResultsForContactIdentifierByPersonUUIDs:](self, "_namingInferenceResultsForContactIdentifierByPersonUUIDs:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFAbsoluteTimeGetCurrent();
      if (v14 - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          *(_DWORD *)buf = 67109378;
          v20 = 1511;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v15 = MEMORY[0x1E0C81028];
LABEL_24:
          _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_25;
        }
        v8 = v14;
      }
    }
    else
    {
      -[PGPhotosChallengeMetricEvent _namingInferenceResultsForContactIdentifierByPersonUUIDs:](self, "_namingInferenceResultsForContactIdentifierByPersonUUIDs:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("naming"), CFSTR("naming"));
    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v16);

    -[PGPhotosChallengeMetricEvent evaluation](self, "evaluation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "evaluateWithGroundTruthResults:andInferenceResults:", v10, v13);

    if (!v7)
      goto LABEL_25;
    if (CFAbsoluteTimeGetCurrent() - v8 < 0.01)
      goto LABEL_25;
    v18 = 0;
    v7[2](v7, &v18, 1.0);
    if (!v18 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_25;
    *(_DWORD *)buf = 67109378;
    v20 = 1515;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_24;
  }
  v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v20 = 1504;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:

}

- (id)_groundTruthForNamingFromQuestions:(id)a3
{
  id v4;
  void *v5;
  PGManagerWorkingContext *workingContext;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__PGPhotosChallengeMetricEvent__groundTruthForNamingFromQuestions___block_invoke;
  v12[3] = &unk_1E84354B0;
  v12[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (id)_namingInferenceResultsForContactIdentifierByPersonUUIDs:(id)a3
{
  id v4;
  void *v5;
  PGManagerWorkingContext *workingContext;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89__PGPhotosChallengeMetricEvent__namingInferenceResultsForContactIdentifierByPersonUUIDs___block_invoke;
  v12[3] = &unk_1E84354B0;
  v12[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (void)_gatherMetricsForAgeCategoryQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double v8;
  double v9;
  void *v10;
  void *v11;
  double Current;
  void *v13;
  double v14;
  NSObject *v15;
  PGPrecisionRecallEvaluation *v16;
  void *v17;
  char v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  v8 = 0.0;
  if (!v7 || (v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    -[PGPhotosChallengeMetricEvent _groundTruthForAgeCategoryFromQuestions:](self, "_groundTruthForAgeCategoryFromQuestions:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 1586;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        v8 = Current;
      }
      -[PGPhotosChallengeMetricEvent _ageCategoryInferenceResultsForAgeCategoryByPersonUUIDs:](self, "_ageCategoryInferenceResultsForAgeCategoryByPersonUUIDs:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFAbsoluteTimeGetCurrent();
      if (v14 - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          *(_DWORD *)buf = 67109378;
          v20 = 1589;
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v15 = MEMORY[0x1E0C81028];
LABEL_24:
          _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_25;
        }
        v8 = v14;
      }
    }
    else
    {
      -[PGPhotosChallengeMetricEvent _ageCategoryInferenceResultsForAgeCategoryByPersonUUIDs:](self, "_ageCategoryInferenceResultsForAgeCategoryByPersonUUIDs:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("ageCategory"), CFSTR("ageCategory"));
    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v16);

    -[PGPhotosChallengeMetricEvent evaluation](self, "evaluation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "evaluateWithGroundTruthResults:andInferenceResults:", v10, v13);

    if (!v7)
      goto LABEL_25;
    if (CFAbsoluteTimeGetCurrent() - v8 < 0.01)
      goto LABEL_25;
    v18 = 0;
    v7[2](v7, &v18, 1.0);
    if (!v18 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_25;
    *(_DWORD *)buf = 67109378;
    v20 = 1593;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_24;
  }
  v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v20 = 1582;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:

}

- (id)_groundTruthForAgeCategoryFromQuestions:(id)a3
{
  id v4;
  void *v5;
  PGManagerWorkingContext *workingContext;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__PGPhotosChallengeMetricEvent__groundTruthForAgeCategoryFromQuestions___block_invoke;
  v12[3] = &unk_1E84354B0;
  v12[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (id)_ageCategoryInferenceResultsForAgeCategoryByPersonUUIDs:(id)a3
{
  id v4;
  void *v5;
  PGManagerWorkingContext *workingContext;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__PGPhotosChallengeMetricEvent__ageCategoryInferenceResultsForAgeCategoryByPersonUUIDs___block_invoke;
  v12[3] = &unk_1E84354B0;
  v12[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (void)_gatherMetricsForPetQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void *, _BYTE *, double);
  double v9;
  double v10;
  PGManagerWorkingContext *workingContext;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double Current;
  void *v18;
  void *v19;
  double v20;
  NSObject *v21;
  PGPrecisionRecallEvaluation *v22;
  void *v23;
  char v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[5];
  int v33;
  int v34;
  __int16 v35;
  const char *v36;
  uint64_t buf;
  __int128 v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(void *, _BYTE *, double))_Block_copy(v7);
  v9 = 0.0;
  if (!v8 || (v10 = CFAbsoluteTimeGetCurrent(), v10 < 0.01))
  {
LABEL_7:
    buf = 0;
    *(_QWORD *)&v38 = &buf;
    *((_QWORD *)&v38 + 1) = 0x3032000000;
    v39 = __Block_byref_object_copy__65140;
    v40 = __Block_byref_object_dispose__65141;
    workingContext = self->_workingContext;
    v12 = MEMORY[0x1E0C809B0];
    v41 = (id)MEMORY[0x1E0C9AA60];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __76__PGPhotosChallengeMetricEvent__gatherMetricsForPetQuestions_progressBlock___block_invoke;
    v32[3] = &unk_1E84355C8;
    v32[4] = &buf;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v32);
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__65140;
    v30 = __Block_byref_object_dispose__65141;
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = *(void **)(v38 + 40);
    v25[0] = v12;
    v25[1] = 3221225472;
    v25[2] = __76__PGPhotosChallengeMetricEvent__gatherMetricsForPetQuestions_progressBlock___block_invoke_2;
    v25[3] = &unk_1E84355F0;
    v25[4] = &v26;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v25);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("entityIdentifier"), v27[5]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGPhotosChallengeMetricEvent _deleteOutdatedPetQuestionsWithValidPetUUIDs:](self, "_deleteOutdatedPetQuestionsWithValidPetUUIDs:", v27[5]);
    -[PGPhotosChallengeMetricEvent _groundTruthForCurrentPetInferenceFromQuestions:](self, "_groundTruthForCurrentPetInferenceFromQuestions:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v9 >= 0.01)
      {
        v24 = 0;
        v8[2](v8, &v24, 0.5);
        if (v24)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v33 = 67109378;
            v34 = 1674;
            v35 = 2080;
            v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v33, 0x12u);
          }
          goto LABEL_26;
        }
        v9 = Current;
      }
    }
    objc_msgSend(v16, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPhotosChallengeMetricEvent _currentPetInferenceResultsForPetUUIDs:](self, "_currentPetInferenceResultsForPetUUIDs:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v20 = CFAbsoluteTimeGetCurrent();
      if (v20 - v9 >= 0.01)
      {
        v24 = 0;
        v8[2](v8, &v24, 0.9);
        if (v24)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_25:

LABEL_26:
            _Block_object_dispose(&v26, 8);

            _Block_object_dispose(&buf, 8);
            goto LABEL_27;
          }
          v33 = 67109378;
          v34 = 1677;
          v35 = 2080;
          v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v21 = MEMORY[0x1E0C81028];
LABEL_24:
          _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v33, 0x12u);
          goto LABEL_25;
        }
        v9 = v20;
      }
    }
    v22 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("pet"), CFSTR("pet"));
    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v22);

    -[PGPhotosChallengeMetricEvent evaluation](self, "evaluation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "evaluateWithGroundTruthResults:andInferenceResults:", v16, v19);

    if (!v8)
      goto LABEL_25;
    if (CFAbsoluteTimeGetCurrent() - v9 < 0.01)
      goto LABEL_25;
    v24 = 0;
    v8[2](v8, &v24, 1.0);
    if (!v24 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_25;
    v33 = 67109378;
    v34 = 1681;
    v35 = 2080;
    v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    v21 = MEMORY[0x1E0C81028];
    goto LABEL_24;
  }
  LOBYTE(v26) = 0;
  ((void (**)(void *, uint64_t *, double))v8)[2](v8, &v26, 0.0);
  if (!(_BYTE)v26)
  {
    v9 = v10;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 0x67704000202;
    LOWORD(v38) = 2080;
    *(_QWORD *)((char *)&v38 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_27:

}

- (id)_groundTruthForCurrentPetInferenceFromQuestions:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    v8 = *MEMORY[0x1E0D77FD0];
    v9 = *MEMORY[0x1E0D780C8];
    v10 = (void *)MEMORY[0x1E0C9AAA0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "additionalInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v12, "state");
        v16 = v10;
        if (v15 == 2)
        {
          v17 = objc_msgSend(v14, "isEqualToString:", v9);
          v16 = (void *)MEMORY[0x1E0C9AAB0];
          if (!v17)
            v16 = v10;
        }
        v18 = v16;
        objc_msgSend(v12, "entityIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v19);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)_currentPetInferenceResultsForPetUUIDs:(id)a3
{
  id v4;
  void *v5;
  PGManagerWorkingContext *workingContext;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PGPhotosChallengeMetricEvent__currentPetInferenceResultsForPetUUIDs___block_invoke;
  v12[3] = &unk_1E8435640;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (void)_deleteOutdatedPetQuestionsWithValidPetUUIDs:(id)a3
{
  PGManagerWorkingContext *workingContext;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  workingContext = self->_workingContext;
  v4 = a3;
  -[PGManagerWorkingContext photoLibrary](workingContext, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("type"), 13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("displayType"), 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("entityIdentifier"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3528];
  v23[0] = v7;
  v23[1] = v8;
  v23[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v12);

  objc_msgSend(MEMORY[0x1E0CD1720], "fetchQuestionsWithOptions:validQuestionsOnly:", v6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__PGPhotosChallengeMetricEvent__deleteOutdatedPetQuestionsWithValidPetUUIDs___block_invoke;
  v19[3] = &unk_1E8435668;
  v14 = v13;
  v20 = v14;
  v18 = 0;
  objc_msgSend(v5, "performChangesAndWait:error:", v19, &v18);
  v15 = v18;
  if (v15)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "loggingConnection");
    v17 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v15;
      _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Error deleting outdated pet questions: %@", buf, 0xCu);
    }

  }
}

- (void)_gatherMetricsForPetKnowledgeQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double v8;
  double Current;
  NSObject *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  void *v21;
  double v22;
  PGPrecisionRecallEvaluation *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  uint8_t v29[128];
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  v8 = 0.0;
  if (v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v28 = 0;
      v7[2](v7, &v28, 0.0);
      if (v28)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v31 = 1754;
          v32 = 2080;
          v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v10 = MEMORY[0x1E0C81028];
LABEL_32:
          _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_33;
        }
        goto LABEL_33;
      }
      v8 = Current;
    }
  }
  v11 = objc_msgSend(v6, "count");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = 1.0 / (double)v11;
    v18 = *(_QWORD *)v25;
    v19 = 0.0;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v12);
        v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v19 = v17 + v19;
        if (v7)
        {
          v22 = CFAbsoluteTimeGetCurrent();
          if (v22 - v8 >= 0.01)
          {
            v28 = 0;
            v7[2](v7, &v28, v19);
            if (v28)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                v31 = 1763;
                v32 = 2080;
                v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_33;
            }
            v8 = v22;
          }
        }
        if (objc_msgSend(v21, "state", (_QWORD)v24) == 2)
        {
          ++v15;
        }
        else if (objc_msgSend(v21, "state") == 3)
        {
          ++v16;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }

  v23 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:truePositives:falsePositives:falseNegatives:trueNegatives:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:truePositives:falsePositives:falseNegatives:trueNegatives:", CFSTR("petKnowledge"), CFSTR("petKnowledge"), v15, v16, 0, 0);
  -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v23);

  if (v7)
  {
    if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
    {
      v28 = 0;
      v7[2](v7, &v28, 0.0);
      if (v28)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v31 = 1775;
          v32 = 2080;
          v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v10 = MEMORY[0x1E0C81028];
          goto LABEL_32;
        }
      }
    }
  }
LABEL_33:

}

- (void)_gatherMetricsForMemoryQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  id v7;
  void (**v8)(void *, _BYTE *, double);
  double v9;
  double Current;
  NSObject *v11;
  unint64_t v12;
  __int128 v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void (**v27)(void *, _BYTE *, double);
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  PGPrecisionRecallEvaluation *v38;
  __int128 v39;
  id v40;
  uint64_t v41;
  PGPhotosChallengeMetricEvent *v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id obj;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  char v53;
  uint8_t v54[128];
  uint8_t buf[4];
  _BYTE v56[14];
  uint64_t v57;

  v43 = a4;
  v57 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(void *, _BYTE *, double))_Block_copy(a5);
  v9 = 0.0;
  if (v8)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v53 = 0;
      v8[2](v8, &v53, 0.0);
      if (v53)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v56 = 1782;
          *(_WORD *)&v56[4] = 2080;
          *(_QWORD *)&v56[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v11 = MEMORY[0x1E0C81028];
LABEL_48:
          _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_49;
        }
        goto LABEL_49;
      }
      v9 = Current;
    }
  }
  v12 = objc_msgSend(v7, "count");
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v40 = v7;
  obj = v7;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v48)
  {
    v44 = 0;
    v45 = 0;
    v14 = 1.0 / (double)v12;
    v15 = *(_QWORD *)v50;
    v16 = 0.0;
    *(_QWORD *)&v13 = 67109120;
    v39 = v13;
    v17 = v43;
    v41 = *(_QWORD *)v50;
    v42 = self;
    while (2)
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v50 != v15)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v16 = v14 + v16;
        if (v8)
        {
          v20 = CFAbsoluteTimeGetCurrent();
          if (v20 - v9 >= 0.01)
          {
            v53 = 0;
            v8[2](v8, &v53, v16);
            if (v53)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v56 = 1791;
                *(_WORD *)&v56[4] = 2080;
                *(_QWORD *)&v56[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              v7 = v40;
              goto LABEL_49;
            }
            v9 = v20;
          }
        }
        objc_msgSend(v19, "entityIdentifier", v39);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "memoryByMemoryIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          if ((_DWORD)v17 == 116)
          {
            if (objc_msgSend(v19, "state") == 2)
              ++v44;
            else
              ++v45;
          }
          else
          {
            v27 = v8;
            v28 = objc_msgSend(v24, "category");
            v46 = objc_msgSend(v24, "subcategory");
            -[PGPhotosChallengeMetricEvent memoryCategorySubCategoryByQuestionMetricType](self, "memoryCategorySubCategoryByQuestionMetricType");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v17);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKeyedSubscript:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v31)
            {
              +[PGLogging sharedLogging](PGLogging, "sharedLogging");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "loggingConnection");
              v33 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v39;
                *(_DWORD *)v56 = v17;
                _os_log_error_impl(&dword_1CA237000, v33, OS_LOG_TYPE_ERROR, "QuestionMetricType %d has no MemoryCategory/SubCategory pairs", buf, 8u);
              }

            }
            objc_msgSend(v31, "firstObject");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "unsignedIntegerValue");

            objc_msgSend(v31, "lastObject");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "unsignedIntegerValue");

            if (v28 == v35)
            {
              v8 = v27;
              v15 = v41;
              if (v46 == v37)
              {
                v17 = v43;
                if (objc_msgSend(v19, "state") == 2)
                  ++v44;
                else
                  ++v45;
              }
              else
              {
                v17 = v43;
              }
            }
            else
            {
              v8 = v27;
              v17 = v43;
              v15 = v41;
            }

            self = v42;
          }
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "loggingConnection");
          v26 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v56 = v21;
            _os_log_error_impl(&dword_1CA237000, v26, OS_LOG_TYPE_ERROR, "No memory found for uuid %@ when collecting metrics for memory quality question.", buf, 0xCu);
          }

        }
      }
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      if (v48)
        continue;
      break;
    }
  }
  else
  {
    v44 = 0;
    v45 = 0;
  }

  v38 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:truePositives:falsePositives:falseNegatives:trueNegatives:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:truePositives:falsePositives:falseNegatives:trueNegatives:", CFSTR("memoryQuality"), CFSTR("memoryQuality"), v44, v45, 0, 0);
  -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v38);

  v7 = v40;
  if (v8)
  {
    if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
    {
      v53 = 0;
      v8[2](v8, &v53, 1.0);
      if (v53)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v56 = 1839;
          *(_WORD *)&v56[4] = 2080;
          *(_QWORD *)&v56[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v11 = MEMORY[0x1E0C81028];
          goto LABEL_48;
        }
      }
    }
  }
LABEL_49:

}

- (void)_gatherMetricsForMemoryMusicQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double Current;
  PGAssetsWithReasonPrecisionRecallEvaluation *v15;
  double v16;
  NSObject *v17;
  char v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  v8 = 0.0;
  if (!v7 || (v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    -[PGPhotosChallengeMetricEvent _groundTruthForMusicQualityQuestions:](self, "_groundTruthForMusicQualityQuestions:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPhotosChallengeMetricEvent _inferredResultsForEntityIdentifiers:withDefaultBoolValue:](self, "_inferredResultsForEntityIdentifiers:withDefaultBoolValue:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGPhotosChallengeMetricEvent _reasonResultByAssetEntityIdentifierForMusicQualityQuestions:](self, "_reasonResultByAssetEntityIdentifierForMusicQualityQuestions:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 1852;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        v8 = Current;
      }
    }
    v15 = -[PGAssetsWithReasonPrecisionRecallEvaluation initWithIdentifier:category:]([PGAssetsWithReasonPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("memoryMusicQuality"), CFSTR("memoryMusicQuality"));
    -[PGAssetsWithReasonPrecisionRecallEvaluation evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:](v15, "evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:", v10, v12, v13);
    if (v7)
    {
      v16 = CFAbsoluteTimeGetCurrent();
      if (v16 - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 1856;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            v17 = MEMORY[0x1E0C81028];
LABEL_24:
            _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_25:

LABEL_26:
          goto LABEL_27;
        }
        v8 = v16;
      }
      -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v15);
      if (CFAbsoluteTimeGetCurrent() - v8 < 0.01)
        goto LABEL_25;
      v18 = 0;
      v7[2](v7, &v18, 1.0);
      if (!v18 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_25;
      *(_DWORD *)buf = 67109378;
      v20 = 1859;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGPhotosChallengeMetricEvent.m";
      v17 = MEMORY[0x1E0C81028];
      goto LABEL_24;
    }
    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v15);
    goto LABEL_25;
  }
  v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v20 = 1846;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:

}

- (id)_groundTruthForMusicQualityQuestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C9AAA0];
    v10 = MEMORY[0x1E0C9AAB0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (_QWORD)v16) == 15)
        {
          objc_msgSend(v12, "entityIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "state") == 2)
            v14 = v10;
          else
            v14 = v9;
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_reasonResultByAssetEntityIdentifierForMusicQualityQuestions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v34;
    v7 = *MEMORY[0x1E0D77FD0];
    v29 = *MEMORY[0x1E0D780B8];
    v8 = *MEMORY[0x1E0D780B0];
    v30 = *MEMORY[0x1E0D77FD0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == 15)
        {
          v11 = objc_msgSend(v10, "state");
          v12 = CFSTR("NO");
          if (v11 == 2)
            v12 = CFSTR("YES");
          v13 = v12;
          objc_msgSend(v10, "additionalInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v10, "additionalInfo");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", v7);
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v17 = CFSTR("NA");
          }
          objc_msgSend(v10, "additionalInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v29);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v10, "additionalInfo");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v29);
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v21 = CFSTR("0");
          }
          objc_msgSend(v10, "additionalInfo");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v8);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v10, "additionalInfo");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v8);
            v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v25 = CFSTR("Unknown");
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[LikedSong:%@:%@->%@]-[Reason->%@]"), v25, v21, v13, v17);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "entityIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v26, v27);

          v7 = v30;
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v5);
  }

  return v31;
}

- (void)_gatherMetricsForFeaturedPhotoQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(void *, _BYTE *, double);
  double v10;
  double v11;
  void *v12;
  void *v13;
  double Current;
  void *v15;
  double v16;
  NSObject *v17;
  PGPrecisionRecallEvaluation *v18;
  void *v19;
  char v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(void *, _BYTE *, double))_Block_copy(a5);
  v10 = 0.0;
  if (!v9 || (v11 = CFAbsoluteTimeGetCurrent(), v11 < 0.01))
  {
LABEL_7:
    -[PGPhotosChallengeMetricEvent _groundTruthForFeaturedPhotoFromQuestions:](self, "_groundTruthForFeaturedPhotoFromQuestions:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v10 >= 0.01)
      {
        v20 = 0;
        v9[2](v9, &v20, 0.5);
        if (v20)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v22 = 1916;
            v23 = 2080;
            v24 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        v10 = Current;
      }
      -[PGPhotosChallengeMetricEvent _featuredPhotoInferenceResultsForAnswerDateByAssetIds:questionMetricType:](self, "_featuredPhotoInferenceResultsForAnswerDateByAssetIds:questionMetricType:", v13, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFAbsoluteTimeGetCurrent();
      if (v16 - v10 >= 0.01)
      {
        v20 = 0;
        v9[2](v9, &v20, 0.9);
        if (v20)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          *(_DWORD *)buf = 67109378;
          v22 = 1919;
          v23 = 2080;
          v24 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v17 = MEMORY[0x1E0C81028];
LABEL_24:
          _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_25;
        }
        v10 = v16;
      }
    }
    else
    {
      -[PGPhotosChallengeMetricEvent _featuredPhotoInferenceResultsForAnswerDateByAssetIds:questionMetricType:](self, "_featuredPhotoInferenceResultsForAnswerDateByAssetIds:questionMetricType:", v13, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("featuredPhoto"), CFSTR("featuredPhoto"));
    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v18);

    -[PGPhotosChallengeMetricEvent evaluation](self, "evaluation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "evaluateWithGroundTruthResults:andInferenceResults:", v12, v15);

    if (!v9)
      goto LABEL_25;
    if (CFAbsoluteTimeGetCurrent() - v10 < 0.01)
      goto LABEL_25;
    v20 = 0;
    v9[2](v9, &v20, 1.0);
    if (!v20 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_25;
    *(_DWORD *)buf = 67109378;
    v22 = 1923;
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    v17 = MEMORY[0x1E0C81028];
    goto LABEL_24;
  }
  v20 = 0;
  v9[2](v9, &v20, 0.0);
  if (!v20)
  {
    v10 = v11;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v22 = 1912;
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:

}

- (id)_groundTruthForFeaturedPhotoFromQuestions:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  NSObject *v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v27;
    v9 = *MEMORY[0x1E0D78010];
    *(_QWORD *)&v6 = 138412290;
    v23 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v11, "entityIdentifier", v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "assetByAssetIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v11, "additionalInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v9);
          v17 = objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v30 = v12;
            v31 = v17;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
            v18 = objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "state") == 2)
              v19 = MEMORY[0x1E0C9AAB0];
            else
              v19 = MEMORY[0x1E0C9AAA0];
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v19, v18);
          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "loggingConnection");
            v18 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "Featured photo question doesn't have the date when it was answered", buf, 2u);
            }
          }

        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "loggingConnection");
          v17 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v23;
            v33 = v12;
            _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Failed to find asset with uuid: '%@'", buf, 0xCu);
          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v7);
  }

  return v24;
}

- (id)_featuredPhotoInferenceResultsForAnswerDateByAssetIds:(id)a3 questionMetricType:(unsigned __int16)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PGLongTailSuggester *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  int v26;
  char v27;
  void *v28;
  PGLongTailSuggester *v30;
  id obj;
  id v32;
  uint64_t v33;
  int v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v34 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [PGLongTailSuggester alloc];
  -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "featuredPhotosSuggestionSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[PGAbstractSuggester initWithSession:](v11, "initWithSession:", v13);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v5;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v14)
  {
    v33 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v45 != v33)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v16, "allKeys");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "assetByAssetIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = 0;
        v41 = &v40;
        v42 = 0x2020000000;
        v43 = 0;
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __105__PGPhotosChallengeMetricEvent__featuredPhotoInferenceResultsForAnswerDateByAssetIds_questionMetricType___block_invoke;
        v36[3] = &unk_1E8435690;
        v36[4] = self;
        v39 = &v40;
        v24 = v23;
        v37 = v24;
        v25 = v20;
        v38 = v25;
        objc_msgSend(v35, "enumerateObjectsUsingBlock:", v36);
        if (v34 != 119)
        {
          v26 = *((unsigned __int8 *)v41 + 24);
LABEL_13:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26 != 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v28, v16);

          goto LABEL_14;
        }
        v26 = -[PGLongTailSuggester canGenerateSuggestionWithAsset:onDate:](v30, "canGenerateSuggestionWithAsset:onDate:", v24, v25);
        if (*((_BYTE *)v41 + 24))
          v27 = v26;
        else
          v27 = 1;
        if ((v27 & 1) != 0)
          goto LABEL_13;
LABEL_14:

        _Block_object_dispose(&v40, 8);
        objc_autoreleasePoolPop(v17);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v14);
  }

  return v32;
}

- (void)_gatherMetricsForSyndicatedAssetsQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double v8;
  double v9;
  void *v10;
  void *v11;
  double Current;
  void *v13;
  void *v14;
  double v15;
  double v16;
  PGAssetsWithReasonPrecisionRecallEvaluation *v17;
  char v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  v8 = 0.0;
  if (!v7 || (v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    -[PGPhotosChallengeMetricEvent _syndicatedAssetsGroundTruthByAssetIdentifiersFromQuestions:](self, "_syndicatedAssetsGroundTruthByAssetIdentifiersFromQuestions:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.3);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 2005;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_32;
        }
        v8 = Current;
      }
      -[PGPhotosChallengeMetricEvent _syndicatedAssetsInferenceResultsForAssetSyndicationIdentifiers:](self, "_syndicatedAssetsInferenceResultsForAssetSyndicationIdentifiers:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFAbsoluteTimeGetCurrent();
      if (v15 - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.6);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 2008;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_31;
        }
        v8 = v15;
      }
      -[PGPhotosChallengeMetricEvent _reasonResultByAssetSyndicationIdentifierForQuestions:](self, "_reasonResultByAssetSyndicationIdentifierForQuestions:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFAbsoluteTimeGetCurrent();
      if (v16 - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 2011;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_30:

LABEL_31:
LABEL_32:

          goto LABEL_33;
        }
        v8 = v16;
      }
    }
    else
    {
      -[PGPhotosChallengeMetricEvent _syndicatedAssetsInferenceResultsForAssetSyndicationIdentifiers:](self, "_syndicatedAssetsInferenceResultsForAssetSyndicationIdentifiers:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGPhotosChallengeMetricEvent _reasonResultByAssetSyndicationIdentifierForQuestions:](self, "_reasonResultByAssetSyndicationIdentifierForQuestions:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = -[PGAssetsWithReasonPrecisionRecallEvaluation initWithIdentifier:category:]([PGAssetsWithReasonPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("syndicatedAssets"), CFSTR("syndicatedAssets"));
    -[PGAssetsWithReasonPrecisionRecallEvaluation evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:](v17, "evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:", v10, v13, v14);
    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v17);
    if (v7)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 1.0);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 2016;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    goto LABEL_30;
  }
  v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v20 = 2001;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_33:

}

- (id)_syndicatedAssetsGroundTruthByAssetIdentifiersFromQuestions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[PGPhotosChallengeMetricEvent _syndicatedAssetFromQuestion:](self, "_syndicatedAssetFromQuestion:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[PGPhotosChallengeMetricEvent _groundTruthByAssetIdentifiersFromQuestions:](self, "_groundTruthByAssetIdentifiersFromQuestions:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_syndicatedAssetsInferenceResultsForAssetSyndicationIdentifiers:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9);
        -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "assetByAssetSyndicationIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "mediaAnalysisProperties");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (objc_msgSend(v14, "syndicationProcessingValue") & 0x7EF0) != 0;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)_reasonResultByAssetSyndicationIdentifierForQuestions:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int16 v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  int v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  id v46;
  id obj;
  uint64_t v48;
  id v49;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v49 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v51 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v57 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        -[PGPhotosChallengeMetricEvent _syndicatedAssetFromQuestion:](self, "_syndicatedAssetFromQuestion:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "mediaAnalysisProperties");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "syndicationProcessingValue");

          if ((v14 & 0x1000) == 0)
          {
            objc_msgSend(v51, "setObject:forKeyedSubscript:", v12, v10);
            if ((v14 & 0x7EF0) == 0)
            {
              objc_msgSend(v12, "localIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "setObject:forKeyedSubscript:", v12, v15);

            }
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v7);
  }

  objc_msgSend(v46, "allValues");
  v16 = objc_claimAutoreleasedReturnValue();
  -[PGPhotosChallengeMetricEvent curationSession](self, "curationSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "prepareAssets:", v16);

  v45 = (void *)v16;
  objc_msgSend(MEMORY[0x1E0CD1390], "prefetchScenesOnAssets:", v16);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v5;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v18)
  {
    v19 = v18;
    v50 = *(_QWORD *)v53;
    v48 = *MEMORY[0x1E0D77FD0];
    v20 = *MEMORY[0x1E0D71C58];
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v53 != v50)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        objc_msgSend(v51, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          objc_msgSend(v23, "mediaAnalysisProperties");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "syndicationProcessingValue");

          if (objc_msgSend(v22, "state") == 2)
            v27 = CFSTR("YES");
          else
            v27 = CFSTR("NO");
          v28 = v27;
          objc_msgSend(v22, "additionalInfo");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", v48);
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v30;
          v32 = CFSTR("None");
          if (v30)
            v32 = (__CFString *)v30;
          v33 = v32;

          v34 = v26 & 0x7EF0;
          if ((v26 & 0x7EF0) != 0)
            v35 = CFSTR("YES");
          else
            v35 = CFSTR("NO");
          v36 = v35;
          PHAssetMediaAnalysisSyndicationProcessingValueDescription();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v34)
          {
            objc_msgSend(v24, "curationModel");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = CFSTR("Meme/Document/Screenshot");
            if ((objc_msgSend(v38, "isMemeWithAsset:", v24) & 1) != 0
              || (v39 = CFSTR("NSFW"), (objc_msgSend(v38, "isVeryPreciselyIVSNSFWExplicitWithAsset:", v24) & 1) != 0)
              || (objc_msgSend(v24, "curationScore"), v39 = CFSTR("Low curation score"), v40 < v20))
            {

              v37 = (void *)v39;
            }

          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@->%@]-[%@->%@]"), v28, v33, v36, v37);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "curationProperties");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "syndicationIdentifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v49, "setObject:forKeyedSubscript:", v41, v43);
        }

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v19);
  }

  return v49;
}

- (id)_syndicatedAssetFromQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetByAssetSyndicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "curationProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "syndicationIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "loggingConnection");
      v18 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "uuid");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 138412290;
        v23 = v21;
        _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "Syndication identifier is nil for asset %@", (uint8_t *)&v22, 0xCu);

      }
      v10 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v8, "mediaAnalysisProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "syndicationProcessingVersion");

    if (v12 == *MEMORY[0x1E0CD1A98] || v12 == *MEMORY[0x1E0CD1AA0])
    {
      v19 = v8;
      goto LABEL_14;
    }
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "uuid");
      v15 = objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v15;
      _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "Syndicated asset not yet inferred: %@", (uint8_t *)&v22, 0xCu);

    }
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    objc_msgSend(v4, "entityIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    v22 = 138412290;
    v23 = v14;
    _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "Failed to find asset with syndication uuid: '%@'", (uint8_t *)&v22, 0xCu);
  }

LABEL_13:
  v19 = 0;
LABEL_14:

  return v19;
}

- (void)_gatherMetricsForTripTitlingQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double Current;
  PGAssetsWithReasonPrecisionRecallEvaluation *v15;
  double v16;
  NSObject *v17;
  char v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  v8 = 0.0;
  if (!v7 || (v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    -[PGPhotosChallengeMetricEvent _groundTruthForTripTitlingQuestions:](self, "_groundTruthForTripTitlingQuestions:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPhotosChallengeMetricEvent _inferredResultsForEntityIdentifiers:withDefaultBoolValue:](self, "_inferredResultsForEntityIdentifiers:withDefaultBoolValue:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGPhotosChallengeMetricEvent _tripTitlingReasonResultByAssetEntityIdentifierForQuestions:](self, "_tripTitlingReasonResultByAssetEntityIdentifierForQuestions:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 2134;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        v8 = Current;
      }
    }
    v15 = -[PGAssetsWithReasonPrecisionRecallEvaluation initWithIdentifier:category:]([PGAssetsWithReasonPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("tripTitling"), CFSTR("tripTitling"));
    -[PGAssetsWithReasonPrecisionRecallEvaluation evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:](v15, "evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:", v10, v12, v13);
    if (v7)
    {
      v16 = CFAbsoluteTimeGetCurrent();
      if (v16 - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 2138;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            v17 = MEMORY[0x1E0C81028];
LABEL_24:
            _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_25:

LABEL_26:
          goto LABEL_27;
        }
        v8 = v16;
      }
      -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v15);
      if (CFAbsoluteTimeGetCurrent() - v8 < 0.01)
        goto LABEL_25;
      v18 = 0;
      v7[2](v7, &v18, 1.0);
      if (!v18 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_25;
      *(_DWORD *)buf = 67109378;
      v20 = 2141;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGPhotosChallengeMetricEvent.m";
      v17 = MEMORY[0x1E0C81028];
      goto LABEL_24;
    }
    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v15);
    goto LABEL_25;
  }
  v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v20 = 2127;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:

}

- (id)_groundTruthForTripTitlingQuestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C9AAA0];
    v10 = MEMORY[0x1E0C9AAB0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (_QWORD)v16) == 26)
        {
          objc_msgSend(v12, "entityIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "state") == 2)
            v14 = v10;
          else
            v14 = v9;
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_tripTitlingReasonResultByAssetEntityIdentifierForQuestions:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    v8 = *MEMORY[0x1E0D78158];
    v9 = *MEMORY[0x1E0D77FD0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v11, "type") == 26 && v8 <= (int)objc_msgSend(v11, "questionVersion"))
        {
          v12 = objc_msgSend(v11, "state");
          v13 = CFSTR("NO");
          if (v12 == 2)
            v13 = CFSTR("YES");
          v14 = v13;
          objc_msgSend(v11, "additionalInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v11, "additionalInfo");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v9);
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v18 = CFSTR("SAME");
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[New->%@]-[Legacy->%@]"), v14, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "entityIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, v20);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  return v22;
}

- (void)_gatherMetricsForHighlightTitlingQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double Current;
  PGAssetsWithReasonPrecisionRecallEvaluation *v15;
  double v16;
  NSObject *v17;
  char v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  v8 = 0.0;
  if (!v7 || (v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    -[PGPhotosChallengeMetricEvent _groundTruthForTitlingQuestions:questionType:](self, "_groundTruthForTitlingQuestions:questionType:", v6, 28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPhotosChallengeMetricEvent _inferredResultsForEntityIdentifiers:withDefaultBoolValue:](self, "_inferredResultsForEntityIdentifiers:withDefaultBoolValue:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGPhotosChallengeMetricEvent _reasonResultByAssetEntityIdentifierForTitlingQuestions:questionType:](self, "_reasonResultByAssetEntityIdentifierForTitlingQuestions:questionType:", v6, 28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 2189;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        v8 = Current;
      }
    }
    v15 = -[PGAssetsWithReasonPrecisionRecallEvaluation initWithIdentifier:category:]([PGAssetsWithReasonPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("highlightTitling"), CFSTR("dayHighlightTitling"));
    -[PGAssetsWithReasonPrecisionRecallEvaluation evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:](v15, "evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:", v10, v12, v13);
    if (v7)
    {
      v16 = CFAbsoluteTimeGetCurrent();
      if (v16 - v8 >= 0.01)
      {
        v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 2193;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            v17 = MEMORY[0x1E0C81028];
LABEL_24:
            _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_25:

LABEL_26:
          goto LABEL_27;
        }
        v8 = v16;
      }
      -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v15);
      if (CFAbsoluteTimeGetCurrent() - v8 < 0.01)
        goto LABEL_25;
      v18 = 0;
      v7[2](v7, &v18, 1.0);
      if (!v18 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_25;
      *(_DWORD *)buf = 67109378;
      v20 = 2196;
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGPhotosChallengeMetricEvent.m";
      v17 = MEMORY[0x1E0C81028];
      goto LABEL_24;
    }
    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v15);
    goto LABEL_25;
  }
  v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v20 = 2183;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:

}

- (id)_groundTruthForTitlingQuestions:(id)a3 questionType:(unsigned __int16)a4
{
  int v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v11, "type", v18) == v4)
        {
          objc_msgSend(v11, "entityIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dayHighlightAssetIdentifiers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsObject:", v12);

          if (v15)
          {
            if (objc_msgSend(v11, "state") == 2)
              v16 = MEMORY[0x1E0C9AAB0];
            else
              v16 = MEMORY[0x1E0C9AAA0];
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, v12);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  return v18;
}

- (id)_reasonResultByAssetEntityIdentifierForTitlingQuestions:(id)a3 questionType:(unsigned __int16)a4
{
  int v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    v10 = *MEMORY[0x1E0D77FD0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v12, "type") == v4)
        {
          v13 = objc_msgSend(v12, "state");
          v14 = CFSTR("NO");
          if (v13 == 2)
            v14 = CFSTR("YES");
          v15 = v14;
          objc_msgSend(v12, "additionalInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v12, "additionalInfo");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v10);
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v19 = CFSTR("SAME");
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[New->%@]-[Legacy->%@]"), v15, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "entityIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, v21);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  return v23;
}

- (id)groundTruthByMomentUUIDFromExhaustiveMomentLabelingQuestions:(id)a3 meaningLabel:(id)a4 withMetricsCache:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v28;
  id v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v30 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v33;
    v31 = *MEMORY[0x1E0D77FD0];
    *(_QWORD *)&v11 = 138412290;
    v28 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v15, "state", v28) == 2)
        {
          objc_msgSend(v15, "entityIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "momentUUIDsForExhaustiveMomentLabelingQuestion");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containsObject:", v16);

          if ((v18 & 1) != 0)
          {
            objc_msgSend(v15, "additionalInfo");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", v31);
            v20 = objc_claimAutoreleasedReturnValue();

            v21 = (void *)MEMORY[0x1E0C99E60];
            -[NSObject componentsSeparatedByString:](v20, "componentsSeparatedByString:", CFSTR(","));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setWithArray:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v23, "count"))
            {
              v24 = objc_msgSend(v23, "containsObject:", v30);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKeyedSubscript:", v25, v16);

            }
          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "loggingConnection");
            v20 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v28;
              v37 = v16;
              _os_log_error_impl(&dword_1CA237000, v20, OS_LOG_TYPE_ERROR, "Failed to find moment with uuid in the photoLibrary: '%@'", buf, 0xCu);
            }
          }

        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v12);
  }

  return v29;
}

- (id)_groundTruthByAssetIdentifiersFromQuestions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  __int128 v26;
  uint64_t v27;
  PGPhotosChallengeMetricEvent *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v31;
    *(_QWORD *)&v7 = 138412290;
    v26 = v7;
    v27 = *(_QWORD *)v31;
    v28 = self;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
        objc_msgSend(v11, "entityIdentifier", v26);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "assetByAssetIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {

LABEL_9:
          if (objc_msgSend(v11, "state") == 2)
            v21 = MEMORY[0x1E0C9AAB0];
          else
            v21 = MEMORY[0x1E0C9AAA0];
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, v12);
          goto LABEL_13;
        }
        -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
        v16 = v5;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "assetByAssetSyndicationIdentifier");
        v18 = v8;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v18;
        v5 = v16;
        v9 = v27;
        self = v28;

        if (v20)
          goto LABEL_9;
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "loggingConnection");
        v23 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v26;
          v35 = v12;
          _os_log_error_impl(&dword_1CA237000, v23, OS_LOG_TYPE_ERROR, "Failed to find asset with uuid: '%@'", buf, 0xCu);
        }

LABEL_13:
        ++v10;
      }
      while (v8 != v10);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      v8 = v24;
    }
    while (v24);
  }

  return v5;
}

- (id)_groundTruthByPersonUUIDFromQuestions:(id)a3
{
  id v4;
  void *v5;
  PGManagerWorkingContext *workingContext;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PGPhotosChallengeMetricEvent__groundTruthByPersonUUIDFromQuestions___block_invoke;
  v12[3] = &unk_1E84354B0;
  v12[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_graphSchemaVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("graphSchemaVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_questionVersion);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("questionVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_algorithmVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("algorithmVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_photosModelVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("photosModelVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_questionVersion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("questionVersion"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_questionTypeString, CFSTR("questionType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_photoLibrarySize, CFSTR("photosLibrarySize"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation falseNegatives](self->_evaluation, "falseNegatives"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("falseNegativeCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation falsePositives](self->_evaluation, "falsePositives"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("falsePositiveCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation trueNegatives](self->_evaluation, "trueNegatives"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("trueNegativeCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation truePositives](self->_evaluation, "truePositives"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("truePositiveCount"));

  return v3;
}

- (id)payloadForVerification
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringFromQuestionMetricType:", self->_questionMetricType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "substringToIndex:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_algorithmVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@AlgorithmVersion"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation falseNegatives](self->_evaluation, "falseNegatives"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@NumFalseNegatives"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation falsePositives](self->_evaluation, "falsePositives"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@NumFalsePositives"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation trueNegatives](self->_evaluation, "trueNegatives"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@NumTrueNegatives"), v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation truePositives](self->_evaluation, "truePositives"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@NumTruePositives"), v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v16);

  return v3;
}

- (void)setSubMetricEvent:(id)a3
{
  objc_storeStrong((id *)&self->_subMetricEvent, a3);
}

- (id)_inferredResultsForEntityIdentifiers:(id)a3 withDefaultBoolValue:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)_gatherMetricsForSharedLibraryAssetsQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void *, _BYTE *, double);
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double Current;
  id *p_isa;
  void *v27;
  NSObject *v28;
  PGAssetsWithReasonPrecisionRecallEvaluation *v29;
  id v30;
  id v31;
  double v32;
  double v33;
  int v34;
  int v35;
  PGAssetsWithReasonPrecisionRecallEvaluation *v36;
  id v37;
  PGPhotosChallengeMetricEvent *v38;
  id v39;
  void *v40;
  void (**v41)(void *, _BYTE *, double);
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  char v47;
  uint8_t v48[128];
  uint8_t buf[4];
  _BYTE v50[14];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(void *, _BYTE *, double))_Block_copy(v7);
  v9 = 0.0;
  if (!v8 || (v10 = CFAbsoluteTimeGetCurrent(), v10 < 0.01))
  {
LABEL_7:
    v41 = v8;
    v39 = v7;
    -[PGPhotosChallengeMetricEvent _groundTruthByAssetIdentifiersFromQuestions:](self, "_groundTruthByAssetIdentifiersFromQuestions:", v6);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = self;
    -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "momentUUIDByAssetIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v37 = v6;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v44 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v18, "entityIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v42, "addObject:", v20);
          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "loggingConnection");
            v22 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v18, "entityIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v50 = v23;
              _os_log_error_impl(&dword_1CA237000, v22, OS_LOG_TYPE_ERROR, "Shared library: Failed to find moment UUID for asset uuid: %@", buf, 0xCu);

            }
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v15);
    }

    v24 = v40;
    if (!objc_msgSend(v40, "count") || !objc_msgSend(v42, "count"))
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "loggingConnection");
      v28 = objc_claimAutoreleasedReturnValue();

      v7 = v39;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v34 = objc_msgSend(v40, "count");
        v35 = objc_msgSend(v42, "count");
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v50 = v34;
        *(_WORD *)&v50[4] = 1024;
        *(_DWORD *)&v50[6] = v35;
        _os_log_error_impl(&dword_1CA237000, v28, OS_LOG_TYPE_ERROR, "Shared library: ground truth, %d, or moment UUIDs, %d, is empty", buf, 0xEu);
      }

      v29 = -[PGAssetsWithReasonPrecisionRecallEvaluation initWithIdentifier:category:]([PGAssetsWithReasonPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("sharedLibraryAssets"), CFSTR("sharedLibraryAssets"));
      -[PGAssetsWithReasonPrecisionRecallEvaluation evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:](v29, "evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:", v40, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);
      -[PGPhotosChallengeMetricEvent setEvaluation:](v38, "setEvaluation:", v29);
      v6 = v37;
      v8 = v41;
      if (v41)
      {
        if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
        {
          v47 = 0;
          v41[2](v41, &v47, 1.0);
          if (v47)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v50 = 2401;
              *(_WORD *)&v50[4] = 2080;
              *(_QWORD *)&v50[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }

      goto LABEL_59;
    }
    v7 = v39;
    v8 = v41;
    if (v41)
    {
      Current = CFAbsoluteTimeGetCurrent();
      p_isa = (id *)&v38->super.super.isa;
      if (Current - v9 >= 0.01)
      {
        v47 = 0;
        v41[2](v41, &v47, 0.3);
        if (v47)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v50 = 2405;
            *(_WORD *)&v50[4] = 2080;
            *(_QWORD *)&v50[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v6 = v37;
          goto LABEL_59;
        }
        v9 = Current;
      }
    }
    else
    {
      p_isa = (id *)&v38->super.super.isa;
    }
    v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = v41;
    v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(p_isa, "_gatherDeferredSuggestionInferencesForQuestions:momentUUIDS:inferenceResults:reasonResultByAssetIdentifier:progressBlock:", v13, v42, v30, v31, v39);
    if (v41)
    {
      v32 = CFAbsoluteTimeGetCurrent();
      if (v32 - v9 >= 0.01)
      {
        v47 = 0;
        v41[2](v41, &v47, 0.6);
        if (v47)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v50 = 2413;
            *(_WORD *)&v50[4] = 2080;
            *(_QWORD *)&v50[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v6 = v37;
LABEL_58:

          v24 = v40;
LABEL_59:

          goto LABEL_60;
        }
        v9 = v32;
      }
      objc_msgSend(p_isa, "_gatherNearLiveSuggestionInferencesForQuestions:inferenceResults:reasonResultByAssetIdentifier:progressBlock:", v13, v30, v31, v39);
      v33 = CFAbsoluteTimeGetCurrent();
      v6 = v37;
      if (v33 - v9 >= 0.01)
      {
        v47 = 0;
        v41[2](v41, &v47, 0.9);
        if (v47)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v50 = 2417;
            *(_WORD *)&v50[4] = 2080;
            *(_QWORD *)&v50[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_58;
        }
        v9 = v33;
      }
    }
    else
    {
      objc_msgSend(p_isa, "_gatherNearLiveSuggestionInferencesForQuestions:inferenceResults:reasonResultByAssetIdentifier:progressBlock:", v13, v30, v31, v39);
      v6 = v37;
    }
    v36 = -[PGAssetsWithReasonPrecisionRecallEvaluation initWithIdentifier:category:]([PGAssetsWithReasonPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("sharedLibraryAssets"), CFSTR("sharedLibraryAssets"));
    -[PGAssetsWithReasonPrecisionRecallEvaluation evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:](v36, "evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:", v40, v30, v31);
    objc_msgSend(p_isa, "setEvaluation:", v36);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(p_isa[2], "setResultsByAssetIdentifier:", v31);
    v8 = v41;
    if (v41)
    {
      if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
      {
        v47 = 0;
        v41[2](v41, &v47, 1.0);
        if (v47)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v50 = 2429;
            *(_WORD *)&v50[4] = 2080;
            *(_QWORD *)&v50[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    goto LABEL_58;
  }
  v47 = 0;
  v8[2](v8, &v47, 0.0);
  if (!v47)
  {
    v9 = v10;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v50 = 2376;
    *(_WORD *)&v50[4] = 2080;
    *(_QWORD *)&v50[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_60:

}

- (void)_gatherDeferredSuggestionInferencesForQuestions:(id)a3 momentUUIDS:(id)a4 inferenceResults:(id)a5 reasonResultByAssetIdentifier:(id)a6 progressBlock:(id)a7
{
  double v11;
  double v12;
  void *v13;
  PGSharedLibrarySuggestionsProcessor *v14;
  id v15;
  id v16;
  PGManagerWorkingContext *workingContext;
  PGSharedLibrarySuggestionsProcessor *v18;
  double Current;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  CLSCurationSession *curationSession;
  void *v44;
  void *v45;
  _BOOL8 v46;
  id v47;
  __CFString *v48;
  void *v49;
  __CFString *v50;
  __CFString *v51;
  void *v52;
  NSObject *p_super;
  id v54;
  id v55;
  id v56;
  void *v57;
  void (**v58)(void *, _BYTE *, double);
  id obj;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *context;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  char v75;
  _QWORD v76[4];
  PGSharedLibrarySuggestionsProcessor *v77;
  id v78;
  PGPhotosChallengeMetricEvent *v79;
  id v80;
  id v81;
  uint8_t *v82;
  void *v83;
  uint8_t v84[128];
  uint8_t v85[4];
  int v86;
  __int16 v87;
  const char *v88;
  uint8_t buf[8];
  __int128 v90;
  char v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v56 = a4;
  v61 = a5;
  v60 = a6;
  v54 = a7;
  v11 = 0.0;
  v58 = (void (**)(void *, _BYTE *, double))_Block_copy(v54);
  if (!v58 || (v12 = CFAbsoluteTimeGetCurrent(), v12 < 0.01))
  {
LABEL_7:
    -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGSharedLibrarySuggestionsProcessor libraryScopeToUseWithPhotoLibrary:](PGSharedLibrarySuggestionsProcessor, "libraryScopeToUseWithPhotoLibrary:", v13);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v57)
    {
      -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Cannot instanciate without a valid library scope", buf, 2u);
      }
      goto LABEL_47;
    }
    v14 = -[PGSharedLibrarySuggestionsProcessor initWithWorkingContext:libraryScope:]([PGSharedLibrarySuggestionsProcessor alloc], "initWithWorkingContext:libraryScope:", self->_workingContext, v57);
    v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v90 = buf;
    *((_QWORD *)&v90 + 1) = 0x2020000000;
    v91 = 0;
    workingContext = self->_workingContext;
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __153__PGPhotosChallengeMetricEvent__gatherDeferredSuggestionInferencesForQuestions_momentUUIDS_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke;
    v76[3] = &unk_1E84356E0;
    v18 = v14;
    v77 = v18;
    v82 = buf;
    v78 = v56;
    v79 = self;
    v66 = v16;
    v80 = v66;
    v65 = v15;
    v81 = v65;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v76);
    p_super = &v18->super;
    if (v58)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v11 >= 0.01)
      {
        v75 = 0;
        v58[2](v58, &v75, 0.8);
        if (v75)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_46:

            _Block_object_dispose(buf, 8);
            v21 = p_super;
LABEL_47:

            goto LABEL_48;
          }
          *(_DWORD *)v85 = 67109378;
          v86 = 2491;
          v87 = 2080;
          v88 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v20 = MEMORY[0x1E0C81028];
LABEL_45:
          _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v85, 0x12u);
          goto LABEL_46;
        }
        v11 = Current;
      }
    }
    if (!*(_BYTE *)(v90 + 24))
    {
LABEL_40:
      if (!v58)
        goto LABEL_46;
      if (CFAbsoluteTimeGetCurrent() - v11 < 0.01)
        goto LABEL_46;
      v75 = 0;
      v58[2](v58, &v75, 1.0);
      if (!v75 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_46;
      *(_DWORD *)v85 = 67109378;
      v86 = 2532;
      v87 = 2080;
      v88 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGPhotosChallengeMetricEvent.m";
      v20 = MEMORY[0x1E0C81028];
      goto LABEL_45;
    }
    -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "momentUUIDByAssetIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    obj = v55;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
    if (!v23)
      goto LABEL_39;
    v62 = *MEMORY[0x1E0D77FD0];
    v63 = *(_QWORD *)v72;
LABEL_19:
    v24 = 0;
    v67 = v23;
    while (1)
    {
      if (*(_QWORD *)v72 != v63)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v24);
      context = (void *)MEMORY[0x1CAA4EB2C]();
      objc_msgSend(v25, "entityIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v25, "state");
      v29 = CFSTR("NO");
      if (v28 == 2)
        v29 = CFSTR("YES");
      v30 = v29;
      objc_msgSend(v25, "additionalInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", v62);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)v32;
      v34 = CFSTR("None");
      if (v32)
        v34 = (__CFString *)v32;
      v35 = v34;

      objc_msgSend(v66, "objectForKeyedSubscript:", v27);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      v38 = CFSTR("None");
      if (v36)
        v38 = (__CFString *)v36;
      v39 = v38;

      if (!objc_msgSend(v65, "containsObject:", v27))
        break;
      -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "assetByAssetIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", v26);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        curationSession = self->_curationSession;
        v83 = v42;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLSCurationSession prepareAssets:](curationSession, "prepareAssets:", v44);

        -[PGPhotosChallengeMetricEvent curationContext](self, "curationContext");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = 0;
        v46 = +[PGSharedLibrarySuggestionsProcessor shouldIncludeAsset:curationContext:rejectionReason:](PGSharedLibrarySuggestionsProcessor, "shouldIncludeAsset:curationContext:rejectionReason:", v42, v45, &v70);
        v47 = v70;

        if (v47)
        {
          v48 = (__CFString *)v47;

          v39 = v48;
        }

        goto LABEL_34;
      }
LABEL_37:

      objc_autoreleasePoolPop(context);
      if (v67 == ++v24)
      {
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
        if (!v23)
        {
LABEL_39:

          goto LABEL_40;
        }
        goto LABEL_19;
      }
    }
    v46 = 0;
LABEL_34:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKeyedSubscript:", v49, v26);

    v50 = CFSTR("NO");
    if (v46)
      v50 = CFSTR("YES");
    v51 = v50;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@->%@]-[%@->%@]"), v30, v35, v51, v39);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setObject:forKeyedSubscript:", v52, v26);

    goto LABEL_37;
  }
  v85[0] = 0;
  v58[2](v58, v85, 0.0);
  if (!v85[0])
  {
    v11 = v12;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 2435;
    LOWORD(v90) = 2080;
    *(_QWORD *)((char *)&v90 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_48:

}

- (void)_gatherNearLiveSuggestionInferencesForQuestions:(id)a3 inferenceResults:(id)a4 reasonResultByAssetIdentifier:(id)a5 progressBlock:(id)a6
{
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  double Current;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  PGPhotosChallengeMetricEvent *v37;
  id v38;
  id v39;
  void (**v40)(void *, _BYTE *, double);
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  PGPhotosChallengeMetricEvent *v45;
  id v46;
  id v47;
  char v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[6];
  _QWORD v54[2];
  uint8_t v55[4];
  int v56;
  __int16 v57;
  const char *v58;
  uint8_t v59[128];
  uint8_t buf[8];
  __int128 v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v10 = a4;
  v38 = a5;
  v36 = a6;
  v11 = 0.0;
  v40 = (void (**)(void *, _BYTE *, double))_Block_copy(v36);
  if (!v40 || (v12 = CFAbsoluteTimeGetCurrent(), v12 < 0.01))
  {
LABEL_7:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v61 = buf;
    *((_QWORD *)&v61 + 1) = 0x3032000000;
    v62 = __Block_byref_object_copy__65140;
    v63 = __Block_byref_object_dispose__65141;
    v64 = 0;
    -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __141__PGPhotosChallengeMetricEvent__gatherNearLiveSuggestionInferencesForQuestions_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke;
    v53[3] = &unk_1E8435708;
    v53[4] = self;
    v53[5] = buf;
    objc_msgSend(v14, "performBlockAndWait:", v53);
    v37 = self;

    -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assetByAssetIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v17 = v39;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v50 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v21, "entityIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "BOOLValue");

          if ((v24 & 1) == 0)
          {
            objc_msgSend(v21, "entityIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v42, "addObject:", v27);
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, v27);

          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      }
      while (v18);
    }

    if (v40)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v11 >= 0.01)
      {
        v48 = 0;
        v40[2](v40, &v48, 0.4);
        if (v48)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_30:

            _Block_object_dispose(buf, 8);
            goto LABEL_31;
          }
          *(_DWORD *)v55 = 67109378;
          v56 = 2560;
          v57 = 2080;
          v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v29 = MEMORY[0x1E0C81028];
LABEL_29:
          _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v55, 0x12u);
          goto LABEL_30;
        }
        v11 = Current;
      }
    }
    if (objc_msgSend(v42, "count"))
    {
      v30 = (void *)MEMORY[0x1E0CB3528];
      PLManagedAssetPredicateToFetchAssetsToEvaluateSuggestionsForLibraryScope();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v31;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K & %d) != 0"), CFSTR("libraryScopeShareState"), 2, v36);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "orPredicateWithSubpredicates:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = *(void **)(v61 + 40);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __141__PGPhotosChallengeMetricEvent__gatherNearLiveSuggestionInferencesForQuestions_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke_403;
      v43[3] = &unk_1E8435730;
      v44 = v16;
      v45 = v37;
      v46 = v10;
      v47 = v38;
      objc_msgSend(v35, "evaluateAssetObjectIDs:simulate:predicateToFetchAssetsToEvaluate:withResultEnumerationBlock:", v42, 1, v34, v43);

    }
    if (!v40)
      goto LABEL_30;
    if (CFAbsoluteTimeGetCurrent() - v11 < 0.01)
      goto LABEL_30;
    v48 = 0;
    v40[2](v40, &v48, 1.0);
    if (!v48 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_30;
    *(_DWORD *)v55 = 67109378;
    v56 = 2588;
    v57 = 2080;
    v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    v29 = MEMORY[0x1E0C81028];
    goto LABEL_29;
  }
  v55[0] = 0;
  v40[2](v40, v55, 0.0);
  if (!v55[0])
  {
    v11 = v12;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 2538;
    LOWORD(v61) = 2080;
    *(_QWORD *)((char *)&v61 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_31:

}

- (id)_getInferredReasonFromMatchedConditions:(id)a3 withFallbackReason:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  v8 = v6;
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v20;
    v8 = v6;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "criteria"))
        {
          PLLibraryScopeConditionStringFromCriteria();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "type");
          PLLibraryScopeConditionStringFromType();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByAppendingFormat:", CFSTR(" %@"), v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v8 == v6)
          {
            v17 = v15;
            v8 = v6;
          }
          else
          {
            objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" | %@"), v15);
            v17 = (id)objc_claimAutoreleasedReturnValue();
          }

          v8 = v17;
        }
      }
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  return v8;
}

- (void)_gatherMetricsForSharedLibraryStartQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double Current;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  PGPhotosChallengeMetricEventFetchHelper *metricsCache;
  _BOOL4 v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  _BOOL8 v24;
  BOOL v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  PGPrecisionRecallEvaluation *v30;
  int v31;
  id v32;
  char v33;
  uint8_t buf[4];
  _DWORD v35[7];

  *(_QWORD *)&v35[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  if (v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v9 = 0.0;
    if (Current >= 0.01)
    {
      v10 = Current;
      v33 = 0;
      v7[2](v7, &v33, 0.0);
      if (v33)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v35[0] = 2617;
          LOWORD(v35[1]) = 2080;
          *(_QWORD *)((char *)&v35[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v11 = MEMORY[0x1E0C81028];
LABEL_30:
          _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_56;
        }
        goto LABEL_56;
      }
      v9 = v10;
    }
    if (!objc_msgSend(v6, "count"))
    {
      if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
      {
        v33 = 0;
        v7[2](v7, &v33, 1.0);
        if (v33)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v35[0] = 2620;
            LOWORD(v35[1]) = 2080;
            *(_QWORD *)((char *)&v35[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            v11 = MEMORY[0x1E0C81028];
            goto LABEL_30;
          }
        }
      }
      goto LABEL_56;
    }
  }
  else
  {
    v9 = 0.0;
    if (!objc_msgSend(v6, "count"))
      goto LABEL_56;
  }
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    metricsCache = self->_metricsCache;
    v32 = 0;
    v15 = -[PGPhotosChallengeMetricEventFetchHelper suggestsToStartSharedLibraryWithError:](metricsCache, "suggestsToStartSharedLibraryWithError:", &v32);
    v16 = v32;
    if (v16)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "loggingConnection");
      v18 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v35 = v16;
        _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "Error getting startSharedLibrarySuggestion: %@", buf, 0xCu);
      }

      if (v7)
      {
        if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
        {
          v33 = 0;
          v7[2](v7, &v33, 1.0);
          if (v33)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v35[0] = 2634;
              LOWORD(v35[1]) = 2080;
              *(_QWORD *)((char *)&v35[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
    }
    else
    {
      objc_msgSend(v6, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "state");
      v21 = 1;
      v22 = v20 == 2;
      if (v20 == 3)
        v22 = 0;
      else
        v21 = 0;
      v23 = 1;
      v24 = v20 == 2;
      if (v20 == 3)
        v24 = 0;
      else
        v23 = 0;
      v25 = !v15;
      v26 = v15 && v24;
      if (v25)
        v27 = 0;
      else
        v27 = v23;
      if (v25)
        v28 = v21;
      else
        v28 = 0;
      v29 = v25 && v22;
      v30 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:truePositives:falsePositives:falseNegatives:trueNegatives:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:truePositives:falsePositives:falseNegatives:trueNegatives:", CFSTR("sharedLibraryStart"), CFSTR("sharedLibraryStart"), v26, v27, v29, v28);
      -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v30);

      if (v7)
      {
        if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
        {
          v33 = 0;
          v7[2](v7, &v33, 1.0);
          if (v33)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v35[0] = 2659;
              LOWORD(v35[1]) = 2080;
              *(_QWORD *)((char *)&v35[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }

    }
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 67109120;
      v35[0] = v31;
      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "Expected 1 shared library start question, found %d", buf, 8u);
    }

    if (v7)
    {
      if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
      {
        v33 = 0;
        v7[2](v7, &v33, 1.0);
        if (v33)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v35[0] = 2626;
            LOWORD(v35[1]) = 2080;
            *(_QWORD *)((char *)&v35[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            v11 = MEMORY[0x1E0C81028];
            goto LABEL_30;
          }
        }
      }
    }
  }
LABEL_56:

}

- (void)_gatherMetricsForCameraLibrarySwitchQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double v8;
  double v9;
  void *v10;
  double Current;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  PGAssetsWithReasonPrecisionRecallEvaluation *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  NSObject *v34;
  double v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  __CFString *v42;
  __CFString *v43;
  uint64_t v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  PGPhotosChallengeMetricEvent *v57;
  PGAssetsWithReasonPrecisionRecallEvaluation *v58;
  int v59;
  PGPhotosChallengeMetricEvent *v60;
  void *v61;
  id v62;
  void (**v63)(void *, _BYTE *, double);
  NSObject *obj;
  uint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  char v81;
  _BYTE v82[128];
  uint8_t v83[128];
  uint8_t buf[4];
  int v85;
  __int16 v86;
  const char *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  v8 = 0.0;
  if (!v7 || (v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    -[PGPhotosChallengeMetricEvent _groundTruthByAssetIdentifiersFromQuestions:](self, "_groundTruthByAssetIdentifiersFromQuestions:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "count"))
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "loggingConnection");
      v14 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v59 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 67109120;
        v85 = v59;
        _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "Camera library switch: ground truth, %d is empty", buf, 8u);
      }

      v15 = -[PGAssetsWithReasonPrecisionRecallEvaluation initWithIdentifier:category:]([PGAssetsWithReasonPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("cameraLibrarySwitch"), CFSTR("sharedLibraryAssets"));
      -[PGAssetsWithReasonPrecisionRecallEvaluation evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:](v15, "evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:", v10, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);
      -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v15);
      if (v7)
      {
        if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
        {
          v81 = 0;
          v7[2](v7, &v81, 1.0);
          if (v81)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v85 = 2675;
              v86 = 2080;
              v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Me"
                    "trics/MetricEvents/PGPhotosChallengeMetricEvent.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }

      goto LABEL_79;
    }
    if (v7)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        v81 = 0;
        v7[2](v7, &v81, 0.2);
        if (v81)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v85 = 2679;
            v86 = 2080;
            v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            v12 = MEMORY[0x1E0C81028];
LABEL_45:
            _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_79;
          }
          goto LABEL_79;
        }
        v8 = Current;
      }
    }
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v16 = v6;
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    v60 = self;
    v61 = v10;
    v62 = v6;
    v63 = v7;
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v78;
      v21 = CFSTR("libraryScopeUUID");
      v71 = v16;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v78 != v20)
            objc_enumerationMutation(v16);
          v23 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend(v23, "additionalInfo");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
          {
            objc_msgSend(v23, "additionalInfo");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("previousCameraLibrarySwitchState"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v27, "isEqualToString:", CFSTR("auto on")))
            {

LABEL_39:
              v69 = 0;
              v16 = v71;
              v34 = v71;
              v6 = v62;
              v7 = v63;
              v10 = v61;
              goto LABEL_40;
            }
            v28 = v20;
            v29 = v21;
            objc_msgSend(v23, "additionalInfo");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("currentCameraLibrarySwitchState"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("auto on"));

            if (v32)
              goto LABEL_39;
            v19 = 1;
            v16 = v71;
            v21 = v29;
            v20 = v28;
          }

        }
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
        if (v18)
          continue;
        break;
      }

      if ((v19 & 1) == 0)
      {
        v69 = 1;
        v6 = v62;
        v7 = v63;
        v10 = v61;
        if (!v63)
          goto LABEL_47;
        goto LABEL_41;
      }
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "loggingConnection");
      v34 = objc_claimAutoreleasedReturnValue();

      v7 = v63;
      v10 = v61;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v34, OS_LOG_TYPE_ERROR, "Excluding questions without library scope from Camera library switch challenge evaluation", buf, 2u);
      }
      v69 = 1;
      v6 = v62;
    }
    else
    {
      v69 = 1;
      v34 = v16;
    }
LABEL_40:

    if (!v7)
      goto LABEL_47;
LABEL_41:
    v35 = CFAbsoluteTimeGetCurrent();
    if (v35 - v8 >= 0.01)
    {
      v81 = 0;
      v7[2](v7, &v81, 0.3);
      if (v81)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v85 = 2705;
          v86 = 2080;
          v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          v12 = MEMORY[0x1E0C81028];
          goto LABEL_45;
        }
LABEL_79:

        goto LABEL_80;
      }
      v8 = v35;
    }
LABEL_47:
    v67 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v66 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    obj = v16;
    v70 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    if (v70)
    {
      v68 = *(_QWORD *)v74;
      v65 = *MEMORY[0x1E0D77FD0];
      do
      {
        for (j = 0; j != v70; ++j)
        {
          if (*(_QWORD *)v74 != v68)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
          objc_msgSend(v37, "additionalInfo");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (!v69
            || (objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("libraryScopeUUID")),
                v40 = (void *)objc_claimAutoreleasedReturnValue(),
                v40,
                v40))
          {
            v41 = objc_msgSend(v37, "state");
            v42 = CFSTR("NO");
            if (v41 == 2)
              v42 = CFSTR("YES");
            v43 = v42;
            objc_msgSend(v39, "objectForKeyedSubscript:", v65);
            v44 = objc_claimAutoreleasedReturnValue();
            v45 = (void *)v44;
            v46 = CFSTR("None");
            if (v44)
              v46 = (__CFString *)v44;
            v47 = v46;

            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("previousCameraLibrarySwitchState"));
            v48 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("currentCameraLibrarySwitchState"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v49, "isEqualToString:", CFSTR("auto on")) & 1) != 0
              || objc_msgSend(v49, "isEqualToString:", CFSTR("user on")))
            {
              v50 = 1;
              v51 = CFSTR("YES");
            }
            else
            {
              v50 = 0;
              v51 = CFSTR("NO");
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ to %@"), v48, v49);
            v72 = (void *)v48;
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@->%@]-[%@->%@]"), v43, v47, v51, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v37, "entityIdentifier");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "setObject:forKeyedSubscript:", v53, v54);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v50);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "setObject:forKeyedSubscript:", v55, v54);

          }
        }
        v70 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
      }
      while (v70);
    }

    v7 = v63;
    if (v63)
    {
      v56 = CFAbsoluteTimeGetCurrent();
      v10 = v61;
      v6 = v62;
      v57 = v60;
      if (v56 - v8 >= 0.01)
      {
        v81 = 0;
        v63[2](v63, &v81, 0.9);
        if (v81)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v85 = 2732;
            v86 = 2080;
            v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_78:

          goto LABEL_79;
        }
        v8 = v56;
      }
    }
    else
    {
      v10 = v61;
      v6 = v62;
      v57 = v60;
    }
    v58 = -[PGAssetsWithReasonPrecisionRecallEvaluation initWithIdentifier:category:]([PGAssetsWithReasonPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("cameraLibrarySwitch"), CFSTR("sharedLibraryAssets"));
    -[PGAssetsWithReasonPrecisionRecallEvaluation evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:](v58, "evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:", v10, v67, v66);
    -[PGPhotosChallengeMetricEvent setEvaluation:](v57, "setEvaluation:", v58);
    if (v63)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
      {
        v81 = 0;
        v63[2](v63, &v81, 1.0);
        if (v81)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v85 = 2737;
            v86 = 2080;
            v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    goto LABEL_78;
  }
  v81 = 0;
  v7[2](v7, &v81, 0.0);
  if (!v81)
  {
    v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v85 = 2665;
    v86 = 2080;
    v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_80:

}

- (void)_gatherMetricsForWallpaperQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  id v7;
  void (**v8)(void *, _BYTE *, double);
  double Current;
  double v10;
  double v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int16 v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int16 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  _BOOL8 v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  _BOOL8 v56;
  void *v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  void *v61;
  _BOOL8 v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  __CFString *v67;
  __CFString *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  __CFString *v72;
  __CFString *v73;
  const __CFString *v74;
  void *v75;
  void *v76;
  void *v77;
  char *v78;
  double v79;
  void *v80;
  PGAssetsWithReasonPrecisionRecallEvaluation *v81;
  void *v82;
  void *v83;
  id v84;
  void (**v85)(void *, _BYTE *, double);
  void *v86;
  void *v87;
  uint64_t v88;
  id v89;
  id v90;
  PGPhotosChallengeMetricEvent *v91;
  id obj;
  id v93;
  unsigned int v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  unsigned int v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  char v108;
  void *v109;
  _BYTE v110[128];
  uint8_t v111[128];
  uint8_t buf[4];
  int v113;
  __int16 v114;
  const char *v115;
  uint64_t v116;

  v99 = a4;
  v116 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(void *, _BYTE *, double))_Block_copy(a5);
  if (!v8)
  {
    v10 = 0.0;
    if (!objc_msgSend(v7, "count"))
      goto LABEL_76;
    goto LABEL_10;
  }
  Current = CFAbsoluteTimeGetCurrent();
  v10 = 0.0;
  if (Current >= 0.01)
  {
    v11 = Current;
    v108 = 0;
    v8[2](v8, &v108, 0.0);
    if (v108)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v113 = 2761;
        v114 = 2080;
        v115 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics"
               "/MetricEvents/PGPhotosChallengeMetricEvent.m";
        v12 = MEMORY[0x1E0C81028];
LABEL_29:
        _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_76;
      }
      goto LABEL_76;
    }
    v10 = v11;
  }
  if (objc_msgSend(v7, "count"))
  {
LABEL_10:
    v85 = v8;
    v93 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v84 = v7;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v104, v111, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v105;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v105 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
          objc_msgSend(v18, "additionalInfo");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("suggestionSubtype"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "integerValue");

          if (objc_msgSend((id)objc_opt_class(), "wallpaperSuggestionSubtypeForQuestionMetricType:", v99) == v21)
            objc_msgSend(v93, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v104, v111, 16);
      }
      while (v15);
    }

    -[PGPhotosChallengeMetricEvent _groundTruthByAssetIdentifiersFromQuestions:](self, "_groundTruthByAssetIdentifiersFromQuestions:", v93);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v85;
    if (v85)
    {
      v23 = CFAbsoluteTimeGetCurrent();
      if (v23 - v10 >= 0.01)
      {
        v108 = 0;
        v85[2](v85, &v108, 0.5);
        if (v108)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v113 = 2778;
            v114 = 2080;
            v115 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Met"
                   "rics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v7 = v84;
          goto LABEL_75;
        }
        v10 = v23;
      }
    }
    v83 = v22;
    v90 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v89 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPhotosChallengeMetricEvent curationContext](self, "curationContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPhotosChallengeMetricEvent _vipPersonIdentifiersWithCurationContext:](self, "_vipPersonIdentifiersWithCurationContext:", v25);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGPhotosChallengeMetricEvent curationContext](self, "curationContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPhotosChallengeMetricEvent _vipPetIdentifiersWithCurationContext:](self, "_vipPetIdentifiersWithCurationContext:", v26);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    v82 = v24;
    objc_msgSend(v24, "librarySpecificFetchOptions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v27;
    objc_msgSend(v27, "setFetchPropertySets:", v28);

    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    obj = v93;
    v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
    if (v98)
    {
      v29 = 0x1E0CD1000uLL;
      v96 = *(_QWORD *)v101;
      v88 = *MEMORY[0x1E0D77FD0];
      v91 = self;
      do
      {
        for (j = 0; j != v98; ++j)
        {
          if (*(_QWORD *)v101 != v96)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * j);
          objc_msgSend(v31, "additionalInfo");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("suggestionSubtype"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "integerValue");

          objc_msgSend(v31, "entityIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = *(void **)(v29 + 912);
          v109 = v35;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "fetchAssetsWithUUIDs:options:", v37, v97);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v38, "count"))
          {
            v39 = *(void **)(v29 + 912);
            -[PGPhotosChallengeMetricEvent curationContext](self, "curationContext");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v38, 31, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "firstObject");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            v43 = v34;
            v44 = objc_msgSend(MEMORY[0x1E0D77EF8], "primaryOrientation");
            switch(v34)
            {
              case 0x28Cu:
                -[PGPhotosChallengeMetricEvent _fetchPersonFromAsset:detectionType:](self, "_fetchPersonFromAsset:detectionType:", v42, 1);
                v45 = objc_claimAutoreleasedReturnValue();
                if (v45)
                {
                  v46 = (void *)v45;
                  -[PGPhotosChallengeMetricEvent curationContext](self, "curationContext");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v95 = v42;
                  v48 = +[PGPeopleWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGPeopleWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v42, v47, v44, 0);

                  objc_msgSend(v46, "localIdentifier");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = objc_msgSend(v87, "containsObject:", v49);

                  v94 = v50 & v48;
                  v51 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend((id)objc_opt_class(), "_passedFilteringStringForResult:", v48);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)objc_opt_class(), "_isVIPStringForResult:", v50);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "stringWithFormat:", CFSTR("%@|%@"), v52, v53);
                  goto LABEL_42;
                }
                goto LABEL_58;
              case 0x28Du:
                -[PGPhotosChallengeMetricEvent _fetchPersonFromAsset:detectionType:](self, "_fetchPersonFromAsset:detectionType:", v42, 2);
                v54 = objc_claimAutoreleasedReturnValue();
                if (v54)
                {
                  v46 = (void *)v54;
                  -[PGPhotosChallengeMetricEvent curationContext](self, "curationContext");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v95 = v42;
                  v56 = +[PGPetWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGPetWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v42, v55, v44, 0);

                  objc_msgSend(v46, "localIdentifier");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = objc_msgSend(v86, "containsObject:", v57);

                  v94 = v58 & v56;
                  v59 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend((id)objc_opt_class(), "_passedFilteringStringForResult:", v56);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)objc_opt_class(), "_isVIPStringForResult:", v58);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "stringWithFormat:", CFSTR("%@|%@"), v52, v53);
LABEL_42:
                  v60 = objc_claimAutoreleasedReturnValue();

                  goto LABEL_46;
                }
                goto LABEL_58;
              case 0x28Eu:
                -[PGPhotosChallengeMetricEvent curationContext](self, "curationContext");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v62 = +[PGLandscapeWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGLandscapeWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v42, v61, v44, 0);

                v95 = v42;
                v63 = objc_msgSend((id)objc_opt_class(), "_isHighPrecisionLandscapeAsset:", v42);
                goto LABEL_45;
              case 0x28Fu:
                -[PGPhotosChallengeMetricEvent curationContext](self, "curationContext");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v62 = +[PGCityscapeWallpaperSuggester passesFilteringWithAsset:curationContext:orientation:reason:](PGCityscapeWallpaperSuggester, "passesFilteringWithAsset:curationContext:orientation:reason:", v42, v64, v44, 0);

                v95 = v42;
                v63 = objc_msgSend((id)objc_opt_class(), "_isHighPrecisionCityscapeAsset:", v42);
LABEL_45:
                v65 = v63;
                v94 = v62 & v63;
                v66 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend((id)objc_opt_class(), "_passedFilteringStringForResult:", v62);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)objc_opt_class(), "_passedHighPrecisionStringForResult:", v65);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "stringWithFormat:", CFSTR("%@|%@"), v46, v52);
                v60 = objc_claimAutoreleasedReturnValue();
LABEL_46:

                if (objc_msgSend(v31, "state") == 2)
                  v67 = CFSTR("YES");
                else
                  v67 = CFSTR("NO");
                v68 = v67;
                objc_msgSend(v31, "additionalInfo");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "objectForKeyedSubscript:", v88);
                v70 = objc_claimAutoreleasedReturnValue();
                v71 = (void *)v70;
                v72 = CFSTR("None");
                if (v70)
                  v72 = (__CFString *)v70;
                v73 = v72;

                if (v94)
                  v74 = CFSTR("YES");
                else
                  v74 = CFSTR("NO");
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@->%@]-[%@->%@]"), v68, v73, v74, v60);
                v75 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v94);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "setObject:forKeyedSubscript:", v76, v35);

                objc_msgSend(v89, "setObject:forKeyedSubscript:", v75, v35);
                self = v91;
                v42 = v95;
                goto LABEL_57;
              default:
                +[PGLogging sharedLogging](PGLogging, "sharedLogging");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "loggingConnection");
                v60 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v31, "uuid");
                  v78 = (char *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 67109378;
                  v113 = v43;
                  v114 = 2112;
                  v115 = v78;
                  _os_log_error_impl(&dword_1CA237000, v60, OS_LOG_TYPE_ERROR, "Unsupported Wallpaper Subtype %d for question %@", buf, 0x12u);

                }
LABEL_57:

LABEL_58:
                v29 = 0x1E0CD1000;
                break;
            }
          }

        }
        v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
      }
      while (v98);
    }

    v8 = v85;
    if (v85)
    {
      v79 = CFAbsoluteTimeGetCurrent();
      v22 = v83;
      v7 = v84;
      if (v79 - v10 >= 0.01)
      {
        v108 = 0;
        v85[2](v85, &v108, 0.9);
        if (v108)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v113 = 2850;
            v114 = 2080;
            v115 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Met"
                   "rics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_74:

LABEL_75:
          goto LABEL_76;
        }
        v10 = v79;
      }
    }
    else
    {
      v22 = v83;
      v7 = v84;
    }
    objc_msgSend((id)objc_opt_class(), "stringFromQuestionMetricType:", v99);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = -[PGAssetsWithReasonPrecisionRecallEvaluation initWithIdentifier:category:]([PGAssetsWithReasonPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("wallpaper"), v80);
    -[PGAssetsWithReasonPrecisionRecallEvaluation evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:](v81, "evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:", v22, v90, v89);
    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v81);
    if (v85)
    {
      if (CFAbsoluteTimeGetCurrent() - v10 >= 0.01)
      {
        v108 = 0;
        v85[2](v85, &v108, 1.0);
        if (v108)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v113 = 2858;
            v114 = 2080;
            v115 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Met"
                   "rics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    goto LABEL_74;
  }
  if (CFAbsoluteTimeGetCurrent() - v10 >= 0.01)
  {
    v108 = 0;
    v8[2](v8, &v108, 1.0);
    if (v108)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v113 = 2764;
        v114 = 2080;
        v115 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics"
               "/MetricEvents/PGPhotosChallengeMetricEvent.m";
        v12 = MEMORY[0x1E0C81028];
        goto LABEL_29;
      }
    }
  }
LABEL_76:

}

- (id)_vipPersonIdentifiersWithCurationContext:(id)a3
{
  id v4;
  uint64_t v5;
  PGManagerWorkingContext *workingContext;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  PGPhotosChallengeMetricEvent *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__65140;
  v19 = __Block_byref_object_dispose__65141;
  v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = objc_msgSend(MEMORY[0x1E0D77EF8], "primaryOrientation");
  workingContext = self->_workingContext;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__PGPhotosChallengeMetricEvent__vipPersonIdentifiersWithCurationContext___block_invoke;
  v10[3] = &unk_1E84357E0;
  v14 = v5;
  v7 = v4;
  v11 = v7;
  v12 = self;
  v13 = &v15;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v10);
  v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (id)_vipPetIdentifiersWithCurationContext:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[PGGraphPetIdentityProcessor fetchInterestingEligiblePetsForWallpaperWithWorkingContext:curationContext:](PGGraphPetIdentityProcessor, "fetchInterestingEligiblePetsForWallpaperWithWorkingContext:curationContext:", self->_workingContext, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "localIdentifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_fetchPersonFromAsset:(id)a3 detectionType:(signed __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v16;
  _DWORD v17[2];
  __int16 v18;
  void *v19;
  _QWORD v20[2];

  v4 = a4;
  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIncludedDetectionTypes:", v10);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsInAsset:options:", v6, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = 67109378;
      v17[1] = v4;
      v18 = 2112;
      v19 = v16;
      _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "Cannot find PHPerson with detectionType %d in asset %@", (uint8_t *)v17, 0x12u);

    }
  }

  return v12;
}

- (void)_gatherMetricsForLocationRepresentativeAssetQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  id v7;
  void (**v8)(void *, _BYTE *, double);
  double Current;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  PGAssetsWithReasonPrecisionRecallEvaluation *v22;
  char v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(void *, _BYTE *, double))_Block_copy(a5);
  if (!v8)
  {
    -[PGPhotosChallengeMetricEvent _locationRepresentativeAssetsGroundTruthByAssetIdentifiersFromQuestions:](self, "_locationRepresentativeAssetsGroundTruthByAssetIdentifiersFromQuestions:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0.0;
    goto LABEL_13;
  }
  Current = CFAbsoluteTimeGetCurrent();
  v10 = 0.0;
  if (Current < 0.01)
  {
LABEL_8:
    -[PGPhotosChallengeMetricEvent _locationRepresentativeAssetsGroundTruthByAssetIdentifiersFromQuestions:](self, "_locationRepresentativeAssetsGroundTruthByAssetIdentifiersFromQuestions:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFAbsoluteTimeGetCurrent();
    if (v13 - v10 >= 0.01)
    {
      v23 = 0;
      v8[2](v8, &v23, 0.3);
      if (v23)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v25 = 2951;
          v26 = 2080;
          v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_33;
      }
      v10 = v13;
    }
LABEL_13:
    -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assetByAssetIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CLSCurationSession prepareAssets:](self->_curationSession, "prepareAssets:", v16);
    -[PGPhotosChallengeMetricEvent _inferredResultsForLocationRepresentativeAssets:](self, "_inferredResultsForLocationRepresentativeAssets:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v18 = CFAbsoluteTimeGetCurrent();
      if (v18 - v10 >= 0.01)
      {
        v23 = 0;
        v8[2](v8, &v23, 0.6);
        if (v23)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v25 = 2956;
            v26 = 2080;
            v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_32;
        }
        v10 = v18;
      }
    }
    -[PGPhotosChallengeMetricEvent _inferredReasonForLocationRepresentativeAssets:](self, "_inferredReasonForLocationRepresentativeAssets:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPhotosChallengeMetricEvent _reasonResultsForQuestions:inferenceResults:inferenceReasons:](self, "_reasonResultsForQuestions:inferenceResults:inferenceReasons:", v7, v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v21 = CFAbsoluteTimeGetCurrent();
      if (v21 - v10 >= 0.01)
      {
        v23 = 0;
        v8[2](v8, &v23, 0.9);
        if (v23)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v25 = 2960;
            v26 = 2080;
            v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_31:

LABEL_32:
LABEL_33:

          goto LABEL_34;
        }
        v10 = v21;
      }
    }
    v22 = -[PGAssetsWithReasonPrecisionRecallEvaluation initWithIdentifier:category:]([PGAssetsWithReasonPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("locationRepresentativeAssets"), CFSTR("locationRepresentativeAssets"));
    -[PGAssetsWithReasonPrecisionRecallEvaluation evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:](v22, "evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:", v12, v17, v20);
    -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v22);
    if (v8)
    {
      if (CFAbsoluteTimeGetCurrent() - v10 >= 0.01)
      {
        v23 = 0;
        v8[2](v8, &v23, 1.0);
        if (v23)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v25 = 2965;
            v26 = 2080;
            v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    goto LABEL_31;
  }
  v11 = Current;
  v23 = 0;
  v8[2](v8, &v23, 0.0);
  if (!v23)
  {
    v10 = v11;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v25 = 2949;
    v26 = 2080;
    v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_34:

}

- (id)_reasonResultsForQuestions:(id)a3 inferenceResults:(id)a4 inferenceReasons:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  id obj;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v34 = a4;
  v32 = a5;
  v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v8)
  {
    v9 = v8;
    v31 = *(_QWORD *)v36;
    v30 = *MEMORY[0x1E0D77FD0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v11, "entityIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "state") == 2)
          v13 = CFSTR("YES");
        else
          v13 = CFSTR("NO");
        v14 = v13;
        objc_msgSend(v11, "additionalInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v30);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = (__CFString *)v16;
        else
          v18 = CFSTR("None");
        v19 = v18;

        objc_msgSend(v34, "objectForKeyedSubscript:", v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isEqual:", &unk_1E84E4FA0))
          v21 = CFSTR("YES");
        else
          v21 = CFSTR("NO");
        v22 = v21;

        objc_msgSend(v32, "objectForKeyedSubscript:", v12);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (v23)
          v25 = (__CFString *)v23;
        else
          v25 = CFSTR("None");
        v26 = v25;

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@->%@]-[%@->%@]"), v14, v19, v22, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "setObject:forKeyedSubscript:", v27, v12);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v9);
  }

  return v33;
}

- (id)_inferredReasonForLocationRepresentativeAssets:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  uint64_t v33;
  void *v34;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v3;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v40)
  {
    v5 = 0;
    v39 = *(_QWORD *)v42;
    v38 = *MEMORY[0x1E0D77FB8];
    v36 = v4;
    while (1)
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v42 != v39)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v7, "iconicScoreProperties");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "iconicScore");
        v11 = v10;

        objc_msgSend(v7, "curationModel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "iconicScoreModel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "highIconicScore");
        v15 = v14;
        objc_msgSend(v13, "mediumIconicScore");
        v17 = v16;
        objc_msgSend(v13, "minimumMeaningfulIconicScore");
        v19 = v18;
        v20 = (void *)MEMORY[0x1E0CD1420];
        objc_msgSend(v7, "location");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "coordinate");
        v23 = v22;
        objc_msgSend(v7, "location");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "coordinate");
        objc_msgSend(v20, "poiGeoHashWithGeoHashSize:latitude:longitude:", v38, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 > v15)
        {
          v26 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("iconicScore>%@"), v27);
LABEL_8:
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        if (v11 <= v17)
        {
          if (v11 <= v19)
          {
            v29 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringWithFormat:", CFSTR("iconicScore<%@"), v27);
            goto LABEL_8;
          }
          v30 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)MEMORY[0x1E0CB37E8];
          v32 = v17;
        }
        else
        {
          v30 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)MEMORY[0x1E0CB37E8];
          v32 = v15;
        }
        objc_msgSend(v31, "numberWithDouble:", v32);
        v33 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("iconicScore:%@-%@"), v27, v33);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = (void *)v33;
        v4 = v36;
LABEL_15:

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v25, v28);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "uuid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v34);

        objc_autoreleasePoolPop(v8);
      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (!v40)
      {

        break;
      }
    }
  }

  return v4;
}

- (id)_inferredResultsForLocationRepresentativeAssets:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "iconicScoreProperties", (_QWORD)v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "iconicScore");
        v13 = v12;

        objc_msgSend(v10, "curationModel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "iconicScoreModel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "minimumMeaningfulIconicScore");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13 >= v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, v18);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_locationRepresentativeAssetsGroundTruthByAssetIdentifiersFromQuestions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[PGPhotosChallengeMetricEvent _locationRepresentativeAssetFromQuestion:](self, "_locationRepresentativeAssetFromQuestion:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[PGPhotosChallengeMetricEvent _groundTruthByAssetIdentifiersFromQuestions:](self, "_groundTruthByAssetIdentifiersFromQuestions:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_locationRepresentativeAssetFromQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PGPhotosChallengeMetricEvent metricsCache](self, "metricsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetByAssetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_gatherMetricsForExternalAssetRelevanceQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  id v7;
  void (**v8)(void *, _BYTE *, double);
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double Current;
  int *v25;
  PGPhotosChallengeMetricEvent *v26;
  PGPrecisionRecallEvaluation *v27;
  void *v28;
  PGPhotosChallengeMetricEvent *v29;
  void (**v30)(void *, _BYTE *, double);
  id v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  char v38;
  uint8_t v39[128];
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(void *, _BYTE *, double))_Block_copy(a5);
  v9 = 0.0;
  if (!v8 || (v10 = CFAbsoluteTimeGetCurrent(), v10 < 0.01))
  {
LABEL_7:
    v29 = self;
    v30 = v8;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = v7;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v35;
      v15 = *MEMORY[0x1E0D78008];
      v16 = MEMORY[0x1E0C9AAA0];
      v17 = MEMORY[0x1E0C9AAB0];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v11);
          v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v19, "type") == 29)
          {
            objc_msgSend(v19, "entityIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "state") == 2)
              v21 = v17;
            else
              v21 = v16;
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v21, v20);
            objc_msgSend(v19, "additionalInfo");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v15);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v32, "setObject:forKeyedSubscript:", v23, v20);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v13);
    }

    v8 = v30;
    if (v30)
    {
      Current = CFAbsoluteTimeGetCurrent();
      v25 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
      v26 = v29;
      if (Current - v9 >= 0.01)
      {
        v38 = 0;
        v30[2](v30, &v38, 0.9);
        if (v38)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v41 = 3056;
            v42 = 2080;
            v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v7 = v31;
LABEL_32:

          goto LABEL_33;
        }
        v9 = Current;
      }
    }
    else
    {
      v25 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
      v26 = v29;
    }
    v27 = -[PGPrecisionRecallEvaluation initWithIdentifier:category:]([PGPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("externalAssetRelevance"), CFSTR("externalAssetRelevance"));
    -[PGPhotosChallengeMetricEvent setEvaluation:](v26, "setEvaluation:", v27);

    -[PGPhotosChallengeMetricEvent evaluation](v26, "evaluation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "evaluateWithGroundTruthResults:andInferenceResults:", v33, v32);

    v7 = v31;
    if (v30)
    {
      if (CFAbsoluteTimeGetCurrent() - v9 >= *((double *)v25 + 72))
      {
        v38 = 0;
        v30[2](v30, &v38, 1.0);
        if (v38)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v41 = 3060;
            v42 = 2080;
            v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_32;
  }
  v38 = 0;
  v8[2](v8, &v38, 0.0);
  if (!v38)
  {
    v9 = v10;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v41 = 3040;
    v42 = 2080;
    v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_33:

}

- (void)_gatherMetricsForStoryPromptSuggestionsQuestions:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double v8;
  double Current;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PGAssetsWithReasonPrecisionRecallEvaluation *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  char v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  v8 = 0.0;
  if (v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v22 = 0;
      v7[2](v7, &v22, 0.0);
      if (v22)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v24 = 3067;
          v25 = 2080;
          v26 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_13;
      }
      v8 = Current;
    }
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __95__PGPhotosChallengeMetricEvent__gatherMetricsForStoryPromptSuggestionsQuestions_progressBlock___block_invoke;
  v20 = &unk_1E8435808;
  v11 = v10;
  v21 = v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v17);
  -[PGPhotosChallengeMetricEvent _groundTruthForStoryPromptSuggestionsQuestions:](self, "_groundTruthForStoryPromptSuggestionsQuestions:", v11, v17, v18, v19, v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPhotosChallengeMetricEvent _inferredResultsForEntityIdentifiers:withDefaultBoolValue:](self, "_inferredResultsForEntityIdentifiers:withDefaultBoolValue:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGPhotosChallengeMetricEvent _reasonResultByAssetEntityIdentifierForStoryPromptSuggestionsQuestions:](self, "_reasonResultByAssetEntityIdentifierForStoryPromptSuggestionsQuestions:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PGAssetsWithReasonPrecisionRecallEvaluation initWithIdentifier:category:]([PGAssetsWithReasonPrecisionRecallEvaluation alloc], "initWithIdentifier:category:", CFSTR("storyPromptSuggestions"), CFSTR("storyPromptSuggestions"));
  -[PGAssetsWithReasonPrecisionRecallEvaluation evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:](v16, "evaluateWithGroundTruthResults:inferenceResults:reasonResultByAssetIdentifier:", v12, v14, v15);
  -[PGPhotosChallengeMetricEvent setEvaluation:](self, "setEvaluation:", v16);
  if (v7)
  {
    if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
    {
      v22 = 0;
      v7[2](v7, &v22, 1.0);
      if (v22)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v24 = 3083;
          v25 = 2080;
          v26 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

LABEL_13:
}

- (id)_groundTruthForStoryPromptSuggestionsQuestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = (void *)MEMORY[0x1E0C9AAA0];
    v10 = (void *)MEMORY[0x1E0C9AAB0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "state", (_QWORD)v17) == 2)
          v13 = v10;
        else
          v13 = v9;
        v14 = v13;
        objc_msgSend(v12, "entityIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v15);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_reasonResultByAssetEntityIdentifierForStoryPromptSuggestionsQuestions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v3;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v34)
  {
    v32 = *(_QWORD *)v36;
    v30 = *MEMORY[0x1E0D78118];
    v31 = *MEMORY[0x1E0D78120];
    v4 = *MEMORY[0x1E0D78128];
    v28 = *MEMORY[0x1E0D78130];
    v27 = *MEMORY[0x1E0D77FD0];
    v29 = *MEMORY[0x1E0D78128];
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v36 != v32)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v6, "additionalInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v31);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v30);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "integerValue");

        objc_msgSend(v7, "objectForKeyedSubscript:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "integerValue");

        }
        else
        {
          v13 = -1;
        }

        objc_msgSend(v7, "objectForKeyedSubscript:", v28);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        v16 = CFSTR("no prompt text");
        if (v14)
          v16 = (__CFString *)v14;
        v17 = v16;

        objc_msgSend(v6, "additionalInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v27);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        v21 = CFSTR("<none>");
        if (v19)
          v21 = (__CFString *)v19;
        v22 = v21;

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[isValidated:%@]-[DislikeReason:%@]-[AssetCount:%d]-[MCAvailable:%d]-[PromptText:%@]"), v8, v22, v10, v13, v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "entityIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v23, v24);

        v4 = v29;
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v34);
  }

  return v33;
}

- (id)memoryCategorySubCategoryByQuestionMetricType
{
  _QWORD v3[73];
  _QWORD v4[74];

  v4[73] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E84E4FB8;
  v3[1] = &unk_1E84E5000;
  v4[0] = &unk_1E84EA9A8;
  v4[1] = &unk_1E84EA9C0;
  v3[2] = &unk_1E84E5048;
  v3[3] = &unk_1E84E5060;
  v4[2] = &unk_1E84EA9D8;
  v4[3] = &unk_1E84EA9F0;
  v3[4] = &unk_1E84E5090;
  v3[5] = &unk_1E84E50D8;
  v4[4] = &unk_1E84EAA08;
  v4[5] = &unk_1E84EAA20;
  v3[6] = &unk_1E84E5108;
  v3[7] = &unk_1E84E5120;
  v4[6] = &unk_1E84EAA38;
  v4[7] = &unk_1E84EAA50;
  v3[8] = &unk_1E84E5150;
  v3[9] = &unk_1E84E5180;
  v4[8] = &unk_1E84EAA68;
  v4[9] = &unk_1E84EAA80;
  v3[10] = &unk_1E84E51B0;
  v3[11] = &unk_1E84E51C8;
  v4[10] = &unk_1E84EAA98;
  v4[11] = &unk_1E84EAAB0;
  v3[12] = &unk_1E84E51F8;
  v3[13] = &unk_1E84E5228;
  v4[12] = &unk_1E84EAAC8;
  v4[13] = &unk_1E84EAAE0;
  v3[14] = &unk_1E84E5240;
  v3[15] = &unk_1E84E5270;
  v4[14] = &unk_1E84EAAF8;
  v4[15] = &unk_1E84EAB10;
  v3[16] = &unk_1E84E5288;
  v3[17] = &unk_1E84E52B8;
  v4[16] = &unk_1E84EAB28;
  v4[17] = &unk_1E84EAB40;
  v3[18] = &unk_1E84E52D0;
  v3[19] = &unk_1E84E5300;
  v4[18] = &unk_1E84EAB58;
  v4[19] = &unk_1E84EAB70;
  v3[20] = &unk_1E84E5330;
  v3[21] = &unk_1E84E5348;
  v4[20] = &unk_1E84EAB88;
  v4[21] = &unk_1E84EABA0;
  v3[22] = &unk_1E84E5360;
  v3[23] = &unk_1E84E5390;
  v4[22] = &unk_1E84EABB8;
  v4[23] = &unk_1E84EABD0;
  v3[24] = &unk_1E84E53C0;
  v3[25] = &unk_1E84E53D8;
  v4[24] = &unk_1E84EABE8;
  v4[25] = &unk_1E84EAC00;
  v3[26] = &unk_1E84E5408;
  v3[27] = &unk_1E84E5438;
  v4[26] = &unk_1E84EAC18;
  v4[27] = &unk_1E84EAC30;
  v3[28] = &unk_1E84E5450;
  v3[29] = &unk_1E84E5468;
  v4[28] = &unk_1E84EAC48;
  v4[29] = &unk_1E84EAC60;
  v3[30] = &unk_1E84E5498;
  v3[31] = &unk_1E84E54C8;
  v4[30] = &unk_1E84EAC78;
  v4[31] = &unk_1E84EAC90;
  v3[32] = &unk_1E84E54E0;
  v3[33] = &unk_1E84E54F8;
  v4[32] = &unk_1E84EACA8;
  v4[33] = &unk_1E84EACC0;
  v3[34] = &unk_1E84E5510;
  v3[35] = &unk_1E84E5528;
  v4[34] = &unk_1E84EACD8;
  v4[35] = &unk_1E84EACF0;
  v3[36] = &unk_1E84E5558;
  v3[37] = &unk_1E84E5570;
  v4[36] = &unk_1E84EAD08;
  v4[37] = &unk_1E84EAD20;
  v3[38] = &unk_1E84E5588;
  v3[39] = &unk_1E84E55B8;
  v4[38] = &unk_1E84EAD38;
  v4[39] = &unk_1E84EAD50;
  v3[40] = &unk_1E84E55E8;
  v3[41] = &unk_1E84E5618;
  v4[40] = &unk_1E84EAD68;
  v4[41] = &unk_1E84EAD80;
  v3[42] = &unk_1E84E5648;
  v3[43] = &unk_1E84E5690;
  v4[42] = &unk_1E84EAD98;
  v4[43] = &unk_1E84EADB0;
  v3[44] = &unk_1E84E56C0;
  v3[45] = &unk_1E84E56D8;
  v4[44] = &unk_1E84EADC8;
  v4[45] = &unk_1E84EADE0;
  v3[46] = &unk_1E84E56F0;
  v3[47] = &unk_1E84E5708;
  v4[46] = &unk_1E84EADF8;
  v4[47] = &unk_1E84EAE10;
  v3[48] = &unk_1E84E5720;
  v3[49] = &unk_1E84E5738;
  v4[48] = &unk_1E84EAE28;
  v4[49] = &unk_1E84EAE40;
  v3[50] = &unk_1E84E5750;
  v3[51] = &unk_1E84E5768;
  v4[50] = &unk_1E84EAE58;
  v4[51] = &unk_1E84EAE70;
  v3[52] = &unk_1E84E5780;
  v3[53] = &unk_1E84E5798;
  v4[52] = &unk_1E84EAE88;
  v4[53] = &unk_1E84EAEA0;
  v3[54] = &unk_1E84E57B0;
  v3[55] = &unk_1E84E57C8;
  v4[54] = &unk_1E84EAEB8;
  v4[55] = &unk_1E84EAED0;
  v3[56] = &unk_1E84E57E0;
  v3[57] = &unk_1E84E57F8;
  v4[56] = &unk_1E84EAEE8;
  v4[57] = &unk_1E84EAF00;
  v3[58] = &unk_1E84E5810;
  v3[59] = &unk_1E84E5828;
  v4[58] = &unk_1E84EAF18;
  v4[59] = &unk_1E84EAF30;
  v3[60] = &unk_1E84E5840;
  v3[61] = &unk_1E84E5858;
  v4[60] = &unk_1E84EAF48;
  v4[61] = &unk_1E84EAF60;
  v3[62] = &unk_1E84E5870;
  v3[63] = &unk_1E84E5888;
  v4[62] = &unk_1E84EAF78;
  v4[63] = &unk_1E84EAF90;
  v3[64] = &unk_1E84E58A0;
  v4[64] = &unk_1E84EAFA8;
  v3[65] = &unk_1E84E58B8;
  v4[65] = &unk_1E84EAFC0;
  v3[66] = &unk_1E84E58D0;
  v4[66] = &unk_1E84EAFD8;
  v3[67] = &unk_1E84E5900;
  v4[67] = &unk_1E84EAFF0;
  v3[68] = &unk_1E84E5918;
  v4[68] = &unk_1E84EB008;
  v3[69] = &unk_1E84E5930;
  v4[69] = &unk_1E84EB020;
  v3[70] = &unk_1E84E5948;
  v4[70] = &unk_1E84EB038;
  v3[71] = &unk_1E84E5960;
  v4[71] = &unk_1E84EB050;
  v3[72] = &unk_1E84E5978;
  v4[72] = &unk_1E84EB068;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 73);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)preparePayloadForPrecisionRecallEval:(id)a3 withEvaluations:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v5, "evaluationByReason");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
        objc_msgSend(v5, "evaluationByReason");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "payload");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "mutableCopy");

        objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("questionInfo"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "falseNegatives"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("falseNegativeCount"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "falsePositives"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("falsePositiveCount"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "trueNegatives"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("trueNegativeCount"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "truePositives"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("truePositiveCount"));

        objc_msgSend(v6, "addObject:", v15);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  return v6;
}

- (PGPhotosChallengeMetricEventFetchHelper)metricsCache
{
  return self->_metricsCache;
}

- (void)setMetricsCache:(id)a3
{
  objc_storeStrong((id *)&self->_metricsCache, a3);
}

- (unint64_t)algorithmVersion
{
  return self->_algorithmVersion;
}

- (void)setAlgorithmVersion:(unint64_t)a3
{
  self->_algorithmVersion = a3;
}

- (unint64_t)graphSchemaVersion
{
  return self->_graphSchemaVersion;
}

- (void)setGraphSchemaVersion:(unint64_t)a3
{
  self->_graphSchemaVersion = a3;
}

- (NSString)photoLibrarySize
{
  return self->_photoLibrarySize;
}

- (unint64_t)photosModelVersion
{
  return self->_photosModelVersion;
}

- (void)setPhotosModelVersion:(unint64_t)a3
{
  self->_photosModelVersion = a3;
}

- (unsigned)questionMetricType
{
  return self->_questionMetricType;
}

- (void)setQuestionMetricType:(unsigned __int16)a3
{
  self->_questionMetricType = a3;
}

- (NSString)questionTypeString
{
  return self->_questionTypeString;
}

- (void)setQuestionTypeString:(id)a3
{
  objc_storeStrong((id *)&self->_questionTypeString, a3);
}

- (unint64_t)questionVersion
{
  return self->_questionVersion;
}

- (void)setQuestionVersion:(unint64_t)a3
{
  self->_questionVersion = a3;
}

- (PGPrecisionRecallEvaluation)evaluation
{
  return self->_evaluation;
}

- (void)setEvaluation:(id)a3
{
  objc_storeStrong((id *)&self->_evaluation, a3);
}

- (CLSCurationSession)curationSession
{
  return self->_curationSession;
}

- (void)setCurationSession:(id)a3
{
  objc_storeStrong((id *)&self->_curationSession, a3);
}

- (CLSCurationContext)curationContext
{
  return self->_curationContext;
}

- (void)setCurationContext:(id)a3
{
  objc_storeStrong((id *)&self->_curationContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_curationSession, 0);
  objc_storeStrong((id *)&self->_evaluation, 0);
  objc_storeStrong((id *)&self->_questionTypeString, 0);
  objc_storeStrong((id *)&self->_photoLibrarySize, 0);
  objc_storeStrong((id *)&self->_metricsCache, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_eventLabelingConfiguration, 0);
  objc_storeStrong((id *)&self->_subMetricEvent, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

void __95__PGPhotosChallengeMetricEvent__gatherMetricsForStoryPromptSuggestionsQuestions_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 30)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __73__PGPhotosChallengeMetricEvent__vipPersonIdentifiersWithCurationContext___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  PGPeopleWallpaperSuggesterPersonImportanceAnalyzer *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PGPeopleWallpaperSuggesterPersonImportanceAnalyzer *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[6];

  v3 = a2;
  v11 = -[PGPeopleWallpaperSuggesterFilteringContext initForPeopleInOrientation:]([PGPeopleWallpaperSuggesterFilteringContext alloc], "initForPeopleInOrientation:", a1[7]);
  v4 = [PGPeopleWallpaperSuggesterPersonImportanceAnalyzer alloc];
  objc_msgSend(v3, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = a1[4];
  objc_msgSend(*(id *)(a1[5] + 8), "loggingConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer initWithGraph:curationContext:loggingConnection:](v4, "initWithGraph:curationContext:loggingConnection:", v5, v6, v7);

  objc_msgSend(v11, "normalizedDeviationForVeryImportantPersons");
  -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer setNormalizedDeviationForVeryImportantPersons:](v8, "setNormalizedDeviationForVeryImportantPersons:");
  objc_msgSend(v11, "normalizedDeviationForImportantPersons");
  -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer setNormalizedDeviationForImportantPersons:](v8, "setNormalizedDeviationForImportantPersons:");
  -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer setFavoritePersonsAreVIPs:](v8, "setFavoritePersonsAreVIPs:", objc_msgSend(v11, "favoritePersonsAreVIPs"));
  -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer personInformationsWithProgress:](v8, "personInformationsWithProgress:", &__block_literal_global_65143);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v11, "minimumPersonImportance");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__PGPhotosChallengeMetricEvent__vipPersonIdentifiersWithCurationContext___block_invoke_3;
  v12[3] = &unk_1E84357B8;
  v12[4] = a1[6];
  v12[5] = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

}

void __73__PGPhotosChallengeMetricEvent__vipPersonIdentifiersWithCurationContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "importance") >= *(_QWORD *)(a1 + 40) && objc_msgSend(v7, "importance") != 3)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v7, "personLocalIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v7, "dupedPersonLocalIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v6);

  }
}

void __141__PGPhotosChallengeMetricEvent__gatherNearLiveSuggestionInferencesForQuestions_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (void *)MEMORY[0x1E0D71808];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeLibraryScopeInManagedObjectContext:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71838]), "initWithLibraryScope:", v8);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __141__PGPhotosChallengeMetricEvent__gatherNearLiveSuggestionInferencesForQuestions_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke_403(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "entityIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "state");
    v10 = CFSTR("NO");
    if (v9 == 2)
      v10 = CFSTR("YES");
    v11 = v10;
    objc_msgSend(v7, "additionalInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D77FD0]);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("None");
    if (v13)
      v15 = (__CFString *)v13;
    v16 = v15;

    objc_msgSend(a1[5], "_getInferredReasonFromMatchedConditions:withFallbackReason:", v19, CFSTR("Near-live"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v8);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@->%@]-[%@->%@]"), v11, v16, CFSTR("YES"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[7], "setObject:forKeyedSubscript:", v18, v8);
  }

}

void __153__PGPhotosChallengeMetricEvent__gatherDeferredSuggestionInferencesForQuestions_momentUUIDS_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  NSObject *v26;
  void *v27;
  PGGraphMomentNodeCollection *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  uint8_t buf[16];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "evaluatorWithGraph:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    +[PGGraphMomentNodeCollection momentNodesForUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForUUIDs:inGraph:", *(_QWORD *)(a1 + 40), v3);
    v31 = objc_claimAutoreleasedReturnValue();
    -[NSObject temporarySet](v31, "temporarySet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __153__PGPhotosChallengeMetricEvent__gatherDeferredSuggestionInferencesForQuestions_momentUUIDS_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke_390;
    v41[3] = &unk_1E84356B8;
    v6 = *(void **)(a1 + 56);
    v41[4] = *(_QWORD *)(a1 + 48);
    v42 = v6;
    v32 = v4;
    objc_msgSend(v4, "evaluateObjects:withResultEnumerationBlock:", v5, v41);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(a1 + 64);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "UUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v10);
    }

    +[PGGraphHighlightTypeNodeCollection tripTypeNodesInGraph:](PGGraphHighlightTypeNodeCollection, "tripTypeNodesInGraph:", v3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "highlightGroupNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[MAElementCollection initWithSet:graph:]([PGGraphMomentNodeCollection alloc], "initWithSet:graph:", v8, v3);
    -[PGGraphMomentNodeCollection highlightNodes](v28, "highlightNodes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "highlightGroupNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v15;
    objc_msgSend(v15, "collectionByIntersecting:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "momentNodes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uuids");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 64), "unionSet:", v20);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", CFSTR("Trip with Participant"), *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
      }
      while (v23);
    }

    v26 = v31;
    v4 = v32;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "loggingConnection");
    v26 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_DEFAULT, "Shared library inference: evaluator is nil", buf, 2u);
    }
  }

}

void __153__PGPhotosChallengeMetricEvent__gatherDeferredSuggestionInferencesForQuestions_momentUUIDS_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke_390(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_getInferredReasonFromMatchedConditions:withFallbackReason:", a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v13, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("|%@"), v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }
    v11 = *(void **)(a1 + 40);
    objc_msgSend(v13, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v12);

  }
}

void __70__PGPhotosChallengeMetricEvent__groundTruthByPersonUUIDFromQuestions___block_invoke(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  id *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "metricsCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activePersonUUIDByPersonUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = a1[5];
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v37;
    v30 = *MEMORY[0x1E0D780D8];
    v29 = *MEMORY[0x1E0D77FD0];
    v28 = *MEMORY[0x1E0D77FE0];
    v31 = v5;
    v32 = v3;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v37 != v34)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v7, "entityIdentifier", v28);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0CD16C0];
        objc_msgSend(v5, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localIdentifierWithUUID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "personNodeForPersonLocalIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = objc_msgSend(v7, "state");
          v14 = (void *)MEMORY[0x1E0C9AAA0];
          if (v13 == 2)
            v14 = (void *)MEMORY[0x1E0C9AAB0];
          v15 = v14;
          if (objc_msgSend(v7, "type") == 5)
          {
            v16 = a1;
            objc_msgSend(v7, "additionalInfo");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v30);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("CHILD"));

            if (v19)
            {
              objc_msgSend(v7, "additionalInfo");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKeyedSubscript:", v29);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              v22 = objc_msgSend(v7, "state");
              v23 = (void *)MEMORY[0x1E0C9AAA0];
              a1 = v16;
              if (v22 == 2)
              {
                v24 = objc_msgSend(v21, "isEqualToString:", v28);
                v23 = (void *)MEMORY[0x1E0C9AAA0];
                if (v24)
                  v23 = (void *)MEMORY[0x1E0C9AAB0];
              }
              v25 = v23;

              v15 = v25;
              v3 = v32;
            }
            else
            {
              v3 = v32;
              a1 = v16;
            }
            v5 = v31;
          }
          objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v15, v8);
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "loggingConnection");
          v15 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v7, "entityIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v41 = v27;
            _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Failed to find person node for entity identifier: '%@'", buf, 0xCu);

          }
        }

      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v35);
  }

}

void __105__PGPhotosChallengeMetricEvent__featuredPhotoInferenceResultsForAnswerDateByAssetIds_questionMetricType___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "metricsCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featuredPhotosSuggestionSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "suggesterWithSession:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v9, "canGenerateSuggestionWithAsset:onDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v8 + 24))
  {
    *(_BYTE *)(v8 + 24) = 1;
    *a3 = 1;
  }

}

uint64_t __77__PGPhotosChallengeMetricEvent__deleteOutdatedPetQuestionsWithValidPetUUIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD1728], "deleteQuestions:", *(_QWORD *)(a1 + 32));
}

void __71__PGPhotosChallengeMetricEvent__currentPetInferenceResultsForPetUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id obj;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  objc_msgSend(v15, "graph");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "meNode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__65140;
  v28 = __Block_byref_object_dispose__65141;
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[PGGraphNodeCollection nodesInGraph:](PGGraphPetNodeCollection, "nodesInGraph:", v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __71__PGPhotosChallengeMetricEvent__currentPetInferenceResultsForPetUUIDs___block_invoke_2;
  v23[3] = &unk_1E8435618;
  v23[4] = &v24;
  objc_msgSend(v3, "enumerateNodesUsingBlock:", v23);
  v14 = v3;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v25[5], "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "collection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ownerNodes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsNode:", v18);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v7);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
    }
    while (v4);
  }

  _Block_object_dispose(&v24, 8);
}

void __71__PGPhotosChallengeMetricEvent__currentPetInferenceResultsForPetUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  objc_msgSend(v3, "localIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __76__PGPhotosChallengeMetricEvent__gatherMetricsForPetQuestions_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "graph");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphPetNodeCollection, "nodesInGraph:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __76__PGPhotosChallengeMetricEvent__gatherMetricsForPetQuestions_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __88__PGPhotosChallengeMetricEvent__ageCategoryInferenceResultsForAgeCategoryByPersonUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  NSObject *v20;
  void *v21;
  __int128 v22;
  id obj;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metricsCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activePersonUUIDByPersonUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v24 = a1;
  obj = *(id *)(a1 + 40);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v28;
    *(_QWORD *)&v5 = 138412290;
    v22 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v9, "allKeys", v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedIntegerValue");
        v14 = (void *)MEMORY[0x1E0CD16C0];
        objc_msgSend(v25, "objectForKeyedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localIdentifierWithUUID:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "personNodeForPersonLocalIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          v19 = objc_msgSend(v17, "ageCategory") == v13;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v24 + 48), "setObject:forKeyedSubscript:", v20, v9);
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "loggingConnection");
          v20 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            v32 = v16;
            _os_log_error_impl(&dword_1CA237000, v20, OS_LOG_TYPE_ERROR, "Failed to find person node for person local identifier: '%@'", buf, 0xCu);
          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v6);
  }

}

void __72__PGPhotosChallengeMetricEvent__groundTruthForAgeCategoryFromQuestions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  id obj;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  NSObject *v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metricsCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activePersonUUIDByPersonUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = a1;
  obj = *(id *)(a1 + 40);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v26;
    *(_QWORD *)&v6 = 138412290;
    v21 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "entityIdentifier", v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CD16C0];
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localIdentifierWithUUID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "personNodeForPersonLocalIdentifier:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v10, "additionalInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ageCategory"));
          v17 = objc_claimAutoreleasedReturnValue();

          v29 = v11;
          v30 = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "state") == 2)
            v19 = MEMORY[0x1E0C9AAB0];
          else
            v19 = MEMORY[0x1E0C9AAA0];
          objc_msgSend(*(id *)(v23 + 48), "setObject:forKeyedSubscript:", v19, v18);

        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "loggingConnection");
          v17 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v32 = v11;
            _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Failed to find person node for uuid: '%@'", buf, 0xCu);
          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v7);
  }

}

void __89__PGPhotosChallengeMetricEvent__namingInferenceResultsForContactIdentifierByPersonUUIDs___block_invoke(id *a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id obj;
  void *v22;
  _QWORD v23[4];
  id v24;
  __int128 *p_buf;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 buf;
  uint64_t v31;
  char v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  objc_msgSend(v19, "graph");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "metricsCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activePersonUUIDByPersonUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = a1[5];
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v7, "allKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)MEMORY[0x1E0CD16C0];
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localIdentifierWithUUID:", v12);
          v13 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "personNodeForPersonLocalIdentifier:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            *(_QWORD *)&buf = 0;
            *((_QWORD *)&buf + 1) = &buf;
            v31 = 0x2020000000;
            v32 = 0;
            v23[0] = MEMORY[0x1E0C809B0];
            v23[1] = 3221225472;
            v23[2] = __89__PGPhotosChallengeMetricEvent__namingInferenceResultsForContactIdentifierByPersonUUIDs___block_invoke_272;
            v23[3] = &unk_1E84355A0;
            p_buf = &buf;
            v24 = v10;
            objc_msgSend(v14, "enumerateContactSuggestionsSortedByConfidenceMatchingQuery:usingBlock:", 1, v23);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v15, v7);

            _Block_object_dispose(&buf, 8);
          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "loggingConnection");
            v18 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v9;
              _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "Failed to find person node for person uuid: '%@'", (uint8_t *)&buf, 0xCu);
            }

          }
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "loggingConnection");
          v13 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v9;
            _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "Contact identifier for person: %@ is nil", (uint8_t *)&buf, 0xCu);
          }
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v4);
  }

}

void __89__PGPhotosChallengeMetricEvent__namingInferenceResultsForContactIdentifierByPersonUUIDs___block_invoke_272(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "contactIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

}

void __67__PGPhotosChallengeMetricEvent__groundTruthForNamingFromQuestions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  id obj;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  NSObject *v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metricsCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activePersonUUIDByPersonUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = a1;
  obj = *(id *)(a1 + 40);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v26;
    *(_QWORD *)&v6 = 138412290;
    v21 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "entityIdentifier", v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CD16C0];
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localIdentifierWithUUID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "personNodeForPersonLocalIdentifier:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v10, "additionalInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("contactIdentifier"));
          v17 = objc_claimAutoreleasedReturnValue();

          v29 = v11;
          v30 = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "state") == 2)
            v19 = MEMORY[0x1E0C9AAB0];
          else
            v19 = MEMORY[0x1E0C9AAA0];
          objc_msgSend(*(id *)(v23 + 48), "setObject:forKeyedSubscript:", v19, v18);
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "loggingConnection");
          v17 = objc_claimAutoreleasedReturnValue();

          if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            goto LABEL_14;
          objc_msgSend(v10, "entityIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v21;
          v32 = v18;
          _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "Failed to find person node for entity identifier: '%@'", buf, 0xCu);
        }

LABEL_14:
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v7);
  }

}

void __100__PGPhotosChallengeMetricEvent__frequentLocationInferenceResultsForLocationByAssetIds_locationType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id obj;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  objc_msgSend(v14, "graph");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v7, "allKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "coordinate");
        v18 = 0;
        v19 = &v18;
        v20 = 0x2020000000;
        v21 = 0;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __100__PGPhotosChallengeMetricEvent__frequentLocationInferenceResultsForLocationByAssetIds_locationType___block_invoke_2;
        v17[3] = &unk_1E8435550;
        v17[5] = v11;
        v17[6] = v12;
        v17[4] = &v18;
        objc_msgSend(v3, "enumerateIdentifiersAsCollectionsWithBlock:", v17);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v19 + 24));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v13, v7);

        _Block_object_dispose(&v18, 8);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v4);
  }

}

void __100__PGPhotosChallengeMetricEvent__frequentLocationInferenceResultsForLocationByAssetIds_locationType___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD v5[5];
  __int128 v6;

  objc_msgSend(a3, "addressNodes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __100__PGPhotosChallengeMetricEvent__frequentLocationInferenceResultsForLocationByAssetIds_locationType___block_invoke_3;
  v5[3] = &unk_1E8435528;
  v6 = *(_OWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enumerateNodesUsingBlock:", v5);

}

uint64_t __100__PGPhotosChallengeMetricEvent__frequentLocationInferenceResultsForLocationByAssetIds_locationType___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;
  double v6;

  objc_msgSend(a2, "coordinate");
  result = CLLocationCoordinate2DGetDistanceFrom();
  if (v6 < *MEMORY[0x1E0D72F30])
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __81__PGPhotosChallengeMetricEvent__holidayInferenceResultsForHolidayNameByAssetIds___block_invoke(id *a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id obj;
  void *v23;
  _QWORD v24[4];
  id v25;
  __int128 *p_buf;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 buf;
  uint64_t v32;
  char v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  objc_msgSend(v18, "graph");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "metricsCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentUUIDByAssetIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNodeCollection momentNodeAsCollectionByMomentUUIDForArrayOfMomentUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodeAsCollectionByMomentUUIDForArrayOfMomentUUIDs:inGraph:", v19, v20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = a1[5];
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v7, "allKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v23, "objectForKeyedSubscript:", v9);
          v11 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
          {
            *(_QWORD *)&buf = 0;
            *((_QWORD *)&buf + 1) = &buf;
            v32 = 0x2020000000;
            v33 = 0;
            objc_msgSend(v12, "celebratedHolidayNodes");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __81__PGPhotosChallengeMetricEvent__holidayInferenceResultsForHolidayNameByAssetIds___block_invoke_258;
            v24[3] = &unk_1E8435500;
            v25 = v10;
            p_buf = &buf;
            objc_msgSend(v13, "enumerateNodesUsingBlock:", v24);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v14, v7);

            _Block_object_dispose(&buf, 8);
          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "loggingConnection");
            v17 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v9;
              _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Failed to find moment node for asset with local identifier: '%@'", (uint8_t *)&buf, 0xCu);
            }

          }
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "loggingConnection");
          v11 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v9;
            _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "Holiday Name for asset: %@ is NULL", (uint8_t *)&buf, 0xCu);
          }
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v4);
  }

}

void __81__PGPhotosChallengeMetricEvent__holidayInferenceResultsForHolidayNameByAssetIds___block_invoke_258(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __87__PGPhotosChallengeMetricEvent__publicEventInferenceResultsForPublicEventIdByAssetIds___block_invoke(id *a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id obj;
  void *v23;
  _QWORD v24[4];
  id v25;
  __int128 *p_buf;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 buf;
  uint64_t v32;
  char v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  objc_msgSend(v18, "graph");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "metricsCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentUUIDByAssetIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNodeCollection momentNodeAsCollectionByMomentUUIDForArrayOfMomentUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodeAsCollectionByMomentUUIDForArrayOfMomentUUIDs:inGraph:", v19, v20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = a1[5];
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v7, "allKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v23, "objectForKeyedSubscript:", v9);
          v11 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
          {
            *(_QWORD *)&buf = 0;
            *((_QWORD *)&buf + 1) = &buf;
            v32 = 0x2020000000;
            v33 = 0;
            objc_msgSend(v12, "publicEventNodes");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __87__PGPhotosChallengeMetricEvent__publicEventInferenceResultsForPublicEventIdByAssetIds___block_invoke_250;
            v24[3] = &unk_1E84354D8;
            v25 = v10;
            p_buf = &buf;
            objc_msgSend(v13, "enumerateNodesUsingBlock:", v24);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v14, v7);

            _Block_object_dispose(&buf, 8);
          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "loggingConnection");
            v17 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v9;
              _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Failed to find moment node for asset with local identifier: '%@'", (uint8_t *)&buf, 0xCu);
            }

          }
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "loggingConnection");
          v11 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v9;
            _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "Public Event Identifier for asset: %@ is NULL", (uint8_t *)&buf, 0xCu);
          }
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v4);
  }

}

uint64_t __87__PGPhotosChallengeMetricEvent__publicEventInferenceResultsForPublicEventIdByAssetIds___block_invoke_250(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = objc_msgSend(a2, "muid");
  result = objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue");
  if (v5 == result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __81__PGPhotosChallengeMetricEvent__businessInferenceResultsForBusinessIdByAssetIds___block_invoke(id *a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id obj;
  void *v23;
  _QWORD v24[4];
  id v25;
  __int128 *p_buf;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 buf;
  uint64_t v32;
  char v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  objc_msgSend(v18, "graph");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "metricsCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentUUIDByAssetIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNodeCollection momentNodeAsCollectionByMomentUUIDForArrayOfMomentUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodeAsCollectionByMomentUUIDForArrayOfMomentUUIDs:inGraph:", v19, v20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = a1[5];
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v7, "allKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v23, "objectForKeyedSubscript:", v9);
          v11 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
          {
            *(_QWORD *)&buf = 0;
            *((_QWORD *)&buf + 1) = &buf;
            v32 = 0x2020000000;
            v33 = 0;
            objc_msgSend(v12, "businessNodes");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __81__PGPhotosChallengeMetricEvent__businessInferenceResultsForBusinessIdByAssetIds___block_invoke_244;
            v24[3] = &unk_1E8436430;
            v25 = v10;
            p_buf = &buf;
            objc_msgSend(v13, "enumerateNodesUsingBlock:", v24);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v14, v7);

            _Block_object_dispose(&buf, 8);
          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "loggingConnection");
            v17 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v9;
              _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Failed to find moment node for asset with local identifier: '%@'", (uint8_t *)&buf, 0xCu);
            }

          }
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "loggingConnection");
          v11 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v9;
            _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "Business Identifier for asset: %@ is NULL", (uint8_t *)&buf, 0xCu);
          }
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v4);
  }

}

void __81__PGPhotosChallengeMetricEvent__businessInferenceResultsForBusinessIdByAssetIds___block_invoke_244(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __113__PGPhotosChallengeMetricEvent__relationshipInferenceResultsForQuestionMetricType_personUUIDs_useGraphInference___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metricsCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activePersonUUIDByPersonUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = a1;
  obj = *(id *)(a1 + 40);
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v25)
  {
    v7 = *(_QWORD *)v27;
    v8 = 0x1E0CD1000uLL;
    *(_QWORD *)&v6 = 138412290;
    v22 = v6;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v11 = *(void **)(v8 + 1728);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localIdentifierWithUUID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "personNodeForPersonLocalIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = objc_msgSend(*(id *)(v24 + 32), "_relationshipInferenceResultForPersonNode:questionMetricType:useGraphInference:", v14, *(unsigned __int16 *)(v24 + 56), *(unsigned __int8 *)(v24 + 58));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v24 + 48), "setObject:forKeyedSubscript:", v16, v10);
        }
        else
        {
          v17 = v8;
          v18 = v7;
          v19 = v5;
          v20 = v3;
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "loggingConnection");
          v16 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            v31 = v10;
            _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "Failed to find person node for person with UUID: '%@'", buf, 0xCu);
          }
          v3 = v20;
          v5 = v19;
          v7 = v18;
          v8 = v17;
        }

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v25);
  }

}

void __122__PGPhotosChallengeMetricEvent__gatherMetricsForRelationshipQuestions_questionMetricType_progressBlock_useGraphInference___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  __int16 v12;
  char v13;

  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:](PGGraphPersonNodeCollection, "personNodesExcludingMeInGraph:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __122__PGPhotosChallengeMetricEvent__gatherMetricsForRelationshipQuestions_questionMetricType_progressBlock_useGraphInference___block_invoke_2;
  v8[3] = &unk_1E8435438;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v9 = v4;
  v10 = v5;
  v12 = *(_WORD *)(a1 + 72);
  v13 = *(_BYTE *)(a1 + 74);
  v11 = v6;
  objc_msgSend(v7, "enumerateNodesUsingBlock:", v8);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 48));

}

void __122__PGPhotosChallengeMetricEvent__gatherMetricsForRelationshipQuestions_questionMetricType_progressBlock_useGraphInference___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CD16C0];
  v9 = v3;
  objc_msgSend(v3, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuidFromLocalIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v6);
    v7 = objc_msgSend(*(id *)(a1 + 40), "_relationshipInferenceResultForPersonNode:questionMetricType:useGraphInference:", v9, *(unsigned __int16 *)(a1 + 56), *(unsigned __int8 *)(a1 + 58));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v8, v6);

  }
}

void __109__PGPhotosChallengeMetricEvent__personActivityMeaningInferenceResultsForPersonActivityMeaningLabel_assetIds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metricsCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentUUIDByAssetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v5;
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v3;
  +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v7;
  objc_msgSend(v7, "momentNodeByMomentUUID");
  v26 = a1;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = *(id *)(a1 + 40);
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v28, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "collection");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGGraphMomentNode personActivityMeaningOfMoment](PGGraphMomentNode, "personActivityMeaningOfMoment");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonActivityMeaningNodeCollection, "nodesRelatedToNodes:withRelation:", v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "personActivityMeaningLabels");
          v19 = objc_claimAutoreleasedReturnValue();

          v20 = -[NSObject containsObject:](v19, "containsObject:", *(_QWORD *)(v26 + 48));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v26 + 56), "setObject:forKeyedSubscript:", v21, v12);

        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "loggingConnection");
          v19 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v12;
            _os_log_error_impl(&dword_1CA237000, v19, OS_LOG_TYPE_ERROR, "Failed to find moment node for asset with local identifier: '%@'", buf, 0xCu);
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v9);
  }

}

void __81__PGPhotosChallengeMetricEvent__meaningInferenceResultsForMeaningLabel_assetIds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metricsCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentUUIDByAssetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v5;
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v3;
  +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v7;
  objc_msgSend(v7, "momentNodeByMomentUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 40);
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v24, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "meaningLabelsIncludingParents");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = -[NSObject containsObject:](v17, "containsObject:", *(_QWORD *)(a1 + 48));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v19, v13);

        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "loggingConnection");
          v17 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v13;
            _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Failed to find moment node for asset with local identifier: '%@'", buf, 0xCu);
          }
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v10);
  }

}

void __111__PGPhotosChallengeMetricEvent__meaningInferenceResultsForMeaningLabel_momentUUIDs_isEventLabelingMetricEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  objc_msgSend(v17, "graph");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", *(_QWORD *)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "momentNodeByMomentUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v3, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 40), "_meaningLabelsOfMomentNode:forMeaningLabel:isEventLabelingMetricEvent:", v10, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = -[NSObject containsObject:](v11, "containsObject:", *(_QWORD *)(a1 + 48));
          if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", PGExhaustiveMomentLabellingNoneOfTheseAnswerString))v12 = -[NSObject count](v11, "count") == 0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v13, v8);

        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "loggingConnection");
          v11 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v8;
            _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "Failed to find moment node for moment with uuid: '%@'", buf, 0xCu);
          }
        }

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v5);
  }

}

void __97__PGPhotosChallengeMetricEvent_initWithWorkingContext_questionMetricType_metricEventFetchHelper___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "graph");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PGCuratedLibraryIntelligenceMetricEvent librarySizeRangeDescriptionForLibrarySizeRange:](PGCuratedLibraryIntelligenceMetricEvent, "librarySizeRangeDescriptionForLibrarySizeRange:", objc_msgSend(v6, "librarySizeRange"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v3;

}

+ (id)allMetricEventsWithGraphManager:(id)a3
{
  id v3;
  void *v4;
  PGPhotosChallengeMetricEventFetchHelper *v5;
  unsigned __int16 v6;
  __objc2_class **v7;
  __objc2_class *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __objc2_class *v13;
  void *v14;
  PGPhotosChallengePrecisionRecallByReasonMetricEvent *v15;
  PGSharedLibraryAssetPropertiesMetricEvent *v16;
  void *v17;
  _BOOL4 v18;
  PGPhotosChallengePrecisionRecallByReasonMetricEvent *v19;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGPhotosChallengeMetricEventFetchHelper initWithGraphManager:]([PGPhotosChallengeMetricEventFetchHelper alloc], "initWithGraphManager:", v3);
  v6 = 1;
  v7 = off_1E83FB000;
  do
  {
    switch((char)v6)
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 118:
      case 119:
      case 120:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case -128:
      case -127:
      case -126:
      case -125:
      case -124:
      case -123:
      case -122:
      case -121:
      case -120:
      case -119:
      case -118:
      case -117:
      case -116:
      case -115:
      case -114:
      case -113:
      case -112:
      case -111:
      case -110:
      case -109:
      case -108:
      case -107:
      case -106:
      case -105:
      case -104:
      case -103:
      case -102:
      case -101:
      case -100:
      case -99:
      case -98:
      case -97:
      case -96:
      case -95:
      case -94:
      case -93:
      case -92:
      case -91:
      case -90:
      case -89:
      case -88:
      case -87:
      case -86:
      case -85:
      case -84:
      case -83:
      case -82:
      case -81:
      case -80:
      case -79:
      case -78:
      case -77:
      case -76:
      case -75:
      case -74:
      case -73:
      case -72:
      case -71:
      case -70:
      case -69:
      case -68:
      case -67:
      case -66:
      case -65:
      case -64:
      case -63:
      case -62:
      case -61:
      case -59:
      case -58:
      case -57:
      case -56:
      case -55:
      case -54:
      case -52:
      case -43:
        v8 = PGPhotosChallengeMetricEvent;
        goto LABEL_4;
      case 117:
      case -60:
      case -50:
      case -49:
      case -48:
      case -47:
      case -46:
      case -45:
      case -44:
      case -42:
        v8 = PGPhotosChallengePrecisionRecallByReasonMetricEvent;
LABEL_4:
        v9 = [v8 alloc];
        objc_msgSend(v3, "workingContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithWorkingContext:questionMetricType:metricEventFetchHelper:", v10, v6, v5);

        objc_msgSend(v4, "addObject:", v11);
        goto LABEL_5;
      case -53:
        objc_msgSend(v3, "workingContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v7[90];
        objc_msgSend(v11, "photoLibrary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v13) = -[__objc2_class isSharedLibraryQuestionsEnabledForPhotoLibrary:](v13, "isSharedLibraryQuestionsEnabledForPhotoLibrary:", v14);

        if ((_DWORD)v13)
        {
          v15 = -[PGPhotosChallengeMetricEvent initWithWorkingContext:questionMetricType:metricEventFetchHelper:]([PGPhotosChallengePrecisionRecallByReasonMetricEvent alloc], "initWithWorkingContext:questionMetricType:metricEventFetchHelper:", v11, v6, v5);
          objc_msgSend(v4, "addObject:", v15);
          v16 = -[PGSharedLibraryAssetPropertiesMetricEvent initWithWorkingContext:questionMetricType:metricEventFetchHelper:]([PGSharedLibraryAssetPropertiesMetricEvent alloc], "initWithWorkingContext:questionMetricType:metricEventFetchHelper:", v11, v6, v5);
          -[PGPhotosChallengeMetricEvent setSubMetricEvent:](v15, "setSubMetricEvent:", v16);
          objc_msgSend(v4, "addObject:", v16);

        }
        goto LABEL_13;
      case -51:
        objc_msgSend(v3, "workingContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "photoLibrary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = +[PGCameraLibrarySwitchQuestionFactory isSharedLibraryQuestionsEnabledForPhotoLibrary:](PGCameraLibrarySwitchQuestionFactory, "isSharedLibraryQuestionsEnabledForPhotoLibrary:", v17);

        if (v18)
        {
          v19 = -[PGPhotosChallengeMetricEvent initWithWorkingContext:questionMetricType:metricEventFetchHelper:]([PGPhotosChallengePrecisionRecallByReasonMetricEvent alloc], "initWithWorkingContext:questionMetricType:metricEventFetchHelper:", v11, v6, v5);
          objc_msgSend(v4, "addObject:", v19);

        }
LABEL_13:
        v7 = off_1E83FB000;
LABEL_5:

        break;
      default:
        break;
    }
    v12 = v6++;
  }
  while (v12 < 0xD6);

  return v4;
}

+ (unint64_t)meaningInferenceAlgorithmForQuestionMetricType:(unsigned __int16)a3 withEventLabelingConfiguration:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  v5 = a4;
  if (+[PGEventLabelingConfiguration isEventLabelingEnabled](PGEventLabelingConfiguration, "isEventLabelingEnabled"))
  {
    objc_msgSend((id)objc_opt_class(), "meaningLabelFromMeaningQuestionMetricType:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "useEventLabelingToInferWithMeaningLabel:", v6))
      v7 = 3;
    else
      v7 = 1;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (unsigned)wallpaperSuggestionSubtypeForQuestionMetricType:(unsigned __int16)a3
{
  if (((a3 - 206) & 0xFFFC) != 0)
    return 0;
  else
    return a3 + 446;
}

+ (id)_passedHighPrecisionStringForResult:(BOOL)a3
{
  if (a3)
    return CFSTR("PassedHighPrecision");
  else
    return CFSTR("FailedHighPrecision");
}

+ (id)_passedFilteringStringForResult:(BOOL)a3
{
  if (a3)
    return CFSTR("PassedFiltering");
  else
    return CFSTR("FailedFiltering");
}

+ (id)_isVIPStringForResult:(BOOL)a3
{
  if (a3)
    return CFSTR("IsVIP");
  else
    return CFSTR("NotVIP");
}

+ (BOOL)_isHighPrecisionLandscapeAsset:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "sceneClassifications");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "extendedSceneIdentifier", (_QWORD)v12) == 2147481597)
        {
          objc_msgSend(v3, "curationModel");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "cityNatureModel");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "natureNode");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v5) = objc_msgSend(v10, "passesHighPrecisionWithSignal:", v8);

          goto LABEL_11;
        }
      }
      v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

+ (BOOL)_isHighPrecisionCityscapeAsset:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "sceneClassifications");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "extendedSceneIdentifier", (_QWORD)v12) == 2147481598)
        {
          objc_msgSend(v3, "curationModel");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "cityNatureModel");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "cityNode");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v5) = objc_msgSend(v10, "passesHighPrecisionWithSignal:", v8);

          goto LABEL_11;
        }
      }
      v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

+ (id)meaningLabelFromMeaningQuestionMetricType:(unsigned __int16)a3
{
  if ((a3 - 1) > 0x4C)
    return 0;
  else
    return *off_1E8435860[(unsigned __int16)(a3 - 1)];
}

+ (id)personActivityMeaningLabelFromMeaningQuestionMetricType:(unsigned __int16)a3
{
  if ((a3 - 197) > 5)
    return 0;
  else
    return *off_1E8435AC8[(unsigned __int16)(a3 - 197)];
}

+ (id)relationshipLabelFromRelationshipQuestionMetricType:(unsigned __int16)a3
{
  if ((a3 - 78) > 0x1C)
    return 0;
  else
    return *off_1E8435AF8[(unsigned __int16)(a3 - 78)];
}

+ (unint64_t)algorithmVersionFromQuestionMetricType:(unsigned __int16)a3 withEventLabelingConfiguration:(id)a4
{
  int v4;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t *v8;

  v4 = a3;
  v5 = a4;
  v6 = v5;
  switch(v4)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 210:
      v7 = 5;
      break;
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
      v7 = objc_msgSend(v5, "modelVersion");
      break;
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
      v7 = 4;
      break;
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 112:
    case 113:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 197:
    case 198:
    case 199:
    case 200:
    case 201:
    case 202:
    case 203:
    case 204:
    case 206:
    case 207:
    case 208:
    case 209:
    case 211:
      v7 = 1;
      break;
    case 110:
    case 111:
    case 205:
    case 212:
      v7 = 2;
      break;
    case 114:
    case 115:
      v7 = 201;
      break;
    case 196:
      v8 = (unint64_t *)MEMORY[0x1E0CD1A98];
      goto LABEL_11;
    case 213:
      v8 = (unint64_t *)MEMORY[0x1E0D77F38];
LABEL_11:
      v7 = *v8;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

+ (unsigned)questionTypeFromQuestionMetricType:(unsigned __int16)a3
{
  if ((a3 - 1) > 0xD5)
    return 0;
  else
    return word_1CA8ED6B8[(unsigned __int16)(a3 - 1)];
}

+ (id)questionEntityTypesFromQuestionMetricType:(unsigned __int16)a3
{
  int v3;
  id result;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  int v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  result = &unk_1E84EB080;
  switch(a3)
  {
    case 0u:
    case 0xD7u:
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "loggingConnection");
      v6 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v9 = 67109120;
        v10 = v3;
        _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_INFO, "Unhandled MetricType %d", (uint8_t *)&v9, 8u);
      }

      result = &unk_1E84EB1B8;
      break;
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0xEu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
    case 0x12u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x6Bu:
    case 0x6Cu:
    case 0x6Eu:
    case 0x6Fu:
    case 0x76u:
    case 0x77u:
    case 0xC5u:
    case 0xC6u:
    case 0xC7u:
    case 0xC8u:
    case 0xC9u:
    case 0xCAu:
    case 0xCEu:
    case 0xCFu:
    case 0xD0u:
    case 0xD1u:
    case 0xD4u:
      return result;
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x1Fu:
    case 0x20u:
    case 0x21u:
    case 0x22u:
    case 0x23u:
    case 0x24u:
    case 0x25u:
    case 0x26u:
    case 0x27u:
    case 0x28u:
    case 0x29u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Du:
    case 0x2Eu:
    case 0x2Fu:
    case 0x30u:
    case 0x31u:
    case 0x32u:
    case 0x33u:
    case 0x34u:
    case 0x35u:
    case 0x36u:
    case 0x37u:
    case 0x38u:
    case 0x39u:
    case 0x3Au:
    case 0x3Bu:
    case 0x3Cu:
    case 0x3Du:
    case 0x3Eu:
    case 0x3Fu:
    case 0x40u:
    case 0x41u:
    case 0x42u:
    case 0x43u:
    case 0x44u:
    case 0x45u:
    case 0x46u:
    case 0x47u:
    case 0x48u:
    case 0x49u:
    case 0x4Au:
    case 0x4Bu:
    case 0x4Cu:
    case 0x4Du:
      result = &unk_1E84EB098;
      break;
    case 0x4Eu:
    case 0x4Fu:
    case 0x50u:
    case 0x51u:
    case 0x52u:
    case 0x53u:
    case 0x54u:
    case 0x55u:
    case 0x56u:
    case 0x57u:
    case 0x58u:
    case 0x59u:
    case 0x5Au:
    case 0x5Bu:
    case 0x5Cu:
    case 0x5Du:
    case 0x5Eu:
    case 0x5Fu:
    case 0x60u:
    case 0x61u:
    case 0x62u:
    case 0x63u:
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x67u:
    case 0x68u:
    case 0x69u:
    case 0x6Au:
      result = &unk_1E84EB0B0;
      break;
    case 0x6Du:
    case 0xD2u:
      result = &unk_1E84EB0E0;
      break;
    case 0x70u:
    case 0x71u:
    case 0x72u:
      result = &unk_1E84EB0C8;
      break;
    case 0x73u:
      result = &unk_1E84EB0F8;
      break;
    case 0x74u:
    case 0x75u:
    case 0x78u:
    case 0x79u:
    case 0x7Au:
    case 0x7Bu:
    case 0x7Cu:
    case 0x7Du:
    case 0x7Eu:
    case 0x7Fu:
    case 0x80u:
    case 0x81u:
    case 0x82u:
    case 0x83u:
    case 0x84u:
    case 0x85u:
    case 0x86u:
    case 0x87u:
    case 0x88u:
    case 0x89u:
    case 0x8Au:
    case 0x8Bu:
    case 0x8Cu:
    case 0x8Du:
    case 0x8Eu:
    case 0x8Fu:
    case 0x90u:
    case 0x91u:
    case 0x92u:
    case 0x93u:
    case 0x94u:
    case 0x95u:
    case 0x96u:
    case 0x97u:
    case 0x98u:
    case 0x99u:
    case 0x9Au:
    case 0x9Bu:
    case 0x9Cu:
    case 0x9Du:
    case 0x9Eu:
    case 0x9Fu:
    case 0xA0u:
    case 0xA1u:
    case 0xA2u:
    case 0xA3u:
    case 0xA4u:
    case 0xA5u:
    case 0xA6u:
    case 0xA7u:
    case 0xA8u:
    case 0xA9u:
    case 0xAAu:
    case 0xABu:
    case 0xACu:
    case 0xADu:
    case 0xAEu:
    case 0xAFu:
    case 0xB0u:
    case 0xB1u:
    case 0xB2u:
    case 0xB3u:
    case 0xB4u:
    case 0xB5u:
    case 0xB6u:
    case 0xB7u:
    case 0xB8u:
    case 0xB9u:
    case 0xBAu:
    case 0xBBu:
    case 0xBCu:
    case 0xBDu:
    case 0xBEu:
    case 0xBFu:
    case 0xC0u:
    case 0xC1u:
    case 0xC2u:
    case 0xC3u:
      result = &unk_1E84EB110;
      break;
    case 0xC4u:
    case 0xD5u:
      result = &unk_1E84EB128;
      break;
    case 0xCBu:
      result = &unk_1E84EB140;
      break;
    case 0xCCu:
      result = &unk_1E84EB158;
      break;
    case 0xCDu:
      result = &unk_1E84EB170;
      break;
    case 0xD3u:
      result = &unk_1E84EB188;
      break;
    case 0xD6u:
      result = &unk_1E84EB1A0;
      break;
    default:
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loggingConnection");
      v8 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 67109120;
        v10 = v3;
        _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "Unexpected MetricType %d", (uint8_t *)&v9, 8u);
      }

      result = &unk_1E84EB1D0;
      break;
  }
  return result;
}

+ (id)stringFromQuestionMetricType:(unsigned __int16)a3
{
  if (a3 > 0xD7u)
    return 0;
  else
    return off_1E8435BE0[a3];
}

@end
