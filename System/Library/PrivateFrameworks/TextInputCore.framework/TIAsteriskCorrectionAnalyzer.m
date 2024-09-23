@implementation TIAsteriskCorrectionAnalyzer

- (void)registerEventSpec
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
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
  _QWORD v48[19];

  v48[17] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DBDB18];
  v3 = (void *)MEMORY[0x1E0DBDB20];
  TIACCorrectionTypeValues();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFieldSpecWithName:allowedValues:", CFSTR("correctionType"), v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v46;
  objc_msgSend(MEMORY[0x1E0DBDB20], "enumFieldSpecWithName:", CFSTR("prevMessageAutoCorrectionType"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v45;
  v4 = (void *)MEMORY[0x1E0DBDB20];
  v5 = &unk_1EA13FF28;
  objc_msgSend(v4, "stringFieldSpecWithName:allowedValues:", CFSTR("bundleId"), &unk_1EA13FF28);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v44;
  v6 = (void *)MEMORY[0x1E0DBDB20];
  v7 = kFeatureKeyboardUsage;
  TIFeatureUsageAllowedValues();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFieldSpecWithName:allowedValues:", v7, v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v42;
  v8 = (void *)MEMORY[0x1E0DBDB20];
  v9 = kFeatureContinuousPathUsage;
  TIFeatureUsageAllowedValues();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFieldSpecWithName:allowedValues:", v9, v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v40;
  v10 = (void *)MEMORY[0x1E0DBDB20];
  v11 = kFeatureAutocorrectionUsage;
  TIFeatureUsageAllowedValues();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFieldSpecWithName:allowedValues:", v11, v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v38;
  v12 = (void *)MEMORY[0x1E0DBDB20];
  v13 = kFeatureCandidateBarUsage;
  TIFeatureUsageAllowedValues();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFieldSpecWithName:allowedValues:", v13, v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v36;
  v14 = (void *)MEMORY[0x1E0DBDB20];
  v15 = kFeatureMultilingualUsage;
  TIFeatureUsageAllowedValues();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringFieldSpecWithName:allowedValues:", v15, v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v34;
  v16 = (void *)MEMORY[0x1E0DBDB20];
  v17 = kFeatureStringTypingSpeed;
  TITypingSpeedAllowedValues();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringFieldSpecWithName:allowedValues:", v17, v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v32;
  v18 = (void *)MEMORY[0x1E0DBDB20];
  v19 = kFeatureStringAssetAvailabilityStatus;
  TIAssetAvailabilityStatusAllowedValues();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringFieldSpecWithName:allowedValues:", v19, v31);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v48[9] = v20;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLanguage);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48[10] = v21;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardRegion);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v48[11] = v22;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardVariant);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48[12] = v23;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryLanguage);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v48[13] = v24;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryRegion);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v48[14] = v25;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLayout);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48[15] = v26;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardType);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v48[16] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 17);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("asteriskCorrection"), 0, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "registerEventSpec:", v29);

}

- (TIAsteriskCorrectionAnalyzer)init
{
  TIAsteriskCorrectionAnalyzer *v2;
  TIAsteriskCorrectionAnalyzer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIAsteriskCorrectionAnalyzer;
  v2 = -[TIAsteriskCorrectionAnalyzer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TIAsteriskCorrectionAnalyzer registerEventSpec](v2, "registerEventSpec");
  return v3;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:alignedSession:](TIStandardTypingSessionConfidenceEvaluator, "evaluateConfidenceInSession:alignedSession:", a3, a4);
}

- (BOOL)checkIfSession:(id)a3 isFromAllowedApp:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "applicationID", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = objc_msgSend(v11, "isEqualToString:", v10);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  TIAsteriskCorrectionMessageEvent *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  int v24;
  TITypingSession *v25;
  void *v26;
  TITypingSession *v27;
  void *v28;
  void *v29;
  TIAsteriskCorrectionMessageEvent *v30;
  uint64_t v31;
  uint64_t v32;
  TIAsteriskCorrectionMessageEvent *v33;
  void *v34;
  TIAsteriskCorrectionMessageEvent *v35;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (a5)
  {
    v10 = &unk_1EA13FF28;
    v11 = -[TIAsteriskCorrectionAnalyzer checkIfSession:isFromAllowedApp:](self, "checkIfSession:isFromAllowedApp:", v8, &unk_1EA13FF28);

    if (v11)
    {
      v37 = v9;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v39 = v8;
      objc_msgSend(v8, "userActionHistory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (!v14)
      {
        v16 = 0;
        goto LABEL_26;
      }
      v15 = v14;
      v41 = 0;
      v16 = 0;
      v17 = 1;
      v18 = *(_QWORD *)v43;
      v38 = v13;
      while (1)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v43 != v18)
            objc_enumerationMutation(v13);
          v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if (objc_msgSend(v20, "actionType"))
          {
            objc_msgSend(v20, "documentState");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v21, "documentIsEmpty") || !objc_msgSend(v12, "count"))
            {

              goto LABEL_21;
            }
            if (objc_msgSend(v20, "actionType") == 2)
            {

            }
            else
            {
              v24 = objc_msgSend(v20, "actionType");

              if (v24 != 11)
                goto LABEL_21;
            }
            v25 = [TITypingSession alloc];
            objc_msgSend(v39, "locale");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = -[TITypingSession initWithLocale:keyboardLayout:](v25, "initWithLocale:keyboardLayout:", v26, 0);

            objc_msgSend(v39, "sessionParams");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[TITypingSession setSessionParams:](v27, "setSessionParams:", v28);

            objc_msgSend(v39, "featureUsageMetricsCache");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[TITypingSession setFeatureUsageMetricsCache:](v27, "setFeatureUsageMetricsCache:", v29);

            -[TITypingSession setUserActionHistory:](v27, "setUserActionHistory:", v12);
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v40 = objc_claimAutoreleasedReturnValue();

            v30 = [TIAsteriskCorrectionMessageEvent alloc];
            objc_msgSend(v39, "applicationID");
            v31 = v15;
            v32 = v18;
            v33 = v16;
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = -[TIAsteriskCorrectionMessageEvent initWithSession:andPrevMsgAutocorrectionType:andBundleId:](v30, "initWithSession:andPrevMsgAutocorrectionType:andBundleId:", v27, v41, v34);

            v18 = v32;
            v15 = v31;

            -[TIAsteriskCorrectionMessageEvent analyzeEvent](v35, "analyzeEvent");
            v41 = v17;
            v17 = 1;
            v12 = (void *)v40;
            v16 = v35;
            v13 = v38;
          }
          else
          {
            v22 = objc_msgSend(v20, "wordEntryType");
            v23 = 2;
            if (v17 != 3)
              v23 = v17;
            if ((v22 & 1) != 0)
              v17 = 3;
            else
              v17 = v23;
          }
LABEL_21:
          objc_msgSend(v12, "addObject:", v20);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (!v15)
        {
LABEL_26:

          LOBYTE(v11) = 1;
          v8 = v39;
          v9 = v37;
          break;
        }
      }
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

@end
