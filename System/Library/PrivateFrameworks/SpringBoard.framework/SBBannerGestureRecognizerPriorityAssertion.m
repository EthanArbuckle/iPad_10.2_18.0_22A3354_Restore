@implementation SBBannerGestureRecognizerPriorityAssertion

- (void)dealloc
{
  objc_super v3;

  -[SBBannerGestureRecognizerPriorityAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBBannerGestureRecognizerPriorityAssertion;
  -[SBBannerGestureRecognizerPriorityAssertion dealloc](&v3, sel_dealloc);
}

+ (BOOL)isValidBannerGestureRecognizerPriority:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    (*((void (**)(void))self->_enablementChangeHandler + 2))();
  }
}

- (void)invalidate
{
  id invalidationHandler;
  id v4;
  void (**v5)(id, SBBannerGestureRecognizerPriorityAssertion *);

  invalidationHandler = self->_invalidationHandler;
  if (invalidationHandler)
  {
    v5 = (void (**)(id, SBBannerGestureRecognizerPriorityAssertion *))objc_msgSend(invalidationHandler, "copy");
    v4 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    v5[2](v5, self);
  }
}

- (SBBannerGestureRecognizerPriorityAssertion)initWithPriority:(int64_t)a3 reason:(id)a4 enablementChangeHandler:(id)a5 invalidationHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  SBBannerGestureRecognizerPriorityAssertion *v14;
  SBBannerGestureRecognizerPriorityAssertion *v15;
  uint64_t v16;
  NSString *reason;
  uint64_t v18;
  id enablementChangeHandler;
  uint64_t v20;
  id invalidationHandler;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend((id)objc_opt_class(), "isValidBannerGestureRecognizerPriority:", a3) & 1) != 0)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerGestureRecognizerPriorityAssertion.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[self class] isValidBannerGestureRecognizerPriority:priority]"));

    if (v11)
    {
LABEL_3:
      if (v12)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerGestureRecognizerPriorityAssertion.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enablementChangeHandler"));

      if (v13)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerGestureRecognizerPriorityAssertion.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  if (!v12)
    goto LABEL_10;
LABEL_4:
  if (v13)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerGestureRecognizerPriorityAssertion.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationHandler"));

LABEL_5:
  v27.receiver = self;
  v27.super_class = (Class)SBBannerGestureRecognizerPriorityAssertion;
  v14 = -[SBBannerGestureRecognizerPriorityAssertion init](&v27, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_enabled = 1;
    v14->_priority = a3;
    v16 = objc_msgSend(v11, "copy");
    reason = v15->_reason;
    v15->_reason = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    enablementChangeHandler = v15->_enablementChangeHandler;
    v15->_enablementChangeHandler = (id)v18;

    v20 = objc_msgSend(v13, "copy");
    invalidationHandler = v15->_invalidationHandler;
    v15->_invalidationHandler = (id)v20;

  }
  return v15;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  int64_t priority;
  NSString *reason;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  priority = self->_priority;
  reason = self->_reason;
  NSStringFromBOOL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; priority: %ld; reason: %@; isEnabled: %@>"),
    v4,
    self,
    priority,
    reason,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong(&self->_enablementChangeHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end
