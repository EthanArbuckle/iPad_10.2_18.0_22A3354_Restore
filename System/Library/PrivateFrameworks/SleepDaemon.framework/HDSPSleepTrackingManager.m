@implementation HDSPSleepTrackingManager

- (HDSPSleepTrackingManager)initWithEnvironment:(id)a3
{
  id v4;
  HDSPSleepSessionManager *v5;
  void *v6;
  HDSPSleepTrackingManager *v7;

  v4 = a3;
  v5 = -[HDSPSleepSessionManager initWithEnvironment:]([HDSPSleepSessionManager alloc], "initWithEnvironment:", v4);
  objc_msgSend((id)objc_opt_class(), "platformSpecificTrackerWithEnvironment:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDSPSleepTrackingManager initWithEnvironment:sleepSessionManager:sleepTracker:](self, "initWithEnvironment:sleepSessionManager:sleepTracker:", v4, v5, v6);

  return v7;
}

+ (id)platformSpecificTrackerWithEnvironment:(id)a3
{
  id v3;
  void *v4;
  HDSPTimeInBedTracker *v5;

  v3 = a3;
  objc_msgSend(v3, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isAppleWatch") & 1) != 0)
    v5 = 0;
  else
    v5 = -[HDSPTimeInBedTracker initWithEnvironment:]([HDSPTimeInBedTracker alloc], "initWithEnvironment:", v3);

  return v5;
}

- (HDSPSleepTrackingManager)initWithEnvironment:(id)a3 sleepSessionManager:(id)a4 sleepTracker:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDSPSleepTrackingManager *v11;
  HDSPSleepTrackingManager *v12;
  id v13;
  void *v14;
  uint64_t v15;
  HKSPObserverSet *sleepSessionObservers;
  HDSPSleepTrackingManager *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDSPSleepTrackingManager;
  v11 = -[HDSPSleepTrackingManager init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_environment, v8);
    objc_storeStrong((id *)&v12->_sleepSessionManager, a4);
    -[HDSPSleepSessionManager setDelegate:](v12->_sleepSessionManager, "setDelegate:", v12);
    objc_storeStrong((id *)&v12->_sleepTracker, a5);
    -[HDSPSleepTracker setDelegate:](v12->_sleepTracker, "setDelegate:", v12->_sleepSessionManager);
    v13 = objc_alloc(MEMORY[0x24BEA98C8]);
    objc_msgSend(v8, "defaultCallbackScheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithCallbackScheduler:", v14);
    sleepSessionObservers = v12->_sleepSessionObservers;
    v12->_sleepSessionObservers = (HKSPObserverSet *)v15;

    v17 = v12;
  }

  return v12;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[HDSPSleepTracker environmentWillBecomeReady:](self->_sleepTracker, "environmentWillBecomeReady:", v4);

}

- (void)environmentDidBecomeReady:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[HDSPSleepTracker environmentDidBecomeReady:](self->_sleepTracker, "environmentDidBecomeReady:", v4);
  -[HDSPSleepSessionManager savePendingSessions](self->_sleepSessionManager, "savePendingSessions");

}

- (void)addObserver:(id)a3
{
  -[HKSPObserverSet addObserver:](self->_sleepSessionObservers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[HKSPObserverSet removeObserver:](self->_sleepSessionObservers, "removeObserver:", a3);
}

- (void)sleepSessionManager:(id)a3 didSaveSession:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  HKSPObserverSet *sleepSessionObservers;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2114;
    v15 = v5;
    v7 = v13;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didSaveSession %{public}@", buf, 0x16u);

  }
  sleepSessionObservers = self->_sleepSessionObservers;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__HDSPSleepTrackingManager_sleepSessionManager_didSaveSession___block_invoke;
  v10[3] = &unk_24D4E3D88;
  v11 = v5;
  v9 = v5;
  -[HKSPObserverSet enumerateObserversWithBlock:](sleepSessionObservers, "enumerateObserversWithBlock:", v10);

}

uint64_t __63__HDSPSleepTrackingManager_sleepSessionManager_didSaveSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sleepSessionSaved:", *(_QWORD *)(a1 + 32));
}

- (void)sleepSessionManager:(id)a3 didSaveArchivedSessions:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  HKSPObserverSet *sleepSessionObservers;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2114;
    v15 = v5;
    v7 = v13;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didSaveArchivedSessions %{public}@", buf, 0x16u);

  }
  sleepSessionObservers = self->_sleepSessionObservers;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__HDSPSleepTrackingManager_sleepSessionManager_didSaveArchivedSessions___block_invoke;
  v10[3] = &unk_24D4E3D88;
  v11 = v5;
  v9 = v5;
  -[HKSPObserverSet enumerateObserversWithBlock:](sleepSessionObservers, "enumerateObserversWithBlock:", v10);

}

void __72__HDSPSleepTrackingManager_sleepSessionManager_didSaveArchivedSessions___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "archivedSleepSessionsSaved:", *(_QWORD *)(a1 + 32));

}

- (id)sleepSessionManager:(id)a3 requestsProcessedSessionForSession:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = (id)objc_opt_class();
    v12 = 2114;
    v13 = v5;
    v7 = v11;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] requestsProcessedSessionForSession %{public}@", (uint8_t *)&v10, 0x16u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[HDSPSleepTracker processedSessionForSession:](self->_sleepTracker, "processedSessionForSession:", v5);
  else
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)sleepSessionManagerDidFinishSession:(id)a3
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v5 = v7;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepSessionManagerDidFinishSession", (uint8_t *)&v6, 0xCu);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[HDSPSleepTracker previousSessionFinished](self->_sleepTracker, "previousSessionFinished");
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HKSPObserverSet)sleepSessionObservers
{
  return self->_sleepSessionObservers;
}

- (HDSPSleepSessionManager)sleepSessionManager
{
  return self->_sleepSessionManager;
}

- (HDSPSleepTracker)sleepTracker
{
  return self->_sleepTracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepTracker, 0);
  objc_storeStrong((id *)&self->_sleepSessionManager, 0);
  objc_storeStrong((id *)&self->_sleepSessionObservers, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
