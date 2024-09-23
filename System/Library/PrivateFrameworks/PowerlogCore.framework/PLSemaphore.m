@implementation PLSemaphore

+ (id)sharedSemaphoreForKey:(id)a3
{
  id v3;
  id v4;
  void *v5;
  PLSemaphore *v6;
  void *v7;

  v3 = a3;
  if (sharedSemaphoreForKey__onceToken != -1)
    dispatch_once(&sharedSemaphoreForKey__onceToken, &__block_literal_global_10);
  v4 = (id)sharedSemaphoreForKey___sharedSemaphores;
  objc_sync_enter(v4);
  objc_msgSend((id)sharedSemaphoreForKey___sharedSemaphores, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[PLSemaphore initWithKey:]([PLSemaphore alloc], "initWithKey:", v3);
    objc_msgSend((id)sharedSemaphoreForKey___sharedSemaphores, "setObject:forKeyedSubscript:", v6, v3);

  }
  objc_msgSend((id)sharedSemaphoreForKey___sharedSemaphores, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  return v7;
}

void __37__PLSemaphore_sharedSemaphoreForKey___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedSemaphoreForKey___sharedSemaphores;
  sharedSemaphoreForKey___sharedSemaphores = v0;

}

- (PLSemaphore)initWithKey:(id)a3
{
  id v5;
  PLSemaphore *v6;
  PLSemaphore *v7;
  uint64_t v8;
  NSMutableSet *interestedObjects;
  uint64_t v10;
  NSMutableSet *pendingDoneObjects;
  NSCondition *v12;
  NSCondition *pendingObjectsLock;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLSemaphore;
  v6 = -[PLSemaphore init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_key, a3);
    v7->_timeout = 3.0;
    v8 = objc_opt_new();
    interestedObjects = v7->_interestedObjects;
    v7->_interestedObjects = (NSMutableSet *)v8;

    v10 = objc_opt_new();
    pendingDoneObjects = v7->_pendingDoneObjects;
    v7->_pendingDoneObjects = (NSMutableSet *)v10;

    v12 = (NSCondition *)objc_alloc_init(MEMORY[0x1E0CB3530]);
    pendingObjectsLock = v7->_pendingObjectsLock;
    v7->_pendingObjectsLock = v12;

  }
  return v7;
}

- (BOOL)isActive
{
  void *v3;
  BOOL v4;

  -[NSCondition lock](self->_pendingObjectsLock, "lock");
  -[PLSemaphore pendingDoneObjects](self, "pendingDoneObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  -[NSCondition unlock](self->_pendingObjectsLock, "unlock");
  return v4;
}

- (void)signalInterestByObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PLSemaphore interestedObjects](self, "interestedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[PLSemaphore interestedObjects](self, "interestedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  objc_sync_exit(v4);
  -[NSCondition lock](self->_pendingObjectsLock, "lock");
  -[PLSemaphore pendingDoneObjects](self, "pendingDoneObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  -[NSCondition unlock](self->_pendingObjectsLock, "unlock");
}

- (void)signalNonInterestByObject:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PLSemaphore interestedObjects](self, "interestedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[PLSemaphore interestedObjects](self, "interestedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  objc_sync_exit(v4);
}

- (void)signalDoneByObject:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  BOOL (*v32)(uint64_t);
  void *v33;
  uint64_t v34;
  _QWORD v35[5];
  _QWORD block[5];

  v4 = a3;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__PLSemaphore_signalDoneByObject___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (signalDoneByObject__defaultOnce != -1)
      dispatch_once(&signalDoneByObject__defaultOnce, block);
    if (signalDoneByObject__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("done signaled by %@"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSemaphore.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSemaphore signalDoneByObject:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 80);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[NSCondition lock](self->_pendingObjectsLock, "lock");
  -[PLSemaphore pendingDoneObjects](self, "pendingDoneObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v13 = objc_opt_class();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __34__PLSemaphore_signalDoneByObject___block_invoke_21;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v13;
      if (signalDoneByObject__defaultOnce_19 != -1)
        dispatch_once(&signalDoneByObject__defaultOnce_19, v35);
      if (signalDoneByObject__classDebugEnabled_20)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("removed %@ from pendingDoneObjects"), v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSemaphore.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSemaphore signalDoneByObject:]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v16, v17, 83);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    -[PLSemaphore pendingDoneObjects](self, "pendingDoneObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObject:", v4);

    -[PLSemaphore pendingDoneObjects](self, "pendingDoneObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (!v21)
    {
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v22 = objc_opt_class();
        v30 = MEMORY[0x1E0C809B0];
        v31 = 3221225472;
        v32 = __34__PLSemaphore_signalDoneByObject___block_invoke_26;
        v33 = &__block_descriptor_40_e5_v8__0lu32l8;
        v34 = v22;
        if (signalDoneByObject__defaultOnce_24 != -1)
          dispatch_once(&signalDoneByObject__defaultOnce_24, &v30);
        if (signalDoneByObject__classDebugEnabled_25)
        {
          v23 = (void *)MEMORY[0x1E0CB3940];
          -[PLSemaphore key](self, "key");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("PLSemaphore %@ signalDone!"), v24, v30, v31, v32, v33, v34);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSemaphore.m");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lastPathComponent");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSemaphore signalDoneByObject:]");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v27, v28, 87);

          PLLogCommon();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
      -[NSCondition signal](self->_pendingObjectsLock, "signal");
    }
  }
  -[NSCondition unlock](self->_pendingObjectsLock, "unlock");

}

BOOL __34__PLSemaphore_signalDoneByObject___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  signalDoneByObject__classDebugEnabled = result;
  return result;
}

BOOL __34__PLSemaphore_signalDoneByObject___block_invoke_21(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  signalDoneByObject__classDebugEnabled_20 = result;
  return result;
}

BOOL __34__PLSemaphore_signalDoneByObject___block_invoke_26(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  signalDoneByObject__classDebugEnabled_25 = result;
  return result;
}

- (void)signalStartListening
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t block;
  uint64_t v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  uint64_t v17;

  -[NSCondition lock](self->_pendingObjectsLock, "lock");
  -[PLSemaphore pendingDoneObjects](self, "pendingDoneObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSemaphore interestedObjects](self, "interestedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __35__PLSemaphore_signalStartListening__block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v5;
    if (signalStartListening_defaultOnce != -1)
      dispatch_once(&signalStartListening_defaultOnce, &block);
    if (signalStartListening_classDebugEnabled)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      -[PLSemaphore pendingDoneObjects](self, "pendingDoneObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Start Listening for %@"), v7, block, v14, v15, v16, v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSemaphore.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSemaphore signalStartListening]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 97);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[NSCondition unlock](self->_pendingObjectsLock, "unlock");
}

BOOL __35__PLSemaphore_signalStartListening__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  signalStartListening_classDebugEnabled = result;
  return result;
}

- (void)waitWithBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__PLSemaphore_waitWithBlock___block_invoke;
  v7[3] = &unk_1E6A525F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __29__PLSemaphore_waitWithBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "waitWithBlockSync:", *(_QWORD *)(a1 + 40));
}

- (void)waitWithBlockSync:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  char *__ptr32 *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void (**v29)(_QWORD);
  _QWORD v30[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  -[NSCondition lock](self->_pendingObjectsLock, "lock");
  -[PLSemaphore pendingDoneObjects](self, "pendingDoneObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = &off_1B6B88000;
  if (v6)
  {
    v29 = v4;
    do
    {
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v8 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __33__PLSemaphore_waitWithBlockSync___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v8;
        if (waitWithBlockSync__defaultOnce != -1)
          dispatch_once(&waitWithBlockSync__defaultOnce, block);
        if (waitWithBlockSync__classDebugEnabled)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("waiting for signal to be done"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSemaphore.m");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "lastPathComponent");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSemaphore waitWithBlockSync:]");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v11, v12, 111);

          PLLogCommon();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v9;
            _os_log_debug_impl(&dword_1B6AB6000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      v14 = (void *)MEMORY[0x1E0C99D68];
      -[PLSemaphore timeout](self, "timeout");
      objc_msgSend(v14, "dateWithTimeIntervalSinceNow:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[NSCondition waitUntilDate:](self->_pendingObjectsLock, "waitUntilDate:", v15);

      -[PLSemaphore pendingDoneObjects](self, "pendingDoneObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

    }
    while (v18 && v16);
    v19 = !v16;
    v4 = v29;
    v7 = &off_1B6B88000;
  }
  else
  {
    v19 = 0;
  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v20 = objc_opt_class();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = *((_QWORD *)v7 + 66);
    v30[2] = __33__PLSemaphore_waitWithBlockSync___block_invoke_36;
    v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v30[4] = v20;
    if (waitWithBlockSync__defaultOnce_34 != -1)
      dispatch_once(&waitWithBlockSync__defaultOnce_34, v30);
    if (waitWithBlockSync__classDebugEnabled_35)
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      -[PLSemaphore key](self, "key");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSemaphore pendingDoneObjects](self, "pendingDoneObjects");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("PLSemaphore %@ ended! timedOut=%d pendingDoneObjects=%@"), v22, v19, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSemaphore.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSemaphore waitWithBlockSync:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v26, v27, 117);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[NSCondition unlock](self->_pendingObjectsLock, "unlock");
  v4[2](v4);

}

BOOL __33__PLSemaphore_waitWithBlockSync___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  waitWithBlockSync__classDebugEnabled = result;
  return result;
}

BOOL __33__PLSemaphore_waitWithBlockSync___block_invoke_36(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  waitWithBlockSync__classDebugEnabled_35 = result;
  return result;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSMutableSet)interestedObjects
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInterestedObjects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableSet)pendingDoneObjects
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPendingDoneObjects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSCondition)pendingObjectsLock
{
  return (NSCondition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPendingObjectsLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingObjectsLock, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_pendingDoneObjects, 0);
  objc_storeStrong((id *)&self->_interestedObjects, 0);
}

@end
