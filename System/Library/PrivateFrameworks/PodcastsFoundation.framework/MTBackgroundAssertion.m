@implementation MTBackgroundAssertion

- (MTBackgroundAssertion)initWithName:(id)a3 flags:(unsigned int)a4 reason:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  MTBackgroundAssertion *v9;
  void *v10;
  id v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  BKSProcessAssertion *assertion;
  id v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *serialQueue;
  _QWORD v24[4];
  id v25;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MTBackgroundAssertion;
  v9 = -[MTBackgroundAssertion init](&v26, sel_init);
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE308]), "initWithPID:flags:reason:name:", getpid(), v6, v5, v8);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __51__MTBackgroundAssertion_initWithName_flags_reason___block_invoke;
    v24[3] = &unk_1E54D0DE0;
    v11 = v8;
    v25 = v11;
    objc_msgSend(v10, "setInvalidationHandler:", v24);
    objc_msgSend(v10, "acquire");
    v12 = objc_msgSend(v10, "valid");
    _MTLogCategoryBackgroundFetching();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((v12 & 1) != 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v11;
        v15 = "Acquired assertion for %@";
        v16 = v14;
        v17 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
        _os_log_impl(&dword_1A904E000, v16, v17, v15, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v11;
      v15 = "Fail to acquire assertion for %@";
      v16 = v14;
      v17 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }

    assertion = v9->_assertion;
    v9->_assertion = (BKSProcessAssertion *)v10;
    v19 = v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.podcasts.MTBackgroundAssertion", v20);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v21;

  }
  return v9;
}

void __51__MTBackgroundAssertion_initWithName_flags_reason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryBackgroundFetching();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A904E000, v2, OS_LOG_TYPE_DEFAULT, "Assertion with name %@ was invalidated.", (uint8_t *)&v4, 0xCu);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[MTBackgroundAssertion _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MTBackgroundAssertion;
  -[MTBackgroundAssertion dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p assertion: %@>"), v5, self, self->_assertion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isValid
{
  return -[BKSProcessAssertion valid](self->_assertion, "valid");
}

- (void)invalidate
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MTBackgroundAssertion_invalidate__block_invoke;
  block[3] = &unk_1E54D0DE0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __35__MTBackgroundAssertion_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)invalidateAfterDelay:(double)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MTBackgroundAssertion_invalidateAfterDelay___block_invoke;
  v4[3] = &unk_1E54D31C0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

uint64_t __46__MTBackgroundAssertion_invalidateAfterDelay___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelInvalidationTimer");
  return objc_msgSend(*(id *)(a1 + 32), "_createScheduledTimerWithInterval:", *(double *)(a1 + 40));
}

- (void)setInvalidationHandler:(id)a3
{
  -[BKSProcessAssertion setInvalidationHandler:](self->_assertion, "setInvalidationHandler:", a3);
}

- (void)_invalidate
{
  NSObject *v3;
  int v4;
  MTBackgroundAssertion *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryBackgroundFetching();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1A904E000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating %@", (uint8_t *)&v4, 0xCu);
  }

  -[MTBackgroundAssertion _cancelInvalidationTimer](self, "_cancelInvalidationTimer");
  -[BKSProcessAssertion invalidate](self->_assertion, "invalidate");
}

- (void)_invalidationTimerFired
{
  NSObject *v3;
  int v4;
  MTBackgroundAssertion *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryBackgroundFetching();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1A904E000, v3, OS_LOG_TYPE_DEFAULT, "Assertion %@ just timed out, force invalidating.", (uint8_t *)&v4, 0xCu);
  }

  -[MTBackgroundAssertion invalidate](self, "invalidate");
}

- (void)_cancelInvalidationTimer
{
  NSTimer *invalidationTimer;

  -[NSTimer invalidate](self->_invalidationTimer, "invalidate");
  invalidationTimer = self->_invalidationTimer;
  self->_invalidationTimer = 0;

}

- (void)_createScheduledTimerWithInterval:(double)a3
{
  NSObject *v5;
  NSTimer *v6;
  NSTimer *invalidationTimer;
  void *v8;
  int v9;
  MTBackgroundAssertion *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryBackgroundFetching();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_1A904E000, v5, OS_LOG_TYPE_DEFAULT, "Assertion %@ timer set %f", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__invalidationTimerFired, 0, 0, a3);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  invalidationTimer = self->_invalidationTimer;
  self->_invalidationTimer = v6;

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTimer:forMode:", self->_invalidationTimer, *MEMORY[0x1E0C99748]);

}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
