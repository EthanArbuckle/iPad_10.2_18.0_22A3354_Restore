@implementation SBAbstractWindowSceneDelegate

- (SBTransientOverlayPresenting)transientOverlayPresenter
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientOverlayPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBTransientOverlayPresenting *)v3;
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutStateTransitionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBLayoutStateTransitionCoordinator *)v3;
}

- (SBMedusaHostedKeyboardWindowController)medusaHostedKeyboardWindowController
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "medusaHostedKeyboardWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBMedusaHostedKeyboardWindowController *)v3;
}

- (SBFloatingDockController)floatingDockController
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingDockController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBFloatingDockController *)v3;
}

- (SBSceneLayoutStateProvider)layoutStateProvider
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSceneLayoutStateProvider *)v3;
}

- (SBSwitcherController)switcherController
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSwitcherController *)v3;
}

- (id)_sbWindowSceneContext
{
  return self->_windowSceneContext;
}

- (SBWindowScenePIPManager)pictureInPictureManager
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pictureInPictureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBWindowScenePIPManager *)v3;
}

- (SBSceneManager)sceneManager
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSceneManager *)v3;
}

- (SBRecordingIndicatorManager)recordingIndicatorManager
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordingIndicatorManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBRecordingIndicatorManager *)v3;
}

- (FBSDisplayLayoutPublishing)displayLayoutPublisher
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayLayoutPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSDisplayLayoutPublishing *)v3;
}

- (SBModalLibraryController)modalLibraryController
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modalLibraryController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBModalLibraryController *)v3;
}

- (SBMainDisplayLayoutStateManager)layoutStateManager
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutStateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBMainDisplayLayoutStateManager *)v3;
}

- (SBLockStateProviding)uiLockStateProvider
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uiLockStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBLockStateProviding *)v3;
}

- (void)_windowScene:(id)a3 windowWillBecomeVisible:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "_roleHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Window(%p) with role(%@) will become visible."), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogTraitsArbiter();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SBAbstractWindowSceneDelegate _windowScene:windowWillBecomeVisible:].cold.1();

  objc_msgSend(v5, "_roleHint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && SBTraitsArbiterOrientationActuationEnabledForRole(v10))
  {
    if (objc_msgSend(v5, "autorotates"))
      objc_msgSend(v5, "setAutorotates:forceUpdateInterfaceOrientation:", 0, 1);
    if ((objc_msgSend(v5, "isInterfaceAutorotationDisabled") & 1) == 0)
      objc_msgSend(v5, "beginDisablingInterfaceAutorotation");
  }
  if (-[SBAbstractWindowSceneDelegate _shouldManageParticipantWithRole:](self, "_shouldManageParticipantWithRole:", v11))
  {
    -[SBAbstractWindowSceneDelegate _participantForWindow:](self, "_participantForWindow:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      || (-[SBAbstractWindowSceneDelegate _acquireParticipantForWindow:reason:](self, "_acquireParticipantForWindow:reason:", v5, v8), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SBAbstractWindowSceneDelegate _traitsDelegateForWindowRole:](self, "_traitsDelegateForWindowRole:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "windowWillBecomeVisible:ownedParticipant:", v5, v12);

      objc_msgSend(v12, "setNeedsUpdatePreferencesWithReason:force:animate:", v8, 1, 0);
    }
  }

}

- (void)_windowScene:(id)a3 window:(id)a4 didUpdateSupportedInterfaceOrientations:(unint64_t)a5 preferredOrientation:(int64_t)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;

  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "_roleHint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BSInterfaceOrientationMaskDescription();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Window(%p) with role(%@) did update supportedInterfaceOrientations(%@))"), v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogTraitsArbiter();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[SBAbstractWindowSceneDelegate _windowScene:windowWillBecomeVisible:].cold.1();

  -[SBAbstractWindowSceneDelegate _participantForWindow:](self, "_participantForWindow:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = objc_msgSend(MEMORY[0x1E0CEABB0], "areAnimationsEnabled");
    objc_msgSend(v14, "role");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAbstractWindowSceneDelegate _traitsDelegateForWindowRole:](self, "_traitsDelegateForWindowRole:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "windowDidUpdateSupportedOrientations:ownedParticipant:", a5, v14);

    objc_msgSend(v14, "setNeedsUpdatePreferencesWithReason:animate:", v12, -[SBAbstractWindowSceneDelegate _isWindowContentVisible:](self, "_isWindowContentVisible:", v8) & v15);
    objc_msgSend(v14, "updatePreferencesIfNeeded");
  }

}

- (id)_participantForWindow:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_opt_class();
  SBSafeCast(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "traitsParticipant");
  else
    objc_msgSend(v3, "sb_traitsParticipant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_isWindowContentVisible:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  char v7;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast((uint64_t)v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "isContentHidden");
  else
    v6 = objc_msgSend(v3, "isHidden");
  v7 = v6 ^ 1;

  return v7;
}

- (void)_windowScene:(id)a3 windowDidBecomeVisible:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  SBLogTraitsArbiter();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBAbstractWindowSceneDelegate _windowScene:windowDidBecomeVisible:].cold.1(v4);

}

- (SBSystemPointerInteractionManager)systemPointerInteractionManager
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemPointerInteractionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSystemPointerInteractionManager *)v3;
}

- (SBLockScreenManager)lockScreenManager
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockScreenManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBLockScreenManager *)v3;
}

- (BNBannerController)bannerController
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bannerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BNBannerController *)v3;
}

- (SBSystemGestureManager)systemGestureManager
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemGestureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSystemGestureManager *)v3;
}

- (SBSystemApertureController)systemApertureController
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemApertureController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSystemApertureController *)v3;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (SBWindowHidingManager)windowHidingManager
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowHidingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBWindowHidingManager *)v3;
}

- (SBTraitsPipelineManager)traitsPipelineManager
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitsPipelineManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBTraitsPipelineManager *)v3;
}

- (TRAArbiter)traitsArbiter
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitsArbiter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TRAArbiter *)v3;
}

- (void)_windowScene:(id)a3 windowWillBecomeHidden:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "_roleHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Window(%p) with role(%@) will become hidden."), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogTraitsArbiter();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SBAbstractWindowSceneDelegate _windowScene:windowWillBecomeVisible:].cold.1();

  -[SBAbstractWindowSceneDelegate _participantForWindow:](self, "_participantForWindow:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "role");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SBAbstractWindowSceneDelegate _shouldHandleWindowWillBecomeHiddenForRole:](self, "_shouldHandleWindowWillBecomeHiddenForRole:", v12);

    if (v13)
    {
      objc_msgSend(v11, "role");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAbstractWindowSceneDelegate _traitsDelegateForWindowRole:](self, "_traitsDelegateForWindowRole:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "windowWillBecomeHidden:ownedParticipant:", v5, v11);

      objc_msgSend(v11, "setNeedsUpdatePreferencesWithReason:", v8);
    }
  }

}

- (void)_windowScene:(id)a3 windowWillAttach:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  SBLogTraitsArbiter();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SBAbstractWindowSceneDelegate _windowScene:windowWillAttach:].cold.1();

  v8 = objc_opt_class();
  v9 = v5;
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

  if (v11)
  {
    objc_msgSend(v11, "windowHidingManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_window:willAttachToScene:", v6, v9);

  }
}

- (double)_windowScene:(id)a3 levelForWindow:(id)a4 preferredLevel:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;

  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "_roleHint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Window(%p) with role(%@) did update windowLevel(%.1f)"), v7, v9, *(_QWORD *)&a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogTraitsArbiter();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SBAbstractWindowSceneDelegate _windowScene:windowWillBecomeVisible:].cold.1();

  -[SBAbstractWindowSceneDelegate _participantForWindow:](self, "_participantForWindow:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "role");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAbstractWindowSceneDelegate _traitsDelegateForWindowRole:](self, "_traitsDelegateForWindowRole:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowDidUpdatePreferredWindowLevel:ownedParticipant:", v13, a5);

    objc_msgSend(v13, "setNeedsUpdatePreferencesWithReason:", v10);
    objc_msgSend(v13, "updatePreferencesIfNeeded");
    objc_msgSend(v13, "currentZOrderLevel");
    a5 = v16;
  }

  return a5;
}

- (id)_acquireParticipantForWindow:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[SBAbstractWindowSceneDelegate _participantForWindow:](self, "_participantForWindow:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_roleHint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && !v8)
  {
    objc_msgSend(v6, "_sbWindowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "traitsArbiter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAbstractWindowSceneDelegate _traitsDelegateForWindowRole:](self, "_traitsDelegateForWindowRole:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "acquireParticipantWithRole:delegate:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBAbstractWindowSceneDelegate _setParticipant:forWindow:](self, "_setParticipant:forWindow:", v13, v6);
    objc_msgSend(v13, "role");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAbstractWindowSceneDelegate _traitsDelegateForWindowRole:](self, "_traitsDelegateForWindowRole:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setParticipant:ownedByWindow:", v13, v6);

    v8 = v13;
  }

  return v8;
}

- (SBAlertItemsController)alertItemsController
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertItemsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBAlertItemsController *)v3;
}

- (SBAmbientPresentationController)ambientPresentationController
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ambientPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBAmbientPresentationController *)v3;
}

- (SBDisplayAppInteractionEventSource)appInteractionEventSource
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appInteractionEventSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBDisplayAppInteractionEventSource *)v3;
}

- (SBAssistantSceneControlling)assistantController
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assistantController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBAssistantSceneControlling *)v3;
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authenticationStatusProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBFAuthenticationStatusProvider *)v3;
}

- (SBControlCenterController)controlCenterController
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controlCenterController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBControlCenterController *)v3;
}

- (SBCoverSheetPresentationManager)coverSheetPresentationManager
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverSheetPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBCoverSheetPresentationManager *)v3;
}

- (CSCoverSheetViewController)coverSheetViewController
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverSheetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CSCoverSheetViewController *)v3;
}

- (SBHomeAffordanceInteractionManager)homeAffordanceInteractionManager
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeAffordanceInteractionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHomeAffordanceInteractionManager *)v3;
}

- (SBHomeScreenController)homeScreenController
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHomeScreenController *)v3;
}

- (SBLockedPointerManager)lockedPointerManager
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockedPointerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBLockedPointerManager *)v3;
}

- (SBModalAlertPresentationCoordinator)modalAlertPresentationCoordinator
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modalAlertPresentationCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBModalAlertPresentationCoordinator *)v3;
}

- (SBModalUIFluidDismissGestureManager)modalUIFluidDismissGestureManager
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modalUIFluidDismissGestureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBModalUIFluidDismissGestureManager *)v3;
}

- (SBReachabilitySceneOffsetProviding)reachabilitySceneOffsetProvider
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reachabilitySceneOffsetProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBReachabilitySceneOffsetProviding *)v3;
}

- (SBFSecureDisplayStateProviding)secureDisplayStateProvider
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secureDisplayStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBFSecureDisplayStateProviding *)v3;
}

- (SBWallpaperController)wallpaperController
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBWallpaperController *)v3;
}

- (SBFZStackResolver)zStackResolver
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zStackResolver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBFZStackResolver *)v3;
}

- (SBTransientUIInteractionManager)transientUIInteractionManager
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientUIInteractionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBTransientUIInteractionManager *)v3;
}

- (SBUICommandValidating)commandValidator
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandValidator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBUICommandValidating *)v3;
}

- (SBHardwareButtonBezelEffectsCoordinator)hardwareButtonBezelEffectsCoordinator
{
  void *v2;
  void *v3;

  -[SBAbstractWindowSceneDelegate _sbWindowSceneContext](self, "_sbWindowSceneContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hardwareButtonBezelEffectsCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHardwareButtonBezelEffectsCoordinator *)v3;
}

- (SBAbstractWindowSceneDelegate)init
{
  SBAbstractWindowSceneDelegate *v2;
  SBAbstractWindowSceneDelegate *v3;
  uint64_t v4;
  SBTraitsPipelineManager *pipelineManager;
  uint64_t v6;
  TRAArbiter *traitsArbiter;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBAbstractWindowSceneDelegate;
  v2 = -[SBAbstractWindowSceneDelegate init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SBAbstractWindowSceneDelegate _pipelineManager](v2, "_pipelineManager");
    v4 = objc_claimAutoreleasedReturnValue();
    pipelineManager = v3->_pipelineManager;
    v3->_pipelineManager = (SBTraitsPipelineManager *)v4;

    -[SBAbstractWindowSceneDelegate _createTraitsArbiterWithPipelineManager:](v3, "_createTraitsArbiterWithPipelineManager:", v3->_pipelineManager);
    v6 = objc_claimAutoreleasedReturnValue();
    traitsArbiter = v3->_traitsArbiter;
    v3->_traitsArbiter = (TRAArbiter *)v6;

  }
  return v3;
}

- (void)setWindowScene:(id)a3
{
  SBWindowScene **p_windowScene;
  id WeakRetained;
  id obj;

  obj = a3;
  p_windowScene = &self->_windowScene;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  if (WeakRetained != obj)
    objc_storeWeak((id *)p_windowScene, obj);

}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (id)_sceneManagerForConnectingWindowScene:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (SBFIsShellSceneKitAvailable())
  {
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_FBSScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneManagerForDisplayIdentity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "_FBSScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transientLocalSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForSetting:", 4444);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)_configureNewPresentationBinderForWindowScene:(id)a3 sceneManager:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  SBRootWindowScenePresentationBinder *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  SBRootWindowScenePresentationBinder *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (SBFIsShellSceneKitAvailable())
  {
    objc_msgSend(v16, "_FBSScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "SSKDisplayEndpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [SBRootWindowScenePresentationBinder alloc];
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%p"), v12, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rootWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SBRootWindowScenePresentationBinder initWithIdentifier:priority:appearanceStyle:rootWindow:](v9, "initWithIdentifier:priority:appearanceStyle:rootWindow:", v13, -10, 0, v14);

    objc_msgSend(v6, "updatePresentationBinder:", v15);
  }

}

- (id)_displayLayoutPublisherForWindowScene:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAbstractWindowSceneDelegate.m"), 150, CFSTR("For subclasses to implement"));

  return 0;
}

- (void)_configureForConnectingWindowScene:(id)a3 windowSceneContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBAssistantSceneController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  SBSceneLayoutStateProvider *v18;
  void *v19;
  SBSceneLayoutStateProvider *v20;
  SBMainDisplayLayoutStateManager *v21;
  SBLayoutStateTransitionCoordinator *v22;
  SBWindowScenePIPManager *v23;
  void *v24;
  SBWindowScenePIPManager *v25;
  id v26;
  SBWindowHidingManager *v27;
  SBReachabilityUnsupportedSceneOffsetProvider *v28;
  SBPassthroughUICommandValidator *v29;
  void *v30;
  BSInvalidatable *v31;
  BSInvalidatable *pointerAssertion;
  SBHardwareButtonZStackClient *v33;
  void *v34;
  SBHardwareButtonZStackClient *v35;
  SBHardwareButtonZStackClient *hardwareButtonZStackClient;
  void *v37;
  void *v38;
  SBLockedPointerManager *v39;
  id v40;

  v40 = a3;
  v6 = a4;
  objc_msgSend(v6, "setTraitsArbiter:", self->_traitsArbiter);
  objc_msgSend(v6, "setTraitsPipelineManager:", self->_pipelineManager);
  if (SBFIsShellSceneKitAvailable())
  {
    objc_msgSend(v40, "_FBSScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "SSKDisplayEndpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setDelegate:", self);
  }
  -[SBAbstractWindowSceneDelegate _sceneManagerForConnectingWindowScene:](self, "_sceneManagerForConnectingWindowScene:", v40);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSceneManager:", v9);
  -[SBAbstractWindowSceneDelegate _configureNewPresentationBinderForWindowScene:sceneManager:](self, "_configureNewPresentationBinderForWindowScene:sceneManager:", v40, v9);
  -[SBAbstractWindowSceneDelegate _displayLayoutPublisherForConnectingWindowScene:](self, "_displayLayoutPublisherForConnectingWindowScene:", v40);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayLayoutPublisher:", v10);

  v11 = -[SBAssistantSceneController initWithWindowScene:]([SBAssistantSceneController alloc], "initWithWindowScene:", v40);
  objc_msgSend(v6, "setAssistantController:", v11);

  if (SBFIsShellSceneKitAvailable())
  {
    objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "connectedIdentities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)SBApp, "displayManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "connectedIdentities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v14, "bs_filter:", &__block_literal_global_65);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count") - 1;

  v17 = objc_msgSend(v40, "isExternalDisplayWindowScene");
  v18 = [SBSceneLayoutStateProvider alloc];
  +[SBMainDisplayLayoutStateManager _initialLayoutStateWithDisplayOrdinal:isDisplayExternal:](SBMainDisplayLayoutStateManager, "_initialLayoutStateWithDisplayOrdinal:isDisplayExternal:", v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SBSceneLayoutStateProvider initWithLayoutState:](v18, "initWithLayoutState:", v19);
  objc_msgSend(v6, "setLayoutStateProvider:", v20);

  v21 = objc_alloc_init(SBMainDisplayLayoutStateManager);
  objc_msgSend(v6, "setLayoutStateManager:", v21);

  v22 = -[SBLayoutStateTransitionCoordinator initWithWindowScene:]([SBLayoutStateTransitionCoordinator alloc], "initWithWindowScene:", v40);
  objc_msgSend(v6, "setLayoutStateTransitionCoordinator:", v22);

  v23 = [SBWindowScenePIPManager alloc];
  objc_msgSend((id)SBApp, "pictureInPictureCoordinator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[SBWindowScenePIPManager initWithGlobalCoordinator:](v23, "initWithGlobalCoordinator:", v24);

  objc_msgSend(v6, "setPictureInPictureManager:", v25);
  v26 = objc_alloc_init(MEMORY[0x1E0DA9F90]);
  objc_msgSend(v6, "setZStackResolver:", v26);
  v27 = -[SBWindowHidingManager initWithWindowScene:]([SBWindowHidingManager alloc], "initWithWindowScene:", v40);
  objc_msgSend(v6, "setWindowHidingManager:", v27);

  v28 = objc_alloc_init(SBReachabilityUnsupportedSceneOffsetProvider);
  objc_msgSend(v6, "setReachabilitySceneOffsetProvider:", v28);

  v29 = objc_alloc_init(SBPassthroughUICommandValidator);
  objc_msgSend(v6, "setCommandValidator:", v29);

  objc_msgSend((id)SBApp, "mousePointerManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "requestPointerActivationForScene:", v40);
  v31 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  pointerAssertion = self->_pointerAssertion;
  self->_pointerAssertion = v31;

  v33 = [SBHardwareButtonZStackClient alloc];
  +[SBHardwareButtonService sharedInstance](SBHardwareButtonService, "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[SBHardwareButtonZStackClient initWithZStackResolver:hardwareButtonService:](v33, "initWithZStackResolver:hardwareButtonService:", v26, v34);
  hardwareButtonZStackClient = self->_hardwareButtonZStackClient;
  self->_hardwareButtonZStackClient = v35;

  objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "windowSceneDidConnect:", v40);

  +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "windowSceneDidConnect:", v40);

  v39 = -[SBLockedPointerManager initWithWindowScene:]([SBLockedPointerManager alloc], "initWithWindowScene:", v40);
  objc_msgSend(v6, "setLockedPointerManager:", v39);
  objc_msgSend(v9, "windowSceneDidConnect:", v40);

}

BOOL __87__SBAbstractWindowSceneDelegate__configureForConnectingWindowScene_windowSceneContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sb_displayWindowingMode") == 1;
}

- (id)_pipelineManager
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAbstractWindowSceneDelegate.m"), 215, CFSTR("For subclasses to define"));

  return 0;
}

- (id)_traitsDelegateForWindowRole:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAbstractWindowSceneDelegate.m"), 220, CFSTR("For subclasses to define"));

  return 0;
}

- (BOOL)_shouldManageParticipantWithRole:(id)a3
{
  return 1;
}

- (BOOL)_shouldHandleWindowWillBecomeHiddenForRole:(id)a3
{
  return 1;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  SBAbstractWindowSceneDelegate *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  SBLogStartup();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v8;
    v17 = 2114;
    v18 = v6;
    v19 = 2114;
    v20 = self;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] connecting for: %{public}@; %{public}@",
      (uint8_t *)&v15,
      0x20u);

  }
  objc_msgSend((id)SBApp, "windowSceneManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_sceneWillConnect:", v6);

  v10 = objc_opt_class();
  v11 = v6;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  if (v13)
  {
    -[SBAbstractWindowSceneDelegate setWindowScene:](self, "setWindowScene:", v13);
    -[SBAbstractWindowSceneDelegate _commonSceneSetupForScene:](self, "_commonSceneSetupForScene:", v13);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__handleKeyShortcutHUDVisibilityDidPresent, *MEMORY[0x1E0CEB7E0], 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__handleKeyShortcutHUDVisibilityDidDismiss, *MEMORY[0x1E0CEB7D8], 0);

  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v4 = a3;
  v5 = objc_opt_class();
  v28 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v28;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  +[SBMainWorkspace sharedInstanceIfExists](SBMainWorkspace, "sharedInstanceIfExists");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyboardFocusController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ - %@"), v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suppressKeyboardFocusEvaluationForReason:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObserver:", self);

  -[BSInvalidatable invalidate](self->_pointerAssertion, "invalidate");
  objc_msgSend((id)SBApp, "windowSceneManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_sceneDidDisconnect:", v28);

  objc_msgSend(v7, "pictureInPictureManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "windowSceneDidDisconnect:", v7);

  objc_msgSend(v7, "assistantController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dismissAssistantViewIfNecessary");

  objc_msgSend(v8, "transientOverlayPresentationManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "windowSceneDidDisconnect:", v7);

  objc_msgSend(v8, "keyboardFocusController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "windowSceneDidDisconnect:", v7);

  objc_msgSend((id)SBApp, "bannerManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dismissAllBannersInWindowScene:animated:reason:", v7, 0, CFSTR("sceneDidDisconnect"));

  objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "windowSceneDidDisconnect:", v7);

  +[SBIconController sharedInstanceIfExists](SBIconController, "sharedInstanceIfExists");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "windowSceneDidDisconnect:", v7);

  objc_msgSend(v7, "lockedPointerManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "invalidate");

  objc_msgSend(v7, "medusaHostedKeyboardWindowController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "invalidate");
  objc_msgSend(v16, "invalidate");

}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
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
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  CGSize v37;
  CGSize v38;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "interfaceOrientation");
  objc_msgSend(v8, "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  if ((unint64_t)(v10 - 3) <= 1)
  {
    BSSizeSwap();
    v13 = v16;
    v15 = v17;
  }

  objc_msgSend(v9, "bounds");
  v19 = v18;
  v21 = v20;

  if ((unint64_t)(a5 - 3) <= 1)
  {
    BSSizeSwap();
    v19 = v22;
    v21 = v23;
  }
  if (v13 != v19 || v15 != v21)
  {
    SBLogDisplayScaleMapping();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "_sbDisplayConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "identity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37.width = v19;
      v37.height = v21;
      NSStringFromCGSize(v37);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v38.width = v13;
      v38.height = v15;
      NSStringFromCGSize(v38);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543874;
      v31 = v26;
      v32 = 2112;
      v33 = v27;
      v34 = 2112;
      v35 = v28;
      _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ changed from %@ to %@", (uint8_t *)&v30, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "postNotificationName:object:", CFSTR("SBWindowSceneSessionRoleExternalDisplay"), v8);

  }
}

- (void)_windowScene:(id)a3 windowWillDetach:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  SBLogTraitsArbiter();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SBAbstractWindowSceneDelegate _windowScene:windowWillDetach:].cold.1(v7);

  -[SBAbstractWindowSceneDelegate _participantForWindow:](self, "_participantForWindow:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "invalidate");
    -[SBAbstractWindowSceneDelegate _setParticipant:forWindow:](self, "_setParticipant:forWindow:", 0, v7);
  }
  v11 = objc_opt_class();
  v12 = v6;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  if (v14)
  {
    objc_msgSend(v14, "windowHidingManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_window:willDetachFromScene:", v7, v12);

  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "setActivationPolicyForParticipantsBelow:", 1);
  objc_msgSend(v4, "setHomeGestureConsumption:", 2);

}

- (void)displayEndpointDidUpdateRootWindow:(id)a3
{
  id WeakRetained;
  id v5;

  -[SBWindowSceneContext sceneManager](self->_windowSceneContext, "sceneManager", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  -[SBAbstractWindowSceneDelegate _configureNewPresentationBinderForWindowScene:sceneManager:](self, "_configureNewPresentationBinderForWindowScene:sceneManager:", WeakRetained, v5);

}

- (void)_commonSceneSetupForScene:(id)a3
{
  SBWindowSceneContext *v4;
  SBWindowSceneContext *windowSceneContext;
  SBWindowSceneContext *v6;
  id v7;

  v7 = a3;
  v4 = -[SBWindowSceneContext initWithScene:]([SBWindowSceneContext alloc], "initWithScene:", v7);
  windowSceneContext = self->_windowSceneContext;
  self->_windowSceneContext = v4;
  v6 = v4;

  -[SBAbstractWindowSceneDelegate _configureForConnectingWindowScene:windowSceneContext:](self, "_configureForConnectingWindowScene:windowSceneContext:", v7, v6);
}

- (void)_setParticipant:(id)a3 forWindow:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = a3;
  v6 = objc_opt_class();
  SBSafeCast(v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "_setTraitsParticipant:", v5);
  else
    objc_msgSend(v9, "sb_setTraitsParticipant:", v5);

}

- (void)_handleKeyShortcutHUDVisibilityDidPresent
{
  SBFZStackParticipant *v3;
  SBFZStackParticipant *keyShortcutHUDZStackParticipant;
  id v5;

  if (!self->_keyShortcutHUDZStackParticipant)
  {
    -[SBWindowSceneContext zStackResolver](self->_windowSceneContext, "zStackResolver");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acquireParticipantWithIdentifier:delegate:", 25, self);
    v3 = (SBFZStackParticipant *)objc_claimAutoreleasedReturnValue();
    keyShortcutHUDZStackParticipant = self->_keyShortcutHUDZStackParticipant;
    self->_keyShortcutHUDZStackParticipant = v3;

  }
}

- (void)_handleKeyShortcutHUDVisibilityDidDismiss
{
  SBFZStackParticipant *keyShortcutHUDZStackParticipant;
  SBFZStackParticipant *v4;

  keyShortcutHUDZStackParticipant = self->_keyShortcutHUDZStackParticipant;
  if (keyShortcutHUDZStackParticipant)
  {
    -[SBFZStackParticipant invalidate](keyShortcutHUDZStackParticipant, "invalidate");
    v4 = self->_keyShortcutHUDZStackParticipant;
    self->_keyShortcutHUDZStackParticipant = 0;

  }
}

- (id)_createTraitsArbiterWithPipelineManager:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x1E0DC0890];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithRolesProvider:inputsDataSource:drawingDataSource:", v5, v5, v5);
  objc_msgSend(v5, "setSceneDelegate:", self);
  objc_msgSend(v5, "setArbiter:", v6);
  objc_msgSend(v5, "setupDefaultPipelineForArbiter:", v6);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerAssertion, 0);
  objc_storeStrong((id *)&self->_windowSceneContext, 0);
  objc_storeStrong((id *)&self->_keyShortcutHUDZStackParticipant, 0);
  objc_storeStrong((id *)&self->_hardwareButtonZStackClient, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_pipelineManager, 0);
  objc_storeStrong((id *)&self->_traitsArbiter, 0);
}

- (void)_windowScene:windowWillAttach:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "Window(%p)(%{public}@) will attach.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)_windowScene:(void *)a1 windowWillDetach:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "_roleHint");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "Window(%p) with role(%{public}@) will detach.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)_windowScene:windowWillBecomeVisible:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_windowScene:(void *)a1 windowDidBecomeVisible:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "_roleHint");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "Window(%p) with role(%{public}@) did become visible.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)_acquireParticipantForWindow:reason:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1D0540000, v0, OS_LOG_TYPE_FAULT, "Role %{public}@ needs SpringBoard TraitsArbiter adoption", v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

@end
