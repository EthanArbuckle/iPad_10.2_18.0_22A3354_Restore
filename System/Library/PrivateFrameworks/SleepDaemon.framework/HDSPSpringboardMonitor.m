@implementation HDSPSpringboardMonitor

- (HDSPSpringboardMonitor)initWithCallbackScheduler:(id)a3 isAppleWatch:(BOOL)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  char *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDSPSpringboardMonitor;
  v7 = -[HDSPSpringboardMonitor init](&v15, sel_init);
  if (v7)
  {
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v9;
      v18 = 2048;
      v19 = v7;
      v10 = v9;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);

    }
    v7[8] = a4;
    *(_QWORD *)(v7 + 12) = 0xFFFFFFFFLL;
    v7[9] = objc_msgSend(v7, "_checkSpringBoardStarted");
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BEA98C8]), "initWithCallbackScheduler:", v6);
    v12 = (void *)*((_QWORD *)v7 + 3);
    *((_QWORD *)v7 + 3) = v11;

    v13 = v7;
  }

  return (HDSPSpringboardMonitor *)v7;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_springboardStartedLock;
  void (**v4)(_QWORD);

  p_springboardStartedLock = &self->_springboardStartedLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_springboardStartedLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_springboardStartedLock);
}

- (BOOL)isSpringboardStarted
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__HDSPSpringboardMonitor_isSpringboardStarted__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPSpringboardMonitor _withLock:](self, "_withLock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __46__HDSPSpringboardMonitor_isSpringboardStarted__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  return result;
}

- (BOOL)_checkSpringBoardStarted
{
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int out_token;
  _BYTE state64[12];
  __int16 v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((HKSPIsHomePod() & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    out_token = -1;
    notify_register_check("com.apple.springboard.finishedstartup", &out_token);
    if (out_token == -1)
    {
      v3 = 0;
    }
    else
    {
      *(_QWORD *)state64 = 0;
      notify_get_state(out_token, (uint64_t *)state64);
      v3 = *(_QWORD *)state64 != 0;
    }
    HKSPLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_opt_class();
      v6 = v5;
      -[HDSPSpringboardMonitor _processName](self, "_processName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)state64 = 138543874;
      *(_QWORD *)&state64[4] = v5;
      v11 = 2114;
      v12 = v7;
      v13 = 1024;
      v14 = v3;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ started = %d", state64, 0x1Cu);

    }
  }
  return v3;
}

- (id)_processName
{
  if (self->_isAppleWatch)
    return CFSTR("Carousel");
  else
    return CFSTR("Springboard");
}

- (void)dealloc
{
  objc_super v3;

  -[HDSPSpringboardMonitor _stopMonitoring](self, "_stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)HDSPSpringboardMonitor;
  -[HDSPSpringboardMonitor dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  char v4;

  if (a3)
  {
    v4 = 0;
    -[HKSPObserverSet addObserver:wasFirst:](self->_observers, "addObserver:wasFirst:", a3, &v4);
    if (v4)
      -[HDSPSpringboardMonitor _startMonitoring](self, "_startMonitoring");
  }
}

- (void)removeObserver:(id)a3
{
  char v4;

  if (a3)
  {
    v4 = 0;
    -[HKSPObserverSet removeObserver:wasLast:](self->_observers, "removeObserver:wasLast:", a3, &v4);
    if (v4)
      -[HDSPSpringboardMonitor _stopMonitoring](self, "_stopMonitoring");
  }
}

- (void)_startMonitoring
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __42__HDSPSpringboardMonitor__startMonitoring__block_invoke;
    handler[3] = &unk_24D4E6230;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.finishedstartup", &self->_notifyToken, MEMORY[0x24BDAC9B8], handler);
    HKSPLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v5 = v8;
      -[HDSPSpringboardMonitor _processName](self, "_processName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v6;
      v7 = "[%{public}@] Start monitoring %{public}@ start";
      goto LABEL_6;
    }
  }
  else
  {
    HKSPLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_opt_class();
      v5 = v4;
      -[HDSPSpringboardMonitor _processName](self, "_processName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v4;
      v12 = 2114;
      v13 = v6;
      v7 = "[%{public}@] Alreay monitoring %{public}@";
LABEL_6:
      _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, v7, buf, 0x16u);

    }
  }

  -[HDSPSpringboardMonitor _checkAndNotify](self, "_checkAndNotify");
}

uint64_t __42__HDSPSpringboardMonitor__startMonitoring__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkAndNotify");
}

- (void)_checkAndNotify
{
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__HDSPSpringboardMonitor__checkAndNotify__block_invoke;
  v3[3] = &unk_24D4E34C0;
  v3[4] = self;
  v3[5] = &v4;
  -[HDSPSpringboardMonitor _withLock:](self, "_withLock:", v3);
  if (*((_BYTE *)v5 + 24))
    -[HKSPObserverSet enumerateObserversWithBlock:](self->_observers, "enumerateObserversWithBlock:", &__block_literal_global_30);
  _Block_object_dispose(&v4, 8);
}

_BYTE *__41__HDSPSpringboardMonitor__checkAndNotify__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[9])
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    result = (_BYTE *)objc_msgSend(result, "_checkSpringBoardStarted");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  return result;
}

uint64_t __41__HDSPSpringboardMonitor__checkAndNotify__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "springboardDidStart");
}

- (void)_stopMonitoring
{
  int notifyToken;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
    HKSPLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_opt_class();
      v6 = v5;
      -[HDSPSpringboardMonitor _processName](self, "_processName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v5;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stop monitoring %{public}@ start", (uint8_t *)&v8, 0x16u);

    }
  }
}

- (BOOL)isAppleWatch
{
  return self->_isAppleWatch;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (BOOL)springboardStarted
{
  return self->_springboardStarted;
}

- (os_unfair_lock_s)springboardStartedLock
{
  return self->_springboardStartedLock;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
