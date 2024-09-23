@implementation SCDAMonitor

- (SCDAMonitor)init
{
  SCDAMonitor *v2;
  SCDAMonitor *v3;
  uint64_t v4;
  OS_dispatch_queue *myriadMonitorQueue;
  SCDAQueue *v6;
  SCDAQueue *completions;
  SCDAMonitor *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCDAMonitor;
  v2 = -[SCDAMonitor init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    SCDADispatchSerialQueueWithRelativePriority("com.apple.assistant.myriad.delay_monitor", QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    myriadMonitorQueue = v3->_myriadMonitorQueue;
    v3->_myriadMonitorQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(SCDAQueue);
    completions = v3->_completions;
    v3->_completions = v6;

    *(_DWORD *)&v3->_isRegisteredForMyriadEventNotification = 0;
    v8 = v3;
  }

  return v3;
}

- (void)waitForMyriadDecisionWithCompletion:(id)a3
{
  id v4;
  NSObject *myriadMonitorQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  myriadMonitorQueue = self->_myriadMonitorQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__SCDAMonitor_waitForMyriadDecisionWithCompletion___block_invoke;
  v7[3] = &unk_25174ACA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(myriadMonitorQueue, v7);

}

- (void)_enqueueBlock:(id)a3 forReason:(id)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  int64_t state;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  CFAbsoluteTime Current;
  SCDAQueue *completions;
  SCDASafetyBlock *v20;
  SCDASafetyBlock *v21;
  _QWORD v22[4];
  __CFString *v23;
  id v24;
  CFAbsoluteTime v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = v7;
  if (v6)
  {
    v9 = CFSTR("Unspecified");
    if (v7)
      v9 = v7;
    v10 = v9;
    state = self->_state;
    if (state == 1 && !self->_ignoreMyriadEvents)
    {
      v15 = (void *)SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v16 = v15;
        -[SCDAMonitor _myriadStateToString:](self, "_myriadStateToString:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v27 = "-[SCDAMonitor _enqueueBlock:forReason:]";
        v28 = 2112;
        v29 = v17;
        v30 = 2112;
        v31 = v10;
        _os_log_impl(&dword_246211000, v16, OS_LOG_TYPE_INFO, "%s Queueing command waiting for Myriad decision: %@ (reason = %@).", buf, 0x20u);

      }
      Current = CFAbsoluteTimeGetCurrent();
      completions = self->_completions;
      v20 = [SCDASafetyBlock alloc];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __39__SCDAMonitor__enqueueBlock_forReason___block_invoke;
      v22[3] = &unk_25174ACC8;
      v25 = Current;
      v23 = v10;
      v24 = v6;
      v21 = -[SCDASafetyBlock initWithBlock:](v20, "initWithBlock:", v22);
      -[SCDAQueue enqueueObject:](completions, "enqueueObject:", v21);

    }
    else
    {
      v12 = (void *)SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v13 = v12;
        -[SCDAMonitor _myriadStateToString:](self, "_myriadStateToString:", state);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v27 = "-[SCDAMonitor _enqueueBlock:forReason:]";
        v28 = 2112;
        v29 = v14;
        v30 = 2112;
        v31 = v10;
        _os_log_impl(&dword_246211000, v13, OS_LOG_TYPE_INFO, "%s Dequeueing command for Myriad decision: %@ (reason = %@).", buf, 0x20u);

      }
      if (self->_ignoreMyriadEvents)
        (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
      else
        (*((void (**)(id, BOOL))v6 + 2))(v6, self->_state != 2);
    }

  }
}

- (void)waitForMyriadDecisionForReason:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *myriadMonitorQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  myriadMonitorQueue = self->_myriadMonitorQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SCDAMonitor_waitForMyriadDecisionForReason_withCompletion___block_invoke;
  block[3] = &unk_25174ACF0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(myriadMonitorQueue, block);

}

- (void)startMonitoringWithTimeoutInterval:(double)a3
{
  -[SCDAMonitor startMonitoringWithTimeoutInterval:instanceContext:](self, "startMonitoringWithTimeoutInterval:instanceContext:", 0, a3);
}

- (void)startMonitoringWithTimeoutInterval:(double)a3 instanceContext:(id)a4
{
  id v6;
  NSObject *myriadMonitorQueue;
  id v8;
  _QWORD block[4];
  id v10;
  SCDAMonitor *v11;
  double v12;

  v6 = a4;
  myriadMonitorQueue = self->_myriadMonitorQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__SCDAMonitor_startMonitoringWithTimeoutInterval_instanceContext___block_invoke;
  block[3] = &unk_25174AD18;
  v12 = a3;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(myriadMonitorQueue, block);

}

- (void)ignoreMyriadEvents:(BOOL)a3
{
  NSObject *myriadMonitorQueue;
  _QWORD v4[5];
  BOOL v5;

  myriadMonitorQueue = self->_myriadMonitorQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__SCDAMonitor_ignoreMyriadEvents___block_invoke;
  v4[3] = &unk_25174AD40;
  v5 = a3;
  v4[4] = self;
  dispatch_async(myriadMonitorQueue, v4);
}

- (void)dequeueBlocksWaitingForMyriadDecision
{
  NSObject *myriadMonitorQueue;
  _QWORD block[5];

  myriadMonitorQueue = self->_myriadMonitorQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SCDAMonitor_dequeueBlocksWaitingForMyriadDecision__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(myriadMonitorQueue, block);
}

- (void)stopMonitoring
{
  NSObject *myriadMonitorQueue;
  _QWORD block[5];

  myriadMonitorQueue = self->_myriadMonitorQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__SCDAMonitor_stopMonitoring__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(myriadMonitorQueue, block);
}

- (BOOL)isMonitoring
{
  NSObject *myriadMonitorQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  myriadMonitorQueue = self->_myriadMonitorQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__SCDAMonitor_isMonitoring__block_invoke;
  v5[3] = &unk_25174AD90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(myriadMonitorQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)didWin
{
  NSObject *myriadMonitorQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  myriadMonitorQueue = self->_myriadMonitorQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __21__SCDAMonitor_didWin__block_invoke;
  v5[3] = &unk_25174AD90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(myriadMonitorQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SCDANotifyObserver invalidate](self->_wonObserver, "invalidate");
  -[SCDANotifyObserver invalidate](self->_lostObserver, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SCDAMonitor;
  -[SCDAMonitor dealloc](&v3, sel_dealloc);
}

- (id)_myriadStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_25174ADB0[a3];
}

- (void)_registerForMyriadEvents
{
  SCDANotifyObserver *v3;
  SCDANotifyObserver *beginObserver;
  SCDANotifyObserver *v5;
  SCDANotifyObserver *wonObserver;
  SCDANotifyObserver *v7;
  SCDANotifyObserver *lostObserver;
  SCDANotifyObserver *v9;
  SCDANotifyObserver *repostedWonObserver;
  NSObject *v11;
  SCDANotifyObserver *v12;
  SCDANotifyObserver *v13;
  SCDANotifyObserver *v14;
  SCDANotifyObserver *v15;
  int v16;
  const char *v17;
  __int16 v18;
  SCDANotifyObserver *v19;
  __int16 v20;
  SCDANotifyObserver *v21;
  __int16 v22;
  SCDANotifyObserver *v23;
  __int16 v24;
  SCDANotifyObserver *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  observerWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.begin", self->_instanceContext, 1, self, self->_myriadMonitorQueue);
  v3 = (SCDANotifyObserver *)objc_claimAutoreleasedReturnValue();
  beginObserver = self->_beginObserver;
  self->_beginObserver = v3;

  observerWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.won", self->_instanceContext, 1, self, self->_myriadMonitorQueue);
  v5 = (SCDANotifyObserver *)objc_claimAutoreleasedReturnValue();
  wonObserver = self->_wonObserver;
  self->_wonObserver = v5;

  observerWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.lost", self->_instanceContext, 1, self, self->_myriadMonitorQueue);
  v7 = (SCDANotifyObserver *)objc_claimAutoreleasedReturnValue();
  lostObserver = self->_lostObserver;
  self->_lostObserver = v7;

  observerWithNotificationName((uint64_t)"com.apple.siri.myriad.repost.decision.won", self->_instanceContext, 1, self, self->_myriadMonitorQueue);
  v9 = (SCDANotifyObserver *)objc_claimAutoreleasedReturnValue();
  repostedWonObserver = self->_repostedWonObserver;
  self->_repostedWonObserver = v9;

  self->_isRegisteredForMyriadEventNotification = 1;
  v11 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v12 = self->_beginObserver;
    v13 = self->_wonObserver;
    v14 = self->_lostObserver;
    v15 = self->_repostedWonObserver;
    v16 = 136316162;
    v17 = "-[SCDAMonitor _registerForMyriadEvents]";
    v18 = 2048;
    v19 = v12;
    v20 = 2048;
    v21 = v13;
    v22 = 2048;
    v23 = v14;
    v24 = 2048;
    v25 = v15;
    _os_log_impl(&dword_246211000, v11, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor: Registering for Myriad event notifications (beginObserver: %p, wonObserver: %p, lostObserver: %p, decisionRepostObserver: %p).", (uint8_t *)&v16, 0x34u);
  }
}

- (void)_cancelRepostedMyriadDecisionTimer
{
  SCDAWatchdogTimer *fetchRepostedMyriadDecisionTimer;
  SCDAWatchdogTimer *v4;

  fetchRepostedMyriadDecisionTimer = self->_fetchRepostedMyriadDecisionTimer;
  if (fetchRepostedMyriadDecisionTimer)
  {
    -[SCDAWatchdogTimer cancelIfNotAlreadyCanceled](fetchRepostedMyriadDecisionTimer, "cancelIfNotAlreadyCanceled");
    v4 = self->_fetchRepostedMyriadDecisionTimer;
    self->_fetchRepostedMyriadDecisionTimer = 0;

  }
}

- (id)_fetchCurrentMyriadDecisionWithWaitTime:(double)a3
{
  NSObject *v3;
  SCDAWatchdogTimer *v4;
  SCDAWatchdogTimer *v7;
  OS_dispatch_queue *myriadMonitorQueue;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self->_ignoreRepostMyriadNotification)
  {
    v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[SCDAMonitor _fetchCurrentMyriadDecisionWithWaitTime:]";
      _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor: Ignoring Myriad repost notifications.", buf, 0xCu);
    }
    v4 = 0;
  }
  else
  {
    v7 = [SCDAWatchdogTimer alloc];
    myriadMonitorQueue = self->_myriadMonitorQueue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __55__SCDAMonitor__fetchCurrentMyriadDecisionWithWaitTime___block_invoke;
    v10[3] = &unk_25174AD68;
    v10[4] = self;
    v4 = -[SCDAWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](v7, "initWithTimeoutInterval:onQueue:timeoutHandler:", myriadMonitorQueue, v10, a3);
  }
  return v4;
}

- (void)_deregisterFromMyriadEventNotifications
{
  SCDANotifyObserver *beginObserver;
  NSObject *v4;
  SCDANotifyObserver *v5;
  SCDANotifyObserver *wonObserver;
  SCDANotifyObserver *lostObserver;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  beginObserver = self->_beginObserver;
  if (*(_OWORD *)&self->_beginObserver != 0 || self->_lostObserver)
  {
    v4 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[SCDAMonitor _deregisterFromMyriadEventNotifications]";
      _os_log_impl(&dword_246211000, v4, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor: Deregistering from Myriad event notifications.", (uint8_t *)&v8, 0xCu);
      beginObserver = self->_beginObserver;
    }
    -[SCDANotifyObserver invalidate](beginObserver, "invalidate");
    v5 = self->_beginObserver;
    self->_beginObserver = 0;

    -[SCDANotifyObserver invalidate](self->_wonObserver, "invalidate");
    wonObserver = self->_wonObserver;
    self->_wonObserver = 0;

    -[SCDANotifyObserver invalidate](self->_lostObserver, "invalidate");
    lostObserver = self->_lostObserver;
    self->_lostObserver = 0;

    self->_isRegisteredForMyriadEventNotification = 0;
    -[SCDAMonitor _deregisterFromRepostedDecisionResultsObservers](self, "_deregisterFromRepostedDecisionResultsObservers");
  }
}

- (void)_deregisterFromRepostedDecisionResultsObservers
{
  SCDANotifyObserver *repostedWonObserver;
  NSObject *v4;
  SCDANotifyObserver *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[SCDAMonitor _cancelRepostedMyriadDecisionTimer](self, "_cancelRepostedMyriadDecisionTimer");
  repostedWonObserver = self->_repostedWonObserver;
  if (repostedWonObserver)
  {
    v4 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[SCDAMonitor _deregisterFromRepostedDecisionResultsObservers]";
      _os_log_impl(&dword_246211000, v4, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor: Deregistering from reposted Myriad event notification.", (uint8_t *)&v6, 0xCu);
      repostedWonObserver = self->_repostedWonObserver;
    }
    -[SCDANotifyObserver invalidate](repostedWonObserver, "invalidate");
    v5 = self->_repostedWonObserver;
    self->_repostedWonObserver = 0;

  }
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  SCDANotifyObserver *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  SCDAMonitor *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _BYTE v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = (SCDANotifyObserver *)a3;
  -[SCDANotifyObserver name](v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_wonObserver == v5)
  {
    v7 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v13 = 136315394;
      *(_QWORD *)&v13[4] = "-[SCDAMonitor notifyObserver:didReceiveNotificationWithToken:]";
      *(_WORD *)&v13[12] = 2112;
      *(_QWORD *)&v13[14] = v6;
      v8 = "%s Myriad Delay Monitor result: YES (%@)";
      goto LABEL_9;
    }
LABEL_10:
    v9 = self;
    v10 = 1;
LABEL_14:
    -[SCDAMonitor _resultSeenWithValue:](v9, "_resultSeenWithValue:", v10, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14);
LABEL_15:
    -[SCDAMonitor _deregisterFromRepostedDecisionResultsObservers](self, "_deregisterFromRepostedDecisionResultsObservers");
    goto LABEL_16;
  }
  if (self->_lostObserver == v5)
  {
    v11 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v13 = 136315394;
      *(_QWORD *)&v13[4] = "-[SCDAMonitor notifyObserver:didReceiveNotificationWithToken:]";
      *(_WORD *)&v13[12] = 2112;
      *(_QWORD *)&v13[14] = v6;
      _os_log_impl(&dword_246211000, v11, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor result: NO (%@)", v13, 0x16u);
    }
    v9 = self;
    v10 = 0;
    goto LABEL_14;
  }
  if (self->_beginObserver == v5)
  {
    v12 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v13 = 136315394;
      *(_QWORD *)&v13[4] = "-[SCDAMonitor notifyObserver:didReceiveNotificationWithToken:]";
      *(_WORD *)&v13[12] = 2112;
      *(_QWORD *)&v13[14] = v6;
      _os_log_impl(&dword_246211000, v12, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor Begin (%@)", v13, 0x16u);
    }
    -[SCDAMonitor _setDecisionIsPending](self, "_setDecisionIsPending");
    goto LABEL_15;
  }
  if (self->_repostedWonObserver == v5)
  {
    v7 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v13 = 136315394;
      *(_QWORD *)&v13[4] = "-[SCDAMonitor notifyObserver:didReceiveNotificationWithToken:]";
      *(_WORD *)&v13[12] = 2112;
      *(_QWORD *)&v13[14] = v6;
      v8 = "%s Myriad Delay Monitor received reposted result: YES (%@)";
LABEL_9:
      _os_log_impl(&dword_246211000, v7, OS_LOG_TYPE_INFO, v8, v13, 0x16u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_16:

}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  SCDANotifyObserver *v8;
  NSObject *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v11;
  const char *v12;
  __int16 v13;
  SCDANotifyObserver *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = (SCDANotifyObserver *)a3;
  v9 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v11 = 136315906;
    v12 = "-[SCDAMonitor notifyObserver:didChangeStateFrom:to:]";
    v13 = 2048;
    v14 = v8;
    v15 = 2048;
    v16 = a4;
    v17 = 2048;
    v18 = a5;
    _os_log_impl(&dword_246211000, v9, OS_LOG_TYPE_INFO, "%s notifyObserver %p didChangeStateFrom %ld -> %ld", (uint8_t *)&v11, 0x2Au);
  }
  if (!a4 && self->_repostedWonObserver == v8)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.siri.myriad.get.decision"), 0, 0, 1u);
  }

}

- (void)_setDecisionIsPending
{
  NSObject *v3;
  SCDAWatchdogTimer *timer;
  SCDAWatchdogTimer *v5;
  double myriadEventMonitorTimeout;
  SCDAWatchdogTimer *v7;
  double v8;
  OS_dispatch_queue *myriadMonitorQueue;
  SCDAWatchdogTimer *v10;
  SCDAWatchdogTimer *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (self->_state == 1)
  {
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[SCDAMonitor _setDecisionIsPending]";
      _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s Myriad decision is already in pending state.", buf, 0xCu);
      v3 = SCDALogContextCore;
    }
    timer = self->_timer;
    if (timer)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[SCDAMonitor _setDecisionIsPending]";
        _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s Myriad monitor cancelling existing watch dog timer.", buf, 0xCu);
        timer = self->_timer;
      }
      -[SCDAWatchdogTimer cancel](timer, "cancel");
      v5 = self->_timer;
      self->_timer = 0;

      v3 = SCDALogContextCore;
    }
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[SCDAMonitor _setDecisionIsPending]";
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s Myriad decision is pending.", buf, 0xCu);
    v3 = SCDALogContextCore;
  }
  self->_state = 1;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    myriadEventMonitorTimeout = self->_myriadEventMonitorTimeout;
    *(_DWORD *)buf = 136315394;
    v14 = "-[SCDAMonitor _setDecisionIsPending]";
    v15 = 2048;
    v16 = myriadEventMonitorTimeout;
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s Myriad monitor initializing safety timer with timeout: %f seconds", buf, 0x16u);
  }
  v7 = [SCDAWatchdogTimer alloc];
  v8 = self->_myriadEventMonitorTimeout;
  myriadMonitorQueue = self->_myriadMonitorQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __36__SCDAMonitor__setDecisionIsPending__block_invoke;
  v12[3] = &unk_25174AD68;
  v12[4] = self;
  v10 = -[SCDAWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](v7, "initWithTimeoutInterval:onQueue:timeoutHandler:", myriadMonitorQueue, v12, v8);
  v11 = self->_timer;
  self->_timer = v10;

  -[SCDAWatchdogTimer start](self->_timer, "start");
}

- (void)_dequeueBlocksWithSignal:(int64_t)a3
{
  void *v5;
  SCDAQueue *completions;
  NSObject *v7;
  SCDAQueue *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    completions = self->_completions;
    v7 = v5;
    *(_DWORD *)buf = 136315394;
    v20 = "-[SCDAMonitor _dequeueBlocksWithSignal:]";
    v21 = 1024;
    v22 = -[SCDAQueue count](completions, "count");
    _os_log_impl(&dword_246211000, v7, OS_LOG_TYPE_INFO, "%s Myriad decision had %d block(s) waiting", buf, 0x12u);

  }
  if (-[SCDAQueue count](self->_completions, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = self->_completions;
    v9 = -[SCDAQueue countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "invokeWithSignal:", a3, (_QWORD)v14);
        }
        while (v10 != v12);
        v10 = -[SCDAQueue countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    v13 = -[SCDAQueue dequeueAllObjects](self->_completions, "dequeueAllObjects");
  }
}

- (void)_clear
{
  void *v3;
  int64_t state;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    state = self->_state;
    v5 = v3;
    -[SCDAMonitor _myriadStateToString:](self, "_myriadStateToString:", state);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[SCDAMonitor _clear]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s Clear pending for Myriad decision: %@.", (uint8_t *)&v7, 0x16u);

  }
  self->_state = 0;
  -[SCDAMonitor _flushCompletions:](self, "_flushCompletions:", 0);
}

- (void)_flushCompletions:(BOOL)a3
{
  uint64_t v4;

  if (a3)
    v4 = 0;
  else
    v4 = -1000;
  -[SCDAMonitor _dequeueBlocksWithSignal:](self, "_dequeueBlocksWithSignal:", v4);
  -[SCDAWatchdogTimer cancelIfNotAlreadyCanceled](self->_timer, "cancelIfNotAlreadyCanceled");
}

- (void)_resultSeenWithValue:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  if (a3)
    v5 = 3;
  else
    v5 = 2;
  self->_state = v5;
  v6 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    -[SCDAMonitor _myriadStateToString:](self, "_myriadStateToString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SCDAMonitor _resultSeenWithValue:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_246211000, v7, OS_LOG_TYPE_INFO, "%s Myriad decision seen: state is %@.", (uint8_t *)&v9, 0x16u);

  }
  -[SCDAMonitor _flushCompletions:](self, "_flushCompletions:", v3);
}

- (void)_ignoreRepostMyriadNotification:(BOOL)a3
{
  NSObject *myriadMonitorQueue;
  _QWORD v4[5];
  BOOL v5;

  myriadMonitorQueue = self->_myriadMonitorQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__SCDAMonitor__ignoreRepostMyriadNotification___block_invoke;
  v4[3] = &unk_25174AD40;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(myriadMonitorQueue, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myriadMonitorQueue, 0);
  objc_storeStrong((id *)&self->_fetchRepostedMyriadDecisionTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_repostedWonObserver, 0);
  objc_storeStrong((id *)&self->_lostObserver, 0);
  objc_storeStrong((id *)&self->_wonObserver, 0);
  objc_storeStrong((id *)&self->_beginObserver, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
}

uint64_t __47__SCDAMonitor__ignoreRepostMyriadNotification___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 99) = *(_BYTE *)(result + 40);
  return result;
}

_QWORD *__36__SCDAMonitor__setDecisionIsPending__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[SCDAMonitor _setDecisionIsPending]_block_invoke";
    _os_log_error_impl(&dword_246211000, v2, OS_LOG_TYPE_ERROR, "%s Myriad monitor times out, Myriad is probably unable to finish, clear pending blocks", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD **)(a1 + 32);
  if (result[1] == 1)
  {
    objc_msgSend(result, "_deregisterFromRepostedDecisionResultsObservers");
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_clear");
  }
  return result;
}

void __55__SCDAMonitor__fetchCurrentMyriadDecisionWithWaitTime___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8) == 1 && !*(_BYTE *)(v1 + 97) && *(_QWORD *)(v1 + 56))
  {
    v2 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[SCDAMonitor _fetchCurrentMyriadDecisionWithWaitTime:]_block_invoke";
      _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor: Fetching reposted Myriad event notification.", (uint8_t *)&v4, 0xCu);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.siri.myriad.get.decision"), 0, 0, 1u);
  }
}

uint64_t __21__SCDAMonitor_didWin__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  BOOL v4;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 8);
  if (v2)
    v3 = v2 == 3;
  else
    v3 = 1;
  v4 = v3 || *(_BYTE *)(v1 + 97) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v4;
  return result;
}

uint64_t __27__SCDAMonitor_isMonitoring__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 98);
  return result;
}

_BYTE *__29__SCDAMonitor_stopMonitoring__block_invoke(uint64_t a1)
{
  _BYTE *result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 98) = 0;
  result = *(_BYTE **)(a1 + 32);
  if (result[96])
  {
    objc_msgSend(result, "_deregisterFromMyriadEventNotifications");
    return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_clear");
  }
  return result;
}

uint64_t __52__SCDAMonitor_dequeueBlocksWaitingForMyriadDecision__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SCDAMonitor dequeueBlocksWaitingForMyriadDecision]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_dequeueBlocksWithSignal:", -1000);
}

void __34__SCDAMonitor_ignoreMyriadEvents___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v4 = 136315394;
    v5 = "-[SCDAMonitor ignoreMyriadEvents:]_block_invoke";
    v6 = 1024;
    v7 = v3;
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s Myriad Delay Monitor: Should ignoring Myriad events -> %d.", (uint8_t *)&v4, 0x12u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 97) = *(_BYTE *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_deregisterFromRepostedDecisionResultsObservers");
}

void __66__SCDAMonitor_startMonitoringWithTimeoutInterval_instanceContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 32);
    v9 = 136315650;
    v10 = "-[SCDAMonitor startMonitoringWithTimeoutInterval:instanceContext:]_block_invoke";
    v11 = 2048;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE delay monitor watchdog timeout %f context %@", (uint8_t *)&v9, 0x20u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 98) = 1;
  v5 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v5 + 96))
  {
    objc_storeStrong((id *)(v5 + 16), *(id *)(a1 + 32));
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88) = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "_registerForMyriadEvents");
    objc_msgSend(*(id *)(a1 + 40), "_setDecisionIsPending");
    objc_msgSend(*(id *)(a1 + 40), "_cancelRepostedMyriadDecisionTimer");
    objc_msgSend(*(id *)(a1 + 40), "_fetchCurrentMyriadDecisionWithWaitTime:", 1.75);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 72);
    *(_QWORD *)(v7 + 72) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "start");
  }
}

uint64_t __61__SCDAMonitor_waitForMyriadDecisionForReason_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueBlock:forReason:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __39__SCDAMonitor__enqueueBlock_forReason___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  CFAbsoluteTime v6;
  uint64_t v7;
  int v9;
  const char *v10;
  __int16 v11;
  CFAbsoluteTime v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 136315906;
    v10 = "-[SCDAMonitor _enqueueBlock:forReason:]_block_invoke";
    v11 = 2048;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2048;
    v16 = a2;
    _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s Dequeuing after %f seconds for Myriad decision (reason = %@) and dequeue signal %zd.", (uint8_t *)&v9, 0x2Au);

  }
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2 == 0);
}

uint64_t __51__SCDAMonitor_waitForMyriadDecisionWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueBlock:forReason:", *(_QWORD *)(a1 + 40), 0);
}

+ (void)initialize
{
  if (SCDALogInitIfNeeded_once != -1)
    dispatch_once(&SCDALogInitIfNeeded_once, &__block_literal_global_512);
}

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_2491);
  return (id)sharedMonitor_sharedMonitor;
}

void __28__SCDAMonitor_sharedMonitor__block_invoke()
{
  SCDAMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(SCDAMonitor);
  v1 = (void *)sharedMonitor_sharedMonitor;
  sharedMonitor_sharedMonitor = (uint64_t)v0;

}

@end
