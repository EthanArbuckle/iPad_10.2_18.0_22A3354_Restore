@implementation SBApplicationWakeScheduler

- (SBApplicationWakeScheduler)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationWakeScheduler.m"), 32, CFSTR("Init is available for SBApplicationWakeScheduler."));

  return 0;
}

- (id)_initWithLifecycleTracker:(id)a3 forApplication:(id)a4
{
  id v7;
  id v8;
  SBApplicationWakeScheduler *v9;
  id *p_isa;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBApplicationWakeScheduler;
  v9 = -[SBApplicationWakeScheduler init](&v13, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lifecycleTracker, a3);
    objc_storeWeak(p_isa + 2, v8);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", p_isa, sel__applicationProcessStateDidChange_, CFSTR("SBApplicationProcessStateDidChange"), v8);

  }
  return p_isa;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationWakeScheduler.m"), 50, CFSTR("Must be invalidated before deallocating."));

  }
  v5.receiver = self;
  v5.super_class = (Class)SBApplicationWakeScheduler;
  -[SBApplicationWakeScheduler dealloc](&v5, sel_dealloc);
}

- (NSDate)scheduledDate
{
  void *v3;
  void *v4;

  BSDispatchQueueAssertMain();
  -[SBApplicationWakeScheduler wakeTimer](self, "wakeTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationWakeScheduler _expectedFireDateForTimer:](self, "_expectedFireDateForTimer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (void)scheduleWakeForDate:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SBApplicationWakeScheduler *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (v4 && !self->_invalidated)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_application);
    objc_msgSend(WeakRetained, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v18 = v6;
      v19 = 2114;
      v20 = v4;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "SBApplicationWakeScheduler: scheduling wake for %{public}@ at %{public}@.", buf, 0x16u);
    }

    v8 = *MEMORY[0x1E0D01650];
    objc_msgSend(v4, "timeIntervalSinceNow");
    if (v8 < v9)
      v8 = v9;
    v10 = objc_alloc(MEMORY[0x1E0DB0F88]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBApplicationWakeScheduler:%@"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithIdentifier:", v11);

    -[SBApplicationWakeScheduler setWakeTimer:](self, "setWakeTimer:", v12);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__SBApplicationWakeScheduler_scheduleWakeForDate___block_invoke;
    v14[3] = &unk_1E8EB2668;
    v15 = v6;
    v16 = self;
    v13 = v6;
    objc_msgSend(v12, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v14, v8, 1.0);

  }
}

uint64_t __50__SBApplicationWakeScheduler_scheduleWakeForDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "SBApplicationWakeScheduler: wake timer fired for %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setWakeTimer:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "wakeImmediately");
}

- (void)unschedule
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (self->_wakeTimer)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_application);
    objc_msgSend(WeakRetained, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "SBApplicationWakeScheduler: unscheduling wake timer for %{public}@", (uint8_t *)&v6, 0xCu);
    }

    -[SBApplicationWakeScheduler setWakeTimer:](self, "setWakeTimer:", 0);
  }
}

- (void)wakeImmediately
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_application);
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "SBApplicationWakeScheduler: waking %{public}@.", (uint8_t *)&v6, 0xCu);

    }
    -[SBApplicationWakeLifecycleHandling beginWakeForApplication:](self->_lifecycleTracker, "beginWakeForApplication:", WeakRetained);

  }
}

- (void)endResumeIfAwoken
{
  BSDispatchQueueAssertMain();
  -[SBApplicationWakeLifecycleHandling endWake](self->_lifecycleTracker, "endWake");
}

- (void)invalidate
{
  void *v3;

  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

    -[SBApplicationWakeScheduler unschedule](self, "unschedule");
    -[SBApplicationWakeScheduler endResumeIfAwoken](self, "endResumeIfAwoken");
    self->_invalidated = 1;
  }
}

- (void)_forceInvalidate
{
  void *v3;

  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  self->_invalidated = 1;
}

- (void)setWakeTimer:(id)a3
{
  BSTimerScheduleQuerying *v4;
  BSTimerScheduleQuerying *wakeTimer;
  BSTimerScheduleQuerying *v6;

  v4 = (BSTimerScheduleQuerying *)a3;
  wakeTimer = self->_wakeTimer;
  if (wakeTimer != v4)
    -[BSTimerScheduleQuerying invalidate](wakeTimer, "invalidate");
  v6 = self->_wakeTimer;
  self->_wakeTimer = v4;

}

- (id)_expectedFireDateForTimer:(id)a3
{
  void *v3;

  v3 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a3, "timeRemaining");
  return (id)objc_msgSend(v3, "dateWithTimeIntervalSinceNow:");
}

- (void)_applicationProcessStateDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  uint64_t v10;
  BOOL v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "object");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("previousProcessState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "processState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isForeground");
  v9 = objc_msgSend(v7, "isForeground");
  if ((v8 & 1) == 0 && v9)
    -[SBApplicationWakeScheduler endResumeIfAwoken](self, "endResumeIfAwoken");
  v10 = objc_msgSend(v6, "taskState");
  if (v7)
    v11 = objc_msgSend(v7, "taskState") != 1;
  else
    v11 = 0;
  if (v10 != 1 && !v11)
  {
    -[SBApplicationWakeScheduler unschedule](self, "unschedule");
    -[SBApplicationWakeScheduler endResumeIfAwoken](self, "endResumeIfAwoken");
  }

}

- (BSTimerScheduleQuerying)wakeTimer
{
  return self->_wakeTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeTimer, 0);
  objc_destroyWeak((id *)&self->_application);
  objc_storeStrong((id *)&self->_lifecycleTracker, 0);
}

@end
