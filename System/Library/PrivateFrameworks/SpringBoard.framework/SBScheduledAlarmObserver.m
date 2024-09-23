@implementation SBScheduledAlarmObserver

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_48 != -1)
    dispatch_once(&sharedInstance_onceToken_48, &__block_literal_global_331);
  return (id)sharedInstance___sharedInstance_24;
}

void __42__SBScheduledAlarmObserver_sharedInstance__block_invoke()
{
  SBScheduledAlarmObserver *v0;
  void *v1;

  v0 = objc_alloc_init(SBScheduledAlarmObserver);
  v1 = (void *)sharedInstance___sharedInstance_24;
  sharedInstance___sharedInstance_24 = (uint64_t)v0;

}

- (SBScheduledAlarmObserver)init
{
  SBScheduledAlarmObserver *v2;
  MTAlarmManager *v3;
  MTAlarmManager *alarmManager;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBScheduledAlarmObserver;
  v2 = -[SBScheduledAlarmObserver init](&v8, sel_init);
  if (v2)
  {
    v3 = (MTAlarmManager *)objc_alloc_init(MEMORY[0x1E0D4FA58]);
    alarmManager = v2->_alarmManager;
    v2->_alarmManager = v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__nextAlarmChanged_, *MEMORY[0x1E0D4F980], v2->_alarmManager);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__nextAlarmChanged_, *MEMORY[0x1E0D4F990], v2->_alarmManager);

    -[SBScheduledAlarmObserver _updateAlarmStatusBarItem](v2, "_updateAlarmStatusBarItem");
  }
  return v2;
}

- (void)_nextAlarmChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  SBScheduledAlarmObserver *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4F988]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogAlarm();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alarmID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = self;
    v14 = 2114;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ recieved %{public}@ notification contains alarmID: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  -[SBScheduledAlarmObserver _updateAlarmStatusBarItem](self, "_updateAlarmStatusBarItem");

}

- (void)_updateAlarmStatusBarItem
{
  void *v3;
  NSObject *v4;
  MTAlarmManager *alarmManager;
  id v6;
  _QWORD v7[5];
  uint8_t buf[4];
  SBScheduledAlarmObserver *v9;
  __int16 v10;
  MTAlarmManager *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MTAlarmManager nextAlarm](self->_alarmManager, "nextAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogAlarm();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    alarmManager = self->_alarmManager;
    *(_DWORD *)buf = 138543874;
    v9 = self;
    v10 = 2114;
    v11 = alarmManager;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ updating alarm status bar item with alarm manager %{public}@ using future: %{public}@", buf, 0x20u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SBScheduledAlarmObserver__updateAlarmStatusBarItem__block_invoke;
  v7[3] = &unk_1E8EBC138;
  v7[4] = self;
  v6 = (id)objc_msgSend(v3, "addCompletionBlock:", v7);

}

void __53__SBScheduledAlarmObserver__updateAlarmStatusBarItem__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SBScheduledAlarmObserver__updateAlarmStatusBarItem__block_invoke_2;
  v6[3] = &unk_1E8E9E820;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __53__SBScheduledAlarmObserver__updateAlarmStatusBarItem__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_opt_class();
  SBSafeCast(v2, *(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogAlarm();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "alarmID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 1024;
    v13 = v3 != 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ nextAlarmFuture completion block called with alarmID %{public}@, Update status bar: alarm=%{BOOL}u", (uint8_t *)&v8, 0x1Cu);

  }
  objc_msgSend((id)SBApp, "statusBarStateAggregator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlarmEnabled:", v3 != 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmManager, 0);
}

@end
