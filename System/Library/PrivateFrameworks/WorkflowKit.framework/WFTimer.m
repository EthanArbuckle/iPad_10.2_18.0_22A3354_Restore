@implementation WFTimer

- (WFTimer)initWithHandler:(id)a3 duration:(double)a4
{
  id v7;
  WFTimer *v8;
  WFTimer *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *timerQueue;
  WFTimer *v13;
  void *v15;
  objc_super v16;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTimer.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v16.receiver = self;
  v16.super_class = (Class)WFTimer;
  v8 = -[WFTimer init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_handler, v7);
    v9->_duration = a4;
    dispatch_get_global_queue(21, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create_with_target_V2("com.apple.WorkflowKit.WFTimer", 0, v10);
    timerQueue = v9->_timerQueue;
    v9->_timerQueue = (OS_dispatch_queue *)v11;

    v13 = v9;
  }

  return v9;
}

- (void)start
{
  NSObject *v3;
  dispatch_source_t v4;
  double v5;
  double v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  if (-[WFTimer shouldHaveTimeout](self, "shouldHaveTimeout"))
  {
    objc_initWeak(&location, self);
    -[WFTimer timerQueue](self, "timerQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
    -[WFTimer setTimeoutTimer:](self, "setTimeoutTimer:", v4);

    -[WFTimer duration](self, "duration");
    v6 = v5;
    -[WFTimer timeoutTimer](self, "timeoutTimer");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_source_set_timer(v7, v8, (uint64_t)(v6 * 1000000000.0), 0x3B9ACA00uLL);

    -[WFTimer timeoutTimer](self, "timeoutTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __16__WFTimer_start__block_invoke;
    v14 = &unk_1E7AF5510;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v9, &v11);

    -[WFTimer timeoutTimer](self, "timeoutTimer", v11, v12, v13, v14);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v10);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)restart
{
  -[WFTimer cancel](self, "cancel");
  -[WFTimer start](self, "start");
}

- (void)cancel
{
  void *v3;
  NSObject *v4;

  -[WFTimer timeoutTimer](self, "timeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFTimer timeoutTimer](self, "timeoutTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[WFTimer setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  }
}

- (BOOL)shouldHaveTimeout
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[WFTimer handler](self, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 1;
  -[WFTimer handler](self, "handler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "timerShouldStart:", self);

  return v6;
}

- (WFTimerHandler)handler
{
  return (WFTimerHandler *)objc_loadWeakRetained((id *)&self->_handler);
}

- (double)duration
{
  return self->_duration;
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void)setTimerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_timerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_destroyWeak((id *)&self->_handler);
}

void __16__WFTimer_start__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "timerDidFire:", WeakRetained);

}

@end
