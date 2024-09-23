@implementation SBDeviceApplicationSceneHandle

- (int64_t)_launchingInterfaceOrientationForOrientation:(int64_t)a3
{
  void *v6;
  void *v7;
  char v8;
  int64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  BOOL v17;
  int v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;

  if (-[SBDeviceApplicationSceneHandle currentInterfaceOrientation](self, "currentInterfaceOrientation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneHandle.m"), 976, CFSTR("Don't calculate a launch orientation for a running app. Really."));

  }
  -[SBApplicationSceneHandle application](self, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
    a3 = objc_msgSend((id)SBApp, "interfaceOrientationForCurrentDeviceOrientation:", 1);
  -[SBApplicationSceneHandle application](self, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isMedusaCapable");

  if ((v8 & 1) != 0)
  {
LABEL_6:
    v9 = a3;
    if (a3)
      goto LABEL_12;
    goto LABEL_7;
  }
  v13 = objc_msgSend((id)SBApp, "homeScreenRotationStyle");
  objc_msgSend(v6, "info");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "builtOnOrAfterSDKVersion:", CFSTR("8.0"));

  v16 = -[SBDeviceApplicationSceneHandle _currentClassicModeAllowsLaunchingToAnySupportedOrientation](self, "_currentClassicModeAllowsLaunchingToAnySupportedOrientation");
  v17 = -[SBDeviceApplicationSceneHandle _mainSceneSupportsInterfaceOrientation:](self, "_mainSceneSupportsInterfaceOrientation:", a3);
  v9 = -[SBDeviceApplicationSceneHandle _interfaceOrientationFromUserResizing](self, "_interfaceOrientationFromUserResizing");
  if (v9)
    goto LABEL_12;
  if (v13)
    v19 = 1;
  else
    v19 = v15;
  if ((v19 & v16) == 1)
  {
    if (!v17)
    {
      +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isUserLocked");

      if (v21)
      {
        v22 = objc_msgSend((id)SBApp, "rawDeviceOrientationIgnoringOrientationLocks");
        if ((unint64_t)(v22 - 5) >= 0xFFFFFFFFFFFFFFFCLL)
        {
          v9 = v22;
          if (v22 != a3
            && -[SBDeviceApplicationSceneHandle _mainSceneSupportsInterfaceOrientation:](self, "_mainSceneSupportsInterfaceOrientation:", v22))
          {
            goto LABEL_12;
          }
        }
      }
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  -[SBApplicationSceneHandle application](self, "application");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "classicAppPhoneAppRunningOnPad");

  if (v24)
  {
    a3 = -[SBDeviceApplicationSceneHandle _classicPhoneOnPadActivationOrientationForOrientation:](self, "_classicPhoneOnPadActivationOrientationForOrientation:", a3);
    goto LABEL_6;
  }
LABEL_7:
  v9 = -[SBDeviceApplicationSceneHandle defaultInterfaceOrientation](self, "defaultInterfaceOrientation");
  if (!v9)
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

    if (v11)
    {
      -[SBDeviceApplicationSceneHandle sceneIdentifier](self, "sceneIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("No fallback orientation for '%@'!"), v12);

    }
    v9 = 1;
  }
LABEL_12:

  return v9;
}

- (BOOL)_mainSceneSupportsInterfaceOrientation:(int64_t)a3
{
  unint64_t v3;

  v3 = -[SBDeviceApplicationSceneHandle _mainSceneSupportedInterfaceOrientations](self, "_mainSceneSupportedInterfaceOrientations");
  return (XBInterfaceOrientationMaskForInterfaceOrientation() & v3) != 0;
}

- (unint64_t)_mainSceneSupportedInterfaceOrientations
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[SBApplicationSceneHandle application](self, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isMedusaCapable") & 1) != 0)
  {
    v5 = 30;
  }
  else
  {
    v5 = objc_msgSend(v4, "supportedInterfaceOrientations");
    -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "uiClientSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "supportedInterfaceOrientations");

    }
  }

  return v5;
}

- (int64_t)activationInterfaceOrientationForOrientation:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  int64_t result;
  void *v8;
  int v9;

  v5 = -[SBDeviceApplicationSceneHandle currentInterfaceOrientation](self, "currentInterfaceOrientation");
  if (!v5)
    return -[SBDeviceApplicationSceneHandle _launchingInterfaceOrientationForOrientation:](self, "_launchingInterfaceOrientationForOrientation:", a3);
  v6 = v5;
  result = -[SBDeviceApplicationSceneHandle _interfaceOrientationFromUserResizing](self, "_interfaceOrientationFromUserResizing");
  if (!result)
  {
    -[SBApplicationSceneHandle application](self, "application");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "classicAppPhoneAppRunningOnPad");

    result = v6;
    if (v9)
    {
      result = -[SBDeviceApplicationSceneHandle _classicPhoneOnPadActivationOrientationForOrientation:](self, "_classicPhoneOnPadActivationOrientationForOrientation:", a3);
      if (!result)
        return v6;
    }
  }
  return result;
}

- (int64_t)currentInterfaceOrientation
{
  void *v2;
  int64_t v3;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentInterfaceOrientation");

  return v3;
}

- (BOOL)_currentClassicModeAllowsLaunchingToAnySupportedOrientation
{
  void *v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  if (objc_msgSend((id)SBApp, "homeScreenRotationStyle"))
  {
    if ((__sb__runningInSpringBoard() & 1) != 0)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
LABEL_4:
        -[SBApplicationSceneHandle application](self, "application");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v3, "_classicMode");

        return (unint64_t)(v4 - 3) < 0xFFFFFFFFFFFFFFFELL;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "userInterfaceIdiom");

      if (v7 != 1)
        goto LABEL_4;
    }
  }
  -[SBApplicationSceneHandle application](self, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "classicAppPhoneAppRunningOnPad");

  return v9 ^ 1;
}

- (SBDeviceApplicationSceneStatusBarStateProvider)statusBarStateProvider
{
  SBDeviceApplicationSceneStatusBarStateProvider *statusBarStateProvider;
  SBDeviceApplicationSceneStatusBarStateProvider *v4;
  SBDeviceApplicationSceneStatusBarStateProvider *v5;

  statusBarStateProvider = self->_statusBarStateProvider;
  if (!statusBarStateProvider)
  {
    v4 = -[SBDeviceApplicationSceneStatusBarStateProvider _initWithSceneHandle:]([SBDeviceApplicationSceneStatusBarStateProvider alloc], "_initWithSceneHandle:", self);
    v5 = self->_statusBarStateProvider;
    self->_statusBarStateProvider = v4;

    statusBarStateProvider = self->_statusBarStateProvider;
  }
  return statusBarStateProvider;
}

- (int64_t)defaultInterfaceOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SBApplicationSceneHandle application](self, "application");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_launchingInterfaceOrientation");

  return v4;
}

- (NSSet)backgroundActivitiesToSuppress
{
  return self->_backgroundActivitiesToSuppress;
}

- (int64_t)statusBarOrientation
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "currentInterfaceOrientation");
  else
    v5 = -[SBDeviceApplicationSceneHandle activationInterfaceOrientationForCurrentOrientation](self, "activationInterfaceOrientationForCurrentOrientation");
  v6 = v5;

  return v6;
}

- (BOOL)isEffectivelyForeground
{
  return self->_isEffectivelyForeground;
}

- (BOOL)isHostedSecureApp
{
  return self->_hostedSecureApp;
}

- (int64_t)activationInterfaceOrientationForCurrentOrientation
{
  return -[SBDeviceApplicationSceneHandle activationInterfaceOrientationForOrientation:](self, "activationInterfaceOrientationForOrientation:", 0);
}

- (BOOL)isDeviceApplicationSceneHandle
{
  return 1;
}

- (void)setHasMainSceneBeenForegroundAtLeastOnce:(BOOL)a3
{
  self->_hasMainSceneBeenForegroundAtLeastOnce = a3;
}

- (id)_windowScene
{
  void *v3;
  void *v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowSceneForSceneHandle:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isAutoHideEnabledForHomeAffordance
{
  void *v2;
  void *v3;
  char v4;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uiClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "homeIndicatorAutoHidden");

  return v4;
}

- (id)statusBarEffectiveStyleRequestWithStyle:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0F20]), "initWithResolvedStyle:foregroundColor:", a3, 0);
}

- (int64_t)statusBarParts
{
  return self->_statusBarParts;
}

- (SBDeviceApplicationSceneStatusBarBreadcrumbProvider)breadcrumbProvider
{
  return self->_breadcrumbProvider;
}

- (CGRect)statusBarAvoidanceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_statusBarAvoidanceFrame.origin.x;
  y = self->_statusBarAvoidanceFrame.origin.y;
  width = self->_statusBarAvoidanceFrame.size.width;
  height = self->_statusBarAvoidanceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)currentEffectiveStatusBarStyleRequest
{
  return -[SBDeviceApplicationSceneHandle statusBarEffectiveStyleRequestWithStyle:](self, "statusBarEffectiveStyleRequestWithStyle:", -[SBDeviceApplicationSceneHandle currentStatusBarStyle](self, "currentStatusBarStyle"));
}

- (int64_t)currentStatusBarStyle
{
  void *v2;
  int64_t v3;

  -[SBDeviceApplicationSceneHandle statusBarStateProvider](self, "statusBarStateProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusBarStyle");

  return v3;
}

- (int64_t)_defaultStatusBarStyleFromSceneDataStore
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeObjectForKey:ofType:", CFSTR("statusBarStyle"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (int)objc_msgSend(v3, "intValue");
  else
    v4 = -1;

  return v4;
}

- (BOOL)defaultStatusBarHiddenForOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeObjectForKey:ofType:", CFSTR("statusBarHidden"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    -[SBApplicationSceneHandle application](self, "application");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "info");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDeviceApplicationSceneHandle _potentiallyJailedDisplayConfiguration](self, "_potentiallyJailedDisplayConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "statusBarHiddenForInterfaceOrientation:onDisplay:", a3, v10);

  }
  return v7;
}

- (id)_potentiallyJailedDisplayConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  -[SBApplicationSceneHandle application](self, "application");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restrictedClassicModeDisplayConfigurationForDisplayConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)_interfaceOrientationFromUserResizing
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeObjectForKey:ofType:", CFSTR("interfaceOrientationFromUserResizing"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return v5;
}

- (id)_sceneDataStoreCreatingIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  -[SBApplicationSceneHandle application](self, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneHandle sceneIdentifier](self, "sceneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneStoreForIdentifier:creatingIfNecessary:", v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)additionalActionsForActivatingSceneEntity:(id)a3 withTransitionContext:(id)a4
{
  -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider captureContextForActivatingSceneEntity:withTransitionContext:](self->_breadcrumbProvider, "captureContextForActivatingSceneEntity:withTransitionContext:", a3, a4);
  return 0;
}

void __56__SBDeviceApplicationSceneHandle__noteSceneTitleChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sceneHandle:didChangeSceneTitle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)_supportsMixedOrientation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SBDeviceApplicationSceneHandle _windowScene](self, "_windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "windowManagementStyle");

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sb_displayIdentityForSceneManagers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBApplicationSceneHandle application](self, "application");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "supportsMixedOrientationForSwitcherWindowManagementStyle:displayIdentity:", v5, v8);

  return (char)v6;
}

- (void)setWantsEnhancedWindowingEnabled:(BOOL)a3
{
  self->_wantsEnhancedWindowingEnabled = a3;
}

- (void)setStatusBarParts:(int64_t)a3
{
  _QWORD v3[6];

  if (self->_statusBarParts != a3)
  {
    self->_statusBarParts = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __52__SBDeviceApplicationSceneHandle_setStatusBarParts___block_invoke;
    v3[3] = &unk_1E8EB0C78;
    v3[4] = self;
    v3[5] = a3;
    -[SBDeviceApplicationSceneHandle _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v3);
  }
}

- (void)setStatusBarAvoidanceFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_statusBarAvoidanceFrame;
  _QWORD v9[9];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_statusBarAvoidanceFrame = &self->_statusBarAvoidanceFrame;
  if (!CGRectEqualToRect(self->_statusBarAvoidanceFrame, a3))
  {
    p_statusBarAvoidanceFrame->origin.x = x;
    p_statusBarAvoidanceFrame->origin.y = y;
    p_statusBarAvoidanceFrame->size.width = width;
    p_statusBarAvoidanceFrame->size.height = height;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__SBDeviceApplicationSceneHandle_setStatusBarAvoidanceFrame___block_invoke;
    v9[3] = &unk_1E8EB0CA0;
    v9[4] = self;
    *(CGFloat *)&v9[5] = x;
    *(CGFloat *)&v9[6] = y;
    *(CGFloat *)&v9[7] = width;
    *(CGFloat *)&v9[8] = height;
    -[SBDeviceApplicationSceneHandle _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v9);
  }
}

- (id)newSceneViewWithReferenceSize:(CGSize)a3 contentOrientation:(int64_t)a4 containerOrientation:(int64_t)a5 hostRequester:(id)a6
{
  double height;
  double width;
  id v11;
  SBDeviceApplicationSceneView *v12;

  height = a3.height;
  width = a3.width;
  v11 = a6;
  v12 = -[SBDeviceApplicationSceneView initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:]([SBDeviceApplicationSceneView alloc], "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:hostRequester:", self, a4, a5, v11, width, height);

  return v12;
}

- (BOOL)shouldPrioritizeForSwitcherOrdering
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_opt_class();
    objc_msgSend(v2, "uiClientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v5 != 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)prefersKillingInSwitcherDisabled
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_opt_class();
    objc_msgSend(v3, "uiClientSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6 != 0;
  }
  else
  {
    -[SBDeviceApplicationSceneHandle _definition](self, "_definition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "specification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend((id)objc_msgSend(v8, "clientSettingsClass"), "isEqual:", objc_opt_class());

  }
  return v7;
}

- (BOOL)prefersHeaderHiddenInSwitcher
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_opt_class();
    objc_msgSend(v2, "uiSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = objc_msgSend(v5, "isScreenSharingPresentation") ^ 1;
    else
      LOBYTE(v6) = 0;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isEdgeProtectEnabledForHomeGesture
{
  _BOOL8 v3;

  if (SBFEffectiveHomeButtonType() == 2
    && -[SBDeviceApplicationSceneHandle isAutoHideEnabledForHomeAffordance](self, "isAutoHideEnabledForHomeAffordance"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    return (-[SBDeviceApplicationSceneHandle screenEdgesDeferringSystemGestures](self, "screenEdgesDeferringSystemGestures") >> 2) & 1;
  }
  return v3;
}

- (unint64_t)screenEdgesDeferringSystemGestures
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "uiClientSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "screenEdgesDeferringSystemGestures");
    -[SBApplicationSceneHandle application](self, "application");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isClassic") || (objc_msgSend(v7, "classicAppFullScreen") & 1) != 0)
      goto LABEL_16;
    if ((objc_msgSend(v7, "classicAppPhoneAppRunningOnPad") & 1) != 0)
    {
      v6 = 0;
LABEL_16:

      goto LABEL_17;
    }
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        goto LABEL_16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "userInterfaceIdiom");

      if (v9)
        goto LABEL_16;
    }
    if ((unint64_t)(-[SBDeviceApplicationSceneHandle currentInterfaceOrientation](self, "currentInterfaceOrientation")- 1) > 1)v10 = -11;
    else
      v10 = -6;
    v6 &= v10;
    goto LABEL_16;
  }
  v6 = 0;
LABEL_17:

  return v6;
}

- (BOOL)contentPrefersToDisableClipping
{
  return self->_contentPrefersToDisableClipping;
}

- (void)addObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneHandle;
  -[SBDeviceApplicationSceneHandle addObserver:](&v3, sel_addObserver_, a3);
}

- (int64_t)lastActivationSource
{
  return self->_lastActivationSource;
}

- (BOOL)forbidsActivationByBreadcrumbAction
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_opt_class();
    objc_msgSend(v2, "uiClientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v5 != 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)lastActivationIconLeafIdentifier
{
  return self->_lastActivationIconLeafIdentifier;
}

- (BOOL)_isEnhancedWindowingEffectivelyEnabled
{
  _BOOL4 v3;

  v3 = -[SBDeviceApplicationSceneHandle wantsEnhancedWindowingEnabled](self, "wantsEnhancedWindowingEnabled");
  if (v3)
    LOBYTE(v3) = !-[SBDeviceApplicationSceneHandle isHostedSecureApp](self, "isHostedSecureApp");
  return v3;
}

- (BOOL)wantsEnhancedWindowingEnabled
{
  return self->_wantsEnhancedWindowingEnabled;
}

void __85__SBDeviceApplicationSceneHandle__didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uiClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedInterfaceOrientations");

  objc_msgSend(WeakRetained, "_interfaceOrientationFromUserResizing");
  if ((SBFInterfaceOrientationMaskContainsInterfaceOrientation() & 1) == 0)
    objc_msgSend(WeakRetained, "_setInterfaceOrientationFromUserResizing:", 0);

}

- (void)_setInterfaceOrientationFromUserResizing:(int64_t)a3
{
  void *v4;
  id v5;

  -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", a3 != 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("interfaceOrientationFromUserResizing"));

}

- (unint64_t)_supportedInterfaceOrientationsFromSceneOrientationRequestSetup
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeObjectForKey:ofType:", CFSTR("supportedInterfaceOrientationsFromSceneOrientationRequestSetup"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return v5;
}

uint64_t __78__SBDeviceApplicationSceneHandle__populateSettingsWithDefaultStatusBarHeight___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  uint64_t v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = (double)objc_msgSend(a3, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");

  return objc_msgSend(v4, "setDefaultStatusBarHeight:forOrientation:", v7, v6);
}

- (void)_didUpdateClientSettingsWithDiff:(id)a3 transitionContext:(id)a4
{
  id v6;
  id v7;
  UIApplicationSceneClientSettingsDiffInspector *clientSettingsInspector;
  UIApplicationSceneClientSettingsDiffInspector *v9;
  UIApplicationSceneClientSettingsDiffInspector *v10;
  UIApplicationSceneClientSettingsDiffInspector *v11;
  uint64_t v12;
  UIApplicationSceneClientSettingsDiffInspector *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBDeviceApplicationSceneHandle;
  -[SBDeviceApplicationSceneHandle _didUpdateClientSettingsWithDiff:transitionContext:](&v21, sel__didUpdateClientSettingsWithDiff_transitionContext_, v6, v7);
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBDeviceApplicationSceneHandle _didUpdateClientSettingsWithDiff:transitionContext:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("SBDeviceApplicationSceneHandle.m"), 1235, CFSTR("this call must be made on the main thread"));

  }
  clientSettingsInspector = self->_clientSettingsInspector;
  if (!clientSettingsInspector)
  {
    v9 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA328]);
    v10 = self->_clientSettingsInspector;
    self->_clientSettingsInspector = v9;

    objc_initWeak(&location, self);
    v11 = self->_clientSettingsInspector;
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85__SBDeviceApplicationSceneHandle__didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
    v18[3] = &unk_1E8EA2658;
    objc_copyWeak(&v19, &location);
    -[UIApplicationSceneClientSettingsDiffInspector observeVisibleMiniAlertCountWithBlock:](v11, "observeVisibleMiniAlertCountWithBlock:", v18);
    v13 = self->_clientSettingsInspector;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __85__SBDeviceApplicationSceneHandle__didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2;
    v16[3] = &unk_1E8EA2658;
    objc_copyWeak(&v17, &location);
    -[UIApplicationSceneClientSettingsDiffInspector observeSupportedInterfaceOrientationsWithBlock:](v13, "observeSupportedInterfaceOrientationsWithBlock:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    clientSettingsInspector = self->_clientSettingsInspector;
  }
  -[UIApplicationSceneClientSettingsDiffInspector inspectDiff:withContext:](clientSettingsInspector, "inspectDiff:withContext:", v6, v7);

}

- (void)_modifyApplicationSceneClientSettings:(id)a3 fromRequestContext:(id)a4 entity:(id)a5 initialSceneSettings:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  objc_super v22;

  v10 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SBDeviceApplicationSceneHandle;
  v11 = a6;
  v12 = a5;
  -[SBApplicationSceneHandle _modifyApplicationSceneClientSettings:fromRequestContext:entity:initialSceneSettings:](&v22, sel__modifyApplicationSceneClientSettings_fromRequestContext_entity_initialSceneSettings_, v10, a4, v12, v11);
  -[SBApplicationSceneHandle application](self, "application");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "interfaceOrientation");
  objc_msgSend(v10, "setInterfaceOrientation:", v14);
  v15 = objc_msgSend(v11, "interfaceOrientationMode");

  if (v15 == 1)
    objc_msgSend(v10, "setSupportedInterfaceOrientations:", -[SBDeviceApplicationSceneHandle _mainSceneSupportedInterfaceOrientations](self, "_mainSceneSupportedInterfaceOrientations"));
  objc_msgSend(v10, "setBackgroundStyle:", -[SBDeviceApplicationSceneHandle backgroundStyle](self, "backgroundStyle"));
  objc_msgSend(v10, "setProximityDetectionModes:", 1);
  objc_msgSend(v12, "activationSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStatusBarModernStyle:", -[SBDeviceApplicationSceneHandle _statusBarStyleWithActivationSettings:](self, "_statusBarStyleWithActivationSettings:", v16));

  objc_msgSend(v12, "activationSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStatusBarHidden:", -[SBDeviceApplicationSceneHandle isStatusBarHiddenForActivation:forOrientation:](self, "isStatusBarHiddenForActivation:forOrientation:", v17, v14));

  -[SBDeviceApplicationSceneHandle statusBarAlpha](self, "statusBarAlpha");
  objc_msgSend(v10, "setStatusBarAlpha:");
  objc_msgSend(v10, "setDefaultStatusBarStyle:", _SBStatusBarLegacyStyleFromStyle(-[SBDeviceApplicationSceneHandle defaultStatusBarStyle](self, "defaultStatusBarStyle")));
  objc_msgSend(v10, "setDefaultStatusBarHidden:", -[SBDeviceApplicationSceneHandle defaultStatusBarHiddenForOrientation:](self, "defaultStatusBarHiddenForOrientation:", v14));
  v21 = 0.0;
  -[SBDeviceApplicationSceneHandle sceneIdentifier](self, "sceneIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_defaultPNGNameFromSuspensionSettingsWithExpiration:sceneID:", &v21, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setDefaultPNGName:", v19);
  objc_msgSend(v10, "setDefaultPNGExpirationTime:", v21);
  objc_msgSend(v12, "activationSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setCompatibilityMode:", -[SBDeviceApplicationSceneHandle _initialMainSceneCompabilityMode:](self, "_initialMainSceneCompabilityMode:", v20));
  objc_msgSend(v10, "setReachabilitySupported:", 1);
  objc_msgSend(v10, "setWhitePointAdaptivityStyle:", -[SBDeviceApplicationSceneHandle whitePointAdaptivityStyle](self, "whitePointAdaptivityStyle"));

}

- (int64_t)whitePointAdaptivityStyle
{
  return self->_whitePointAdaptivityStyle;
}

- (int64_t)_statusBarStyleWithActivationSettings:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;

  objc_msgSend(a3, "objectForActivationSetting:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (v6 = -[SBDeviceApplicationSceneHandle _defaultStatusBarStyleFromSceneDataStore](self, "_defaultStatusBarStyleFromSceneDataStore"), v6 == -1))
  {
    -[SBDeviceApplicationSceneHandle statusBarStateProvider](self, "statusBarStateProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "statusBarStyle");

  }
  else
  {
    v7 = _SBStatusBarStyleFromLegacyStyle(v6);
  }

  return v7;
}

- (int64_t)defaultStatusBarStyle
{
  void *v2;
  int64_t v3;

  -[SBDeviceApplicationSceneHandle statusBarStateProvider](self, "statusBarStateProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "defaultStatusBarStyle");

  return v3;
}

- (void)_modifyApplicationTransitionContext:(id)a3 fromRequestContext:(id)a4 entity:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBDeviceApplicationSceneHandle;
  -[SBApplicationSceneHandle _modifyApplicationTransitionContext:fromRequestContext:entity:](&v15, sel__modifyApplicationTransitionContext_fromRequestContext_entity_, a3, v8, v9);
  objc_msgSend(v8, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "source");

  if (v11 != 11)
    -[SBDeviceApplicationSceneHandle setLastActivationSource:](self, "setLastActivationSource:", v11);
  objc_msgSend(v8, "previousEntities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "containsObject:", v9) & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v8, "entities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v9);

  if (v14)
  {
    objc_msgSend(v9, "objectForActivationSetting:", 45);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDeviceApplicationSceneHandle setLastActivationIconLeafIdentifier:](self, "setLastActivationIconLeafIdentifier:", v12);
LABEL_6:

  }
}

- (void)setLastActivationSource:(int64_t)a3
{
  self->_lastActivationSource = a3;
}

- (void)_modifyProcessExecutionContext:(id)a3 fromRequestContext:(id)a4 entity:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  objc_super v18;

  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBDeviceApplicationSceneHandle;
  v9 = a5;
  -[SBApplicationSceneHandle _modifyProcessExecutionContext:fromRequestContext:entity:](&v18, sel__modifyProcessExecutionContext_fromRequestContext_entity_, v8, a4, v9);
  -[SBApplicationSceneHandle application](self, "application", v18.receiver, v18.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForActivationSetting:", 20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v10, "_defaultClassicMode");
  v13 = objc_msgSend(v11, "integerValue");
  if (v11)
    v12 = v13;
  objc_msgSend(v8, "environment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "environment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v15, "initWithDictionary:", v16);

  }
  else
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }

  if (v12 != -1)
  {
    objc_msgSend(v10, "_setCurrentClassicMode:", v12);
    if (v11)
      objc_msgSend(v17, "setObject:forKey:", v11, CFSTR("CLASSIC_OVERRIDE"));
    objc_msgSend(v10, "_setCurrentClassicMode:", v12);
    if (objc_msgSend(v10, "classicAppPhoneAppRunningOnPad"))
      objc_msgSend(v17, "setObject:forKey:", CFSTR("iphone"), CFSTR("CLASSIC_SUFFIX"));
  }
  objc_msgSend(v8, "setEnvironment:", v17);

}

void __70__SBDeviceApplicationSceneHandle__noteMainSceneBackgroundStyleChanged__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  SBDefaultBackgroundColorForAppScene(objc_msgSend(v2, "isTranslucent") ^ 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColorWhileHosting:", v4);

}

- (BOOL)isTranslucent
{
  void *v2;
  int v4;
  char v5;
  void *v6;
  char v7;

  v4 = __sb__runningInSpringBoard();
  v5 = v4;
  if (v4)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      return -[SBDeviceApplicationSceneHandle wallpaperStyle](self, "wallpaperStyle") != 1;
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if ((v5 & 1) != 0)
        return -[SBDeviceApplicationSceneHandle wallpaperStyle](self, "wallpaperStyle") != 1;
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
    {
LABEL_12:

      return -[SBDeviceApplicationSceneHandle wallpaperStyle](self, "wallpaperStyle") != 1;
    }
  }
  -[SBApplicationSceneHandle application](self, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isClassic");

  if ((v5 & 1) != 0)
  {
    if ((v7 & 1) == 0)
      return -[SBDeviceApplicationSceneHandle wallpaperStyle](self, "wallpaperStyle") != 1;
  }
  else
  {

    if ((v7 & 1) == 0)
      return -[SBDeviceApplicationSceneHandle wallpaperStyle](self, "wallpaperStyle") != 1;
  }
  return 1;
}

- (int64_t)wallpaperStyle
{
  -[SBDeviceApplicationSceneHandle backgroundStyle](self, "backgroundStyle");
  return _WallpaperStyleForBackgroundStyle();
}

- (int64_t)backgroundStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBApplicationSceneHandle application](self, "application");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uiClientSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "backgroundStyleForRequestedBackgroundStyle:", objc_msgSend(v6, "backgroundStyle"));

  }
  else
  {
    v7 = -[SBDeviceApplicationSceneHandle defaultBackgroundStyle](self, "defaultBackgroundStyle");
  }

  return v7;
}

- (int64_t)defaultBackgroundStyle
{
  return self->_defaultBackgroundStyle;
}

- (double)statusBarAlpha
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "uiClientSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusBarAlpha");
    v7 = v6;

  }
  else
  {
    -[SBDeviceApplicationSceneHandle defaultStatusBarAlpha](self, "defaultStatusBarAlpha");
    v7 = v8;
  }

  return v7;
}

- (void)setLastActivationIconLeafIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (SBScenePlaceholderContentViewProvider)placeholderContentProvider
{
  return self->_placeholderContentProvider;
}

- (BOOL)isStatusBarHiddenForActivation:(id)a3 forOrientation:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  objc_msgSend(a3, "objectForActivationSetting:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || v7)
  {
    v11 = -[SBDeviceApplicationSceneHandle defaultStatusBarHiddenForOrientation:](self, "defaultStatusBarHiddenForOrientation:", a4);
  }
  else
  {
    -[SBDeviceApplicationSceneHandle scene](self, "scene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uiClientSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "statusBarHidden");

  }
  return v11;
}

- (double)defaultStatusBarAlpha
{
  return 1.0;
}

- (int64_t)_initialMainSceneCompabilityMode:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  v4 = a3;
  -[SBApplicationSceneHandle application](self, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isClassic");
  objc_msgSend(v4, "objectForActivationSetting:", 20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  if (_SBApplicationClassicModeIsClassic(v8) || v6)
  {
    if (objc_msgSend(v5, "classicAppZoomedIn"))
      v9 = 2;
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_sceneHostingInfoForSnapshottingAssertionWithView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _SBDeviceApplicationSceneHandleSnapshottingAssertion *v7;
  uint64_t v8;
  void *v9;
  uint64_t RenderId;
  void *v11;
  void *v12;
  void *v13;
  _SBDeviceApplicationSceneHandleSnapshottingAssertion *v14;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    v8 = objc_msgSend(v5, "_contextId");
    objc_msgSend(v4, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    RenderId = CALayerGetRenderId();

    v11 = (void *)MEMORY[0x1E0CB3940];
    -[SBDeviceApplicationSceneHandle sceneIdentifier](self, "sceneIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%lu-%lu"), v12, v8, RenderId);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v14 = [_SBDeviceApplicationSceneHandleSnapshottingAssertion alloc];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __84__SBDeviceApplicationSceneHandle__sceneHostingInfoForSnapshottingAssertionWithView___block_invoke;
    v16[3] = &unk_1E8EB0DC8;
    objc_copyWeak(&v17, &location);
    v7 = -[_SBDeviceApplicationSceneHandleSnapshottingAssertion initWithIdentifier:forReason:contextId:renderId:invalidationBlock:](v14, "initWithIdentifier:forReason:contextId:renderId:invalidationBlock:", v13, CFSTR("SnapshottingMetadata"), v8, RenderId, v16);
    -[SBDeviceApplicationSceneHandle _addSnapshottingInfoAssertion:](self, "_addSnapshottingInfoAssertion:", v7);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v7;
}

- (int64_t)_interfaceOrientationMode
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "uiSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "interfaceOrientationMode");
  }
  else
  {
    -[SBApplicationSceneHandle application](self, "application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (_SBApplicationClassicModeIsClassic(objc_msgSend(v5, "_defaultClassicMode")))
      v6 = 1;
    else
      v6 = 2;
  }

  return v6;
}

- (void)_addSnapshottingInfoAssertion:(id)a3
{
  id v4;
  NSMutableArray *snapshottingInfoAssertions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id obj;

  v4 = a3;
  snapshottingInfoAssertions = self->_snapshottingInfoAssertions;
  obj = v4;
  if (!snapshottingInfoAssertions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_snapshottingInfoAssertions;
    self->_snapshottingInfoAssertions = v6;

    v4 = obj;
    snapshottingInfoAssertions = self->_snapshottingInfoAssertions;
  }
  -[NSMutableArray addObject:](snapshottingInfoAssertions, "addObject:", v4);
  objc_storeWeak((id *)&self->_currentSnapshottingInfoAssertion, obj);
  -[SBDeviceApplicationSceneHandle _updateSceneHostingInfoForSnapshottingWithAssertion:forceUpdate:](self, "_updateSceneHostingInfoForSnapshottingWithAssertion:forceUpdate:", obj, 1);

}

- (void)_updateSceneHostingInfoForSnapshottingWithAssertion:(id)a3 forceUpdate:(BOOL)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  int v13;

  v6 = a3;
  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isValid"))
  {
    v8 = objc_msgSend(v6, "contextId");
    v9 = objc_msgSend(v6, "renderId");
    objc_msgSend(v7, "uiSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a4
      || objc_msgSend(v10, "hostContextIdentifierForSnapshotting") == v8
      && objc_msgSend(v11, "scenePresenterRenderIdentifierForSnapshotting") == v9)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __98__SBDeviceApplicationSceneHandle__updateSceneHostingInfoForSnapshottingWithAssertion_forceUpdate___block_invoke;
      v12[3] = &__block_descriptor_44_e43_v16__0__UIMutableApplicationSceneSettings_8l;
      v13 = v8;
      v12[4] = v9;
      objc_msgSend(v7, "updateUISettingsWithBlock:", v12);
    }

  }
}

- (void)_setIdleTimerCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_idleTimerCoordinator, a3);
}

- (BOOL)shouldAlwaysDisplayLiveContent
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_opt_class();
    objc_msgSend(v2, "uiClientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v5 != 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __50__SBDeviceApplicationSceneHandle__didCreateScene___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPresentedLayerTypes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
}

- (BOOL)wantsDeviceOrientationEventsEnabled
{
  void *v3;
  void *v4;
  void *v5;
  char IsClassic;
  BOOL v7;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "uiSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IsClassic = objc_msgSend(v5, "deviceOrientationEventsEnabled");
  }
  else
  {
    -[SBApplicationSceneHandle application](self, "application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IsClassic = _SBApplicationClassicModeIsClassic(objc_msgSend(v5, "_defaultClassicMode"));
  }
  v7 = IsClassic;

  return v7;
}

- (id)effectiveStatusBarStyleRequestForActivation:(id)a3
{
  return -[SBDeviceApplicationSceneHandle statusBarEffectiveStyleRequestWithStyle:](self, "statusBarEffectiveStyleRequestWithStyle:", -[SBDeviceApplicationSceneHandle _statusBarStyleWithActivationSettings:](self, "_statusBarStyleWithActivationSettings:", a3));
}

void __98__SBDeviceApplicationSceneHandle__updateSceneHostingInfoForSnapshottingWithAssertion_forceUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setHostContextIdentifierForSnapshotting:", v3);
  objc_msgSend(v4, "setScenePresenterRenderIdentifierForSnapshotting:", *(_QWORD *)(a1 + 32));

}

- (void)_didCreateScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SBModalAlertPresenter *v10;
  SBModalAlertPresenter *modalAlertPresenter;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  APSubjectMonitorSubscription *v18;
  APSubjectMonitorSubscription *appProtectionSubscription;
  _QWORD v20[5];
  objc_super v21;

  v4 = a3;
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isEffectivelyForeground = objc_msgSend(v5, "isForeground");

  v21.receiver = self;
  v21.super_class = (Class)SBDeviceApplicationSceneHandle;
  -[SBDeviceApplicationSceneHandle _didCreateScene:](&v21, sel__didCreateScene_, v4);
  -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneHandle _definition](self, "_definition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uiSceneSessionRole");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("sceneSessionRole"));
  v10 = -[SBModalAlertPresenter initWithScene:]([SBModalAlertPresenter alloc], "initWithScene:", v4);
  modalAlertPresenter = self->_modalAlertPresenter;
  self->_modalAlertPresenter = v10;

  -[SBDeviceApplicationSceneHandle _noteMainSceneBackgroundStyleChanged](self, "_noteMainSceneBackgroundStyleChanged");
  -[SBApplicationSceneHandle application](self, "application");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "info");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneHandle setWhitePointAdaptivityStyle:](self, "setWhitePointAdaptivityStyle:", objc_msgSend(v13, "whitePointAdaptivityStyle"));

  objc_msgSend(v4, "uiPresentationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__SBDeviceApplicationSceneHandle__didCreateScene___block_invoke;
  v20[3] = &unk_1E8E9E758;
  v20[4] = self;
  objc_msgSend(v14, "modifyDefaultPresentationContext:", v20);

  objc_msgSend(v4, "clientProcess");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v15, "isApplicationProcess");

  if ((_DWORD)v13)
  {
    objc_msgSend(v4, "clientProcess");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:", self);

  }
  if (-[SBDeviceApplicationSceneHandle shouldApplyAppProtectionSceneSettings](self, "shouldApplyAppProtectionSceneSettings")&& !self->_appProtectionSubscription)
  {
    objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addMonitor:subjectMask:", self, 1);
    v18 = (APSubjectMonitorSubscription *)objc_claimAutoreleasedReturnValue();
    appProtectionSubscription = self->_appProtectionSubscription;
    self->_appProtectionSubscription = v18;

  }
  if (self->_occluded)
    -[SBDeviceApplicationSceneHandle _updateApplicationOcclusionRects](self, "_updateApplicationOcclusionRects");

}

- (void)_noteSceneTitleChanged
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[SBDeviceApplicationSceneHandle sceneTitle](self, "sceneTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__SBDeviceApplicationSceneHandle__noteSceneTitleChanged__block_invoke;
  v5[3] = &unk_1E8EB0D10;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  -[SBDeviceApplicationSceneHandle _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v5);

}

- (NSString)sceneTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "uiClientSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "canvasTitle");
  }
  else
  {
    -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("canvasTitle"));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setWhitePointAdaptivityStyle:(int64_t)a3
{
  self->_whitePointAdaptivityStyle = a3;
}

- (void)_noteMainSceneBackgroundStyleChanged
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uiPresentationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__SBDeviceApplicationSceneHandle__noteMainSceneBackgroundStyleChanged__block_invoke;
  v5[3] = &unk_1E8E9E758;
  v5[4] = self;
  objc_msgSend(v4, "modifyDefaultPresentationContext:", v5);

}

- (void)_didUpdateSettingsWithDiff:(id)a3 previousSettings:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  _QWORD v8[5];
  char v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBDeviceApplicationSceneHandle;
  -[SBDeviceApplicationSceneHandle _didUpdateSettingsWithDiff:previousSettings:](&v10, sel__didUpdateSettingsWithDiff_previousSettings_, a3, a4);
  -[SBDeviceApplicationSceneHandle scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isForeground");

  if (self->_isEffectivelyForeground != v7)
  {
    self->_isEffectivelyForeground = v7;
    if ((v7 & 1) == 0)
      -[SBDeviceApplicationSceneHandle _resetSceneOrientationRequestState](self, "_resetSceneOrientationRequestState");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __78__SBDeviceApplicationSceneHandle__didUpdateSettingsWithDiff_previousSettings___block_invoke;
    v8[3] = &unk_1E8EB0D38;
    v8[4] = self;
    v9 = v7;
    -[SBDeviceApplicationSceneHandle _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v8);
  }
}

- (void)_modifyApplicationSceneSettings:(id)a3 fromRequestContext:(id)a4 entity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  char v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  const __CFString *v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  objc_class *v77;
  void *v78;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  objc_super v84;
  uint8_t buf[4];
  uint64_t v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  SBDeviceApplicationSceneHandle *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v84.receiver = self;
  v84.super_class = (Class)SBDeviceApplicationSceneHandle;
  -[SBApplicationSceneHandle _modifyApplicationSceneSettings:fromRequestContext:entity:](&v84, sel__modifyApplicationSceneSettings_fromRequestContext_entity_, v8, v9, v10);
  v80 = v9;
  objc_msgSend(v9, "request");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationSceneHandle application](self, "application");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneHandle _windowScene](self, "_windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "switcherController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v11, "isClassic");
  v82 = v13;
  v15 = objc_msgSend(v13, "isChamoisWindowingUIEnabled");
  v16 = v10;
  v17 = objc_msgSend(v10, "BOOLForActivationSetting:", 71);
  v18 = v14;
  if ((v14 & 1) == 0)
  {
    v18 = v14;
    if (v15)
      v18 = (objc_msgSend(v11, "supportsChamoisSceneResizing") | v17) ^ 1;
  }
  if ((v14 & 1) != 0)
    v19 = 1;
  else
    v19 = objc_msgSend(v11, "supportsChamoisOnExternalDisplay") ^ 1;
  v83 = v11;
  if (objc_msgSend(v11, "supportsChamoisOnExternalDisplay"))
  {
    objc_msgSend(v8, "displayIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isContinuityDisplay");

  }
  else
  {
    v21 = 1;
  }
  objc_msgSend(v8, "displayConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (((v19 | v18) & 1) != 0 || v21)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "displayConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v83, "restrictedClassicModeDisplayConfigurationForDisplayConfiguration:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v83, "defaultLaunchingSizeForDisplayConfiguration:", v25);
      BSRectWithSize();
      objc_msgSend(v8, "setFrame:");
    }
    if ((v19 | v21) == 1)
    {
      if (v19)
        v26 = v25;
      else
        v26 = v24;
      objc_msgSend(v8, "setDisplayConfiguration:", v26);
    }

  }
  objc_msgSend(v8, "displayConfiguration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqual:", v22);

  if (v28)
    v29 = 0;
  else
    v29 = v22;
  objc_msgSend(v8, "sb_setDisplayConfigurationForSceneManagers:", v29);
  if (!v15)
  {
    v33 = 0;
    v32 = v80;
    goto LABEL_27;
  }
  objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isExternal");

  v32 = v80;
  if (((v31 ^ 1 | v21) & 1) != 0)
  {
    v33 = 0;
LABEL_27:
    v34 = v83;
    goto LABEL_29;
  }
  v34 = v83;
  v33 = objc_msgSend(v83, "supportsChamoisSceneResizing") ^ 1;
LABEL_29:
  objc_msgSend(v8, "setScreenBoundsIgnoresSceneOrientation:", v33);

  objc_msgSend(v34, "bundleIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v35, "isEqualToString:", CFSTR("com.apple.camera")))
  {
LABEL_37:

    goto LABEL_38;
  }
  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v36 = objc_claimAutoreleasedReturnValue();
  if (!v36)
  {
    v40 = objc_msgSend(v8, "isForeground");

    if (!v40)
      goto LABEL_38;
    goto LABEL_36;
  }
  v37 = (void *)v36;
  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "settings");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v39, "isForeground") & 1) != 0)
  {

    goto LABEL_37;
  }
  v41 = objc_msgSend(v8, "isForeground");

  if ((v41 & 1) != 0)
  {
LABEL_36:
    v42 = objc_msgSend(v81, "source");
    v43 = (void *)MEMORY[0x1E0CB3940];
    SBMainWorkspaceTransitionSourceDescription(v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", CFSTR("com.apple.cameraActivationCountWithSource.%@"), v44);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    ADClientAddValueForScalarKey();
    goto LABEL_37;
  }
LABEL_38:
  objc_msgSend((id)SBApp, "modalAlertPresentationCoordinator");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCanShowAlerts:", objc_msgSend(v45, "canShowApplicationModalAlerts"));

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "traitsParticipantForSceneHandle:", self);
  v47 = objc_claimAutoreleasedReturnValue();

  if (v47
    || (objc_msgSend(v82, "traitsParticipantForSceneHandle:", self),
        (v47 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[NSObject delegate](v47, "delegate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    SBFSafeProtocolCast();
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v49)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = (objc_class *)objc_opt_class();
      NSStringFromClass(v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneHandle.m"), 1387, CFSTR("Unexpected delegate: %@ for scene handle %@"), v78, self);

    }
    objc_msgSend(v49, "updateOrientationSceneSettingsForParticipant:", v8);
    SBLogTraitsArbiter();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = objc_msgSend(v8, "interfaceOrientation");
      -[SBDeviceApplicationSceneHandle sceneIdentifier](self, "sceneIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v86 = v51;
      v87 = 2112;
      v88 = v52;
      _os_log_impl(&dword_1D0540000, v50, OS_LOG_TYPE_DEFAULT, "[DeviceSceneHandle] Did set interfaceOrientation[%ld] on scene with identifier[%@]", buf, 0x16u);

    }
  }
  else
  {
    SBLogTraitsArbiter();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      -[SBDeviceApplicationSceneHandle sceneIdentifier](self, "sceneIdentifier");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v86 = (uint64_t)v75;
      _os_log_impl(&dword_1D0540000, v47, OS_LOG_TYPE_DEFAULT, "[DeviceSceneHandle] Participant not found for scene identifier: %@", buf, 0xCu);

    }
  }

  -[SBDeviceApplicationSceneHandle _populateSettingsWithDefaultStatusBarHeight:](self, "_populateSettingsWithDefaultStatusBarHeight:", v8);
  v53 = objc_msgSend(v16, "layoutRole");
  if (v53 == 3)
    v54 = 2;
  else
    v54 = 1;
  -[SBDeviceApplicationSceneHandle _modifySafeAreaInsetsOnApplicationSceneSettings:isFloating:](self, "_modifySafeAreaInsetsOnApplicationSceneSettings:isFloating:", v8, v53 == 3);
  -[SBDeviceApplicationSceneHandle displayEdgeInfoForLayoutEnvironment:](self, "displayEdgeInfoForLayoutEnvironment:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "sb_applyDisplayEdgeInfoToSceneSettings:", v8);
  -[SBDeviceApplicationSceneHandle _sceneCornerRadiusConfigurationFromRequestContext:forEntity:](self, "_sceneCornerRadiusConfigurationFromRequestContext:forEntity:", v32, v16);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadiusConfiguration:", v56);

  objc_msgSend(v8, "setStatusBarParts:", -[SBDeviceApplicationSceneHandle statusBarParts](self, "statusBarParts"));
  objc_msgSend(v8, "setStatusBarAvoidanceFrame:", self->_statusBarAvoidanceFrame.origin.x, self->_statusBarAvoidanceFrame.origin.y, self->_statusBarAvoidanceFrame.size.width, self->_statusBarAvoidanceFrame.size.height);
  -[SBApplicationSceneHandle application](self, "application");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "info");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "supportedUserInterfaceStyle");

  if (!v59)
  {
    v60 = (void *)SBApp;
    objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "userInterfaceStyleProviderForDisplay:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v62, "currentStyle");

  }
  SBLogContinuitySession();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    v64 = CFSTR("Unspecified");
    if (v59 == 1)
      v64 = CFSTR("Light");
    if (v59 == 2)
      v65 = CFSTR("Dark");
    else
      v65 = v64;
    objc_msgSend(v8, "displayIdentity");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sb_displayIdentityForSceneManagers");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v86 = (uint64_t)v65;
    v87 = 2114;
    v88 = v66;
    v89 = 2114;
    v90 = v67;
    v91 = 2114;
    v92 = self;
    _os_log_impl(&dword_1D0540000, v63, OS_LOG_TYPE_DEFAULT, "modifying scene setting userInterfaceStyle to %{public}@ displayIdentity: %{public}@ forSceneManagers: %{public}@ %{public}@ ", buf, 0x2Au);

  }
  objc_msgSend(v8, "setUserInterfaceStyle:", v59);
  objc_msgSend(v8, "setEnhancedWindowingEnabled:", -[SBDeviceApplicationSceneHandle _isEnhancedWindowingEffectivelyEnabled](self, "_isEnhancedWindowingEffectivelyEnabled"));
  if (-[SBDeviceApplicationSceneHandle shouldApplyAppProtectionSceneSettings](self, "shouldApplyAppProtectionSceneSettings"))
  {
    -[SBApplicationSceneHandle application](self, "application");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplicationAppProtectionAssistant assistantForApplication:](SBApplicationAppProtectionAssistant, "assistantForApplication:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogAppProtection();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      v71 = objc_msgSend(v69, "shouldShield");
      *(_DWORD *)buf = 67109120;
      LODWORD(v86) = v71;
      _os_log_impl(&dword_1D0540000, v70, OS_LOG_TYPE_DEFAULT, "modifying scene setting underAppProtection to %d", buf, 8u);
    }

    if (objc_msgSend(v69, "shouldShield"))
    {
      objc_msgSend(v8, "transientLocalSettings");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setFlag:forSetting:", 1, *MEMORY[0x1E0CEC158]);

    }
  }
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EFEB4B70))
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "currentHomeScreenIconStyleConfiguration");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setIconStyleConfiguration:", v74);
  }

}

- (void)_populateSettingsWithDefaultStatusBarHeight:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SBDeviceApplicationSceneHandle _defaultStatusBarHeights](self, "_defaultStatusBarHeights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__SBDeviceApplicationSceneHandle__populateSettingsWithDefaultStatusBarHeight___block_invoke;
  v7[3] = &unk_1E8EB0D60;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (BOOL)hasMainSceneBeenForegroundAtLeastOnce
{
  return self->_hasMainSceneBeenForegroundAtLeastOnce;
}

- (id)_sceneCornerRadiusConfigurationFromRequestContext:(id)a3 forEntity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  _BOOL4 v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  double v52;
  double v53;
  void *v54;
  id v56;
  id v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;

  v6 = a3;
  v7 = a4;
  -[SBApplicationSceneHandle application](self, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isRoundCornerPhone") & 1) == 0)
  {
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    if (!objc_msgSend(v9, "isRoundCornerPad"))
      goto LABEL_46;
  }
  v62 = v9;
  objc_msgSend(v6, "displayIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "windowSceneManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "windowSceneForDisplayIdentity:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = v16;
  objc_msgSend(v16, "switcherController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "liveOverlayForSceneHandle:", self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = v17;
  v20 = objc_msgSend(v17, "windowManagementStyle");
  objc_msgSend(v6, "applicationSceneEntityForLayoutRole:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "applicationSceneEntityForLayoutRole:", 1);
  v57 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "applicationSceneEntityForLayoutRole:", 2);
  v56 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "applicationSceneEntityForLayoutRole:", 3);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  v58 = objc_msgSend(v19, "isMaximized");
  v63 = v7;
  v25 = (v22 == v7 || v21 != 0) && v20 == 1;
  v26 = objc_msgSend(v8, "isClassic");
  v61 = v14;
  objc_msgSend(v14, "UIScreen");
  v27 = v8;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "traitCollection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "displayCornerRadius");
  v31 = v30;

  objc_msgSend(v19, "cornerRadii");
  v13 = v32;
  v12 = v33;
  v11 = v34;
  v10 = v35;
  if (v26)
  {
    -[SBApplication _screenTypeForClassicMode:]((uint64_t)v27, objc_msgSend(v27, "_classicMode"));
    SBHDisplayCornerRadiusForScreenType();
    v37 = v36;
    v38 = SBHScreenTypeForCurrentDevice();
    +[SBApplication _unobscuredScreenTypeForScreenType:]((uint64_t)SBApplication, v38);
    SBHDisplayCornerRadiusForScreenType();
    v40 = v39;
    v8 = v27;
    if (v20 == 2)
    {
      if (v58)
      {
        v10 = v39;
        v11 = v39;
        v12 = v39;
        v13 = v39;
      }
    }
    else
    {
      if (objc_msgSend(v27, "classicAppFullScreen"))
        v10 = v40;
      else
        v10 = v37;
      v11 = v10;
      v12 = v10;
      v13 = v10;
    }
    v7 = v63;
  }
  else
  {
    if (v20 == 2)
    {
      if (v58)
      {
        v10 = v31;
        v11 = v31;
        v12 = v31;
        v13 = v31;
      }
      v7 = v63;
    }
    else
    {
      if (!v25)
      {
        v7 = v63;
        v50 = v59;
        if (v57 == v63)
        {
          v10 = v31;
          v11 = v31;
          v12 = v31;
          v13 = v31;
        }
        else
        {
          v10 = 0.0;
          v11 = 0.0;
          v12 = 0.0;
          v13 = 0.0;
        }
        v8 = v27;
        v48 = v61;
        v9 = v62;
        v49 = v60;
        goto LABEL_45;
      }
      +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "cornerRadiusForFloatingApps");
      v43 = v42;
      objc_msgSend(v41, "cornerRadiusForInnerCorners");
      if (v21)
        v45 = v44;
      else
        v45 = v31;
      v7 = v63;
      v46 = 0.0;
      if (v22 == v63)
        v46 = v43;
      if (v56 == v63)
        v47 = v31;
      else
        v47 = v46;
      if (v56 != v63)
        v44 = v46;
      if (v57 == v63)
        v10 = v45;
      else
        v10 = v47;
      if (v57 == v63)
        v12 = v31;
      else
        v12 = v44;

      v11 = v10;
      v13 = v12;
    }
    v8 = v27;
  }
  v48 = v61;
  v9 = v62;
  v50 = v59;
  v49 = v60;
LABEL_45:

LABEL_46:
  v51 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  if (v51 == 1)
    v52 = v13;
  else
    v52 = v10;
  if (v51 == 1)
    v53 = v12;
  else
    v53 = v11;
  if (v51 == 1)
    v12 = v11;
  else
    v10 = v13;
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01730]), "initWithTopLeft:bottomLeft:bottomRight:topRight:", v10, v12, v53, v52);

  return v54;
}

- (id)_defaultStatusBarHeights
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  SBDeviceApplicationSceneHandle *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v29;
  void *v30;
  uint64_t v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (_defaultStatusBarHeights_onceToken != -1)
    dispatch_once(&_defaultStatusBarHeights_onceToken, &__block_literal_global_184);
  -[SBApplicationSceneHandle application](self, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneHandle _defaultStatusBarForAssociatedDisplay](self, "_defaultStatusBarForAssociatedDisplay");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isClassic"))
  {
    *(double *)&v8 = 1.79769313e308;
    goto LABEL_9;
  }
  v5 = 20.0;
  if (SBApplicationClassicModeExpectsRoundedCorners(objc_msgSend(v3, "_classicMode")))
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1
      || (v5 = 24.0, objc_msgSend(v3, "classicAppPhoneAppRunningOnPad")))
    {
      *(double *)&v8 = 44.0;
LABEL_9:
      v5 = *(double *)&v8;
    }
  }
  v29 = v3;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)_defaultStatusBarHeights_sEnumerator;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    v12 = 0x1E0CB3000uLL;
    do
    {
      v13 = 0;
      v31 = v10;
      do
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
        v15 = objc_msgSend(v14, "integerValue", v29);
        v16 = -[SBDeviceApplicationSceneHandle isStatusBarForcedHiddenForOrientation:](self, "isStatusBarForcedHiddenForOrientation:", v15);
        if (v16)
          v17 = 0.0;
        else
          v17 = v5;
        if (!v16 && v5 == 1.79769313e308)
        {
          -[SBApplicationSceneHandle application](self, "application");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "info");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            -[SBApplicationSceneHandle application](self, "application");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "info");
            v21 = self;
            v22 = v11;
            v23 = v4;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "heightForOrientation:isAzulBLinked:", v15, objc_msgSend(v24, "isAzulBLinked"));
            v17 = v25;

            v4 = v23;
            v11 = v22;
            self = v21;
            v12 = 0x1E0CB3000;

          }
          else
          {
            objc_msgSend(v30, "heightForOrientation:isAzulBLinked:", v15, 1);
            v17 = v26;
          }

          v10 = v31;
        }
        objc_msgSend(*(id *)(v12 + 2024), "numberWithDouble:", v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, v14);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v10);
  }

  return v4;
}

- (BOOL)isStatusBarForcedHiddenForOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[SBApplicationSceneHandle application](self, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneHandle _potentiallyJailedDisplayConfiguration](self, "_potentiallyJailedDisplayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "statusBarForcedHiddenForInterfaceOrientation:onDisplay:", a3, v7);

  return a3;
}

- (id)_defaultStatusBarForAssociatedDisplay
{
  void *v2;
  void *v3;
  void *v4;

  -[SBDeviceApplicationSceneHandle _windowScene](self, "_windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusBarManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setBackgroundActivitiesToSuppress:(id)a3
{
  NSSet *v4;
  NSSet *backgroundActivitiesToSuppress;
  id v6;

  v6 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    v4 = (NSSet *)objc_msgSend(v6, "copy");
    backgroundActivitiesToSuppress = self->_backgroundActivitiesToSuppress;
    self->_backgroundActivitiesToSuppress = v4;

    -[SBDeviceApplicationSceneHandle _noteBackgroundActivitiesToSuppressChanged](self, "_noteBackgroundActivitiesToSuppressChanged");
  }

}

- (void)_noteBackgroundActivitiesToSuppressChanged
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[SBDeviceApplicationSceneHandle backgroundActivitiesToSuppress](self, "backgroundActivitiesToSuppress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__SBDeviceApplicationSceneHandle__noteBackgroundActivitiesToSuppressChanged__block_invoke;
  v5[3] = &unk_1E8EB0D10;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  -[SBDeviceApplicationSceneHandle _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v5);

}

- (id)newScenePlaceholderContentContextWithActivationSettings:(id)a3
{
  id v3;
  SBDeviceApplicationScenePlaceholderContentContext *v4;

  v3 = a3;
  v4 = -[SBDeviceApplicationScenePlaceholderContentContext initWithActivationSettings:]([SBDeviceApplicationScenePlaceholderContentContext alloc], "initWithActivationSettings:", v3);

  return v4;
}

void __76__SBDeviceApplicationSceneHandle__noteBackgroundActivitiesToSuppressChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sceneHandle:didChangeBackgroundActivitiesToSuppress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)removeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneHandle;
  -[SBDeviceApplicationSceneHandle removeObserver:](&v3, sel_removeObserver_, a3);
}

- (void)_commonInitWithApplication:(id)a3 sceneIdentifier:(id)a4 displayIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  CGSize v11;
  void *v12;
  SBDeviceApplicationSceneStatusBarBreadcrumbProvider *v13;
  SBDeviceApplicationSceneStatusBarBreadcrumbProvider *breadcrumbProvider;
  SBDeviceApplicationSceneViewPlaceholderContentViewProvider *v15;
  SBScenePlaceholderContentViewProvider *placeholderContentProvider;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  BSInvalidatable *v22;
  BSInvalidatable *stateCaptureInvalidatable;
  id v24;
  id location;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)SBDeviceApplicationSceneHandle;
  -[SBApplicationSceneHandle _commonInitWithApplication:sceneIdentifier:displayIdentity:](&v26, sel__commonInitWithApplication_sceneIdentifier_displayIdentity_, v8, v9, v10);
  self->_keyboardLayerMaskStyle = 26;
  self->_statusBarParts = 0xFFFFLL;
  v11 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_statusBarAvoidanceFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_statusBarAvoidanceFrame.size = v11;
  objc_msgSend(v8, "info");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_defaultBackgroundStyle = objc_msgSend(v12, "backgroundStyle");

  v13 = -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider initWithSceneHandle:]([SBDeviceApplicationSceneStatusBarBreadcrumbProvider alloc], "initWithSceneHandle:", self);
  breadcrumbProvider = self->_breadcrumbProvider;
  self->_breadcrumbProvider = v13;

  v15 = -[SBDeviceApplicationSceneViewPlaceholderContentViewProvider initWithApplication:]([SBDeviceApplicationSceneViewPlaceholderContentViewProvider alloc], "initWithApplication:", v8);
  placeholderContentProvider = self->_placeholderContentProvider;
  self->_placeholderContentProvider = (SBScenePlaceholderContentViewProvider *)v15;

  -[SBApplicationSceneHandle addSceneUpdateContributer:](self, "addSceneUpdateContributer:", self);
  v17 = (void *)MEMORY[0x1E0CB3940];
  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("SpringBoard - %@ - %@"), v19, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v21 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v24, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v22 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
  self->_stateCaptureInvalidatable = v22;

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __61__SBDeviceApplicationSceneHandle_setStatusBarAvoidanceFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sceneHandle:didChangeStatusBarAvoidanceFrame:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

__CFString *__93__SBDeviceApplicationSceneHandle__commonInitWithApplication_sceneIdentifier_displayIdentity___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "descriptionWithMultilinePrefix:", 0);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E8EC7EC0;
  }

  return v3;
}

- (void)dealloc
{
  UIApplicationSceneClientSettingsDiffInspector *clientSettingsInspector;
  SBModalAlertPresenter *v4;
  SBModalAlertPresenter *modalAlertPresenter;
  SBModalAlertPresenter *v6;
  objc_super v7;
  _QWORD block[4];
  SBModalAlertPresenter *v9;

  -[BSInvalidatable invalidate](self->_stateCaptureInvalidatable, "invalidate");
  -[SBDeviceApplicationSceneStatusBarStateProvider invalidate](self->_statusBarStateProvider, "invalidate");
  -[UIApplicationSceneClientSettingsDiffInspector removeAllObservers](self->_clientSettingsInspector, "removeAllObservers");
  clientSettingsInspector = self->_clientSettingsInspector;
  self->_clientSettingsInspector = 0;

  if (self->_modalAlertPresenter && (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    v4 = self->_modalAlertPresenter;
    modalAlertPresenter = self->_modalAlertPresenter;
    self->_modalAlertPresenter = 0;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__SBDeviceApplicationSceneHandle_dealloc__block_invoke;
    block[3] = &unk_1E8E9DED8;
    v9 = v4;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  -[APSubjectMonitorSubscription invalidate](self->_appProtectionSubscription, "invalidate");
  v7.receiver = self;
  v7.super_class = (Class)SBDeviceApplicationSceneHandle;
  -[SBApplicationSceneHandle dealloc](&v7, sel_dealloc);
}

uint64_t __41__SBDeviceApplicationSceneHandle_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)saveSuspendSnapshot:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v9 && v7)
  {
    -[SBApplicationSceneHandle application](self, "application");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "saveSuspendSnapshot:forSceneHandle:", v9, self);

  }
}

- (id)mostRecentSceneSnapshotsForScale:(double)a3 launchingOrientation:(int64_t)a4
{
  void *v7;
  void *v8;

  -[SBApplicationSceneHandle application](self, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mostRecentSceneSnapshotsForSceneHandle:scale:launchingOrientation:", self, a4, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isReachabilitySupported
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "externalForegroundApplicationSceneHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v16 = v3;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "application");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBApplicationSceneHandle application](self, "application");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isSameExecutableAsApplication:", v10) & 1) != 0)
        {
          -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uiClientSettings");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isReachabilitySupported");

          if (!v13)
          {
            v14 = 0;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
    v14 = 1;
LABEL_13:
    v3 = v16;
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)isShowingModalAlert
{
  return -[SBModalAlertPresenter isShowingModalAlert](self->_modalAlertPresenter, "isShowingModalAlert");
}

- (void)setAlertSuppressionContextsBySectionIdentifier:(id)a3
{
  NSDictionary *v5;
  NSDictionary *v6;

  v5 = (NSDictionary *)a3;
  if (self->_alertSuppressionContextsBySectionIdentifier != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_alertSuppressionContextsBySectionIdentifier, a3);
    v5 = v6;
  }

}

- (BOOL)shouldSuppressAlertForSuppressionContexts:(id)a3 sectionIdentifier:(id)a4
{
  NSDictionary *alertSuppressionContextsBySectionIdentifier;
  id v6;
  void *v7;

  alertSuppressionContextsBySectionIdentifier = self->_alertSuppressionContextsBySectionIdentifier;
  v6 = a3;
  -[NSDictionary objectForKey:](alertSuppressionContextsBySectionIdentifier, "objectForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(alertSuppressionContextsBySectionIdentifier) = objc_msgSend(v6, "intersectsSet:", v7);

  return (char)alertSuppressionContextsBySectionIdentifier;
}

+ (double)_homeAffordanceInsetTopForWindowScene:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a3, "statusBarManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultHeight");
  v6 = v5;

  return v6;
}

+ (double)_homeAffordanceInsetBottom
{
  return 20.0;
}

- (_UIStatusBarData)overlayStatusBarData
{
  void *v2;
  id v3;
  id v4;
  id v5;

  -[SBDeviceApplicationSceneStatusBarBreadcrumbProvider breadcrumbTitle](self->_breadcrumbProvider, "breadcrumbTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (SBStatusBarIsSpeakeasy())
    {
      objc_msgSend(MEMORY[0x1E0DB09F0], "entryWithStringValue:", v2);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      v4 = objc_alloc(MEMORY[0x1E0DB0970]);
      v5 = (id)objc_msgSend(v4, "initWithEntry:forKey:", v3, *MEMORY[0x1E0DB0C90]);
    }
    else
    {
      v5 = objc_alloc_init(MEMORY[0x1E0CEAED8]);
      v3 = objc_alloc_init(MEMORY[0x1E0CEAEE0]);
      objc_msgSend(v3, "setStringValue:", v2);
      objc_msgSend(v5, "setBackNavigationEntry:", v3);
    }

  }
  else
  {
    v5 = 0;
  }

  return (_UIStatusBarData *)v5;
}

- (id)effectiveBackgroundActivities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CEAA00], "getStyleOverrides");
  STUIBackgroundActivityIdentifiersForStyleOverrides();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[SBApplicationSceneHandle application](self, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", CFSTR("com.apple.Maps")))
    objc_msgSend(v4, "removeObject:", *MEMORY[0x1E0DB0B78]);
  if (objc_msgSend(v5, "isNowRecordingApplication"))
    objc_msgSend(v4, "removeObject:", *MEMORY[0x1E0DB0BA0]);
  objc_msgSend(v4, "minusSet:", self->_backgroundActivitiesToSuppress);
  objc_msgSend(v5, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ignoredBackgroundActivityIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minusSet:", v8);

  return v4;
}

- (BOOL)isStatusBarForceHidden
{
  return -[NSMutableSet count](self->_statusBarForcedHiddenReasons, "count") != 0;
}

- (void)setStatusBarForceHidden:(BOOL)a3 forReason:(id)a4 animationSettings:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  NSMutableSet *statusBarForcedHiddenReasons;
  NSMutableSet *v14;
  NSMutableSet *v15;
  NSMutableSet *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneHandle.m"), 365, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__SBDeviceApplicationSceneHandle_setStatusBarForceHidden_forReason_animationSettings___block_invoke;
  v18[3] = &unk_1E8E9DEB0;
  v18[4] = self;
  v11 = v10;
  v19 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v18);
  statusBarForcedHiddenReasons = self->_statusBarForcedHiddenReasons;
  if (v6)
  {
    if (!statusBarForcedHiddenReasons)
    {
      v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v15 = self->_statusBarForcedHiddenReasons;
      self->_statusBarForcedHiddenReasons = v14;

      v12[2](v12, 1);
      statusBarForcedHiddenReasons = self->_statusBarForcedHiddenReasons;
    }
    -[NSMutableSet addObject:](statusBarForcedHiddenReasons, "addObject:", v9);
  }
  else
  {
    -[NSMutableSet removeObject:](statusBarForcedHiddenReasons, "removeObject:", v9);
    if (!-[NSMutableSet count](self->_statusBarForcedHiddenReasons, "count"))
    {
      v16 = self->_statusBarForcedHiddenReasons;
      self->_statusBarForcedHiddenReasons = 0;

      v12[2](v12, 0);
    }
  }

}

void __86__SBDeviceApplicationSceneHandle_setStatusBarForceHidden_forReason_animationSettings___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 67109634;
      v15 = a2;
      v16 = 2112;
      v17 = v6;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Force hiding the status bar: %d for %@ with animationSettings=%{public}@", buf, 0x1Cu);
    }

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __86__SBDeviceApplicationSceneHandle_setStatusBarForceHidden_forReason_animationSettings___block_invoke_30;
    v10[3] = &unk_1E8EB0C50;
    v13 = a2;
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    objc_msgSend(v4, "updateSettingsWithTransitionBlock:", v10);

  }
}

id __86__SBDeviceApplicationSceneHandle_setStatusBarForceHidden_forReason_animationSettings___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "setForcedStatusBarForegroundTransparent:", *(unsigned __int8 *)(a1 + 48));
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawing");
    objc_msgSend(*(id *)(a1 + 40), "_definition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "specification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init((Class)objc_msgSend(v5, "transitionContextClass"));

    if (!v6)
      v6 = objc_alloc_init(MEMORY[0x1E0CEA350]);
    objc_msgSend(v6, "setAnimationSettings:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizedDrawingFence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAnimationFence:", v7);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isCurrentStatusBarHiddenForOrientation:(int64_t)a3
{
  return -[SBDeviceApplicationSceneHandle isStatusBarHiddenForActivation:forOrientation:](self, "isStatusBarHiddenForActivation:forOrientation:", 0, a3);
}

- (double)statusBarHeightForOrientation:(int64_t)a3
{
  double result;

  if (-[SBDeviceApplicationSceneHandle isCurrentStatusBarHiddenForOrientation:](self, "isCurrentStatusBarHiddenForOrientation:"))
  {
    return 0.0;
  }
  -[SBDeviceApplicationSceneHandle defaultStatusBarHeightForOrientation:](self, "defaultStatusBarHeightForOrientation:", a3);
  return result;
}

- (double)defaultStatusBarHeightForOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "uiSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultStatusBarHeightForOrientation:", a3);
    v9 = v8;
  }
  else
  {
    -[SBDeviceApplicationSceneHandle _defaultStatusBarHeights](self, "_defaultStatusBarHeights");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v9 = v12;

  }
  return v9;
}

void __52__SBDeviceApplicationSceneHandle_setStatusBarParts___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sceneHandle:didChangeStatusBarParts:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)displayEdgeInfoForLayoutEnvironment:(int64_t)a3
{
  void *v5;
  _BOOL4 IsClassic;
  void *v7;
  void *v8;
  void *v9;

  -[SBApplicationSceneHandle application](self, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IsClassic = _SBApplicationClassicModeIsClassic(objc_msgSend(v5, "_classicMode"));

  if (IsClassic)
  {
    v7 = (void *)MEMORY[0x1E0DC5B80];
    -[SBApplicationSceneHandle application](self, "application");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sb_displayEdgeInfoForApplication:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a3 == 2)
      objc_msgSend(MEMORY[0x1E0DC5B80], "sb_floatingApplicationDisplayEdgeInfo");
    else
      objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (NSData)activationConditionsData
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "uiClientSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activationConditionsData");
    }
    else
    {
      -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("activationConditions"));
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (NSData *)v8;
}

- (void)setKeyboardContextMaskStyle:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  -[SBApplicationSceneHandle application](self, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsChamoisSceneResizing");

  if (a3 != 2 || v6)
  {
    self->_keyboardLayerMaskStyle = a3;
    -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uiPresentationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__SBDeviceApplicationSceneHandle_setKeyboardContextMaskStyle___block_invoke;
    v9[3] = &__block_descriptor_40_e43_v16__0__UIMutableScenePresentationContext_8l;
    v9[4] = a3;
    objc_msgSend(v7, "modifyDefaultPresentationContext:", v9);

  }
}

uint64_t __62__SBDeviceApplicationSceneHandle_setKeyboardContextMaskStyle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPresentedLayerTypes:", *(_QWORD *)(a1 + 32));
}

- (BOOL)supportsCenterWindow
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeObjectForKey:ofType:", CFSTR("originatedInCenterWindow"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("activationConditions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v16 = 0;
      v10 = objc_msgSend(v8, "_suitabilityForTargetContentIdentifier:errorString:", &stru_1E8EC7EC0, &v16);
      v11 = v16;
      v6 = v10 == 0;
      if (v10)
      {
        SBLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          -[SBApplicationSceneHandle application](self, "application");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v18 = v14;
          v19 = 2114;
          v20 = v11;
          _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "Error decoding activation conditions for %{public}@:%{public}@", buf, 0x16u);

        }
      }

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)requestedFullScreenCenterWindow
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeObjectForKey:ofType:", CFSTR("requestedFullScreenCenterWindow"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (void)setContentPrefersToDisableClipping:(BOOL)a3
{
  if (self->_contentPrefersToDisableClipping != a3)
  {
    self->_contentPrefersToDisableClipping = a3;
    -[SBDeviceApplicationSceneHandle _noteContentPrefersToDisableClippingChanged](self, "_noteContentPrefersToDisableClippingChanged");
  }
}

- (BOOL)handleHardwareButtonEventType:(int64_t)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[4];
  id v24[2];
  uint8_t buf[4];
  SBDeviceApplicationSceneHandle *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((SBSUIHardwareButtonEventTypeIsValid() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneHandle.m"), 778, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SBSUIHardwareButtonEventTypeIsValid(eventType)"));

  }
  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    SBLogInCallPresentation();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      SBSUIHardwareButtonEventTypeDescription();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = self;
      v27 = 2114;
      v28 = v18;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to handle %{public}@ event because the scene doesn't exist", buf, 0x16u);

    }
    goto LABEL_17;
  }
  v7 = objc_opt_class();
  objc_msgSend(v6, "uiClientSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    SBLogInCallPresentation();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      SBSUIHardwareButtonEventTypeDescription();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = self;
      v27 = 2114;
      v28 = v19;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to handle %{public}@ event because scene client settings are not of the appropriate class", buf, 0x16u);

    }
    goto LABEL_16;
  }
  v10 = (-[NSObject preferredHardwareButtonEventTypes](v9, "preferredHardwareButtonEventTypes") & (1 << a3)) == 0;
  SBLogInCallPresentation();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      SBSUIHardwareButtonEventTypeDescription();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = self;
      v27 = 2114;
      v28 = v20;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to handle %{public}@ event because it's not in the preferred types mask", buf, 0x16u);

    }
LABEL_16:

LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
  if (v12)
  {
    SBSUIHardwareButtonEventTypeDescription();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = self;
    v27 = 2114;
    v28 = v13;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending hardware event action: %{public}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v14 = objc_alloc(MEMORY[0x1E0DAC488]);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __64__SBDeviceApplicationSceneHandle_handleHardwareButtonEventType___block_invoke;
  v23[3] = &unk_1E8EB0CE8;
  objc_copyWeak(v24, (id *)buf);
  v24[1] = (id)a3;
  v15 = (void *)objc_msgSend(v14, "initWithButtonEventType:timeout:withResponseHandler:", a3, v23, 5.0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendActions:", v16);

  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);
  v17 = 1;
LABEL_18:

  return v17;
}

void __64__SBDeviceApplicationSceneHandle_handleHardwareButtonEventType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SBLogInCallPresentation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    SBSUIHardwareButtonEventTypeDescription();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = WeakRetained;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Received response for hardware event %{public}@: %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

- (unint64_t)preferredHardwareButtonEventTypes
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = objc_opt_class(),
        objc_msgSend(v2, "uiClientSettings"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        SBSafeCast(v3, v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    v6 = objc_msgSend(v5, "preferredHardwareButtonEventTypes");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)_bestSupportedInterfaceOrientationForOrientation:(int64_t)a3
{
  int64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;

  v5 = -[SBDeviceApplicationSceneHandle currentInterfaceOrientation](self, "currentInterfaceOrientation");
  v6 = -[SBDeviceApplicationSceneHandle _mainSceneSupportedInterfaceOrientations](self, "_mainSceneSupportedInterfaceOrientations");
  v7 = 1;
  v8 = 4;
  v9 = 3;
  if ((v6 & 8) == 0)
    v9 = (v6 >> 1) & 2;
  if ((v6 & 0x10) == 0)
    v8 = v9;
  if ((v6 & 2) == 0)
    v7 = v8;
  if ((v6 & (1 << v5)) != 0)
    v10 = v5;
  else
    v10 = v7;
  if ((v6 & (1 << a3)) != 0)
    return a3;
  else
    return v10;
}

- (int64_t)_resumingInterfaceOrientationForOrientation:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  char v9;
  _BOOL4 v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!a3)
      return -[SBDeviceApplicationSceneHandle currentInterfaceOrientation](self, "currentInterfaceOrientation");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneHandle.m"), 930, CFSTR("Don't calculate a resuming orientation for a non-running app. Really."));

    if (!a3)
      return -[SBDeviceApplicationSceneHandle currentInterfaceOrientation](self, "currentInterfaceOrientation");
  }
  -[SBApplicationSceneHandle application](self, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "builtOnOrAfterSDKVersion:", CFSTR("8.0"));

  v10 = -[SBDeviceApplicationSceneHandle _mainSceneSupportsInterfaceOrientation:](self, "_mainSceneSupportsInterfaceOrientation:", a3);
  v11 = -[SBDeviceApplicationSceneHandle _interfaceOrientationFromUserResizing](self, "_interfaceOrientationFromUserResizing");
  if (v11)
  {
LABEL_4:

    return v11;
  }
  if (objc_msgSend(v7, "classicAppPhoneAppRunningOnPad"))
  {
    v11 = -[SBDeviceApplicationSceneHandle _classicPhoneOnPadActivationOrientationForOrientation:](self, "_classicPhoneOnPadActivationOrientationForOrientation:", a3);
    goto LABEL_20;
  }
  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    v12 = v14 == 0;
LABEL_11:
    if (v12)
      v15 = v9;
    else
      v15 = 1;
    if ((v15 & 1) != 0)
      goto LABEL_15;
LABEL_19:
    -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uiClientSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v19, "sb_effectiveInterfaceOrientation");

LABEL_20:
    if (v11)
      return v11;
    return -[SBDeviceApplicationSceneHandle currentInterfaceOrientation](self, "currentInterfaceOrientation");
  }
  if (SBFEffectiveDeviceClass())
  {
    v12 = SBFEffectiveDeviceClass() == 1;
    goto LABEL_11;
  }
  if ((v9 & 1) == 0)
    goto LABEL_19;
LABEL_15:
  if (v10)
  {
    -[SBApplicationSceneHandle application](self, "application");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isMedusaCapable");

    if ((v17 & 1) != 0)
    {
      v11 = a3;
      goto LABEL_4;
    }
    -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uiClientSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "supportedInterfaceOrientations");

    if (v23)
    {
      v11 = a3;
      if ((XBInterfaceOrientationMaskForInterfaceOrientation() & v23) != 0)
        goto LABEL_4;
    }
  }

  return -[SBDeviceApplicationSceneHandle currentInterfaceOrientation](self, "currentInterfaceOrientation");
}

- (int64_t)_classicPhoneOnPadActivationOrientationForOrientation:(int64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;

  v5 = -[SBDeviceApplicationSceneHandle _classicAppPhoneOnPadPrefersLandscape](self, "_classicAppPhoneOnPadPrefersLandscape");
  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uiClientSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportedInterfaceOrientations");

  if (v8 && v5)
  {
    v9 = -[SBDeviceApplicationSceneHandle currentInterfaceOrientation](self, "currentInterfaceOrientation");
    if ((unint64_t)(v9 - 3) <= 1)
    {
      v10 = v9;
      if ((v8 & (1 << v9)) != 0)
        return v10;
    }
    if ((unint64_t)(a3 - 3) > 1)
    {
      if ((v8 & 0x10) != 0)
        return 4;
      if ((v8 & 8) != 0)
        return 3;
    }
    else
    {
      if ((v8 & (1 << a3)) != 0)
        return a3;
      if (a3 == 4)
        v10 = 3;
      else
        v10 = 4;
      if ((v8 & (1 << v10)) != 0)
        return v10;
    }
  }
  v10 = 1;
  if (-[SBDeviceApplicationSceneHandle _mainSceneSupportsInterfaceOrientation:](self, "_mainSceneSupportsInterfaceOrientation:", 1))
  {
    return v10;
  }
  return -[SBDeviceApplicationSceneHandle _bestSupportedInterfaceOrientationForOrientation:](self, "_bestSupportedInterfaceOrientationForOrientation:", 0);
}

- (void)_noteActivationConditionsChanged
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[SBDeviceApplicationSceneHandle activationConditionsData](self, "activationConditionsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__SBDeviceApplicationSceneHandle__noteActivationConditionsChanged__block_invoke;
  v5[3] = &unk_1E8EB0D10;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  -[SBDeviceApplicationSceneHandle _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v5);

}

void __66__SBDeviceApplicationSceneHandle__noteActivationConditionsChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sceneHandle:didChangeActivationConditionsData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_noteContentPrefersToDisableClippingChanged
{
  BOOL v3;
  _QWORD v4[5];
  BOOL v5;

  v3 = -[SBDeviceApplicationSceneHandle contentPrefersToDisableClipping](self, "contentPrefersToDisableClipping");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__SBDeviceApplicationSceneHandle__noteContentPrefersToDisableClippingChanged__block_invoke;
  v4[3] = &unk_1E8EB0D38;
  v4[4] = self;
  v5 = v3;
  -[SBDeviceApplicationSceneHandle _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v4);
}

void __77__SBDeviceApplicationSceneHandle__noteContentPrefersToDisableClippingChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sceneHandle:didChangeContentPrefersToDisableClipping:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__SBDeviceApplicationSceneHandle_appProtectionSubjectsChanged_forSubscription___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __79__SBDeviceApplicationSceneHandle_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x1E0CF9688];
  objc_msgSend(*(id *)(a1 + 32), "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationWithBundleIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v10);
  v6 = v10;
  if (v5)
  {
    v7 = objc_msgSend(v10, "isLocked");
    objc_msgSend(*(id *)(a1 + 32), "sceneIfExists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isValid"))
    {
      objc_msgSend(v8, "_interfaceProtectionHostComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUnderAppProtection:", v7);

    }
    v6 = v10;
  }

}

- (void)_didDestroyScene:(id)a3
{
  APSubjectMonitorSubscription *appProtectionSubscription;
  id v5;
  APSubjectMonitorSubscription *v6;
  void *v7;
  SBModalAlertPresenter *modalAlertPresenter;
  NSMutableSet *statusBarForcedHiddenReasons;
  void *v10;
  void *v11;
  objc_super v12;

  appProtectionSubscription = self->_appProtectionSubscription;
  v5 = a3;
  -[APSubjectMonitorSubscription invalidate](appProtectionSubscription, "invalidate");
  v6 = self->_appProtectionSubscription;
  self->_appProtectionSubscription = 0;

  objc_msgSend(v5, "clientProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  -[SBModalAlertPresenter invalidate](self->_modalAlertPresenter, "invalidate");
  modalAlertPresenter = self->_modalAlertPresenter;
  self->_modalAlertPresenter = 0;

  statusBarForcedHiddenReasons = self->_statusBarForcedHiddenReasons;
  self->_statusBarForcedHiddenReasons = 0;

  self->_isEffectivelyForeground = 0;
  -[SBDeviceApplicationSceneHandle setAlertSuppressionContextsBySectionIdentifier:](self, "setAlertSuppressionContextsBySectionIdentifier:", 0);
  -[SBApplicationSceneHandle application](self, "application");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "info");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneHandle setWhitePointAdaptivityStyle:](self, "setWhitePointAdaptivityStyle:", objc_msgSend(v11, "whitePointAdaptivityStyle"));

  v12.receiver = self;
  v12.super_class = (Class)SBDeviceApplicationSceneHandle;
  -[SBDeviceApplicationSceneHandle _didDestroyScene:](&v12, sel__didDestroyScene_, v5);

}

void __85__SBDeviceApplicationSceneHandle__didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[19];
  objc_msgSend(WeakRetained, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uiClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setVisibleModalAlertCount:", objc_msgSend(v3, "visibleMiniAlertCount"));

}

void __78__SBDeviceApplicationSceneHandle__didUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sceneHandle:didChangeEffectiveForegroundness:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)setOccluded:(BOOL)a3
{
  if (self->_occluded != a3)
  {
    self->_occluded = a3;
    -[SBDeviceApplicationSceneHandle _updateApplicationOcclusionRects](self, "_updateApplicationOcclusionRects");
  }
}

- (void)_updateApplicationOcclusionRects
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SBDeviceApplicationSceneHandle__updateApplicationOcclusionRects__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __66__SBDeviceApplicationSceneHandle__updateApplicationOcclusionRects__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_occlusionHostComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 298))
  {
    v5 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v2, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    objc_msgSend(v5, "bs_valueWithCGRect:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setApplicationOcclusionRects:", v8);

  }
  else
  {
    objc_msgSend(v3, "setApplicationOcclusionRects:", 0);
  }

}

void __58__SBDeviceApplicationSceneHandle__defaultStatusBarHeights__block_invoke()
{
  void *v0;

  v0 = (void *)_defaultStatusBarHeights_sEnumerator;
  _defaultStatusBarHeights_sEnumerator = (uint64_t)&unk_1E91CEA40;

}

- (void)_modifySafeAreaInsetsOnApplicationSceneSettings:(id)a3 isFloating:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[SBApplicationSceneHandle application](self, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isClassic"))
  {
    objc_msgSend(MEMORY[0x1E0DC5B80], "sb_displayEdgeInfoForApplication:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
      objc_msgSend(MEMORY[0x1E0DC5B80], "sb_floatingApplicationDisplayEdgeInfo");
    else
      objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v8, "sb_applyDisplayEdgeInfoToSceneSettings:", v6);

}

- (void)_noteReplacedWithSceneHandle:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDeviceApplicationSceneHandle;
  -[SBDeviceApplicationSceneHandle _noteReplacedWithSceneHandle:](&v9, sel__noteReplacedWithSceneHandle_, v4);
  v5 = objc_opt_class();
  v6 = v4;
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

  objc_msgSend(v8, "_updateCapturingContentForAdditionalRenderingDestination");
}

- (void)applicationSceneHandle:(id)a3 appendToSceneSettings:(id)a4 fromRequestContext:(id)a5 entity:(id)a6
{
  id v8;
  id v9;

  v8 = a4;
  objc_msgSend(a5, "displayIdentity");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneHandle _updateIsCapturingContentForAdditionalRenderingDestinationOfMutableSceneSettings:withDisplayIdentity:](self, "_updateIsCapturingContentForAdditionalRenderingDestinationOfMutableSceneSettings:withDisplayIdentity:", v8, v9);

}

void __84__SBDeviceApplicationSceneHandle__sceneHostingInfoForSnapshottingAssertionWithView___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_removeSnapshottingInfoAssertion:", v3);

}

- (void)_removeSnapshottingInfoAssertion:(id)a3
{
  NSMutableArray *snapshottingInfoAssertions;
  id v5;
  id WeakRetained;
  id v7;

  snapshottingInfoAssertions = self->_snapshottingInfoAssertions;
  v5 = a3;
  -[NSMutableArray removeObject:](snapshottingInfoAssertions, "removeObject:", v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentSnapshottingInfoAssertion);

  if (WeakRetained == v5)
  {
    -[NSMutableArray lastObject](self->_snapshottingInfoAssertions, "lastObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_currentSnapshottingInfoAssertion, v7);
    -[SBDeviceApplicationSceneHandle _updateSceneHostingInfoForSnapshottingWithAssertion:forceUpdate:](self, "_updateSceneHostingInfoForSnapshottingWithAssertion:forceUpdate:", v7, 0);

  }
}

- (id)newSceneViewController
{
  return -[SBDeviceApplicationSceneViewController initWithSceneHandle:]([SBDeviceApplicationSceneViewController alloc], "initWithSceneHandle:", self);
}

- (void)applicationProcessDidExit:(id)a3 withContext:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  BSDispatchMain();

}

void __72__SBDeviceApplicationSceneHandle_applicationProcessDidExit_withContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "terminationReason");
  if ((objc_msgSend(*(id *)(a1 + 32), "exitReason") & 1) == 0 && v2 != 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "_sceneDataStoreCreatingIfNecessary:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("statusBarStyle"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("statusBarHidden"));

  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBDeviceApplicationSceneHandle;
  -[SBDeviceApplicationSceneHandle descriptionBuilderWithMultilinePrefix:](&v8, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBDeviceApplicationSceneStatusBarBreadcrumbProvider hasBreadcrumb](self->_breadcrumbProvider, "hasBreadcrumb"))
    v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_breadcrumbProvider, CFSTR("breadcrumbProvider"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:", self->_occluded, CFSTR("occluded"));
  return v4;
}

- (void)_updateIdleTimerForReason:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[SBDeviceApplicationSceneHandle _generateIdleTimerBehavior](self, "_generateIdleTimerBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneHandle _idleTimerCoordinator](self, "_idleTimerCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "idleTimerProvider:didProposeBehavior:forReason:", self, v4, v7);

}

- (id)_generateIdleTimerBehavior
{
  return +[SBIdleTimerBehavior autoLockBehavior](SBIdleTimerBehavior, "autoLockBehavior");
}

- (void)_updateIsCapturingContentForAdditionalRenderingDestinationOfMutableSceneSettings:(id)a3 withDisplayIdentity:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  v7 = objc_msgSend(v20, "isCapturingContentForAdditionalRenderingDestination");
  if (objc_msgSend(v6, "isContinuityDisplay"))
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowSceneForDisplayIdentity:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_FBSScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    v13 = v11;
    if (v12)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    v15 = v14;

    v16 = objc_msgSend(v15, "isCapturingContentForAdditionalRenderingDestination");
    objc_msgSend(v20, "setIsCapturingContentForAdditionalRenderingDestination:", v16);

  }
  else
  {
    objc_msgSend(v20, "setIsCapturingContentForAdditionalRenderingDestination:", 0);
  }
  if (v7 != objc_msgSend(v20, "isCapturingContentForAdditionalRenderingDestination"))
  {
    v17 = objc_msgSend(v20, "isCapturingContentForAdditionalRenderingDestination");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
      objc_msgSend(v18, "addObserver:selector:name:object:", self, sel__updateCapturingContentForAdditionalRenderingDestination, *MEMORY[0x1E0CEBB80], 0);
    else
      objc_msgSend(v18, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBB80], 0);

  }
}

- (void)_updateCapturingContentForAdditionalRenderingDestination
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sb_displayIdentityForSceneManagers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__SBDeviceApplicationSceneHandle__updateCapturingContentForAdditionalRenderingDestination__block_invoke;
  v8[3] = &unk_1E8EB0DF0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "updateSettings:", v8);

}

void __90__SBDeviceApplicationSceneHandle__updateCapturingContentForAdditionalRenderingDestination__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_opt_class();
  v8 = v3;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v8;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v4, "_updateIsCapturingContentForAdditionalRenderingDestinationOfMutableSceneSettings:withDisplayIdentity:", v7, *(_QWORD *)(a1 + 40));
}

- (void)setDefaultBackgroundStyle:(int64_t)a3
{
  self->_defaultBackgroundStyle = a3;
}

- (void)setPlaceholderContentProvider:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderContentProvider, a3);
}

- (SBIdleTimerCoordinating)_idleTimerCoordinator
{
  return (SBIdleTimerCoordinating *)objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
}

- (BOOL)isOccluded
{
  return self->_occluded;
}

- (void)setHostedSecureApp:(BOOL)a3
{
  self->_hostedSecureApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivationIconLeafIdentifier, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_appProtectionSubscription, 0);
  objc_destroyWeak((id *)&self->_currentSnapshottingInfoAssertion);
  objc_storeStrong((id *)&self->_snapshottingInfoAssertions, 0);
  objc_storeStrong((id *)&self->_placeholderContentProvider, 0);
  objc_storeStrong((id *)&self->_statusBarStateProvider, 0);
  objc_storeStrong((id *)&self->_breadcrumbProvider, 0);
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_clientSettingsInspector, 0);
  objc_storeStrong((id *)&self->_alertSuppressionContextsBySectionIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundActivitiesToSuppress, 0);
  objc_storeStrong((id *)&self->_statusBarForcedHiddenReasons, 0);
  objc_storeStrong((id *)&self->_modalAlertPresenter, 0);
}

- (BOOL)_classicAppPhoneOnPadPrefersLandscape
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;

  -[SBApplicationSceneHandle application](self, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_classicAppScaledPhoneOnPad");

  if (!v4)
    return 0;
  -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeObjectForKey:ofType:", CFSTR("classicPhoneAppPrefersLandscape"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)_setClassicAppPhoneOnPadPrefersLandscape:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v3 = a3;
  -[SBApplicationSceneHandle application](self, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_classicAppScaledPhoneOnPad");

  if (v6)
  {
    -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("classicPhoneAppPrefersLandscape"));

  }
}

- (BOOL)_classicAppPhoneOnPadSupportsOldStyleMixedOrientation
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[SBApplicationSceneHandle application](self, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_classicAppScaledPhoneOnPad"))
  {
    -[SBDeviceApplicationSceneHandle _windowScene](self, "_windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "switcherController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isChamoisWindowingUIEnabled") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (int64_t)_preferredSizingPolicyForContentOrientation:(int64_t)a3 containerOrientation:(int64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;

  -[SBDeviceApplicationSceneHandle _windowScene](self, "_windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "switcherController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "windowManagementStyle");
  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sb_displayIdentityForSceneManagers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBApplicationSceneHandle application](self, "application");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "preferredSizingPolicyForSwitcherWindowManagementStyle:displayIdentity:contentOrientation:containerOrientation:", v9, v12, a3, a4);

  return v14;
}

- (unint64_t)_supportedSizingPoliciesForContentOrientation:(int64_t)a3 containerOrientation:(int64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;

  -[SBDeviceApplicationSceneHandle _windowScene](self, "_windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "switcherController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "windowManagementStyle");
  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sb_displayIdentityForSceneManagers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBApplicationSceneHandle application](self, "application");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "supportedSizingPoliciesForSwitcherWindowManagementStyle:displayIdentity:contentOrientation:containerOrientation:", v9, v12, a3, a4);

  return v14;
}

- (BOOL)_supportsMultiWindowLayouts
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SBDeviceApplicationSceneHandle _windowScene](self, "_windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "windowManagementStyle");

  -[SBDeviceApplicationSceneHandle sceneIfExists](self, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sb_displayIdentityForSceneManagers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBApplicationSceneHandle application](self, "application");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:displayIdentity:", v5, v8);

  return (char)v6;
}

- (void)_resetSceneOrientationRequestState
{
  -[SBDeviceApplicationSceneHandle _setSettingUpSceneOrientationRequest:](self, "_setSettingUpSceneOrientationRequest:", 0);
  -[SBDeviceApplicationSceneHandle _setInitialDeviceOrientationFromSceneOrientationRequestSetup:](self, "_setInitialDeviceOrientationFromSceneOrientationRequestSetup:", 0);
  -[SBDeviceApplicationSceneHandle _setSupportedInterfaceOrientationsFromSceneOrientationRequestSetup:](self, "_setSupportedInterfaceOrientationsFromSceneOrientationRequestSetup:", 0);
}

- (void)_setSettingUpSceneOrientationRequest:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("settingUpSceneOrientationRequest"));

}

- (void)_setInitialDeviceOrientationFromSceneOrientationRequestSetup:(int64_t)a3
{
  void *v4;
  id v5;

  -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", a3 != 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("initialDeviceOrientationFromSceneOrientationRequestSetup"));

}

- (void)_setSupportedInterfaceOrientationsFromSceneOrientationRequestSetup:(unint64_t)a3
{
  void *v4;
  id v5;

  -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", a3 != 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("supportedInterfaceOrientationsFromSceneOrientationRequestSetup"));

}

- (BOOL)_isSettingUpSceneOrientationRequest
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeObjectForKey:ofType:", CFSTR("settingUpSceneOrientationRequest"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue") != 0;
  else
    v5 = 0;

  return v5;
}

- (int64_t)_initialDeviceOrientationFromSceneOrientationRequestSetup
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[SBDeviceApplicationSceneHandle _sceneDataStoreCreatingIfNecessary:](self, "_sceneDataStoreCreatingIfNecessary:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeObjectForKey:ofType:", CFSTR("initialDeviceOrientationFromSceneOrientationRequestSetup"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return v5;
}

- (BOOL)shouldApplyAppProtectionSceneSettings
{
  return self->_shouldApplyAppProtectionSettings;
}

- (void)setShouldApplyAppProtectionSceneSettings:(BOOL)a3
{
  self->_shouldApplyAppProtectionSettings = a3;
}

@end
