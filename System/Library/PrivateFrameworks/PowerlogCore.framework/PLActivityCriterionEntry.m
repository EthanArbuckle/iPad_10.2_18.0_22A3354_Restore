@implementation PLActivityCriterionEntry

void __49__PLActivityCriterionEntry_scheduleEntryListener__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t (**v10)(_QWORD, _QWORD);
  _QWORD block[5];

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v4 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__PLActivityCriterionEntry_scheduleEntryListener__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_3 != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_3, block);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLActivityCriterionEntry::entryListenerBlock: entry=%@ for criterion=%@"), v3, *(_QWORD *)(a1 + 32));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionEntry.m");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastPathComponent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLActivityCriterionEntry scheduleEntryListener]_block_invoke");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v7, v8, 117);

        PLLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "criterionBlock");
    v10 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSatisfied:", ((uint64_t (**)(_QWORD, void *))v10)[2](v10, v3));

  }
}

uint64_t __45__PLActivityCriterionEntry_audioOffCriterion__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue") ^ 1;

  return v3;
}

- (id)criterionBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (PLActivityCriterionEntry)initWithEntryKey:(id)a3 withCriterionBlock:(id)a4
{
  return -[PLActivityCriterionEntry initWithEntryKey:withFilter:withCriterionBlock:](self, "initWithEntryKey:withFilter:withCriterionBlock:", a3, 0, a4);
}

- (PLActivityCriterionEntry)initWithEntryKey:(id)a3 withFilter:(id)a4 withCriterionBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  PLActivityCriterionEntry *v13;
  PLActivityCriterionEntry *v14;
  PLActivityCriterionEntry *v15;
  uint64_t v16;
  id criterionBlock;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v9 && v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)PLActivityCriterionEntry;
    v14 = -[PLActivityCriterion init](&v19, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_entryKey, a3);
      objc_storeStrong((id *)&v15->_filter, a4);
      v16 = objc_msgSend(v12, "copy");
      criterionBlock = v15->_criterionBlock;
      v15->_criterionBlock = (id)v16;

    }
    self = v15;
    v13 = self;
  }

  return v13;
}

+ (id)pluggedInCriterion
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)objc_opt_class());
  v12 = CFSTR("ExternalConnected");
  v10 = &unk_1E6ABB030;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PLActivityCriterionEntry_pluggedInCriterion__block_invoke;
  v8[3] = &unk_1E6A54D80;
  v9 = CFSTR("ExternalConnected");
  v6 = (void *)objc_msgSend(v2, "initWithEntryKey:withFilter:withCriterionBlock:", CFSTR("PLBatteryAgent_EventBackward_Battery"), v5, v8);

  return v6;
}

uint64_t __46__PLActivityCriterionEntry_pluggedInCriterion__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (id)displayOffCriterion
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)objc_opt_class());
  v12 = CFSTR("Active");
  v10 = &unk_1E6ABB030;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PLActivityCriterionEntry_displayOffCriterion__block_invoke;
  v8[3] = &unk_1E6A54D80;
  v9 = CFSTR("Active");
  v6 = (void *)objc_msgSend(v2, "initWithEntryKey:withFilter:withCriterionBlock:", CFSTR("PLDisplayAgent_EventPoint_Display"), v5, v8);

  return v6;
}

BOOL __47__PLActivityCriterionEntry_displayOffCriterion__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue") != 1;

  return v3;
}

+ (id)audioOffCriterion
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13;
  v13 = __Block_byref_object_dispose__13;
  v14 = CFSTR("Active");
  v2 = objc_alloc((Class)objc_opt_class());
  v17 = v10[5];
  v15 = &unk_1E6ABB030;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__PLActivityCriterionEntry_audioOffCriterion__block_invoke;
  v8[3] = &unk_1E6A54DA8;
  v8[4] = &v9;
  v6 = (void *)objc_msgSend(v2, "initWithEntryKey:withFilter:withCriterionBlock:", CFSTR("PLAudioAgent_EventForward_Routing"), v5, v8);

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)didEnableActivity:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t (**v21)(_QWORD, _QWORD);
  _QWORD v22[5];
  objc_super v23;
  _QWORD block[5];

  v4 = a3;
  v5 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PLActivityCriterionEntry_didEnableActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (didEnableActivity__defaultOnce_0 != -1)
      dispatch_once(&didEnableActivity__defaultOnce_0, block);
    if (didEnableActivity__classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLActivityCriterionEntry::didEnableActivity:%@ for criterion=%@"), v4, self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionEntry.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLActivityCriterionEntry didEnableActivity:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 89);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v23.receiver = self;
  v23.super_class = (Class)PLActivityCriterionEntry;
  -[PLActivityCriterion didEnableActivity:](&v23, sel_didEnableActivity_, v4);
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLActivityCriterionEntry entryKey](self, "entryKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastEntryForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __46__PLActivityCriterionEntry_didEnableActivity___block_invoke_30;
    v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v22[4] = objc_opt_class();
    if (didEnableActivity__defaultOnce_28 != -1)
      dispatch_once(&didEnableActivity__defaultOnce_28, v22);
    if (didEnableActivity__classDebugEnabled_29)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLActivityCriterionEntry::didEnableActivity: entry=%@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionEntry.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLActivityCriterionEntry didEnableActivity:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v18, v19, 93);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  if (v15)
  {
    -[PLActivityCriterionEntry criterionBlock](self, "criterionBlock");
    v21 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[PLActivityCriterion setSatisfied:](self, "setSatisfied:", ((uint64_t (**)(_QWORD, void *))v21)[2](v21, v15));

  }
  -[PLActivityCriterionEntry scheduleEntryListener](self, "scheduleEntryListener");

}

BOOL __46__PLActivityCriterionEntry_didEnableActivity___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didEnableActivity__classDebugEnabled_0 = result;
  return result;
}

BOOL __46__PLActivityCriterionEntry_didEnableActivity___block_invoke_30(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didEnableActivity__classDebugEnabled_29 = result;
  return result;
}

- (void)didDisableActivity:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_super v11;
  _QWORD block[5];

  v4 = a3;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLActivityCriterionEntry_didDisableActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didDisableActivity__defaultOnce_0 != -1)
      dispatch_once(&didDisableActivity__defaultOnce_0, block);
    if (didDisableActivity__classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLActivityCriterionEntry::didDisableActivity:%@ for criterion=%@"), v4, self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionEntry.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLActivityCriterionEntry didDisableActivity:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 105);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v11.receiver = self;
  v11.super_class = (Class)PLActivityCriterionEntry;
  -[PLActivityCriterion didDisableActivity:](&v11, sel_didDisableActivity_, v4);
  -[PLActivityCriterionEntry setEntryListener:](self, "setEntryListener:", 0);

}

BOOL __47__PLActivityCriterionEntry_didDisableActivity___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didDisableActivity__classDebugEnabled_0 = result;
  return result;
}

- (void)scheduleEntryListener
{
  void *v3;
  void *v4;
  PLEntryNotificationOperatorComposition *v5;
  void *v6;
  void *v7;
  void *v8;
  PLEntryNotificationOperatorComposition *v9;
  PLEntryNotificationOperatorComposition *entryListener;
  PLEntryNotificationOperatorComposition *v11;
  _QWORD v12[5];

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__PLActivityCriterionEntry_scheduleEntryListener__block_invoke;
  v12[3] = &unk_1E6A52118;
  v12[4] = self;
  v3 = (void *)MEMORY[0x1BCC9EB70](v12, a2);
  -[PLActivityCriterionEntry filter](self, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [PLEntryNotificationOperatorComposition alloc];
  dispatch_get_global_queue(2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLActivityCriterionEntry entryKey](self, "entryKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PLActivityCriterionEntry filter](self, "filter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PLEntryNotificationOperatorComposition initWithWorkQueue:forEntryKey:withFilter:withBlock:](v5, "initWithWorkQueue:forEntryKey:withFilter:withBlock:", v6, v7, v8, v3);
    entryListener = self->_entryListener;
    self->_entryListener = v9;

  }
  else
  {
    v11 = -[PLEntryNotificationOperatorComposition initWithWorkQueue:forEntryKey:withBlock:](v5, "initWithWorkQueue:forEntryKey:withBlock:", v6, v7, v3);
    v8 = self->_entryListener;
    self->_entryListener = v11;
  }

}

BOOL __49__PLActivityCriterionEntry_scheduleEntryListener__block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_3 = result;
  return result;
}

- (NSString)entryKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCriterionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSDictionary)filter
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PLEntryNotificationOperatorComposition)entryListener
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEntryListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryListener, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong(&self->_criterionBlock, 0);
  objc_storeStrong((id *)&self->_entryKey, 0);
}

@end
