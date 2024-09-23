@implementation PLDelayedActionTimer

- (PLDelayedActionTimer)initWithTargetQueue:(id)a3
{
  id v6;
  PLDelayedActionTimer *v7;
  PLDelayedActionTimer *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDelayedActionTimer.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PLDelayedActionTimer;
  v7 = -[PLDelayedActionTimer init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_timerQueue, a3);

  return v8;
}

- (void)dealloc
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timer;
  objc_super v5;

  v3 = self->_timer;
  timer = self->_timer;
  self->_timer = 0;

  if (v3)
    dispatch_source_cancel((dispatch_source_t)v3);

  v5.receiver = self;
  v5.super_class = (Class)PLDelayedActionTimer;
  -[PLDelayedActionTimer dealloc](&v5, sel_dealloc);
}

- (id)description
{
  OS_dispatch_source *timer;
  void *v4;
  OS_dispatch_source *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v12;
  objc_super v13;

  timer = self->_timer;
  if (timer)
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    v5 = timer;
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v7 = self->_start - v6;
    v8 = self->_end - v6;
    v13.receiver = self;
    v13.super_class = (Class)PLDelayedActionTimer;
    -[PLDelayedActionTimer description](&v13, sel_description);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("(0x%p s:%3.3f e:%3.3f)"), v5, *(_QWORD *)&v7, *(_QWORD *)&v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLDelayedActionTimer;
    -[PLDelayedActionTimer description](&v12, sel_description);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("(not running)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  NSObject *v7;
  OS_dispatch_source *timer;
  double v9;
  NSObject *v10;
  OS_dispatch_source *v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  PLDelayedActionTimer *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  OS_dispatch_source *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_timerQueue);
  if (self->_timer)
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      timer = self->_timer;
      *(_DWORD *)buf = 134217984;
      v22 = timer;
      _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_DEFAULT, "ignoring request to start timer while timer is active 0x%p", buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_start = v9;
    self->_delay = a3;
    self->_end = v9 + a3;
    v10 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_timerQueue);
    v11 = self->_timer;
    self->_timer = (OS_dispatch_source *)v10;

    v12 = self->_timer;
    v13 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak((id *)buf, self);
    v14 = self->_timer;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __48__PLDelayedActionTimer_afterDelay_performBlock___block_invoke;
    v16[3] = &unk_1E3768838;
    v17 = v10;
    v18 = self;
    v15 = v10;
    objc_copyWeak(&v20, (id *)buf);
    v19 = v6;
    dispatch_source_set_event_handler(v14, v16);
    dispatch_resume((dispatch_object_t)self->_timer);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

}

- (void)cancel
{
  OS_dispatch_source *timer;
  NSObject *v4;
  dispatch_source_t source;
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_timerQueue);
  timer = self->_timer;
  if (timer)
  {
    self->_timer = 0;
    source = timer;

    dispatch_source_cancel(source);
  }
  else
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_DEFAULT, "ignoring request to cancel inactive timer", buf, 2u);
    }

  }
}

- (OS_dispatch_queue)targetQueue
{
  return self->_timerQueue;
}

- (BOOL)isRunning
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_timerQueue);
  return self->_timer != 0;
}

- (double)timeRemaining
{
  double v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_timerQueue);
  if (!self->_timer)
    return 0.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return self->_end - v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
}

uint64_t __48__PLDelayedActionTimer_afterDelay_performBlock___block_invoke(uint64_t result)
{
  uint64_t v1;
  id WeakRetained;

  if (*(_QWORD *)(result + 32) == *(_QWORD *)(*(_QWORD *)(result + 40) + 16))
  {
    v1 = result;
    WeakRetained = objc_loadWeakRetained((id *)(result + 56));
    objc_msgSend(WeakRetained, "cancel");

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
  }
  return result;
}

@end
