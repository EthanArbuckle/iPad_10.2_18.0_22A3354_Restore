@implementation RCURLSession

+ (id)sharedForegroundSession
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__RCURLSession_sharedForegroundSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedForegroundSession_onceToken != -1)
    dispatch_once(&sharedForegroundSession_onceToken, block);
  return (id)sharedForegroundSession_s_sharedSession;
}

void __39__RCURLSession_sharedForegroundSession__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_configureURLSessionConfiguration:", v6);
  v2 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v2, "setName:", CFSTR("RCFetchOperation.callbackQueue"));
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMaxConcurrentOperationCount:", objc_msgSend(v3, "processorCount"));

  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v6, 0, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)sharedForegroundSession_s_sharedSession;
  sharedForegroundSession_s_sharedSession = v4;

}

+ (void)_configureURLSessionConfiguration:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  objc_msgSend(v5, "setRequestCachePolicy:", 1);
  objc_msgSend(v5, "setURLCache:", 0);
  objc_msgSend(v5, "setTimeoutIntervalForRequest:", 60.0);
  objc_msgSend(v5, "setTimeoutIntervalForResource:", 240.0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("RCNetworkAttributionBundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", v4);
  objc_msgSend(v5, "set_timingDataOptions:", 1);
  objc_msgSend(v5, "setHTTPMaximumConnectionsPerHost:", 1);
  objc_msgSend(v5, "setHTTPShouldUsePipelining:", 0);

}

+ (id)_sharedSession
{
  if (_sharedSession_onceToken != -1)
    dispatch_once(&_sharedSession_onceToken, &__block_literal_global_2);
  return (id)_sharedSession_s_sharedSession;
}

void __30__RCURLSession__sharedSession__block_invoke()
{
  RCURLSession *v0;
  void *v1;

  v0 = objc_alloc_init(RCURLSession);
  v1 = (void *)_sharedSession_s_sharedSession;
  _sharedSession_s_sharedSession = (uint64_t)v0;

}

- (RCURLSession)init
{
  RCURLSession *v2;
  RCUnfairLock *v3;
  RCUnfairLock *backgroundSessionsLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCURLSession;
  v2 = -[RCURLSession init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(RCUnfairLock);
    backgroundSessionsLock = v2->_backgroundSessionsLock;
    v2->_backgroundSessionsLock = v3;

  }
  return v2;
}

+ (id)backgroundSessionWithIdentifier:(id)a3 sharedContainerIdentifier:(id)a4 timeout:(double)a5 delegateReference:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  RCNetworkOperationURLSessionDelegate *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;

  v10 = a3;
  v11 = a4;
  objc_msgSend(a1, "backgroundSessionsLock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lock");

  +[RCURLSession _sharedSession](RCURLSession, "_sharedSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backgroundSessions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "backgroundSessionsLock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unlock");

  if (v15)
  {
    objc_msgSend(v15, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sharedContainerIdentifier");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18 != v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[RCURLSession backgroundSessionWithIdentifier:sharedContainerIdentifier:timeout:delegateReference:].cold.2();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB39F8], "backgroundSessionConfigurationWithIdentifier:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_configureURLSessionConfiguration:", v19);
    objc_msgSend(v19, "setTimeoutIntervalForResource:", a5);
    objc_msgSend(v19, "setSharedContainerIdentifier:", v11);

    v20 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(v20, "setName:", CFSTR("RCFetchOperation.backgroundFetchCallbackQueue"));
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMaxConcurrentOperationCount:", objc_msgSend(v21, "processorCount"));

    v22 = -[RCNetworkOperationURLSessionDelegate initWithSessionIdentifier:]([RCNetworkOperationURLSessionDelegate alloc], "initWithSessionIdentifier:", v10);
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v19, v22, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "backgroundSessionsLock");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __100__RCURLSession_backgroundSessionWithIdentifier_sharedContainerIdentifier_timeout_delegateReference___block_invoke;
    v29[3] = &unk_1E470DE50;
    v30 = v10;
    v15 = v23;
    v31 = v15;
    objc_msgSend(v24, "performWithLockSync:", v29);

  }
  if (a6)
  {
    objc_msgSend(v15, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[RCURLSession backgroundSessionWithIdentifier:sharedContainerIdentifier:timeout:delegateReference:].cold.1();
    v26 = (objc_class *)objc_opt_class();
    objc_msgSend(v15, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    RCCheckedDynamicCast(v26, (uint64_t)v27);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

void __100__RCURLSession_backgroundSessionWithIdentifier_sharedContainerIdentifier_timeout_delegateReference___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  +[RCURLSession _sharedSession](RCURLSession, "_sharedSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundSessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 32));

}

+ (id)backgroundSessionForFetchConfig:(id)a3 delegateReference:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "sessionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharedContainerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeout");
  v10 = v9;

  objc_msgSend(a1, "backgroundSessionWithIdentifier:sharedContainerIdentifier:timeout:delegateReference:", v7, v8, a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)cancelAllTasksOnBackgroundSessionWithFetchConfig:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  RCSharedLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "sessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1A1FB5000, v7, OS_LOG_TYPE_DEFAULT, "Will cancel all tasks on background URLSession: %{public}@", buf, 0xCu);

  }
  +[RCURLSession backgroundSessionForFetchConfig:delegateReference:](RCURLSession, "backgroundSessionForFetchConfig:delegateReference:", v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__RCURLSession_cancelAllTasksOnBackgroundSessionWithFetchConfig_completion___block_invoke;
  v12[3] = &unk_1E470EA58;
  v13 = v5;
  v14 = v6;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v9, "getAllTasksWithCompletionHandler:", v12);

}

void __76__RCURLSession_cancelAllTasksOnBackgroundSessionWithFetchConfig_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7++), "cancel");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v5);
  }
  RCSharedLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v3, "count");
    objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v17 = v9;
    v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_1A1FB5000, v8, OS_LOG_TYPE_DEFAULT, "Did cancel all tasks (%lu) on background URLSession: %{public}@", buf, 0x16u);

  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(void))(v11 + 16))();

}

+ (id)backgroundSessionsLock
{
  void *v2;
  void *v3;

  +[RCURLSession _sharedSession](RCURLSession, "_sharedSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundSessionsLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSMutableDictionary)backgroundSessions
{
  return self->_backgroundSessions;
}

- (void)setBackgroundSessions:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSessions, a3);
}

- (RCUnfairLock)backgroundSessionsLock
{
  return self->_backgroundSessionsLock;
}

- (void)setBackgroundSessionsLock:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSessionsLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundSessionsLock, 0);
  objc_storeStrong((id *)&self->_backgroundSessions, 0);
}

+ (void)backgroundSessionWithIdentifier:sharedContainerIdentifier:timeout:delegateReference:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"urlSession.delegate", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

+ (void)backgroundSessionWithIdentifier:sharedContainerIdentifier:timeout:delegateReference:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("expected equality between %s and %s"));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"urlSession.configuration.sharedContainerIdentifier", (uint64_t)"sharedContainerIdentifier", 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
