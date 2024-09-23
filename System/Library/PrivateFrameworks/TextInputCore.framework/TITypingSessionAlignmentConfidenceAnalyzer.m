@implementation TITypingSessionAlignmentConfidenceAnalyzer

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  NSMutableDictionary *payload;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  TIKBAnalyticsMetricsContext *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  TIKBAnalyticsMetricsContext *v24;
  NSMutableDictionary *v25;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  id v31;

  v9 = a3;
  v10 = a4;
  if (a5)
  {
    v31 = v10;
    objc_storeStrong((id *)&self->_session, a3);
    objc_storeStrong((id *)&self->_alignedSession, a4);
    -[TITypingSessionAlignmentConfidenceAnalyzer _generateCountsOfWordsForAlignmentConfidences](self, "_generateCountsOfWordsForAlignmentConfidences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](self->_payload, "addEntriesFromDictionary:", v11);
    payload = self->_payload;
    -[TITypingSessionAlignmentConfidenceAnalyzer _generatePercentageOfTotalWordsForAlignmentConfidencesFromRawCounts:](self, "_generatePercentageOfTotalWordsForAlignmentConfidencesFromRawCounts:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](payload, "addEntriesFromDictionary:", v13);

    +[TIStandardTypingSessionConfidenceEvaluator calculateAlignedTypingSessionConfidence:](TIStandardTypingSessionConfidenceEvaluator, "calculateAlignedTypingSessionConfidence:", self->_alignedSession);
    objc_msgSend(MEMORY[0x1E0DBDB38], "bucketPercentageWithValue:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v14, kFeatureStringSessionAlignmentConfidence);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TITypingSessionAligned success](self->_alignedSession, "success"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v15, CFSTR("sessionAlignmentSuccess"));

    -[TITypingSession userActionHistory](self->_session, "userActionHistory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "keyboardState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = [TIKBAnalyticsMetricsContext alloc];
    -[TITypingSession sessionParams](self->_session, "sessionParams");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activeInputModes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypingSession sessionParams](self->_session, "sessionParams");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "testingParameters");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[TIKBAnalyticsMetricsContext initWithKeyboardState:activeInputModes:testingParameters:](v19, "initWithKeyboardState:activeInputModes:testingParameters:", v18, v21, v23);

    v25 = self->_payload;
    -[TITypingSessionAlignmentConfidenceAnalyzer _generateMetadataForTypingSessionFromContext:](self, "_generateMetadataForTypingSessionFromContext:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](v25, "addEntriesFromDictionary:", v26);

    v27 = self->_payload;
    -[TITypingSessionAlignmentConfidenceAnalyzer _generateFeatureUsageMetricsForContext:](self, "_generateFeatureUsageMetricsForContext:", v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](v27, "addEntriesFromDictionary:", v28);

    v29 = (void *)-[NSMutableDictionary copy](self->_payload, "copy");
    -[TITypingSessionAlignmentConfidenceAnalyzer dispatchEventWithPayload:](self, "dispatchEventWithPayload:", v29);

    v10 = v31;
  }

  return a5 != 0;
}

- (id)_generatePercentageOfTotalWordsForAlignmentConfidencesFromRawCounts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
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

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("totalAlignedWords"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (v6 < 1)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA140360, CFSTR("fractionWordsAlignmentConfidenceHigh"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA140360, CFSTR("fractionWordsAlignmentConfidenceMid"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA140360, CFSTR("fractionWordsAlignmentConfidenceLow"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA140360, CFSTR("fractionWordsAlignmentConfidenceNone"));
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("countWordsAlignmentConfidenceHigh"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("totalAlignedWords"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bucketPercentageWithNumerator:andDenominator:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("fractionWordsAlignmentConfidenceHigh"));

    v11 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("countWordsAlignmentConfidenceMid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("totalAlignedWords"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bucketPercentageWithNumerator:andDenominator:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("fractionWordsAlignmentConfidenceMid"));

    v15 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("countWordsAlignmentConfidenceLow"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("totalAlignedWords"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bucketPercentageWithNumerator:andDenominator:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("fractionWordsAlignmentConfidenceLow"));

    v19 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("countWordsAlignmentConfidenceNone"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("totalAlignedWords"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bucketPercentageWithNumerator:andDenominator:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("fractionWordsAlignmentConfidenceNone"));

  }
  return v4;
}

- (id)_generateFeatureUsageMetricsForContext:(id)a3
{
  TITypingSession *session;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[7];

  v15[6] = *MEMORY[0x1E0C80C00];
  session = self->_session;
  v4 = a3;
  -[TITypingSession featureUsageMetricsCache](session, "featureUsageMetricsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = kFeatureKeyboardUsage;
  objc_msgSend(v5, "featureUsageMetricFromName:forContext:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v14[1] = kFeatureContinuousPathUsage;
  objc_msgSend(v5, "featureUsageMetricFromName:forContext:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  v14[2] = kFeatureCandidateBarUsage;
  objc_msgSend(v5, "featureUsageMetricFromName:forContext:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  v14[3] = kFeatureAutocorrectionUsage;
  objc_msgSend(v5, "featureUsageMetricFromName:forContext:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  v14[4] = kFeatureMultilingualUsage;
  objc_msgSend(v5, "featureUsageMetricFromName:forContext:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v10;
  v14[5] = kFeatureStringTypingSpeed;
  objc_msgSend(v5, "featureUsageMetricFromName:forContext:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

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
  _QWORD v48[26];

  v48[24] = *MEMORY[0x1E0C80C00];
  v39 = (void *)MEMORY[0x1E0DBDB18];
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("countWordsAlignmentConfidenceHigh"), &unk_1EA140360, 0, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v47;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("countWordsAlignmentConfidenceMid"), &unk_1EA140360, 0, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v46;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("countWordsAlignmentConfidenceLow"), &unk_1EA140360, 0, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v45;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("countWordsAlignmentConfidenceNone"), &unk_1EA140360, 0, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v44;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("totalAlignedWords"), &unk_1EA140360, 0, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v43;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("fractionWordsAlignmentConfidenceHigh"), &unk_1EA140360, 0, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v42;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("fractionWordsAlignmentConfidenceMid"), &unk_1EA140360, 0, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v41;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("fractionWordsAlignmentConfidenceLow"), &unk_1EA140360, 0, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v40;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("fractionWordsAlignmentConfidenceNone"), &unk_1EA140360, 0, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v38;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("sessionAlignmentSuccess"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v48[9] = v37;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", kFeatureStringSessionAlignmentConfidence, &unk_1EA140360, 0, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48[10] = v36;
  v2 = (void *)MEMORY[0x1E0DBDB20];
  v3 = kFeatureKeyboardUsage;
  TIFeatureUsageAllowedValues();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFieldSpecWithName:allowedValues:", v3, v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48[11] = v34;
  v4 = (void *)MEMORY[0x1E0DBDB20];
  v5 = kFeatureContinuousPathUsage;
  TIFeatureUsageAllowedValues();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFieldSpecWithName:allowedValues:", v5, v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48[12] = v32;
  v6 = (void *)MEMORY[0x1E0DBDB20];
  v7 = kFeatureAutocorrectionUsage;
  TIFeatureUsageAllowedValues();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFieldSpecWithName:allowedValues:", v7, v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v48[13] = v30;
  v8 = (void *)MEMORY[0x1E0DBDB20];
  v9 = kFeatureCandidateBarUsage;
  TIFeatureUsageAllowedValues();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFieldSpecWithName:allowedValues:", v9, v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48[14] = v28;
  v10 = (void *)MEMORY[0x1E0DBDB20];
  v11 = kFeatureMultilingualUsage;
  TIFeatureUsageAllowedValues();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFieldSpecWithName:allowedValues:", v11, v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48[15] = v26;
  v12 = (void *)MEMORY[0x1E0DBDB20];
  v13 = kFeatureStringTypingSpeed;
  TITypingSpeedAllowedValues();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFieldSpecWithName:allowedValues:", v13, v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[16] = v14;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLanguage);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v48[17] = v15;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardRegion);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[18] = v16;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardVariant);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48[19] = v17;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryLanguage);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48[20] = v18;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryRegion);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48[21] = v19;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLayout);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v48[22] = v20;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardType);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48[23] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("alignmentConfidence"), 0, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "registerEventSpec:", v23);

}

- (id)_generateCountsOfWordsForAlignmentConfidences
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("countWordsAlignmentConfidenceHigh"), &unk_1EA140360, CFSTR("countWordsAlignmentConfidenceMid"), &unk_1EA140360, CFSTR("countWordsAlignmentConfidenceLow"), &unk_1EA140360, CFSTR("countWordsAlignmentConfidenceNone"), &unk_1EA140360, CFSTR("totalAlignedWords"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[TITypingSessionAligned alignedEntries](self->_alignedSession, "alignedEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "inSessionAlignmentConfidence");
        switch(v9)
        {
          case 1:
            v10 = (void *)MEMORY[0x1E0CB37E8];
            v11 = v3;
            v12 = CFSTR("countWordsAlignmentConfidenceLow");
            goto LABEL_12;
          case 2:
            v10 = (void *)MEMORY[0x1E0CB37E8];
            v11 = v3;
            v12 = CFSTR("countWordsAlignmentConfidenceMid");
            goto LABEL_12;
          case 3:
            v10 = (void *)MEMORY[0x1E0CB37E8];
            v11 = v3;
            v12 = CFSTR("countWordsAlignmentConfidenceHigh");
LABEL_12:
            objc_msgSend(v11, "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "numberWithInt:", objc_msgSend(v13, "intValue") + 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v3;
            v16 = v14;
            v17 = v12;
            goto LABEL_14;
        }
        v18 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("countWordsAlignmentConfidenceNone"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "numberWithInt:", objc_msgSend(v13, "intValue") + 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v3;
        v16 = v14;
        v17 = CFSTR("countWordsAlignmentConfidenceNone");
LABEL_14:
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v17);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[TITypingSessionAligned alignedEntries](self->_alignedSession, "alignedEntries");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("totalAlignedWords"));

  return v3;
}

- (TITypingSessionAlignmentConfidenceAnalyzer)init
{
  TITypingSessionAlignmentConfidenceAnalyzer *v2;
  uint64_t v3;
  NSMutableDictionary *payload;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TITypingSessionAlignmentConfidenceAnalyzer;
  v2 = -[TITypingSessionAlignmentConfidenceAnalyzer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    payload = v2->_payload;
    v2->_payload = (NSMutableDictionary *)v3;

    -[TITypingSessionAlignmentConfidenceAnalyzer registerEventSpec](v2, "registerEventSpec");
  }
  return v2;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:alignedSession:](TIStandardTypingSessionConfidenceEvaluator, "evaluateConfidenceInSession:alignedSession:", a3, a4);
}

- (void)dispatchEventWithPayload:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DBDB30];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchEventWithName:payload:testingParameters:allowSparsePayload:", CFSTR("alignmentConfidence"), v4, 0, 1);

}

- (id)_generateMetadataForTypingSessionFromContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[7];
  _QWORD v15[8];

  v15[7] = *MEMORY[0x1E0C80C00];
  v14[0] = kFeatureStringKeyboardLanguage;
  v3 = a3;
  objc_msgSend(v3, "inputLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v14[1] = kFeatureStringKeyboardRegion;
  objc_msgSend(v3, "inputRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = kFeatureStringKeyboardVariant;
  objc_msgSend(v3, "inputVariant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v6;
  v14[3] = kFeatureStringKeyboardSecondaryLanguage;
  objc_msgSend(v3, "secondaryLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v7;
  v14[4] = kFeatureStringKeyboardSecondaryRegion;
  objc_msgSend(v3, "secondaryRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v8;
  v14[5] = kFeatureStringKeyboardLayout;
  objc_msgSend(v3, "layoutName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v9;
  v14[6] = kFeatureStringKeyboardType;
  v10 = objc_msgSend(v3, "keyboardType");

  +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:](TIKBAnalyticsMetricsContext, "keyboardTypeEnumToString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_alignedSession, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
