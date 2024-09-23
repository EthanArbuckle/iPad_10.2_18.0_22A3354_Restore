@implementation SCDAWatchdogTimer

- (void)dealloc
{
  NSObject *timerSource;
  objc_super v4;

  timerSource = self->_timerSource;
  if (timerSource && self->_isStopped)
    dispatch_resume(timerSource);
  v4.receiver = self;
  v4.super_class = (Class)SCDAWatchdogTimer;
  -[SCDAWatchdogTimer dealloc](&v4, sel_dealloc);
}

- (SCDAWatchdogTimer)initWithTimeoutInterval:(double)a3 onQueue:(id)a4 timeoutHandler:(id)a5
{
  id v9;
  id v10;
  SCDAWatchdogTimer *v11;
  SCDAWatchdogTimer *v12;
  uint64_t v13;
  id timeoutHandler;
  dispatch_source_t v15;
  OS_dispatch_source *timerSource;
  NSObject *v17;
  _QWORD handler[4];
  id v20;
  id v21;
  id location;
  objc_super v23;

  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SCDAWatchdogTimer;
  v11 = -[SCDAWatchdogTimer init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_interval = a3;
    v11->_remainingInterval = a3;
    objc_storeStrong((id *)&v11->_queue, a4);
    v13 = MEMORY[0x249555380](v10);
    timeoutHandler = v12->_timeoutHandler;
    v12->_timeoutHandler = (id)v13;

    v15 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v12->_queue);
    timerSource = v12->_timerSource;
    v12->_timerSource = (OS_dispatch_source *)v15;

    v12->_timerLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v12);
    v17 = v12->_timerSource;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __68__SCDAWatchdogTimer_initWithTimeoutInterval_onQueue_timeoutHandler___block_invoke;
    handler[3] = &unk_25174A5B8;
    objc_copyWeak(&v21, &location);
    v20 = v10;
    dispatch_source_set_event_handler(v17, handler);
    v12->_isStopped = 1;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTimeoutInterval:onQueue:timeoutHandler:", self->_queue, self->_timeoutHandler, self->_interval);
}

- (void)start
{
  os_unfair_lock_s *p_timerLock;
  NSObject *timerSource;
  dispatch_time_t v5;
  void *v6;
  double v7;

  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  if (self->_isStopped)
  {
    timerSource = self->_timerSource;
    v5 = dispatch_time(0, (uint64_t)(self->_remainingInterval * 1000000000.0));
    dispatch_source_set_timer(timerSource, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_timerSource);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemUptime");
    self->_startTime = v7;

    self->_isStopped = 0;
  }
  os_unfair_lock_unlock(p_timerLock);
}

- (void)stop
{
  os_unfair_lock_s *p_timerLock;
  void *v4;
  double v5;
  double v6;
  double v7;

  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  if (!self->_isStopped)
  {
    dispatch_suspend((dispatch_object_t)self->_timerSource);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemUptime");
    v6 = v5 - self->_startTime;

    v7 = self->_interval - v6;
    if (v7 < 0.0)
      v7 = 0.0;
    self->_remainingInterval = v7;
    self->_isStopped = 1;
  }
  os_unfair_lock_unlock(p_timerLock);
}

- (BOOL)isStopped
{
  return self->_isStopped;
}

- (void)cancel
{
  os_unfair_lock_s *p_timerLock;

  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  dispatch_source_cancel((dispatch_source_t)self->_timerSource);
  if (self->_isStopped)
  {
    dispatch_resume((dispatch_object_t)self->_timerSource);
    self->_isStopped = 0;
  }
  os_unfair_lock_unlock(p_timerLock);
}

- (BOOL)cancelIfNotAlreadyCanceled
{
  intptr_t v3;

  v3 = dispatch_source_testcancel((dispatch_source_t)self->_timerSource);
  if (!v3)
    -[SCDAWatchdogTimer cancel](self, "cancel");
  return v3 == 0;
}

- (void)reset
{
  -[SCDAWatchdogTimer stop](self, "stop");
  self->_remainingInterval = self->_interval;
  -[SCDAWatchdogTimer start](self, "start");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
}

uint64_t __68__SCDAWatchdogTimer_initWithTimeoutInterval_onQueue_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cancelIfNotAlreadyCanceled");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
