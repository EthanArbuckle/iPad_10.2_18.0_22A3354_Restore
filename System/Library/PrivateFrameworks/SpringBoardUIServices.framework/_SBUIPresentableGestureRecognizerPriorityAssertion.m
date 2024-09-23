@implementation _SBUIPresentableGestureRecognizerPriorityAssertion

- (void)dealloc
{
  objc_super v3;

  -[_SBUIPresentableGestureRecognizerPriorityAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_SBUIPresentableGestureRecognizerPriorityAssertion;
  -[_SBUIPresentableGestureRecognizerPriorityAssertion dealloc](&v3, sel_dealloc);
}

- (_SBUIPresentableGestureRecognizerPriorityAssertion)initWithReason:(id)a3 invalidationHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _SBUIPresentableGestureRecognizerPriorityAssertion *v10;
  uint64_t v11;
  NSString *reason;
  uint64_t v13;
  id invalidationHandler;
  NSObject *v15;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  _SBUIPresentableGestureRecognizerPriorityAssertion *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIPresentableGestureRecognizerPriorityAssertion.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIPresentableGestureRecognizerPriorityAssertion.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationHandler"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)_SBUIPresentableGestureRecognizerPriorityAssertion;
  v10 = -[_SBUIPresentableGestureRecognizerPriorityAssertion init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    invalidationHandler = v10->_invalidationHandler;
    v10->_invalidationHandler = (id)v13;

    SBLogBanners();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_impl(&dword_1A471F000, v15, OS_LOG_TYPE_DEFAULT, "Acquired gesture recognizer priority assertion: %{public}@", buf, 0xCu);
    }

  }
  return v10;
}

- (void)invalidate
{
  id invalidationHandler;
  void (**v4)(_QWORD, _QWORD);
  id v5;
  NSObject *v6;
  int v7;
  _SBUIPresentableGestureRecognizerPriorityAssertion *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  invalidationHandler = self->_invalidationHandler;
  if (invalidationHandler)
  {
    v4 = (void (**)(_QWORD, _QWORD))objc_msgSend(invalidationHandler, "copy");
    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    ((void (**)(_QWORD, _SBUIPresentableGestureRecognizerPriorityAssertion *))v4)[2](v4, self);
    SBLogBanners();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_DEFAULT, "Invalidated gesture recognizer priority assertion: %{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; reason: %@>"),
                       objc_opt_class(),
                       self,
                       self->_reason);
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end
