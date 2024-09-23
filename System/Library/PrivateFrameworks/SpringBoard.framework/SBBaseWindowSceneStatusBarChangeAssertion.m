@implementation SBBaseWindowSceneStatusBarChangeAssertion

- (SBBaseWindowSceneStatusBarChangeAssertion)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowSceneStatusBarChangeAssertion.m"), 23, CFSTR("You cannot invoke this directly."));

  return 0;
}

- (id)_initWithWindowSceneStatusBarAssertionManager:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  SBBaseWindowSceneStatusBarChangeAssertion *v8;
  uint64_t v9;
  NSString *reason;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBBaseWindowSceneStatusBarChangeAssertion;
  v8 = -[SBBaseWindowSceneStatusBarChangeAssertion init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

    objc_storeWeak((id *)&v8->_assertionManager, v6);
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p = reason:%@>"), v5, self, self->_reason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assertionManager);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
