@implementation SBSwitcherController

- (id)layoutStateApplicationSceneHandles
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherController layoutState](self, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "elements", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "layoutRole") == 3)
        {
          v11 = objc_msgSend(v4, "floatingConfiguration");
          if (v11 <= 4 && ((1 << v11) & 0x19) != 0)
            continue;
        }
        objc_msgSend(v10, "workspaceEntity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "applicationSceneEntity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sceneHandle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v3, "addObject:", v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v3, "count"))
    v15 = v3;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

- (id)layoutStatePrimaryElement
{
  void *v2;
  void *v3;

  -[SBSwitcherController layoutState](self, "layoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementWithRole:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FBSDisplayIdentity)displayIdentity
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "_fbsDisplayIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSDisplayIdentity *)v3;
}

- (id)_deviceApplicationSceneHandleForDisplayItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  -[SBSwitcherController windowScene](self, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationForDisplayItem:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v10 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v4, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneIdentityForApplication:uniqueIdentifier:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_6:
    v12 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v6, "existingSceneHandleForSceneIdentity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isDeviceApplicationSceneHandle"))
    v12 = v11;
  else
    v12 = 0;

LABEL_9:
  v13 = v12;

  return v13;
}

- (SBLayoutState)layoutState
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "layoutStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBLayoutState *)v4;
}

- (int64_t)unlockedEnvironmentMode
{
  void *v2;
  int64_t v3;

  -[SBSwitcherController layoutState](self, "layoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unlockedEnvironmentMode");

  return v3;
}

- (BOOL)layoutContainsRole:(int64_t)a3
{
  void *v4;

  -[SBSwitcherController layoutState](self, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "layoutContainsRole:", a3);

  return a3;
}

- (id)_ancillaryTransitionRequestForTransitionRequest:(id)a3
{
  SBMainWorkspaceTransitionRequest *v3;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  SBMainWorkspaceTransitionRequest *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v5, "displayIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_fbsDisplayIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v5, "applicationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "elements");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSwitcherController layoutState](self, "layoutState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "elements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke;
  v25[3] = &unk_1E8EA2148;
  v16 = v12;
  v26 = v16;
  objc_msgSend(v14, "bs_filter:", v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  if (v18)
  {
    v19 = [SBMainWorkspaceTransitionRequest alloc];
    objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[SBMainWorkspaceTransitionRequest initWithDisplayConfiguration:](v19, "initWithDisplayConfiguration:", v20);

    -[SBMainWorkspaceTransitionRequest setSource:](v3, "setSource:", objc_msgSend(v5, "source"));
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_3;
    v22[3] = &unk_1E8E9ECA8;
    v23 = v13;
    v24 = v17;
    -[SBWorkspaceTransitionRequest modifyApplicationContext:](v3, "modifyApplicationContext:", v22);

  }
  if (!v18)
LABEL_5:
    v3 = 0;

  return v3;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (SBSwitcherContentViewControlling)contentViewController
{
  return self->_contentViewController;
}

- (unint64_t)windowManagementStyle
{
  void *v4;
  BOOL v5;

  if (-[SBSwitcherController isChamoisMultitaskingEnabled](self, "isChamoisMultitaskingEnabled"))
    return 2;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isMedusaCapable"))
  {
    v5 = -[SBSwitcherController isMedusaMultitaskingEnabled](self, "isMedusaMultitaskingEnabled");

    if (v5)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutStateTransitionCoordinator:transitionDidBeginWithTransitionContext:", v21, v6);

  objc_msgSend(v6, "applicationTransitionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toLayoutState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromLayoutState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "unlockedEnvironmentMode");
  v14 = objc_msgSend(v11, "unlockedEnvironmentMode");
  if (v13 == 2)
  {
    v15 = v14;
    if ((objc_msgSend(v8, "animationDisabled") & 1) == 0)
    {
      if (v15 != 2)
        objc_storeStrong((id *)&self->_activeAppLayoutWhenActivatingMainSwitcher, v12);
      objc_msgSend(v9, "transientOverlayContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16 && objc_msgSend(v16, "transitionType") == 1)
      {
        objc_msgSend(v17, "transientOverlay");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSwitcherController appLayoutForWorkspaceTransientOverlay:](self, "appLayoutForWorkspaceTransientOverlay:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          objc_storeStrong((id *)&self->_activeAppLayoutWhenActivatingMainSwitcher, v19);

      }
    }
  }
  -[SBSwitcherController _reevaluateOrientationIfNecessary](self, "_reevaluateOrientationIfNecessary");
  self->_isPublishedOrientationLocked = self->_shouldLockPublishedOrientation;
  objc_msgSend(v6, "toLayoutState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  self->_canDetermineActiveOrientation = objc_msgSend(v20, "unlockedEnvironmentMode") != 1;

  -[TRAParticipant setNeedsUpdatePreferencesWithReason:](self->_publisherTraitsParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("Layout state change did begin"));
  -[SBSwitcherContentViewControlling layoutStateTransitionCoordinator:transitionDidBeginWithTransitionContext:](self->_contentViewController, "layoutStateTransitionCoordinator:transitionDidBeginWithTransitionContext:", v21, v6);

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  BSInvalidatable *suppressHidingProtectedAppsAssertion;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  BSInvalidatable *v16;
  BSInvalidatable *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutStateTransitionCoordinator:transitionDidEndWithTransitionContext:", v18, v6);

  if (self->_isPublishedOrientationLocked)
  {
    self->_isPublishedOrientationLocked = 0;
    -[TRAParticipant setNeedsUpdatePreferencesWithReason:](self->_publisherTraitsParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("publisher unlock"));
  }
  -[SBSwitcherContentViewControlling layoutStateTransitionCoordinator:transitionDidEndWithTransitionContext:](self->_contentViewController, "layoutStateTransitionCoordinator:transitionDidEndWithTransitionContext:", v18, v6);
  v8 = -[SBSwitcherController isAnySwitcherVisible](self, "isAnySwitcherVisible");
  suppressHidingProtectedAppsAssertion = self->_suppressHidingProtectedAppsAssertion;
  if (!v8)
  {
    -[BSInvalidatable invalidate](suppressHidingProtectedAppsAssertion, "invalidate");
    v10 = self->_suppressHidingProtectedAppsAssertion;
    self->_suppressHidingProtectedAppsAssertion = 0;
    goto LABEL_7;
  }
  if (!suppressHidingProtectedAppsAssertion)
  {
    +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_appProtectionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ - %p"), v14, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "acquireSuppressHidingAppsAssertionForReason:", v15);
    v16 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v17 = self->_suppressHidingProtectedAppsAssertion;
    self->_suppressHidingProtectedAppsAssertion = v16;

LABEL_7:
  }

}

- (void)updateWindowVisibilityForSwitcherContentController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SBSwitcherController contentViewController](self, "contentViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v9;
  if (v4 == v9)
  {
    v6 = objc_msgSend(v9, "isWindowVisible");
    -[SBSwitcherController switcherWindow](self, "switcherWindow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherController switcherViewController](self, "switcherViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v6 == objc_msgSend(v7, "isHidden"))
    {
      if (((v6 ^ 1 | -[SBSwitcherController _isUnderUILock](self, "_isUnderUILock")) & 1) == 0)
        objc_msgSend(v7, "makeKeyAndVisible");
      objc_msgSend(v7, "setHidden:", v6 ^ 1);
      objc_msgSend(v8, "bs_endAppearanceTransition:", v6);
      -[TRAParticipant setNeedsUpdatePreferencesWithReason:](self->_traitsParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("Window visibility change"));
      -[TRAParticipant setNeedsUpdatePreferencesWithReason:](self->_publisherTraitsParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("Window visibility change"));
    }

    v5 = v9;
  }

}

- (SBMainSwitcherWindow)switcherWindow
{
  return self->_switcherWindow;
}

- (SBSwitcherViewController)switcherViewController
{
  return self->_switcherViewController;
}

- (SBSwitcherControllerCoordinating)switcherCoordinator
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherCoordinator);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherController.m"), 273, CFSTR("You should be coordinated by a switcher coordinator."));

  }
  return (SBSwitcherControllerCoordinating *)WeakRetained;
}

- (BOOL)isInAppStatusBarRequestedHiddenForSwitcherContentController:(id)a3
{
  return -[NSHashTable count](self->_inAppStatusBarHiddenAssertions, "count", a3) != 0;
}

- (CGRect)statusBarAvoidanceFrameForLayoutRole:(int64_t)a3 layoutState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect result;

  v6 = a4;
  v7 = v6;
  if (a3 == 3)
    objc_msgSend(v6, "floatingAppLayout");
  else
    objc_msgSend(v6, "appLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "unlockedEnvironmentMode") == 3 && objc_msgSend(v7, "layoutContainsRole:", a3))
  {
    v9 = objc_msgSend(v7, "interfaceOrientationForLayoutRole:", a3);
    if (-[SBSwitcherController windowManagementStyle](self, "windowManagementStyle") == 2)
      v9 = objc_msgSend(v7, "interfaceOrientation");
    -[SBSwitcherController frameForItemWithRole:inMainAppLayout:interfaceOrientation:](self, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", a3, v8, v9);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    +[SBNubView hitTestWidth](SBNubView, "hitTestWidth");
    v19 = v18;
    +[SBNubView height](SBNubView, "height");
    v21 = v20;
    v28.origin.x = v11;
    v28.origin.y = v13;
    v28.size.width = v15;
    v28.size.height = v17;
    v22 = CGRectGetMidX(v28) + v19 * -0.5;
    v23 = 0.0;
  }
  else
  {
    v22 = *MEMORY[0x1E0C9D648];
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v24 = v22;
  v25 = v23;
  v26 = v19;
  v27 = v21;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

void __64__SBSwitcherController_updatePreferencesForParticipant_updater___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v3 = objc_msgSend(v9, "supportedOrientations");
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 193))
  {
    if (v3)
      goto LABEL_3;
LABEL_10:
    v5 = 30;
    goto LABEL_11;
  }
  if (*(_BYTE *)(v4 + 177))
    v6 = v3 == 0;
  else
    v6 = 1;
  if (v6)
    goto LABEL_10;
LABEL_3:
  v5 = objc_msgSend(v9, "supportedOrientations");
  if (v5 == 30)
  {
    objc_msgSend(*(id *)(a1 + 40), "currentOrientation");
    v5 = SBFBSInterfaceOrientationMaskForBSInterfaceOrientation();
  }
LABEL_11:
  objc_msgSend(v9, "setSupportedOrientations:", v5);
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v7 + 194))
    v8 = objc_msgSend(*(id *)(v7 + 256), "_isVisible");
  else
    v8 = 0;
  objc_msgSend(v9, "setCanDetermineActiveOrientation:", v8);

}

void __64__SBSwitcherController_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setSupportedOrientations:", objc_msgSend(v2, "switcherSupportedInterfaceOrientations"));

}

- (unint64_t)switcherSupportedInterfaceOrientations
{
  int64_t panGestureRecognizerRequestedOrientation;

  panGestureRecognizerRequestedOrientation = self->_panGestureRecognizerRequestedOrientation;
  if (panGestureRecognizerRequestedOrientation)
    return 1 << panGestureRecognizerRequestedOrientation;
  else
    return 30;
}

- (CGRect)sceneEntityFrameForWorkspaceEntity:(id)a3 inLayoutState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  SBAppLayout *v15;
  uint64_t v16;
  void *v17;
  SBAppLayout *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
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
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  SBDisplayItemLayoutAttributes *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  NSObject *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id WeakRetained;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  SBAppLayout *v64;
  __int16 v65;
  void *v66;
  void *v67;
  _QWORD v68[3];
  CGRect result;

  v68[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBSwitcherController switcherViewController](self, "switcherViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");

  v58 = objc_msgSend(v7, "floatingConfiguration");
  objc_msgSend(v6, "applicationSceneEntity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sceneHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBSwitcherController interfaceOrientationForSceneHandle:](self, "interfaceOrientationForSceneHandle:", v11);

  if (-[SBSwitcherController windowManagementStyle](self, "windowManagementStyle") == 2)
    v59 = objc_msgSend(v7, "interfaceOrientation");
  else
    v59 = v12;
  v13 = objc_msgSend(v6, "layoutRole");
  objc_msgSend(v7, "appLayout");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (SBAppLayout *)v14;
  if (v13)
    v16 = v13;
  else
    v16 = 1;
  if (!v14)
  {
    objc_msgSend(v6, "displayItemRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = [SBAppLayout alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v19;
    v68[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v18, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v20, 1, 1, objc_msgSend(v7, "displayOrdinal"));

  }
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "currentCoordinatedLayoutStateTransitionContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "displayItemRepresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  if (v22 && objc_msgSend(v22, "isDisplayItemTransitioning:", v23))
  {
    objc_msgSend(v22, "fromSwitcherController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SBSwitcherController isEqual:](self, "isEqual:", v24);

    if (v25)
      objc_msgSend(v22, "toFrameInFromSwitcherForDisplayItem:", v23);
    objc_msgSend(v22, "toSwitcherController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[SBSwitcherController isEqual:](self, "isEqual:", v26);

    if (v27)
      objc_msgSend(v22, "toFrameInToSwitcherForDisplayItem:", v23);
    v28 = WeakRetained;
    objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");

    _UIWindowConvertRectFromOrientationToOrientation();
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
  }
  else
  {
    v38 = objc_msgSend(v7, "peekConfiguration");
    if (SBPeekConfigurationIsValid(v38))
    {
      v57 = v8;
      -[SBAppLayout itemForLayoutRole:](v15, "itemForLayoutRole:", 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v39)
      {
        v40 = objc_msgSend(v7, "spaceConfiguration");
        v41 = 2;
        v42 = 4;
        if (v40 != 2)
          v42 = v40;
        if (v40 != 4)
          v41 = v42;
        if (v38 != 3)
          v41 = v40;
        v56 = v41;
        +[SBDisplayItem displayItemWithType:bundleIdentifier:uniqueIdentifier:](SBDisplayItem, "displayItemWithType:bundleIdentifier:uniqueIdentifier:", 0, CFSTR("com.apple.springboard.PeekPlacholderItem"), CFSTR("com.apple.springboard.PeekPlacholderItem.1"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_alloc_init(SBDisplayItemLayoutAttributes);
        -[SBAppLayout appLayoutByInsertingItem:withLayoutAttributes:inLayoutRole:](v15, "appLayoutByInsertingItem:withLayoutAttributes:inLayoutRole:", v43, v44, 2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v45, "appLayoutByModifyingConfiguration:", SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(v56));
        v15 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

      }
      v8 = v57;
    }
    if (v16 == 3)
    {
      -[SBSwitcherController referenceFrameForInterfaceOrientation:floatingConfiguration:](self, "referenceFrameForInterfaceOrientation:floatingConfiguration:", v59, v58);
    }
    else if (v16 == 4)
    {
      -[SBSwitcherController referenceFrameForInterfaceOrientation:centerConfiguration:](self, "referenceFrameForInterfaceOrientation:centerConfiguration:", v59, objc_msgSend(v7, "centerConfiguration"));
    }
    else
    {
      -[SBSwitcherController referenceFrameForInterfaceOrientation:layoutRole:appLayout:](self, "referenceFrameForInterfaceOrientation:layoutRole:appLayout:", v59, v16, v15);
    }
    v31 = v46;
    v33 = v47;
    v35 = v48;
    v37 = v49;
    v28 = WeakRetained;
  }
  if (v35 == *MEMORY[0x1E0C9D820] && v37 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    SBLogAppSwitcher();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v28, "_fbsDisplayIdentity");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v62 = v6;
      v63 = 2114;
      v64 = v15;
      v65 = 2114;
      v66 = v55;
      _os_log_error_impl(&dword_1D0540000, v50, OS_LOG_TYPE_ERROR, "produced {0,0} with entity %{public}@, appLayout %{public}@ windowScene displayIdentity %{public}@", buf, 0x20u);

    }
  }

  v51 = v31;
  v52 = v33;
  v53 = v35;
  v54 = v37;
  result.size.height = v54;
  result.size.width = v53;
  result.origin.y = v52;
  result.origin.x = v51;
  return result;
}

- (CGRect)frameForItemWithRole:(int64_t)a3 inMainAppLayout:(id)a4 interfaceOrientation:(int64_t)a5
{
  SBDisplayItemLayoutAttributesCalculator *displayItemFrameCalculator;
  SBWindowScene **p_windowScene;
  id v9;
  id WeakRetained;
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
  double v22;
  CGRect result;

  displayItemFrameCalculator = self->_displayItemFrameCalculator;
  p_windowScene = &self->_windowScene;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_windowScene);
  -[SBDisplayItemLayoutAttributesCalculator frameForLayoutRole:inAppLayout:containerOrientation:windowScene:](displayItemFrameCalculator, "frameForLayoutRole:inAppLayout:containerOrientation:windowScene:", a3, v9, a5, WeakRetained);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (int64_t)interfaceOrientationForSceneHandle:(id)a3
{
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBSwitcherController _interfaceOrientationForLayoutElementIdentifier:](self, "_interfaceOrientationForLayoutElementIdentifier:", v4);

  return v5;
}

- (void)_noteLayoutStateEvaluationEndedWithParticipantsByElementIdentifiers:(id)a3 delegatesByParticipant:(id)a4 primaryDelegate:(id)a5
{
  NSDictionary *v8;
  NSDictionary *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSDictionary *traitsParticipantsByElementIdentifier;
  NSDictionary *v20;
  NSDictionary *traitsDelegateByParticipant;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = (NSDictionary *)a3;
  v9 = (NSDictionary *)a4;
  v10 = a5;
  v11 = v10;
  if (self->_layoutStateEvaluationCounter == 1)
  {
    v26 = v10;
    -[NSDictionary allValues](v8, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[NSDictionary allValues](self->_traitsParticipantsByElementIdentifier, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if ((objc_msgSend(v12, "containsObject:", v18) & 1) == 0)
            objc_msgSend(v18, "invalidate");
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v15);
    }

    traitsParticipantsByElementIdentifier = self->_traitsParticipantsByElementIdentifier;
    self->_traitsParticipantsByElementIdentifier = v8;
    v20 = v8;

    traitsDelegateByParticipant = self->_traitsDelegateByParticipant;
    self->_traitsDelegateByParticipant = v9;
    v8 = v9;

    objc_storeStrong((id *)&self->_primaryElementTraitsParticipantDelegate, a5);
    v9 = v20;
    v11 = v26;
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[NSDictionary allValues](v8, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "invalidate");
        }
        v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v23);
    }
  }

  self->_evaluatingLayoutStateOrientation = 0;
  --self->_layoutStateEvaluationCounter;

}

- (id)coordinateSpaceForLayoutState:(id)a3
{
  return -[SBSwitcherController coordinateSpaceForInterfaceOrientation:](self, "coordinateSpaceForInterfaceOrientation:", objc_msgSend(a3, "interfaceOrientation"));
}

- (double)minimumHomeScreenScale
{
  double result;

  -[SBSwitcherContentViewControlling minimumHomeScreenScale](self->_contentViewController, "minimumHomeScreenScale");
  return result;
}

uint64_t __123__SBSwitcherController__enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (!WeakRetained
    || WeakRetained[177]
    || (objc_msgSend(WeakRetained, "_isUnderUILock") & 1) != 0
    || (v6 = *(_QWORD *)(a1 + 40)) != 0 && !(*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v3))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v3, "applicationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_updateAppTransitionContext:withOrientationActuationContext:", v7, *(_QWORD *)(a1 + 32));

    v8 = 1;
  }

  return v8;
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v6;
  TRAParticipant *v7;
  _QWORD v8[5];
  TRAParticipant *v9;
  _QWORD v10[5];

  v7 = (TRAParticipant *)a3;
  v6 = a4;
  if (self->_traitsParticipant == v7)
  {
    -[TRAParticipant currentZOrderLevel](v7, "currentZOrderLevel");
    if ((BSFloatEqualToFloat() & 1) == 0)
      objc_msgSend(v6, "updateZOrderLevelPreferencesWithBlock:", &__block_literal_global_146);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__SBSwitcherController_updatePreferencesForParticipant_updater___block_invoke_2;
    v10[3] = &unk_1E8EA7770;
    v10[4] = self;
    objc_msgSend(v6, "updateOrientationPreferencesWithBlock:", v10, v7);
  }
  else if (self->_publisherTraitsParticipant == v7)
  {
    -[TRAParticipant currentZOrderLevel](v7, "currentZOrderLevel");
    if ((BSFloatEqualToFloat() & 1) == 0)
      objc_msgSend(v6, "updateZOrderLevelPreferencesWithBlock:", &__block_literal_global_104);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__SBSwitcherController_updatePreferencesForParticipant_updater___block_invoke_4;
    v8[3] = &unk_1E8EAD480;
    v8[4] = self;
    v9 = v7;
    objc_msgSend(v6, "updateOrientationPreferencesWithBlock:", v8);

  }
}

- (int64_t)_interfaceOrientationForLayoutElementIdentifier:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;

  v4 = a3;
  -[SBSwitcherController _traitsParticipantForLayoutElementIdentifier:](self, "_traitsParticipantForLayoutElementIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sbf_currentOrientation");
  if (!v6)
  {
    -[SBSwitcherController layoutState](self, "layoutState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "interfaceOrientationForElementIdentifier:", v4);

  }
  return v6;
}

- (void)switcherOrientation:(int64_t *)a3 elementsOrientations:(id *)a4 forTransitionRequest:(id)a5 previousLayoutState:(id)a6 layoutState:(id)a7
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  SBSwitcherLayoutTransitionNotes *v21;
  SBSwitcherLayoutTransitionNotes *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  BOOL canDetermineActiveOrientation;
  unint64_t v30;
  BOOL v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  id v40;
  id v41;
  SBTraitsSceneParticipantDelegate *v42;
  SBSwitcherTraitsAssistant *traitsAssistant;
  void *v44;
  TRASettingsActuationContext *arbiterActuationContext;
  NSObject *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  TRASettingsActuationContext *v51;
  _BOOL8 v52;
  void *v53;
  char v54;
  void *v55;
  int64_t v56;
  int64_t v57;
  int64_t v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  int v76;
  void *v77;
  int64_t *v78;
  id *v79;
  int v80;
  id v81;
  id v82;
  id v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v13)
  {
    if (a3)
      goto LABEL_3;
LABEL_74:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherController.m"), 518, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outSwitcherOrientation"));

    if (a4)
      goto LABEL_4;
    goto LABEL_75;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherController.m"), 517, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionRequest"));

  if (!a3)
    goto LABEL_74;
LABEL_3:
  if (a4)
    goto LABEL_4;
LABEL_75:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherController.m"), 519, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outElementsOrientations"));

LABEL_4:
  SBLogTraitsArbiter();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    SBMainWorkspaceTransitionSourceDescription(objc_msgSend(v13, "source"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v85 = v17;
    _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "[SwitcherOrientation] transition source: %{public}@", buf, 0xCu);

  }
  v18 = objc_msgSend(v13, "source");
  v19 = -[SBSwitcherController _isUnderUILock](self, "_isUnderUILock");
  objc_msgSend(v13, "eventLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v20, "containsString:", CFSTR("SBSwitcherControllerEventLabelFollowupRotation"));

  v21 = -[SBSwitcherLayoutTransitionNotes initWithFromPreviousState:currentLayoutState:transitionRequest:]([SBSwitcherLayoutTransitionNotes alloc], "initWithFromPreviousState:currentLayoutState:transitionRequest:", v14, v15, v13);
  v22 = v21;
  *a3 = 0;
  if (v18 == 14
    || -[SBSwitcherLayoutTransitionNotes fromNoAppToApp](v21, "fromNoAppToApp")
    || -[SBSwitcherLayoutTransitionNotes changingApps](v22, "changingApps")
    || !v19 && (self->_traitsParticipant || objc_msgSend(v15, "unlockedEnvironmentMode") != 1))
  {
    v72 = v18;
    -[SBSwitcherController _noteLayoutStateEvaluationBegan](self, "_noteLayoutStateEvaluationBegan");
    if (!self->_traitsParticipant)
      -[SBSwitcherController _setupSwitcherTraitsParticipantAndPolicySpecifiers](self, "_setupSwitcherTraitsParticipantAndPolicySpecifiers");
    objc_msgSend(v15, "elementWithRole:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "workspaceEntity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = v24;
    objc_msgSend(v24, "applicationSceneEntity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sceneHandle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "application");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v27, "classicAppPhoneAppRunningOnPad");

    v28 = -[SBSwitcherLayoutTransitionNotes fromHomeScreenToApp](v22, "fromHomeScreenToApp");
    if (-[SBSwitcherLayoutTransitionNotes inHomeScreen](v22, "inHomeScreen"))
      canDetermineActiveOrientation = self->_canDetermineActiveOrientation;
    else
      canDetermineActiveOrientation = 1;
    self->_canDetermineActiveOrientation = canDetermineActiveOrientation;
    self->_shouldLockPublishedOrientation = v28;
    self->_panGestureRecognizerRequestedOrientation = 0;
    v30 = -[SBSwitcherController windowManagementStyle](self, "windowManagementStyle");
    v31 = -[SBSwitcherLayoutTransitionNotes isSystemGesture](v22, "isSystemGesture");
    v75 = v13;
    v78 = a3;
    v79 = a4;
    if (v30 == 2)
    {
      if (v31
        || -[SBSwitcherLayoutTransitionNotes fromSwitcher](v22, "fromSwitcher")
        && -[SBSwitcherLayoutTransitionNotes inApp](v22, "inApp"))
      {
        v32 = 1;
        v33 = 5;
      }
      else
      {
        v32 = 0;
        if (-[SBSwitcherLayoutTransitionNotes inAnySwitcher](v22, "inAnySwitcher"))
          v33 = 5;
        else
          v33 = 4;
      }
      v71 = 3;
      v34 = 3;
      goto LABEL_43;
    }
    if (!v31 && !-[SBSwitcherLayoutTransitionNotes isPIPRestore](v22, "isPIPRestore"))
    {
      if (-[SBSwitcherLayoutTransitionNotes fromHomeScreenToApp](v22, "fromHomeScreenToApp")
        || -[SBSwitcherLayoutTransitionNotes stableInAppOrMovingBetweenSingleApp](v22, "stableInAppOrMovingBetweenSingleApp"))
      {
        if (v80)
          v33 = 4;
        else
          v33 = 3;
        if (v77)
          goto LABEL_30;
      }
      else if (!-[SBSwitcherLayoutTransitionNotes fromAppToHomeScreen](v22, "fromAppToHomeScreen"))
      {
        if (-[SBSwitcherLayoutTransitionNotes stableInHomeScreen](v22, "stableInHomeScreen"))
        {
          v33 = 2;
LABEL_30:
          v32 = 0;
          if (-[SBSwitcherLayoutTransitionNotes movingToSingleApp](v22, "movingToSingleApp"))
            v34 = 6;
          else
            v34 = 4;
          goto LABEL_40;
        }
        v32 = !-[SBSwitcherLayoutTransitionNotes inAnySwitcher](v22, "inAnySwitcher");
LABEL_39:
        -[SBSwitcherLayoutTransitionNotes movingToSingleApp](v22, "movingToSingleApp");
        v34 = 3;
        v33 = 5;
LABEL_40:
        v35 = 3;
        if (!v80)
          v35 = v34;
        v71 = v35;
LABEL_43:
        self->_needsOrientationReevaluation = v32;
        objc_msgSend(v15, "elements");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v14;
        objc_msgSend(v14, "elements");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v36, "isEqual:", v37) & 1) != 0)
        {
          objc_msgSend(v15, "elements");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = -[SBSwitcherController _areLayoutStateElements:matchedWithAssociatedParticipants:](self, "_areLayoutStateElements:matchedWithAssociatedParticipants:", v38, self->_traitsParticipantsByElementIdentifier);

          if (v39)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_traitsParticipantsByElementIdentifier);
            v40 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_traitsDelegateByParticipant);
            v41 = (id)objc_claimAutoreleasedReturnValue();
            v42 = self->_primaryElementTraitsParticipantDelegate;
            goto LABEL_48;
          }
        }
        else
        {

        }
        traitsAssistant = self->_traitsAssistant;
        objc_msgSend(v15, "elements");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = 0;
        v83 = 0;
        v81 = 0;
        -[SBSwitcherTraitsAssistant createTraitsParticipantsForLayoutElements:outParticipantsByElementIdentifier:outDelegatesByParticipant:outPrimaryDelegate:](traitsAssistant, "createTraitsParticipantsForLayoutElements:outParticipantsByElementIdentifier:outDelegatesByParticipant:outPrimaryDelegate:", v44, &v83, &v82, &v81);
        v40 = v83;
        v41 = v82;
        v42 = (SBTraitsSceneParticipantDelegate *)v81;

LABEL_48:
        v73 = v15;
        arbiterActuationContext = self->_arbiterActuationContext;
        self->_arbiterActuationContext = 0;

        SBLogTraitsArbiter();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          SBStringFromSwitcherOrientationPolicy(v33);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          SBStringFromSwitcherLiveOverlayOrientationPolicy(v34);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v85 = v47;
          v86 = 2114;
          v87 = v48;
          _os_log_impl(&dword_1D0540000, v46, OS_LOG_TYPE_DEFAULT, "[SwitcherOrientation] switcherPolicy[%{public}@ primaryOverlaysPolicy[%{public}@]", buf, 0x16u);

        }
        -[SBSwitcherTraitsAssistant updateAllParticipants:withPrimaryDelegate:nonPrimaryPolicy:primaryPolicy:ownPolicy:](self->_traitsAssistant, "updateAllParticipants:withPrimaryDelegate:nonPrimaryPolicy:primaryPolicy:ownPolicy:", v41, v42, v71, v34, v33);
        v49 = v76;
        if (v72 != 14)
          v49 = 1;
        if (v49 == 1 && self->_arbiterActuationContext)
        {
          v13 = v75;
          objc_msgSend(v75, "applicationContext");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = self->_arbiterActuationContext;
          v52 = (v80 & 1) == 0 && -[SBSwitcherController windowManagementStyle](self, "windowManagementStyle") != 2;
          -[SBSwitcherController _updateAppTransitionContext:withOrientationContext:accountForSceneState:primaryDelegate:](self, "_updateAppTransitionContext:withOrientationContext:accountForSceneState:primaryDelegate:", v50, v51, v52, v42);
        }
        else
        {
          v13 = v75;
          if (!v80)
            goto LABEL_64;
          objc_msgSend(v75, "applicationContext");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "isInLiveResize");

          if ((v54 & 1) != 0)
            goto LABEL_64;
          -[SBTraitsSceneParticipantDelegate scene](self->_primaryElementTraitsParticipantDelegate, "scene");
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v55)
            goto LABEL_64;
          v56 = -[SBSwitcherController interfaceOrientation](self, "interfaceOrientation");
          v57 = -[TRAParticipant sbf_currentOrientation](self->_traitsParticipant, "sbf_currentOrientation");
          if (v56 == v57)
            goto LABEL_64;
          v58 = v57;
          objc_msgSend(v75, "applicationContext");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:](SBAnimationUtilities, "animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:", v56, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setAnimationSettings:", v59);

        }
LABEL_64:
        *v78 = -[TRAParticipant sbf_currentOrientation](self->_traitsParticipant, "sbf_currentOrientation");
        v15 = v73;
        objc_msgSend(v73, "elements");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSwitcherController _orientationsForLayoutStateElements:withAssociatedParticipants:](self, "_orientationsForLayoutStateElements:withAssociatedParticipants:", v60, v40);
        *v79 = (id)objc_claimAutoreleasedReturnValue();

        SBLogTraitsArbiter();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "applicationContext");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "animationSettings");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "duration");
          *(_DWORD *)buf = 134217984;
          v85 = v64;
          _os_log_impl(&dword_1D0540000, v61, OS_LOG_TYPE_DEFAULT, "[SwitcherOrientation] animation duration set to %.2f", buf, 0xCu);

        }
        SBLogTraitsArbiter();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          BSInterfaceOrientationDescription();
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = *v79;
          *(_DWORD *)buf = 138543618;
          v85 = v66;
          v86 = 2114;
          v87 = v67;
          _os_log_impl(&dword_1D0540000, v65, OS_LOG_TYPE_DEFAULT, "[SwitcherOrientation] outSwitcherOrientation: %{public}@, outElementsOrientations: %{public}@", buf, 0x16u);

        }
        -[SBSwitcherController _noteLayoutStateEvaluationEndedWithParticipantsByElementIdentifiers:delegatesByParticipant:primaryDelegate:](self, "_noteLayoutStateEvaluationEndedWithParticipantsByElementIdentifiers:delegatesByParticipant:primaryDelegate:", v40, v41, v42);

        v14 = v74;
        goto LABEL_69;
      }
    }
    v32 = 1;
    goto LABEL_39;
  }
LABEL_69:

}

- (BOOL)_isUnderUILock
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "uiLockStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUILocked");

  return v4;
}

- (id)_orientationsForLayoutStateElements:(id)a3 withAssociatedParticipants:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  -[SBSwitcherController _elementsOrientationsForParticipantsByElementIdentifier:](self, "_elementsOrientationsForParticipantsByElementIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBSwitcherController _areLayoutStateElements:matchedWithAssociatedParticipants:](self, "_areLayoutStateElements:matchedWithAssociatedParticipants:", v7, v8);

  if (!v10)
  {
    v11 = objc_msgSend(v9, "count");
    if (v11 != objc_msgSend(v7, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherController.m"), 991, CFSTR("layout state elements and their interface orientations mapping are out of sync. [%@][%@]"), v7, v9);

    }
  }

  return v9;
}

- (BOOL)_areLayoutStateElements:(id)a3 matchedWithAssociatedParticipants:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  if (v7 == objc_msgSend(v5, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "uniqueIdentifier", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            v15 = 0;
            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }
    v15 = 1;
LABEL_13:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_noteLayoutStateEvaluationBegan
{
  ++self->_layoutStateEvaluationCounter;
  self->_evaluatingLayoutStateOrientation = 1;
}

- (id)_elementsOrientationsForParticipantsByElementIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKey:", v10, (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "currentOrientation"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v12, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)traitsParticipantForSceneHandle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "sceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherController _traitsParticipantForLayoutElementIdentifier:](self, "_traitsParticipantForLayoutElementIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_traitsParticipantForLayoutElementIdentifier:(id)a3
{
  return -[NSDictionary objectForKey:](self->_traitsParticipantsByElementIdentifier, "objectForKey:", a3);
}

- (id)_sceneHandleForLayoutElement:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_opt_class();
  objc_msgSend(v3, "workspaceEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  SBSafeCast(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  objc_msgSend(v6, "sceneHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)layoutStateSideElement
{
  void *v2;
  void *v3;

  -[SBSwitcherController layoutState](self, "layoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementWithRole:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_currentLayoutState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  -[SBFluidSwitcherGestureManager activeGestureTransaction](self->_gestureManager, "activeGestureTransaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workspaceTransitionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "displayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    objc_msgSend(v5, "applicationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SBSwitcherController layoutState](self, "layoutState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)isAnySwitcherVisible
{
  return -[SBSwitcherController isMainSwitcherVisible](self, "isMainSwitcherVisible")
      || -[SBSwitcherController isFloatingSwitcherVisible](self, "isFloatingSwitcherVisible");
}

- (BOOL)isMainSwitcherVisible
{
  void *v2;
  BOOL v3;

  -[SBSwitcherController layoutState](self, "layoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unlockedEnvironmentMode") == 2;

  return v3;
}

- (id)_currentFloatingAppLayout
{
  void *v2;
  void *v3;

  -[SBSwitcherController _currentLayoutState](self, "_currentLayoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_currentMainAppLayout
{
  void *v2;
  void *v3;

  -[SBSwitcherController _currentLayoutState](self, "_currentLayoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isFloatingSwitcherVisible
{
  void *v2;
  char v3;

  -[SBSwitcherController layoutState](self, "layoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFloatingSwitcherVisible");

  return v3;
}

- (id)participantAssociatedSceneIdentityTokens:(id)a3
{
  void *v3;
  void *v4;

  -[SBSwitcherController contentViewController](self, "contentViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "liveScenesIdentityTokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)coordinateSpaceForInterfaceOrientation:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SBSwitcherController switcherWindow](self, "switcherWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSceneLayoutCoordinateSpace coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:](SBSceneLayoutCoordinateSpace, "coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:", a3, v4, objc_msgSend(v4, "interfaceOrientation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)coordinateSpaceForLayoutElement:(id)a3 layoutState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[SBSwitcherController switcherWindow](self, "switcherWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "interfaceOrientationForLayoutElement:", v6);
  if (-[SBSwitcherController windowManagementStyle](self, "windowManagementStyle") == 2)
    v10 = objc_msgSend(v7, "interfaceOrientation");
  -[SBSwitcherController referenceFrameForInterfaceOrientation:layoutRole:appLayout:](self, "referenceFrameForInterfaceOrientation:layoutRole:appLayout:", v10, objc_msgSend(v6, "layoutRole"), v9);
  +[SBSceneLayoutCoordinateSpace coordinateSpaceForFrame:withinCoordinateSpace:](SBSceneLayoutCoordinateSpace, "coordinateSpaceForFrame:withinCoordinateSpace:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSceneLayoutCoordinateSpace coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:](SBSceneLayoutCoordinateSpace, "coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:", v10, v11, objc_msgSend(v8, "interfaceOrientation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_updateAppTransitionContext:(id)a3 withOrientationContext:(id)a4 accountForSceneState:(BOOL)a5 primaryDelegate:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  int v18;
  int v19;
  _BOOL4 v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v7 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[SBSwitcherController interfaceOrientation](self, "interfaceOrientation");
  v14 = -[TRAParticipant sbf_currentOrientation](self->_traitsParticipant, "sbf_currentOrientation");
  v15 = objc_msgSend(v12, "sceneCurrentOrientation");

  v16 = v15 == v14 && v7;
  v17 = objc_msgSend(v11, "preventTouchCancellation");
  v18 = objc_msgSend(v10, "animationDisabled");
  v19 = -[SBMainSwitcherWindow isHidden](self->_switcherWindow, "isHidden");
  v20 = -[SBSwitcherController _isUnderUILock](self, "_isUnderUILock");
  v21 = v20;
  if ((v18 & 1) != 0 || (v19 & 1) != 0 || v20 || v16)
  {
    v28 = v13;
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogTraitsArbiter();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      v30 = v18;
      v31 = 1024;
      v32 = v19;
      v33 = 1024;
      v34 = v21;
      v35 = 1024;
      v36 = v16;
      _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "[SwitcherOrientation] animation duration set to zero. animationDisabled{%{BOOL}u}, isWindowHidden{%{BOOL}u}, isWindowHidden{%{BOOL}u}, isSceneInFinalStateAlready{%{BOOL}u}", buf, 0x1Au);
    }

    v13 = v28;
  }
  else
  {
    +[SBAnimationUtilities animationSettingsForRotationFromOrientation:toOrientation:withContext:](SBAnimationUtilities, "animationSettingsForRotationFromOrientation:toOrientation:withContext:", v13, v14, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "setInterfaceOrientation:", v14);
  objc_msgSend(v10, "setAnimationSettings:", v22);
  objc_msgSend(v10, "setPrefersTouchCancellationDisabled:", v17);
  objc_msgSend(v11, "drawingFence");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnimationFence:", v24);

  objc_msgSend(v11, "drawingFence");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    v26 = 0;
  else
    v26 = v13 == v14;
  v27 = !v26;
  objc_msgSend(v10, "setFencesAnimations:", v27);

}

- (id)participantAssociatedWindows:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[SBSwitcherController switcherWindow](self, "switcherWindow", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateContentViewInterfaceOrientation:(int64_t)a3
{
  -[SBSwitcherViewController setContentOrientation:](self->_switcherViewController, "setContentOrientation:");
  -[SBSwitcherContentViewControlling setContentOrientation:](self->_contentViewController, "setContentOrientation:", a3);
}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  BSInvalidatable *displayLayoutElementAssertion;
  id WeakRetained;
  BSInvalidatable *v7;
  BSInvalidatable *v8;
  BSInvalidatable *v9;
  void *v10;
  void *v11;
  void *v12;

  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  if (a3)
  {
    if (!displayLayoutElementAssertion)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
      if (!WeakRetained)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherController.m"), 2132, CFSTR("No window scene to get a publisher: %@"), self);

      }
      objc_msgSend(WeakRetained, "displayLayoutPublisher");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherController.m"), 2132, CFSTR("No publisher for window scene: %@; self: %@"),
          WeakRetained,
          self);

      }
      objc_msgSend(v12, "addElement:", self->_displayLayoutElement);
      v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_displayLayoutElementAssertion;
      self->_displayLayoutElementAssertion = v7;

    }
  }
  else if (displayLayoutElementAssertion)
  {
    -[BSInvalidatable invalidate](displayLayoutElementAssertion, "invalidate");
    v9 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

  }
}

- (void)_updateDisplayLayoutElementForLayoutState:(id)a3
{
  _QWORD v4[5];

  if (objc_msgSend(a3, "unlockedEnvironmentMode") == 2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __66__SBSwitcherController__updateDisplayLayoutElementForLayoutState___block_invoke;
    v4[3] = &unk_1E8EAD748;
    v4[4] = self;
    -[SBSwitcherController updateDisplayLayoutElementWithBuilder:](self, "updateDisplayLayoutElementWithBuilder:", v4);
    -[SBSwitcherController setDisplayLayoutElementActive:](self, "setDisplayLayoutElementActive:", 1);
  }
  else
  {
    -[SBSwitcherController setDisplayLayoutElementActive:](self, "setDisplayLayoutElementActive:", 0);
  }
}

- (id)layoutElementSizingPoliciesForLayoutState:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  SBDisplayItemLayoutAttributesCalculator *displayItemFrameCalculator;
  id WeakRetained;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  uint64_t v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "elements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v5);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v3, "interfaceOrientation");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v3, "elements");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v6)
    {
      v7 = v6;
      v21 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v3, "layoutAttributesForElement:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[SBDisplayItem displayItemForLayoutElement:](SBDisplayItem, "displayItemForLayoutElement:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "sizingPolicy");
          v13 = objc_msgSend(v3, "interfaceOrientationForLayoutElement:", v9);
          displayItemFrameCalculator = self->_displayItemFrameCalculator;
          WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
          v16 = -[SBDisplayItemLayoutAttributesCalculator sizingPolicyForDisplayItem:contentOrientation:containerOrientation:proposedSizingPolicy:windowScene:](displayItemFrameCalculator, "sizingPolicyForDisplayItem:contentOrientation:containerOrientation:proposedSizingPolicy:windowScene:", v11, v13, v22, v12, WeakRetained);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "uniqueIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setValue:forKey:", v17, v18);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v7);
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

uint64_t __64__SBSwitcherController_didChangeSettingsForParticipant_context___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_10;
  v3 = *(id *)(a1 + 32);
  if (v3 == WeakRetained[14])
  {
    if ((objc_msgSend(WeakRetained[32], "isHidden") & 1) != 0)
    {
LABEL_10:
      v9 = 0;
      goto LABEL_16;
    }
    v3 = *(id *)(a1 + 32);
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 != objc_msgSend(v3, "sbf_currentOrientation"))
    goto LABEL_10;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v10 = v8;

  if (*(id *)(a1 + 32) == WeakRetained[14])
  {
    v11 = *(_QWORD *)(a1 + 48);
    v9 = v11 != objc_msgSend(WeakRetained, "interfaceOrientation");
  }
  else
  {
    v9 = objc_msgSend(v10, "needsActuationForUpdateReasons:", 2);
  }

LABEL_16:
  return v9;
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  TRAParticipant *v6;
  id v7;
  void *v8;
  TRASettingsActuationContext *v9;
  TRASettingsActuationContext *arbiterActuationContext;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  TRAParticipant *v16;
  id v17[2];
  id location;

  v6 = (TRAParticipant *)a3;
  v7 = a4;
  if (self->_publisherTraitsParticipant != v6)
  {
    v8 = -[TRAParticipant sbf_currentOrientation](v6, "sbf_currentOrientation");
    if (v8 != (void *)-[SBSwitcherController interfaceOrientation](self, "interfaceOrientation"))
    {
      objc_msgSend(v7, "orientationActuationContext");
      v9 = (TRASettingsActuationContext *)objc_claimAutoreleasedReturnValue();
      arbiterActuationContext = self->_arbiterActuationContext;
      self->_arbiterActuationContext = v9;

      objc_initWeak(&location, self);
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __64__SBSwitcherController_didChangeSettingsForParticipant_context___block_invoke;
      v15 = &unk_1E8EAD4A8;
      objc_copyWeak(v17, &location);
      v16 = v6;
      v17[1] = v8;
      v11 = (void *)MEMORY[0x1D17E5550](&v12);
      -[SBSwitcherController _enqueueOrientationTransitionWithActuationContext:suggestedAnimator:completionTask:validator:label:](self, "_enqueueOrientationTransitionWithActuationContext:suggestedAnimator:completionTask:validator:label:", self->_arbiterActuationContext, 0, 0, v11, CFSTR("SBSwitcherControllerEventLabelSwitcherParticipantUpdate"), v12, v13, v14, v15);

      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
    }
  }

}

- (void)_enqueueOrientationTransitionWithActuationContext:(id)a3 suggestedAnimator:(id)a4 completionTask:(id)a5 validator:(id)a6 label:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  SBLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v15;
    _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "[SwitcherOrientation] Enqueued event %@.", buf, 0xCu);
  }

  -[SBSwitcherController windowScene](self, "windowScene");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_sbDisplayConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "createRequestWithOptions:displayConfiguration:", 0, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setSource:", 14);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%ld"), v15, _enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label__eventLabelGeneration);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setEventLabel:", v21);

  ++_enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label__eventLabelGeneration;
  v22 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __123__SBSwitcherController__enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label___block_invoke;
  v35[3] = &unk_1E8EAD4F8;
  v23 = v12;
  v36 = v23;
  objc_msgSend(v20, "setTransactionProvider:", v35);
  if (v13)
  {
    v33[0] = v22;
    v33[1] = 3221225472;
    v33[2] = __123__SBSwitcherController__enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label___block_invoke_2;
    v33[3] = &unk_1E8E9F1C0;
    v34 = v13;
    v24 = (id)objc_msgSend(v20, "addCompletionHandler:", v33);

  }
  objc_initWeak((id *)buf, self);
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v22;
  v29[1] = 3221225472;
  v29[2] = __123__SBSwitcherController__enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label___block_invoke_3;
  v29[3] = &unk_1E8EAB418;
  objc_copyWeak(&v32, (id *)buf);
  v26 = v14;
  v31 = v26;
  v27 = v28;
  v30 = v27;
  objc_msgSend(v25, "executeTransitionRequest:withValidator:", v20, v29);

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);

}

- (int64_t)interfaceOrientation
{
  return -[SBSwitcherContentViewControlling contentOrientation](self->_contentViewController, "contentOrientation");
}

- (SBSwitcherController)initWithWindowScene:(id)a3 debugName:(id)a4
{
  id v6;
  id v7;
  SBSwitcherController *v8;
  SBSwitcherController *v9;
  void *v10;
  uint64_t v11;
  SBAppSwitcherDefaults *defaults;
  uint64_t v13;
  SBAppSwitcherSettings *settings;
  SBSwitcherViewController *v15;
  SBSwitcherViewController *switcherViewController;
  SBDisplayItemLayoutAttributesCalculator *v17;
  SBDisplayItemLayoutAttributesCalculator *displayItemFrameCalculator;
  id v19;
  SBAttentionAwarenessClient *v20;
  SBAttentionAwarenessClient *idleTouchAwarenessClient;
  void *v22;
  id v23;
  uint64_t v24;
  SBSDisplayLayoutElement *displayLayoutElement;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  BSInvalidatable *modalUIFluidDismissalObserverInvalidatable;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  BSInvalidatable *stateCaptureInvalidatable;
  void *v39;
  id v41;
  id location;
  objc_super v43;

  v6 = a3;
  v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)SBSwitcherController;
  v8 = -[SBSwitcherController init](&v43, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_windowScene, v6);
    objc_storeStrong((id *)&v9->_debugName, a4);
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appSwitcherDefaults");
    v11 = objc_claimAutoreleasedReturnValue();
    defaults = v9->_defaults;
    v9->_defaults = (SBAppSwitcherDefaults *)v11;

    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v13 = objc_claimAutoreleasedReturnValue();
    settings = v9->_settings;
    v9->_settings = (SBAppSwitcherSettings *)v13;

    -[PTSettings addKeyObserver:](v9->_settings, "addKeyObserver:", v9);
    v9->_medusaMultitaskingEnabled = -[SBAppSwitcherDefaults medusaMultitaskingEnabled](v9->_defaults, "medusaMultitaskingEnabled");
    v9->_chamoisMultitaskingEnabled = -[SBAppSwitcherDefaults chamoisWindowingEnabled](v9->_defaults, "chamoisWindowingEnabled");
    v15 = -[SBSwitcherViewController initWithNibName:bundle:]([SBSwitcherViewController alloc], "initWithNibName:bundle:", 0, 0);
    switcherViewController = v9->_switcherViewController;
    v9->_switcherViewController = v15;

    -[SBSwitcherViewController setDelegate:](v9->_switcherViewController, "setDelegate:", v9);
    v17 = objc_alloc_init(SBDisplayItemLayoutAttributesCalculator);
    displayItemFrameCalculator = v9->_displayItemFrameCalculator;
    v9->_displayItemFrameCalculator = v17;

    if (objc_msgSend(v6, "isMainDisplayWindowScene")
      && (objc_msgSend(v6, "isExternalDisplayWindowScene") & 1) == 0)
    {
      v19 = objc_alloc_init(MEMORY[0x1E0CFEC08]);
      objc_msgSend(v19, "setIdentifier:", CFSTR("com.apple.SpringBoard.SBSwitcherController"));
      objc_msgSend(v19, "setEventMask:", 4095);
      objc_msgSend(v19, "setAttentionLostTimeout:", 2.0);
      v20 = objc_alloc_init(SBAttentionAwarenessClient);
      idleTouchAwarenessClient = v9->_idleTouchAwarenessClient;
      v9->_idleTouchAwarenessClient = v20;

      -[SBAttentionAwarenessClient setConfiguration:](v9->_idleTouchAwarenessClient, "setConfiguration:", v19);
      -[SBAttentionAwarenessClient setDelegate:](v9->_idleTouchAwarenessClient, "setDelegate:", v9);

    }
    objc_msgSend(v6, "layoutStateTransitionCoordinator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSceneEntityFrameProvider:", v9);
    objc_msgSend(v22, "addObserver:", v9);
    v23 = objc_alloc(MEMORY[0x1E0DAAE30]);
    v24 = objc_msgSend(v23, "initWithIdentifier:", *MEMORY[0x1E0DAB658]);
    displayLayoutElement = v9->_displayLayoutElement;
    v9->_displayLayoutElement = (SBSDisplayLayoutElement *)v24;

    -[SBSDisplayLayoutElement setLayoutRole:](v9->_displayLayoutElement, "setLayoutRole:", 1);
    -[SBSDisplayLayoutElement setLevel:](v9->_displayLayoutElement, "setLevel:", 1);
    objc_msgSend(v6, "modalUIFluidDismissGestureManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%@-%@"), v29, v9->_debugName);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:forReason:", v9, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    modalUIFluidDismissalObserverInvalidatable = v9->_modalUIFluidDismissalObserverInvalidatable;
    v9->_modalUIFluidDismissalObserverInvalidatable = (BSInvalidatable *)v31;

    v33 = (void *)MEMORY[0x1E0CB3940];
    -[SBSwitcherController stateCaptureTitlePreamble](v9, "stateCaptureTitlePreamble");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("%@ - SBSwitcherController"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, v9);
    v36 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v41, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v37 = objc_claimAutoreleasedReturnValue();
    stateCaptureInvalidatable = v9->_stateCaptureInvalidatable;
    v9->_stateCaptureInvalidatable = (BSInvalidatable *)v37;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObserver:selector:name:object:", v9, sel__updateContentViewControllerIfNeeded, *MEMORY[0x1E0CEB090], 0);
    objc_msgSend(v39, "addObserver:selector:name:object:", v9, sel__windowSceneCanvasSizeDidChange_, CFSTR("SBWindowSceneSessionRoleExternalDisplay"), v6);
    objc_msgSend(v39, "addObserver:selector:name:object:", v9, sel__workspaceMedusaCapabilityChanged_, CFSTR("SBWorkspaceMedusaCapabilityChangedNotification"), 0);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);

  }
  return v9;
}

id __54__SBSwitcherController_initWithWindowScene_debugName___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_orientationStateDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_orientationStateDescription
{
  TRAParticipant *traitsParticipant;
  void *v4;
  uint64_t v5;
  void *v6;
  NSDictionary *traitsParticipantsByElementIdentifier;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  _QWORD v18[6];
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  traitsParticipant = self->_traitsParticipant;
  if (!traitsParticipant)
    return CFSTR("waiting to be shown at least once");
  v18[0] = CFSTR("Switcher participant orientation");
  -[TRAParticipant currentOrientation](traitsParticipant, "currentOrientation");
  SBFStringForBSInterfaceOrientation();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  v18[1] = CFSTR("Switcher orientation");
  -[SBSwitcherController interfaceOrientation](self, "interfaceOrientation");
  SBFStringForBSInterfaceOrientation();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_traitsParticipantsByElementIdentifier)
    traitsParticipantsByElementIdentifier = self->_traitsParticipantsByElementIdentifier;
  else
    traitsParticipantsByElementIdentifier = (NSDictionary *)CFSTR("None");
  v19[1] = v5;
  v19[2] = traitsParticipantsByElementIdentifier;
  v18[2] = CFSTR("Layout elements participants");
  v18[3] = CFSTR("Participants orientations");
  -[SBSwitcherController _elementsOrientationsForParticipantsByElementIdentifier:](self, "_elementsOrientationsForParticipantsByElementIdentifier:");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("None");
  v19[3] = v10;
  v18[4] = CFSTR("[Layout state] interface orientation");
  -[SBSwitcherController layoutState](self, "layoutState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "interfaceOrientation");
  SBFStringForBSInterfaceOrientation();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v18[5] = CFSTR("Needs Orientation Reevaluation");
  if (self->_needsOrientationReevaluation)
    v14 = CFSTR("Yes");
  else
    v14 = CFSTR("No");
  v19[4] = v12;
  v19[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  void *v5;
  BSInvalidatable *suppressHidingProtectedAppsAssertion;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PTSettings removeKeyObserver:](self->_settings, "removeKeyObserver:", self);
  -[BSInvalidatable invalidate](self->_modalUIFluidDismissalObserverInvalidatable, "invalidate");
  -[TRAParticipant invalidate](self->_publisherTraitsParticipant, "invalidate");
  -[TRAParticipant invalidate](self->_traitsParticipant, "invalidate");
  -[SBSwitcherController _invalidateLayoutElementsTraitsParticipants](self, "_invalidateLayoutElementsTraitsParticipants");
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "layoutStateTransitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSceneEntityFrameProvider:", 0);
  objc_msgSend(v5, "removeObserver:", self);
  -[BSInvalidatable invalidate](self->_stateCaptureInvalidatable, "invalidate");
  -[BSAbsoluteMachTimer invalidate](self->_medusaBannerPresentTimer, "invalidate");
  -[BSAbsoluteMachTimer invalidate](self->_medusaBannerDismissTimer, "invalidate");
  -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 0);
  -[SBAttentionAwarenessClient setDelegate:](self->_idleTouchAwarenessClient, "setDelegate:", 0);
  -[SBAttentionAwarenessClient invalidate](self->_idleTouchAwarenessClient, "invalidate");
  -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_suppressHidingProtectedAppsAssertion, "invalidate");
  suppressHidingProtectedAppsAssertion = self->_suppressHidingProtectedAppsAssertion;
  self->_suppressHidingProtectedAppsAssertion = 0;

  v7.receiver = self;
  v7.super_class = (Class)SBSwitcherController;
  -[SBSwitcherController dealloc](&v7, sel_dealloc);
}

- (void)willBeginCoordinationWithCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBAppSwitcherDefaults *defaults;
  id v9;
  BSDefaultObserver *v10;
  BSDefaultObserver *multitaskingEnablementObserver;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_storeWeak((id *)&self->_switcherCoordinator, v4);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "medusaMultitaskingEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisWindowingEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  defaults = self->_defaults;
  v9 = MEMORY[0x1E0C80D38];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__SBSwitcherController_willBeginCoordinationWithCoordinator___block_invoke;
  v12[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v13, &location);
  -[SBAppSwitcherDefaults observeDefaults:onQueue:withBlock:](defaults, "observeDefaults:onQueue:withBlock:", v7, MEMORY[0x1E0C80D38], v12);
  v10 = (BSDefaultObserver *)objc_claimAutoreleasedReturnValue();
  multitaskingEnablementObserver = self->_multitaskingEnablementObserver;
  self->_multitaskingEnablementObserver = v10;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __61__SBSwitcherController_willBeginCoordinationWithCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleMultitaskingEnablementChange");

}

- (void)willEndCoordinationWithCoordinator:(id)a3
{
  BSDefaultObserver *multitaskingEnablementObserver;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[BSDefaultObserver invalidate](self->_multitaskingEnablementObserver, "invalidate", a3);
  multitaskingEnablementObserver = self->_multitaskingEnablementObserver;
  self->_multitaskingEnablementObserver = 0;

  -[SBSwitcherController contentViewController](self, "contentViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");
  objc_msgSend(v9, "willMoveToParentViewController:", 0);
  objc_msgSend(v9, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[SBSwitcherController switcherViewController](self, "switcherViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeChildViewController:", v9);
  objc_msgSend(v9, "didMoveToParentViewController:", 0);
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 1);
  objc_msgSend(v6, "willMoveToParentViewController:", 0);
  objc_msgSend(v7, "removeFromSuperview");
  objc_msgSend(v8, "setRootViewController:", 0);
  objc_msgSend(v6, "didMoveToParentViewController:", 0);

}

- (void)didEndCoordinationWithCoordinator:(id)a3
{
  self->_needsOrientationReevaluation = 0;
  -[BSInvalidatable invalidate](self->_modalUIFluidDismissalObserverInvalidatable, "invalidate", a3);
}

- (BOOL)isChamoisMultitaskingEnabled
{
  int v3;
  id WeakRetained;
  char v5;

  v3 = SBFIsChamoisWindowingUIAvailable();
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    v5 = objc_msgSend(WeakRetained, "isExternalDisplayWindowScene");

    LOBYTE(v3) = (v5 & 1) != 0 || self->_chamoisMultitaskingEnabled;
  }
  return v3;
}

- (void)setChamoisMultitaskingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_chamoisMultitaskingEnabled != a3)
  {
    v3 = a3;
    -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "switcherControllerWillUpdateWindowManagementStyle:", self);
    self->_chamoisMultitaskingEnabled = v3;
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appSwitcherDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setChamoisWindowingEnabled:", v3);

    objc_msgSend(v7, "switcherControllerDidUpdateWindowManagementStyle:", self);
    -[SBFluidSwitcherGestureManager updateForWindowManagementStyle:](self->_gestureManager, "updateForWindowManagementStyle:", -[SBSwitcherController windowManagementStyle](self, "windowManagementStyle"));

  }
}

- (void)setMedusaMultitaskingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_medusaMultitaskingEnabled != a3)
  {
    v3 = a3;
    -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "switcherControllerWillUpdateWindowManagementStyle:", self);
    self->_medusaMultitaskingEnabled = v3;
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appSwitcherDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMedusaMultitaskingEnabled:", v3);

    objc_msgSend(v7, "switcherControllerDidUpdateWindowManagementStyle:", self);
    -[SBFluidSwitcherGestureManager updateForWindowManagementStyle:](self->_gestureManager, "updateForWindowManagementStyle:", -[SBSwitcherController windowManagementStyle](self, "windowManagementStyle"));

  }
}

- (void)_handleMultitaskingEnablementChange
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  char v19;
  _QWORD v20[4];
  id v21[2];
  _QWORD v22[5];
  id location;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = -[SBAppSwitcherDefaults chamoisWindowingEnabled](self->_defaults, "chamoisWindowingEnabled");
  v4 = -[SBAppSwitcherDefaults medusaMultitaskingEnabled](self->_defaults, "medusaMultitaskingEnabled");
  -[SBSwitcherController setChamoisMultitaskingEnabled:](self, "setChamoisMultitaskingEnabled:", v3);
  -[SBSwitcherController setMedusaMultitaskingEnabled:](self, "setMedusaMultitaskingEnabled:", v4);
  v5 = -[SBSwitcherController windowManagementStyle](self, "windowManagementStyle");
  -[SBSwitcherContentViewControlling noteWindowManagementStyleDidChange](self->_contentViewController, "noteWindowManagementStyleDidChange");
  -[SBSwitcherController layoutState](self, "layoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unlockedEnvironmentMode");

  v8 = MEMORY[0x1E0C809B0];
  if (v7 == 3)
  {
    objc_initWeak(&location, self);
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke;
    v22[3] = &__block_descriptor_40_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
    v22[4] = v5;
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_2;
    v20[3] = &unk_1E8EAD418;
    objc_copyWeak(v21, &location);
    v21[1] = v5;
    objc_msgSend(v9, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v11, v22, v20);

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
  v24 = *MEMORY[0x1E0DABED0];
  v25[0] = &unk_1E91D0C98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DA9D78];
  v14 = v12;
  objc_msgSend(v13, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "emitEvent:withPayload:", 60, v14);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:", CFSTR("SBSwitcherControllerWindowManagementStyleDidChangeNotification"), self);

  dispatch_get_global_queue(-32768, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_79;
  v18[3] = &__block_descriptor_33_e5_v8__0l;
  v19 = v3;
  dispatch_async(v17, v18);

}

void __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 64);
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSwitcherWindowManagementStyle(*(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("WindowManagementStyleChangedTo%@"), v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventLabel:", v5);

}

uint64_t __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[6];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && (v6 = objc_msgSend(WeakRetained, "windowManagementStyle"), v6 == *(_QWORD *)(a1 + 40)))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_3;
    v9[3] = &unk_1E8EAAE50;
    v9[4] = v5;
    v9[5] = v6;
    objc_msgSend(v3, "modifyApplicationContext:", v9);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  switch(v5)
  {
    case 0:
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_3_75;
      v11[3] = &unk_1E8EA2880;
      v12 = v3;
      SBLayoutRoleEnumerateValidRoles(v11);
      v10 = v12;
LABEL_11:

      break;
    case 1:
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_2_73;
      v13[3] = &unk_1E8EA2880;
      v14 = v3;
      SBLayoutRoleEnumerateValidRoles(v13);
      v10 = v14;
      goto LABEL_11;
    case 2:
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v26 = 0;
      v27 = &v26;
      v28 = 0x3032000000;
      v29 = __Block_byref_object_copy__48;
      v30 = __Block_byref_object_dispose__48;
      v31 = 0;
      v20 = 0;
      v21 = &v20;
      v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__48;
      v24 = __Block_byref_object_dispose__48;
      v25 = 0;
      objc_msgSend(*(id *)(a1 + 32), "layoutState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_71;
      v15[3] = &unk_1E8EAD3F0;
      v8 = v7;
      v16 = v8;
      v9 = v6;
      v17 = v9;
      v18 = &v26;
      v19 = &v20;
      SBLayoutRoleEnumerateValidRoles(v15);
      objc_msgSend(v4, "setEntities:withPolicy:centerEntity:floatingEntity:", v9, 0, 0, 0);
      if (v27[5])
        objc_msgSend(v4, "_setRequestedFrontmostEntity:");
      if (v21[5])
        objc_msgSend(v4, "_setRequestedFrontmostEntity:");

      _Block_object_dispose(&v20, 8);
      _Block_object_dispose(&v26, 8);

      break;
  }

}

void __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_71(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "elementWithRole:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workspaceEntity");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v5 = obj;
  if (obj)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
    v5 = obj;
  }
  if (a2 == 4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
    v5 = obj;
  }
  if (a2 == 3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), obj);
    v5 = obj;
  }

}

void __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_2_73(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2 >= 5)
  {
    v3 = *(void **)(a1 + 32);
    +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEntity:forLayoutRole:", v4, a2);

  }
}

void __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_3_75(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2 >= 2)
  {
    v3 = *(void **)(a1 + 32);
    +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEntity:forLayoutRole:", v4, a2);

  }
}

void __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_79(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D02310]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithStarting:", v3);

  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SpringBoard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "WindowManagement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "StageManagerMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendEvent:", v4);
  SBLogBiome();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(unsigned __int8 *)(a1 + 32);
    v12[0] = 67109120;
    v12[1] = v11;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Donate stage manager enabled: %{BOOL}u", (uint8_t *)v12, 8u);
  }

}

- (id)_debugEventNameWithEventName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), a3, self->_debugName);
}

- (NSString)activateSwitcherEventName
{
  return (NSString *)-[SBSwitcherController _debugEventNameWithEventName:](self, "_debugEventNameWithEventName:", CFSTR("ActivateSwitcherNoninteractive"));
}

- (NSString)dismissSwitcherEventName
{
  return (NSString *)-[SBSwitcherController _debugEventNameWithEventName:](self, "_debugEventNameWithEventName:", CFSTR("DismissSwitcherNoninteractive"));
}

- (NSString)toggleSwitcherEventName
{
  return (NSString *)-[SBSwitcherController _debugEventNameWithEventName:](self, "_debugEventNameWithEventName:", CFSTR("ToggleSwitcherNoninteractive"));
}

- (void)_setupSwitcherTraitsParticipantAndPolicySpecifiers
{
  id WeakRetained;
  TRAParticipant *v4;
  TRAParticipant *traitsParticipant;
  TRAParticipant *v6;
  TRAParticipant *publisherTraitsParticipant;
  SBSwitcherTraitsAssistant *v8;
  SBSwitcherTraitsAssistant *traitsAssistant;
  void *v11;
  id v12;

  if (!self->_traitsParticipant
    || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherController.m"), 692, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_traitsParticipant == nil")), v11, !self->_traitsParticipant))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "traitsArbiter");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleSwitcherRaw"), self);
    v4 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
    traitsParticipant = self->_traitsParticipant;
    self->_traitsParticipant = v4;

    -[TRAParticipant setNeedsUpdatePreferencesWithReason:](self->_traitsParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("setup"));
    objc_msgSend(v12, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleSwitcherPublisher"), self);
    v6 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
    publisherTraitsParticipant = self->_publisherTraitsParticipant;
    self->_publisherTraitsParticipant = v6;

    v8 = -[SBSwitcherTraitsAssistant initWithTraitsArbiter:switcherParticipant:delegate:]([SBSwitcherTraitsAssistant alloc], "initWithTraitsArbiter:switcherParticipant:delegate:", v12, self->_traitsParticipant, self);
    traitsAssistant = self->_traitsAssistant;
    self->_traitsAssistant = v8;

  }
}

- (void)_invalidateLayoutElementsTraitsParticipants
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SBTraitsSceneParticipantDelegate *primaryElementTraitsParticipantDelegate;
  NSDictionary *traitsParticipantsByElementIdentifier;
  NSDictionary *traitsDelegateByParticipant;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSDictionary allValues](self->_traitsParticipantsByElementIdentifier, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSDictionary allValues](self->_traitsDelegateByParticipant, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12++), "invalidate");
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v10);
  }

  primaryElementTraitsParticipantDelegate = self->_primaryElementTraitsParticipantDelegate;
  self->_primaryElementTraitsParticipantDelegate = 0;

  traitsParticipantsByElementIdentifier = self->_traitsParticipantsByElementIdentifier;
  self->_traitsParticipantsByElementIdentifier = 0;

  traitsDelegateByParticipant = self->_traitsDelegateByParticipant;
  self->_traitsDelegateByParticipant = 0;

}

- (id)stateCaptureTitlePreamble
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "_sbDisplayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SpringBoard - SwitcherController - %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)traitsPipelineManager
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "traitsPipelineManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isOnExtendedDisplay
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v3 = objc_msgSend(WeakRetained, "isExtendedDisplayWindowScene");

  return v3;
}

- (double)contentContainerAspectRatio
{
  void *v2;
  double v3;
  double v4;

  -[SBSwitcherController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentAspectRatio");
  v4 = v3;

  return v4;
}

- (id)currentElementsParticipants
{
  return -[NSDictionary allKeys](self->_traitsDelegateByParticipant, "allKeys");
}

- (id)sceneHandleForTraitsParticipant:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class();
  -[NSDictionary objectForKey:](self->_traitsDelegateByParticipant, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sceneHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)actuateOrientationForTraitsDelegate:(id)a3 withContext:(id)a4 reasons:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a4;
  v9 = a3;
  -[SBSwitcherController _liveOverlayForTraitsDelegate:](self, "_liveOverlayForTraitsDelegate:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prepareOverlayForContentRotation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherController updateOrientationForTraitsDelegate:withUpdateReasons:suggestedAnimator:actuationContext:](self, "updateOrientationForTraitsDelegate:withUpdateReasons:suggestedAnimator:actuationContext:", v9, a5, v10, v8);

}

uint64_t __64__SBSwitcherController_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredZOrderLevel:", *MEMORY[0x1E0CEBE28] + 5.0);
}

uint64_t __64__SBSwitcherController_updatePreferencesForParticipant_updater___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredZOrderLevel:", *MEMORY[0x1E0CEBE28] + 5.0 + 0.01);
}

- (void)updateOrientationForTraitsDelegate:(id)a3 withUpdateReasons:(int64_t)a4 suggestedAnimator:(id)a5 actuationContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18[3];
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (a4 != 4)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v10, "participant");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "currentOrientation");

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __112__SBSwitcherController_updateOrientationForTraitsDelegate_withUpdateReasons_suggestedAnimator_actuationContext___block_invoke;
    v16[3] = &unk_1E8EAD4D0;
    objc_copyWeak(v18, &location);
    v18[1] = v14;
    v17 = v10;
    v18[2] = (id)a4;
    v15 = (void *)MEMORY[0x1D17E5550](v16);
    -[SBSwitcherController _enqueueOrientationTransitionWithActuationContext:suggestedAnimator:completionTask:validator:label:](self, "_enqueueOrientationTransitionWithActuationContext:suggestedAnimator:completionTask:validator:label:", v12, v11, 0, v15, CFSTR("SBSwitcherControllerEventLabelLiveOverlayParticipantUpdate"));

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }

}

uint64_t __112__SBSwitcherController_updateOrientationForTraitsDelegate_withUpdateReasons_suggestedAnimator_actuationContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained
    && !*((_BYTE *)WeakRetained + 177)
    && (v4 = *(_QWORD *)(a1 + 48),
        objc_msgSend(*(id *)(a1 + 32), "participant"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "currentOrientation"),
        v5,
        v4 == v6))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "needsActuationForUpdateReasons:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

SBRotateScenesWorkspaceTransaction *__123__SBSwitcherController__enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SBRotateScenesWorkspaceTransaction *v4;

  v3 = a2;
  v4 = -[SBAppToAppWorkspaceTransaction initWithTransitionRequest:]([SBRotateScenesWorkspaceTransaction alloc], "initWithTransitionRequest:", v3);

  -[SBWorkspaceTransaction setSuggestedAnimationController:](v4, "setSuggestedAnimationController:", *(_QWORD *)(a1 + 32));
  return v4;
}

uint64_t __123__SBSwitcherController__enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __84__SBSwitcherController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke;
  v21[3] = &unk_1E8E9E270;
  v21[4] = self;
  v17 = v8;
  v22 = v17;
  v12 = v9;
  v23 = v12;
  objc_msgSend(v12, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Associated Windows"), v10, v21);
  -[SBSwitcherController participantAssociatedSceneIdentityTokens:](self, "participantAssociatedSceneIdentityTokens:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "bs_map:", &__block_literal_global_121);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __84__SBSwitcherController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke_3;
    v18[3] = &unk_1E8E9E820;
    v19 = v12;
    v20 = v15;
    v16 = v15;
    objc_msgSend(v19, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Associated Scenes"), v10, v18);

  }
}

void __84__SBSwitcherController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "participantAssociatedWindows:", *(_QWORD *)(a1 + 40));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v1)
  {
    v2 = v1;
    v15 = *(_QWORD *)v18;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v3);
        v5 = *(void **)(a1 + 48);
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_debugName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isHidden"))
          v10 = CFSTR("NO");
        else
          v10 = CFSTR("YES");
        objc_msgSend(v4, "interfaceOrientation");
        BSInterfaceOrientationDescription();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "rootViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p; %@>; Visible:%@; Orientation:%@; Root VC: %@"),
          v8,
          v4,
          v9,
          v10,
          v11,
          v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:withName:", v13, 0);

        ++v3;
      }
      while (v2 != v3);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v2);
  }

}

uint64_t __84__SBSwitcherController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringRepresentation");
}

uint64_t __84__SBSwitcherController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(a1 + 40), CFSTR("Associated Scene Tokens"), 0);
}

- (void)_updateAppTransitionContext:(id)a3 withOrientationActuationContext:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[SBSwitcherController _updateAppTransitionContext:withOrientationContext:accountForSceneState:primaryDelegate:](self, "_updateAppTransitionContext:withOrientationContext:accountForSceneState:primaryDelegate:", v7, v6, -[SBSwitcherController windowManagementStyle](self, "windowManagementStyle") != 2, self->_primaryElementTraitsParticipantDelegate);

}

- (int64_t)interfaceOrientationForLayoutElement:(id)a3
{
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBSwitcherController _interfaceOrientationForLayoutElementIdentifier:](self, "_interfaceOrientationForLayoutElementIdentifier:", v4);

  return v5;
}

- (id)_liveOverlayForTraitsDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SBSwitcherController contentViewController](self, "contentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identityToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "liveOverlayForSceneIdentityToken:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v6)
    {
      v9 = 0;
      goto LABEL_6;
    }
    -[SBSwitcherController contentViewController](self, "contentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "liveOverlayForSceneHandle:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return v9;
}

- (void)_attemptContentViewInterfaceOrientationUpdateForPanGesture:(int64_t)a3
{
  void *v3;
  int v6;
  char v7;
  SBSwitcherContentViewControlling *contentViewController;
  uint64_t v9;
  SBSwitcherContentViewControlling *v10;
  SBSwitcherContentViewControlling *v11;
  SBSwitcherContentViewControlling *v12;
  uint64_t v13;

  -[SBSwitcherController switcherSupportedInterfaceOrientations](self, "switcherSupportedInterfaceOrientations");
  if (SBFInterfaceOrientationMaskContainsInterfaceOrientation())
  {
    self->_panGestureRecognizerRequestedOrientation = a3;
    v6 = __sb__runningInSpringBoard();
    v7 = v6;
    if (v6)
    {
      if (SBFEffectiveDeviceClass() == 2)
        goto LABEL_16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
      {

LABEL_16:
        -[TRAParticipant setNeedsUpdatePreferencesWithReason:animate:](self->_traitsParticipant, "setNeedsUpdatePreferencesWithReason:animate:", CFSTR("pan gesture recognizer"), 0);
LABEL_17:
        -[SBSwitcherController _updateContentViewInterfaceOrientation:](self, "_updateContentViewInterfaceOrientation:", a3);
        return;
      }
    }
    contentViewController = self->_contentViewController;
    v9 = objc_opt_class();
    v10 = contentViewController;
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    v13 = -[SBSwitcherContentViewControlling homeAffordanceOrientationIfMismatchedFromCurrentLayoutState](v12, "homeAffordanceOrientationIfMismatchedFromCurrentLayoutState");
    if ((v7 & 1) == 0)

    if (v13)
      goto LABEL_17;
    goto LABEL_16;
  }
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;

  v6 = a4;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  LOBYTE(a3) = objc_msgSend(v7, "canPerformKeyboardShortcutAction:forBundleIdentifier:windowScene:", a3, v6, WeakRetained);

  return a3;
}

- (void)performKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v6 = a4;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v8, "performKeyboardShortcutAction:forBundleIdentifier:windowScene:", a3, v6, WeakRetained);

}

- (BOOL)shouldMorphFromPIPForTransitionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[SBSwitcherController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherController contentViewController](self, "contentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "switcherContentController:shouldMorphFromPIPForTransitionContext:", v7, v4);

  return v8;
}

- (BOOL)shouldMorphToPIPForTransitionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[SBSwitcherController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherController contentViewController](self, "contentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "switcherContentController:shouldMorphToPIPForTransitionContext:", v7, v4);

  return v8;
}

- (id)requestInAppStatusBarHiddenAssertionForReason:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SBInAppStatusBarHiddenAssertion *v7;
  SBInAppStatusBarHiddenAssertion *v8;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  id location;

  v4 = a4;
  v6 = a3;
  objc_initWeak(&location, self);
  v7 = [SBInAppStatusBarHiddenAssertion alloc];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__SBSwitcherController_requestInAppStatusBarHiddenAssertionForReason_animated___block_invoke;
  v10[3] = &unk_1E8EAD560;
  objc_copyWeak(&v11, &location);
  v12 = v4;
  v8 = -[SBInAppStatusBarHiddenAssertion initWithIdentifier:forReason:invalidationBlock:](v7, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SBSwitcherController.HideStatusBar"), v6, v10);
  -[SBSwitcherController _addInAppStatusBarHiddenAssertion:animated:](self, "_addInAppStatusBarHiddenAssertion:animated:", v8, v4);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v8;
}

void __79__SBSwitcherController_requestInAppStatusBarHiddenAssertionForReason_animated___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_removeInAppStatusBarHiddenAssertion:animated:", v4, *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)isInAppStatusBarHidden
{
  SBSwitcherContentViewControlling *contentViewController;
  void *v3;

  contentViewController = self->_contentViewController;
  -[SBSwitcherController _currentMainAppLayout](self, "_currentMainAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(contentViewController) = -[SBSwitcherContentViewControlling isStatusBarHiddenForAppLayout:](contentViewController, "isStatusBarHiddenForAppLayout:", v3);

  return (char)contentViewController;
}

- (CGRect)statusBarAvoidanceFrameForLayoutRole:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[SBSwitcherController _currentLayoutState](self, "_currentLayoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherController statusBarAvoidanceFrameForLayoutRole:layoutState:](self, "statusBarAvoidanceFrameForLayoutRole:layoutState:", a3, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (UIEdgeInsets)statusBarEdgeInsets
{
  CGFloat MinY;
  CGFloat MinX;
  double v4;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGRect *v21;
  __int128 v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _BOOL4 v27;
  double Width;
  double v29;
  double v30;
  double v31;
  double v32;
  _QWORD v33[4];
  id v34;
  id v35;
  SBSwitcherController *v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  uint64_t v45;
  CGRect *v46;
  uint64_t v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  CGRect v51;
  UIEdgeInsets result;

  if (-[SBSwitcherController windowManagementStyle](self, "windowManagementStyle") == 1)
  {
    -[SBSwitcherController _currentLayoutState](self, "_currentLayoutState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherController _currentMainAppLayout](self, "_currentMainAppLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBSwitcherController unlockedEnvironmentMode](self, "unlockedEnvironmentMode") == 3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
      objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v6, "interfaceOrientation");
      -[SBSwitcherController leadingStatusBarStyleRequest](self, "leadingStatusBarStyleRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBSceneLayoutCoordinateSpace coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:](SBSceneLayoutCoordinateSpace, "coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:", v10, self->_switcherWindow, -[SBMainSwitcherWindow interfaceOrientation](self->_switcherWindow, "interfaceOrientation"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;

      v45 = 0;
      v46 = (CGRect *)&v45;
      v47 = 0x4010000000;
      v48 = &unk_1D0FA064E;
      v21 = (CGRect *)MEMORY[0x1E0C9D648];
      v22 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      v49 = *MEMORY[0x1E0C9D648];
      v50 = v22;
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __43__SBSwitcherController_statusBarEdgeInsets__block_invoke;
      v33[3] = &unk_1E8EAD588;
      v23 = v6;
      v34 = v23;
      v24 = v7;
      v35 = v24;
      v36 = self;
      v25 = v9;
      v37 = v25;
      v40 = v10;
      v26 = v11;
      v41 = v14;
      v42 = v16;
      v43 = v18;
      v44 = v20;
      v38 = v26;
      v39 = &v45;
      SBLayoutRoleEnumerateAppLayoutRoles(v33);
      v27 = CGRectEqualToRect(v46[1], *v21);
      if (!v27)
      {
        MinY = CGRectGetMinY(v46[1]);
        MinX = CGRectGetMinX(v46[1]);
        v51.origin.x = v14;
        v51.origin.y = v16;
        v51.size.width = v18;
        v51.size.height = v20;
        Width = CGRectGetWidth(v51);
        v4 = Width - CGRectGetMaxX(v46[1]);
      }

      _Block_object_dispose(&v45, 8);
      if (!v27)
      {

        v29 = 0.0;
        goto LABEL_8;
      }
    }

  }
  MinY = *MEMORY[0x1E0CEB4B0];
  MinX = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v29 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
LABEL_8:
  v30 = MinY;
  v31 = MinX;
  v32 = v4;
  result.right = v32;
  result.bottom = v29;
  result.left = v31;
  result.top = v30;
  return result;
}

void __43__SBSwitcherController_statusBarEdgeInsets__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v10;
  CGRect v11;

  objc_msgSend(*(id *)(a1 + 32), "elementWithRole:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "itemForLayoutRole:", a2);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_deviceApplicationSceneHandleForDisplayItem:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBUIController statusBarFrameForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:statusBarStyleRequest:withinBounds:inReferenceSpace:](SBUIController, "statusBarFrameForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:statusBarStyleRequest:withinBounds:inReferenceSpace:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), 0, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
    v11.origin.x = v6;
    v11.origin.y = v7;
    v11.size.width = v8;
    v11.size.height = v9;
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)+ 32), v11);

  }
}

- (id)leadingStatusBarStyleRequest
{
  void *v3;

  if (-[SBSwitcherController unlockedEnvironmentMode](self, "unlockedEnvironmentMode") == 3)
  {
    -[SBSwitcherContentViewControlling leadingStatusBarStyleRequest](self->_contentViewController, "leadingStatusBarStyleRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)trailingStatusBarStyleRequest
{
  void *v3;

  if (-[SBSwitcherController unlockedEnvironmentMode](self, "unlockedEnvironmentMode") == 3)
  {
    -[SBSwitcherContentViewControlling trailingStatusBarStyleRequest](self->_contentViewController, "trailingStatusBarStyleRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)statusBarOverlayData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[SBSwitcherController unlockedEnvironmentMode](self, "unlockedEnvironmentMode") == 3)
  {
    -[SBSwitcherController _currentMainAppLayout](self, "_currentMainAppLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "itemForLayoutRole:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSwitcherController _deviceApplicationSceneHandleForDisplayItem:](self, "_deviceApplicationSceneHandleForDisplayItem:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "breadcrumbProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hasBreadcrumb"))
    {
      objc_msgSend(v5, "overlayStatusBarData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)statusBarActionsByPartIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (-[SBSwitcherController unlockedEnvironmentMode](self, "unlockedEnvironmentMode") != 3)
    return 0;
  -[SBSwitcherController _currentMainAppLayout](self, "_currentMainAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSwitcherController _deviceApplicationSceneHandleForDisplayItem:](self, "_deviceApplicationSceneHandleForDisplayItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "breadcrumbProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasBreadcrumb"))
  {
    v17 = *MEMORY[0x1E0CEC1E0];
    v7 = (void *)MEMORY[0x1E0CEAED0];
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __56__SBSwitcherController_statusBarActionsByPartIdentifier__block_invoke;
    v15 = &unk_1E8EA98B8;
    v16 = v6;
    v8 = v6;
    objc_msgSend(v7, "actionWithBlock:", &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1, v12, v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __56__SBSwitcherController_statusBarActionsByPartIdentifier__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activateBreadcrumbIfPossible");
}

- (void)_addInAppStatusBarHiddenAssertion:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSHashTable *inAppStatusBarHiddenAssertions;
  NSHashTable *v8;
  NSHashTable *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  inAppStatusBarHiddenAssertions = self->_inAppStatusBarHiddenAssertions;
  v10 = v6;
  if (!inAppStatusBarHiddenAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_inAppStatusBarHiddenAssertions;
    self->_inAppStatusBarHiddenAssertions = v8;

    v6 = v10;
    inAppStatusBarHiddenAssertions = self->_inAppStatusBarHiddenAssertions;
  }
  -[NSHashTable addObject:](inAppStatusBarHiddenAssertions, "addObject:", v6);
  if (-[NSHashTable count](self->_inAppStatusBarHiddenAssertions, "count") == 1)
    -[SBSwitcherContentViewControlling respondToInAppStatusBarRequestedHiddenUpdateAnimated:](self->_contentViewController, "respondToInAppStatusBarRequestedHiddenUpdateAnimated:", v4);

}

- (void)_removeInAppStatusBarHiddenAssertion:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSHashTable *inAppStatusBarHiddenAssertions;

  v4 = a4;
  -[NSHashTable removeObject:](self->_inAppStatusBarHiddenAssertions, "removeObject:", a3);
  if (!-[NSHashTable count](self->_inAppStatusBarHiddenAssertions, "count"))
  {
    inAppStatusBarHiddenAssertions = self->_inAppStatusBarHiddenAssertions;
    self->_inAppStatusBarHiddenAssertions = 0;

    -[SBSwitcherContentViewControlling respondToInAppStatusBarRequestedHiddenUpdateAnimated:](self->_contentViewController, "respondToInAppStatusBarRequestedHiddenUpdateAnimated:", v4);
  }
}

- (CGRect)frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4
{
  SBDisplayItemLayoutAttributesCalculator *displayItemFrameCalculator;
  id WeakRetained;
  double v8;
  double v9;
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
  CGRect result;

  displayItemFrameCalculator = self->_displayItemFrameCalculator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  -[SBDisplayItemLayoutAttributesCalculator frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:windowScene:](displayItemFrameCalculator, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:windowScene:", a3, a4, WeakRetained);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)frameForCenterItemWithConfiguration:(int64_t)a3 interfaceOrientation:(int64_t)a4
{
  SBDisplayItemLayoutAttributesCalculator *displayItemFrameCalculator;
  id WeakRetained;
  double v8;
  double v9;
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
  CGRect result;

  displayItemFrameCalculator = self->_displayItemFrameCalculator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  -[SBDisplayItemLayoutAttributesCalculator frameForCenterItemWithConfiguration:interfaceOrientation:windowScene:](displayItemFrameCalculator, "frameForCenterItemWithConfiguration:interfaceOrientation:windowScene:", a3, a4, WeakRetained);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)referenceFrameForInterfaceOrientation:(int64_t)a3 layoutRole:(int64_t)a4 appLayout:(id)a5
{
  SBWindowScene **p_windowScene;
  id v9;
  id WeakRetained;
  void *v11;
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
  double v22;
  double v23;
  CGRect result;

  if (a3)
  {
    p_windowScene = &self->_windowScene;
    v9 = a5;
    WeakRetained = objc_loadWeakRetained((id *)p_windowScene);
    objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");

    -[SBSwitcherController frameForItemWithRole:inMainAppLayout:interfaceOrientation:](self, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", a4, v9, a3);
    _UIWindowConvertRectFromOrientationToOrientation();
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

  }
  else
  {
    v13 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)referenceFrameForInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4
{
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");

    -[SBSwitcherController frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:](self, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", a3, a4);
    _UIWindowConvertRectFromOrientationToOrientation();
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)referenceFrameForInterfaceOrientation:(int64_t)a3 centerConfiguration:(int64_t)a4
{
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");

    -[SBSwitcherController frameForCenterItemWithConfiguration:interfaceOrientation:](self, "frameForCenterItemWithConfiguration:interfaceOrientation:", a4, a3);
    _UIWindowConvertRectFromOrientationToOrientation();
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)_reevaluateOrientationIfNecessary
{
  _QWORD v3[4];
  id v4;
  id location;

  if (self->_needsOrientationReevaluation)
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __57__SBSwitcherController__reevaluateOrientationIfNecessary__block_invoke;
    v3[3] = &unk_1E8EAD5B0;
    objc_copyWeak(&v4, &location);
    -[SBSwitcherController _enqueueOrientationTransitionWithActuationContext:suggestedAnimator:completionTask:validator:label:](self, "_enqueueOrientationTransitionWithActuationContext:suggestedAnimator:completionTask:validator:label:", 0, 0, 0, v3, CFSTR("SBSwitcherControllerEventLabelFollowupRotation"));
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

BOOL __57__SBSwitcherController__reevaluateOrientationIfNecessary__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BOOL8 v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[178] != 0;
    WeakRetained[178] = 0;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutStateTransitionCoordinator:transitionWillEndWithTransitionContext:", v8, v6);

  -[SBSwitcherContentViewControlling layoutStateTransitionCoordinator:transitionWillEndWithTransitionContext:](self->_contentViewController, "layoutStateTransitionCoordinator:transitionWillEndWithTransitionContext:", v8, v6);
}

- (BOOL)isInAnyPeekState
{
  void *v2;
  BOOL IsValid;

  -[SBSwitcherController _currentLayoutState](self, "_currentLayoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsValid = SBPeekConfigurationIsValid(objc_msgSend(v2, "peekConfiguration"));

  return IsValid;
}

- (BOOL)isAnyProtectedHiddenApplicationVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherController _currentMainAppLayout](self, "_currentMainAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[SBSwitcherController _currentFloatingAppLayout](self, "_currentFloatingAppLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)MEMORY[0x1E0CF9688];
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "bundleIdentifier", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "applicationWithBundleIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isHidden");

        if ((v15 & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)layoutStateStudyLogData
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SBSwitcherController layoutState](self, "layoutState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v3, "elements");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v5)
    {
      v6 = v5;
      v28 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v30 != v28)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v9 = objc_msgSend(v8, "layoutRole");
          v10 = objc_msgSend(v4, "floatingConfiguration");
          if (v9 == 3)
          {
            v11 = v10;
            if (SBFloatingConfigurationIsStashed(v10) || !SBFloatingConfigurationIsValid(v11))
              continue;
          }
          objc_msgSend(v8, "workspaceEntity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "applicationSceneEntity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sceneHandle");
          v14 = v4;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "application");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bundleIdentifier");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          if (v17)
            v19 = (const __CFString *)v17;
          else
            v19 = CFSTR("Unknown");
          SBLayoutRoleDescription(v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v19, v20);

          v4 = v14;
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v6);
    }

    SBStringForSpaceConfiguration(objc_msgSend(v4, "spaceConfiguration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v21, CFSTR("SpaceConfiguration"));

    SBStringForFloatingConfiguration(objc_msgSend(v4, "floatingConfiguration"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v22, CFSTR("FloatingConfiguration"));

    SBStringForCenterConfiguration(objc_msgSend(v4, "centerConfiguration"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v23, CFSTR("CenterConfiguration"));

    SBStringForPeekConfiguration(objc_msgSend(v4, "peekConfiguration"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v24, CFSTR("PeekConfiguration"));

  }
  return v27;
}

- (id)entityWithRole:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SBSwitcherController layoutState](self, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementWithRole:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workspaceEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)floatingConfiguration
{
  void *v2;
  int64_t v3;

  -[SBSwitcherController layoutState](self, "layoutState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "floatingConfiguration");

  return v3;
}

- (id)activeAndVisibleSceneIdentifiersForApplication:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[SBSwitcherController layoutState](self, "layoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__SBSwitcherController_activeAndVisibleSceneIdentifiersForApplication___block_invoke;
  v13[3] = &unk_1E8EAC028;
  v14 = v6;
  v15 = v4;
  v7 = v5;
  v16 = v7;
  v8 = v4;
  v9 = v6;
  SBLayoutRoleEnumerateValidRoles(v13);
  v10 = v16;
  v11 = v7;

  return v11;
}

void __71__SBSwitcherController_activeAndVisibleSceneIdentifiersForApplication___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "elementWithRole:", a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "workspaceEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationSceneEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = *(void **)(a1 + 48);
    objc_msgSend(v4, "sceneHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sceneIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v11);

  }
}

- (id)activeTransientOverlayPresentedAppLayout
{
  void *v3;
  id WeakRetained;
  void *v5;

  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v3, "activeTransientOverlayPresentedAppLayoutForWindowScene:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appLayoutForWorkspaceTransientOverlay:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;

  v4 = a3;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v5, "appLayoutForWorkspaceTransientOverlay:windowScene:", v4, WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)createWorkspaceTransientOverlayForAppLayout:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;

  v4 = a3;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v5, "createWorkspaceTransientOverlayForAppLayout:windowScene:", v4, WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addAppLayoutForTransientOverlayViewController:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;

  v4 = a3;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v6, "addAppLayoutForTransientOverlayViewController:windowScene:", v4, WeakRetained);

}

- (BOOL)hasAppLayoutForTransientOverlayViewController:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  char v7;

  v4 = a3;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v7 = objc_msgSend(v5, "hasAppLayoutForTransientOverlayViewController:windowScene:", v4, WeakRetained);

  return v7;
}

- (void)removeAppLayoutTransientOverlayViewController:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;

  v4 = a3;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v6, "removeAppLayoutTransientOverlayViewController:windowScene:", v4, WeakRetained);

}

- (BOOL)hasTransientOverlayAppLayouts
{
  void *v3;
  id WeakRetained;
  char v5;

  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v5 = objc_msgSend(v3, "hasTransientOverlayAppLayoutsForWindowScene:", WeakRetained);

  return v5;
}

- (void)addAcquiredTransientOverlayViewController:(id)a3 forAppLayout:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v9, "addAcquiredTransientOverlayViewController:forAppLayout:windowScene:", v7, v6, WeakRetained);

}

- (BOOL)isAcquiredTransientOverlayViewController:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  char v7;

  v4 = a3;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v7 = objc_msgSend(v5, "isAcquiredTransientOverlayViewController:windowScene:", v4, WeakRetained);

  return v7;
}

- (void)removeAcquiredTransientOverlayViewController:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;

  v4 = a3;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v6, "removeAcquiredTransientOverlayViewController:windowScene:", v4, WeakRetained);

}

- (void)enumerateTransientOverlayViewControllersUsingBlock:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;

  v4 = a3;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v6, "enumerateTransientOverlayViewControllersUsingBlock:windowScene:", v4, WeakRetained);

}

- (BOOL)activateHomeScreenWithSource:(int64_t)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  char v9;
  _QWORD v11[5];
  BOOL v12;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__SBSwitcherController_activateHomeScreenWithSource_animated___block_invoke;
  v11[3] = &__block_descriptor_41_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
  v11[4] = a3;
  v12 = a4;
  v5 = (void *)MEMORY[0x1D17E5550](v11, a2);
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "requestTransitionWithOptions:displayConfiguration:builder:", 0, v8, v5);

  return v9;
}

void __62__SBSwitcherController_activateHomeScreenWithSource_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  char v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setSource:", v3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__SBSwitcherController_activateHomeScreenWithSource_animated___block_invoke_2;
  v5[3] = &__block_descriptor_33_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  v6 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v4, "modifyApplicationContext:", v5);

}

void __62__SBSwitcherController_activateHomeScreenWithSource_animated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActivatingEntity:", v2);

  objc_msgSend(v3, "setAnimationDisabled:", BSSettingFlagIfYes() != 0);
}

- (BOOL)activateMainSwitcherWithSource:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  char v12;
  _QWORD v14[6];

  v4 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__SBSwitcherController_activateMainSwitcherWithSource_animated___block_invoke;
  v14[3] = &unk_1E8EAAE78;
  v14[4] = self;
  v14[5] = a3;
  v7 = (void *)MEMORY[0x1D17E5550](v14, a2);
  -[SBSwitcherController _makeWorkspaceTransitionValidatorForActivatingMainSwitcherWithSource:animated:](self, "_makeWorkspaceTransitionValidatorForActivatingMainSwitcherWithSource:animated:", a3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v11, v7, v8);

  return v12;
}

void __64__SBSwitcherController_activateMainSwitcherWithSource_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_168);
  objc_msgSend(v3, "setSource:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "activateSwitcherEventName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventLabel:", v4);

}

void __64__SBSwitcherController_activateMainSwitcherWithSource_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setRequestedUnlockedEnvironmentMode:", 2);
  objc_msgSend(v2, "setWaitsForSceneUpdates:", 0);

}

- (BOOL)dismissMainSwitcherWithSource:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  char v13;

  v4 = a4;
  if ((objc_msgSend((id)SBApp, "isRunningTest:", CFSTR("AppSliderDismiss")) & 1) != 0
    || (objc_msgSend((id)SBApp, "isRunningTest:", CFSTR("AppSliderDismissRotated")) & 1) != 0
    || (objc_msgSend((id)SBApp, "isRunningTest:", CFSTR("AppSliderDismissOverApp")) & 1) != 0
    || (objc_msgSend((id)SBApp, "isRunningTest:", CFSTR("AppSliderDismissOverAppRotated")) & 1) != 0
    || (objc_msgSend((id)SBApp, "isRunningTest:", CFSTR("AppSliderDismissOverAppInScreenTime")) & 1) != 0
    || objc_msgSend((id)SBApp, "isRunningTest:", CFSTR("AppSliderDismissOverAppInScreenTimeRotated")))
  {
    +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentTestName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("delay"), v8);
  }
  -[SBSwitcherController _makeWorkspaceTransitionValidatorForDismissingMainSwitcherToAppLayout:dismissFloatingSwitcher:withSource:animated:](self, "_makeWorkspaceTransitionValidatorForDismissingMainSwitcherToAppLayout:dismissFloatingSwitcher:withSource:animated:", self->_activeAppLayoutWhenActivatingMainSwitcher, 0, a3, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v12, 0, v9);

  return v13;
}

- (BOOL)toggleMainSwitcherWithSource:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  char v12;
  _QWORD v14[6];

  v4 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__SBSwitcherController_toggleMainSwitcherWithSource_animated___block_invoke;
  v14[3] = &unk_1E8EAAE78;
  v14[4] = self;
  v14[5] = a3;
  v7 = (void *)MEMORY[0x1D17E5550](v14, a2);
  -[SBSwitcherController _makeWorkspaceTransitionValidatorForTogglingMainSwitcherWithSource:animated:](self, "_makeWorkspaceTransitionValidatorForTogglingMainSwitcherWithSource:animated:", a3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v11, v7, v8);

  return v12;
}

void __62__SBSwitcherController_toggleMainSwitcherWithSource_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isMainSwitcherVisible") & 1) == 0)
  {
    objc_msgSend(v4, "modifyApplicationContext:", &__block_literal_global_172);
    objc_msgSend(v4, "setSource:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "toggleSwitcherEventName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEventLabel:", v3);

  }
}

void __62__SBSwitcherController_toggleMainSwitcherWithSource_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setRequestedUnlockedEnvironmentMode:", 2);
  objc_msgSend(v2, "setWaitsForSceneUpdates:", 0);

}

- (BOOL)dismissMainAndFloatingSwitchersWithSource:(int64_t)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  char v9;

  -[SBSwitcherController _makeWorkspaceTransitionValidatorForDismissingMainSwitcherToAppLayout:dismissFloatingSwitcher:withSource:animated:](self, "_makeWorkspaceTransitionValidatorForDismissingMainSwitcherToAppLayout:dismissFloatingSwitcher:withSource:animated:", self->_activeAppLayoutWhenActivatingMainSwitcher, 1, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v8, 0, v5);

  return v9;
}

- (void)configureRequest:(id)a3 forSwitcherTransitionRequest:(id)a4 withEventLabel:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_configureRequest:forSwitcherTransitionRequest:withEventLabel:", v10, v9, v8);

}

- (void)performTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[SBSwitcherController contentViewController](self, "contentViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performTransitionWithContext:animated:completion:", v9, v5, v8);

}

- (id)animationControllerForTransitionRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationControllerForTransitionRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addAppLayoutForDisplayItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v9, "addAppLayoutForDisplayItem:windowScene:completion:", v7, WeakRetained, v6);

}

- (void)addCenterRoleAppLayoutForDisplayItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v9, "addCenterRoleAppLayoutForDisplayItem:windowScene:completion:", v7, WeakRetained, v6);

}

- (id)homeGestureBottomEdgeRecognizer
{
  return -[SBFluidSwitcherGestureManager homeGestureBottomEdgeRecognizer](self->_gestureManager, "homeGestureBottomEdgeRecognizer");
}

- (double)scaleForDownscaledSnapshotGenerationForSceneHandle:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[SBSwitcherController _setUpSwitcherWindowIfNeeded](self, "_setUpSwitcherWindowIfNeeded");
  -[SBSwitcherController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshotScaleForSceneHandle:", v4);
  v7 = v6;

  return v7;
}

- (void)_performSwitcherDropWithContext:(id)a3
{
  id v4;
  SBSwitcherContentViewControlling *contentViewController;
  uint64_t v6;
  SBSwitcherContentViewControlling *v7;
  SBSwitcherContentViewControlling *v8;
  SBSwitcherContentViewControlling *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  SBSwitcherController *v13;

  v4 = a3;
  contentViewController = self->_contentViewController;
  v6 = objc_opt_class();
  v7 = contentViewController;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__SBSwitcherController__performSwitcherDropWithContext___block_invoke;
  v11[3] = &unk_1E8E9E820;
  v12 = v4;
  v13 = self;
  v10 = v4;
  -[SBSwitcherContentViewControlling _performSwitcherDropWithContext:mutationBlock:](v9, "_performSwitcherDropWithContext:mutationBlock:", v10, v11);

}

void __56__SBSwitcherController__performSwitcherDropWithContext___block_invoke(uint64_t a1)
{
  id v2;

  if (SBSwitcherDropRegionWarrantsModelUpdate(objc_msgSend(*(id *)(a1 + 32), "currentDropRegion")))
  {
    objc_msgSend(*(id *)(a1 + 40), "switcherCoordinator");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_modifyModelWithDropContext:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_noteSwitcherDropAnimationCompletedWithContext:(id)a3
{
  SBSwitcherContentViewControlling *contentViewController;
  uint64_t v4;
  SBSwitcherContentViewControlling *v5;
  SBSwitcherContentViewControlling *v6;
  SBSwitcherContentViewControlling *v7;
  id v8;

  contentViewController = self->_contentViewController;
  v8 = a3;
  v4 = objc_opt_class();
  v5 = contentViewController;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  -[SBSwitcherContentViewControlling _noteSwitcherDropAnimationCompletedWithContext:](v7, "_noteSwitcherDropAnimationCompletedWithContext:", v8);
}

- (BOOL)isIdleTouchAwarenessClientEnabled
{
  return -[SBAttentionAwarenessClient isEnabled](self->_idleTouchAwarenessClient, "isEnabled");
}

- (void)setIdleTouchAwarenessClientEnabled:(BOOL)a3
{
  -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", a3);
}

- (void)_presentMedusaEducationBanner
{
  _BOOL4 IsValid;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  -[SBSwitcherController _currentLayoutState](self, "_currentLayoutState");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  IsValid = SBPeekConfigurationIsValid(objc_msgSend(v8, "peekConfiguration"));
  objc_msgSend(v8, "appLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (IsValid)
  {
    objc_msgSend(v4, "itemForLayoutRole:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

  }
  else
  {
    v7 = 1;
  }
  -[SBSwitcherController _presentMedusaBanner:fireInterval:dismissInterval:](self, "_presentMedusaBanner:fireInterval:dismissInterval:", v7, 0.7, 0.0);

}

- (void)_presentMedusaBanner:(int64_t)a3 fireInterval:(double)a4 dismissInterval:(double)a5
{
  void *v9;
  SBMedusaBannerViewController *v10;
  SBMedusaBannerViewController *medusaBannerViewController;
  BSAbsoluteMachTimer *v12;
  BSAbsoluteMachTimer *medusaBannerDismissTimer;
  BSAbsoluteMachTimer *medusaBannerPresentTimer;
  BSAbsoluteMachTimer *v15;
  BSAbsoluteMachTimer *v16;
  BSAbsoluteMachTimer *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21[2];
  id location;

  -[SBSwitcherController _currentLayoutState](self, "_currentLayoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v10 = -[SBMedusaBannerViewController initWithType:orientation:peekConfiguration:]([SBMedusaBannerViewController alloc], "initWithType:orientation:peekConfiguration:", a3, objc_msgSend(v9, "interfaceOrientation"), objc_msgSend(v9, "peekConfiguration"));
  medusaBannerViewController = self->_medusaBannerViewController;
  self->_medusaBannerViewController = v10;

  if (a5 > 0.0 && !self->_medusaBannerDismissTimer)
  {
    v12 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBMainSwitcherCoordinator.medusaBannerDismissTimer"));
    medusaBannerDismissTimer = self->_medusaBannerDismissTimer;
    self->_medusaBannerDismissTimer = v12;

  }
  medusaBannerPresentTimer = self->_medusaBannerPresentTimer;
  if (!medusaBannerPresentTimer)
  {
    v15 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBMainSwitcherCoordinator.medusaBannerPresentTimer"));
    v16 = self->_medusaBannerPresentTimer;
    self->_medusaBannerPresentTimer = v15;

    medusaBannerPresentTimer = self->_medusaBannerPresentTimer;
  }
  -[BSAbsoluteMachTimer cancel](medusaBannerPresentTimer, "cancel");
  v17 = self->_medusaBannerPresentTimer;
  v18 = MEMORY[0x1E0C80D38];
  v19 = MEMORY[0x1E0C80D38];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__SBSwitcherController__presentMedusaBanner_fireInterval_dismissInterval___block_invoke;
  v20[3] = &unk_1E8EAD658;
  objc_copyWeak(v21, &location);
  v21[1] = *(id *)&a5;
  -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v17, "scheduleWithFireInterval:leewayInterval:queue:handler:", v18, v20, a4, 0.05);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

}

void __74__SBSwitcherController__presentMedusaBanner_fireInterval_dismissInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  void *v7;
  id v8;
  double v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[11], "invalidate");
    v6 = v5[11];
    v5[11] = 0;

    objc_msgSend((id)SBApp, "bannerManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postPresentable:withOptions:userInfo:error:", v5[10], 1, 0, 0);

    objc_msgSend(v5[12], "cancel");
    v8 = v5[12];
    v9 = *(double *)(a1 + 40);
    v10 = MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__SBSwitcherController__presentMedusaBanner_fireInterval_dismissInterval___block_invoke_2;
    v12[3] = &unk_1E8E9EEC8;
    objc_copyWeak(&v13, (id *)(a1 + 32));
    objc_msgSend(v8, "scheduleWithFireInterval:leewayInterval:queue:handler:", v10, v12, v9, 0.05);

    objc_destroyWeak(&v13);
  }

}

void __74__SBSwitcherController__presentMedusaBanner_fireInterval_dismissInterval___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissMedusaBanner");

}

- (void)_dismissMedusaBanner
{
  BSAbsoluteMachTimer *medusaBannerPresentTimer;
  BSAbsoluteMachTimer *medusaBannerDismissTimer;
  void *v5;
  id v6;
  id v7;

  -[BSAbsoluteMachTimer invalidate](self->_medusaBannerPresentTimer, "invalidate");
  medusaBannerPresentTimer = self->_medusaBannerPresentTimer;
  self->_medusaBannerPresentTimer = 0;

  -[BSAbsoluteMachTimer invalidate](self->_medusaBannerDismissTimer, "invalidate");
  medusaBannerDismissTimer = self->_medusaBannerDismissTimer;
  self->_medusaBannerDismissTimer = 0;

  objc_msgSend((id)SBApp, "bannerManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D010A0], "uniqueIdentificationForPresentable:", self->_medusaBannerViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "revokePresentablesWithIdentification:reason:options:userInfo:error:", v5, CFSTR("Dismiss Medusa Education Banner"), 0, 0, 0);

}

- (void)_invalidateMedusaEducationBannerTimer
{
  BSAbsoluteMachTimer *medusaBannerPresentTimer;
  BSAbsoluteMachTimer *medusaBannerDismissTimer;

  -[BSAbsoluteMachTimer invalidate](self->_medusaBannerPresentTimer, "invalidate");
  medusaBannerPresentTimer = self->_medusaBannerPresentTimer;
  self->_medusaBannerPresentTimer = 0;

  -[BSAbsoluteMachTimer invalidate](self->_medusaBannerDismissTimer, "invalidate");
  medusaBannerDismissTimer = self->_medusaBannerDismissTimer;
  self->_medusaBannerDismissTimer = 0;

  -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 0);
}

- (void)_prepareForSceneLayoutTransitionWithTransitionContext:(id)a3
{
  -[SBSwitcherContentViewControlling sceneLayoutTransitionWillStartWithTransitionContext:](self->_contentViewController, "sceneLayoutTransitionWillStartWithTransitionContext:", a3);
}

- (id)_sceneEntitiesToForeground
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SBSwitcherContentViewControlling foregroundAppLayouts](self->_contentViewController, "foregroundAppLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __50__SBSwitcherController__sceneEntitiesToForeground__block_invoke;
        v13[3] = &unk_1E8E9E3B0;
        v13[4] = self;
        v14 = v3;
        objc_msgSend(v10, "enumerate:", v13);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

void __50__SBSwitcherController__sceneEntitiesToForeground__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "switcherCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_entityForDisplayItem:switcherController:", v5, *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isApplicationSceneEntity"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

- (char)_jetsamModeForScene:(id)a3
{
  void *v4;
  char v5;

  -[SBSwitcherController _appLayoutForScene:](self, "_appLayoutForScene:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[SBSwitcherContentViewControlling jetsamModeForAppLayout:](self->_contentViewController, "jetsamModeForAppLayout:", v4);
  else
    v5 = 0;

  return v5;
}

- (char)_activityModeForScene:(id)a3
{
  void *v4;
  char v5;

  -[SBSwitcherController _appLayoutForScene:](self, "_appLayoutForScene:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[SBSwitcherContentViewControlling activityModeForAppLayout:](self->_contentViewController, "activityModeForAppLayout:", v4);
  else
    v5 = -3;

  return v5;
}

- (id)_appLayoutForScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  void *v17;
  uint64_t *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__48;
  v27 = __Block_byref_object_dispose__48;
  v28 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appLayoutsForSwitcherController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    v9 = MEMORY[0x1E0C809B0];
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __43__SBSwitcherController__appLayoutForScene___block_invoke;
      v15[3] = &unk_1E8EAD680;
      v12 = v4;
      v17 = v11;
      v18 = &v23;
      v16 = v12;
      objc_msgSend(v11, "enumerate:", v15);
      LOBYTE(v11) = v24[5] == 0;

      if ((v11 & 1) == 0)
        break;
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v13 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __43__SBSwitcherController__appLayoutForScene___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  id v7;

  objc_msgSend(a3, "uniqueIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    *a4 = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
  }

}

uint64_t __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_2;
  v8[3] = &unk_1E8EA2148;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "bs_containsObjectPassingTest:", v8);

  return v6;
}

uint64_t __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "representsSameLayoutElementAsDescriptor:", *(_QWORD *)(a1 + 32));
}

void __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v10 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_4;
  v11[3] = &unk_1E8EAC028;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v4 = v3;
  v14 = v4;
  SBLayoutRoleEnumerateValidRoles(v11);
  objc_msgSend(v4, "bs_firstObjectPassingTest:", &__block_literal_global_186_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_firstObjectPassingTest:", &__block_literal_global_187_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", &__block_literal_global_189);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workspaceEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workspaceEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEntities:withPolicy:centerEntity:floatingEntity:", v7, 0, v8, v9);
  if (SBPeekConfigurationIsValid(objc_msgSend(*(id *)(a1 + 32), "peekConfiguration")))
    objc_msgSend(v10, "setRequestedPeekConfiguration:", 1);

}

void __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_4(id *a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(a1[4], "elementWithRole:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    v4 = objc_msgSend(a1[5], "containsObject:", v3);
    v3 = v5;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(a1[6], "addObject:", v5);
      v3 = v5;
    }
  }

}

BOOL __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layoutRole") == 4;
}

BOOL __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layoutRole") == 3;
}

uint64_t __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "workspaceEntity");
}

void __66__SBSwitcherController__updateDisplayLayoutElementForLayoutState___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 264);
  v3 = a2;
  objc_msgSend(v2, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setReferenceFrame:");

}

- (void)_presentContinuousExposeStripRevealGrabberTongueImmediately
{
  -[SBFluidSwitcherGestureManager presentContinuousExposeStripRevealGrabberTongueImmediately](self->_gestureManager, "presentContinuousExposeStripRevealGrabberTongueImmediately");
}

- (void)_tickleContinuousExposeStripRevealGrabberTongueIfVisible
{
  -[SBFluidSwitcherGestureManager tickleContinuousExposeStripRevealGrabberTongueIfVisible](self->_gestureManager, "tickleContinuousExposeStripRevealGrabberTongueIfVisible");
}

- (BOOL)_shouldAcceleratedHomeButtonPressBegin
{
  void *v2;
  char v3;

  -[SBSwitcherController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldAcceleratedHomeButtonPressBegin");

  return v3;
}

- (void)prepareForCoordinatedLayoutStateTransitionWithContext:(id)a3
{
  SBSwitcherContentViewControlling *contentViewController;
  uint64_t v4;
  SBSwitcherContentViewControlling *v5;
  SBSwitcherContentViewControlling *v6;
  SBSwitcherContentViewControlling *v7;
  id v8;

  contentViewController = self->_contentViewController;
  v8 = a3;
  v4 = objc_opt_class();
  v5 = contentViewController;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  -[SBSwitcherContentViewControlling prepareForCoordinatedLayoutStateTransitionWithContext:](v7, "prepareForCoordinatedLayoutStateTransitionWithContext:", v8);
}

- (void)cleanUpAfterCoordinatedLayoutStateTransitionWithContext:(id)a3
{
  SBSwitcherContentViewControlling *contentViewController;
  uint64_t v4;
  SBSwitcherContentViewControlling *v5;
  SBSwitcherContentViewControlling *v6;
  SBSwitcherContentViewControlling *v7;
  id v8;

  contentViewController = self->_contentViewController;
  v8 = a3;
  v4 = objc_opt_class();
  v5 = contentViewController;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  -[SBSwitcherContentViewControlling cleanUpAfterCoordinatedLayoutStateTransitionWithContext:](v7, "cleanUpAfterCoordinatedLayoutStateTransitionWithContext:", v8);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  _QWORD block[5];

  if (objc_msgSend(a4, "isEqual:", CFSTR("switcherStyle")))
  {
    -[SBSwitcherController dismissMainAndFloatingSwitchersWithSource:animated:](self, "dismissMainAndFloatingSwitchersWithSource:animated:", 3, 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__SBSwitcherController_settings_changedValueForKey___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  -[SBSwitcherController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowModifierTimeline:", -[SBAppSwitcherSettings showMainModifierTimeline](self->_settings, "showMainModifierTimeline"));

}

uint64_t __52__SBSwitcherController_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentViewControllerIfNeeded");
}

- (void)client:(id)a3 attentionLostTimeoutDidExpire:(double)a4 forConfigurationGeneration:(unint64_t)a5 withAssociatedObject:(id)a6
{
  -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 0, a5, a6, a4);
  -[SBSwitcherController _presentMedusaEducationBanner](self, "_presentMedusaEducationBanner");
}

- (BOOL)handleHomeButtonPress
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  -[SBSwitcherController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "handleHomeButtonPress") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    if (!-[SBSwitcherController isAnySwitcherVisible](self, "isAnySwitcherVisible"))
    {
      objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSwitcherController activateSwitcherEventName](self, "activateSwitcherEventName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "hasEventWithName:", v6);

      if (!v7)
        goto LABEL_7;
    }
    if (-[SBSwitcherController isAnySwitcherVisible](self, "isAnySwitcherVisible")
      && (-[SBSwitcherController activeTransientOverlayPresentedAppLayout](self, "activeTransientOverlayPresentedAppLayout"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, !v8))
    {
      v4 = 1;
      -[SBSwitcherController dismissMainAndFloatingSwitchersWithSource:animated:](self, "dismissMainAndFloatingSwitchersWithSource:animated:", 20, 1);
    }
    else
    {
LABEL_7:
      v4 = 0;
    }
    if (-[SBSwitcherController isInAnyPeekState](self, "isInAnyPeekState"))
    {
      v4 = 1;
      -[SBSwitcherController activateHomeScreenWithSource:animated:](self, "activateHomeScreenWithSource:animated:", 20, 1);
    }
  }

  return v4;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  -[SBSwitcherController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "handleHeadsetButtonPress:", v3);

  return v3;
}

- (BOOL)handleHomeButtonDoublePress
{
  void *v2;
  char v3;

  -[SBSwitcherController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "handleHomeButtonDoublePress");

  return v3;
}

- (BOOL)handleHomeButtonLongPress
{
  void *v2;
  char v3;

  -[SBSwitcherController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "handleHomeButtonLongPress");

  return v3;
}

- (BOOL)handleLockButtonPress
{
  void *v2;
  char v3;

  -[SBSwitcherController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "handleLockButtonPress");

  return v3;
}

- (BOOL)handleVoiceCommandButtonPress
{
  void *v2;
  char v3;

  -[SBSwitcherController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "handleVoiceCommandButtonPress");

  return v3;
}

- (BOOL)handleVolumeDownButtonPress
{
  void *v2;
  char v3;

  -[SBSwitcherController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "handleVolumeDownButtonPress");

  return v3;
}

- (BOOL)handleVolumeUpButtonPress
{
  void *v2;
  char v3;

  -[SBSwitcherController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "handleVolumeUpButtonPress");

  return v3;
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  void (**v5)(id, SBSDisplayLayoutElement *);
  id WeakRetained;
  objc_class *v7;
  void *v8;
  void *v9;
  BSInvalidatable *displayLayoutElementAssertion;
  BSInvalidatable *v11;
  BSInvalidatable *v12;
  void (*v13)(void);
  void *v14;
  void *v15;
  id v16;

  if (self->_displayLayoutElementAssertion)
  {
    v5 = (void (**)(id, SBSDisplayLayoutElement *))a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherController.m"), 2115, CFSTR("No window scene to get a publisher: %@"), self);

    }
    objc_msgSend(WeakRetained, "displayLayoutPublisher");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherController.m"), 2115, CFSTR("No publisher for window scene: %@; self: %@"),
        WeakRetained,
        self);

    }
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transitionAssertionWithReason:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v5[2](v5, self->_displayLayoutElement);
    objc_msgSend(v16, "addElement:", self->_displayLayoutElement);
    v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v12 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v11;

    objc_msgSend(v9, "invalidate");
  }
  else
  {
    v13 = (void (*)(void))*((_QWORD *)a3 + 2);
    v16 = a3;
    v13();
  }

}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (void)fluidSwitcherGestureManager:(id)a3 didBeginGesture:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SBSwitcherController contentViewController](self, "contentViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFluidSwitcherGestureManager:didBeginGesture:", v7, v6);

}

- (void)fluidSwitcherGestureManager:(id)a3 didUpdateGesture:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SBSwitcherController contentViewController](self, "contentViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFluidSwitcherGestureManager:didUpdateGesture:", v7, v6);

}

- (void)fluidSwitcherGestureManager:(id)a3 didEndGesture:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SBSwitcherController contentViewController](self, "contentViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFluidSwitcherGestureManager:didEndGesture:", v7, v6);

}

- (void)fluidSwitcherGestureManager:(id)a3 clickReceivedForHomeGrabberView:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  -[SBSwitcherController gestureManager](self, "gestureManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    -[SBSwitcherController contentViewController](self, "contentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clickReceivedForHomeGrabberView:", v10);

  }
}

- (void)fluidSwitcherGestureManager:(id)a3 tapReceivedForGrabberTongueAtEdge:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v6 = a3;
  -[SBSwitcherController gestureManager](self, "gestureManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    -[SBSwitcherController contentViewController](self, "contentViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tapReceivedForGrabberTongueAtEdge:", a4);

  }
}

- (void)viewDidLoadForSwitcherViewController:(id)a3
{
  void *v4;
  id v5;

  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switcherControllerViewDidLoad:", self);

  -[SBSwitcherController _updateContentViewControllerIfNeeded](self, "_updateContentViewControllerIfNeeded");
  -[SBSwitcherController _currentLayoutState](self, "_currentLayoutState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherController _updateContentViewInterfaceOrientation:](self, "_updateContentViewInterfaceOrientation:", objc_msgSend(v5, "interfaceOrientation"));

}

- (void)viewWillAppearForSwitcherViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "switcherControllerViewWillAppear:animated:", self, v4);

}

- (int64_t)overrideInterfaceOrientationMechanicsForSwitcherViewController:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[SBSwitcherController contentViewController](self, "contentViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "switcherInterfaceOrientationForSwitcherContentController:", v3);

  return v5;
}

- (void)_windowSceneCanvasSizeDidChange:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__SBSwitcherController__windowSceneCanvasSizeDidChange___block_invoke_2;
  v8[3] = &unk_1E8EA6C08;
  v8[4] = self;
  objc_msgSend(v6, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v5, &__block_literal_global_206, v8);

  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emitEvent:", 61);

}

void __56__SBSwitcherController__windowSceneCanvasSizeDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setSource:", 66);
  objc_msgSend(v2, "setEventLabel:", CFSTR("DisplayCanvasSizeChange"));

}

BOOL __56__SBSwitcherController__windowSceneCanvasSizeDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "windowManagementStyle");
  if (v4 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "layoutState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__SBSwitcherController__windowSceneCanvasSizeDidChange___block_invoke_3;
    v8[3] = &unk_1E8E9EE50;
    v9 = v5;
    v6 = v5;
    objc_msgSend(v3, "modifyApplicationContext:", v8);

  }
  return v4 == 2;
}

void __56__SBSwitcherController__windowSceneCanvasSizeDidChange___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setRequestedUnlockedEnvironmentMode:", objc_msgSend(v2, "unlockedEnvironmentMode"));

}

- (id)_makeWorkspaceTransitionValidatorForActivatingMainSwitcherWithSource:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __102__SBSwitcherController__makeWorkspaceTransitionValidatorForActivatingMainSwitcherWithSource_animated___block_invoke;
  v5[3] = &unk_1E8EAD790;
  v5[4] = self;
  v6 = a4;
  return (id)objc_msgSend(v5, "copy", a3);
}

uint64_t __102__SBSwitcherController__makeWorkspaceTransitionValidatorForActivatingMainSwitcherWithSource_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  BOOL v14;
  char v15;
  char v16;
  void *v17;
  char v18;
  int v19;
  SBMutableSwitcherTransitionRequest *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v27;
  int v28;
  void *v29;
  id v30;
  unsigned __int8 v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v30 = a2;
  objc_msgSend(*(id *)(a1 + 32), "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v28 = objc_msgSend(*(id *)(a1 + 32), "isMainSwitcherVisible");
  v29 = v7;
  v27 = objc_msgSend(v7, "isScrolling");
  +[SBCommandTabController sharedInstance](SBCommandTabController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isVisible");

  v31 = 0;
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasVisibleAlertItemOrSheet:", &v31);

  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[SBAssistantController isVisible](SBAssistantController, "isVisible");
  v15 = objc_msgSend(v13, "hasVisibleAlert");
  v16 = objc_msgSend(v13, "hasVisibleSuperModalAlert");
  objc_msgSend(v3, "uiLockStateProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isUILocked");

  v19 = 1;
  if (v14
    || (v16 & 1) != 0
    || (v15 & 1) != 0
    || (v18 & 1) != 0
    || (!v31 ? (v19 = v12) : (v19 = 0), ((v27 | v28 | v10) & 1) != 0 || v19))
  {
    SBLogAppSwitcher();
    v20 = (SBMutableSwitcherTransitionRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v20->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110400;
      v33 = v27;
      v34 = 1024;
      v35 = v28;
      v36 = 1024;
      v37 = v10;
      v38 = 1024;
      v39 = v19;
      v40 = 1024;
      v41 = v12;
      v42 = 1024;
      v43 = v31;
      _os_log_impl(&dword_1D0540000, &v20->super.super, OS_LOG_TYPE_DEFAULT, "Activate switcher validator returning NO. isIconControllerBusy: %{BOOL}u, isMainSwitcherVisible: %{BOOL}u, isCommandTabVisible: %{BOOL}u, isAlertVisibleOrLocked: %{BOOL}u, hasVisibleAlertItemOrSheet: %{BOOL}u, canDismissVisibleAlert: %{BOOL}u", buf, 0x26u);
    }
    v25 = 0;
    v24 = v30;
  }
  else
  {
    v20 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    -[SBSwitcherTransitionRequest setUnlockedEnvironmentMode:](v20, "setUnlockedEnvironmentMode:", 2);
    -[SBSwitcherTransitionRequest setAnimationDisabled:](v20, "setAnimationDisabled:", BSSettingFlagIfYes());
    v21 = *(void **)(a1 + 32);
    objc_msgSend(v21, "activateSwitcherEventName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v21;
    v24 = v30;
    objc_msgSend(v23, "configureRequest:forSwitcherTransitionRequest:withEventLabel:", v30, v20, v22);

    v25 = 1;
  }

  return v25;
}

- (id)_makeWorkspaceTransitionValidatorForDismissingMainSwitcherToAppLayout:(id)a3 dismissFloatingSwitcher:(BOOL)a4 withSource:(int64_t)a5 animated:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  BOOL v16;

  v9 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __138__SBSwitcherController__makeWorkspaceTransitionValidatorForDismissingMainSwitcherToAppLayout_dismissFloatingSwitcher_withSource_animated___block_invoke;
  v13[3] = &unk_1E8EAD7B8;
  v15 = a4;
  v13[4] = self;
  v14 = v9;
  v16 = a6;
  v10 = v9;
  v11 = (void *)objc_msgSend(v13, "copy");

  return v11;
}

uint64_t __138__SBSwitcherController__makeWorkspaceTransitionValidatorForDismissingMainSwitcherToAppLayout_dismissFloatingSwitcher_withSource_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  _BOOL4 v8;
  int v9;
  int v10;
  int v11;
  int v12;
  NSObject *v13;
  SBMutableSwitcherTransitionRequest *v14;
  void *v15;
  void *v16;
  _DWORD v18[2];
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    v5 = objc_msgSend(v4, "isAnySwitcherVisible");
  else
    v5 = objc_msgSend(v4, "isMainSwitcherVisible");
  v6 = v5;
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[SBAssistantController isVisible](SBAssistantController, "isVisible");
  v9 = objc_msgSend(v7, "hasVisibleAlert");
  v10 = objc_msgSend(v7, "hasVisibleSuperModalAlert");
  v11 = v6 ^ 1 | v8 | v9 | v10;
  if ((v11 & 1) != 0)
  {
    v12 = v10;
    SBLogAppSwitcher();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18[0] = 67109888;
      v18[1] = v6;
      v19 = 1024;
      v20 = v8;
      v21 = 1024;
      v22 = v9;
      v23 = 1024;
      v24 = v12;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Dismiss switcher validator returning NO. isSomeAppSwitcherVisible: %{BOOL}u, isAssistantVisible: %{BOOL}u, hasVisibleAlert: %{BOOL}u, hasVisibleSuperModalAlert: %{BOOL}u", (uint8_t *)v18, 0x1Au);
    }

  }
  else
  {
    v14 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    -[SBSwitcherTransitionRequest setAppLayout:](v14, "setAppLayout:", *(_QWORD *)(a1 + 40));
    if (*(_BYTE *)(a1 + 48))
      -[SBSwitcherTransitionRequest setFloatingSwitcherVisible:](v14, "setFloatingSwitcherVisible:", 0);
    -[SBSwitcherTransitionRequest setAnimationDisabled:](v14, "setAnimationDisabled:", BSSettingFlagIfYes());
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v15, "dismissSwitcherEventName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configureRequest:forSwitcherTransitionRequest:withEventLabel:", v3, v14, v16);

  }
  return v11 ^ 1u;
}

- (id)_makeWorkspaceTransitionValidatorForTogglingMainSwitcherWithSource:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v5[6];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __100__SBSwitcherController__makeWorkspaceTransitionValidatorForTogglingMainSwitcherWithSource_animated___block_invoke;
  v5[3] = &unk_1E8EAD7E0;
  v5[4] = self;
  v5[5] = a3;
  v6 = a4;
  return (id)objc_msgSend(v5, "copy");
}

uint64_t __100__SBSwitcherController__makeWorkspaceTransitionValidatorForTogglingMainSwitcherWithSource_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  int v5;
  _QWORD *v6;
  uint64_t (**v7)(_QWORD, _QWORD);
  uint64_t v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "isMainSwitcherVisible");
  v6 = *(_QWORD **)(a1 + 32);
  if (v5)
    objc_msgSend(v6, "_makeWorkspaceTransitionValidatorForDismissingMainSwitcherToAppLayout:dismissFloatingSwitcher:withSource:animated:", v6[8], 0, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  else
    objc_msgSend(v6, "_makeWorkspaceTransitionValidatorForActivatingMainSwitcherWithSource:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  v7 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = ((uint64_t (**)(_QWORD, id))v7)[2](v7, v4);

  return v8;
}

- (void)_setUpSwitcherWindowIfNeeded
{
  SBMainSwitcherWindow *v3;
  SBMainSwitcherWindow *switcherWindow;
  SBMainSwitcherWindow *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id WeakRetained;

  if (!self->_switcherWindow)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    v3 = -[SBMainSwitcherWindow initWithWindowScene:]([SBMainSwitcherWindow alloc], "initWithWindowScene:", WeakRetained);
    switcherWindow = self->_switcherWindow;
    self->_switcherWindow = v3;
    v5 = v3;

    -[SBMainSwitcherWindow _setRoleHint:](v5, "_setRoleHint:", CFSTR("SBTraitsParticipantRoleSwitcherRaw"));
    -[SBMainSwitcherWindow setRootViewController:](v5, "setRootViewController:", self->_switcherViewController);
    -[SBMainSwitcherWindow setWindowLevel:](v5, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + 5.0);
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(WeakRetained, "_fbsDisplayIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("SBSwitcherWindow:%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainSwitcherWindow setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v9);

    -[SBFWindow setHidden:](v5, "setHidden:", 1);
    -[SBMainSwitcherWindow setClipsToBounds:](v5, "setClipsToBounds:", 0);
    v10 = (id)-[SBSwitcherViewController view](self->_switcherViewController, "view");
    -[SBSwitcherViewController bs_endAppearanceTransition:](self->_switcherViewController, "bs_endAppearanceTransition:", 0);

  }
}

- (void)_updateContentViewControllerIfNeeded
{
  void *v2;
  int64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __objc2_class **v14;
  id v15;
  SBFullScreenSwitcherLiveContentOverlayCoordinator *v16;
  void *v17;
  id v18;
  int v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  SBFluidSwitcherGestureManager *v24;
  id v25;
  id v26;
  id v27;

  v4 = -[SBAppSwitcherSettings switcherStyle](self->_settings, "switcherStyle");
  -[SBSwitcherController contentViewController](self, "contentViewController");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  if (v4 == 1 || v4 == 2 || v4 == 3)
  {
    v6 = (id)objc_opt_self();
  }
  else
  {
    v19 = __sb__runningInSpringBoard();
    v20 = v19;
    if (v19)
    {
      SBFEffectiveDeviceClass();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "userInterfaceIdiom");
    }
    objc_opt_self();
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if ((v20 & 1) == 0)
  }
  v7 = v25;
  if ((id)v5 != v6 || v25 == 0)
  {
    -[SBSwitcherController switcherCoordinator](self, "switcherCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherController switcherViewController](self, "switcherViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      -[SBSwitcherController setContentViewController:](self, "setContentViewController:", 0);
      objc_msgSend(v25, "willMoveToParentViewController:", 0);
      objc_msgSend(v25, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

      objc_msgSend(v10, "removeChildViewController:", v25);
    }
    if (objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class()))
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "userInterfaceIdiom");

      v14 = off_1E8E991E8;
      if ((v13 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        v14 = off_1E8E96200;
      v15 = objc_alloc_init(*v14);
      v16 = -[SBFullScreenSwitcherLiveContentOverlayCoordinator initWithSwitcherController:]([SBFullScreenSwitcherLiveContentOverlayCoordinator alloc], "initWithSwitcherController:", self);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Main (%@)"), self->_debugName);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (id)objc_msgSend(objc_alloc((Class)v6), "initWithRootModifier:liveContentOverlayCoordinator:dataSource:delegate:debugName:", v15, v16, v9, v9, v17);

      v18 = v26;
    }
    else
    {
      v18 = objc_alloc_init((Class)v6);
    }
    v27 = v18;
    objc_msgSend(v18, "setDataSource:", v9);
    objc_msgSend(v27, "setDelegate:", v9);
    -[SBSwitcherController setContentViewController:](self, "setContentViewController:", v27);
    objc_msgSend(v10, "addChildViewController:", v27);
    objc_msgSend(v27, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addContentView:", v21);

    objc_msgSend(v27, "didMoveToParentViewController:", v10);
    objc_msgSend(v27, "setShowModifierTimeline:", -[SBAppSwitcherSettings showMainModifierTimeline](self->_settings, "showMainModifierTimeline"));
    -[SBSwitcherController gestureManager](self, "gestureManager");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      -[SBSwitcherController setGestureManager:](self, "setGestureManager:", 0);
      objc_msgSend(v23, "invalidate");

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[SBFluidSwitcherGestureManager initWithSwitcherController:delegate:]([SBFluidSwitcherGestureManager alloc], "initWithSwitcherController:delegate:", self, v9);
      -[SBSwitcherController setGestureManager:](self, "setGestureManager:", v24);

    }
    v7 = v27;
  }

}

- (BOOL)isMedusaMultitaskingEnabled
{
  return self->_medusaMultitaskingEnabled;
}

- (void)setSwitcherWindow:(id)a3
{
  objc_storeStrong((id *)&self->_switcherWindow, a3);
}

- (void)setSwitcherViewController:(id)a3
{
  objc_storeStrong((id *)&self->_switcherViewController, a3);
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (SBFluidSwitcherGestureManager)gestureManager
{
  return self->_gestureManager;
}

- (void)setGestureManager:(id)a3
{
  objc_storeStrong((id *)&self->_gestureManager, a3);
}

- (SBAppLayout)activeAppLayoutWhenActivatingMainSwitcher
{
  return self->_activeAppLayoutWhenActivatingMainSwitcher;
}

- (void)setActiveAppLayoutWhenActivatingMainSwitcher:(id)a3
{
  objc_storeStrong((id *)&self->_activeAppLayoutWhenActivatingMainSwitcher, a3);
}

- (BOOL)idleTouchAwarenessClientEnabled
{
  return self->_idleTouchAwarenessClientEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureManager, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_switcherViewController, 0);
  objc_storeStrong((id *)&self->_switcherWindow, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_inAppStatusBarHiddenAssertions, 0);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_modalUIFluidDismissalObserverInvalidatable, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_traitsAssistant, 0);
  objc_storeStrong((id *)&self->_traitsDelegateByParticipant, 0);
  objc_storeStrong((id *)&self->_traitsParticipantsByElementIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryElementTraitsParticipantDelegate, 0);
  objc_storeStrong((id *)&self->_arbiterActuationContext, 0);
  objc_storeStrong((id *)&self->_publisherTraitsParticipant, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_storeStrong((id *)&self->_idleTouchAwarenessClient, 0);
  objc_storeStrong((id *)&self->_medusaBannerDismissTimer, 0);
  objc_storeStrong((id *)&self->_medusaBannerPresentTimer, 0);
  objc_storeStrong((id *)&self->_medusaBannerViewController, 0);
  objc_storeStrong((id *)&self->_displayItemFrameCalculator, 0);
  objc_storeStrong((id *)&self->_activeAppLayoutWhenActivatingMainSwitcher, 0);
  objc_storeStrong((id *)&self->_suppressHidingProtectedAppsAssertion, 0);
  objc_storeStrong((id *)&self->_multitaskingEnablementObserver, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_destroyWeak((id *)&self->_switcherCoordinator);
}

@end
