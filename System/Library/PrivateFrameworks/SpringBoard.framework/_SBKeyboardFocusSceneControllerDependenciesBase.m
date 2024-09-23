@implementation _SBKeyboardFocusSceneControllerDependenciesBase

- (_SBKeyboardFocusSceneControllerDependenciesBase)initWithScene:(id)a3 deliveryManager:(id)a4 sceneProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  _SBKeyboardFocusSceneControllerDependenciesBase *v11;
  _SBKeyboardFocusSceneControllerDependenciesBase *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_SBKeyboardFocusSceneControllerDependenciesBase;
  v11 = -[_SBKeyboardFocusSceneControllerDependenciesBase init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_sbWindowScene, v8);
    objc_storeStrong((id *)&v12->_deliveryManager, a4);
    objc_storeStrong((id *)&v12->_sceneProvider, a5);
  }

  return v12;
}

- (BKSHIDEventDeliveryManager)deliveryManager
{
  return self->_deliveryManager;
}

- (BOOL)isCoverSheetHostingAnApp
{
  void *v2;
  char v3;

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCoverSheetHostingAnApp");

  return v3;
}

- (id)focusTargetForCoverSheetHostedAppGetCameraIsHosted:(BOOL *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coverSheetHostedAppSceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cameraApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = objc_msgSend(v6, "isEqual:", v9);

    +[SBKeyboardFocusTarget targetForFBScene:](SBKeyboardFocusTarget, "targetForFBScene:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isPresentingModalBannerInLongLook
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend((id)SBApp, "notificationDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bannerDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPresentingBannerInLongLook");

  return v4;
}

- (BOOL)isShowingSystemModalAlert
{
  void *v2;
  char v3;

  objc_msgSend((id)SBApp, "modalAlertPresentationCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShowingSystemModalAlert");

  return v3;
}

- (BOOL)isBannerKitHostingSceneWithIdentityTokenString:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  objc_msgSend(WeakRetained, "bannerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedPresentables");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98___SBKeyboardFocusSceneControllerDependenciesBase_isBannerKitHostingSceneWithIdentityTokenString___block_invoke;
  v12[3] = &unk_1E8EA1118;
  v13 = v4;
  v9 = v4;
  v10 = objc_msgSend(v8, "bs_containsObjectPassingTest:", v12);

  return v10;
}

- (BOOL)hasActiveTransientOverlayPresentation
{
  void *v2;
  void *v3;
  char v4;

  +[SBMainWorkspace sharedInstanceIfExists](SBMainWorkspace, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientOverlayPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasActivePresentation");

  return v4;
}

- (BOOL)activeTransientOverlayPresentationCanBecomeFirstResponder
{
  void *v2;
  void *v3;
  char v4;

  +[SBMainWorkspace sharedInstanceIfExists](SBMainWorkspace, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientOverlayPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "canActivePresentationBecomeLocalFirstResponder") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "canActivePresentationBecomeFirstResponder");

  return v4;
}

- (BOOL)activeTransientOverlayPresentationShouldUseSceneBasedKeyboardFocus
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  char v5;

  v2 = -[_SBKeyboardFocusSceneControllerDependenciesBase hasActiveTransientOverlayPresentation](self, "hasActiveTransientOverlayPresentation");
  if (v2)
  {
    +[SBMainWorkspace sharedInstanceIfExists](SBMainWorkspace, "sharedInstanceIfExists");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transientOverlayPresentationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldUseSceneBasedKeyboardFocusForActivePresentation");

    LOBYTE(v2) = v5;
  }
  return v2;
}

- (BOOL)isSpolightPresentedAsTransientOverlay
{
  void *v2;
  void *v3;
  char v4;

  +[SBMainWorkspace sharedInstanceIfExists](SBMainWorkspace, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientOverlayPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasActiveSpotlightPresentation");

  return v4;
}

- (BOOL)isActiveTransientOverlayPresentationIsFromSceneWithIdentityTokenString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  +[SBMainWorkspace sharedInstanceIfExists](SBMainWorkspace, "sharedInstanceIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientOverlayPresentationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTopmostPresentationFromSceneWithIdentityTokenString:", v3);

  return v6;
}

- (SBKeyboardFocusTarget)focusTargetForActiveTransientOverlayPresentation
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;

  +[SBMainWorkspace sharedInstanceIfExists](SBMainWorkspace, "sharedInstanceIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transientOverlayPresentationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  objc_msgSend(v4, "keyboardFocusTargetForSBWindowScene:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBKeyboardFocusTarget *)v6;
}

- (_UIEventDeferringSystemShellBehaviorDelegate)eventDeferringSystemShellBehaviorDelegate
{
  return (_UIEventDeferringSystemShellBehaviorDelegate *)+[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
}

- (SBKeyboardFocusSceneProviding)sceneProvider
{
  return self->_sceneProvider;
}

- (BOOL)isScreenDim
{
  void *v2;
  char v3;

  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "screenIsDim");

  return v3;
}

- (BOOL)isSiriVisible
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  objc_msgSend(WeakRetained, "assistantController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVisible");

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneProvider, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
  objc_destroyWeak((id *)&self->_sbWindowScene);
}

@end
