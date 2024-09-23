@implementation _SBUIPresentableDismissalPreventionAssertion

- (void)dealloc
{
  objc_super v3;

  -[_SBUIPresentableDismissalPreventionAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_SBUIPresentableDismissalPreventionAssertion;
  -[_SBUIPresentableDismissalPreventionAssertion dealloc](&v3, sel_dealloc);
}

- (_SBUIPresentableDismissalPreventionAssertion)initWithDismissalSource:(int64_t)a3 reason:(id)a4 invalidationHandler:(id)a5
{
  id v9;
  id v10;
  _SBUIPresentableDismissalPreventionAssertion *v11;
  _SBUIPresentableDismissalPreventionAssertion *v12;
  uint64_t v13;
  NSString *reason;
  uint64_t v15;
  id invalidationHandler;
  NSObject *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  _SBUIPresentableDismissalPreventionAssertion *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend((id)objc_opt_class(), "_isValidBannerDismissalSource:", a3) & 1) != 0)
  {
    if (v9)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIPresentableDismissalPreventionAssertion.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    if (v10)
      goto LABEL_4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIPresentableDismissalPreventionAssertion.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[self class] _isValidBannerDismissalSource:dismissalSource]"));

  if (!v9)
    goto LABEL_10;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIPresentableDismissalPreventionAssertion.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationHandler"));

LABEL_4:
  v22.receiver = self;
  v22.super_class = (Class)_SBUIPresentableDismissalPreventionAssertion;
  v11 = -[_SBUIPresentableDismissalPreventionAssertion init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_dismissalSource = a3;
    v13 = objc_msgSend(v9, "copy");
    reason = v12->_reason;
    v12->_reason = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    invalidationHandler = v12->_invalidationHandler;
    v12->_invalidationHandler = (id)v15;

    SBLogBanners();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_impl(&dword_1A471F000, v17, OS_LOG_TYPE_DEFAULT, "Acquired banner dismissal prevention assertion: %{public}@", buf, 0xCu);
    }

  }
  return v12;
}

- (void)invalidate
{
  id invalidationHandler;
  void (**v4)(_QWORD, _QWORD);
  id v5;
  NSObject *v6;
  int v7;
  _SBUIPresentableDismissalPreventionAssertion *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  invalidationHandler = self->_invalidationHandler;
  if (invalidationHandler)
  {
    v4 = (void (**)(_QWORD, _QWORD))objc_msgSend(invalidationHandler, "copy");
    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    ((void (**)(_QWORD, _SBUIPresentableDismissalPreventionAssertion *))v4)[2](v4, self);
    SBLogBanners();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_DEFAULT, "Invalidated banner dismissal prevention assertion: %{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
}

+ (BOOL)_isValidBannerDismissalSource:(int64_t)a3
{
  return a3 == 1;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  int64_t dismissalSource;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("[INVALID]");
  dismissalSource = self->_dismissalSource;
  if (dismissalSource == 1)
    v5 = CFSTR("transition");
  if (!dismissalSource)
    v5 = CFSTR("none");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; dismissalSource: %@; reason: %@>"),
                       v4,
                       self,
                       v5,
                       self->_reason);
}

- (NSString)reason
{
  return self->_reason;
}

- (int64_t)dismissalSource
{
  return self->_dismissalSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end
