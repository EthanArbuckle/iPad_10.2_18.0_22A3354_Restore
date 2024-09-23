@implementation PXEventCoalescer

- (PXEventCoalescer)initWithInterval:(double)a3
{
  PXEventCoalescer *v4;
  PXEventCoalescer *v5;
  uint64_t v6;
  NSHashTable *observers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXEventCoalescer;
  v4 = -[PXEventCoalescer init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_interval = a3;
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

  }
  return v5;
}

- (PXEventCoalescer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEventCoalescer.m"), 69, CFSTR("%s is not available as initializer"), "-[PXEventCoalescer init]");

  abort();
}

- (void)cancel
{
  -[PXEventCoalescer setIsCancelled:](self, "setIsCancelled:", 1);
}

- (void)reset
{
  -[PXEventCoalescer cancel](self, "cancel");
  -[PXEventCoalescer setWaitingForCallback:](self, "setWaitingForCallback:", 0);
  -[PXEventCoalescer setLastEventTime:](self, "setLastEventTime:", 0.0);
  -[PXEventCoalescer setLastSignalTime:](self, "setLastSignalTime:", 0.0);
}

- (void)inputEvent
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEventCoalescer.m"), 86, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXEventCoalescer inputEvent]", v6);

  abort();
}

- (void)registerObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)unregisterObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)setWaitingForCallback:(BOOL)a3
{
  if (self->_waitingForCallback != a3)
  {
    self->_waitingForCallback = a3;
    if (a3)
      -[PXEventCoalescer signalObserversBeganPendingEvent](self, "signalObserversBeganPendingEvent");
  }
}

- (void)_enumerateObserversWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)signalObserversBeganPendingEvent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __52__PXEventCoalescer_signalObserversBeganPendingEvent__block_invoke;
  v2[3] = &unk_2514D07F8;
  v2[4] = self;
  -[PXEventCoalescer _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v2);
}

- (void)signalObservers
{
  _QWORD v3[5];

  -[PXEventCoalescer setLastSignalTime:](self, "setLastSignalTime:", CFAbsoluteTimeGetCurrent());
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__PXEventCoalescer_signalObservers__block_invoke;
  v3[3] = &unk_2514D07F8;
  v3[4] = self;
  -[PXEventCoalescer _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v3);
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)lastEventTime
{
  return self->_lastEventTime;
}

- (void)setLastEventTime:(double)a3
{
  self->_lastEventTime = a3;
}

- (BOOL)waitingForCallback
{
  return self->_waitingForCallback;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (double)lastSignalTime
{
  return self->_lastSignalTime;
}

- (void)setLastSignalTime:(double)a3
{
  self->_lastSignalTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

uint64_t __35__PXEventCoalescer_signalObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "outputEventSignaledForCoalescer:", *(_QWORD *)(a1 + 32));
}

void __52__PXEventCoalescer_signalObserversBeganPendingEvent__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "coalescerBeganPendingEvent:", *(_QWORD *)(a1 + 32));

}

+ (id)delayedCoalescerWithDelay:(double)a3
{
  return -[PXDelayEventCoalescer initWithDelay:]([PXDelayEventCoalescer alloc], "initWithDelay:", a3);
}

+ (id)rateLimitingCoalescerWithRate:(double)a3
{
  return -[PXRateLimitingEventCoalescer initWithRate:]([PXRateLimitingEventCoalescer alloc], "initWithRate:", a3);
}

@end
