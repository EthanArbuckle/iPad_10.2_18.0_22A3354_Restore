@implementation SBDisableActiveInterfaceOrientationChangeAssertion

- (void)invalidate
{
  NSObject *v3;
  NSString *reason;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    BKLogOrientationGlobal();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      reason = self->_reason;
      v5 = 138543362;
      v6 = reason;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Invalidated disableActiveInterfaceOrientationChangeAssertion with reason: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend((id)SBApp, "removeDisableActiveInterfaceOrientationChangeAssertion:nudgeOrientationIfRemovingLast:", self, self->_nudge);
  }
}

- (SBDisableActiveInterfaceOrientationChangeAssertion)initWithReason:(id)a3 nudgeOrientationOnInvalidate:(BOOL)a4
{
  id v8;
  SBDisableActiveInterfaceOrientationChangeAssertion *v9;
  NSObject *v10;
  NSString *reason;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBDisableActiveInterfaceOrientationChangeAssertion;
  v9 = -[SBDisableActiveInterfaceOrientationChangeAssertion init](&v14, sel_init);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBDisableActiveInterfaceOrientationChangeAssertion.m"), 25, CFSTR("Reason is required."));

    }
    objc_storeStrong((id *)&v9->_reason, a3);
    v9->_nudge = a4;
    BKLogOrientationGlobal();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      reason = v9->_reason;
      *(_DWORD *)buf = 138543362;
      v16 = reason;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "Created disableActiveInterfaceOrientationChangeAssertion with reason: %{public}@", buf, 0xCu);
    }

    objc_msgSend((id)SBApp, "addDisableActiveInterfaceOrientationChangeAssertion:", v9);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

- (void)dealloc
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 8);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Dealloc'd a disableActiveInterfaceOrientationChangeAssertion that wasn't invalidated, reason was: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p: reason='%@'>"), self, self->_reason);
}

@end
