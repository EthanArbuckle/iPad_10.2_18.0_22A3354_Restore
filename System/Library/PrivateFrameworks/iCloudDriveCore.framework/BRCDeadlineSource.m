@implementation BRCDeadlineSource

- (BRCDeadlineSource)initWithScheduler:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  BRCDeadlineSource *v8;
  BRCDeadlineSource *v9;
  void *v10;
  uint64_t v11;
  OS_dispatch_workloop *workloop;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BRCDeadlineSource;
  v8 = -[BRCDeadlineSource init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scheduler, v6);
    objc_msgSend(v6, "fairScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "workloop");
    v11 = objc_claimAutoreleasedReturnValue();
    workloop = v9->_workloop;
    v9->_workloop = (OS_dispatch_workloop *)v11;

    v9->_deadline = 0x7FFFFFFFFFFFFFFFLL;
    v9->_suspendCount = 1;
    objc_storeStrong((id *)&v9->_name, a4);
  }

  return v9;
}

- (id)description
{
  int64_t deadline;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  deadline = self->_deadline;
  brc_current_date_nsec();
  if ((brc_is_before_deadline() & 1) != 0)
  {
    v4 = CFSTR("ready");
  }
  else if (deadline == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = CFSTR("idle");
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    brc_interval_from_nsec();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("ready in %.3fs"), v6);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<deadline %@: %@>"), self->_name, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)suspend
{
  BRCDeadlineSource *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_suspendCount;
  objc_sync_exit(obj);

}

- (void)resume
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _suspendCount >= 0%@", (uint8_t *)&v2, 0xCu);
}

- (void)cancel
{
  BRCDeadlineSource *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_cancelled = 1;
  objc_sync_exit(obj);

}

- (BOOL)willRunEvenHandler
{
  BRCDeadlineSource *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_suspendCount <= 0 && !v2->_cancelled;
  objc_sync_exit(v2);

  return v3;
}

- (void)runEventHandler
{
  BRCDeadlineSource *v3;
  void (**obj)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workloop);
  obj = (void (**)(void))objc_loadWeakRetained((id *)&self->_scheduler);
  objc_sync_enter(obj);
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_suspendCount > 0 || v3->_cancelled)
  {
    v3->_signaled = 1;
    v3->_deadline = 0;
    objc_sync_exit(v3);

    objc_sync_exit(obj);
  }
  else
  {
    v3->_signaled = 0;
    v3->_deadline = 0x7FFFFFFFFFFFFFFFLL;
    objc_sync_exit(v3);

    objc_sync_exit(obj);
    -[BRCDeadlineSource eventHandler](v3, "eventHandler");
    obj = (void (**)(void))objc_claimAutoreleasedReturnValue();
    obj[2]();
  }

}

- (void)signalWithDeadline:(int64_t)a3
{
  id WeakRetained;
  id v6;
  BRCDeadlineSource *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scheduler);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v6 = WeakRetained;
    objc_sync_enter(v6);
    v7 = self;
    objc_sync_enter(v7);
    v7->_signaled = 1;
    objc_sync_exit(v7);

    if (v7->_deadline >= a3)
    {
      v7->_deadline = a3;
      objc_msgSend(v6, "addSource:deadline:", v7, a3);
    }
    objc_sync_exit(v6);

    WeakRetained = v8;
  }

}

- (void)signal
{
  -[BRCDeadlineSource signalWithDeadline:](self, "signalWithDeadline:", 0);
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)setWorkloop:(id)a3
{
  objc_storeStrong((id *)&self->_workloop, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_scheduler);
}

@end
