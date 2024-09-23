@implementation PLEnhancedTaskingAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLEnhancedTaskingAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("AppSwitchTrigger");
  objc_msgSend(a1, "entryEventNoneDefinitionAppSwitchTrigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventNoneDefinitionAppSwitchTrigger
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("Configs");
  v10[0] = CFSTR("SchemaVersion");
  v10[1] = CFSTR("TaskModeTable");
  v11[0] = &unk_1E6ABEE40;
  v11[1] = MEMORY[0x1E0C9AAB0];
  v10[2] = CFSTR("OnDemandQuery");
  v11[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = CFSTR("Keys");
  v8 = CFSTR("Enabled");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventIntervalDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("UINavigationController");
  objc_msgSend(a1, "entryEventIntervalDefinitionUINavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("ScrollView");
  objc_msgSend(a1, "entryEventIntervalDefinitionScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("InProcessAnimation");
  objc_msgSend(a1, "entryEventIntervalDefinitionInProcessAnimation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventIntervalDefinitionUINavigationController
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
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[2];
  _QWORD v21[4];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("Configs");
  v18[0] = CFSTR("SchemaVersion");
  v18[1] = CFSTR("TaskModeTable");
  v19[0] = &unk_1E6ABEE40;
  v19[1] = MEMORY[0x1E0C9AAB0];
  v18[2] = CFSTR("OnDemandQuery");
  v18[3] = CFSTR("AppIdentifierKeys");
  v19[2] = MEMORY[0x1E0C9AAA0];
  v19[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v20[1] = CFSTR("Keys");
  v16[0] = CFSTR("timestampEnd");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_DateFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v16[1] = CFSTR("SignpostName");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v3;
  v16[2] = CFSTR("ProcessName");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withProcessName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  v16[3] = CFSTR("Duration");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat_withUnit_ms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v7;
  v16[4] = CFSTR("Count");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventIntervalDefinitionInProcessAnimation
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
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[2];
  _QWORD v21[4];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("Configs");
  v18[0] = CFSTR("SchemaVersion");
  v18[1] = CFSTR("TaskModeTable");
  v19[0] = &unk_1E6ABEE40;
  v19[1] = MEMORY[0x1E0C9AAB0];
  v18[2] = CFSTR("OnDemandQuery");
  v18[3] = CFSTR("AppIdentifierKeys");
  v19[2] = MEMORY[0x1E0C9AAA0];
  v19[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v20[1] = CFSTR("Keys");
  v16[0] = CFSTR("timestampEnd");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_DateFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v16[1] = CFSTR("SignpostName");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v3;
  v16[2] = CFSTR("ProcessName");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withProcessName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  v16[3] = CFSTR("Duration");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat_withUnit_ms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v7;
  v16[4] = CFSTR("Count");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventIntervalDefinitionScrollView
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[6];
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[2];
  _QWORD v23[4];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("Configs");
  v20[0] = CFSTR("SchemaVersion");
  v20[1] = CFSTR("TaskModeTable");
  v21[0] = &unk_1E6ABEE50;
  v21[1] = MEMORY[0x1E0C9AAB0];
  v20[2] = CFSTR("OnDemandQuery");
  v20[3] = CFSTR("AppIdentifierKeys");
  v21[2] = MEMORY[0x1E0C9AAA0];
  v21[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v22[1] = CFSTR("Keys");
  v18[0] = CFSTR("timestampEnd");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_DateFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v18[1] = CFSTR("SignpostName");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  v18[2] = CFSTR("ValueGroup");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v3;
  v18[3] = CFSTR("ProcessName");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withProcessName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  v18[4] = CFSTR("highRateDuration");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat_withUnit_ms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v7;
  v18[5] = CFSTR("Count");
  +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (PLEnhancedTaskingAgent)init
{
  PLEnhancedTaskingAgent *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLEnhancedTaskingAgent;
  v2 = -[PLAgent init](&v11, sel_init);
  if (v2)
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v3 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __30__PLEnhancedTaskingAgent_init__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v3;
      if (init_defaultOnce != -1)
        dispatch_once(&init_defaultOnce, block);
      if (init_classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLEnhancedTaskingAgent enabled"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Agents/PLEnhancedTaskingAgent.m");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastPathComponent");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEnhancedTaskingAgent init]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 161);

        PLLogCommon();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    objc_storeStrong((id *)&_enhancedTaskingAgent, v2);
  }
  return v2;
}

BOOL __30__PLEnhancedTaskingAgent_init__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  init_classDebugEnabled = result;
  return result;
}

+ (void)logAggregatedDataFromSignpostWithStartDate:(id)a3 withEndDate:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  SignpostReaderHelper *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t block;
  uint64_t v21;
  BOOL (*v22)(uint64_t);
  void *v23;
  uint64_t v24;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    v7 = (void *)v6;
    if (!v5)
      goto LABEL_19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (unint64_t)(id)logAggregatedDataFromSignpostWithStartDate_withEndDate__previousEndDate;
    objc_storeStrong((id *)&logAggregatedDataFromSignpostWithStartDate_withEndDate__previousEndDate, v7);
    if (!v5)
      goto LABEL_19;
  }
  if (v7)
  {
    +[PLEnhancedTaskingAgent allowlistForSignpostAggregatedData](PLEnhancedTaskingAgent, "allowlistForSignpostAggregatedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
      v9 = _enhancedTaskingAgent == 0;
    else
      v9 = 1;
    if (!v9)
    {
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v10 = objc_opt_class();
        block = MEMORY[0x1E0C809B0];
        v21 = 3221225472;
        v22 = __81__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithStartDate_withEndDate___block_invoke;
        v23 = &__block_descriptor_40_e5_v8__0lu32l8;
        v24 = v10;
        if (logAggregatedDataFromSignpostWithStartDate_withEndDate__defaultOnce != -1)
          dispatch_once(&logAggregatedDataFromSignpostWithStartDate_withEndDate__defaultOnce, &block);
        if (logAggregatedDataFromSignpostWithStartDate_withEndDate__classDebugEnabled)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("getSignpostSummary with allowlist = %@, startDate = %@, endDate = %@"), v8, v5, v7, block, v21, v22, v23, v24);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Agents/PLEnhancedTaskingAgent.m");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lastPathComponent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLEnhancedTaskingAgent logAggregatedDataFromSignpostWithStartDate:withEndDate:]");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v13, v14, 187);

          PLLogCommon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
      v16 = objc_alloc_init(SignpostReaderHelper);
      objc_msgSend((id)v5, "convertFromMonotonicToSystem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "convertFromMonotonicToSystem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostReaderHelper getSignpostSummaryWithAllowlist:withStartDate:withEndDate:](v16, "getSignpostSummaryWithAllowlist:withStartDate:withEndDate:", v8, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_enhancedTaskingAgent, "logAggregatedDataFromSignpostWithPayload:withStartDate:withEndDate:", v19, v5, v7);

    }
  }
LABEL_19:

}

BOOL __81__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithStartDate_withEndDate___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logAggregatedDataFromSignpostWithStartDate_withEndDate__classDebugEnabled = result;
  return result;
}

+ (id)allowlistForSignpostAggregatedData
{
  id v2;
  void *v3;
  _BOOL4 v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t block;
  uint64_t v18;
  BOOL (*v19)(uint64_t);
  void *v20;
  uint64_t v21;

  if (+[PLDefaults taskMode](PLDefaults, "taskMode")
    || +[PLDefaults fullMode](PLDefaults, "fullMode"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[PLOperator className](PLEnhancedTaskingAgent, "className");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[PLEntryKey isEntryKeySetup:forOperatorName:](PLEntryKey, "isEntryKeySetup:forOperatorName:", CFSTR("PLEnhancedTaskingAgent_EventInterval_UINavigationController"), v3);

    if (v4)
      objc_msgSend(v2, "addObject:", CFSTR("UINavigationController"));
    +[PLOperator className](PLEnhancedTaskingAgent, "className");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PLEntryKey isEntryKeySetup:forOperatorName:](PLEntryKey, "isEntryKeySetup:forOperatorName:", CFSTR("PLEnhancedTaskingAgent_EventInterval_InProcessAnimation"), v5);

    if (v6)
      objc_msgSend(v2, "addObject:", CFSTR("InProcessAnimation"));
    +[PLOperator className](PLEnhancedTaskingAgent, "className");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[PLEntryKey isEntryKeySetup:forOperatorName:](PLEntryKey, "isEntryKeySetup:forOperatorName:", CFSTR("PLEnhancedTaskingAgent_EventInterval_ScrollView"), v7);

    if (v8)
      objc_msgSend(v2, "addObject:", CFSTR("ScrollView"));
    if (objc_msgSend(v2, "count"))
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v9, "setObject:forKey:", v2, CFSTR("com.apple.UIKit"));
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v10 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __60__PLEnhancedTaskingAgent_allowlistForSignpostAggregatedData__block_invoke;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    v21 = v10;
    if (allowlistForSignpostAggregatedData_defaultOnce != -1)
      dispatch_once(&allowlistForSignpostAggregatedData_defaultOnce, &block);
    if (allowlistForSignpostAggregatedData_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("allowlistForSignpostAggregatedData=%@\n"), v9, block, v18, v19, v20, v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Agents/PLEnhancedTaskingAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLEnhancedTaskingAgent allowlistForSignpostAggregatedData]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v13, v14, 221);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  return v9;
}

BOOL __60__PLEnhancedTaskingAgent_allowlistForSignpostAggregatedData__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  allowlistForSignpostAggregatedData_classDebugEnabled = result;
  return result;
}

- (id)aggregatedSignpostDataWithEntryKey:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5 withSignpostName:(id)a6 withProcess:(id)a7 withDataDict:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PLEntry *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = -[PLEntry initWithEntryKey:withDate:]([PLEntry alloc], "initWithEntryKey:withDate:", v19, v18);

  -[PLEntry setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v17, CFSTR("timestampEnd"));
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Duration"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  v24 = (void *)MEMORY[0x1E0CB37E8];
  v25 = -[PLEnhancedTaskingAgent getSignpostNameValueGroupTypeFor:](self, "getSignpostNameValueGroupTypeFor:", v16);

  objc_msgSend(v24, "numberWithUnsignedInt:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntry setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v26, CFSTR("SignpostName"));

  -[PLEntry setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v15, CFSTR("ProcessName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)(v23 * 1000.0));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntry setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v27, CFSTR("Duration"));

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLEntry setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v28, CFSTR("Count"));
  return v20;
}

- (void)logAggregatedDataFromSignpostWithPayload:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD block[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate__defaultOnce != -1)
      dispatch_once(&logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate__defaultOnce, block);
    if (logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("logAggregatedDataFromSignpostWithPayload:%@\n"), v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Agents/PLEnhancedTaskingAgent.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEnhancedTaskingAgent logAggregatedDataFromSignpostWithPayload:withStartDate:withEndDate:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v15, v16, 250);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_85;
  v20[3] = &unk_1E6A52458;
  v20[4] = self;
  v21 = v9;
  v22 = v10;
  v18 = v10;
  v19 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v20);

}

BOOL __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate__classDebugEnabled = result;
  return result;
}

void __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", CFSTR("EventInterval"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_2;
  v15[3] = &unk_1E6A52430;
  v15[4] = *(_QWORD *)(a1 + 32);
  v10 = v9;
  v16 = v10;
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  v11 = v8;
  v19 = v11;
  v12 = v5;
  v20 = v12;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v15);

  if (objc_msgSend(v11, "count"))
  {
    v13 = *(void **)(a1 + 32);
    v21 = v10;
    v22[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logEntries:withGroupID:", v14, v10);

  }
}

void __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_3;
  v8[3] = &unk_1E6A52408;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = v5;
  v13 = *(id *)(a1 + 64);
  v14 = *(id *)(a1 + 72);
  v7 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Duration")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_msgSend(*(id *)(a1 + 32), "aggregatedSignpostDataWithEntryKey:withStartDate:withEndDate:withSignpostName:withProcess:withDataDict:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v9, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 72), "addObject:", v7);

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_4;
    v10[3] = &unk_1E6A523E0;
    v8 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 64);
    v15 = v9;
    v16 = *(id *)(a1 + 80);
    v17 = *(id *)(a1 + 72);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
}

void __93__PLEnhancedTaskingAgent_logAggregatedDataFromSignpostWithPayload_withStartDate_withEndDate___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "aggregatedSignpostDataWithEntryKey:withStartDate:withEndDate:withSignpostName:withProcess:withDataDict:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "getSignpostNameValueGroupTypeFor:", v13));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("ValueGroup"));

    if (objc_msgSend(*(id *)(a1 + 80), "isEqualToString:", CFSTR("ScrollView")))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("highRateDuration"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("highRateDuration"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v11 = v10;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)(v11 * 1000.0));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("highRateDuration"));

      }
    }
    objc_msgSend(*(id *)(a1 + 88), "addObject:", v6);

  }
}

- (int)getSignpostNameValueGroupTypeFor:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NavigationTransition")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CustomNavigationTransition")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SwitchTabs")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Scroll_Dragging")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Scroll_Deceleration")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Scroll_Animating")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Vertical")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Horizontal")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Diagonal")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AnimatorRunning")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Scroll_Zooming")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
