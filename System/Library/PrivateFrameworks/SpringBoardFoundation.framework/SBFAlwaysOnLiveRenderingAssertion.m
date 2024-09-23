@implementation SBFAlwaysOnLiveRenderingAssertion

- (SBFAlwaysOnLiveRenderingAssertion)initWithReason:(id)a3 invalidationHandler:(id)a4
{
  return -[SBFAlwaysOnLiveRenderingAssertion initWithReason:timeout:invalidationHandler:](self, "initWithReason:timeout:invalidationHandler:", a3, a4, 0.0);
}

- (SBFAlwaysOnLiveRenderingAssertion)initWithReason:(id)a3 timeout:(double)a4 invalidationHandler:(id)a5
{
  id v8;
  id v9;
  SBFAlwaysOnLiveRenderingAssertion *v10;
  uint64_t v11;
  NSString *reason;
  uint64_t v13;
  id invalidationHandler;
  uint64_t v15;
  NSDate *createdAt;
  objc_super v18;

  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBFAlwaysOnLiveRenderingAssertion;
  v10 = -[SBFAlwaysOnLiveRenderingAssertion init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    invalidationHandler = v10->_invalidationHandler;
    v10->_invalidationHandler = (id)v13;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = objc_claimAutoreleasedReturnValue();
    createdAt = v10->_createdAt;
    v10->_createdAt = (NSDate *)v15;

    v10->_timeout = a4;
    v10->_valid = 1;
    if (a4 > 0.0)
      -[SBFAlwaysOnLiveRenderingAssertion _startAutoInvalidationTimer](v10, "_startAutoInvalidationTimer");
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[SBFAlwaysOnLiveRenderingAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBFAlwaysOnLiveRenderingAssertion;
  -[SBFAlwaysOnLiveRenderingAssertion dealloc](&v3, sel_dealloc);
}

- (id)reason
{
  return self->_reason;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (id)createdAt
{
  return self->_createdAt;
}

- (void)invalidate
{
  void (**invalidationHandler)(id, SBFAlwaysOnLiveRenderingAssertion *);
  id v4;

  if (self->_valid)
  {
    self->_valid = 0;
    invalidationHandler = (void (**)(id, SBFAlwaysOnLiveRenderingAssertion *))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, self);
      v4 = self->_invalidationHandler;
      self->_invalidationHandler = 0;

    }
  }
}

- (void)_startAutoInvalidationTimer
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__SBFAlwaysOnLiveRenderingAssertion__startAutoInvalidationTimer__block_invoke;
  v4[3] = &unk_1E200F978;
  objc_copyWeak(&v5, &location);
  dispatch_after(v3, MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __64__SBFAlwaysOnLiveRenderingAssertion__startAutoInvalidationTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "invalidate");
    WeakRetained = v2;
  }

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SBFAlwaysOnLiveRenderingAssertion reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFAlwaysOnLiveRenderingAssertion createdAt](self, "createdAt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; reason: %@; createdAt: %f>"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end
