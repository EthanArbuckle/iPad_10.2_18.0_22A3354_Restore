@implementation SBLockOverlayContext

- (SBLockOverlayContext)initWithOverlayViewController:(id)a3 priority:(unint64_t)a4
{
  id v7;
  SBLockOverlayContext *v8;
  SBLockOverlayContext *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBLockOverlayContext;
  v8 = -[SBLockOverlayContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_viewController, a3);
    v9->_priority = a4;
  }

  return v9;
}

- (SBLockOverlayViewController)viewController
{
  return self->_viewController;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (id)activationBlock
{
  return self->_activationBlock;
}

- (void)setActivationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)deactivationBlock
{
  return self->_deactivationBlock;
}

- (void)setDeactivationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deactivationBlock, 0);
  objc_storeStrong(&self->_activationBlock, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
