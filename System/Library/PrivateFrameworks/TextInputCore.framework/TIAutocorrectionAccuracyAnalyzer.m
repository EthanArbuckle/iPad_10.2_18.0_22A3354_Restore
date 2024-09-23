@implementation TIAutocorrectionAccuracyAnalyzer

- (void)registerEventSpec
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
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
  void *v34;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[2];
  _QWORD v51[19];

  v51[17] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", CFSTR("outcome"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v49;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", CFSTR("alignmentConfidence"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v48;
  v2 = (void *)MEMORY[0x1E0DBDB20];
  v3 = kFeatureKeyboardUsage;
  TIFeatureUsageAllowedValues();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFieldSpecWithName:allowedValues:", v3, v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v46;
  v4 = (void *)MEMORY[0x1E0DBDB20];
  v5 = kFeatureContinuousPathUsage;
  TIFeatureUsageAllowedValues();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFieldSpecWithName:allowedValues:", v5, v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v44;
  v6 = (void *)MEMORY[0x1E0DBDB20];
  v7 = kFeatureAutocorrectionUsage;
  TIFeatureUsageAllowedValues();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFieldSpecWithName:allowedValues:", v7, v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v42;
  v8 = (void *)MEMORY[0x1E0DBDB20];
  v9 = kFeatureCandidateBarUsage;
  TIFeatureUsageAllowedValues();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFieldSpecWithName:allowedValues:", v9, v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = v40;
  v10 = (void *)MEMORY[0x1E0DBDB20];
  v11 = kFeatureMultilingualUsage;
  TIFeatureUsageAllowedValues();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFieldSpecWithName:allowedValues:", v11, v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v51[6] = v38;
  v12 = (void *)MEMORY[0x1E0DBDB20];
  v13 = kFeatureStringTypingSpeed;
  TITypingSpeedAllowedValues();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFieldSpecWithName:allowedValues:", v13, v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = v36;
  v14 = (void *)MEMORY[0x1E0DBDB20];
  v15 = kFeatureStringTypingEngine;
  TITypingEngineAllowedValues();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringFieldSpecWithName:allowedValues:", v15, v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v51[8] = v34;
  v16 = (void *)MEMORY[0x1E0DBDB20];
  v17 = kFeatureStringAssetAvailabilityStatus;
  TIAssetAvailabilityStatusAllowedValues();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringFieldSpecWithName:allowedValues:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v51[9] = v19;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLanguage);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v51[10] = v20;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardRegion);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v51[11] = v21;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardVariant);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v51[12] = v22;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryLanguage);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v51[13] = v23;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryRegion);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51[14] = v24;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLayout);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51[15] = v25;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardType);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v51[16] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v50[0] = v27;
  fieldNameSuffices();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  fieldSpecWithSuffices(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  concatArrays(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB18], "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("autocorrectionAccuracy"), 0, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "registerEventSpec:", v32);

}

- (TIAutocorrectionAccuracyAnalyzer)init
{
  TIAutocorrectionAccuracyAnalyzer *v2;
  TIAutocorrectionAccuracyAnalyzer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIAutocorrectionAccuracyAnalyzer;
  v2 = -[TIAutocorrectionAccuracyAnalyzer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TIAutocorrectionAccuracyAnalyzer registerEventSpec](v2, "registerEventSpec");
  return v3;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:alignedSession:](TIStandardTypingSessionConfidenceEvaluator, "evaluateConfidenceInSession:alignedSession:", a3, a4);
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_storeStrong((id *)&self->_currentSession, a3);
  if (a5)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v10, "alignedEntries", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          if (!-[TIAutocorrectionAccuracyAnalyzer analyzeWordEntryAligned:](self, "analyzeWordEntryAligned:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i)))
          {
            v16 = 0;
            goto LABEL_12;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v13)
          continue;
        break;
      }
    }
    v16 = 1;
LABEL_12:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSession, 0);
}

- (BOOL)analyzeWordEntryAligned:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TIKBAnalyticsMetricsContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TIKBAnalyticsMetricsContext *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  id v51;
  _QWORD v52[2];
  _QWORD v53[14];
  _QWORD v54[14];
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "originalWord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [TIKBAnalyticsMetricsContext alloc];
  -[TITypingSession sessionParams](self->_currentSession, "sessionParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeInputModes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingSession sessionParams](self->_currentSession, "sessionParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "testingParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[TIKBAnalyticsMetricsContext initWithKeyboardState:activeInputModes:testingParameters:](v7, "initWithKeyboardState:activeInputModes:testingParameters:", v6, v9, v11);

  v13 = objc_alloc(MEMORY[0x1E0C99DC8]);
  -[TIAnalyticsMetricsContext inputLanguageAndRegion](v12, "inputLanguageAndRegion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithLocaleIdentifier:", v14);

  if (v15)
  {
    payloadForWordEntryAligned(v4, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = v16;
      v53[0] = kFeatureKeyboardUsage;
      -[TITypingSession featureUsageMetricsCache](self->_currentSession, "featureUsageMetricsCache");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "featureUsageMetricFromName:forContext:", kFeatureKeyboardUsage, v12);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v47;
      v53[1] = kFeatureContinuousPathUsage;
      -[TITypingSession featureUsageMetricsCache](self->_currentSession, "featureUsageMetricsCache");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "featureUsageMetricFromName:forContext:", kFeatureContinuousPathUsage, v12);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v45;
      v53[2] = kFeatureAutocorrectionUsage;
      -[TITypingSession featureUsageMetricsCache](self->_currentSession, "featureUsageMetricsCache");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "featureUsageMetricFromName:forContext:", kFeatureAutocorrectionUsage, v12);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v54[2] = v43;
      v53[3] = kFeatureCandidateBarUsage;
      -[TITypingSession featureUsageMetricsCache](self->_currentSession, "featureUsageMetricsCache");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "featureUsageMetricFromName:forContext:", kFeatureCandidateBarUsage, v12);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v54[3] = v41;
      v53[4] = kFeatureMultilingualUsage;
      -[TITypingSession featureUsageMetricsCache](self->_currentSession, "featureUsageMetricsCache");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "featureUsageMetricFromName:forContext:", kFeatureMultilingualUsage, v12);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v54[4] = v39;
      v53[5] = kFeatureStringTypingSpeed;
      -[TITypingSession featureUsageMetricsCache](self->_currentSession, "featureUsageMetricsCache");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "featureUsageMetricFromName:forContext:", kFeatureStringTypingSpeed, v12);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v54[5] = v37;
      v53[6] = kFeatureStringAssetAvailabilityStatus;
      -[TITypingSession sessionParams](self->_currentSession, "sessionParams");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v36, "assetAvailabilityStatus");
      v19 = CFSTR("Installed");
      if (!v18)
        v19 = CFSTR("Unavailable");
      v35 = v19;
      v54[6] = v35;
      v53[7] = kFeatureStringKeyboardLanguage;
      -[TIAnalyticsMetricsContext inputLanguage](v12, "inputLanguage");
      v49 = v17;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v54[7] = v20;
      v53[8] = kFeatureStringKeyboardRegion;
      -[TIAnalyticsMetricsContext inputRegion](v12, "inputRegion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v54[8] = v21;
      v53[9] = kFeatureStringKeyboardVariant;
      -[TIKBAnalyticsMetricsContext inputVariant](v12, "inputVariant");
      v51 = v4;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v54[9] = v22;
      v53[10] = kFeatureStringKeyboardSecondaryLanguage;
      -[TIKBAnalyticsMetricsContext secondaryLanguage](v12, "secondaryLanguage");
      v50 = v6;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v54[10] = v23;
      v53[11] = kFeatureStringKeyboardSecondaryRegion;
      -[TIKBAnalyticsMetricsContext secondaryRegion](v12, "secondaryRegion");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v54[11] = v24;
      v53[12] = kFeatureStringKeyboardLayout;
      -[TIKBAnalyticsMetricsContext layoutName](v12, "layoutName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v54[12] = v25;
      v53[13] = kFeatureStringKeyboardType;
      +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:](TIKBAnalyticsMetricsContext, "keyboardTypeEnumToString:", -[TIKBAnalyticsMetricsContext keyboardType](v12, "keyboardType"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v54[13] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v50;
      v4 = v51;

      v28 = v49;
      v52[0] = v27;
      v52[1] = v49;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      mergeDicts(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKBAnalyticsMetricsContext testingParameters](v12, "testingParameters");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "dispatchEventWithName:payload:testingParameters:allowSparsePayload:", CFSTR("autocorrectionAccuracy"), v30, v32, 1);

    }
    else
    {
      v28 = 0;
    }
  }
  else
  {
    IXADefaultLogFacility();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Input context has no locale"), "-[TIAutocorrectionAccuracyAnalyzer analyzeWordEntryAligned:]");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v33;
      _os_log_error_impl(&dword_1DA6F2000, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }

  return v15 != 0;
}

- (TITypingSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentSession, a3);
}

@end
