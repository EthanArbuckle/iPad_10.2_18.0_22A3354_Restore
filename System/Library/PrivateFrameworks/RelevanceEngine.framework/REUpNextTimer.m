@implementation REUpNextTimer

+ (REUpNextTimer)timerWithInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  return (REUpNextTimer *)objc_msgSend(a1, "timerWithFireInterval:atRate:queue:block:", 0, a4, a5, a3);
}

+ (REUpNextTimer)timerWithFireDate:(id)a3 queue:(id)a4 block:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (objc_class *)MEMORY[0x24BDD1508];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithStartDate:duration:", v11, 0.0);

  objc_msgSend(a1, "timerWithFireInterval:atRate:queue:block:", v12, v10, v9, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (REUpNextTimer *)v13;
}

+ (REUpNextTimer)timerWithFireInterval:(id)a3 atRate:(double)a4 queue:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDateInterval:rate:queue:block:", v12, v11, v10, a4);

  return (REUpNextTimer *)v13;
}

- (REUpNextTimer)initWithDateInterval:(id)a3 rate:(double)a4 queue:(id)a5 block:(id)a6
{
  id v11;
  NSObject *v12;
  id v13;
  REUpNextTimer *v14;
  REUpNextTimer *v15;
  uint64_t v16;
  id block;
  id v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  dispatch_source_t v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD handler[4];
  id v26;
  id location;
  objc_super v28;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)REUpNextTimer;
  v14 = -[REUpNextTimer init](&v28, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fireInterval, a3);
    v15->_rate = a4;
    v16 = MEMORY[0x2199B2434](v13);
    block = v15->_block;
    v15->_block = (id)v16;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s.RETimer"), dispatch_queue_get_label(v12));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = dispatch_queue_create_with_target_V2((const char *)objc_msgSend(v18, "UTF8String"), 0, v12);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v19;

    v21 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v15->_queue);
    -[REUpNextTimer setDispatch_timer:](v15, "setDispatch_timer:", v21);

    -[REUpNextTimer _scheduleTimerWithInterval:rate:](v15, "_scheduleTimerWithInterval:rate:", v11, a4);
    objc_initWeak(&location, v15);
    -[REUpNextTimer dispatch_timer](v15, "dispatch_timer");
    v22 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __55__REUpNextTimer_initWithDateInterval_rate_queue_block___block_invoke;
    handler[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v22, handler);

    -[REUpNextTimer dispatch_timer](v15, "dispatch_timer");
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  return v15;
}

void __55__REUpNextTimer_initWithDateInterval_rate_queue_block___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleTimer");

}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;

  -[REUpNextTimer dispatch_timer](self, "dispatch_timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[REUpNextTimer dispatch_timer](self, "dispatch_timer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)REUpNextTimer;
  -[REUpNextTimer dealloc](&v5, sel_dealloc);
}

- (BOOL)_isNowRepeatingTimerWithCurrentDate:(id)a3
{
  NSDateInterval *fireInterval;

  fireInterval = self->_fireInterval;
  return !fireInterval || -[NSDateInterval containsDate:](fireInterval, "containsDate:", a3);
}

- (void)_scheduleTimerWithInterval:(id)a3 rate:(double)a4
{
  id v6;
  void *v7;
  NSDate *lastFireDate;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  uint64_t v17;
  double v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;

  v6 = a3;
  if (-[REUpNextTimer isValid](self, "isValid"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[REUpNextTimer _isNowRepeatingTimerWithCurrentDate:](self, "_isNowRepeatingTimerWithCurrentDate:", v7))
    {
      lastFireDate = self->_lastFireDate;
      if (!lastFireDate)
      {
        objc_storeStrong((id *)&self->_lastFireDate, v7);
        lastFireDate = self->_lastFireDate;
      }
      -[NSDate dateByAddingTimeInterval:](lastFireDate, "dateByAddingTimeInterval:", self->_rate);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 1;
    }
    else
    {
      objc_msgSend(v6, "duration");
      v13 = v12;
      v10 = v12 > 2.22044605e-16;
      objc_msgSend(v6, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "earlierDate:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 != v7)
      {
        objc_msgSend(0, "timeIntervalSinceDate:", v7);
        v9 = 0;
        v16 = -1;
        v17 = -1;
        if (v13 <= 2.22044605e-16)
          goto LABEL_30;
        goto LABEL_23;
      }
      objc_msgSend(v6, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "timeIntervalSinceDate:", v7);
    if (v9)
    {
      if (v18 > 0.0)
      {
        if (v18 <= 9223372040.0)
          v19 = (uint64_t)(v18 * 1000000000.0);
        else
          v19 = 0x7FFFFFFFFFFFFFFFLL;
        v16 = dispatch_walltime(0, v19);
        if (!v10)
          goto LABEL_29;
        goto LABEL_23;
      }
      v16 = 0;
    }
    else
    {
      v16 = -1;
    }
    if (!v10)
    {
LABEL_29:
      v17 = -1;
LABEL_30:
      -[REUpNextTimer dispatch_timer](self, "dispatch_timer");
      v26 = objc_claimAutoreleasedReturnValue();
      dispatch_source_set_timer(v26, v16, v17, 0x1DCD6500uLL);

      goto LABEL_31;
    }
LABEL_23:
    if (a4 > 1.84467441e10)
      v17 = -1;
    else
      v17 = (unint64_t)(a4 * 1000000000.0);
    if (v16 == -1 || v17)
      goto LABEL_30;
    objc_msgSend(v6, "duration");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _REGenerateSimulatedCrash(CFSTR("UpNextBadTimerInterval"), CFSTR("About to invoke dispatch with a zero repeat interval. repeats=%d start=%lld [interval duration]=%@ %016llX rate=%f leeway=%llu nextFireDate=%@ now=%@ interval=<<%@>>"), v20, v21, v22, v23, v24, v25, 1);

    goto LABEL_29;
  }
  RELogForDomain(9);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[REUpNextTimer _scheduleTimerWithInterval:rate:].cold.1((uint64_t)self, v11);

LABEL_31:
}

- (void)_handleTimer
{
  NSDate *v3;
  NSDate *lastFireDate;
  NSDateInterval *fireInterval;
  void *v6;
  void *v7;
  uint64_t v8;

  if (self->_block && -[REUpNextTimer isValid](self, "isValid"))
    (*((void (**)(void))self->_block + 2))();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastFireDate = self->_lastFireDate;
  self->_lastFireDate = v3;

  fireInterval = self->_fireInterval;
  if (fireInterval)
  {
    -[NSDateInterval endDate](fireInterval, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "compare:", v7);

    if (v8 == -1)
      -[REUpNextTimer invalidate](self, "invalidate");
  }
}

- (void)_rescheduleTimer
{
  void *v3;
  uint64_t v4;
  id v5;

  if (-[REUpNextTimer isValid](self, "isValid"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[NSDateInterval endDate](self->_fireInterval, "endDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "compare:", v5);

    if (v4 == -1)
      -[REUpNextTimer _handleTimer](self, "_handleTimer");
    else
      -[REUpNextTimer _scheduleTimerWithInterval:rate:](self, "_scheduleTimerWithInterval:rate:", self->_fireInterval, self->_rate);

  }
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[REUpNextTimer dispatch_timer](self, "dispatch_timer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__REUpNextTimer_invalidate__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __27__REUpNextTimer_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "dispatch_timer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dispatch_timer");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

    objc_msgSend(*(id *)(a1 + 32), "setDispatch_timer:", 0);
  }
}

- (NSDateInterval)fireInterval
{
  return self->_fireInterval;
}

- (double)rate
{
  return self->_rate;
}

- (id)block
{
  return self->_block;
}

- (OS_dispatch_source)dispatch_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDispatch_timer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatch_timer, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_fireInterval, 0);
  objc_storeStrong((id *)&self->_lastFireDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_scheduleTimerWithInterval:(uint64_t)a1 rate:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "Trying to schedule invalid timer %@", (uint8_t *)&v2, 0xCu);
}

@end
