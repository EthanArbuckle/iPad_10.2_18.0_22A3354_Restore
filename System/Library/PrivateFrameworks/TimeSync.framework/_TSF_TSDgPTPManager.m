@implementation _TSF_TSDgPTPManager

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
    objc_msgSend(MEMORY[0x1E0D39F08], "serviceMatching:", CFSTR("IOTimeSyncgPTPManager"));
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
      v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
      v16 = 1024;
      v17 = 54;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
    }
  }
}

+ (void)notifyWhengPTPManagerIsAvailable:(id)a3
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
  v6[2] = __56___TSF_TSDgPTPManager_notifyWhengPTPManagerIsAvailable___block_invoke;
  v6[3] = &unk_1E694B140;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "notifyWhenServiceIsAvailable:", v6);

}

+ (void)notifyWhengPTPManagerIsUnavailable:(id)a3
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
  v6[2] = __58___TSF_TSDgPTPManager_notifyWhengPTPManagerIsUnavailable___block_invoke;
  v6[3] = &unk_1E694B140;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "notifyWhenServiceIsUnavailable:", v6);

}

+ (id)sharedgPTPManager
{
  _QWORD block[5];

  if (sharedgPTPManager_onceToken != -1)
    dispatch_once(&sharedgPTPManager_onceToken, &__block_literal_global_1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40___TSF_TSDgPTPManager_sharedgPTPManager__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)_sharedgPTPManagerQueue, block);
  return (id)_sharedgPTPManager_0;
}

+ (id)sharedgPTPManagerSyncWithTimeout:(unint64_t)a3
{
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  uint8_t v10[8];
  _QWORD v11[4];
  NSObject *v12;

  v5 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56___TSF_TSDgPTPManager_sharedgPTPManagerSyncWithTimeout___block_invoke;
  v11[3] = &unk_1E694AF60;
  v6 = v5;
  v12 = v6;
  objc_msgSend(a1, "notifyWhengPTPManagerIsAvailable:", v11);
  v7 = dispatch_time(0, 1000000 * a3);
  if (dispatch_semaphore_wait(v6, v7))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to find gPTP manager within the timeout period.\n", v10, 2u);
    }
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "sharedgPTPManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)gPTPManager
{
  _TSF_TSDgPTPManager *v2;
  unsigned int v3;

  v2 = objc_alloc_init(_TSF_TSDgPTPManager);
  if (!v2)
  {
    v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(_TSF_TSDgPTPManager);
      if (v3 < 2)
        break;
      --v3;
    }
    while (!v2);
  }
  return v2;
}

- (_TSF_TSDgPTPManager)init
{
  _TSF_TSDgPTPManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  IOKService *service;
  _TSF_IODConnection *v7;
  _TSF_IODConnection *connection;
  _TSF_TSDgPTPManager *v9;
  _TSF_TSDgPTPManager *v10;
  uint64_t v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *systemDomainQueue;
  NSObject *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)_TSF_TSDgPTPManager;
  v2 = -[_TSF_TSDgPTPManager init](&v16, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D39F08];
    objc_msgSend(MEMORY[0x1E0D39F08], "serviceMatching:", CFSTR("IOTimeSyncgPTPManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "matchingService:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    service = v2->_service;
    v2->_service = (IOKService *)v5;

    if (v2->_service)
    {
      v7 = -[_TSF_IODConnection initWithService:andType:]([_TSF_IODConnection alloc], "initWithService:andType:", v2->_service, 42);
      connection = v2->_connection;
      v2->_connection = v7;

      if (v2->_connection)
      {
        -[IOKService iodPropertyForKey:](v2->_service, "iodPropertyForKey:", CFSTR("SystemDomainIdentifier"));
        v9 = (_TSF_TSDgPTPManager *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
          v11 = -[_TSF_TSDgPTPManager unsignedLongLongValue](v9, "unsignedLongLongValue");
        else
          v11 = -1;
        v2->_systemDomainClockIdentifier = v11;
        v12 = dispatch_queue_create("com.apple.TimeSync.TSDgPTPManager.systemDomain", 0);
        systemDomainQueue = v2->_systemDomainQueue;
        v2->_systemDomainQueue = (OS_dispatch_queue *)v12;

        goto LABEL_8;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v18 = "_connection != nil";
        v19 = 2048;
        v20 = 0;
        v21 = 2048;
        v22 = 0;
        v23 = 2080;
        v24 = "";
        v25 = 2080;
        v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
        v27 = 1024;
        v28 = 147;
        v15 = MEMORY[0x1E0C81028];
        goto LABEL_14;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v18 = "_service != nil";
      v19 = 2048;
      v20 = 0;
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
      v27 = 1024;
      v28 = 144;
      v15 = MEMORY[0x1E0C81028];
LABEL_14:
      _os_log_impl(&dword_1B56CB000, v15, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v10 = v2;
    v2 = 0;
LABEL_8:

  }
  return v2;
}

- (_TSF_TSDgPTPClock)systemDomain
{
  NSObject *systemDomainQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  systemDomainQueue = self->_systemDomainQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35___TSF_TSDgPTPManager_systemDomain__block_invoke;
  v5[3] = &unk_1E694AF88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(systemDomainQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (_TSF_TSDgPTPClock *)v3;
}

- (BOOL)addPTPInstance:(unint64_t *)a3 error:(id *)a4
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
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    v18 = 1024;
    v19 = 196;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20[0];
  return v5;
}

- (BOOL)addTimeOfDayPTPInstance:(unint64_t *)a3 error:(id *)a4
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
  v5 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 6, 0, 0, v20, &v7, a4);
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
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    v18 = 1024;
    v19 = 214;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20[0];
  return v5;
}

- (BOOL)removePTPInstanceWithIdentifier:(unint64_t)a3 error:(id *)a4
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
  v4 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 1, v19, 1, 0, &v6, a4);
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
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    v17 = 1024;
    v18 = 237;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (BOOL)addAVBPTPInstanceIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5
{
  BOOL v6;
  int v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  unint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
    return 0;
  v22[0] = a3;
  v8 = 1;
  v6 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 2, v22, 1, &v21, &v8, a5);
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v10 = "result == YES";
    v11 = 2048;
    v12 = 0;
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    v19 = 1024;
    v20 = 258;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a4 = v21;
  return v6;
}

- (BOOL)removeAVBPTPInstanceWithIndex:(unsigned __int16)a3 error:(id *)a4
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
  v4 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 3, v19, 1, 0, &v6, a4);
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
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    v17 = 1024;
    v18 = 281;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (unint64_t)avbPTPInstance0ClockIdentifier
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", CFSTR("AVB0ClockID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (unint64_t)avbPTPInstance1ClockIdentifier
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", CFSTR("AVB1ClockID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (unint64_t)avbPTPInstance2ClockIdentifier
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", CFSTR("AVB2ClockID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (unint64_t)avbPTPInstance3ClockIdentifier
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", CFSTR("AVB3ClockID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (unint64_t)airPlayPTPInstanceClockIdentifier
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", CFSTR("AirPlayClockID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (BOOL)addAirPlayPTPInstance:(unint64_t *)a3 error:(id *)a4
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
  v5 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 4, 0, 0, v20, &v7, a4);
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
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    v18 = 1024;
    v19 = 361;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20[0];
  return v5;
}

- (BOOL)removeAirPlayPTPInstanceWithError:(id *)a3
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
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    v16 = 1024;
    v17 = 376;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (unint64_t)copresencePTPInstanceClockIdentifier
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IOKService iodPropertyForKey:](self->_service, "iodPropertyForKey:", CFSTR("CopresenceClockID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (BOOL)addCopresencePTPInstance:(unint64_t *)a3 error:(id *)a4
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
  v5 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 7, 0, 0, v20, &v7, a4);
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
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    v18 = 1024;
    v19 = 404;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20[0];
  return v5;
}

- (BOOL)removeCopresencePTPInstanceWithError:(id *)a3
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
  v3 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 8, 0, 0, 0, &v5, a3);
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
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    v16 = 1024;
    v17 = 419;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)logInterfaceStatisticsWithError:(id *)a3
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
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
    v16 = 1024;
    v17 = 431;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[_TSF_TSDClockManager sharedClockManager](_TSF_TSDClockManager, "sharedClockManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removegPTPServicesWithError:", 0);

  v4.receiver = self;
  v4.super_class = (Class)_TSF_TSDgPTPManager;
  -[_TSF_TSDgPTPManager dealloc](&v4, sel_dealloc);
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D39F08];
  objc_msgSend(MEMORY[0x1E0D39F08], "serviceMatching:", CFSTR("IOTimeSyncgPTPManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchingService:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v22 = "service != nil";
      v23 = 2048;
      v24 = 0;
      v25 = 2048;
      v26 = 0;
      v27 = 2080;
      v28 = "";
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
      v31 = 1024;
      v32 = 446;
      v18 = MEMORY[0x1E0C81028];
LABEL_25:
      _os_log_impl(&dword_1B56CB000, v18, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_26:
    v5 = 0;
    goto LABEL_20;
  }
  if ((objc_msgSend(v4, "conformsToIOClassName:", CFSTR("IOTimeSyncgPTPManager")) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v22 = "[service conformsToIOClassName:@kIOTimeSyncgPTPManagerClass]";
      v23 = 2048;
      v24 = 0;
      v25 = 2048;
      v26 = 0;
      v27 = 2080;
      v28 = "";
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPManager.m";
      v31 = 1024;
      v32 = 447;
      v18 = MEMORY[0x1E0C81028];
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ioClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("ClassName"));

  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("SystemDomainIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("SystemDomainIdentifier"));
  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("AVB0ClockID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("AVB0ClockID"));
  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("AVB1ClockID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("AVB1ClockID"));
  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("AVB2ClockID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("AVB2ClockID"));
  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("AVB3ClockID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("AVB3ClockID"));
  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("AirPlayClockID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("AirPlayClockID"));
  objc_msgSend(v4, "iodPropertyForKey:", CFSTR("CopresenceClockID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("CopresenceClockID"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "childIteratorInServicePlaneWithError:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __37___TSF_TSDgPTPManager_diagnosticInfo__block_invoke;
  v19[3] = &unk_1E694B188;
  v16 = v14;
  v20 = v16;
  objc_msgSend(v15, "enumerateWithBlock:", v19);
  if (objc_msgSend(v16, "count"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("PTPInstances"));

LABEL_20:
  return v5;
}

- (unint64_t)systemDomainClockIdentifier
{
  return self->_systemDomainClockIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemDomainQueue, 0);
  objc_storeStrong((id *)&self->_systemDomain, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
