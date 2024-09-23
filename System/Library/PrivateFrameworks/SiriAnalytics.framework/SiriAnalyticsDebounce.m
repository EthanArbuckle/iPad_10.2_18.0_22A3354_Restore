@implementation SiriAnalyticsDebounce

- (SiriAnalyticsDebounce)initWithDebounceInterval:(double)a3 queue:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  SiriAnalyticsDebounce *v11;
  SiriAnalyticsDebounce *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SiriAnalyticsDebounce;
  v11 = -[SiriAnalyticsDebounce init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a4);
    v12->_debounceInterval = a3;
    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

- (SiriAnalyticsDebounce)initWithDebounceInterval:(double)a3 maximumInterval:(double)a4 queue:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  SiriAnalyticsDebounce *v13;
  SiriAnalyticsDebounce *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SiriAnalyticsDebounce;
  v13 = -[SiriAnalyticsDebounce init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a5);
    v14->_debounceInterval = a3;
    v14->_maximumInterval = a4;
    v14->_hasMaximumInterval = 1;
    objc_storeWeak((id *)&v14->_delegate, v12);
  }

  return v14;
}

- (void)pulse
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SiriAnalyticsDebounce_pulse__block_invoke;
  block[3] = &unk_1E4357B10;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancel
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SiriAnalyticsDebounce_cancel__block_invoke;
  block[3] = &unk_1E4357B10;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_pulse
{
  double debounceInterval;
  NSObject *queue;
  uint64_t v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *debounceTimer;
  double maximumInterval;
  NSObject *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *maximumTimer;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  objc_initWeak(&location, self);
  debounceInterval = self->_debounceInterval;
  queue = self->_queue;
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __31__SiriAnalyticsDebounce__pulse__block_invoke;
  v14[3] = &unk_1E4357B38;
  objc_copyWeak(&v15, &location);
  SiriAnalyticsCreateFireOnceTimer(queue, v14, debounceInterval);
  v6 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
  debounceTimer = self->_debounceTimer;
  self->_debounceTimer = v6;

  dispatch_resume((dispatch_object_t)self->_debounceTimer);
  if (self->_hasMaximumInterval && !self->_maximumTimer)
  {
    maximumInterval = self->_maximumInterval;
    v9 = self->_queue;
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __31__SiriAnalyticsDebounce__pulse__block_invoke_2;
    v12[3] = &unk_1E4357B38;
    objc_copyWeak(&v13, &location);
    SiriAnalyticsCreateFireOnceTimer(v9, v12, maximumInterval);
    v10 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
    maximumTimer = self->_maximumTimer;
    self->_maximumTimer = v10;

    dispatch_resume((dispatch_object_t)self->_maximumTimer);
    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_debounceFired
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v3 = SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[SiriAnalyticsDebounce _debounceFired]";
    _os_log_debug_impl(&dword_1A025F000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  -[SiriAnalyticsDebounce _reset](self, "_reset");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "debounceFired:maximumReached:", self, 0);

}

- (void)_timedOut
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v3 = SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[SiriAnalyticsDebounce _timedOut]";
    _os_log_debug_impl(&dword_1A025F000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  -[SiriAnalyticsDebounce _reset](self, "_reset");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "debounceFired:maximumReached:", self, 1);

}

- (void)_reset
{
  NSObject *v3;
  NSObject *debounceTimer;
  OS_dispatch_source *v5;
  NSObject *maximumTimer;
  OS_dispatch_source *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v3 = SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315138;
    v9 = "-[SiriAnalyticsDebounce _reset]";
    _os_log_debug_impl(&dword_1A025F000, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v8, 0xCu);
  }
  debounceTimer = self->_debounceTimer;
  if (debounceTimer)
  {
    dispatch_source_cancel(debounceTimer);
    v5 = self->_debounceTimer;
    self->_debounceTimer = 0;

  }
  maximumTimer = self->_maximumTimer;
  if (maximumTimer)
  {
    dispatch_source_cancel(maximumTimer);
    v7 = self->_maximumTimer;
    self->_maximumTimer = 0;

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_maximumTimer, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __31__SiriAnalyticsDebounce__pulse__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_debounceFired");

}

void __31__SiriAnalyticsDebounce__pulse__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timedOut");

}

uint64_t __31__SiriAnalyticsDebounce_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

uint64_t __30__SiriAnalyticsDebounce_pulse__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pulse");
}

@end
