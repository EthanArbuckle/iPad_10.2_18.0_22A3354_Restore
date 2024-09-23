@implementation _TSF_TSDClockManager

+ (void)initialize
{
  _TSF_TSDKextNotifier *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(_TSF_TSDKextNotifier);
    v3 = (void *)_kextNotifier;
    _kextNotifier = (uint64_t)v2;

    v4 = _kextNotifier;
    objc_msgSend(MEMORY[0x1E0D39F08], "serviceMatching:", CFSTR("IOTimeSyncClockManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend((id)v4, "startNotificationsWithMatchingDictionary:", v5);

    if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136316418;
      v7 = "startedNotifier";
      v8 = 2048;
      v9 = 0;
      v10 = 2048;
      v11 = 0;
      v12 = 2080;
      v13 = "";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
      v16 = 1024;
      v17 = 60;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
    }
  }
}

+ (void)notifyWhenClockManagerIsAvailable:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)_kextNotifier;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58___TSF_TSDClockManager_notifyWhenClockManagerIsAvailable___block_invoke;
  v6[3] = &unk_1E694B8E0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "notifyWhenServiceIsAvailable:", v6);

}

+ (void)notifyWhenClockManagerIsUnavailable:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)_kextNotifier;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60___TSF_TSDClockManager_notifyWhenClockManagerIsUnavailable___block_invoke;
  v6[3] = &unk_1E694B8E0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "notifyWhenServiceIsUnavailable:", v6);

}

+ (id)timeSyncAudioClockDeviceUIDForClockIdentifier:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ATSAC:%016llx"), a3);
}

+ (id)sharedClockManager
{
  _QWORD block[5];

  if (+[_TSF_TSDClockManager sharedClockManager]::onceToken != -1)
    dispatch_once(&+[_TSF_TSDClockManager sharedClockManager]::onceToken, &__block_literal_global_5);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___TSF_TSDClockManager_sharedClockManager__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)_sharedClockManagerQueue, block);
  return (id)_sharedClockManager;
}

+ (id)clockManager
{
  _TSF_TSDClockManager *v2;
  unsigned int v3;

  v2 = objc_alloc_init(_TSF_TSDClockManager);
  if (!v2)
  {
    v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(_TSF_TSDClockManager);
      if (v3 < 2)
        break;
      --v3;
    }
    while (!v2);
  }
  return v2;
}

+ (id)defaultClockPersonalities
{
  id v2;
  objc_class *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17[0] = CFSTR("IOClassName");
  v17[1] = CFSTR("ProbeScore");
  v18[0] = CFSTR("IOTimeSyncService");
  v18[1] = &unk_1E695F280;
  v17[2] = CFSTR("ClassName");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

  v15[0] = CFSTR("IOClassName");
  v15[1] = CFSTR("ProbeScore");
  v16[0] = CFSTR("IOTimeSyncDomain");
  v16[1] = &unk_1E695F298;
  v15[2] = CFSTR("ClassName");
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v8);

  v13[0] = CFSTR("IOClassName");
  v13[1] = CFSTR("ProbeScore");
  v14[0] = CFSTR("IOTimeSyncUserFilteredService");
  v14[1] = &unk_1E695F298;
  v13[2] = CFSTR("ClassName");
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v11);

  return v2;
}

- (_TSF_TSDClockManager)init
{
  return -[_TSF_TSDClockManager initWithPid:](self, "initWithPid:", 0);
}

- (_TSF_TSDClockManager)initWithPid:(int)a3
{
  _TSF_TSDClockManager *v4;
  _TSF_TSDClockManager *v5;
  void *v6;
  void *v7;
  void *v8;
  _TSF_IODConnection *v9;
  _TSF_IODConnection *connection;
  _TSF_TSDKernelClock *v11;
  _TSF_TSDKernelClock *translationClock;
  uint64_t v13;
  void *clockPersonalities;
  NSObject *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)_TSF_TSDClockManager;
  v4 = -[_TSF_TSDClockManager init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_pid = a3;
    mach_timebase_info(&v4->_timebaseInfo);
    v6 = (void *)MEMORY[0x1E0D39F08];
    objc_msgSend(MEMORY[0x1E0D39F08], "serviceMatching:", CFSTR("IOTimeSyncClockManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "matchingService:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = -[_TSF_IODConnection initWithService:andType:]([_TSF_IODConnection alloc], "initWithService:andType:", v8, 42);
      connection = v5->_connection;
      v5->_connection = v9;

      if (v5->_connection)
      {
        -[_TSF_TSDClockManager getTimeSyncTimeClockID:error:](v5, "getTimeSyncTimeClockID:error:", &v5->_timeSyncTimeClockIdentifier, 0);
        v5->_translationClockIdentifier = v5->_timeSyncTimeClockIdentifier + 1;
        -[_TSF_TSDClockManager getTimeSyncTimeIsMachAbsolute:error:](v5, "getTimeSyncTimeIsMachAbsolute:error:", &v5->_timeSyncTimeIsMachAbsoluteTime, 0);
        v11 = -[_TSF_TSDKernelClock initWithClockIdentifier:]([_TSF_TSDKernelClock alloc], "initWithClockIdentifier:", v5->_translationClockIdentifier);
        translationClock = v5->_translationClock;
        v5->_translationClock = v11;

        v13 = objc_msgSend((id)objc_opt_class(), "defaultClockPersonalities");
        clockPersonalities = v5->_clockPersonalities;
        v5->_clockPersonalities = (NSMutableArray *)v13;
LABEL_5:

        return v5;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v19 = "_connection != nil";
        v20 = 2048;
        v21 = 0;
        v22 = 2048;
        v23 = 0;
        v24 = 2080;
        v25 = "";
        v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
        v28 = 1024;
        v29 = 159;
        v16 = MEMORY[0x1E0C81028];
        goto LABEL_11;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v19 = "service != nil";
      v20 = 2048;
      v21 = 0;
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = "";
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
      v28 = 1024;
      v29 = 156;
      v16 = MEMORY[0x1E0C81028];
LABEL_11:
      _os_log_impl(&dword_1B56CB000, v16, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    clockPersonalities = v5;
    v5 = 0;
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)getTimeSyncTimeClockID:(unint64_t *)a3 error:(id *)a4
{
  BOOL v5;
  int v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v7 = 1;
  v20[0] = 0;
  v5 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 0, 0, 0, v20, &v7, a4);
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v9 = "result == YES";
    v10 = 2048;
    v11 = 0;
    v12 = 2048;
    v13 = 0;
    v14 = 2080;
    v15 = "";
    v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    v18 = 1024;
    v19 = 194;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20[0];
  return v5;
}

- (BOOL)getTimeSyncTimeIsMachAbsolute:(BOOL *)a3 error:(id *)a4
{
  BOOL v5;
  int v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v7 = 1;
  v20[0] = 0;
  v5 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 11, 0, 0, v20, &v7, a4);
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v9 = "result == YES";
    v10 = 2048;
    v11 = 0;
    v12 = 2048;
    v13 = 0;
    v14 = 2080;
    v15 = "";
    v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    v18 = 1024;
    v19 = 212;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20[0] != 0;
  return v5;
}

- (BOOL)nextAvailableDynamicClockID:(unint64_t *)a3 error:(id *)a4
{
  BOOL v5;
  int v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v7 = 1;
  v5 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 1, 0, 0, v20, &v7, a4);
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v9 = "result == YES";
    v10 = 2048;
    v11 = 0;
    v12 = 2048;
    v13 = 0;
    v14 = 2080;
    v15 = "";
    v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    v18 = 1024;
    v19 = 230;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20[0];
  return v5;
}

- (BOOL)releaseDynamicClockID:(unint64_t)a3 error:(id *)a4
{
  BOOL v4;
  int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v19[0] = a3;
  v4 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 2, v19, 1, 0, &v6, a4);
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "result == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    v17 = 1024;
    v18 = 248;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (BOOL)addMappingFromClockID:(unint64_t)a3 toCoreAudioClockDomain:(unsigned int *)a4 error:(id *)a5
{
  BOOL v6;
  int v8;
  unint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!a3)
    return 0;
  v8 = 1;
  v6 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 3, &v9, 1, v22, &v8, a5);
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v11 = "result == YES";
    v12 = 2048;
    v13 = 0;
    v14 = 2048;
    v15 = 0;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    v20 = 1024;
    v21 = 263;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a4 = v22[0];
  return v6;
}

- (BOOL)removeMappingFromClockIDToCoreAudioClockDomainForClockID:(unint64_t)a3 error:(id *)a4
{
  BOOL v4;
  int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v19[0] = a3;
  v4 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 4, v19, 1, 0, &v6, a4);
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "result == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    v17 = 1024;
    v18 = 281;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (BOOL)addgPTPServicesWithError:(id *)a3
{
  BOOL v3;
  int v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v3 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 5, 0, 0, 0, &v5, a3);
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v7 = "result == YES";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    v16 = 1024;
    v17 = 293;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)removegPTPServicesWithError:(id *)a3
{
  BOOL v3;
  int v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v3 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 6, 0, 0, 0, &v5, a3);
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v7 = "result == YES";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    v16 = 1024;
    v17 = 305;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)addTSNCaptureServicesWithError:(id *)a3
{
  BOOL v3;
  int v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v3 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 9, 0, 0, 0, &v5, a3);
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v7 = "result == YES";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    v16 = 1024;
    v17 = 317;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)removeTSNCaptureServicesWithError:(id *)a3
{
  BOOL v3;
  int v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v3 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 10, 0, 0, 0, &v5, a3);
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v7 = "result == YES";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    v16 = 1024;
    v17 = 329;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (id)availableClockIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (-[_TSF_TSDClockManager getTimeSyncTimeClockID:error:](self, "getTimeSyncTimeClockID:error:", &v6, 0))
  {
    +[_TSF_TSDKernelClock availableKernelClockIdentifiers](_TSF_TSDKernelClock, "availableKernelClockIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v4);

  }
  return v3;
}

- (id)classNameForClockService:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = self->_clockPersonalities;
    v5 = 0;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v20;
      v8 = -1;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IOClassName"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v4, "conformsToIOClassName:", v11);

          if (v12)
          {
            if (v5)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ProbeScore"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "intValue");

              if (v14 > v8)
              {
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ClassName"));
                v15 = objc_claimAutoreleasedReturnValue();

                v5 = (void *)v15;
                v8 = v14;
              }
            }
            else
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ProbeScore"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v8 = objc_msgSend(v16, "intValue");

              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ClassName"));
              v5 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v25 = "service != nil";
      v26 = 2048;
      v27 = 0;
      v28 = 2048;
      v29 = 0;
      v30 = 2080;
      v31 = "";
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
      v34 = 1024;
      v35 = 358;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v5 = 0;
  }

  return v5;
}

- (id)clockWithClockIdentifier:(unint64_t)a3
{
  __int128 v5;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  void *v17;
  __int128 v18;
  uint8_t buf[4];
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[_TSF_TSDClockManager timeSyncTimeClockIdentifier](self, "timeSyncTimeClockIdentifier") == a3)
    return 0;
  if (-[_TSF_TSDClockManager translationClockIdentifier](self, "translationClockIdentifier") == a3)
  {
    -[_TSF_TSDClockManager translationClock](self, "translationClock");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = 1;
  v8 = MEMORY[0x1E0C81028];
  *(_QWORD *)&v5 = 67109120;
  v18 = v5;
  while (1)
  {
    v9 = (void *)MEMORY[0x1E0D39F08];
    +[_TSF_TSDKernelClock iokitMatchingDictionaryForClockIdentifier:](_TSF_TSDKernelClock, "iokitMatchingDictionaryForClockIdentifier:", a3, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "matchingService:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      break;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v18;
      LODWORD(v20) = v7;
      v14 = v8;
      v15 = "TSDClockManager clockWithClockIdentifier unable to find service retry = %d\n";
      v16 = 8;
      goto LABEL_11;
    }
LABEL_12:
    usleep(0x2710u);

    if (++v7 == 11)
      return 0;
  }
  -[_TSF_TSDClockManager classNameForClockService:](self, "classNameForClockService:", v11);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = a3;
      v14 = v8;
      v15 = "Could not find class match for clock identifier: 0x%016llx\n";
      v16 = 12;
LABEL_11:
      _os_log_impl(&dword_1B56CB000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v17 = (void *)objc_msgSend(objc_alloc(NSClassFromString(v12)), "initWithClockIdentifier:pid:", a3, self->_pid);

  return v17;
}

- (unint64_t)addUserFilteredClockWithMachInterval:(unint64_t)a3 domainInterval:(unint64_t)a4 usingFilterShift:(unsigned __int8)a5 isAdaptive:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v7;
  int v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  unint64_t v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v9 = 1;
  v23[0] = a3;
  v23[1] = a4;
  v23[2] = a5;
  v23[3] = a6;
  v7 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 7, v23, 4, &v22, &v9, a7);
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v11 = "callResult == YES";
    v12 = 2048;
    v13 = 0;
    v14 = 2048;
    v15 = 0;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    v20 = 1024;
    v21 = 450;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v7)
    return v22;
  else
    return -1;
}

- (BOOL)removeUserFilteredClockWithIdentifier:(unint64_t)a3 error:(id *)a4
{
  BOOL v4;
  int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v19[0] = a3;
  v4 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 8, v19, 1, 0, &v6, a4);
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "result == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
    v17 = 1024;
    v18 = 469;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (unint64_t)machAbsoluteTicksToNanoseconds:(unint64_t)a3
{
  uint64_t numer;
  uint64_t v5;
  __int128 v7;
  unint64_t v8[2];

  numer = self->_timebaseInfo.numer;
  if ((_DWORD)numer != self->_timebaseInfo.denom)
  {
    *(_QWORD *)&v7 = IOTS_uint64mul(a3, numer);
    *((_QWORD *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.denom;
    v8[1] = 0;
    return IOTS_U128::operator/(&v7, v8);
  }
  return a3;
}

- (unint64_t)machAbsoluteNanosecondsToTicks:(unint64_t)a3
{
  uint64_t denom;
  uint64_t v5;
  __int128 v7;
  unint64_t v8[2];

  denom = self->_timebaseInfo.denom;
  if (self->_timebaseInfo.numer != (_DWORD)denom)
  {
    *(_QWORD *)&v7 = IOTS_uint64mul(a3, denom);
    *((_QWORD *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.numer;
    v8[1] = 0;
    return IOTS_U128::operator/(&v7, v8);
  }
  return a3;
}

+ (id)diagnosticInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D39F08];
  objc_msgSend(MEMORY[0x1E0D39F08], "serviceMatching:", CFSTR("IOTimeSyncClockManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchingService:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136316418;
      v13 = "service != nil";
      v14 = 2048;
      v15 = 0;
      v16 = 2048;
      v17 = 0;
      v18 = 2080;
      v19 = "";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
      v22 = 1024;
      v23 = 521;
      v11 = MEMORY[0x1E0C81028];
LABEL_9:
      _os_log_impl(&dword_1B56CB000, v11, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v12, 0x3Au);
    }
LABEL_10:
    v5 = 0;
    goto LABEL_4;
  }
  if ((objc_msgSend(v4, "conformsToIOClassName:", CFSTR("IOTimeSyncClockManager")) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136316418;
      v13 = "[service conformsToIOClassName:@kIOTimeSyncClockManagerClass]";
      v14 = 2048;
      v15 = 0;
      v16 = 2048;
      v17 = 0;
      v18 = 2080;
      v19 = "";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
      v22 = 1024;
      v23 = 522;
      v11 = MEMORY[0x1E0C81028];
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ioClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("ClassName"));

  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("TimeSyncTimeClockID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("TimeSyncTimeClockID"));

  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("TranslationClockID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("TranslationClockID"));

  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("TimeSyncTimeCoreAudioClockDomain"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("TimeSyncTimeCoreAudioClockDomain"));

LABEL_4:
  return v5;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 daemonClassName:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  id v12;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D39F08];
  +[_TSF_TSDKernelClock iokitMatchingDictionaryForClockIdentifier:](_TSF_TSDKernelClock, "iokitMatchingDictionaryForClockIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "matchingService:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "sharedClockManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "classNameForClockService:", v8);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[objc_class diagnosticInfoForService:](NSClassFromString(v10), "diagnosticInfoForService:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a4)
        goto LABEL_7;
      goto LABEL_6;
    }
    v11 = 0;
    if (a4)
    {
LABEL_6:
      v10 = objc_retainAutorelease(v10);
      *a4 = v10;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136316418;
      v15 = "service != nil";
      v16 = 2048;
      v17 = 0;
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
      v24 = 1024;
      v25 = 542;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    }
    v10 = 0;
    v11 = 0;
  }
LABEL_7:
  v12 = v11;

  return v12;
}

+ (id)daemonClassNameForClockIdentifier:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D39F08];
  +[_TSF_TSDKernelClock iokitMatchingDictionaryForClockIdentifier:](_TSF_TSDKernelClock, "iokitMatchingDictionaryForClockIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchingService:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "sharedClockManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "classNameForClockService:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316418;
      v11 = "service != nil";
      v12 = 2048;
      v13 = 0;
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDClockManager.mm";
      v20 = 1024;
      v21 = 565;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v10, 0x3Au);
    }
    v8 = 0;
  }

  return v8;
}

- (unint64_t)timeSyncTimeClockIdentifier
{
  return self->_timeSyncTimeClockIdentifier;
}

- (unint64_t)translationClockIdentifier
{
  return self->_translationClockIdentifier;
}

- (BOOL)timeSyncTimeIsMachAbsoluteTime
{
  return self->_timeSyncTimeIsMachAbsoluteTime;
}

- (_TSF_TSDKernelClock)translationClock
{
  return self->_translationClock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationClock, 0);
  objc_storeStrong((id *)&self->_clockPersonalities, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
