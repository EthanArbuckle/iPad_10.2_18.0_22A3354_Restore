@implementation TICandidateBarUsageAnalyzer

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5)
  {
    objc_storeStrong((id *)&self->_currentSession, a3);
    objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_predictionEnabled = objc_msgSend(v9, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE388]);
    self->_continuousPathEnabled = objc_msgSend(v9, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE278]);
    self->_autocorrectionEnabled = objc_msgSend(v9, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE1D8]);
    self->_hwAutocorrectionEnabled = objc_msgSend(v9, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBDF70]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[TITypingSession userActionHistory](self->_currentSession, "userActionHistory", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (!objc_msgSend(v15, "actionType"))
            -[TICandidateBarUsageAnalyzer analyzeWordEntry:](self, "analyzeWordEntry:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

  }
  return a5 != 0;
}

- (void)registerEventSpec
{
  void *v2;
  void *v3;
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
  uint64_t v19;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[11];
  _QWORD v55[2];
  _QWORD v56[22];

  v56[20] = *MEMORY[0x1E0C80C00];
  v46 = (void *)MEMORY[0x1E0DBDB18];
  v2 = (void *)MEMORY[0x1E0DBDB20];
  v55[0] = CFSTR("Tapped");
  v55[1] = CFSTR("Pathed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFieldSpecWithName:allowedValues:", CFSTR("inputMethod"), v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v52;
  v3 = (void *)MEMORY[0x1E0DBDB20];
  v54[0] = CFSTR("None");
  v54[1] = CFSTR("Typed String");
  v54[2] = CFSTR("Autocorrection");
  v54[3] = CFSTR("Prediction");
  v54[4] = CFSTR("Completion");
  v54[5] = CFSTR("Emoji Prediction");
  v54[6] = CFSTR("Emoji Replacement");
  v54[7] = CFSTR("Text Replacement");
  v54[8] = CFSTR("PQT");
  v54[9] = CFSTR("Smart Response");
  v54[10] = CFSTR("Other");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 11);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFieldSpecWithName:allowedValues:", CFSTR("selectionType"), v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v50;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("predictionEnabled"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v49;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("continuousPathEnabled"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v48;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("autocorrectionEnabled"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v47;
  v4 = (void *)MEMORY[0x1E0DBDB20];
  v5 = kFeatureKeyboardUsage;
  TIFeatureUsageAllowedValues();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFieldSpecWithName:allowedValues:", v5, v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v44;
  v6 = (void *)MEMORY[0x1E0DBDB20];
  v7 = kFeatureContinuousPathUsage;
  TIFeatureUsageAllowedValues();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFieldSpecWithName:allowedValues:", v7, v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v42;
  v8 = (void *)MEMORY[0x1E0DBDB20];
  v9 = kFeatureAutocorrectionUsage;
  TIFeatureUsageAllowedValues();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFieldSpecWithName:allowedValues:", v9, v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v56[7] = v40;
  v10 = (void *)MEMORY[0x1E0DBDB20];
  v11 = kFeatureCandidateBarUsage;
  TIFeatureUsageAllowedValues();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFieldSpecWithName:allowedValues:", v11, v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v56[8] = v38;
  v12 = (void *)MEMORY[0x1E0DBDB20];
  v13 = kFeatureMultilingualUsage;
  TIFeatureUsageAllowedValues();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFieldSpecWithName:allowedValues:", v13, v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v56[9] = v36;
  v14 = (void *)MEMORY[0x1E0DBDB20];
  v15 = kFeatureStringTypingSpeed;
  TITypingSpeedAllowedValues();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringFieldSpecWithName:allowedValues:", v15, v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v56[10] = v34;
  v16 = (void *)MEMORY[0x1E0DBDB20];
  v17 = kFeatureStringTypingEngine;
  TITypingEngineAllowedValues();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringFieldSpecWithName:allowedValues:", v17, v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56[11] = v32;
  v18 = (void *)MEMORY[0x1E0DBDB20];
  v19 = kFeatureStringAssetAvailabilityStatus;
  TIAssetAvailabilityStatusAllowedValues();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringFieldSpecWithName:allowedValues:", v19, v31);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v56[12] = v20;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLanguage);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v56[13] = v21;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardRegion);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v56[14] = v22;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardVariant);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v56[15] = v23;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryLanguage);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v56[16] = v24;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryRegion);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v56[17] = v25;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLayout);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v56[18] = v26;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardType);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v56[19] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("candidateBarUsage"), 0, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "registerEventSpec:", v29);

}

- (TICandidateBarUsageAnalyzer)init
{
  TICandidateBarUsageAnalyzer *v2;
  TICandidateBarUsageAnalyzer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TICandidateBarUsageAnalyzer;
  v2 = -[TICandidateBarUsageAnalyzer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TICandidateBarUsageAnalyzer registerEventSpec](v2, "registerEventSpec");
  return v3;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:alignedSession:](TIStandardTypingSessionConfidenceEvaluator, "evaluateConfidenceInSession:alignedSession:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSession, 0);
}

- (void)analyzeWordEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "acceptedCandidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidatesOffered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "candidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = objc_msgSend(v5, "isContinuousPathConversion");
    if ((objc_msgSend(v4, "wordEntryType") & 4) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v5, "proactiveTrigger"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v12,
            v12))
      {
        v11 = 8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = 7;
        }
        else
        {
          if ((objc_msgSend(v5, "isResponseKitCandidate") & 1) == 0)
          {
            objc_msgSend(v5, "candidate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v13, "_containsEmoji") & 1) != 0)
            {
              objc_msgSend(v5, "input");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "length");

              if (!v15)
              {
                v11 = 5;
                goto LABEL_35;
              }
            }
            else
            {

            }
            objc_msgSend(v5, "candidate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v16, "_containsEmoji") & 1) != 0)
            {
              objc_msgSend(v5, "input");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "length");

              if (v18)
              {
                v11 = 6;
                goto LABEL_35;
              }
            }
            else
            {

            }
            objc_msgSend(v5, "input");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "length");

            if (v20)
            {
              objc_msgSend(v5, "candidate");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "corrections");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "autocorrection");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "input");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v21, "isEqualToString:", v24);

              if ((v25 & 1) != 0)
              {
                v11 = 1;
              }
              else
              {
                objc_msgSend(v5, "candidate");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "corrections");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "autocorrection");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "candidate");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v26, "isEqualToString:", v29);

                if ((v30 & 1) != 0)
                {
                  v11 = 2;
                }
                else
                {
                  v44 = 0u;
                  v45 = 0u;
                  v42 = 0u;
                  v43 = 0u;
                  objc_msgSend(v7, "predictions");
                  obj = (id)objc_claimAutoreleasedReturnValue();
                  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
                  if (v41)
                  {
                    v40 = *(_QWORD *)v43;
                    v11 = 4;
LABEL_27:
                    v31 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v43 != v40)
                        objc_enumerationMutation(obj);
                      v32 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v31);
                      objc_msgSend(v5, "candidate");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "candidate");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      v35 = objc_msgSend(v33, "isEqualToString:", v34);

                      if ((v35 & 1) != 0)
                        break;
                      if (v41 == ++v31)
                      {
                        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
                        if (v41)
                          goto LABEL_27;
                        goto LABEL_33;
                      }
                    }
                  }
                  else
                  {
LABEL_33:
                    v11 = 10;
                  }

                }
              }
            }
            else
            {
              v11 = 3;
            }
            goto LABEL_35;
          }
          v11 = 9;
        }
      }
    }
    else
    {
      v11 = 0;
    }
LABEL_35:
    objc_msgSend(v4, "acceptedCandidate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "typingEngine");
    objc_msgSend(v4, "keyboardState");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[TICandidateBarUsageAnalyzer dispatchEventWithInputMethod:typingEngineType:selectionType:keyboardState:](self, "dispatchEventWithInputMethod:typingEngineType:selectionType:keyboardState:", v10, v37, v11, v38);

  }
}

- (void)dispatchEventWithInputMethod:(unint64_t)a3 typingEngineType:(unsigned int)a4 selectionType:(unint64_t)a5 keyboardState:(id)a6
{
  id v9;
  TIKBAnalyticsMetricsContext *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  TIKBAnalyticsMetricsContext *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  __CFString *v22;
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
  void *v50;
  _QWORD v51[20];
  _QWORD v52[22];

  v52[20] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = [TIKBAnalyticsMetricsContext alloc];
  -[TITypingSession sessionParams](self->_currentSession, "sessionParams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeInputModes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingSession sessionParams](self->_currentSession, "sessionParams");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "testingParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[TIKBAnalyticsMetricsContext initWithKeyboardState:activeInputModes:testingParameters:](v10, "initWithKeyboardState:activeInputModes:testingParameters:", v9, v12, v14);

  v51[0] = CFSTR("inputMethod");
  -[TICandidateBarUsageAnalyzer stringFromInputMethod:](self, "stringFromInputMethod:", a3);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v50;
  v51[1] = CFSTR("selectionType");
  -[TICandidateBarUsageAnalyzer stringFromSelectionType:](self, "stringFromSelectionType:", a5);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v49;
  v51[2] = CFSTR("predictionEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_predictionEnabled);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v48;
  v51[3] = CFSTR("continuousPathEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_continuousPathEnabled);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v47;
  v51[4] = CFSTR("autocorrectionEnabled");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = -[TIKBAnalyticsMetricsContext keyboardType](v15, "keyboardType");
  v18 = 18;
  if (v17 == 5)
    v18 = 19;
  objc_msgSend(v16, "numberWithBool:", *((unsigned __int8 *)&self->super.isa + v18));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v46;
  v51[5] = kFeatureKeyboardUsage;
  -[TITypingSession featureUsageMetricsCache](self->_currentSession, "featureUsageMetricsCache");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "featureUsageMetricFromName:forContext:", kFeatureKeyboardUsage, v15);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v44;
  v51[6] = kFeatureContinuousPathUsage;
  -[TITypingSession featureUsageMetricsCache](self->_currentSession, "featureUsageMetricsCache");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "featureUsageMetricFromName:forContext:", kFeatureContinuousPathUsage, v15);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v42;
  v51[7] = kFeatureAutocorrectionUsage;
  -[TITypingSession featureUsageMetricsCache](self->_currentSession, "featureUsageMetricsCache");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "featureUsageMetricFromName:forContext:", kFeatureAutocorrectionUsage, v15);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v40;
  v51[8] = kFeatureCandidateBarUsage;
  -[TITypingSession featureUsageMetricsCache](self->_currentSession, "featureUsageMetricsCache");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "featureUsageMetricFromName:forContext:", kFeatureCandidateBarUsage, v15);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52[8] = v38;
  v51[9] = kFeatureMultilingualUsage;
  -[TITypingSession featureUsageMetricsCache](self->_currentSession, "featureUsageMetricsCache");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "featureUsageMetricFromName:forContext:", kFeatureMultilingualUsage, v15);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[9] = v36;
  v51[10] = kFeatureStringTypingSpeed;
  -[TITypingSession featureUsageMetricsCache](self->_currentSession, "featureUsageMetricsCache");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "featureUsageMetricFromName:forContext:", kFeatureStringTypingSpeed, v15);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52[10] = v34;
  v51[11] = kFeatureStringTypingEngine;
  TIKeyboardCandidateTypingEngineTypeToString();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v52[11] = v33;
  v51[12] = kFeatureStringAssetAvailabilityStatus;
  -[TITypingSession sessionParams](self->_currentSession, "sessionParams");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "assetAvailabilityStatus");
  v21 = CFSTR("Installed");
  if (!v20)
    v21 = CFSTR("Unavailable");
  v22 = v21;
  v52[12] = v22;
  v51[13] = kFeatureStringKeyboardLanguage;
  -[TIAnalyticsMetricsContext inputLanguage](v15, "inputLanguage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52[13] = v23;
  v51[14] = kFeatureStringKeyboardRegion;
  -[TIAnalyticsMetricsContext inputRegion](v15, "inputRegion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52[14] = v24;
  v51[15] = kFeatureStringKeyboardVariant;
  -[TIKBAnalyticsMetricsContext inputVariant](v15, "inputVariant");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v52[15] = v25;
  v51[16] = kFeatureStringKeyboardSecondaryLanguage;
  -[TIKBAnalyticsMetricsContext secondaryLanguage](v15, "secondaryLanguage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52[16] = v26;
  v51[17] = kFeatureStringKeyboardSecondaryRegion;
  -[TIKBAnalyticsMetricsContext secondaryRegion](v15, "secondaryRegion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v52[17] = v27;
  v51[18] = kFeatureStringKeyboardLayout;
  -[TIKBAnalyticsMetricsContext layoutName](v15, "layoutName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v52[18] = v28;
  v51[19] = kFeatureStringKeyboardType;
  +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:](TIKBAnalyticsMetricsContext, "keyboardTypeEnumToString:", -[TIKBAnalyticsMetricsContext keyboardType](v15, "keyboardType"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v52[19] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 20);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKBAnalyticsMetricsContext testingParameters](v15, "testingParameters");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dispatchEventWithName:payload:testingParameters:allowSparsePayload:", CFSTR("candidateBarUsage"), v32, v31, 0);

}

- (id)stringFromInputMethod:(unint64_t)a3
{
  if (a3)
    return CFSTR("Pathed");
  else
    return CFSTR("Tapped");
}

- (id)stringFromSelectionType:(unint64_t)a3
{
  if (a3 - 1 > 9)
    return CFSTR("None");
  else
    return off_1EA102C40[a3 - 1];
}

@end
