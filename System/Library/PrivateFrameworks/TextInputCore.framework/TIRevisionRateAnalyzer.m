@implementation TIRevisionRateAnalyzer

- (id)getSessionFields
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIRevisionRateAnalyzer hasEmojiInput](self, "hasEmojiInput"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("hasEmojiInput"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIRevisionRateAnalyzer hasCursorMovement](self, "hasCursorMovement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("hasCursorMovement"));

  -[TIRevisionRateAnalyzer sessionAlignmentConfidence](self, "sessionAlignmentConfidence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, kFeatureStringSessionAlignmentConfidence);

  return v3;
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5)
  {
    v9 = (void *)MEMORY[0x1E0DBDB38];
    +[TIStandardTypingSessionConfidenceEvaluator calculateAlignedTypingSessionConfidence:](TIStandardTypingSessionConfidenceEvaluator, "calculateAlignedTypingSessionConfidence:", a4);
    objc_msgSend(v9, "bucketRatioWithValue:bucketCount:", 10);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIRevisionRateAnalyzer setSessionAlignmentConfidence:](self, "setSessionAlignmentConfidence:", v10);

    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TIRevisionRateAnalyzer getSessionFields](self, "getSessionFields");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _analyzeEditEvents(v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObjectsFromArray:](v11, "addObjectsFromArray:", v13);

    _analyzeNonEditEvents(v8, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObjectsFromArray:](v11, "addObjectsFromArray:", v14);

    _analyzeDeletedOriginalWordEvents(v8, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObjectsFromArray:](v11, "addObjectsFromArray:", v15);

    if (-[NSObject count](v11, "count"))
    {
      -[TIRevisionRateAnalyzer getLanguageRegionForSession:](self, "getLanguageRegionForSession:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIRevisionRateAnalyzer summarizeWithEventDictionary:languageRegion:](self, "summarizeWithEventDictionary:languageRegion:", v11, v16);

      -[TIRevisionRateAnalyzer _dispatchEventPayloads:analyticsService:typingSession:](self, "_dispatchEventPayloads:analyticsService:typingSession:", v11, 0, v8);
    }
    else if (IXACanLogMessageAtLevel())
    {
      IXADefaultLogFacility();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s No revision metric payloads could be generated from the keyboard typing session."), "-[TIRevisionRateAnalyzer analyzeSession:alignedSession:withConfidence:]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v19;
        _os_log_debug_impl(&dword_1DA6F2000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    goto LABEL_10;
  }
  IXADefaultLogFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Typing session confidence is set to 'none' and will not be analyzed by the autocorrection revision rate analyzer."), "-[TIRevisionRateAnalyzer analyzeSession:alignedSession:withConfidence:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v12;
    _os_log_debug_impl(&dword_1DA6F2000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
LABEL_10:

  }
  return a5 != 0;
}

- (void)setSessionAlignmentConfidence:(id)a3
{
  objc_storeStrong((id *)&self->_sessionAlignmentConfidence, a3);
}

- (void)setHasEmojiInput:(BOOL)a3
{
  self->_hasEmojiInput = a3;
}

- (void)setHasCursorMovement:(BOOL)a3
{
  self->_hasCursorMovement = a3;
}

- (NSNumber)sessionAlignmentConfidence
{
  return self->_sessionAlignmentConfidence;
}

- (TIRevisionRateAnalyzer)init
{
  TIRevisionRateAnalyzer *v2;
  TIRevisionRateAnalyzer *v3;
  TIRevisionRateAnalysisSummary *v4;
  TIRevisionRateAnalysisSummary *revisionRateAnalysisSummary;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIRevisionRateAnalyzer;
  v2 = -[TIRevisionRateAnalyzer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TIRevisionRateAnalyzer _registerAnalyticsEventSpecWithAnalyticsService](v2, "_registerAnalyticsEventSpecWithAnalyticsService");
    v4 = objc_alloc_init(TIRevisionRateAnalysisSummary);
    revisionRateAnalysisSummary = v3->_revisionRateAnalysisSummary;
    v3->_revisionRateAnalysisSummary = v4;

  }
  return v3;
}

- (BOOL)hasEmojiInput
{
  return self->_hasEmojiInput;
}

- (BOOL)hasCursorMovement
{
  return self->_hasCursorMovement;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return 2;
}

- (void)_registerAnalyticsEventSpecWithAnalyticsService
{
  void *v2;
  id v3;

  -[TIRevisionRateAnalyzer _createEventSpec](self, "_createEventSpec");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerEventSpec:", v3);

}

- (id)_createEventSpec
{
  if (_createEventSpec_onceToken != -1)
    dispatch_once(&_createEventSpec_onceToken, &__block_literal_global_7072);
  return (id)_createEventSpec___eventSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revisionRateAnalysisSummary, 0);
  objc_storeStrong((id *)&self->_sessionAlignmentConfidence, 0);
}

- (void)_dispatchEventPayloads:(id)a3 analyticsService:(id)a4 typingSession:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v20 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "sessionParams");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "testingParameters");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dispatchEventWithName:payload:testingParameters:allowSparsePayload:", CFSTR("revisionRate"), v17, v19, 1);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

}

- (void)summarizeWithEventDictionary:(id)a3 languageRegion:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  TIRevisionRateAnalyzer *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id obj;
  TIRevisionRateAnalyzer *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _QWORD v61[5];

  v61[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[TIRevisionRateAnalyzer hasEmojiInput](self, "hasEmojiInput");
  -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](self, "revisionRateAnalysisSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHasEmojiInput:", v8);

  -[TIRevisionRateAnalyzer sessionAlignmentConfidence](self, "sessionAlignmentConfidence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](self, "revisionRateAnalysisSummary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSessionAlignmentConfidence:", v10);

  v12 = -[TIRevisionRateAnalyzer hasCursorMovement](self, "hasCursorMovement");
  -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](self, "revisionRateAnalysisSummary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHasCursorMovement:", v12);

  -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](self, "revisionRateAnalysisSummary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v7;
  objc_msgSend(v14, "setLanguageRegion:", v7);

  -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](self, "revisionRateAnalysisSummary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTappedCount:", 0);

  -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](self, "revisionRateAnalysisSummary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAutocorrectedCount:", 0);

  -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](self, "revisionRateAnalysisSummary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRevisedCount:", 0);

  -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](self, "revisionRateAnalysisSummary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRevisedAutocorrectionCount:", 0);

  v19 = (void *)MEMORY[0x1E0C99E60];
  v61[0] = CFSTR("Tapped");
  v61[1] = CFSTR("Candidate Bar");
  v61[2] = CFSTR("TappedWithBackspace");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v22 = v6;
  v23 = self;
  obj = v22;
  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v57;
    v27 = CFSTR("enteredModality");
    v55 = v23;
    do
    {
      v28 = 0;
      v53 = v25;
      do
      {
        if (*(_QWORD *)v57 != v26)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v28);
        objc_msgSend(v29, "objectForKey:", v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "containsObject:", v30))
        {
          v31 = v27;
          v32 = v26;
          v33 = v21;
          -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](v23, "revisionRateAnalysisSummary");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "tappedCount") + 1;
          -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](v23, "revisionRateAnalysisSummary");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setTappedCount:", v35);

          objc_msgSend(v29, "objectForKey:", CFSTR("revisedModality"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "length");

          objc_msgSend(v29, "objectForKey:", CFSTR("correctedSource"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "length");

          if (v40)
          {
            -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](v23, "revisionRateAnalysisSummary");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "autocorrectedCount") + 1;
            -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](v23, "revisionRateAnalysisSummary");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setAutocorrectedCount:", v42);

            v23 = v55;
          }
          v21 = v33;
          v26 = v32;
          v27 = v31;
          v25 = v53;
          if (v38)
          {
            -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](v23, "revisionRateAnalysisSummary");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "revisedCount") + 1;
            -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](v55, "revisionRateAnalysisSummary");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v45;
            v23 = v55;
            objc_msgSend(v46, "setRevisedCount:", v47);

            if (v40)
            {
              -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](v55, "revisionRateAnalysisSummary");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v48, "revisedAutocorrectionCount") + 1;
              -[TIRevisionRateAnalyzer revisionRateAnalysisSummary](v55, "revisionRateAnalysisSummary");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = v49;
              v23 = v55;
              objc_msgSend(v50, "setRevisedAutocorrectionCount:", v51);

            }
          }
        }

        ++v28;
      }
      while (v25 != v28);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v25);
  }

}

- (id)getLanguageRegionForSession:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "userActionHistory", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = &stru_1EA1081D0;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!objc_msgSend(v9, "actionType"))
        {
          objc_msgSend(v9, "keyboardState");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "inputMode");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          TIInputModeGetLanguageWithRegion();
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v7 = &stru_1EA1081D0;
  }
LABEL_12:

  return v7;
}

- (TIRevisionRateAnalysisSummary)revisionRateAnalysisSummary
{
  return self->_revisionRateAnalysisSummary;
}

- (void)setRevisionRateAnalysisSummary:(id)a3
{
  objc_storeStrong((id *)&self->_revisionRateAnalysisSummary, a3);
}

void __42__TIRevisionRateAnalyzer__createEventSpec__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[41];
  _QWORD v61[4];
  _QWORD v62[4];
  _QWORD v63[10];

  v63[8] = *MEMORY[0x1E0C80C00];
  v63[0] = CFSTR("OriginalText");
  v63[1] = CFSTR("Tapped");
  v63[2] = CFSTR("Pathed");
  v63[3] = CFSTR("Candidate Bar");
  v63[4] = CFSTR("TappedWithBackspace");
  v63[5] = CFSTR("Deleted");
  v63[6] = CFSTR("RevisionBubble");
  v63[7] = CFSTR("InlineCompletion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v62[0] = CFSTR("Lower");
  v62[1] = CFSTR("Title");
  v62[2] = CFSTR("Upper");
  v62[3] = CFSTR("Mixed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 4);
  v1 = objc_claimAutoreleasedReturnValue();
  v61[0] = CFSTR("None");
  v61[1] = CFSTR("Short");
  v61[2] = CFSTR("Medium");
  v61[3] = CFSTR("Long");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  TIFeatureUsageAllowedValues();
  v3 = objc_claimAutoreleasedReturnValue();
  TITypingSpeedAllowedValues();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)v0;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", CFSTR("enteredModality"), v0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v59;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", CFSTR("enteredSource"), 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v58;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", CFSTR("enteredCapitalization"), v1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v57;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("enteredDiacritics"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v56;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("enteredApostrophe"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v60[4] = v55;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("enteredWordLength"), &unk_1EA1403A8, &unk_1EA1403C0, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v60[5] = v54;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", CFSTR("correctedSource"), 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v60[6] = v53;
  v49 = (void *)v1;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", CFSTR("correctedCapitalization"), v1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v60[7] = v51;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("correctedDiacritics"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v60[8] = v50;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("correctedApostrophe"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v60[9] = v48;
  v46 = (void *)v2;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", CFSTR("correctedEditDistance"), v2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v60[10] = v47;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("correctedWordLength"), &unk_1EA1403A8, &unk_1EA1403C0, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v60[11] = v45;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("correctedHasLeftHandContext"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v60[12] = v44;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", CFSTR("correctedOperationType"), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v60[13] = v43;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", CFSTR("revisedModality"), v0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v60[14] = v42;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", CFSTR("revisedSource"), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v60[15] = v41;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", CFSTR("revisedCapitalization"), v1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v60[16] = v40;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("revisedDiacritics"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v60[17] = v39;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("revisedApostrophe"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v60[18] = v38;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", CFSTR("revisedEditDistance"), v2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v60[19] = v37;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("revisedWordLength"), &unk_1EA1403A8, &unk_1EA1403C0, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v60[20] = v36;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("revisedWordRevisionCount"), &unk_1EA1403A8, &unk_1EA1403C0, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v60[21] = v35;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("textTraitAutocorrectionEnabled"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v60[22] = v34;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardType);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v60[23] = v33;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLayout);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v60[24] = v32;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLanguage);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v60[25] = v30;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardRegion);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v60[26] = v28;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardVariant);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v60[27] = v27;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryLanguage);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v60[28] = v26;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryRegion);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v60[29] = v25;
  v4 = (void *)MEMORY[0x1E0DBDB20];
  v5 = kFeatureStringTypingEngine;
  TITypingEngineAllowedValues();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFieldSpecWithName:allowedValues:", v5, v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v60[30] = v23;
  v6 = (void *)MEMORY[0x1E0DBDB20];
  v7 = kFeatureStringAssetAvailabilityStatus;
  TIAssetAvailabilityStatusAllowedValues();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFieldSpecWithName:allowedValues:", v7, v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v60[31] = v21;
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", kFeatureKeyboardUsage, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v60[32] = v9;
  v31 = (void *)v3;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", kFeatureContinuousPathUsage, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v60[33] = v10;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", kFeatureCandidateBarUsage, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v60[34] = v11;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", kFeatureAutocorrectionUsage, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v60[35] = v12;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", kFeatureMultilingualUsage, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v60[36] = v13;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", kFeatureStringTypingSpeed, v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v60[37] = v14;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("hasCursorMovement"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v60[38] = v15;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("hasEmojiInput"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60[39] = v16;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", kFeatureStringSessionAlignmentConfidence, &unk_1EA1403A8, &unk_1EA1403D8, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v60[40] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 41);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB18], "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("revisionRate"), 0, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)_createEventSpec___eventSpec;
  _createEventSpec___eventSpec = v19;

}

@end
