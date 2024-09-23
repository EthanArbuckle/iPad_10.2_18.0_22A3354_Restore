@implementation OITSUDelayTimer

- (OITSUDelayTimer)init
{
  return -[OITSUDelayTimer initWithTargetSerialQueue:](self, "initWithTargetSerialQueue:", 0);
}

- (OITSUDelayTimer)initWithTargetSerialQueue:(id)a3
{
  OITSUDelayTimer *v4;
  OITSUDelayTimer *v5;
  id v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)OITSUDelayTimer;
  v4 = -[OITSUDelayTimer init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      -[OITSUDelayTimer _setDispatchQueue:](v4, "_setDispatchQueue:", a3);
    }
    else
    {
      v6 = objc_alloc(MEMORY[0x24BDD17C8]);
      v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier");
      v8 = (objc_class *)objc_opt_class();
      v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@.%@.TimerQueue"), v7, NSStringFromClass(v8));
      v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);

      -[OITSUDelayTimer _setDispatchQueue:](v5, "_setDispatchQueue:", v10);
      if (v10)
        dispatch_release(v10);
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[OITSUDelayTimer _reallyCancel](self, "_reallyCancel");
  -[OITSUDelayTimer _setDispatchQueue:](self, "_setDispatchQueue:", 0);
  v3.receiver = self;
  v3.super_class = (Class)OITSUDelayTimer;
  -[OITSUDelayTimer dealloc](&v3, sel_dealloc);
}

- (void)afterDelay:(double)a3 processBlock:(id)a4
{
  OS_dispatch_queue *v7;
  _QWORD block[7];

  -[OITSUDelayTimer _setCancelled:](self, "_setCancelled:", 0);
  v7 = -[OITSUDelayTimer _dispatchQueue](self, "_dispatchQueue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__OITSUDelayTimer_afterDelay_processBlock___block_invoke;
  block[3] = &unk_24F39B268;
  *(double *)&block[6] = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async((dispatch_queue_t)v7, block);
}

void __43__OITSUDelayTimer_afterDelay_processBlock___block_invoke(uint64_t a1)
{
  char v2;
  int v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD handler[4];
  __int128 v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_isCancelled");
  if (objc_msgSend(*(id *)(a1 + 32), "_dispatchTimer"))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "automaticallyCancelPendingBlockUponSchedulingNewBlock");
    v4 = *(void **)(a1 + 32);
    if (!v3)
    {
      NSLog((NSString *)CFSTR("[warning]: %@: Ignoring block scheduled for execution %.2f seconds from now."), v4, *(_QWORD *)(a1 + 48));
      return;
    }
    objc_msgSend(v4, "_reallyCancel");
  }
  if ((v2 & 1) == 0)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "_dispatchQueue");
    v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v5);
    v7 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __43__OITSUDelayTimer_afterDelay_processBlock___block_invoke_2;
    handler[3] = &unk_24F39B240;
    v9 = *(_OWORD *)(a1 + 32);
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    objc_msgSend(*(id *)(a1 + 32), "_setDispatchTimer:", v6);
    dispatch_release(v6);
  }
}

uint64_t __43__OITSUDelayTimer_afterDelay_processBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_reallyCancel");
}

- (void)_reallyCancel
{
  OS_dispatch_source *v3;

  v3 = -[OITSUDelayTimer _dispatchTimer](self, "_dispatchTimer");
  if (v3)
  {
    dispatch_source_cancel((dispatch_source_t)v3);
    -[OITSUDelayTimer _setDispatchTimer:](self, "_setDispatchTimer:", 0);
  }
}

- (void)cancel
{
  OS_dispatch_queue *v3;
  _QWORD block[5];

  -[OITSUDelayTimer _setCancelled:](self, "_setCancelled:", 1);
  v3 = -[OITSUDelayTimer _dispatchQueue](self, "_dispatchQueue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__OITSUDelayTimer_cancel__block_invoke;
  block[3] = &unk_24F39A608;
  block[4] = self;
  dispatch_async((dispatch_queue_t)v3, block);
}

uint64_t __25__OITSUDelayTimer_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reallyCancel");
}

- (BOOL)automaticallyCancelPendingBlockUponSchedulingNewBlock
{
  return self->_automaticallyCancelPendingBlockUponSchedulingNewBlock;
}

- (void)setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:(BOOL)a3
{
  self->_automaticallyCancelPendingBlockUponSchedulingNewBlock = a3;
}

- (OS_dispatch_queue)_dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_setDispatchQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (OS_dispatch_source)_dispatchTimer
{
  return self->_dispatchTimer;
}

- (void)_setDispatchTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)_isCancelled
{
  return self->_cancelled;
}

- (void)_setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

@end
