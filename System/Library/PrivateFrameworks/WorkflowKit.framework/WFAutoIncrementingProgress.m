@implementation WFAutoIncrementingProgress

- (WFAutoIncrementingProgress)initWithParent:(id)a3 pendingUnitCount:(unint64_t)a4 duration:(double)a5
{
  id v8;
  WFAutoIncrementingProgress *v9;
  WFAutoIncrementingProgress *v10;
  WFAutoIncrementingProgress *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFAutoIncrementingProgress;
  v9 = -[WFAutoIncrementingProgress initWithParent:userInfo:](&v13, sel_initWithParent_userInfo_, 0, 0);
  v10 = v9;
  if (v9)
  {
    v9->_duration = a5;
    -[WFAutoIncrementingProgress setTotalUnitCount:](v9, "setTotalUnitCount:", (uint64_t)(a5 / 0.1));
    objc_msgSend(v8, "addChild:withPendingUnitCount:", v10, a4);
    v11 = v10;
  }

  return v10;
}

- (void)start
{
  void *v3;
  double v4;
  const dispatch_source_type_s *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  double v10;
  dispatch_time_t v11;
  OS_dispatch_source *progressTimer;
  NSObject *v13;
  OS_dispatch_source *timer;
  NSObject *v15;
  _QWORD v16[5];
  _QWORD handler[5];

  -[WFAutoIncrementingProgress timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[WFAutoIncrementingProgress duration](self, "duration");
    if (v4 != 0.0)
    {
      v5 = (const dispatch_source_type_s *)MEMORY[0x1E0C80DD0];
      v6 = MEMORY[0x1E0C80D38];
      v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      dispatch_source_set_timer(v7, 0, 0x5F5E100uLL, 0x1DCD6500uLL);
      v8 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __35__WFAutoIncrementingProgress_start__block_invoke;
      handler[3] = &unk_1E7AF94B0;
      handler[4] = self;
      dispatch_source_set_event_handler(v7, handler);
      v9 = dispatch_source_create(v5, 0, 0, v6);

      -[WFAutoIncrementingProgress duration](self, "duration");
      v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
      dispatch_source_set_timer(v9, v11, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __35__WFAutoIncrementingProgress_start__block_invoke_2;
      v16[3] = &unk_1E7AF94B0;
      v16[4] = self;
      dispatch_source_set_event_handler(v9, v16);
      progressTimer = self->_progressTimer;
      self->_progressTimer = (OS_dispatch_source *)v7;
      v13 = v7;

      timer = self->_timer;
      self->_timer = (OS_dispatch_source *)v9;
      v15 = v9;

      dispatch_resume(v13);
      dispatch_resume(v15);

    }
  }
}

- (void)cancel
{
  NSObject *timer;
  OS_dispatch_source *v4;
  NSObject *progressTimer;
  OS_dispatch_source *v6;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel(progressTimer);
    v6 = self->_progressTimer;
    self->_progressTimer = 0;

  }
}

- (void)finish
{
  -[WFAutoIncrementingProgress cancel](self, "cancel");
  -[WFAutoIncrementingProgress setCompletedUnitCount:](self, "setCompletedUnitCount:", -[WFAutoIncrementingProgress totalUnitCount](self, "totalUnitCount"));
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)increments
{
  return self->_increments;
}

- (OS_dispatch_source)progressTimer
{
  return self->_progressTimer;
}

- (void)setProgressTimer:(id)a3
{
  objc_storeStrong((id *)&self->_progressTimer, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
}

uint64_t __35__WFAutoIncrementingProgress_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
}

uint64_t __35__WFAutoIncrementingProgress_start__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

@end
