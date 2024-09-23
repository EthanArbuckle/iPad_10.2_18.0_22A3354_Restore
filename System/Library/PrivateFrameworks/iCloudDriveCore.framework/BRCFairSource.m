@implementation BRCFairSource

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)signal
{
  BRCFairSource *v2;
  int suspendCount;
  id WeakRetained;

  v2 = self;
  objc_sync_enter(v2);
  v2->_signaled = 1;
  suspendCount = v2->_suspendCount;
  objc_sync_exit(v2);

  if (suspendCount <= 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v2->_scheduler);
    objc_msgSend(WeakRetained, "signalSourceForBitIndex:", v2->_schedulerBitIndex);

  }
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)_runEventHandler
{
  BRCFairSource *obj;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workloop);
  obj = self;
  objc_sync_enter(obj);
  if (obj->_suspendCount > 0 || obj->_cancelled)
  {
    objc_sync_exit(obj);
  }
  else
  {
    obj->_signaled = 0;
    objc_sync_exit(obj);

    -[BRCFairSource eventHandler](obj, "eventHandler");
    obj = (BRCFairSource *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void))obj->_name)();
  }

}

- (BRCFairSource)initWithName:(id)a3 scheduler:(id)a4
{
  id v7;
  id v8;
  BRCFairSource *v9;
  BRCFairSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCFairSource;
  v9 = -[BRCFairSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeWeak((id *)&v10->_scheduler, v8);
    objc_msgSend(v8, "addSource:", v10);
    v10->_suspendCount = 1;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *name;
  NSObject *workloop;
  const char *label;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  name = self->_name;
  workloop = self->_workloop;
  if (workloop)
    label = dispatch_queue_get_label(workloop);
  else
    label = "(no-queue)";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ on:%s>"), v4, self, name, label);
}

- (void)cancel
{
  BRCFairSource *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_cancelled = 1;
  objc_sync_exit(obj);

}

- (void)suspend
{
  BRCFairSource *obj;

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
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _suspendCount > 0%@", (uint8_t *)&v2, 0xCu);
}

- (void)setWorkloop:(id)a3
{
  objc_storeStrong((id *)&self->_workloop, a3);
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_destroyWeak((id *)&self->_scheduler);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
