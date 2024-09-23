@implementation PXRateLimitingEventCoalescer

- (PXRateLimitingEventCoalescer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEventCoalescer.m"), 194, CFSTR("%s is not available as initializer"), "-[PXRateLimitingEventCoalescer init]");

  abort();
}

- (PXRateLimitingEventCoalescer)initWithRate:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXRateLimitingEventCoalescer;
  return -[PXEventCoalescer initWithInterval:](&v4, sel_initWithInterval_, a3);
}

- (void)_handleTimer
{
  -[PXEventCoalescer setWaitingForCallback:](self, "setWaitingForCallback:", 0);
  if (!-[PXEventCoalescer isCancelled](self, "isCancelled"))
    -[PXEventCoalescer signalObservers](self, "signalObservers");
}

- (void)inputEvent
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

  -[PXEventCoalescer setIsCancelled:](self, "setIsCancelled:", 0);
  if (!-[PXEventCoalescer waitingForCallback](self, "waitingForCallback"))
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[PXEventCoalescer lastSignalTime](self, "lastSignalTime");
    v5 = Current - v4;
    -[PXEventCoalescer interval](self, "interval");
    if (v5 >= v6)
    {
      -[PXEventCoalescer signalObservers](self, "signalObservers");
    }
    else
    {
      -[PXEventCoalescer interval](self, "interval");
      self->_debugLastDispatchInterval = v7 - v5;
      -[PXEventCoalescer setWaitingForCallback:](self, "setWaitingForCallback:", 1);
      objc_initWeak(&location, self);
      v8 = dispatch_time(0, (uint64_t)(self->_debugLastDispatchInterval * 1000000000.0));
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __42__PXRateLimitingEventCoalescer_inputEvent__block_invoke;
      v9[3] = &unk_2514D1180;
      objc_copyWeak(&v10, &location);
      dispatch_after(v8, MEMORY[0x24BDAC9B8], v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __42__PXRateLimitingEventCoalescer_inputEvent__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleTimer");

}

@end
