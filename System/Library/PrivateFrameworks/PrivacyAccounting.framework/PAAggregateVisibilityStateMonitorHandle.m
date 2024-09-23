@implementation PAAggregateVisibilityStateMonitorHandle

- (PAAggregateVisibilityStateMonitorHandle)initWithStartupInterval:(double)a3 onQueue:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  PAAggregateVisibilityStateMonitorHandle *v11;
  uint64_t v12;
  NSMutableDictionary *states;
  dispatch_source_t v14;
  OS_dispatch_source *startupTimer;
  NSObject *v16;
  dispatch_time_t v17;
  NSObject *v18;
  PAAggregateVisibilityStateMonitorHandle *v19;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PAAggregateVisibilityStateMonitorHandle;
  v11 = -[PAAggregateVisibilityStateMonitorHandle init](&v24, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    states = v11->_states;
    v11->_states = (NSMutableDictionary *)v12;

    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v11->_queue, a4);
    v11->_currentState = 0;
    if (a3 <= 0.0)
    {
      v11->_startupPeriodElapsed = 1;
    }
    else
    {
      objc_initWeak(&location, v11);
      v14 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v11->_queue);
      startupTimer = v11->_startupTimer;
      v11->_startupTimer = (OS_dispatch_source *)v14;

      v16 = v11->_startupTimer;
      v17 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
      dispatch_source_set_timer(v16, v17, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a3 * 1000000000.0) >> 2);
      v18 = v11->_startupTimer;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __84__PAAggregateVisibilityStateMonitorHandle_initWithStartupInterval_onQueue_delegate___block_invoke;
      v21[3] = &unk_1E4FA4C50;
      objc_copyWeak(&v22, &location);
      dispatch_source_set_event_handler(v18, v21);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    v19 = v11;
  }

  return v11;
}

void __84__PAAggregateVisibilityStateMonitorHandle_initWithStartupInterval_onQueue_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "startupIntervalExpired");

}

- (void)bindToRawHandle:(id)a3
{
  NSObject *startupTimer;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_rawHandle, a3);
  startupTimer = self->_startupTimer;
  if (startupTimer)
    dispatch_activate(startupTimer);

}

- (void)startupIntervalExpired
{
  OS_dispatch_source *startupTimer;
  id WeakRetained;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_source_cancel((dispatch_source_t)self->_startupTimer);
  startupTimer = self->_startupTimer;
  self->_startupTimer = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "setVisibilityState:", self->_currentState);

  self->_startupPeriodElapsed = 1;
  -[PAAggregateVisibilityStateMonitorHandle recomputeCurrentState](self, "recomputeCurrentState");
}

- (void)setVisibilityState:(int64_t)a3 forBundleID:(id)a4
{
  NSObject *queue;
  id v7;
  void *v8;

  queue = self->_queue;
  v7 = a4;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_states, "setObject:forKeyedSubscript:", v8, v7);

  -[PAAggregateVisibilityStateMonitorHandle recomputeCurrentState](self, "recomputeCurrentState");
}

- (void)recomputeCurrentState
{
  int64_t currentState;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  id WeakRetained;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  currentState = self->_currentState;
  v4 = self->_states;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_states, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "integerValue");
        if (v11 > v7)
          v7 = v11;

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  if (self->_startupPeriodElapsed)
  {
    self->_currentState = v7;
    if (currentState != v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "setVisibilityState:", v7);

    }
  }
  else if (v7 > currentState)
  {
    self->_currentState = v7;
  }
}

- (void)invalidate
{
  NSObject *startupTimer;
  OS_dispatch_source *v4;
  NSMutableDictionary *states;
  PAProcessStateMonitoringEnding *rawHandle;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  startupTimer = self->_startupTimer;
  if (startupTimer)
  {
    dispatch_source_cancel(startupTimer);
    v4 = self->_startupTimer;
    self->_startupTimer = 0;

  }
  objc_storeWeak((id *)&self->_delegate, 0);
  states = self->_states;
  self->_states = 0;

  -[PAProcessStateMonitoringEnding invalidate](self->_rawHandle, "invalidate");
  rawHandle = self->_rawHandle;
  self->_rawHandle = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_startupTimer, 0);
}

@end
