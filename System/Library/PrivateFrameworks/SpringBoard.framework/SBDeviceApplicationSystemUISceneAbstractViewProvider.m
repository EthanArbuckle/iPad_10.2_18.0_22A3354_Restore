@implementation SBDeviceApplicationSystemUISceneAbstractViewProvider

- (void)noteDisplayModeChange:(int64_t)a3
{
  id WeakRetained;

  self->_displayMode = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemUIScenePresentingDelegate);
  objc_msgSend(WeakRetained, "scenePresenterVisibilityDidChange:", self);

}

- (void)_activateIfPossible
{
  objc_super v2;

  if (self->_systemSceneUIViewController)
  {
    self->_isActive = 1;
    v2.receiver = self;
    v2.super_class = (Class)SBDeviceApplicationSystemUISceneAbstractViewProvider;
    -[SBDeviceApplicationSceneOverlayViewProvider _activateIfPossible](&v2, sel__activateIfPossible);
  }
  else
  {
    -[SBDeviceApplicationSystemUISceneAbstractViewProvider _acquireSystemUIScenePresentingAssertionIfNecessary](self, "_acquireSystemUIScenePresentingAssertionIfNecessary");
  }
}

- (void)_acquireSystemUIScenePresentingAssertionIfNecessary
{
  BSInvalidatable *v3;
  BSInvalidatable *systemUIScenePresenterAssertion;

  if (!self->_systemUIScenePresenterAssertion)
  {
    -[SBDeviceApplicationSystemUISceneAbstractViewProvider acquireSystemUIScenePresentingAssertion](self, "acquireSystemUIScenePresentingAssertion");
    v3 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    systemUIScenePresenterAssertion = self->_systemUIScenePresenterAssertion;
    self->_systemUIScenePresenterAssertion = v3;

  }
}

- (void)setPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_systemUIScenePresentingDelegate, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[SBDeviceApplicationSystemUISceneAbstractViewProvider _invalidateSystemUIScenePresentingAssertion](self, "_invalidateSystemUIScenePresentingAssertion");
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSystemUISceneAbstractViewProvider;
  -[SBDeviceApplicationSceneOverlayViewProvider dealloc](&v3, sel_dealloc);
}

- (BOOL)wantsResignActiveAssertion
{
  return 0;
}

- (id)acquireSystemUIScenePresentingAssertion
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSystemUISceneAbstractViewProvider.m"), 41, CFSTR("For subclasses to override, [%@] cannot be used on its own"), v6);

  return 0;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)_deactivateIfPossible
{
  UIViewController *systemSceneUIViewController;
  objc_super v4;

  if (self->_isActive)
  {
    self->_isActive = 0;
    systemSceneUIViewController = self->_systemSceneUIViewController;
    self->_systemSceneUIViewController = 0;

    v4.receiver = self;
    v4.super_class = (Class)SBDeviceApplicationSystemUISceneAbstractViewProvider;
    -[SBDeviceApplicationSceneOverlayViewProvider _deactivateIfPossible](&v4, sel__deactivateIfPossible);
  }
}

- (id)_realOverlayViewController
{
  return self->_systemSceneUIViewController;
}

- (BOOL)affectsStatusBarPresentation
{
  return 0;
}

- (id)presentScene:(id)a3 viewControllerBuilderBlock:(id)a4
{
  void *v5;
  UIViewController *v6;
  UIViewController *systemSceneUIViewController;
  uint64_t v8;
  UIViewController *v9;
  UIViewController *v10;
  UIViewController *v11;

  (*((void (**)(id, SEL, id))a4 + 2))(a4, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitsOrientedViewController");
  v6 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  if (!self->_isActive || v6 != self->_systemSceneUIViewController)
  {
    objc_storeStrong((id *)&self->_systemSceneUIViewController, v6);
    -[SBDeviceApplicationSystemUISceneAbstractViewProvider _activateIfPossible](self, "_activateIfPossible");
    systemSceneUIViewController = self->_systemSceneUIViewController;
    v8 = objc_opt_class();
    v9 = systemSceneUIViewController;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    -[UIViewController setContainerParticipant:](v11, "setContainerParticipant:", 0);
  }

  return 0;
}

- (id)dismissScene:(id)a3
{
  -[SBDeviceApplicationSystemUISceneAbstractViewProvider _deactivateIfPossible](self, "_deactivateIfPossible", a3);
  return 0;
}

- (id)parentSceneIdentityToken
{
  void *v2;
  void *v3;
  void *v4;

  -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identityToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)presentingDelegate
{
  return objc_loadWeakRetained((id *)&self->_systemUIScenePresentingDelegate);
}

- (BOOL)isVisibleOnScreen
{
  void *v3;
  char v4;

  -[SBDeviceApplicationSceneOverlayViewProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "overlayViewProviderIsHostedInSecureWindow:", self);

  return ((v4 & 1) != 0
       || !-[SBDeviceApplicationSystemUISceneAbstractViewProvider _isUnderUILock](self, "_isUnderUILock"))
      && self->_displayMode == 4;
}

- (BOOL)_isUnderUILock
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[SBDeviceApplicationSceneOverlayViewProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowSceneForOverlayViewProvider:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiLockStateProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUILocked");

  return v6;
}

- (void)_invalidateSystemUIScenePresentingAssertion
{
  BSInvalidatable *systemUIScenePresenterAssertion;

  -[BSInvalidatable invalidate](self->_systemUIScenePresenterAssertion, "invalidate");
  systemUIScenePresenterAssertion = self->_systemUIScenePresenterAssertion;
  self->_systemUIScenePresenterAssertion = 0;

}

- (void)scene:(id)a3 didChangeTraitsParticipantDelegate:(id)a4
{
  UIViewController *systemSceneUIViewController;
  uint64_t v5;
  UIViewController *v6;
  UIViewController *v7;
  UIViewController *v8;

  systemSceneUIViewController = self->_systemSceneUIViewController;
  v5 = objc_opt_class();
  v6 = systemSceneUIViewController;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  -[UIViewController setContainerParticipant:](v8, "setContainerParticipant:", 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)SBDeviceApplicationSystemUISceneAbstractViewProvider;
  -[SBDeviceApplicationSystemUISceneAbstractViewProvider description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_systemUIScenePresentingDelegate);
  objc_storeStrong((id *)&self->_systemUIScenePresenterAssertion, 0);
  objc_storeStrong((id *)&self->_systemSceneUIViewController, 0);
}

@end
