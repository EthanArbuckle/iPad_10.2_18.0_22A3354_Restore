@implementation WBSDispatchSourceTimer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

+ (id)timerWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 handler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStartDelay:interval:repeats:queue:handler:", v7, v11, v10, a3, a3);

  return v12;
}

- (WBSDispatchSourceTimer)initWithStartDelay:(double)a3 interval:(double)a4 repeats:(BOOL)a5 queue:(id)a6 handler:(id)a7
{
  id v13;
  id v14;
  WBSDispatchSourceTimer *v15;
  WBSDispatchSourceTimer *v16;
  uint64_t v17;
  id handler;
  WBSDispatchSourceTimer *v19;
  objc_super v21;

  v13 = a6;
  v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)WBSDispatchSourceTimer;
  v15 = -[WBSDispatchSourceTimer init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    v15->_interval = a4;
    v15->_startDelay = a3;
    v15->_repeats = a5;
    objc_storeStrong((id *)&v15->_queue, a6);
    v17 = MEMORY[0x1A8599ED0](v14);
    handler = v16->_handler;
    v16->_handler = (id)v17;

    v19 = v16;
  }

  return v16;
}

- (void)schedule
{
  os_unfair_lock_s *p_lock;
  OS_dispatch_source *v4;
  OS_dispatch_source *timer;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_timer)
  {
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    timer = self->_timer;
    self->_timer = v4;

    objc_initWeak(&location, self);
    v6 = self->_timer;
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __34__WBSDispatchSourceTimer_schedule__block_invoke;
    v10 = &unk_1E4B2BC78;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v6, &v7);
    -[WBSDispatchSourceTimer _scheduleTimer](self, "_scheduleTimer", v7, v8, v9, v10);
    dispatch_activate((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_scheduleTimer
{
  NSObject *timer;
  dispatch_time_t v4;

  os_unfair_lock_assert_owner(&self->_lock);
  timer = self->_timer;
  if (timer)
  {
    v4 = dispatch_time(0, (uint64_t)(self->_startDelay * 1000000000.0));
    dispatch_source_set_timer(timer, v4, (unint64_t)(self->_interval * 1000000000.0), (unint64_t)(self->_startDelay * 0.1 * 1000000000.0));
  }
}

void __34__WBSDispatchSourceTimer_schedule__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void (**v2)(void);
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if ((objc_msgSend(WeakRetained, "repeats") & 1) == 0)
      objc_msgSend(v3, "invalidate");
    objc_msgSend(v3, "handler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

    WeakRetained = v3;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[WBSDispatchSourceTimer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WBSDispatchSourceTimer;
  -[WBSDispatchSourceTimer dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSObject *timer;
  OS_dispatch_source *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v5 = self->_timer;
    self->_timer = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (id)handler
{
  return self->_handler;
}

+ (id)scheduledTimerWithInterval:(double)a3 repeats:(BOOL)a4 handler:(id)a5
{
  void *v5;

  objc_msgSend(a1, "timerWithInterval:repeats:queue:handler:", a4, MEMORY[0x1E0C80D38], a5, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "schedule");
  return v5;
}

+ (id)scheduledTimerWithInterval:(double)a3 repeats:(BOOL)a4 queue:(id)a5 handler:(id)a6
{
  void *v6;

  objc_msgSend(a1, "timerWithInterval:repeats:queue:handler:", a4, a5, a6, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "schedule");
  return v6;
}

+ (id)scheduledRepeatingTimerWithStartDelay:(double)a3 interval:(double)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = objc_alloc((Class)a1);
  v10 = (void *)objc_msgSend(v9, "initWithStartDelay:interval:repeats:queue:handler:", 1, MEMORY[0x1E0C80D38], v8, a3, a4);

  objc_msgSend(v10, "schedule");
  return v10;
}

- (BOOL)isValid
{
  os_unfair_lock_s *p_lock;
  OS_dispatch_source *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_timer;
  os_unfair_lock_unlock(p_lock);

  return v4 != 0;
}

- (void)resetFireDate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WBSDispatchSourceTimer _scheduleTimer](self, "_scheduleTimer");
  os_unfair_lock_unlock(p_lock);
}

- (double)interval
{
  return self->_interval;
}

- (double)startDelay
{
  return self->_startDelay;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

@end
