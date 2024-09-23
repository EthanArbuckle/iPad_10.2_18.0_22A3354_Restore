@implementation SBDeviceApplicationAppProtectionSceneOverlayViewProvider

- (SBDeviceApplicationAppProtectionSceneOverlayViewProvider)initWithSceneHandle:(id)a3 delegate:(id)a4
{
  id v6;
  SBDeviceApplicationAppProtectionSceneOverlayViewProvider *v7;
  SBDeviceApplicationAppProtectionSceneOverlayViewProvider *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBDeviceApplicationAppProtectionSceneOverlayViewProvider;
  v7 = -[SBDeviceApplicationSceneOverlayViewProvider initWithSceneHandle:delegate:](&v12, sel_initWithSceneHandle_delegate_, v6, a4);
  v8 = v7;
  if (v7)
  {
    -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider _appProtectionAssistant](v7, "_appProtectionAssistant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:", v8);

    objc_msgSend(v6, "addObserver:", v8);
    if (objc_msgSend(v6, "isEffectivelyForeground"))
    {
      objc_msgSend(v6, "sceneIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider setSceneIdentifier:](v8, "setSceneIdentifier:", v10);

      -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider _acquireVisibilityAssertionIfNeeded](v8, "_acquireVisibilityAssertionIfNeeded");
    }
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationAppProtectionSceneOverlayViewProvider;
  -[SBDeviceApplicationSceneOverlayViewProvider dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationAppProtectionSceneOverlayViewProvider;
  -[SBDeviceApplicationSceneOverlayViewProvider invalidate](&v5, sel_invalidate);
  -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider _appProtectionAssistant](self, "_appProtectionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider _invalidateVisibilityAssertion](self, "_invalidateVisibilityAssertion");
  -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider setDeallocating:](self, "setDeallocating:", 1);
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  if (objc_msgSend(a3, "isEffectivelyForeground"))
    -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider _acquireVisibilityAssertionIfNeeded](self, "_acquireVisibilityAssertionIfNeeded");
}

- (void)sceneHandle:(id)a3 didChangeEffectiveForegroundness:(BOOL)a4
{
  if (a4)
    -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider _acquireVisibilityAssertionIfNeeded](self, "_acquireVisibilityAssertionIfNeeded", a3);
  else
    -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider _invalidateVisibilityAssertion](self, "_invalidateVisibilityAssertion", a3);
}

- (void)sceneHandle:(id)a3 replacedWithSceneHandle:(id)a4
{
  id v6;

  v6 = a4;
  objc_msgSend(a3, "removeObserver:", self);
  objc_msgSend(v6, "addObserver:", self);

}

- (id)_appProtectionAssistant
{
  void *v2;
  void *v3;
  void *v4;

  -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationAppProtectionAssistant assistantForApplication:](SBApplicationAppProtectionAssistant, "assistantForApplication:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_activateIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v7;

  -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider _appProtectionAssistant](self, "_appProtectionAssistant");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "shouldShield") & 1) != 0)
  {
    -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider shieldViewController](self, "shieldViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider _appProtectionAssistant](self, "_appProtectionAssistant");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "createShieldUIViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider setShieldViewController:](self, "setShieldViewController:", v5);

      v7.receiver = self;
      v7.super_class = (Class)SBDeviceApplicationAppProtectionSceneOverlayViewProvider;
      -[SBDeviceApplicationSceneOverlayViewProvider _activateIfPossible](&v7, sel__activateIfPossible);
    }
  }
  else
  {

  }
}

- (void)_deactivateIfPossible
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  objc_super v7;

  -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider shieldViewController](self, "shieldViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    if (-[SBDeviceApplicationAppProtectionSceneOverlayViewProvider isDeallocating](self, "isDeallocating"))
    {

    }
    else
    {
      -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider _appProtectionAssistant](self, "_appProtectionAssistant");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "shouldShield");

      if ((v6 & 1) != 0)
        return;
    }
    -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider setShieldViewController:](self, "setShieldViewController:", 0);
    v7.receiver = self;
    v7.super_class = (Class)SBDeviceApplicationAppProtectionSceneOverlayViewProvider;
    -[SBDeviceApplicationSceneOverlayViewProvider _deactivateIfPossible](&v7, sel__deactivateIfPossible);
  }
}

- (void)appProtectionAssistantShouldShieldDidChange:(id)a3
{
  void *v4;
  int v5;

  -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider _appProtectionAssistant](self, "_appProtectionAssistant", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShield");

  if (v5)
    -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider _activateIfPossible](self, "_activateIfPossible");
  else
    -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider _deactivateIfPossible](self, "_deactivateIfPossible");
}

- (int64_t)priority
{
  return 5;
}

- (BOOL)contentWantsSimplifiedOrientationBehavior
{
  return 1;
}

- (void)_acquireVisibilityAssertionIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;

  -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider visibilityAssertion](self, "visibilityAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider _appProtectionAssistant](self, "_appProtectionAssistant");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider sceneIdentifier](self, "sceneIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (const __CFString *)v4;
    else
      v6 = CFSTR("NULL scene");
    objc_msgSend(v8, "acquireVisibilityAssertionForReason:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider setVisibilityAssertion:](self, "setVisibilityAssertion:", v7);

  }
}

- (void)_invalidateVisibilityAssertion
{
  id v3;

  -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider visibilityAssertion](self, "visibilityAssertion");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationAppProtectionSceneOverlayViewProvider setVisibilityAssertion:](self, "setVisibilityAssertion:", 0);
  objc_msgSend(v3, "invalidate");

}

- (UIViewController)shieldViewController
{
  return self->_shieldViewController;
}

- (void)setShieldViewController:(id)a3
{
  objc_storeStrong((id *)&self->_shieldViewController, a3);
}

- (BOOL)isDeallocating
{
  return self->_deallocating;
}

- (void)setDeallocating:(BOOL)a3
{
  self->_deallocating = a3;
}

- (BSInvalidatable)visibilityAssertion
{
  return self->_visibilityAssertion;
}

- (void)setVisibilityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_visibilityAssertion, a3);
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_visibilityAssertion, 0);
  objc_storeStrong((id *)&self->_shieldViewController, 0);
}

@end
