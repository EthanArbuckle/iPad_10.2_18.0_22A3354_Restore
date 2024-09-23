@implementation STUIStatusBarDataAggregatorUpdateDelayToken

- (STUIStatusBarDataAggregatorUpdateDelayToken)initWithEntryKeys:(id)a3 timeout:(double)a4 timeoutBlock:(id)a5
{
  id v8;
  id v9;
  STUIStatusBarDataAggregatorUpdateDelayToken *v10;
  uint64_t v11;
  NSSet *delayedKeys;
  uint64_t v13;
  id timeoutBlock;
  void *v15;
  uint64_t v16;
  NSTimer *timeoutTimer;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v8 = a3;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)STUIStatusBarDataAggregatorUpdateDelayToken;
  v10 = -[STUIStatusBarDataAggregatorUpdateDelayToken init](&v22, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    delayedKeys = v10->_delayedKeys;
    v10->_delayedKeys = (NSSet *)v11;

    v13 = objc_msgSend(v9, "copy");
    timeoutBlock = v10->_timeoutBlock;
    v10->_timeoutBlock = (id)v13;

    objc_initWeak(&location, v10);
    v15 = (void *)MEMORY[0x1E0C99E88];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __86__STUIStatusBarDataAggregatorUpdateDelayToken_initWithEntryKeys_timeout_timeoutBlock___block_invoke;
    v19[3] = &unk_1E8D62CB0;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v15, "scheduledTimerWithTimeInterval:repeats:block:", 0, v19, a4);
    v16 = objc_claimAutoreleasedReturnValue();
    timeoutTimer = v10->_timeoutTimer;
    v10->_timeoutTimer = (NSTimer *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)invalidate
{
  NSTimer *timeoutTimer;
  id timeoutBlock;

  self->_invalidated = 1;
  -[NSTimer invalidate](self->_timeoutTimer, "invalidate");
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;

  timeoutBlock = self->_timeoutBlock;
  self->_timeoutBlock = 0;

}

- (NSSet)delayedKeys
{
  return self->_delayedKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutBlock, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_delayedKeys, 0);
}

- (void)dealloc
{
  void (**timeoutBlock)(id, STUIStatusBarDataAggregatorUpdateDelayToken *);
  NSTimer *timeoutTimer;
  id v5;
  objc_super v6;

  timeoutBlock = (void (**)(id, STUIStatusBarDataAggregatorUpdateDelayToken *))self->_timeoutBlock;
  if (timeoutBlock)
  {
    timeoutBlock[2](timeoutBlock, self);
    -[NSTimer invalidate](self->_timeoutTimer, "invalidate");
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = 0;

    v5 = self->_timeoutBlock;
    self->_timeoutBlock = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarDataAggregatorUpdateDelayToken;
  -[STUIStatusBarDataAggregatorUpdateDelayToken dealloc](&v6, sel_dealloc);
}

void __86__STUIStatusBarDataAggregatorUpdateDelayToken_initWithEntryKeys_timeout_timeoutBlock___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const void **WeakRetained;

  WeakRetained = (const void **)objc_loadWeakRetained((id *)(a1 + 32));
  v1 = _Block_copy(WeakRetained[4]);
  v2 = v1;
  if (v1)
    (*((void (**)(void *, const void **))v1 + 2))(v1, WeakRetained);

}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (id)timeoutBlock
{
  return self->_timeoutBlock;
}

@end
