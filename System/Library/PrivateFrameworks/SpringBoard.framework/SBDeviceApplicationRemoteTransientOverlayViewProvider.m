@implementation SBDeviceApplicationRemoteTransientOverlayViewProvider

- (void)noteDisplayModeChange:(int64_t)a3
{
  void *v5;
  id v6;

  +[_SBActiveRemoteTransientOverlayViewProviderRegistry sharedInstance](_SBActiveRemoteTransientOverlayViewProviderRegistry, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == 4)
    objc_msgSend(v5, "registerViewProvider:", self);
  else
    objc_msgSend(v5, "unregisterViewProvider:", self);

}

- (SBDeviceApplicationRemoteTransientOverlayViewProvider)initWithSceneHandle:(id)a3 delegate:(id)a4 handlesSceneBackedRemoteTransientOverlaysOnly:(BOOL)a5
{
  SBDeviceApplicationRemoteTransientOverlayViewProvider *v6;
  SBDeviceApplicationRemoteTransientOverlayViewProvider *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBDeviceApplicationRemoteTransientOverlayViewProvider;
  v6 = -[SBDeviceApplicationSceneOverlayViewProvider initWithSceneHandle:delegate:](&v11, sel_initWithSceneHandle_delegate_, a3, a4);
  v7 = v6;
  if (v6)
  {
    v6->_handlesSceneBackedRemoteTransientOverlaysOnly = a5;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleCoverSheetDidPresent_, CFSTR("SBCoverSheetDidPresentNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, sel__handleAppSwitcherWillPresent_, CFSTR("SBUIAppSwitcherWillRevealNotification"), 0);

  }
  return v7;
}

- (BOOL)handlesSceneBackedRemoteTransientOverlaysOnly
{
  return self->_handlesSceneBackedRemoteTransientOverlaysOnly;
}

- (void)_activateIfPossible
{
  SBDeviceApplicationRemoteTransientOverlayContainerViewController *v3;
  SBDeviceApplicationRemoteTransientOverlayContainerViewController *containerVC;
  objc_super v5;

  if (-[NSMutableArray count](self->_activePresentationContexts, "count") == 1)
  {
    v3 = -[SBDeviceApplicationRemoteTransientOverlayContainerViewController initWithViewProvider:]([SBDeviceApplicationRemoteTransientOverlayContainerViewController alloc], "initWithViewProvider:", self);
    containerVC = self->_containerVC;
    self->_containerVC = v3;

    v5.receiver = self;
    v5.super_class = (Class)SBDeviceApplicationRemoteTransientOverlayViewProvider;
    -[SBDeviceApplicationSceneOverlayViewProvider _activateIfPossible](&v5, sel__activateIfPossible);
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  +[_SBActiveRemoteTransientOverlayViewProviderRegistry sharedInstance](_SBActiveRemoteTransientOverlayViewProviderRegistry, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterViewProvider:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("SBCoverSheetDidPresentNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("SBUIAppSwitcherWillRevealNotification"), 0);

  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationRemoteTransientOverlayViewProvider;
  -[SBDeviceApplicationSceneOverlayViewProvider dealloc](&v6, sel_dealloc);
}

- (BOOL)prefersStatusBarHidden
{
  void *v2;
  void *v3;
  char v4;

  -[NSMutableArray lastObject](self->_activePresentationContexts, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "prefersStatusBarHidden");

  return v4;
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSMutableArray lastObject](self->_activePresentationContexts, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preferredStatusBarStyle");

  return v4;
}

- (BOOL)contentWantsSimplifiedOrientationBehavior
{
  return self->_handlesSceneBackedRemoteTransientOverlaysOnly;
}

- (int64_t)priority
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  objc_msgSend((id)SBApp, "privacyPreflightController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "requiresPreflightForApplication:", v7);

  if (v8)
    return 4;
  else
    return 2;
}

- (BOOL)wantsResignActiveAssertion
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = self->_activePresentationContexts;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "remoteViewController", (_QWORD)v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isPresentedByBundleIdentifier:", CFSTR("com.apple.PDUIApp"));

        if ((v9 & 1) == 0)
        {
          objc_msgSend(v7, "remoteViewController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "preferredSceneDeactivationReasonValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            continue;
        }
        v12 = 0;
        goto LABEL_13;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v12 = 1;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v12 = 1;
  }
LABEL_13:

  return v12;
}

- (void)presentRemoteTransientOverlayViewController:(id)a3 presentationRequest:(id)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *activePresentationContexts;
  void *v9;
  SBDeviceApplicationRemoteTransientOverlayPresentationContext *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  if (!self->_activePresentationContexts)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activePresentationContexts = self->_activePresentationContexts;
    self->_activePresentationContexts = v7;

  }
  if (!-[SBDeviceApplicationRemoteTransientOverlayViewProvider isPresentingTransientOverlay:](self, "isPresentingTransientOverlay:", v23))
  {
    objc_msgSend(v6, "presentationTarget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(SBDeviceApplicationRemoteTransientOverlayPresentationContext);
    -[SBDeviceApplicationRemoteTransientOverlayPresentationContext setRemoteViewController:](v10, "setRemoteViewController:", v23);
    -[SBDeviceApplicationRemoteTransientOverlayPresentationContext setPresentationTarget:](v10, "setPresentationTarget:", v9);
    if (objc_msgSend(v6, "shouldStashPictureInPictureIfNeeded"))
    {
      objc_msgSend((id)SBApp, "windowSceneManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "windowSceneForSceneHandle:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "pictureInPictureManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "acquireStashAssertionForReason:identifier:", 6, CFSTR("EmbeddedRemoteTransientOverlayPresentation"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBDeviceApplicationRemoteTransientOverlayPresentationContext setPIPStashAssertion:](v10, "setPIPStashAssertion:", v15);
    }
    -[NSMutableArray addObject:](self->_activePresentationContexts, "addObject:", v10);
    -[SBDeviceApplicationRemoteTransientOverlayViewProvider _activateIfPossible](self, "_activateIfPossible");
    objc_msgSend(v23, "setPresentationPrefersStatusBarHidden:initialStatusBarSettings:", 1, 0);
    objc_msgSend(v23, "setPresentationEmbeddedInTargetScene:", 1);
    objc_msgSend(v23, "setTransientOverlayDelegate:", self);
    objc_msgSend(v9, "targetPredicate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "process");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      objc_msgSend(v23, "_setMediaOverridePID:", objc_msgSend(v17, "pid"));
    objc_msgSend(v23, "beginAppearanceTransition:animated:", 1, 0);
    -[SBDeviceApplicationRemoteTransientOverlayContainerViewController addChildViewController:](self->_containerVC, "addChildViewController:", v23);
    objc_msgSend(v23, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDeviceApplicationRemoteTransientOverlayContainerViewController view](self->_containerVC, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    objc_msgSend(v19, "setFrame:");

    -[SBDeviceApplicationRemoteTransientOverlayContainerViewController view](self->_containerVC, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v22);

    objc_msgSend(v23, "didMoveToParentViewController:", self->_containerVC);
    objc_msgSend(v23, "endAppearanceTransition");
    -[SBDeviceApplicationRemoteTransientOverlayViewProvider _redirectKeyboardFocusToPresentedRemoteViewController:](self, "_redirectKeyboardFocusToPresentedRemoteViewController:", v23);

  }
}

- (void)dismissRemoteTransientOverlayViewController:(id)a3
{
  _BOOL4 v4;
  void *v5;
  NSMutableArray *activePresentationContexts;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  v4 = -[SBDeviceApplicationRemoteTransientOverlayViewProvider isPresentingTransientOverlay:](self, "isPresentingTransientOverlay:", v7);
  v5 = v7;
  if (v4)
  {
    -[SBDeviceApplicationRemoteTransientOverlayViewProvider _dismissRemoteOverlayVC:](self, "_dismissRemoteOverlayVC:", v7);
    activePresentationContexts = self->_activePresentationContexts;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __101__SBDeviceApplicationRemoteTransientOverlayViewProvider_dismissRemoteTransientOverlayViewController___block_invoke;
    v8[3] = &unk_1E8EBC6A8;
    v9 = v7;
    -[NSMutableArray removeObjectAtIndex:](activePresentationContexts, "removeObjectAtIndex:", -[NSMutableArray indexOfObjectPassingTest:](activePresentationContexts, "indexOfObjectPassingTest:", v8));
    if (!-[NSMutableArray count](self->_activePresentationContexts, "count"))
    {
      self->_needsDeactivationWithNoActiveTransientOverlays = 1;
      -[SBDeviceApplicationRemoteTransientOverlayViewProvider _deactivateIfPossible](self, "_deactivateIfPossible");
      self->_needsDeactivationWithNoActiveTransientOverlays = 0;
    }

    v5 = v7;
  }

}

BOOL __101__SBDeviceApplicationRemoteTransientOverlayViewProvider_dismissRemoteTransientOverlayViewController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (BOOL)isPresentingTransientOverlay:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *activePresentationContexts;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  activePresentationContexts = self->_activePresentationContexts;
  if (activePresentationContexts)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__SBDeviceApplicationRemoteTransientOverlayViewProvider_isPresentingTransientOverlay___block_invoke;
    v8[3] = &unk_1E8EBC6A8;
    v9 = v4;
    LOBYTE(activePresentationContexts) = -[NSMutableArray indexOfObjectPassingTest:](activePresentationContexts, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  }
  return (char)activePresentationContexts;
}

BOOL __86__SBDeviceApplicationRemoteTransientOverlayViewProvider_isPresentingTransientOverlay___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (SBWindowScene)windowScene
{
  void *v3;
  void *v4;

  -[SBDeviceApplicationSceneOverlayViewProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowSceneForOverlayViewProvider:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBWindowScene *)v4;
}

- (BOOL)isPresentingOnBehalfOfApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSMutableArray *activePresentationContexts;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isSameExecutableAsApplication:", v4) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    activePresentationContexts = self->_activePresentationContexts;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __91__SBDeviceApplicationRemoteTransientOverlayViewProvider_isPresentingOnBehalfOfApplication___block_invoke;
    v10[3] = &unk_1E8EBC6D0;
    v11 = v4;
    v7 = -[NSMutableArray bs_containsObjectPassingTest:](activePresentationContexts, "bs_containsObjectPassingTest:", v10);

  }
  return v7;
}

uint64_t __91__SBDeviceApplicationRemoteTransientOverlayViewProvider_isPresentingOnBehalfOfApplication___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isPresentedByBundleIdentifier:", v4);

  return v5;
}

- (BOOL)isPresentingOnBehalfOfSceneIdentityTokenString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identityToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v4);

  return v9;
}

- (BOOL)isPresentingOnBehalfOfScenePersistentIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistenceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  return v7;
}

- (BOOL)shouldFollowSceneOrientation
{
  return 0;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSMutableArray lastObject](self->_activePresentationContexts, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preferredInterfaceOrientationForPresentation");

  return v4;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSMutableArray lastObject](self->_activePresentationContexts, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportedInterfaceOrientations");

  return v4;
}

- (unint64_t)defaultSupportedInterfaceOrientationsForTransientOverlayViewController:(id)a3
{
  return 26;
}

- (int64_t)defaultPreferredInterfaceOrientationForPresentationForTransientOverlayViewController:(id)a3
{
  return 0;
}

- (BOOL)defaultShouldAutorotateForTransientOverlayViewController:(id)a3
{
  return 0;
}

- (BOOL)isKeyboardVisibleForSpringBoardForTransientOverlayViewController:(id)a3
{
  return 0;
}

- (void)transientOverlayViewControllerNeedsSceneDeactivationUpdate:(id)a3
{
  id v4;

  -[SBDeviceApplicationSceneOverlayViewProvider delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlayViewProviderNeedsUpdateResignActiveAssertions:", self);

}

- (void)transientOverlayViewControllerNeedsStatusBarAppearanceUpdate:(id)a3
{
  id v4;

  -[SBDeviceApplicationSceneOverlayViewProvider delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlayViewProviderNeedsStatusBarAppearanceUpdate:", self);

}

- (BOOL)transientOverlayViewControllerIsForegroundActive:(id)a3
{
  return 0;
}

- (void)transientOverlayViewControllerDidUpdateHIDEventDeferringDisabled:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
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

  if (v8)
  {
    if (objc_msgSend(v8, "hidEventDeferringDisabled"))
    {
      -[SBDeviceApplicationRemoteTransientOverlayViewProvider _stopRedirectingKeyboardFocusToRemoteViewController:](self, "_stopRedirectingKeyboardFocusToRemoteViewController:", v8);
      -[SBDeviceApplicationRemoteTransientOverlayViewProvider _preventKeyboardFocusForPresentedRemoteViewControllerIfNeeded:](self, "_preventKeyboardFocusForPresentedRemoteViewControllerIfNeeded:", v8);
    }
    else
    {
      -[SBDeviceApplicationRemoteTransientOverlayViewProvider _stopPreventingKeyboardFocusForRemoteViewController:](self, "_stopPreventingKeyboardFocusForRemoteViewController:", v8);
      -[NSMapTable objectForKey:](self->_keyboardFocusRedirectionsByRemoteVC, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        SBLogTransientOverlay();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 138543362;
          v12 = v6;
          _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Not redirecting key focus to embedded remote alert %{public}@ because it already has an assertion.", (uint8_t *)&v11, 0xCu);
        }

      }
      else
      {
        -[SBDeviceApplicationRemoteTransientOverlayViewProvider _redirectKeyboardFocusToPresentedRemoteViewController:](self, "_redirectKeyboardFocusToPresentedRemoteViewController:", v8);
      }
    }
  }

}

- (CGRect)adjustedBoundsForContentBounds:(CGRect)a3 inTransientOverlayViewController:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBDeviceApplicationSceneOverlayViewProvider delegate](self, "delegate", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "adjustedBoundsForContentBounds:inOverlayViewProvider:", self, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)_deactivateIfPossible
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  SBDeviceApplicationRemoteTransientOverlayContainerViewController *containerVC;
  NSMutableArray *activePresentationContexts;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_activePresentationContexts, "count")
    || self->_needsDeactivationWithNoActiveTransientOverlays)
  {
    if (-[NSMutableArray count](self->_activePresentationContexts, "count"))
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v3 = self->_activePresentationContexts;
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v13 != v6)
              objc_enumerationMutation(v3);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "remoteViewController");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBDeviceApplicationRemoteTransientOverlayViewProvider _dismissRemoteOverlayVC:](self, "_dismissRemoteOverlayVC:", v8);

          }
          v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v5);
      }

      -[NSMutableArray removeAllObjects](self->_activePresentationContexts, "removeAllObjects");
    }
    v11.receiver = self;
    v11.super_class = (Class)SBDeviceApplicationRemoteTransientOverlayViewProvider;
    -[SBDeviceApplicationSceneOverlayViewProvider _deactivateIfPossible](&v11, sel__deactivateIfPossible);
    containerVC = self->_containerVC;
    self->_containerVC = 0;

    activePresentationContexts = self->_activePresentationContexts;
    self->_activePresentationContexts = 0;

  }
}

- (id)_realOverlayViewController
{
  return self->_containerVC;
}

- (void)_dismissRemoteOverlayVC:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "beginAppearanceTransition:animated:", 0, 0);
  objc_msgSend(v5, "willMoveToParentViewController:", 0);
  objc_msgSend(v5, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  objc_msgSend(v5, "removeFromParentViewController");
  objc_msgSend(v5, "endAppearanceTransition");
  -[SBDeviceApplicationRemoteTransientOverlayViewProvider _stopRedirectingKeyboardFocusToRemoteViewController:](self, "_stopRedirectingKeyboardFocusToRemoteViewController:", v5);
  -[SBDeviceApplicationRemoteTransientOverlayViewProvider _stopPreventingKeyboardFocusForRemoteViewController:](self, "_stopPreventingKeyboardFocusForRemoteViewController:", v5);
  objc_msgSend(v5, "setTransientOverlayDelegate:", 0);

}

- (void)_redirectKeyboardFocusToPresentedRemoteViewController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMapTable *keyboardFocusRedirectionsByRemoteVC;
  NSMapTable *v18;
  NSMapTable *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[SBDeviceApplicationSceneOverlayViewProvider sceneHandle](self, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pid");
  objc_msgSend(v5, "sceneIfExists");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identityToken");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && !v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationRemoteTransientOverlayViewProvider.m"), 389, CFSTR("no sceneIdentityToken on sceneHandle %@"), v5);
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    v20 = v6;
    v12 = objc_msgSend(v21, "serviceProcessIdentifier");
    objc_msgSend(v21, "clientSceneIdentityToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "keyboardFocusController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "redirectFocusForReason:fromProcessIdentifier:fromSceneIdentityToken:toProcessidentifier:toSceneIdentityToken:", CFSTR("remoteTransientOverlay-identityToken"), v8, v11, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    keyboardFocusRedirectionsByRemoteVC = self->_keyboardFocusRedirectionsByRemoteVC;
    if (!keyboardFocusRedirectionsByRemoteVC)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v18 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v19 = self->_keyboardFocusRedirectionsByRemoteVC;
      self->_keyboardFocusRedirectionsByRemoteVC = v18;

      keyboardFocusRedirectionsByRemoteVC = self->_keyboardFocusRedirectionsByRemoteVC;
    }
    -[NSMapTable setObject:forKey:](keyboardFocusRedirectionsByRemoteVC, "setObject:forKey:", v16, v21);

    v6 = v20;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_stopRedirectingKeyboardFocusToRemoteViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMapTable objectForKey:](self->_keyboardFocusRedirectionsByRemoteVC, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "invalidate");
    -[NSMapTable removeObjectForKey:](self->_keyboardFocusRedirectionsByRemoteVC, "removeObjectForKey:", v6);
  }

}

- (void)_preventKeyboardFocusForPresentedRemoteViewControllerIfNeeded:(id)a3
{
  id v4;
  void *v5;
  NSMapTable *keyboardFocusPreventionAssertionsByRemoteVC;
  NSMapTable *v7;
  NSMapTable *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "clientSceneIdentityToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    keyboardFocusPreventionAssertionsByRemoteVC = self->_keyboardFocusPreventionAssertionsByRemoteVC;
    if (!keyboardFocusPreventionAssertionsByRemoteVC)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_keyboardFocusPreventionAssertionsByRemoteVC;
      self->_keyboardFocusPreventionAssertionsByRemoteVC = v7;

      keyboardFocusPreventionAssertionsByRemoteVC = self->_keyboardFocusPreventionAssertionsByRemoteVC;
    }
    -[NSMapTable objectForKey:](keyboardFocusPreventionAssertionsByRemoteVC, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "keyboardFocusController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "preventFocusForSceneWithIdentityToken:reason:", v5, CFSTR("embedded remote transient overlay disabling event deferral"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMapTable setObject:forKey:](self->_keyboardFocusPreventionAssertionsByRemoteVC, "setObject:forKey:", v14, v4);
      goto LABEL_12;
    }
    SBLogTransientOverlay();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v4;
      v11 = "Not taking new key focus prevention assertion for embedded remote alert %{public}@ because it already has one.";
LABEL_9:
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    SBLogTransientOverlay();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v4;
      v11 = "Not taking key focus prevention assertion for embedded remote alert %{public}@ because it doesn't have a scene identity.";
      goto LABEL_9;
    }
  }

LABEL_12:
}

- (void)_stopPreventingKeyboardFocusForRemoteViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMapTable objectForKey:](self->_keyboardFocusPreventionAssertionsByRemoteVC, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "invalidate");
    -[NSMapTable removeObjectForKey:](self->_keyboardFocusPreventionAssertionsByRemoteVC, "removeObjectForKey:", v6);
  }

}

- (void)_handleCoverSheetDidPresent:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)-[NSMutableArray copy](self->_activePresentationContexts, "copy", a3, 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "presentationTarget");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "shouldDismissOnUILock");

        if (v11)
        {
          objc_msgSend(v9, "remoteViewController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBDeviceApplicationRemoteTransientOverlayViewProvider dismissRemoteTransientOverlayViewController:](self, "dismissRemoteTransientOverlayViewController:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)_handleAppSwitcherWillPresent:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)-[NSMutableArray copy](self->_activePresentationContexts, "copy", a3, 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "presentationTarget");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "shouldDismissInSwitcher");

        if (v11)
        {
          objc_msgSend(v9, "remoteViewController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBDeviceApplicationRemoteTransientOverlayViewProvider dismissRemoteTransientOverlayViewController:](self, "dismissRemoteTransientOverlayViewController:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardFocusPreventionAssertionsByRemoteVC, 0);
  objc_storeStrong((id *)&self->_keyboardFocusRedirectionsByRemoteVC, 0);
  objc_storeStrong((id *)&self->_containerVC, 0);
  objc_storeStrong((id *)&self->_activePresentationContexts, 0);
}

@end
