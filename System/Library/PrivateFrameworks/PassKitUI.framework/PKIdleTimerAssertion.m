@implementation PKIdleTimerAssertion

- (PKIdleTimerAssertion)init
{

  return 0;
}

- (PKIdleTimerAssertion)initWithReason:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  BSInvalidatable *v8;
  BSInvalidatable *idleTimerAssertion;
  const char *v10;
  PKIdleTimerAssertion *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v14.receiver = self;
    v14.super_class = (Class)PKIdleTimerAssertion;
    self = -[PKIdleTimerAssertion init](&v14, sel_init);
    if (self)
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v5;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Taking idle timer assertion with reason: %@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_reason, a3);
      if (PKRunningInViewService())
      {
        objc_msgSend(MEMORY[0x1E0D3A8B8], "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (BSInvalidatable *)objc_msgSend(v7, "newAssertionToDisableIdleTimerForReason:error:", self->_reason, 0);
        idleTimerAssertion = self->_idleTimerAssertion;
        self->_idleTimerAssertion = v8;

        if (!self->_idleTimerAssertion)
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v10 = "Failed to acquire idle timer assertion";
LABEL_11:
            _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
            goto LABEL_12;
          }
          goto LABEL_12;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_setIdleTimerDisabled:forReason:", 1, self->_reason);

      }
    }
    self = self;
    v11 = self;
    goto LABEL_15;
  }
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v10 = "Missing reason for idle timer assertion";
    goto LABEL_11;
  }
LABEL_12:

  v11 = 0;
LABEL_15:

  return v11;
}

- (void)invalidate
{
  atomic_flag *p_invalidated;
  unsigned __int8 v4;
  NSObject *v5;
  NSString *reason;
  BSInvalidatable *idleTimerAssertion;
  void *v8;
  int v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_invalidated = &self->_invalidated;
  do
    v4 = __ldaxr((unsigned __int8 *)p_invalidated);
  while (__stlxr(1u, (unsigned __int8 *)p_invalidated));
  if ((v4 & 1) != 0)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      reason = self->_reason;
      v9 = 138412290;
      v10 = reason;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating idle timer assertion with reason: %@", (uint8_t *)&v9, 0xCu);
    }

    idleTimerAssertion = self->_idleTimerAssertion;
    if (idleTimerAssertion)
    {
      -[BSInvalidatable invalidate](idleTimerAssertion, "invalidate");
      v8 = self->_idleTimerAssertion;
      self->_idleTimerAssertion = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setIdleTimerDisabled:forReason:", 0, self->_reason);
    }

  }
}

- (void)dealloc
{
  objc_super v3;

  -[PKIdleTimerAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKIdleTimerAssertion;
  -[PKIdleTimerAssertion dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
