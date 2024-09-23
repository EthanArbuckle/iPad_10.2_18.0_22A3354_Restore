@implementation _SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion

- (_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion)initWithTodayViewController:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  _SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion *v8;
  _SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion *v9;
  uint64_t v10;
  NSString *reason;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion;
  v8 = -[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_todayViewController, v6);
    v10 = objc_msgSend(v7, "copy");
    reason = v9->_reason;
    v9->_reason = (NSString *)v10;

  }
  return v9;
}

- (void)dealloc
{
  NSObject *v3;
  _BOOL4 v4;
  objc_super v5;

  if (!-[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion isInvalidated](self, "isInvalidated"))
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (v4)
      NSLog(CFSTR("Assertion released without invalidation!"));
  }
  -[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion invalidate](self, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion;
  -[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  id v3;

  if (!-[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion isInvalidated](self, "isInvalidated"))
  {
    -[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion setInvalidated:](self, "setInvalidated:", 1);
    -[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion todayViewController](self, "todayViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_removeIconImageViewControllerKeepStaticAssertion:", self);

  }
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  -[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion todayViewController](self, "todayViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendPointer:withName:", v5, CFSTR("todayViewController"));

  -[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("reason"));

  v9 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion isInvalidated](self, "isInvalidated"), CFSTR("isInvalidated"), 1);
  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBHTodayViewController)todayViewController
{
  return (SBHTodayViewController *)objc_loadWeakRetained((id *)&self->_todayViewController);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_todayViewController);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
