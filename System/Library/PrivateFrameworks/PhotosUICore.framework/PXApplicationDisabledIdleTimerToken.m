@implementation PXApplicationDisabledIdleTimerToken

- (PXApplicationDisabledIdleTimerToken)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXApplicationState.m"), 322, CFSTR("%s is not available as initializer"), "-[PXApplicationDisabledIdleTimerToken init]");

  abort();
}

- (PXApplicationDisabledIdleTimerToken)initWithReason:(id)a3 powerAssertionID:(unsigned int)a4
{
  id v6;
  PXApplicationDisabledIdleTimerToken *v7;
  uint64_t v8;
  NSString *reason;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXApplicationDisabledIdleTimerToken;
  v7 = -[PXApplicationDisabledIdleTimerToken init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    reason = v7->_reason;
    v7->_reason = (NSString *)v8;

    v7->_powerAssertionID = a4;
  }

  return v7;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[PXApplicationDisabledIdleTimerToken reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; reason: %@>"), v4, self, v5);

  return v6;
}

- (NSString)reason
{
  return self->_reason;
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
