@implementation REUpNextScheduler

- (void)schedule
{
  os_unfair_lock_s *p_scheduledLock;
  _BOOL4 updateScheduled;
  double delay;
  dispatch_time_t v6;
  NSObject *v7;
  id *v8;
  NSObject *queue;
  _QWORD v10[4];
  id v11;
  _QWORD block[4];
  id v13;
  id location;

  p_scheduledLock = &self->_scheduledLock;
  os_unfair_lock_lock(&self->_scheduledLock);
  updateScheduled = self->_updateScheduled;
  self->_updateScheduled = 1;
  os_unfair_lock_unlock(p_scheduledLock);
  if (!updateScheduled)
  {
    objc_initWeak(&location, self);
    delay = self->_delay;
    if (delay <= 0.0)
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __29__REUpNextScheduler_schedule__block_invoke_2;
      v10[3] = &unk_24CF8AAC8;
      v8 = &v11;
      objc_copyWeak(&v11, &location);
      dispatch_async(queue, v10);
    }
    else
    {
      v6 = dispatch_time(0, (uint64_t)(delay * 1000000000.0));
      v7 = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __29__REUpNextScheduler_schedule__block_invoke;
      block[3] = &unk_24CF8AAC8;
      v8 = &v13;
      objc_copyWeak(&v13, &location);
      dispatch_after(v6, v7, block);
    }
    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
}

void __29__REUpNextScheduler_schedule__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_performUpdate");

}

- (void)_queue_performUpdate
{
  void (**updateCompletionBlock)(id, void *);
  void (**updateBlock)(void);

  if (-[REUpNextScheduler isScheduled](self, "isScheduled"))
  {
    os_unfair_lock_lock(&self->_scheduledLock);
    self->_updateScheduled = 0;
    os_unfair_lock_unlock(&self->_scheduledLock);
    updateCompletionBlock = (void (**)(id, void *))self->_updateCompletionBlock;
    if (updateCompletionBlock)
    {
      updateCompletionBlock[2](updateCompletionBlock, &__block_literal_global_82);
    }
    else
    {
      updateBlock = (void (**)(void))self->_updateBlock;
      if (updateBlock)
        updateBlock[2]();
    }
  }
}

- (BOOL)isScheduled
{
  REUpNextScheduler *v2;
  os_unfair_lock_s *p_scheduledLock;

  v2 = self;
  p_scheduledLock = &self->_scheduledLock;
  os_unfair_lock_lock(&self->_scheduledLock);
  LOBYTE(v2) = v2->_updateScheduled;
  os_unfair_lock_unlock(p_scheduledLock);
  return (char)v2;
}

+ (REUpNextScheduler)schedulerWithQueue:(id)a3 delay:(double)a4 updateCompletionBlock:(id)a5
{
  id v7;
  id v8;
  REUpNextScheduler *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[REUpNextScheduler initWithQueue:delay:updateBlock:updateCompletionBlock:]([REUpNextScheduler alloc], "initWithQueue:delay:updateBlock:updateCompletionBlock:", v8, 0, v7, a4);

  return v9;
}

+ (REUpNextScheduler)schedulerWithQueue:(id)a3 delay:(double)a4 updateBlock:(id)a5
{
  id v7;
  id v8;
  REUpNextScheduler *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[REUpNextScheduler initWithQueue:delay:updateBlock:updateCompletionBlock:]([REUpNextScheduler alloc], "initWithQueue:delay:updateBlock:updateCompletionBlock:", v8, v7, 0, a4);

  return v9;
}

- (REUpNextScheduler)initWithQueue:(id)a3 delay:(double)a4 updateBlock:(id)a5 updateCompletionBlock:(id)a6
{
  NSObject *v11;
  id v12;
  id v13;
  REUpNextScheduler *v14;
  REUpNextScheduler *v15;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  uint64_t v19;
  id updateBlock;
  uint64_t v21;
  id updateCompletionBlock;
  objc_super v24;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)REUpNextScheduler;
  v14 = -[REUpNextScheduler init](&v24, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_scheduledLock._os_unfair_lock_opaque = 0;
    v14->_updateScheduled = 0;
    dispatch_queue_set_specific(v11, v14, v14, 0);
    objc_storeStrong((id *)&v15->_originalQueue, a3);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s.REScheduler"), dispatch_queue_get_label(v11));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = dispatch_queue_create_with_target_V2((const char *)objc_msgSend(v16, "UTF8String"), 0, v11);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v17;

    v15->_delay = a4;
    v19 = objc_msgSend(v12, "copy");
    updateBlock = v15->_updateBlock;
    v15->_updateBlock = (id)v19;

    v21 = objc_msgSend(v13, "copy");
    updateCompletionBlock = v15->_updateCompletionBlock;
    v15->_updateCompletionBlock = (id)v21;

  }
  return v15;
}

+ (REUpNextScheduler)schedulerWithQueue:(id)a3 updateBlock:(id)a4
{
  return (REUpNextScheduler *)objc_msgSend(a1, "schedulerWithQueue:delay:updateBlock:", a3, a4, 0.0);
}

- (void)dealloc
{
  objc_super v3;

  dispatch_queue_set_specific((dispatch_queue_t)self->_originalQueue, self, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)REUpNextScheduler;
  -[REUpNextScheduler dealloc](&v3, sel_dealloc);
}

- (BOOL)performImmediately
{
  REUpNextScheduler *specific;
  NSObject *queue;
  _QWORD block[5];

  specific = (REUpNextScheduler *)dispatch_get_specific(self);
  if (specific == self)
  {
    -[REUpNextScheduler _queue_performUpdate](self, "_queue_performUpdate");
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__REUpNextScheduler_performImmediately__block_invoke;
    block[3] = &unk_24CF8AAF0;
    block[4] = self;
    dispatch_async(queue, block);
  }
  return specific == self;
}

uint64_t __39__REUpNextScheduler_performImmediately__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_performUpdate");
}

void __29__REUpNextScheduler_schedule__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_performUpdate");

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (double)delay
{
  return self->_delay;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (id)updateCompletionBlock
{
  return self->_updateCompletionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateCompletionBlock, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_originalQueue, 0);
}

@end
