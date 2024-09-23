@implementation SBDisableWindowSceneStatusBarUserInteractionChangesAssertion

- (id)_initWithWindowSceneStatusBarAssertionManager:(id)a3 reason:(id)a4
{
  id *v4;
  id *v5;
  id WeakRetained;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBDisableWindowSceneStatusBarUserInteractionChangesAssertion;
  v4 = -[SBBaseWindowSceneStatusBarChangeAssertion _initWithWindowSceneStatusBarAssertionManager:reason:](&v8, sel__initWithWindowSceneStatusBarAssertionManager_reason_, a3, a4);
  v5 = v4;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained(v4 + 2);
    objc_msgSend(WeakRetained, "_addDisableWindowSceneStatusBarUserInteractionChangesAssertion:", v5);

  }
  return v5;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._assertionManager);
  objc_msgSend(WeakRetained, "_removeDisableWindowSceneStatusBarUserInteractionChangesAssertion:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBDisableWindowSceneStatusBarUserInteractionChangesAssertion;
  -[SBDisableWindowSceneStatusBarUserInteractionChangesAssertion dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._assertionManager);
  objc_msgSend(WeakRetained, "_removeDisableWindowSceneStatusBarUserInteractionChangesAssertion:", self);

}

@end
