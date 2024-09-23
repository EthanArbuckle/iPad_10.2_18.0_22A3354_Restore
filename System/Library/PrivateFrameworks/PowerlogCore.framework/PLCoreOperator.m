@implementation PLCoreOperator

+ (void)registerOperator:(Class)a3
{
  void *i;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;

  if (registerOperator__onceToken != -1)
    dispatch_once(&registerOperator__onceToken, &__block_literal_global_3);
  for (i = (void *)-[objc_class superclass](a3, "superclass");
        i != (void *)objc_opt_class();
        i = (void *)objc_msgSend(i, "superclass"))
  {
    if (i == (void *)objc_opt_class())
      break;
    if (i == (void *)objc_opt_class())
      break;
  }
  objc_msgSend((id)_registeredOperators, "objectForKeyedSubscript:", i);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (id)_registeredOperators;
    objc_sync_enter(v6);
    objc_msgSend((id)_registeredOperators, "objectForKeyedSubscript:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend((id)_registeredOperators, "setObject:forKeyedSubscript:", v8, i);

    }
    objc_sync_exit(v6);

  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ registered"), i, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLCoreOperator.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLCoreOperator registerOperator:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v11, v12, 38);

    PLLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  }
  objc_msgSend((id)_registeredOperators, "objectForKeyedSubscript:", i);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v14);
  objc_msgSend((id)_registeredOperators, "objectForKeyedSubscript:", i);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", a3);

  objc_sync_exit(v14);
}

void __35__PLCoreOperator_registerOperator___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_registeredOperators;
  _registeredOperators = v0;

}

+ (id)registeredOperatorsOfSuperClassType:(Class)a3
{
  return (id)objc_msgSend((id)_registeredOperators, "objectForKeyedSubscript:", a3);
}

+ (id)registeredOperators
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class() || (v4 = objc_opt_class(), v4 == objc_opt_class()))
  {
    objc_msgSend(a1, "registeredOperatorsOfSuperClassType:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (PLCoreOperator)init
{
  PLCoreOperator *v2;
  uint64_t v3;
  NSMutableDictionary *operators;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLCoreOperator;
  v2 = -[PLCoreOperator init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    operators = v2->_operators;
    v2->_operators = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PLCoreOperator;
  -[PLCoreOperator dealloc](&v5, sel_dealloc);
}

- (void)initOperatorDependancies
{
  -[PLCoreOperator initOperatorDependanciesWithBlock:](self, "initOperatorDependanciesWithBlock:", &__block_literal_global_22);
}

void __42__PLCoreOperator_initOperatorDependancies__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  objc_msgSend(v2, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PLCoreOperator_initOperatorDependancies__block_invoke_2;
  block[3] = &unk_1E6A52050;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

uint64_t __42__PLCoreOperator_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "className");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B6AB6000, v2, OS_LOG_TYPE_DEFAULT, "Calling %@ initOperatorDependancies", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "initOperatorDependancies");
}

- (void)initOperatorDependanciesWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  -[PLCoreOperator operators](self, "operators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_sync_enter(v5);
  v7 = (void *)MEMORY[0x1BCC9E9B4](v6);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PLCoreOperator operators](self, "operators", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        if (v4)
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  objc_autoreleasePoolPop(v7);
  objc_sync_exit(v5);

}

- (void)initTaskOperatorDependancies
{
  void *v3;

  if (!+[PLDefaults liteMode](PLDefaults, "liteMode"))
  {
    if (!+[PLDefaults taskMode](PLDefaults, "taskMode")
      || (+[PLCoreStorage additionalTables](PLCoreStorage, "additionalTables"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v3,
          v3))
    {
      -[PLCoreOperator initOperatorDependanciesWithBlock:](self, "initOperatorDependanciesWithBlock:", &__block_literal_global_23);
    }
  }
}

void __46__PLCoreOperator_initTaskOperatorDependancies__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v2 = a2;
  +[PLCoreStorage additionalTables](PLCoreStorage, "additionalTables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "className");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    objc_msgSend(v2, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PLCoreOperator_initTaskOperatorDependancies__block_invoke_2;
    block[3] = &unk_1E6A52050;
    v9 = v2;
    dispatch_async(v7, block);

    goto LABEL_5;
  }
  v6 = +[PLDefaults fullMode](PLDefaults, "fullMode");

  if (v6)
    goto LABEL_4;
LABEL_5:

}

uint64_t __46__PLCoreOperator_initTaskOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "initTaskOperatorDependancies");
}

- (void)startServicesForPreUnlockTelemetry
{
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = NSClassFromString(CFSTR("PLXPCService"));
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCoreOperator setupEntryObjectsAndStorage:](self, "setupEntryObjectsAndStorage:", v3);

}

- (void)startOperatorsOfSuperClassType:(Class)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  objc_msgSend((id)objc_opt_class(), "registeredOperatorsOfSuperClassType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    objc_msgSend((id)objc_opt_class(), "registeredOperatorsOfSuperClassType:", a3);
  else
    +[PLUtilities allSubClassesForClass:](PLUtilities, "allSubClassesForClass:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ availableOperators=%@"), a3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLCoreOperator.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreOperator startOperatorsOfSuperClassType:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 123);

    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  }
  -[PLCoreOperator setupEntryObjectsAndStorage:](self, "setupEntryObjectsAndStorage:", v7);

}

- (void)setupEntryObjectsAndStorage:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _UNKNOWN **v11;
  uint64_t v12;
  uint64_t j;
  objc_class *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id obj;
  _QWORD v30[5];
  id v31;
  objc_class *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEnabled"))
          +[PLEntryKey setupEntryObjectsForOperatorClass:](PLEntryKey, "setupEntryObjectsForOperatorClass:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v5);
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v3;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v9)
  {
    v10 = v9;
    v11 = &off_1E6A51000;
    v12 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(obj);
        v14 = *(objc_class **)(*((_QWORD *)&v33 + 1) + 8 * j);
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[objc_class isEnabled](v14, "isEnabled");
        v17 = objc_msgSend(v11[28], "debugEnabled");
        if (v16)
        {
          if (v17)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Setting-up %@"), v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLCoreOperator.m");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "lastPathComponent");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreOperator setupEntryObjectsAndStorage:]");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v20, v21, 139);

            PLLogCommon();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v18;
              _os_log_debug_impl(&dword_1B6AB6000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v11 = &off_1E6A51000;
          }
          +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", v15);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __46__PLCoreOperator_setupEntryObjectsAndStorage___block_invoke;
          v30[3] = &unk_1E6A52270;
          v32 = v14;
          v30[4] = self;
          v31 = v15;
          +[PLUtilities dispatchSyncIfNotCallerQueue:withBlock:](PLUtilities, "dispatchSyncIfNotCallerQueue:withBlock:", v23, v30);

        }
        else
        {
          if (!v17)
            goto LABEL_26;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping %@"), v15);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLCoreOperator.m");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "lastPathComponent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreOperator setupEntryObjectsAndStorage:]");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v25, v26, 156);

          PLLogCommon();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v23;
            _os_log_debug_impl(&dword_1B6AB6000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v11 = &off_1E6A51000;
        }

LABEL_26:
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v10);
  }

}

void __46__PLCoreOperator_setupEntryObjectsAndStorage___block_invoke(uint64_t a1)
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
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  objc_msgSend(*(id *)(a1 + 48), "operator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setupStorageForOperator:", v3);

    objc_msgSend(*(id *)(a1 + 32), "operators");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v6);
    objc_msgSend(*(id *)(a1 + 32), "operators");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

    objc_sync_exit(v6);
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is running"), *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLCoreOperator.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreOperator setupEntryObjectsAndStorage:]_block_invoke");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 149);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        goto LABEL_7;
      goto LABEL_8;
    }
  }
  else if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ failed setup"), *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLCoreOperator.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreOperator setupEntryObjectsAndStorage:]_block_invoke");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v14, v15, 151);

    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
LABEL_7:
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_8:

  }
  objc_autoreleasePoolPop(v2);
}

- (void)log
{
  NSObject *v3;
  _QWORD block[5];

  +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__PLCoreOperator_log__block_invoke;
  block[3] = &unk_1E6A52050;
  block[4] = self;
  dispatch_async(v3, block);

}

void __21__PLCoreOperator_log__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allOperators");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
        v8 = objc_claimAutoreleasedReturnValue();
        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __21__PLCoreOperator_log__block_invoke_2;
        block[3] = &unk_1E6A52050;
        block[4] = v7;
        dispatch_sync(v8, block);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

void __21__PLCoreOperator_log__block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  objc_msgSend(*(id *)(a1 + 32), "log");
  objc_autoreleasePoolPop(v2);
}

- (id)tablesToTrimConditionsForTrimDate:(id)a3
{
  return 0;
}

- (id)allOperators
{
  void *v3;
  void *v4;
  void *v5;

  -[PLCoreOperator operators](self, "operators");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[PLCoreOperator operators](self, "operators");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  return v5;
}

- (NSMutableDictionary)operators
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOperators:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operators, 0);
}

@end
