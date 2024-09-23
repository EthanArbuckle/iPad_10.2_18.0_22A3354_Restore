@implementation PXDelayEventCoalescer

- (PXDelayEventCoalescer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEventCoalescer.m"), 141, CFSTR("%s is not available as initializer"), "-[PXDelayEventCoalescer init]");

  abort();
}

- (PXDelayEventCoalescer)initWithDelay:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXDelayEventCoalescer;
  return -[PXEventCoalescer initWithInterval:](&v4, sel_initWithInterval_, a3);
}

- (void)_handleTimer
{
  double Current;
  double v4;
  double v5;
  double v6;
  double v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (-[PXEventCoalescer isCancelled](self, "isCancelled"))
  {
    -[PXEventCoalescer setWaitingForCallback:](self, "setWaitingForCallback:", 0);
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[PXEventCoalescer lastEventTime](self, "lastEventTime");
    v5 = Current - v4;
    -[PXEventCoalescer interval](self, "interval");
    v7 = v6 - v5;
    if (v7 <= 0.01)
    {
      -[PXEventCoalescer setWaitingForCallback:](self, "setWaitingForCallback:", 0);
      -[PXEventCoalescer signalObservers](self, "signalObservers");
    }
    else
    {
      objc_initWeak(&location, self);
      v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __37__PXDelayEventCoalescer__handleTimer__block_invoke;
      v9[3] = &unk_2514D1180;
      objc_copyWeak(&v10, &location);
      dispatch_after(v8, MEMORY[0x24BDAC9B8], v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

- (void)inputEvent
{
  double v3;
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[PXEventCoalescer setIsCancelled:](self, "setIsCancelled:", 0);
  -[PXEventCoalescer setLastEventTime:](self, "setLastEventTime:", CFAbsoluteTimeGetCurrent());
  if (!-[PXEventCoalescer waitingForCallback](self, "waitingForCallback"))
  {
    -[PXEventCoalescer setWaitingForCallback:](self, "setWaitingForCallback:", 1);
    objc_initWeak(&location, self);
    -[PXEventCoalescer interval](self, "interval");
    v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __35__PXDelayEventCoalescer_inputEvent__block_invoke;
    v5[3] = &unk_2514D1180;
    objc_copyWeak(&v6, &location);
    dispatch_after(v4, MEMORY[0x24BDAC9B8], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __35__PXDelayEventCoalescer_inputEvent__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleTimer");

}

void __37__PXDelayEventCoalescer__handleTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleTimer");

}

@end
