@implementation TIFeedbackUtil

+ (id)getKeyNameFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[TIFeedbackUtil getStudyID](TIFeedbackUtil, "getStudyID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)getStateKey
{
  return +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackState_"));
}

+ (BOOL)supportedLanguagesHaveRegions:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("_"));

  return v4;
}

+ (id)getPreferenceKey
{
  return CFSTR("KeyboardAutocorrection");
}

+ (id)getStudyID
{
  void *v2;
  void *v3;

  objc_msgSend(CFSTR("_"), "stringByAppendingString:", CFSTR("S03"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("KeyboardAutocorrection"), "stringByAppendingString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)getSupportedFeedbackLanguages
{
  return &unk_1E24B05D0;
}

+ (BOOL)shouldOverrideLanguageRegionCheck
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("feedbackOverrideDeviceLanguageCheck"));

  return v3;
}

+ (id)getSupportedLangRegion
{
  void *v2;
  void *v3;

  +[TIFeedbackUtil getSupportedFeedbackLanguages](TIFeedbackUtil, "getSupportedFeedbackLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIFeedbackUtil getSupportedLangRegionFromSupportedFeedbackLanguages:](TIFeedbackUtil, "getSupportedLangRegionFromSupportedFeedbackLanguages:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)getSupportedLangRegionFromSupportedFeedbackLanguages:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD);
  id v7;
  _QWORD v9[4];
  void (**v10)(_QWORD);
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  __CFString *v19;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__233;
  v18 = __Block_byref_object_dispose__234;
  v4 = MEMORY[0x1E0C809B0];
  v19 = &stru_1E243B990;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__TIFeedbackUtil_getSupportedLangRegionFromSupportedFeedbackLanguages___block_invoke;
  v11[3] = &unk_1E243B578;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x18D783768](v11);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v6[2](v6);
  }
  else
  {
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __71__TIFeedbackUtil_getSupportedLangRegionFromSupportedFeedbackLanguages___block_invoke_2;
    v9[3] = &unk_1E2439BF8;
    v10 = v6;
    TIDispatchSync(MEMORY[0x1E0C80D38], v9);

  }
  v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v7;
}

+ (BOOL)isEligibleDevice
{
  BOOL v2;
  void *v3;

  if (+[TIFeedbackUtil migratePreviousStudyStateAndCheckPreviousEnrollment](TIFeedbackUtil, "migratePreviousStudyStateAndCheckPreviousEnrollment"))
  {
    return 0;
  }
  +[TIFeedbackUtil getSupportedLangRegion](TIFeedbackUtil, "getSupportedLangRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "length") != 0;

  return v2;
}

+ (BOOL)isFeatureEnabledForInternalBuilds
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("feedbackFeatureEnabled"));

  return v3;
}

+ (BOOL)shouldPublishCAEventsImmediately
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("feedbackPublishCAEventsImmediately"));

  return v3;
}

+ (BOOL)migratePreviousStudyStateAndCheckPreviousEnrollment
{
  void *v2;
  BOOL v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  if (objc_msgSend(v2, "integerForKey:", CFSTR("feedbackState_KeyboardAutocorrection")))
  {
    +[TIFeedbackUtil setStudyEnrollment:](TIFeedbackUtil, "setStudyEnrollment:", CFSTR("S01"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("feedbackFeatureEnabled_KeyboardAutocorrection"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("feedbackState_KeyboardAutocorrection"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("feedbackInitialInputModes_KeyboardAutocorrection"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("feedbackInitialTimestamp_KeyboardAutocorrection"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("feedbackInitialPreferenceValue_KeyboardAutocorrection"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("feedbackFinalInputModes_KeyboardAutocorrection"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("feedbackFinalTimestamp_KeyboardAutocorrection"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("feedbackFinalPreferenceValue_KeyboardAutocorrection"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("feedbackSurveyOutcome_KeyboardAutocorrection"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("feedbackInitiationEventTimestamp_KeyboardAutocorrection"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("feedbackCompletionEventTimestamp_KeyboardAutocorrection"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("feedbackCountsRetained_KeyboardAutocorrection"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("feedbackStudyLanguageRegionKeyKeyboardAutocorrection"));
    v3 = 1;
  }
  else
  {
    objc_msgSend(v2, "stringForKey:", CFSTR("feedbackLastStudyEnrollment"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length") && (objc_msgSend(v4, "isEqualToString:", CFSTR("S03")) & 1) == 0)
    {
      +[TIFeedbackUtil clearStudyState:](TIFeedbackUtil, "clearStudyState:", v4);
      v3 = 1;
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

+ (void)clearStudyState
{
  id v2;

  +[TIFeedbackUtil getStudyID](TIFeedbackUtil, "getStudyID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[TIFeedbackUtil clearStudyState:](TIFeedbackUtil, "clearStudyState:", v2);

}

+ (void)clearStudyState:(id)a3
{
  objc_class *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v18 = (id)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  objc_msgSend(CFSTR("feedbackState_KeyboardAutocorrection_"), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v5);

  objc_msgSend(CFSTR("feedbackInitialInputModes_KeyboardAutocorrection_"), "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v6);

  objc_msgSend(CFSTR("feedbackInitialTimestamp_KeyboardAutocorrection_"), "stringByAppendingString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v7);

  objc_msgSend(CFSTR("feedbackInitialPreferenceValue_KeyboardAutocorrection_"), "stringByAppendingString:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v8);

  objc_msgSend(CFSTR("feedbackFinalInputModes_KeyboardAutocorrection_"), "stringByAppendingString:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v9);

  objc_msgSend(CFSTR("feedbackFinalTimestamp_KeyboardAutocorrection_"), "stringByAppendingString:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v10);

  objc_msgSend(CFSTR("feedbackFinalPreferenceValue_KeyboardAutocorrection_"), "stringByAppendingString:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v11);

  objc_msgSend(CFSTR("feedbackSurveyOutcome_KeyboardAutocorrection_"), "stringByAppendingString:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v12);

  objc_msgSend(CFSTR("feedbackCompletionEventTimestamp_KeyboardAutocorrection_"), "stringByAppendingString:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v13);

  objc_msgSend(CFSTR("feedbackInitiationEventTimestamp_KeyboardAutocorrection_"), "stringByAppendingString:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v14);

  objc_msgSend(CFSTR("feedbackSurveyRequestEventTimestamp_KeyboardAutocorrection_"), "stringByAppendingString:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v15);

  objc_msgSend(CFSTR("feedbackRetryTimestamp_KeyboardAutocorrection_"), "stringByAppendingString:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v16);

  objc_msgSend(CFSTR("feedbackStudyLanguageRegionKeyKeyboardAutocorrection_"), "stringByAppendingString:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "removeObjectForKey:", v17);
}

+ (void)setStudyEnrollment:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v5 = (id)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("feedbackLastStudyEnrollment"));

}

+ (void)setStudyEnrollment
{
  +[TIFeedbackUtil setStudyEnrollment:](TIFeedbackUtil, "setStudyEnrollment:", CFSTR("S03"));
}

+ (int64_t)getFeedbackState
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getStateKey](TIFeedbackUtil, "getStateKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "integerForKey:", v3);

  return v4;
}

+ (void)setFeedbackState:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getStateKey](TIFeedbackUtil, "getStateKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInteger:forKey:", a3, v4);

}

+ (void)removeFeedbackState
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getStateKey](TIFeedbackUtil, "getStateKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

+ (BOOL)getInitialPreferenceValue
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackInitialPreferenceValue_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "BOOLForKey:", v3);

  return v4;
}

+ (void)setInitialPreferenceValue:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackInitialPreferenceValue_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, v4);

}

+ (void)removeInitialPreferenceValue
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackInitialPreferenceValue_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

+ (BOOL)getFinalPreferenceValue
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackFinalPreferenceValue_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "BOOLForKey:", v3);

  return v4;
}

+ (void)setFinalPreferenceValue:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackFinalPreferenceValue_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, v4);

}

+ (void)removeFinalPreferenceValue
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackFinalPreferenceValue_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

+ (id)getInitialInputModes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackInitialInputModes_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringArrayForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setInitialInputModes:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v6 = (id)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackInitialInputModes_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

+ (void)removeInitialInputModes
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackInitialInputModes_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

+ (id)getFinalInputModes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackFinalInputModes_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringArrayForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setFinalInputModes:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v6 = (id)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackFinalInputModes_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

+ (void)removeFinalInputModes
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackFinalInputModes_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

+ (id)getInitialTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackInitialTimestamp_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setInitialTimestamp:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v6 = (id)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackInitialTimestamp_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

+ (void)removeInitialTimestamp
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackInitialTimestamp_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

+ (id)getFinalTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackFinalTimestamp_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setFinalTimestamp:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v6 = (id)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackFinalTimestamp_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

+ (void)removeFinalTimestamp
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackFinalTimestamp_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

+ (id)getInitiationEventTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackInitiationEventTimestamp_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setInitiationEventTimestamp:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v6 = (id)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackInitiationEventTimestamp_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

+ (void)removeInitiationEventTimestamp
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackInitiationEventTimestamp_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

+ (id)getRequestSurveyEventTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackSurveyRequestEventTimestamp_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setRequestSurveyEventTimestamp:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v6 = (id)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackSurveyRequestEventTimestamp_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

+ (void)removeRequestSurveyEventTimestamp
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackSurveyRequestEventTimestamp_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

+ (id)getCompletionEventTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackCompletionEventTimestamp_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setCompletionEventTimestamp:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v6 = (id)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackCompletionEventTimestamp_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

+ (void)removeCompletionEventTimestamp
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackCompletionEventTimestamp_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

+ (int64_t)getSurveyOutcome
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackSurveyOutcome_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "integerForKey:", v3);

  return v4;
}

+ (void)setSurveyOutcome:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackSurveyOutcome_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInteger:forKey:", a3, v4);

}

+ (void)removeSurveyOutcome
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackSurveyOutcome_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

+ (id)getRetryTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackRetryTimestamp_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setRetryTimestamp:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v6 = (id)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackRetryTimestamp_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

+ (void)removeRetryTimestamp
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackRetryTimestamp_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

+ (int64_t)getBucketedDuration
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[TIFeedbackUtil getFinalTimestamp](TIFeedbackUtil, "getFinalTimestamp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIFeedbackUtil getInitialTimestamp](TIFeedbackUtil, "getInitialTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(&unk_1E24B05E8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(&unk_1E24B05E8);
        if (v5 < (double)(int)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "intValue"))
          return v8 + (int)v10;
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(&unk_1E24B05E8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    return 0;
  }
  return v11;
}

+ (id)getStudyLanguageAndRegion
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackStudyLanguageRegionKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setStudyLanguageAndRegion:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v6 = (id)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackStudyLanguageRegionKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

+ (void)removeStudyLanguageAndRegion
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", CFSTR("feedbackStudyLanguageRegionKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIFeedbackUtil getKeyNameFor:](TIFeedbackUtil, "getKeyNameFor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v3);

}

+ (id)getFormIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  +[TIFeedbackUtil getStudyLanguageAndRegion](TIFeedbackUtil, "getStudyLanguageAndRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), &stru_1E243B990);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("framework-autocorrect_"), "stringByAppendingString:", CFSTR("S03"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("_"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E243B990;
  }
  return v7;
}

+ (id)getFormMetadata
{
  void *v2;
  int64_t v3;
  void *v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[TIFeedbackUtil getBucketedDuration](TIFeedbackUtil, "getBucketedDuration");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR(":duration"));
  if (+[TIFeedbackUtil getInitialPreferenceValue](TIFeedbackUtil, "getInitialPreferenceValue"))
    v5 = CFSTR("1");
  else
    v5 = CFSTR("0");
  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR(":initialPreferenceValue"));

  return v2;
}

void __71__TIFeedbackUtil_getSupportedLangRegionFromSupportedFeedbackLanguages___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  +[TIInputModeController sharedInputModeController](TIInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledInputModeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[TIFeedbackUtil shouldOverrideLanguageRegionCheck](TIFeedbackUtil, "shouldOverrideLanguageRegionCheck"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v30 != v7)
            objc_enumerationMutation(v4);
          TIInputModeGetLanguageWithRegion(*(void **)(*((_QWORD *)&v29 + 1) + 8 * i));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          +[TIFeedbackUtil getSupportedFeedbackLanguages](TIFeedbackUtil, "getSupportedFeedbackLanguages");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "containsObject:", v9);

          if (v11)
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v6);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v12 = +[TIFeedbackUtil supportedLanguagesHaveRegions:](TIFeedbackUtil, "supportedLanguagesHaveRegions:", *(_QWORD *)(a1 + 32));
    if (v12)
    {
      objc_msgSend(v4, "languageIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "languageIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v4, "languageCode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v15))
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v16 = v3;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v26;
        while (2)
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v26 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
            if (v12)
              TIInputModeGetLanguageWithRegion(v21);
            else
              TIInputModeGetLanguage(v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "isEqualToString:", v15, (_QWORD)v25))
            {
              v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v24 = *(void **)(v23 + 40);
              *(_QWORD *)(v23 + 40) = v22;

              goto LABEL_29;
            }

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v18)
            continue;
          break;
        }
      }
LABEL_29:

    }
  }

}

uint64_t __71__TIFeedbackUtil_getSupportedLangRegionFromSupportedFeedbackLanguages___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
