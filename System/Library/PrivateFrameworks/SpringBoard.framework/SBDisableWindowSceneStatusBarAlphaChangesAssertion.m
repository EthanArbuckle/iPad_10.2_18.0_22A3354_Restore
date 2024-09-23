@implementation SBDisableWindowSceneStatusBarAlphaChangesAssertion

- (id)_initWithWindowSceneStatusBarAssertionManager:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDisableWindowSceneStatusBarAlphaChangesAssertion;
  v7 = -[SBBaseWindowSceneStatusBarChangeAssertion _initWithWindowSceneStatusBarAssertionManager:reason:](&v9, sel__initWithWindowSceneStatusBarAssertionManager_reason_, v6, a4);
  if (v7)
    objc_msgSend(v6, "_addDisableWindowSceneStatusBarAlphaChangesAssertion:", v7);

  return v7;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._assertionManager);
  objc_msgSend(WeakRetained, "_removeDisableWindowSceneStatusBarAlphaChangesAssertion:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBDisableWindowSceneStatusBarAlphaChangesAssertion;
  -[SBDisableWindowSceneStatusBarAlphaChangesAssertion dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._assertionManager);
  objc_msgSend(WeakRetained, "_removeDisableWindowSceneStatusBarAlphaChangesAssertion:", self);

}

@end
