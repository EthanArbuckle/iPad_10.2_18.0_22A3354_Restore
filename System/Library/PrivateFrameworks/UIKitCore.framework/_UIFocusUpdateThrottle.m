@implementation _UIFocusUpdateThrottle

- (_UIFocusUpdateThrottle)initWithUpdateHandler:(id)a3
{
  id v5;
  _UIFocusUpdateThrottle *v6;
  _UIFocusUpdateThrottle *v7;
  void *v8;
  id updateHandler;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusUpdateThrottle.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateHandler"));

  }
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusUpdateThrottle;
  v6 = -[_UIFocusUpdateThrottle init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_currentTimeout = 0.0166666667;
    v8 = _Block_copy(v5);
    updateHandler = v7->_updateHandler;
    v7->_updateHandler = v8;

  }
  return v7;
}

- (void)teardown
{
  NSTimer **p_updateTimer;
  id WeakRetained;
  id v5;
  _QWORD v6[5];

  p_updateTimer = &self->_updateTimer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_updateTimer);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_updateTimer);
    objc_msgSend(v5, "invalidate");

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34___UIFocusUpdateThrottle_teardown__block_invoke;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v6);
  }
}

- (void)scheduleProgrammaticFocusUpdate
{
  double lastUpdate;
  double currentTimeout;
  double Current;
  double v6;
  unint64_t v7;
  void *v8;
  NSTimer **p_updateTimer;
  id WeakRetained;
  NSObject *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_updateIsScheduled)
  {
    self->_updateIsScheduled = 1;
    lastUpdate = self->_lastUpdate;
    currentTimeout = self->_currentTimeout;
    Current = CFAbsoluteTimeGetCurrent();
    if (self->_nilUpdateCount && (v6 = lastUpdate + currentTimeout - Current, v6 >= 0.0166666667))
    {
      v7 = scheduleProgrammaticFocusUpdate___s_category[0];
      if (!scheduleProgrammaticFocusUpdate___s_category[0])
      {
        v7 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, scheduleProgrammaticFocusUpdate___s_category);
      }
      if ((*(_BYTE *)v7 & 1) != 0)
      {
        v11 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v14 = v6;
          _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Delaying focus update for %.2g seconds due to too many failed focus updates.", buf, 0xCu);
        }
      }
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__performScheduledUpdate, 0, 0, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      p_updateTimer = &self->_updateTimer;
      objc_storeWeak((id *)p_updateTimer, v8);

      WeakRetained = objc_loadWeakRetained((id *)p_updateTimer);
      objc_msgSend(WeakRetained, "setTolerance:", 0.0166666667);

    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __57___UIFocusUpdateThrottle_scheduleProgrammaticFocusUpdate__block_invoke;
      v12[3] = &unk_1E16B1B28;
      v12[4] = self;
      objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v12);
    }
  }
}

- (void)didCreateProgrammaticFocusUpdateContext:(id)a3
{
  id v4;
  void *v5;
  double currentTimeout;
  unint64_t v7;
  NSObject *v8;
  double v9;
  unint64_t nilUpdateCount;
  int v11;
  double v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_lastUpdate = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v4, "nextFocusedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self->_nilUpdateCount = 0;
    self->_currentTimeout = 0.0166666667;
  }
  else
  {
    ++self->_nilUpdateCount;
    currentTimeout = self->_currentTimeout;
    if (currentTimeout < 1.0)
    {
      self->_currentTimeout = fmin(currentTimeout * 1.3, 1.0);
      v7 = didCreateProgrammaticFocusUpdateContext____s_category;
      if (!didCreateProgrammaticFocusUpdateContext____s_category)
      {
        v7 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&didCreateProgrammaticFocusUpdateContext____s_category);
      }
      if ((*(_BYTE *)v7 & 1) != 0)
      {
        v8 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = self->_currentTimeout;
          nilUpdateCount = self->_nilUpdateCount;
          v11 = 134218240;
          v12 = v9;
          v13 = 2048;
          v14 = nilUpdateCount;
          _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Encountered a programmatic focus update to a nil environment. Increasing cooldown period for programmatic focus updates to %.2g due to %lu failed focus updates.", (uint8_t *)&v11, 0x16u);
        }
      }
    }
  }
}

- (void)_performScheduledUpdate
{
  id WeakRetained;

  if (self->_updateIsScheduled)
  {
    self->_updateIsScheduled = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_updateTimer);
    objc_msgSend(WeakRetained, "invalidate");

    (*((void (**)(void))self->_updateHandler + 2))();
  }
}

- (void)reset
{
  _QWORD v2[5];

  self->_nilUpdateCount = 0;
  self->_currentTimeout = 0.0166666667;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __31___UIFocusUpdateThrottle_reset__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v2);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_destroyWeak((id *)&self->_updateTimer);
}

@end
