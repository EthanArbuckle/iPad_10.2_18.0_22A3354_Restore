@implementation HDSPSleepSessionManager

- (HDSPSleepSessionManager)initWithEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HDSPSleepSessionManager *v7;

  v4 = a3;
  objc_msgSend(v4, "healthStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepHealthStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDSPSleepSessionManager initWithEnvironment:persistence:](self, "initWithEnvironment:persistence:", v4, v6);

  return v7;
}

- (HDSPSleepSessionManager)initWithEnvironment:(id)a3 persistence:(id)a4
{
  id v6;
  id v7;
  HDSPSleepSessionManager *v8;
  HDSPSleepSessionManager *v9;
  void *v10;
  uint64_t v11;
  HDSPDeviceUnlockMonitor *deviceUnlockManager;
  uint64_t v13;
  HKSPFileManager *fileManager;
  HDSPSleepSessionManager *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDSPSleepSessionManager;
  v8 = -[HDSPSleepSessionManager init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_sessionLock._os_unfair_lock_opaque = 0;
    objc_msgSend(v6, "systemMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceUnlockMonitor");
    v11 = objc_claimAutoreleasedReturnValue();
    deviceUnlockManager = v9->_deviceUnlockManager;
    v9->_deviceUnlockManager = (HDSPDeviceUnlockMonitor *)v11;

    objc_msgSend(v6, "fileManager");
    v13 = objc_claimAutoreleasedReturnValue();
    fileManager = v9->_fileManager;
    v9->_fileManager = (HKSPFileManager *)v13;

    objc_storeStrong((id *)&v9->_persistence, a4);
    v15 = v9;
  }

  return v9;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_sessionLock;
  void (**v4)(_QWORD);

  p_sessionLock = &self->_sessionLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_sessionLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_sessionLock);
}

- (void)startSession
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] starting session", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPSleepSessionPersistence hdsp_startSession](self->_persistence, "hdsp_startSession");
}

- (void)stopSession
{
  NSObject *v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = (id)objc_opt_class();
    v4 = v9;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopping session", (uint8_t *)&v8, 0xCu);

  }
  -[HDSPSleepSessionPersistence hdsp_stopSession](self->_persistence, "hdsp_stopSession");
  -[HDSPSleepSessionManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[HDSPSleepSessionManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sleepSessionManagerDidFinishSession:", self);

  }
}

- (void)savePendingSessions
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __46__HDSPSleepSessionManager_savePendingSessions__block_invoke;
  v2[3] = &unk_24D4E3498;
  v2[4] = self;
  -[HDSPSleepSessionManager _withLock:](self, "_withLock:", v2);
}

void __46__HDSPSleepSessionManager_savePendingSessions__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  id v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_hasUnprocessedSessions");
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v14 = 138543362;
      v15 = (id)objc_opt_class();
      v5 = v15;
      _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] there are unprocessed sessions to save", (uint8_t *)&v14, 0xCu);

    }
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "hasBeenUnlockedSinceBoot");
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        v9 = (void *)objc_opt_class();
        v14 = 138543362;
        v15 = v9;
        v10 = v9;
        _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] can write session data", (uint8_t *)&v14, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "_locked_savePendingSessions");
    }
    else
    {
      if (v8)
      {
        v12 = (void *)objc_opt_class();
        v14 = 138543362;
        v15 = v12;
        v13 = v12;
        _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] can't write sessions until first unlock", (uint8_t *)&v14, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "_waitForFirstUnlock");
    }
  }
  else
  {
    if (v4)
    {
      v14 = 138543362;
      v15 = (id)objc_opt_class();
      v11 = v15;
      _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] no unprocessed sessions to save", (uint8_t *)&v14, 0xCu);

    }
  }
}

- (BOOL)_hasUnprocessedSessions
{
  return -[HKSPFileManager hkspFileWithNameExistsInCache:](self->_fileManager, "hkspFileWithNameExistsInCache:", CFSTR("SleepSessions.data"));
}

- (void)_waitForFirstUnlock
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] waiting for first unlock", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPDeviceUnlockMonitor addObserver:](self->_deviceUnlockManager, "addObserver:", self);
}

- (void)_locked_savePendingSessions
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HDSPSleepSessionManager _unprocessedSessions](self, "_unprocessedSessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    *(_DWORD *)buf = 138543618;
    v14 = v5;
    v15 = 2048;
    v16 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] %ld unprocessed sessions", buf, 0x16u);

  }
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__HDSPSleepSessionManager__locked_savePendingSessions__block_invoke;
  v12[3] = &unk_24D4E3DD8;
  v12[4] = self;
  objc_msgSend(v3, "na_map:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B608], "combineAllFutures:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __54__HDSPSleepSessionManager__locked_savePendingSessions__block_invoke_2;
  v11[3] = &unk_24D4E3E28;
  v11[4] = self;
  v10 = (id)objc_msgSend(v9, "addSuccessBlock:", v11);

}

id __54__HDSPSleepSessionManager__locked_savePendingSessions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (objc_msgSend(v3, "requiresFirstUnlock")
    && (objc_msgSend(*(id *)(a1 + 32), "delegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sleepSessionManager:requestsProcessedSessionForSession:", *(_QWORD *)(a1 + 32), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __54__HDSPSleepSessionManager__locked_savePendingSessions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    *(_DWORD *)buf = 138543618;
    v17 = v5;
    v18 = 2048;
    v19 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] %ld processed sessions", buf, 0x16u);

  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "hdsp_persistSessions:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __54__HDSPSleepSessionManager__locked_savePendingSessions__block_invoke_193;
    v12[3] = &unk_24D4E3E00;
    v9 = *(_QWORD *)(a1 + 32);
    v13 = v7;
    v14 = v9;
    v15 = v3;
    v10 = v7;
    v11 = (id)objc_msgSend(v8, "addCompletionBlock:", v12);

  }
}

uint64_t __54__HDSPSleepSessionManager__locked_savePendingSessions__block_invoke_193(uint64_t a1)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "sleepSessionManager:didSaveArchivedSessions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "removeSessionDataFile");
}

- (id)_unprocessedSessions
{
  void *v3;
  void *v4;
  __CFString *v5;
  NSObject *v6;
  void *v7;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  const __CFString *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  if (!-[HDSPSleepSessionManager _hasUnprocessedSessions](self, "_hasUnprocessedSessions")
    || !-[HDSPSleepSessionManager _hasUnprocessedSessions](self, "_hasUnprocessedSessions"))
  {
    return 0;
  }
  -[HKSPFileManager hkspDataForCacheFileWithName:](self->_fileManager, "hkspDataForCacheFileWithName:", CFSTR("SleepSessions.data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v16 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v3, &v16);
    v5 = (__CFString *)v16;
    if (v5)
    {
      HKSPLogForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v18 = v13;
        v19 = 2114;
        v20 = v5;
        v14 = v13;
        _os_log_error_impl(&dword_21610C000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] unarchiving failed with error %{public}@", buf, 0x16u);

      }
      -[HDSPSleepSessionManager removeSessionDataFile](self, "removeSessionDataFile");
      v7 = 0;
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDBCF20];
      v21[0] = objc_opt_class();
      v21[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("HDSPUnprocessedSessions"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "finishDecoding");
    }

  }
  else
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v18 = (id)objc_opt_class();
      v19 = 2114;
      v20 = CFSTR("SleepSessions.data");
      v15 = v18;
      _os_log_error_impl(&dword_21610C000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] no data found in file %{public}@", buf, 0x16u);

    }
    -[HDSPSleepSessionManager removeSessionDataFile](self, "removeSessionDataFile");
    v7 = 0;
  }

  return v7;
}

- (void)archiveSession:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HKSPFileManager *fileManager;
  char v14;
  __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  if (v4)
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = (id)objc_opt_class();
      v24 = 2114;
      v25 = v4;
      v6 = v23;
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] archiveSession: %{public}@", buf, 0x16u);

    }
    -[HDSPSleepSessionManager _unprocessedSessions](self, "_unprocessedSessions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = (id)objc_msgSend(v7, "mutableCopy");
    else
      v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v10 = v9;
    objc_msgSend(v9, "addObject:", v4);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("HDSPUnprocessedSessions"));
    objc_msgSend(v11, "finishEncoding");
    objc_msgSend(v11, "encodedData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fileManager = self->_fileManager;
    v21 = 0;
    v14 = -[HKSPFileManager hkspWriteData:toCacheFileWithName:error:](fileManager, "hkspWriteData:toCacheFileWithName:error:", v12, CFSTR("SleepSessions.data"), &v21);
    v15 = (__CFString *)v21;
    HKSPLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if ((v14 & 1) != 0)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v23 = v18;
        v24 = 2114;
        v25 = v15;
        v19 = v18;
        _os_log_error_impl(&dword_21610C000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] failed to write sessions file with error %{public}@", buf, 0x16u);
LABEL_12:

      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v23 = v20;
      v24 = 2114;
      v25 = CFSTR("SleepSessions.data");
      v19 = v20;
      _os_log_impl(&dword_21610C000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] wrote sessions to file %{public}@", buf, 0x16u);
      goto LABEL_12;
    }

  }
}

- (id)saveSession:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v28[5];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v30 = (id)objc_opt_class();
    v31 = 2114;
    v32 = v4;
    v6 = v30;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] saveSession %{public}@", buf, 0x16u);

  }
  objc_msgSend(v4, "sleepIntervals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {

  }
  else
  {
    v8 = objc_msgSend(v4, "requiresFirstUnlock");

    if ((v8 & 1) == 0)
    {
      HKSPLogForCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v30 = v24;
        v25 = v24;
        _os_log_impl(&dword_21610C000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] session has nothing to write", buf, 0xCu);

      }
      -[HDSPSleepSessionManager delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sleepSessionManager:didSaveSession:", self, v4);

      goto LABEL_22;
    }
  }
  if (!-[HDSPDeviceUnlockMonitor hasBeenUnlockedSinceBoot](self->_deviceUnlockManager, "hasBeenUnlockedSinceBoot"))
  {
    HKSPLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v30 = v17;
      v18 = v17;
      _os_log_impl(&dword_21610C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] archiving session for now", buf, 0xCu);

    }
    -[HDSPSleepSessionManager archiveSession:](self, "archiveSession:", v4);
    -[HDSPSleepSessionManager _waitForFirstUnlock](self, "_waitForFirstUnlock");
LABEL_22:
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (objc_msgSend(v4, "requiresFirstUnlock")
    && (-[HDSPSleepSessionManager delegate](self, "delegate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_opt_respondsToSelector(),
        v9,
        (v10 & 1) != 0))
  {
    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v30 = v12;
      v13 = v12;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] session needs additional processing", buf, 0xCu);

    }
    -[HDSPSleepSessionManager delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sleepSessionManager:requestsProcessedSessionForSession:", self, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HKSPLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      v21 = v20;
      _os_log_impl(&dword_21610C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] session is ready to write", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __39__HDSPSleepSessionManager_saveSession___block_invoke;
  v28[3] = &unk_24D4E3E78;
  v28[4] = self;
  objc_msgSend(v15, "flatMap:", v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  return v22;
}

id __39__HDSPSleepSessionManager_saveSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = (id)objc_opt_class();
    v17 = 2114;
    v18 = v3;
    v5 = v16;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] saving processed session %{public}@", buf, 0x16u);

  }
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v14 = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hdsp_persistSessions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __39__HDSPSleepSessionManager_saveSession___block_invoke_204;
  v12[3] = &unk_24D4E3E50;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v3;
  v9 = v3;
  objc_msgSend(v8, "addSuccessBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __39__HDSPSleepSessionManager_saveSession___block_invoke_204(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepSessionManager:didSaveSession:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)removeSessionDataFile
{
  HKSPFileManager *fileManager;
  char v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  fileManager = self->_fileManager;
  v8 = 0;
  v3 = -[HKSPFileManager hkspRemoveFileWithNameFromCache:error:](fileManager, "hkspRemoveFileWithNameFromCache:error:", CFSTR("SleepSessions.data"), &v8);
  v4 = v8;
  if ((v3 & 1) == 0)
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v4;
      v7 = v6;
      _os_log_error_impl(&dword_21610C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] failed to remove session data file error %{public}@", buf, 0x16u);

    }
  }

}

- (void)deviceHasBeenUnlocked
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] deviceHasBeenUnlocked", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPDeviceUnlockMonitor removeObserver:](self->_deviceUnlockManager, "removeObserver:", self);
  -[HDSPSleepSessionManager savePendingSessions](self, "savePendingSessions");
}

- (void)sleepTracker:(id)a3 didEndSession:(id)a4 reason:(unint64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v15 = (id)objc_opt_class();
    v16 = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v7;
    v10 = v15;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] saving session %{public}@ from %{public}@", buf, 0x20u);

  }
  -[HDSPSleepSessionManager saveSession:](self, "saveSession:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__HDSPSleepSessionManager_sleepTracker_didEndSession_reason___block_invoke;
  v13[3] = &unk_24D4E3EA0;
  v13[4] = self;
  v12 = (id)objc_msgSend(v11, "addCompletionBlock:", v13);

}

uint64_t __61__HDSPSleepSessionManager_sleepTracker_didEndSession_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopSession");
}

- (HDSPSleepSessionManagerDelegate)delegate
{
  return (HDSPSleepSessionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HDSPSleepSessionPersistence)persistence
{
  return self->_persistence;
}

- (HDSPDeviceUnlockMonitor)deviceUnlockManager
{
  return self->_deviceUnlockManager;
}

- (HKSPFileManager)fileManager
{
  return self->_fileManager;
}

- (os_unfair_lock_s)sessionLock
{
  return self->_sessionLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_deviceUnlockManager, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
