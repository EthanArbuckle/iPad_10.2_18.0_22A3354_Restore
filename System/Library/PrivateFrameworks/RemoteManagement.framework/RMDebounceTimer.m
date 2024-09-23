@implementation RMDebounceTimer

+ (id)debounceTimerWithMinimumInterval:(double)a3 maximumInterval:(double)a4 delegate:(id)a5 identifier:(id)a6
{
  id v9;
  id v10;
  RMDebounceTimer *v11;

  v9 = a6;
  v10 = a5;
  v11 = -[RMDebounceTimer initWithMinimumInterval:maximumInterval:delegate:identifier:]([RMDebounceTimer alloc], "initWithMinimumInterval:maximumInterval:delegate:identifier:", v10, v9, a3, a4);

  return v11;
}

- (RMDebounceTimer)initWithMinimumInterval:(double)a3 maximumInterval:(double)a4 delegate:(id)a5 identifier:(id)a6
{
  id v10;
  id v11;
  RMDebounceTimer *v12;
  uint64_t v13;
  NSObject *lock;
  objc_super v16;

  v10 = a5;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)RMDebounceTimer;
  v12 = -[RMDebounceTimer init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_opt_new();
    lock = v12->_lock;
    v12->_lock = v13;

    v12->_minimumInterval = a3;
    v12->_maximumInterval = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeStrong((id *)&v12->_identifier, a6);
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[RMDebounceTimer minimumTimer](self, "minimumTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RMDebounceTimer minimumTimer](self, "minimumTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    -[RMDebounceTimer setMinimumTimer:](self, "setMinimumTimer:", 0);
  }
  -[RMDebounceTimer maximumTimer](self, "maximumTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RMDebounceTimer maximumTimer](self, "maximumTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

    -[RMDebounceTimer setMaximumTimer:](self, "setMaximumTimer:", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)RMDebounceTimer;
  -[RMDebounceTimer dealloc](&v7, sel_dealloc);
}

- (void)trigger
{
  OUTLINED_FUNCTION_2_0(&dword_21885E000, a1, a3, "Debounce removing existing minimum timer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_1();
}

void __26__RMDebounceTimer_trigger__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "minimumTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[RMLog debounceTimer](RMLog, "debounceTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "minimumTimer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timerID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __26__RMDebounceTimer_trigger__block_invoke_cold_2(v6, (uint64_t)v17, v4, v5);
    }

    objc_msgSend(*(id *)(a1 + 32), "minimumTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastTimerID:", v8);

    objc_msgSend(*(id *)(a1 + 32), "_timerDidFire");
  }
  else
  {
    +[RMLog debounceTimer](RMLog, "debounceTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __26__RMDebounceTimer_trigger__block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
  objc_sync_exit(v2);

}

void __26__RMDebounceTimer_trigger__block_invoke_11(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "maximumTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[RMLog debounceTimer](RMLog, "debounceTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "maximumTimer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timerID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __26__RMDebounceTimer_trigger__block_invoke_11_cold_2(v6, (uint64_t)v17, v4, v5);
    }

    objc_msgSend(*(id *)(a1 + 32), "maximumTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastTimerID:", v8);

    objc_msgSend(*(id *)(a1 + 32), "_timerDidFire");
  }
  else
  {
    +[RMLog debounceTimer](RMLog, "debounceTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __26__RMDebounceTimer_trigger__block_invoke_11_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
  objc_sync_exit(v2);

}

- (void)_timerDidFire
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[RMLog debounceTimer](RMLog, "debounceTimer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[RMDebounceTimer identifier](self, "identifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = CFSTR("unknown");
    if (v4)
      v6 = (const __CFString *)v4;
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_21885E000, v3, OS_LOG_TYPE_INFO, "Debounce fired for %{public}@", (uint8_t *)&v10, 0xCu);

  }
  -[RMDebounceTimer minimumTimer](self, "minimumTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

  -[RMDebounceTimer setMinimumTimer:](self, "setMinimumTimer:", 0);
  -[RMDebounceTimer maximumTimer](self, "maximumTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

  -[RMDebounceTimer setMaximumTimer:](self, "setMaximumTimer:", 0);
  -[RMDebounceTimer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "triggerAggregatingTimerAction");

}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)minimumInterval
{
  return self->_minimumInterval;
}

- (void)setMinimumInterval:(double)a3
{
  self->_minimumInterval = a3;
}

- (double)maximumInterval
{
  return self->_maximumInterval;
}

- (void)setMaximumInterval:(double)a3
{
  self->_maximumInterval = a3;
}

- (RMTimedDispatch)minimumTimer
{
  return (RMTimedDispatch *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMinimumTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (RMTimedDispatch)maximumTimer
{
  return (RMTimedDispatch *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMaximumTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)lastTimerID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastTimerID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (RMDebounceTimerDelegate)delegate
{
  return (RMDebounceTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastTimerID, 0);
  objc_storeStrong((id *)&self->_maximumTimer, 0);
  objc_storeStrong((id *)&self->_minimumTimer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __26__RMDebounceTimer_trigger__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_21885E000, a1, a3, "Debounce ignoring cancelled minimum timer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_1();
}

void __26__RMDebounceTimer_trigger__block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_1(&dword_21885E000, a2, a3, "Debounce execute minimum timer: %{public}@", (uint8_t *)a2);

}

void __26__RMDebounceTimer_trigger__block_invoke_11_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_21885E000, a1, a3, "Debounce ignoring cancelled maximum timer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_1();
}

void __26__RMDebounceTimer_trigger__block_invoke_11_cold_2(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_1(&dword_21885E000, a2, a3, "Debounce execute maximum timer: %{public}@", (uint8_t *)a2);

}

@end
