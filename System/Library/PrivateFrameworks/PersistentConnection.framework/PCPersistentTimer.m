@implementation PCPersistentTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logObject, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_simpleTimer, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

- (void)scheduleInRunLoop:(id)a3 inMode:(id)a4
{
  id v7;
  id v8;
  PCPersistentTimer *v9;
  id WeakRetained;
  PCSimpleTimer *simpleTimer;
  PCSimpleTimer *v12;
  PCSimpleTimer *v13;
  NSObject *logObject;
  PCSimpleTimer *v15;
  unint64_t guidancePriority;
  double fireTime;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  PCPersistentTimer *v24;
  __int16 v25;
  PCSimpleTimer *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PCPersistentTimer.m"), 173, CFSTR("%@ run loop mode cannot be nil"), objc_opt_class());

  }
  WeakRetained = objc_loadWeakRetained(&v9->_target);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PCPersistentTimer.m"), 174, CFSTR("Cannot schedule invalidated %@"), objc_opt_class());

  }
  simpleTimer = v9->_simpleTimer;
  if (!simpleTimer)
  {
    v9->_startTime = CFAbsoluteTimeGetCurrent();
    v12 = -[PCSimpleTimer initWithAbsoluteTime:serviceIdentifier:target:selector:userInfo:triggerOnGMTChange:]([PCSimpleTimer alloc], "initWithAbsoluteTime:serviceIdentifier:target:selector:userInfo:triggerOnGMTChange:", v9->_serviceIdentifier, v9, sel__fireTimerFired, 0, v9->_triggerOnGMTChange, v9->_fireTime);
    v13 = v9->_simpleTimer;
    v9->_simpleTimer = v12;

    -[PCSimpleTimer setDisableSystemWaking:](v9->_simpleTimer, "setDisableSystemWaking:", v9->_disableSystemWaking);
    -[PCSimpleTimer setUserVisible:](v9->_simpleTimer, "setUserVisible:", v9->_userVisible);
    logObject = v9->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v9->_simpleTimer;
      *(_DWORD *)buf = 138543618;
      v24 = v9;
      v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@ created %{public}@", buf, 0x16u);
    }
    simpleTimer = v9->_simpleTimer;
  }
  guidancePriority = v9->_guidancePriority;
  fireTime = v9->_fireTime;
  -[PCSimpleTimer scheduleInRunLoop:inMode:](simpleTimer, "scheduleInRunLoop:inMode:", v7, v8);
  +[PCPersistentInterfaceManager sharedInstance](PCPersistentInterfaceManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PCPersistentTimer _backgroundUpdateQueue](PCPersistentTimer, "_backgroundUpdateQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addDelegate:queue:", v9, v19);

  objc_msgSend(MEMORY[0x1E0D13208], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addDelegate:", v9);

  -[PCPersistentTimer _updateTimers](v9, "_updateTimers");
  objc_sync_exit(v9);

  if (guidancePriority != -1)
    +[PCPersistentTimer _updateTime:forGuidancePriority:](PCPersistentTimer, "_updateTime:forGuidancePriority:", guidancePriority, fireTime);

}

- (void)_updateTimers
{
  if (self->_simpleTimer)
  {
    -[PCPersistentTimer _earlyFireTime](self, "_earlyFireTime");
    -[PCSimpleTimer updateFireTime:triggerOnGMTChange:](self->_simpleTimer, "updateFireTime:triggerOnGMTChange:", self->_triggerOnGMTChange);
  }
}

- (double)_earlyFireTime
{
  double v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  NSObject *logObject;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  int v15;
  int v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  NSObject *v21;
  NSObject *v22;
  PCPersistentTimer *v23;
  void *v24;
  int v25;
  NSObject *v26;
  _BOOL4 v27;
  const char *v28;
  double v29;
  double v30;
  double startTime;
  double v32;
  double v33;
  double v36;
  double minimumEarlyFireProportion;
  double v38;
  double earlyFireConstantInterval;
  double v40;
  NSObject *v41;
  double v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  PCPersistentTimer *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  __CFString *v52;
  void *v53;
  __CFString *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  double v58;
  const char *v59;
  const char *v60;
  double v61;
  void *v63;
  uint8_t buf[4];
  PCPersistentTimer *v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  double v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  double v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  double v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (self->_fireTime - self->_startTime >= 0.0)
    v3 = self->_fireTime - self->_startTime;
  else
    v3 = 0.0;
  +[PCPersistentInterfaceManager sharedInstance](PCPersistentInterfaceManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPowerStateDetectionSupported");
  v6 = objc_msgSend(v4, "isWWANInterfaceUp");
  v7 = objc_msgSend(v4, "isInternetReachable");
  v8 = v7;
  if (v5)
    v9 = v6 | v7 ^ 1;
  else
    v9 = 0;
  logObject = self->_logObject;
  if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (v9)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    *(_DWORD *)buf = 138544386;
    v65 = self;
    if (v5)
      *(double *)&v13 = COERCE_DOUBLE(CFSTR("YES"));
    else
      *(double *)&v13 = COERCE_DOUBLE(CFSTR("NO"));
    v67 = v12;
    v68 = 2112;
    if (v6)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v66 = 2114;
    v69 = *(double *)&v13;
    if (v8)
      v11 = CFSTR("YES");
    v70 = 2114;
    v71 = v14;
    v72 = 2114;
    v73 = (uint64_t)v11;
    _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@ calculating _earlyFireDate. powerStateDetectionSupported = %{public}@ = (detectionSupported(%@) && (wwanIsUp(%{public}@) || ! internetReachable(%{public}@)))", buf, 0x34u);
  }
  if ((v9 & 1) != 0)
  {
    v15 = objc_msgSend(v4, "isWWANInterfaceInProlongedHighPowerState");
    v16 = objc_msgSend(v4, "isInCall");
    v17 = 0.9;
    if (v15 && !v16)
    {
      v17 = 0.54;
      goto LABEL_31;
    }
  }
  else
  {
    objc_msgSend(v4, "isInCall");
    v15 = 0;
    v17 = 0.62;
  }
  if (self->_minimumEarlyFireProportion < 1.0)
  {
    +[PCPersistentTimer lastSystemWakeDate](PCPersistentTimer, "lastSystemWakeDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "timeIntervalSinceNow");
      if (v3 * 0.5 < -v20)
      {
        v21 = self->_logObject;
        v17 = 1.0;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v21;
          PCStringFromDate(v19);
          v23 = (PCPersistentTimer *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v65 = v23;
          _os_log_impl(&dword_1CBC1B000, v22, OS_LOG_TYPE_DEFAULT, "Last system wake date (%{public}@) was longer than half of the timer duration, so setting minimum fire date to fire date.", buf, 0xCu);

        }
      }
    }

  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0D13208], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isExternalPowerConnected");

  v26 = self->_logObject;
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    v17 = 1.0;
    if (!v27)
      goto LABEL_37;
    *(_DWORD *)buf = 138543362;
    v65 = self;
    v28 = "%{public}@ Device is plugged in, overriding earlyFireProportion to be 1.0";
  }
  else
  {
    if (!v27)
      goto LABEL_37;
    *(_DWORD *)buf = 138543362;
    v65 = self;
    v28 = "%{public}@ device is not plugged in.";
  }
  _os_log_impl(&dword_1CBC1B000, v26, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
LABEL_37:
  -[PCPersistentTimer _nextForcedAlignmentAbsoluteTime](self, "_nextForcedAlignmentAbsoluteTime");
  v30 = v29;
  startTime = self->_startTime;
  v32 = (v30 - startTime) / v3;
  v33 = fabs(v32);
  if (v17 < v32 || v33 == INFINITY)
    v36 = v17;
  else
    v36 = (v30 - startTime) / v3;
  if (v36 >= self->_minimumEarlyFireProportion)
    minimumEarlyFireProportion = v36;
  else
    minimumEarlyFireProportion = self->_minimumEarlyFireProportion;
  v38 = startTime + minimumEarlyFireProportion * v3;
  earlyFireConstantInterval = self->_earlyFireConstantInterval;
  if (earlyFireConstantInterval > 0.0)
  {
    v40 = startTime + earlyFireConstantInterval;
    if (v40 < v38)
      v38 = v40;
    v41 = self->_logObject;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = self->_earlyFireConstantInterval;
      *(_DWORD *)buf = 134217984;
      v65 = *(PCPersistentTimer **)&v42;
      _os_log_impl(&dword_1CBC1B000, v41, OS_LOG_TYPE_DEFAULT, "Ignore early fire proportion. {earlyFireConstantInterval: %f}", buf, 0xCu);
    }
  }
  if (v32 == minimumEarlyFireProportion)
  {
    v43 = self->_logObject;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = (void *)MEMORY[0x1E0C99D68];
      v45 = v43;
      objc_msgSend(v44, "dateWithTimeIntervalSinceReferenceDate:", v30);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      PCStringFromDate(v46);
      v47 = (PCPersistentTimer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v47;
      _os_log_impl(&dword_1CBC1B000, v45, OS_LOG_TYPE_DEFAULT, "Forcing timer alignment to fire date [%{public}@]", buf, 0xCu);

    }
  }
  v48 = self->_logObject;
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v49 = (void *)MEMORY[0x1E0C99D68];
    v50 = v48;
    objc_msgSend(v49, "dateWithTimeIntervalSinceReferenceDate:", v38);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    PCStringFromDate(v51);
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_fireTime);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    PCStringFromDate(v53);
    v63 = v4;
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_startTime);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    PCStringFromDate(v55);
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)v56;
    v58 = self->_minimumEarlyFireProportion;
    v59 = "no";
    if (v9)
      v60 = "yes";
    else
      v60 = "no";
    v61 = self->_earlyFireConstantInterval;
    *(_DWORD *)buf = 138545410;
    v65 = self;
    if (v15)
      v59 = "yes";
    v66 = 2114;
    v67 = v52;
    v68 = 2048;
    v69 = minimumEarlyFireProportion * 100.0;
    v70 = 2114;
    v71 = v54;
    v72 = 2114;
    v73 = v56;
    v74 = 2048;
    v75 = v58;
    v76 = 2082;
    v77 = v60;
    v78 = 2082;
    v79 = v59;
    v80 = 2048;
    v81 = v61;
    _os_log_impl(&dword_1CBC1B000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ Calculated minimum fire date [%{public}@] (%g%%) with fire date [%{public}@], start date [%{public}@], minimum early fire proportion %g, power state detection supported: %{public}s, in high power state: %{public}s, early fire constant interval %f", buf, 0x5Cu);

    v4 = v63;
  }

  return v38;
}

- (void)invalidate
{
  PCPersistentTimer *v2;
  id WeakRetained;
  void *v4;
  NSObject *logObject;
  OS_dispatch_queue *queue;
  PCSimpleTimer *simpleTimer;
  void *v8;
  void *v9;
  int v10;
  PCPersistentTimer *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&v2->_target);

  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x1D17A4604]();
    logObject = v2->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v2;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "Invalidating timer %{public}@", (uint8_t *)&v10, 0xCu);
    }
    objc_storeWeak(&v2->_target, 0);
    v2->_selector = 0;
    queue = v2->_queue;
    v2->_queue = 0;

    -[PCSimpleTimer invalidate](v2->_simpleTimer, "invalidate");
    simpleTimer = v2->_simpleTimer;
    v2->_simpleTimer = 0;

    +[PCPersistentInterfaceManager sharedInstance](PCPersistentInterfaceManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeDelegate:", v2);

    objc_msgSend(MEMORY[0x1E0D13208], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeDelegate:", v2);

    objc_autoreleasePoolPop(v4);
  }
  objc_sync_exit(v2);

}

+ (id)lastSystemWakeDate
{
  return +[PCSimpleTimer lastSystemWakeDate](PCSimpleTimer, "lastSystemWakeDate");
}

- (double)_nextForcedAlignmentAbsoluteTime
{
  double v2;
  double Current;
  double v4;
  double v5;

  v2 = (double)(+[PCPersistentIdentifiers hostUniqueIdentifier](PCPersistentIdentifiers, "hostUniqueIdentifier")% 0x5460);
  Current = CFAbsoluteTimeGetCurrent();
  v4 = fmod(Current - v2, 21600.0);
  v5 = -0.0;
  if (v4 < 0.0)
    v5 = v2;
  return Current + 21600.0 - (v4 + v5);
}

+ (id)_backgroundUpdateQueue
{
  if (_backgroundUpdateQueue_pred != -1)
    dispatch_once(&_backgroundUpdateQueue_pred, &__block_literal_global_0);
  return (id)_backgroundUpdateQueue_sQueue;
}

+ (double)currentMachTimeInterval
{
  double result;

  +[PCSimpleTimer currentMachTimeInterval](PCSimpleTimer, "currentMachTimeInterval");
  return result;
}

- (PCPersistentTimer)initWithTimeInterval:(double)a3 serviceIdentifier:(id)a4 guidancePriority:(unint64_t)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8
{
  id v14;
  id v15;
  id v16;
  PCPersistentTimer *v17;

  v14 = a8;
  v15 = a6;
  v16 = a4;
  v17 = -[PCPersistentTimer _initWithAbsoluteTime:serviceIdentifier:guidancePriority:target:selector:userInfo:triggerOnGMTChange:](self, "_initWithAbsoluteTime:serviceIdentifier:guidancePriority:target:selector:userInfo:triggerOnGMTChange:", v16, a5, v15, a7, v14, 1, CFAbsoluteTimeGetCurrent() + a3);

  return v17;
}

- (PCPersistentTimer)initWithTimeInterval:(double)a3 serviceIdentifier:(id)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7
{
  id v12;
  id v13;
  id v14;
  PCPersistentTimer *v15;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = -[PCPersistentTimer _initWithAbsoluteTime:serviceIdentifier:guidancePriority:target:selector:userInfo:triggerOnGMTChange:](self, "_initWithAbsoluteTime:serviceIdentifier:guidancePriority:target:selector:userInfo:triggerOnGMTChange:", v14, -1, v13, a6, v12, 1, CFAbsoluteTimeGetCurrent() + a3);

  return v15;
}

- (id)_initWithAbsoluteTime:(double)a3 serviceIdentifier:(id)a4 guidancePriority:(unint64_t)a5 target:(id)a6 selector:(SEL)a7 userInfo:(id)a8 triggerOnGMTChange:(BOOL)a9
{
  id v17;
  id v18;
  id v19;
  PCPersistentTimer *v20;
  id v21;
  uint64_t v22;
  OS_os_log *logObject;
  uint64_t v24;
  NSString *serviceIdentifier;
  void *v27;
  objc_super v28;

  v17 = a4;
  v18 = a6;
  v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)PCPersistentTimer;
  v20 = -[PCPersistentTimer init](&v28, sel_init);
  if (v20)
  {
    if (!v18 || !a7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("PCPersistentTimer.m"), 104, CFSTR("%@ target and selector are required"), objc_opt_class());

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("persistentTimer.%@"), v17);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    +[PCLog logWithCategory:](PCLog, "logWithCategory:", objc_msgSend(v21, "UTF8String"));
    v22 = objc_claimAutoreleasedReturnValue();
    logObject = v20->_logObject;
    v20->_logObject = (OS_os_log *)v22;

    v20->_fireTime = a3;
    v20->_minimumEarlyFireProportion = 0.0;
    v20->_earlyFireConstantInterval = 0.0;
    v24 = objc_msgSend(v17, "copy");
    serviceIdentifier = v20->_serviceIdentifier;
    v20->_serviceIdentifier = (NSString *)v24;

    objc_storeWeak(&v20->_target, v18);
    v20->_selector = a7;
    objc_storeStrong(&v20->_userInfo, a8);
    v20->_triggerOnGMTChange = a9;
    v20->_guidancePriority = a5;

  }
  return v20;
}

+ (void)_updateTime:(double)a3 forGuidancePriority:(unint64_t)a4
{
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (_updateTime_forGuidancePriority__onceToken != -1)
    dispatch_once(&_updateTime_forGuidancePriority__onceToken, &__block_literal_global_36);
  v7 = a1;
  objc_sync_enter(v7);
  objc_msgSend(v7, "_currentGuidanceTime");
  v9 = v8;
  v10 = (void *)sGuidanceTimes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, v12);

  objc_msgSend(v7, "_currentGuidanceTime");
  v14 = v13;
  objc_sync_exit(v7);

  if (v14 != v9)
  {
    v15 = (unint64_t)(v14 * 1000.0);
    if (v15)
    {
      +[PCLog timer](PCLog, "timer");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v15 / 1000.0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        PCStringFromDate(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_1CBC1B000, v16, OS_LOG_TYPE_DEFAULT, "updating timer guidance to %{public}@", (uint8_t *)&v20, 0xCu);

      }
      v19 = _updateTime_forGuidancePriority__token;
      if (_updateTime_forGuidancePriority__token == -1)
      {
        if (notify_register_check("PCPersistentTimerGuidanceNotification", &_updateTime_forGuidancePriority__token))
        {
LABEL_11:
          notify_cancel(_updateTime_forGuidancePriority__token);
          _updateTime_forGuidancePriority__token = -1;
          return;
        }
        v19 = _updateTime_forGuidancePriority__token;
      }
      if (!notify_set_state(v19, (unint64_t)(v14 * 1000.0)))
      {
        notify_post("PCPersistentTimerGuidanceNotification");
        return;
      }
      goto LABEL_11;
    }
  }
}

+ (double)_currentGuidanceTime
{
  id v2;
  double v3;
  _QWORD v5[6];
  _QWORD v6[4];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  v2 = a1;
  objc_sync_enter(v2);
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = -1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PCPersistentTimer__currentGuidanceTime__block_invoke;
  v5[3] = &unk_1E8743370;
  v5[4] = v6;
  v5[5] = &v7;
  objc_msgSend((id)sGuidanceTimes, "enumerateKeysAndObjectsUsingBlock:", v5);
  _Block_object_dispose(v6, 8);
  objc_sync_exit(v2);

  v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)setMinimumEarlyFireProportion:(double)a3
{
  double v4;
  PCPersistentTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  v4 = 0.0;
  if (a3 >= 0.0)
    v4 = a3;
  obj->_minimumEarlyFireProportion = fmin(v4, 1.0);
  -[PCPersistentTimer _updateTimers](obj, "_updateTimers");
  objc_sync_exit(obj);

}

- (void)setDisableSystemWaking:(BOOL)a3
{
  _BOOL8 v3;
  PCPersistentTimer *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_disableSystemWaking != v3)
  {
    obj->_disableSystemWaking = v3;
    -[PCSimpleTimer setDisableSystemWaking:](obj->_simpleTimer, "setDisableSystemWaking:", v3);
    -[PCPersistentTimer _updateTimers](obj, "_updateTimers");
  }
  objc_sync_exit(obj);

}

void __41__PCPersistentTimer__currentGuidanceTime__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if ((unint64_t)objc_msgSend(v9, "unsignedIntegerValue") < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                              + 24))
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v6 - CFAbsoluteTimeGetCurrent();
    if (v7 > 2.22044605e-16 && v7 < 7200.0)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v9, "unsignedIntegerValue");
      objc_msgSend(v5, "doubleValue");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
    }
  }

}

- (void)dealloc
{
  objc_super v3;

  -[PCPersistentTimer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PCPersistentTimer;
  -[PCPersistentTimer dealloc](&v3, sel_dealloc);
}

- (void)scheduleInRunLoop:(id)a3
{
  -[PCPersistentTimer scheduleInRunLoop:inMode:](self, "scheduleInRunLoop:inMode:", a3, *MEMORY[0x1E0C99860]);
}

- (double)fireTime
{
  PCPersistentTimer *v2;
  double fireTime;

  v2 = self;
  objc_sync_enter(v2);
  fireTime = v2->_fireTime;
  objc_sync_exit(v2);

  return fireTime;
}

- (BOOL)firingIsImminent
{
  PCPersistentTimer *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[PCSimpleTimer firingIsImminent](v2->_simpleTimer, "firingIsImminent");
  objc_sync_exit(v2);

  return v3;
}

- (PCPersistentTimer)initWithFireDate:(id)a3 serviceIdentifier:(id)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7
{
  id v12;
  id v13;
  id v14;
  PCPersistentTimer *v15;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v15 = -[PCPersistentTimer _initWithAbsoluteTime:serviceIdentifier:guidancePriority:target:selector:userInfo:triggerOnGMTChange:](self, "_initWithAbsoluteTime:serviceIdentifier:guidancePriority:target:selector:userInfo:triggerOnGMTChange:", v14, -1, v13, a6, v12, 0);

  return v15;
}

- (void)scheduleInQueue:(id)a3
{
  id v6;
  PCPersistentTimer *v7;
  id WeakRetained;
  PCSimpleTimer *simpleTimer;
  PCSimpleTimer *v10;
  PCSimpleTimer *v11;
  NSObject *logObject;
  PCSimpleTimer *v13;
  unint64_t guidancePriority;
  double fireTime;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  PCPersistentTimer *v22;
  __int16 v23;
  PCSimpleTimer *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  WeakRetained = objc_loadWeakRetained(&v7->_target);

  if (WeakRetained)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PCPersistentTimer.m"), 207, CFSTR("Cannot schedule invalidated %@"), objc_opt_class());

    if (v6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PCPersistentTimer.m"), 208, CFSTR("Cannot schedule on NULL queue %@"), objc_opt_class());

LABEL_3:
  objc_storeStrong((id *)&v7->_queue, a3);
  simpleTimer = v7->_simpleTimer;
  if (!simpleTimer)
  {
    v7->_startTime = CFAbsoluteTimeGetCurrent();
    v10 = -[PCSimpleTimer initWithAbsoluteTime:serviceIdentifier:target:selector:userInfo:triggerOnGMTChange:]([PCSimpleTimer alloc], "initWithAbsoluteTime:serviceIdentifier:target:selector:userInfo:triggerOnGMTChange:", v7->_serviceIdentifier, v7, sel__fireTimerFired, 0, v7->_triggerOnGMTChange, v7->_fireTime);
    v11 = v7->_simpleTimer;
    v7->_simpleTimer = v10;

    -[PCSimpleTimer setDisableSystemWaking:](v7->_simpleTimer, "setDisableSystemWaking:", v7->_disableSystemWaking);
    -[PCSimpleTimer setUserVisible:](v7->_simpleTimer, "setUserVisible:", v7->_userVisible);
    logObject = v7->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v7->_simpleTimer;
      *(_DWORD *)buf = 138543618;
      v22 = v7;
      v23 = 2114;
      v24 = v13;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "%{public}@ created %{public}@", buf, 0x16u);
    }
    simpleTimer = v7->_simpleTimer;
  }
  guidancePriority = v7->_guidancePriority;
  fireTime = v7->_fireTime;
  -[PCSimpleTimer scheduleInQueue:](simpleTimer, "scheduleInQueue:", v7->_queue);
  +[PCPersistentInterfaceManager sharedInstance](PCPersistentInterfaceManager, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PCPersistentTimer _backgroundUpdateQueue](PCPersistentTimer, "_backgroundUpdateQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addDelegate:queue:", v7, v17);

  objc_msgSend(MEMORY[0x1E0D13208], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addDelegate:", v7);

  -[PCPersistentTimer _updateTimers](v7, "_updateTimers");
  objc_sync_exit(v7);

  if (guidancePriority != -1)
    +[PCPersistentTimer _updateTime:forGuidancePriority:](PCPersistentTimer, "_updateTime:forGuidancePriority:", guidancePriority, fireTime);

}

- (void)_fireTimerFired
{
  PCPersistentTimer *v2;
  id WeakRetained;
  NSObject *logObject;
  id v5;
  int v6;
  PCPersistentTimer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&v2->_target);

  if (WeakRetained)
  {
    logObject = v2->_logObject;
    if (os_log_type_enabled(logObject, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v2;
      _os_log_impl(&dword_1CBC1B000, logObject, OS_LOG_TYPE_DEFAULT, "PersistentTimer %{public}@ has fired", (uint8_t *)&v6, 0xCu);
    }
    v5 = objc_loadWeakRetained(&v2->_target);
    WeakRetained = (id)v2->_selector;
    -[PCPersistentTimer invalidate](v2, "invalidate");
  }
  else
  {
    v5 = 0;
  }
  objc_sync_exit(v2);

  if (WeakRetained)
    objc_msgSend(v5, "performSelector:withObject:", WeakRetained, v2);

}

- (void)setEarlyFireConstantInterval:(double)a3
{
  PCPersistentTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_earlyFireConstantInterval = a3;
  -[PCPersistentTimer _updateTimers](obj, "_updateTimers");
  objc_sync_exit(obj);

}

- (void)setUserVisible:(BOOL)a3
{
  _BOOL8 v3;
  PCPersistentTimer *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_userVisible != v3)
  {
    obj->_userVisible = v3;
    -[PCSimpleTimer setUserVisible:](obj->_simpleTimer, "setUserVisible:", v3);
    -[PCPersistentTimer _updateTimers](obj, "_updateTimers");
  }
  objc_sync_exit(obj);

}

- (BOOL)isUserVisible
{
  PCPersistentTimer *v2;
  BOOL userVisible;

  v2 = self;
  objc_sync_enter(v2);
  userVisible = v2->_userVisible;
  objc_sync_exit(v2);

  return userVisible;
}

- (double)startTime
{
  PCPersistentTimer *v2;
  double startTime;

  v2 = self;
  objc_sync_enter(v2);
  startTime = v2->_startTime;
  objc_sync_exit(v2);

  return startTime;
}

- (BOOL)isValid
{
  PCPersistentTimer *v2;
  id WeakRetained;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&v2->_target);
  v4 = WeakRetained != 0;

  objc_sync_exit(v2);
  return v4;
}

- (id)userInfo
{
  PCPersistentTimer *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_userInfo;
  objc_sync_exit(v2);

  return v3;
}

void __43__PCPersistentTimer__backgroundUpdateQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  PCCreateQueue("PCPersistentTimer-sharedBackgroundUpdateQueue");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_backgroundUpdateQueue_sQueue;
  _backgroundUpdateQueue_sQueue = v0;

}

- (void)cutPowerMonitorBatteryConnectedStateDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  +[PCPersistentTimer _backgroundUpdateQueue](PCPersistentTimer, "_backgroundUpdateQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PCPersistentTimer_cutPowerMonitorBatteryConnectedStateDidChange___block_invoke;
  block[3] = &unk_1E8743348;
  block[4] = self;
  dispatch_async(v4, block);

}

void __67__PCPersistentTimer_cutPowerMonitorBatteryConnectedStateDidChange___block_invoke(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "_updateTimers");
  objc_sync_exit(obj);

}

- (void)interfaceManagerWWANInterfaceStatusChanged:(id)a3
{
  PCPersistentTimer *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[PCPersistentTimer _updateTimers](v4, "_updateTimers");
  objc_sync_exit(v4);

}

- (void)interfaceManagerWWANInterfaceChangedPowerState:(id)a3
{
  PCPersistentTimer *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[PCPersistentTimer _updateTimers](v4, "_updateTimers");
  objc_sync_exit(v4);

}

- (void)interfaceManagerInternetReachabilityChanged:(id)a3
{
  PCPersistentTimer *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[PCPersistentTimer _updateTimers](v4, "_updateTimers");
  objc_sync_exit(v4);

}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  double minimumEarlyFireProportion;
  const char *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)PCPersistentTimer;
  -[PCPersistentTimer description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_fireTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  minimumEarlyFireProportion = self->_minimumEarlyFireProportion;
  if (self->_disableSystemWaking)
    v7 = "yes";
  else
    v7 = "no";
  WeakRetained = objc_loadWeakRetained(&self->_target);
  NSStringFromSelector(self->_selector);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@{fireDate = %@, early fire proportion = %g, disable system waking = %s, target = %@, selector = %@}"), v4, v5, *(_QWORD *)&minimumEarlyFireProportion, v7, WeakRetained, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

void __53__PCPersistentTimer__updateTime_forGuidancePriority___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)sGuidanceTimes;
  sGuidanceTimes = (uint64_t)v0;

}

- (double)minimumEarlyFireProportion
{
  return self->_minimumEarlyFireProportion;
}

- (double)earlyFireConstantInterval
{
  return self->_earlyFireConstantInterval;
}

- (BOOL)disableSystemWaking
{
  return self->_disableSystemWaking;
}

@end
