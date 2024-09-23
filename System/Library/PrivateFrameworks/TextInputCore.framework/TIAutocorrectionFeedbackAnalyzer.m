@implementation TIAutocorrectionFeedbackAnalyzer

- (TIAutocorrectionFeedbackAnalyzer)initWithUserModel:(id)a3 revisionRateAnalysisSummary:(id)a4
{
  id v7;
  id v8;
  TIAutocorrectionFeedbackAnalyzer *v9;
  TIAutocorrectionFeedbackAnalyzer *v10;
  uint64_t v11;
  NSArray *supportedLanguages;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TIAutocorrectionFeedbackAnalyzer;
  v9 = -[TIAutocorrectionFeedbackAnalyzer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userModel, a3);
    objc_msgSend(MEMORY[0x1E0DBDB80], "getSupportedFeedbackLanguages");
    v11 = objc_claimAutoreleasedReturnValue();
    supportedLanguages = v10->_supportedLanguages;
    v10->_supportedLanguages = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_revisionRateAnalysisSummary, a4);
    -[TIAutocorrectionFeedbackAnalyzer registerEventSpec](v10, "registerEventSpec");
  }

  return v10;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:alignedSession:](TIStandardTypingSessionConfidenceEvaluator, "evaluateConfidenceInSession:alignedSession:", a3, a4);
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  TITypingSession *v7;
  TITypingSessionAligned *v8;
  TITypingSession *session;
  TITypingSession *v10;
  TITypingSessionAligned *alignedSession;
  TITypingSessionAligned *v12;
  TIFeedbackController *v13;

  v7 = (TITypingSession *)a3;
  v8 = (TITypingSessionAligned *)a4;
  session = self->_session;
  self->_session = v7;
  v10 = v7;

  alignedSession = self->_alignedSession;
  self->_alignedSession = v8;
  v12 = v8;

  v13 = objc_alloc_init(TIFeedbackController);
  -[TIFeedbackController handleFeedbackActionsWithDelegate:](v13, "handleFeedbackActionsWithDelegate:", self);

  return 1;
}

- (void)accumulateWordCounts
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int64_t v8;
  void *v9;
  int64_t v10;
  void *v11;
  int64_t v12;
  void *v13;
  int64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[TIRevisionRateAnalysisSummary hasEmojiInput](self->_revisionRateAnalysisSummary, "hasEmojiInput")
    || -[TIRevisionRateAnalysisSummary hasCursorMovement](self->_revisionRateAnalysisSummary, "hasCursorMovement"))
  {
    if (!IXACanLogMessageAtLevel())
      return;
    IXAFeedbackLogFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: accumulateWordCounts will not count - session has cursor movement"), "-[TIAutocorrectionFeedbackAnalyzer accumulateWordCounts]", CFSTR("KeyboardAutocorrection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v15;
    goto LABEL_15;
  }
  -[TIAutocorrectionFeedbackAnalyzer supportedLanguages](self, "supportedLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIRevisionRateAnalysisSummary languageRegion](self->_revisionRateAnalysisSummary, "languageRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if ((v6 & 1) != 0)
  {
    -[TIAutocorrectionFeedbackAnalyzer userModel](self, "userModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TIRevisionRateAnalysisSummary tappedCount](self->_revisionRateAnalysisSummary, "tappedCount");
    objc_msgSend(v7, "addToDurableCounter:forKey:", v8, kFeedbackCounterAutocorrectionEnablementTappedWords);

    -[TIAutocorrectionFeedbackAnalyzer userModel](self, "userModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TIRevisionRateAnalysisSummary autocorrectedCount](self->_revisionRateAnalysisSummary, "autocorrectedCount");
    objc_msgSend(v9, "addToDurableCounter:forKey:", v10, kFeedbackCounterAutocorrectionEnablementCorrectedWords);

    -[TIAutocorrectionFeedbackAnalyzer userModel](self, "userModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TIRevisionRateAnalysisSummary revisedCount](self->_revisionRateAnalysisSummary, "revisedCount");
    objc_msgSend(v11, "addToDurableCounter:forKey:", v12, kFeedbackCounterAutocorrectionEnablementRevisedWords);

    -[TIAutocorrectionFeedbackAnalyzer userModel](self, "userModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[TIRevisionRateAnalysisSummary revisedAutocorrectionCount](self->_revisionRateAnalysisSummary, "revisedAutocorrectionCount");
    objc_msgSend(v13, "addToDurableCounter:forKey:", v14, kFeedbackCounterAutocorrectionEnablementRevisedCorrectedWords);

    if (IXACanLogMessageAtLevel())
    {
      IXAFeedbackLogFacility();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: accumulateWordCounts tapped: %ld,  corrected: %ld,  revised: %ld, revised-autocorection: %ld,"), "-[TIAutocorrectionFeedbackAnalyzer accumulateWordCounts]", CFSTR("KeyboardAutocorrection"), -[TIRevisionRateAnalysisSummary tappedCount](self->_revisionRateAnalysisSummary, "tappedCount"), -[TIRevisionRateAnalysisSummary autocorrectedCount](self->_revisionRateAnalysisSummary, "autocorrectedCount"), -[TIRevisionRateAnalysisSummary revisedCount](self->_revisionRateAnalysisSummary, "revisedCount"), -[TIRevisionRateAnalysisSummary revisedAutocorrectionCount](self->_revisionRateAnalysisSummary, "revisedAutocorrectionCount"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v15;
LABEL_15:
        _os_log_debug_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        goto LABEL_5;
      }
      goto LABEL_5;
    }
  }
  else if (IXACanLogMessageAtLevel())
  {
    IXAFeedbackLogFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: accumulateWordCounts will not count - unsupported language"), "-[TIAutocorrectionFeedbackAnalyzer accumulateWordCounts]", CFSTR("KeyboardAutocorrection"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v15;
      goto LABEL_15;
    }
LABEL_5:

  }
}

- (void)resetWordCounts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TIAutocorrectionFeedbackAnalyzer userModel](self, "userModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetDurableCounterForKey:", kFeedbackCounterAutocorrectionEnablementTappedWords);

  -[TIAutocorrectionFeedbackAnalyzer userModel](self, "userModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetDurableCounterForKey:", kFeedbackCounterAutocorrectionEnablementCorrectedWords);

  -[TIAutocorrectionFeedbackAnalyzer userModel](self, "userModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetDurableCounterForKey:", kFeedbackCounterAutocorrectionEnablementRevisedWords);

  -[TIAutocorrectionFeedbackAnalyzer userModel](self, "userModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetDurableCounterForKey:", kFeedbackCounterAutocorrectionEnablementRevisedCorrectedWords);

}

- (void)sendInitiationEventUsingStudyDataFromFeedbackController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("studyStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TIAutocorrectionFeedbackAnalyzer studyStatusFromState:](self, "studyStatusFromState:", 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  v17[1] = CFSTR("initialInputModes");
  objc_msgSend(MEMORY[0x1E0DBDB80], "getInitialInputModes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAutocorrectionFeedbackAnalyzer installedInputModesStringFromInputModes:](self, "installedInputModesStringFromInputModes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v6;
  v17[2] = CFSTR("initialPreferenceValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0DBDB80], "getInitialPreferenceValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v7;
  v17[3] = kFeatureStringAssetAvailabilityStatus;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[TITypingSession sessionParams](self->_session, "sessionParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "assetAvailabilityStatus") != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dispatchEventWithName:payload:testingParameters:allowSparsePayload:", CFSTR("deferredAutocorrectionFeedback"), v11, 0, 1);

  if (IXACanLogMessageAtLevel())
  {
    IXAFeedbackLogFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: sendInitiationEvent payload: %@"), "-[TIAutocorrectionFeedbackAnalyzer sendInitiationEventUsingStudyDataFromFeedbackController:]", CFSTR("KeyboardAutocorrection"), v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v14;
      _os_log_debug_impl(&dword_1DA6F2000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }

}

- (void)sendCAEventForStudyStatus:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  int v37;
  uint64_t v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  void *v46;
  uint8_t buf[4];
  void *v48;
  _QWORD v49[12];
  _QWORD v50[14];

  v50[12] = *MEMORY[0x1E0C80C00];
  -[TIAutocorrectionFeedbackAnalyzer userModel](self, "userModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "valueForDurableKey:", kFeedbackCounterAutocorrectionEnablementTappedWords);

  -[TIAutocorrectionFeedbackAnalyzer userModel](self, "userModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "valueForDurableKey:", kFeedbackCounterAutocorrectionEnablementCorrectedWords);

  -[TIAutocorrectionFeedbackAnalyzer userModel](self, "userModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "valueForDurableKey:", kFeedbackCounterAutocorrectionEnablementRevisedWords);

  -[TIAutocorrectionFeedbackAnalyzer userModel](self, "userModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "valueForDurableKey:", kFeedbackCounterAutocorrectionEnablementRevisedCorrectedWords);

  -[TITypingSession sessionParams](self->_session, "sessionParams");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "assetAvailabilityStatus") != 0;

  v43 = objc_msgSend(MEMORY[0x1E0DBDB80], "getInitialPreferenceValue");
  objc_msgSend(MEMORY[0x1E0DBDB80], "getInitialInputModes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAutocorrectionFeedbackAnalyzer installedInputModesStringFromInputModes:](self, "installedInputModesStringFromInputModes:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v39 = objc_msgSend(MEMORY[0x1E0DBDB80], "getFinalPreferenceValue");
  objc_msgSend(MEMORY[0x1E0DBDB80], "getFinalInputModes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAutocorrectionFeedbackAnalyzer installedInputModesStringFromInputModes:](self, "installedInputModesStringFromInputModes:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  v38 = objc_msgSend(MEMORY[0x1E0DBDB80], "getSurveyOutcome");
  objc_msgSend(MEMORY[0x1E0DBDB80], "getInitialTimestamp");
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB80], "getFinalTimestamp");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)v18;
  objc_msgSend(v41, "timeIntervalSinceDate:", v18);
  v37 = (int)v19 / 86400;
  v49[0] = CFSTR("studyStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v40;
  v49[1] = CFSTR("tappedWordCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v20;
  v49[2] = CFSTR("correctedWordCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v21;
  v49[3] = CFSTR("revisedWordCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v22;
  v49[4] = CFSTR("revisedWordAutocorrectionCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v23;
  v49[5] = kFeatureStringAssetAvailabilityStatus;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v24;
  v49[6] = CFSTR("initialPreferenceValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v43);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  v46 = (void *)v15;
  if (v15)
    v27 = (const __CFString *)v15;
  else
    v27 = &stru_1EA1081D0;
  v50[6] = v25;
  v50[7] = v27;
  v49[7] = CFSTR("initialInputModes");
  v49[8] = CFSTR("finalPreferenceValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  v44 = (void *)v17;
  if (v17)
    v30 = (const __CFString *)v17;
  else
    v30 = &stru_1EA1081D0;
  v50[8] = v28;
  v50[9] = v30;
  v49[9] = CFSTR("finalInputModes");
  v49[10] = CFSTR("surveyOutcome");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v38);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50[10] = v31;
  v49[11] = CFSTR("daysCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v37);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50[11] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "dispatchEventWithName:payload:testingParameters:allowSparsePayload:", CFSTR("deferredAutocorrectionFeedback"), v33, 0, 1);

  if (IXACanLogMessageAtLevel())
  {
    IXAFeedbackLogFacility();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Feedback %@: sentCAEvent payload: %@"), "-[TIAutocorrectionFeedbackAnalyzer sendCAEventForStudyStatus:]", CFSTR("KeyboardAutocorrection"), v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v36;
      _os_log_debug_impl(&dword_1DA6F2000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }

}

- (void)sendRequestSurveyEventUsingStudyDataFromFeedbackController:(id)a3
{
  -[TIAutocorrectionFeedbackAnalyzer sendCAEventForStudyStatus:](self, "sendCAEventForStudyStatus:", 4);
}

- (void)sendCompletionEventUsingStudyDataFromFeedbackController:(id)a3
{
  -[TIAutocorrectionFeedbackAnalyzer sendCAEventForStudyStatus:](self, "sendCAEventForStudyStatus:", -[TIAutocorrectionFeedbackAnalyzer studyStatusFromState:](self, "studyStatusFromState:", 4));
}

- (void)sendUpgradeEventUsingStudyDataFromFeedbackController:(id)a3
{
  -[TIAutocorrectionFeedbackAnalyzer sendCAEventForStudyStatus:](self, "sendCAEventForStudyStatus:", 5);
}

- (void)sendTerminationEventUsingStudyDataFromFeedbackController:(id)a3
{
  -[TIAutocorrectionFeedbackAnalyzer sendCAEventForStudyStatus:](self, "sendCAEventForStudyStatus:", -[TIAutocorrectionFeedbackAnalyzer studyStatusFromState:](self, "studyStatusFromState:", objc_msgSend(MEMORY[0x1E0DBDB80], "getFeedbackState", a3)));
}

- (void)registerEventSpec
{
  void *v2;
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
  void *v17;
  _QWORD v18[13];

  v18[12] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DBDB18];
  objc_msgSend(MEMORY[0x1E0DBDB20], "enumFieldSpecWithName:", CFSTR("studyStatus"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v17;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("correctedWordCount"), &unk_1EA140498, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v16;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("tappedWordCount"), &unk_1EA140498, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v15;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("initialPreferenceValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", CFSTR("initialInputModes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v3;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("finalPreferenceValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v4;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", CFSTR("finalInputModes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v5;
  objc_msgSend(MEMORY[0x1E0DBDB20], "enumFieldSpecWithName:", CFSTR("surveyOutcome"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v6;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:", CFSTR("revisedWordCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v7;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:", CFSTR("revisedWordAutocorrectionCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v8;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:", CFSTR("daysCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[10] = v9;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("assetAvailabilityStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("deferredAutocorrectionFeedback"), 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerEventSpec:", v12);

}

- (id)installedInputModesStringFromInputModes:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("|"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)studyStatusFromState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 4)
    return 2;
  else
    return qword_1DA910450[a3 - 2];
}

- (TIUserModeling)userModel
{
  return self->_userModel;
}

- (void)setUserModel:(id)a3
{
  objc_storeStrong((id *)&self->_userModel, a3);
}

- (NSArray)supportedLanguages
{
  return self->_supportedLanguages;
}

- (void)setSupportedLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_supportedLanguages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_userModel, 0);
  objc_storeStrong((id *)&self->_revisionRateAnalysisSummary, 0);
  objc_storeStrong((id *)&self->_alignedSession, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

+ (id)analyzerForUserModel:(id)a3 revisionRateAnalysisSummary:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUserModel:revisionRateAnalysisSummary:", v6, v5);

  return v7;
}

@end
