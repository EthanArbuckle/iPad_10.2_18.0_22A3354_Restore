@implementation RBPLEventQueue

- (id)dequeueEvent
{
  os_unfair_lock_s *p_lock;
  void *v4;

  if (MEMORY[0x24BE74F58])
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (-[NSMutableArray count](self->_eventQueue, "count"))
    {
      -[NSMutableArray firstObject](self->_eventQueue, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_eventQueue, "removeObjectAtIndex:", 0);
    }
    else
    {
      v4 = 0;
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)enqueueEvent:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  if (MEMORY[0x24BE74F58])
  {
    p_lock = &self->_lock;
    v5 = a3;
    os_unfair_lock_lock(p_lock);
    -[NSMutableArray addObject:](self->_eventQueue, "addObject:", v5);

    if (!self->_scheduled)
    {
      self->_scheduled = 1;
      -[RBPLEventQueue scheduleWork](self, "scheduleWork");
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)scheduleWork
{
  if (MEMORY[0x24BE74F58])
    RBSDispatchAsyncWithQoS();
}

void __30__RBPLEventQueue_scheduleWork__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 32), "dequeueEvent");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    do
    {
      v4 = objc_msgSend(v3, "event");
      objc_msgSend(v3, "identity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v3, "assertionCount");
      v7 = objc_msgSend(v3, "pid");
      objc_msgSend(v5, "hostIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("EventType"));

      if ((_DWORD)v7 == -1)
      {
        objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("PID"));
        if (!v8)
        {
LABEL_7:
          objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("HostPID"));
          goto LABEL_8;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("PID"));

        if (!v8)
          goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "pid"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("HostPID"));

LABEL_8:
      objc_msgSend(v5, "embeddedApplicationIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("BundleID"));

      if ((v6 & 0x80000000) != 0)
      {
        objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("AssertionCount"));
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("AssertionCount"));

      }
      if (MEMORY[0x24BE74F58])
        PLLogRegisteredEvent();

      objc_msgSend(*(id *)(a1 + 32), "dequeueEvent");
      v15 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v15;
    }
    while (v15);
  }
}

- (RBPLEventQueue)init
{
  RBPLEventQueue *v2;
  NSMutableArray *v3;
  NSMutableArray *eventQueue;
  uint64_t v5;
  OS_dispatch_queue *dispatchQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RBPLEventQueue;
  v2 = -[RBPLEventQueue init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = objc_msgSend(MEMORY[0x24BE80D58], "createBackgroundQueue:", CFSTR("RBPowerlogEvent"));
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v2->_scheduled = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

@end
