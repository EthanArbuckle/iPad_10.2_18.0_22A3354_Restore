@implementation UIApplicationSceneDeactivationAssertion

- (NSString)description
{
  return (NSString *)-[UIApplicationSceneDeactivationAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[UIApplicationSceneDeactivationAssertion relinquish](self, "relinquish");
  v3.receiver = self;
  v3.super_class = (Class)UIApplicationSceneDeactivationAssertion;
  -[UIApplicationSceneDeactivationAssertion dealloc](&v3, sel_dealloc);
}

- (void)relinquish
{
  id predicate;
  id v4;

  if (self->_acquired)
  {
    self->_acquired = 0;
    predicate = self->_predicate;
    self->_predicate = 0;

    -[UIApplicationSceneDeactivationAssertion manager](self, "manager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAssertion:", self);

  }
}

- (void)acquireWithPredicate:(id)a3 transitionContext:(id)a4
{
  id v6;
  void *v7;
  id predicate;
  id v9;

  if (!self->_acquired)
  {
    self->_acquired = 1;
    v6 = a4;
    v7 = (void *)objc_msgSend(a3, "copy");
    predicate = self->_predicate;
    self->_predicate = v7;

    -[UIApplicationSceneDeactivationAssertion manager](self, "manager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAssertion:withTransitionContext:", self, v6);

  }
}

- (UIApplicationSceneDeactivationManager)manager
{
  return (UIApplicationSceneDeactivationManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (int64_t)reason
{
  return self->_reason;
}

- (id)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong(&self->_predicate, 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIApplicationSceneDeactivationAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIApplicationSceneDeactivationReasonDescription(self->_reason);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("reason"));

  v6 = (id)objc_msgSend(v3, "appendObject:withName:", CFSTR("all scene levels"), 0);
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_predicate != 0, CFSTR("hasPredicate"));
  return v3;
}

- (UIApplicationSceneDeactivationAssertion)initWithReason:(int64_t)a3 manager:(id)a4
{
  id v7;
  UIApplicationSceneDeactivationAssertion *v8;
  UIApplicationSceneDeactivationAssertion *v9;
  void *v11;
  objc_super v12;

  v7 = a4;
  if ((unint64_t)a3 >= 0x13 && a3 != 30)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIApplicationSceneDeactivationAssertion.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("UIApplicationSceneDeactivationReasonIsValid(reason)"));

  }
  v12.receiver = self;
  v12.super_class = (Class)UIApplicationSceneDeactivationAssertion;
  v8 = -[UIApplicationSceneDeactivationAssertion init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_reason = a3;
    objc_storeWeak((id *)&v8->_manager, v7);
  }

  return v9;
}

- (void)acquire
{
  -[UIApplicationSceneDeactivationAssertion acquireWithPredicate:transitionContext:](self, "acquireWithPredicate:transitionContext:", 0, 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UIApplicationSceneDeactivationAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAcquired
{
  return self->_acquired;
}

@end
