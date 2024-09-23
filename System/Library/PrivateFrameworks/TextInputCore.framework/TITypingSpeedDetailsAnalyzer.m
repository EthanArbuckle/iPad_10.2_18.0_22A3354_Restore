@implementation TITypingSpeedDetailsAnalyzer

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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[38];

  v63[36] = *MEMORY[0x1E0C80C00];
  v50 = (void *)MEMORY[0x1E0DBDB18];
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("totalMessageDuration"), &unk_1EA140798, 0, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v62;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("totalMessageLength"), &unk_1EA140798, 0, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v61;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("totalWordsEntered"), &unk_1EA140798, 0, 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v60;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("totalFinalWordEntered"), &unk_1EA140798, 0, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v59;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("messageDuration"), &unk_1EA140798, &unk_1EA1407B0, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v63[4] = v58;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("messageLength"), &unk_1EA140798, &unk_1EA1407B0, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v63[5] = v57;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("wordsEntered"), &unk_1EA140798, &unk_1EA1407B0, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v63[6] = v56;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("finalWordEntered"), &unk_1EA140798, &unk_1EA1407B0, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v63[7] = v55;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("static"), &unk_1EA140798, &unk_1EA1407C8, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v63[8] = v54;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("dynamic"), &unk_1EA140798, &unk_1EA1407C8, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v63[9] = v53;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("textReplacements"), &unk_1EA140798, &unk_1EA1407C8, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v63[10] = v52;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("addressBook"), &unk_1EA140798, &unk_1EA1407C8, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v63[11] = v49;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("namedEntities"), &unk_1EA140798, &unk_1EA1407C8, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v63[12] = v48;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("oov"), &unk_1EA140798, &unk_1EA1407C8, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v63[13] = v47;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("supplementalLexicon"), &unk_1EA140798, &unk_1EA1407C8, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v63[14] = v46;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiPlane"), &unk_1EA140798, &unk_1EA1407C8, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v63[15] = v45;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiPrediction"), &unk_1EA140798, &unk_1EA1407C8, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v63[16] = v44;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearch"), &unk_1EA140798, &unk_1EA1407C8, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v63[17] = v43;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiPopover"), &unk_1EA140798, &unk_1EA1407C8, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v63[18] = v42;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("responseKit"), &unk_1EA140798, &unk_1EA1407C8, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v63[19] = v41;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("pqt"), &unk_1EA140798, &unk_1EA1407C8, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v63[20] = v40;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("multilingual"), &unk_1EA140798, &unk_1EA1407C8, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v63[21] = v39;
  v2 = (void *)MEMORY[0x1E0DBDB20];
  v3 = kFeatureKeyboardUsage;
  TIFeatureUsageAllowedValues();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFieldSpecWithName:allowedValues:", v3, v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v63[22] = v37;
  v4 = (void *)MEMORY[0x1E0DBDB20];
  v5 = kFeatureContinuousPathUsage;
  TIFeatureUsageAllowedValues();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFieldSpecWithName:allowedValues:", v5, v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v63[23] = v35;
  v6 = (void *)MEMORY[0x1E0DBDB20];
  v7 = kFeatureAutocorrectionUsage;
  TIFeatureUsageAllowedValues();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFieldSpecWithName:allowedValues:", v7, v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v63[24] = v33;
  v8 = (void *)MEMORY[0x1E0DBDB20];
  v9 = kFeatureCandidateBarUsage;
  TIFeatureUsageAllowedValues();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFieldSpecWithName:allowedValues:", v9, v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v63[25] = v31;
  v10 = (void *)MEMORY[0x1E0DBDB20];
  v11 = kFeatureMultilingualUsage;
  TIFeatureUsageAllowedValues();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFieldSpecWithName:allowedValues:", v11, v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v63[26] = v29;
  v12 = (void *)MEMORY[0x1E0DBDB20];
  v13 = kFeatureStringTypingSpeed;
  TITypingSpeedAllowedValues();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFieldSpecWithName:allowedValues:", v13, v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v63[27] = v27;
  v14 = (void *)MEMORY[0x1E0DBDB20];
  v15 = kFeatureStringAssetAvailabilityStatus;
  TIAssetAvailabilityStatusAllowedValues();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringFieldSpecWithName:allowedValues:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v63[28] = v17;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLanguage);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v63[29] = v18;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardRegion);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v63[30] = v19;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardVariant);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v63[31] = v20;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryLanguage);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v63[32] = v21;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryRegion);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v63[33] = v22;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLayout);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v63[34] = v23;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardType);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v63[35] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 36);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("typingSpeedDetails"), 0, v25);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "registerEventSpec:", v51);

}

- (TITypingSpeedDetailsAnalyzer)init
{
  TITypingSpeedDetailsAnalyzer *v2;
  TITypingSpeedDetailsAnalyzer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TITypingSpeedDetailsAnalyzer;
  v2 = -[TITypingSpeedDetailsAnalyzer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TITypingSpeedDetailsAnalyzer registerEventSpec](v2, "registerEventSpec");
  return v3;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:alignedSession:](TIStandardTypingSessionConfidenceEvaluator, "evaluateConfidenceInSession:alignedSession:", a3, a4);
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  TIKBAnalyticsMetricsContext *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  TIKBAnalyticsMetricsContext *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a5)
  {
    objc_msgSend(v7, "applicationID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

    if (v10)
    {
      v48 = v8;
      v49 = (void *)objc_opt_new();
      v11 = objc_alloc(MEMORY[0x1E0CB3748]);
      objc_msgSend(v7, "userActionHistory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithKeyOptions:valueOptions:capacity:", 0, 5, objc_msgSend(v12, "count"));

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      objc_msgSend(v7, "userActionHistory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      if (v15)
      {
        v16 = v15;
        v51 = 0;
        v17 = 0;
        v18 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v61 != v18)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
            objc_msgSend(v20, "documentState", v48);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "documentIsEmpty");

            if (v22)
            {

              v17 = 0;
            }
            if (!objc_msgSend(v20, "actionType"))
            {
              v23 = v20;
              if (!v17)
              {
                v17 = (void *)objc_opt_new();
                objc_msgSend(v49, "addObject:", v17);
              }
              objc_msgSend(v17, "analyzeWordEntry:", v23);
              objc_msgSend(v13, "setObject:forKey:", v17, v23);
              objc_msgSend(v23, "keyboardState");
              v24 = objc_claimAutoreleasedReturnValue();

              v51 = (void *)v24;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
        }
        while (v16);
      }
      else
      {
        v51 = 0;
        v17 = 0;
      }
      v50 = v7;

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v8 = v48;
      objc_msgSend(v48, "alignedEntries");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v57 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
            objc_msgSend(v30, "originalWord", v48);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKey:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v32, "analyzeWordEntryAligned:", v30);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        }
        while (v27);
      }

      a5 = (unint64_t)v49;
      if (objc_msgSend(v49, "count"))
      {
        v33 = [TIKBAnalyticsMetricsContext alloc];
        objc_msgSend(v50, "sessionParams");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "activeInputModes");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "sessionParams");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "testingParameters");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[TIKBAnalyticsMetricsContext initWithKeyboardState:activeInputModes:testingParameters:](v33, "initWithKeyboardState:activeInputModes:testingParameters:", v51, v35, v37);

        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v39 = v49;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v53;
          do
          {
            for (k = 0; k != v41; ++k)
            {
              if (*(_QWORD *)v53 != v42)
                objc_enumerationMutation(v39);
              v44 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * k);
              objc_msgSend(v50, "featureUsageMetricsCache", v48);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "sessionParams");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "dispatchWithFeatureUsageMetricsCache:andContext:assetAvailabilityStatus:", v45, v38, objc_msgSend(v46, "assetAvailabilityStatus"));

            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
          }
          while (v41);
        }

        v8 = v48;
        a5 = (unint64_t)v49;
      }

      LOBYTE(a5) = 1;
      v7 = v50;
    }
    else
    {
      LOBYTE(a5) = 0;
    }
  }

  return a5;
}

@end
