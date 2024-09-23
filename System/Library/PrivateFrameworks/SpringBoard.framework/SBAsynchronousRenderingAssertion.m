@implementation SBAsynchronousRenderingAssertion

- (SBAsynchronousRenderingAssertion)initWithReason:(id)a3 wantsMinificationFilter:(BOOL)a4
{
  id v7;
  objc_class *v8;
  void *v9;
  SBAsynchronousRenderingAssertion *v10;
  void *v11;
  void *v13;
  objc_super v14;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAsynchronousRenderingAssertion.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asynchronousRenderingReason != nil"));

  }
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)SBAsynchronousRenderingAssertion;
  v10 = -[BSSimpleAssertion initWithIdentifier:forReason:queue:invalidationBlock:](&v14, sel_initWithIdentifier_forReason_queue_invalidationBlock_, v9, v7, MEMORY[0x1E0C80D38], &__block_literal_global_127);

  if (v10)
  {
    v10->_wantsMinificationFilter = a4;
    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_acquireAssertion:", v10);

  }
  return v10;
}

void __75__SBAsynchronousRenderingAssertion_initWithReason_wantsMinificationFilter___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = a2;
  v3 = objc_opt_class();
  SBSafeCast(v3, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_reqlinquishAssertion:", v5);

}

- (SBAsynchronousRenderingAssertion)initWithReason:(id)a3
{
  return -[SBAsynchronousRenderingAssertion initWithReason:wantsMinificationFilter:](self, "initWithReason:wantsMinificationFilter:", a3, 0);
}

- (void)setWantsMinificationFilter:(BOOL)a3
{
  id v4;

  if (self->_wantsMinificationFilter != a3)
  {
    self->_wantsMinificationFilter = a3;
    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateAssertion:", self);

  }
}

- (BOOL)wantsMinificationFilter
{
  return self->_wantsMinificationFilter;
}

@end
