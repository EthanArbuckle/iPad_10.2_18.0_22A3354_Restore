@implementation TIHapticsUsageAnalyzer

- (void)dispatchSessionEventWithActiveTime:(double)a3 visibleTime:(double)a4 session:(id)a5
{
  void *v7;
  uint64_t v8;
  int AppBooleanValue;
  int v10;
  int v11;
  BOOL v12;
  uint64_t v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t state64;
  Boolean keyExistsAndHasValidFormat;
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE448]);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("keyboard-audio"), CFSTR("com.apple.preferences.sounds"), &keyExistsAndHasValidFormat);
  v10 = keyExistsAndHasValidFormat;
  v11 = dispatchSessionEventWithActiveTime_visibleTime_session__notifyToken;
  if (dispatchSessionEventWithActiveTime_visibleTime_session__notifyToken == -1)
  {
    notify_register_check("com.apple.springboard.ringerstate", &dispatchSessionEventWithActiveTime_visibleTime_session__notifyToken);
    v11 = dispatchSessionEventWithActiveTime_visibleTime_session__notifyToken;
  }
  if (AppBooleanValue)
    v12 = 1;
  else
    v12 = v10 == 0;
  v13 = v12;
  state64 = 0;
  notify_get_state(v11, &state64);
  v14 = state64 != 0;
  v24[0] = CFSTR("activeTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", llround(a3));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  v24[1] = CFSTR("visibleTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", llround(a4));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v16;
  v24[2] = CFSTR("keyClicksEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  v24[3] = CFSTR("ringerSwitchOn");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v18;
  v24[4] = CFSTR("visceralEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dispatchEventWithName:payload:testingParameters:allowSparsePayload:", CFSTR("SoundAndHaptic.Session"), v20, 0, 1);

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
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[2];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DBDB18];
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("keyClicksEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v3;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("ringerSwitchOn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v4;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("visceralEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v5;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:", CFSTR("activeTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v6;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:", CFSTR("visibleTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("SoundAndHaptic.Session"), 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerEventSpec:", v9);

  v11 = (void *)MEMORY[0x1E0DBDB18];
  v12 = (void *)MEMORY[0x1E0DBDB20];
  objc_msgSend((id)objc_opt_class(), "idleTimeBuckets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFieldSpecWithName:allowedValues:", CFSTR("idleBucket"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DBDB20];
  v21[0] = CFSTR("first");
  v21[1] = CFSTR("intermediate");
  v21[2] = CFSTR("last");
  v22[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFieldSpecWithName:allowedValues:", CFSTR("idleType"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("SoundAndHaptic.IdlePeriods"), 0, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerEventSpec:", v19);

}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  double v30;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  const __CFString *v41;
  double v42;
  TIHapticsUsageAnalyzer *v44;
  void *v45;
  uint64_t v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v44 = self;
  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemUptime");
  v11 = v10;

  objc_msgSend(v5, "startTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  v14 = v11 + v13 - v8;

  objc_msgSend(v5, "endTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSince1970");
  v17 = v11 + v16 - v8;

  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v45 = v5;
  objc_msgSend(v5, "userActionHistory");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v53;
    v46 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v53 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        if (!objc_msgSend(v23, "actionType", v44))
        {
          v24 = v23;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          objc_msgSend(v24, "allTouches");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v49;
            do
            {
              for (j = 0; j != v27; ++j)
              {
                if (*(_QWORD *)v49 != v28)
                  objc_enumerationMutation(v25);
                objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "timestamp");
                if (v30 >= v14 && v30 <= v17)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "addObject:", v32);

                }
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            }
            while (v27);
          }

          v21 = v46;
        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v20);
  }

  objc_msgSend(v18, "sortUsingComparator:", &__block_literal_global_675);
  v33 = objc_msgSend(v18, "count");
  v34 = 0;
  v35 = 0.0;
  v36 = v14;
  do
  {
    if (v34 >= v33)
    {
      v42 = v17 - v36;
      v41 = CFSTR("last");
    }
    else
    {
      objc_msgSend(v18, "objectAtIndexedSubscript:", v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      v39 = v38;

      if (v34)
        v40 = v36;
      else
        v40 = v14;
      if (v34)
        v41 = CFSTR("intermediate");
      else
        v41 = CFSTR("first");
      v42 = v39 - v40;
      v36 = v39;
    }
    if (v42 >= 0.5)
    {
      v35 = v35 + v42;
      -[TIHapticsUsageAnalyzer dispatchIdleEventType:idleTime:session:](v44, "dispatchIdleEventType:idleTime:session:", v41, v45);
    }
    ++v34;
  }
  while (v34 <= v33);
  -[TIHapticsUsageAnalyzer dispatchSessionEventWithActiveTime:visibleTime:session:](v44, "dispatchSessionEventWithActiveTime:visibleTime:session:", v45, v17 - v14 - v35);

  return 1;
}

- (TIHapticsUsageAnalyzer)init
{
  TIHapticsUsageAnalyzer *v2;
  TIHapticsUsageAnalyzer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIHapticsUsageAnalyzer;
  v2 = -[TIHapticsUsageAnalyzer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TIHapticsUsageAnalyzer registerEventSpec](v2, "registerEventSpec");
  return v3;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:alignedSession:](TIStandardTypingSessionConfidenceEvaluator, "evaluateConfidenceInSession:alignedSession:", a3, a4);
}

+ (id)idleTimeBuckets
{
  return &unk_1EA13FEF8;
}

- (void)dispatchIdleEventType:(id)a3 idleTime:(double)a4 session:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("idleType");
  v10[1] = CFSTR("idleBucket");
  v11[0] = a3;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "bucketForTime:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dispatchEventWithName:payload:testingParameters:allowSparsePayload:", CFSTR("SoundAndHaptic.IdlePeriods"), v8, 0, 1);
}

uint64_t __71__TIHapticsUsageAnalyzer_analyzeSession_alignedSession_withConfidence___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)bucketForTime:(double)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;

  objc_msgSend(a1, "idleTimeBuckets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = (uint64_t)(a3 + a3);
  if (v6 <= 1)
    v6 = 1;
  v7 = v6 - 1;
  v8 = objc_msgSend(v4, "count");
  if (v8 - 1 >= v7)
    v9 = v7;
  else
    v9 = v8 - 1;
  objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
