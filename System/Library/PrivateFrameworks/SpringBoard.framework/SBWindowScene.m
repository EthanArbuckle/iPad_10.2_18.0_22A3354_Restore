@implementation SBWindowScene

- (SBTransientOverlayPresenting)transientOverlayPresenter
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientOverlayPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBTransientOverlayPresenting *)v3;
}

- (BOOL)isInvalidating
{
  return self->_isInvalidating && !self->_isInvalidated;
}

- (BOOL)isInvalidated
{
  return self->_isInvalidated;
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutStateTransitionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBLayoutStateTransitionCoordinator *)v3;
}

- (SBMedusaHostedKeyboardWindowController)medusaHostedKeyboardWindowController
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "medusaHostedKeyboardWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBMedusaHostedKeyboardWindowController *)v3;
}

- (SBFloatingDockController)floatingDockController
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingDockController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBFloatingDockController *)v3;
}

- (SBSceneManager)sceneManager
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSceneManager *)v3;
}

- (SBWindowScenePIPManager)pictureInPictureManager
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pictureInPictureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBWindowScenePIPManager *)v3;
}

- (SBSceneLayoutStateProvider)layoutStateProvider
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSceneLayoutStateProvider *)v3;
}

- (SBSwitcherController)switcherController
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSwitcherController *)v3;
}

- (id)_abstractWindowSceneDelegate
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v10;

  -[SBWindowScene delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowScene.m"), 116, CFSTR("Delegate is nil or not the right type %@"), 0);

  }
  return v8;
}

- (BOOL)isExternalDisplayWindowScene
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SBWindowScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isExternal");

  return v5;
}

- (BOOL)isMainDisplayWindowScene
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SBWindowScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMainDisplay");

  return v5;
}

- (SBRecordingIndicatorManager)recordingIndicatorManager
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordingIndicatorManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBRecordingIndicatorManager *)v3;
}

- (FBSDisplayLayoutPublishing)displayLayoutPublisher
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayLayoutPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSDisplayLayoutPublishing *)v3;
}

void __58__SBWindowScene_DebuggingOnly__succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:skipIfEmpty:", v3, CFSTR("scene"), 1);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "session");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v5, CFSTR("persistentIdentifier"), 1);

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBWindowScene succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  SBWindowScene *v15;

  -[SBWindowScene _FBSScene](self, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v5, CFSTR("identifier"), 1);

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__SBWindowScene_DebuggingOnly__succinctDescriptionBuilder__block_invoke;
  v12[3] = &unk_1E8E9E270;
  v7 = v6;
  v13 = v7;
  v14 = v4;
  v15 = self;
  v8 = v4;
  v9 = (id)objc_msgSend(v7, "modifyProem:", v12);
  v10 = v7;

  return v10;
}

- (SBModalLibraryController)modalLibraryController
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modalLibraryController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBModalLibraryController *)v3;
}

- (SBMainDisplayLayoutStateManager)layoutStateManager
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutStateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBMainDisplayLayoutStateManager *)v3;
}

- (SBLockStateProviding)uiLockStateProvider
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uiLockStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBLockStateProviding *)v3;
}

- (BNBannerController)bannerController
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bannerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BNBannerController *)v3;
}

- (SBSystemPointerInteractionManager)systemPointerInteractionManager
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemPointerInteractionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSystemPointerInteractionManager *)v3;
}

- (SBLockScreenManager)lockScreenManager
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockScreenManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBLockScreenManager *)v3;
}

- (BOOL)_windowsIgnoreSceneClientOrientation
{
  return 1;
}

- (SBSystemGestureManager)systemGestureManager
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemGestureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSystemGestureManager *)v3;
}

- (SBSystemApertureController)systemApertureController
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemApertureController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSystemApertureController *)v3;
}

- (SBWindowHidingManager)windowHidingManager
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowHidingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBWindowHidingManager *)v3;
}

- (SBTraitsPipelineManager)traitsPipelineManager
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitsPipelineManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBTraitsPipelineManager *)v3;
}

- (TRAArbiter)traitsArbiter
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitsArbiter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TRAArbiter *)v3;
}

- (void)setInvalidating:(BOOL)a3
{
  void *v3;

  if (self->_isInvalidating && !a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't unvalidate an invalidating scene!"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBWindowScene setInvalidating:].cold.1(a2, (uint64_t)self, (uint64_t)v3);
    objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    self->_isInvalidating = a3;
  }
}

- (BOOL)isContinuityDisplayWindowScene
{
  void *v3;
  void *v4;
  char v5;
  int64_t v6;
  _BOOL4 v7;

  -[SBWindowScene session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAC9D8]);

  v6 = -[SBWindowScene _displayWindowingMode](self, "_displayWindowingMode");
  v7 = -[SBWindowScene isExternalDisplayWindowScene](self, "isExternalDisplayWindowScene");
  if (v7)
  {
    if (v6 == 1)
      LOBYTE(v7) = v5;
    else
      LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)isExtendedDisplayWindowScene
{
  void *v3;
  void *v4;
  char v5;
  int64_t v6;
  _BOOL4 v7;
  BOOL v8;

  -[SBWindowScene session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBWindowSceneSessionRoleExternalDisplay"));

  v6 = -[SBWindowScene _displayWindowingMode](self, "_displayWindowingMode");
  v7 = -[SBWindowScene isExternalDisplayWindowScene](self, "isExternalDisplayWindowScene");
  if (v6 == 1)
    v8 = v5;
  else
    v8 = 0;
  return v7 && v8;
}

- (CGPoint)convertPoint:(CGPoint)a3 toNeighboringDisplayWindowScene:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGPoint result;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v5 = a4;
  -[UIWindowScene _fbsDisplayConfiguration](self, "_fbsDisplayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWindowScene screen](self, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v33.origin.x = v9;
  v33.origin.y = v11;
  v33.size.width = v13;
  v33.size.height = v15;
  CGRectGetWidth(v33);
  v34.origin.x = v9;
  v34.origin.y = v11;
  v34.size.width = v13;
  v34.size.height = v15;
  CGRectGetHeight(v34);
  objc_msgSend(v5, "_fbsDisplayConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v35.origin.x = v19;
  v35.origin.y = v21;
  v35.size.width = v23;
  v35.size.height = v25;
  CGRectGetWidth(v35);
  v36.origin.x = v19;
  v36.origin.y = v21;
  v36.size.width = v23;
  v36.size.height = v25;
  CGRectGetHeight(v36);
  SBSConvertPointFromDisplayToNeighboringDisplay();
  v27 = v26;
  v29 = v28;

  v30 = v27;
  v31 = v29;
  result.y = v31;
  result.x = v30;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toNeighboringDisplayWindowScene:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect result;

  v5 = a4;
  -[UIWindowScene _fbsDisplayConfiguration](self, "_fbsDisplayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWindowScene screen](self, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v38.origin.x = v9;
  v38.origin.y = v11;
  v38.size.width = v13;
  v38.size.height = v15;
  CGRectGetWidth(v38);
  v39.origin.x = v9;
  v39.origin.y = v11;
  v39.size.width = v13;
  v39.size.height = v15;
  CGRectGetHeight(v39);
  objc_msgSend(v5, "_fbsDisplayConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v40.origin.x = v19;
  v40.origin.y = v21;
  v40.size.width = v23;
  v40.size.height = v25;
  CGRectGetWidth(v40);
  v41.origin.x = v19;
  v41.origin.y = v21;
  v41.size.width = v23;
  v41.size.height = v25;
  CGRectGetHeight(v41);
  SBSConvertRectFromDisplayToNeighboringDisplay();
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v34 = v27;
  v35 = v29;
  v36 = v31;
  v37 = v33;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (SBAlertItemsController)alertItemsController
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertItemsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBAlertItemsController *)v3;
}

- (SBAmbientPresentationController)ambientPresentationController
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ambientPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBAmbientPresentationController *)v3;
}

- (SBDisplayAppInteractionEventSource)appInteractionEventSource
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appInteractionEventSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBDisplayAppInteractionEventSource *)v3;
}

- (SBAssistantSceneControlling)assistantController
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assistantController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBAssistantSceneControlling *)v3;
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authenticationStatusProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBFAuthenticationStatusProvider *)v3;
}

- (SBControlCenterController)controlCenterController
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controlCenterController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBControlCenterController *)v3;
}

- (SBCoverSheetPresentationManager)coverSheetPresentationManager
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverSheetPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBCoverSheetPresentationManager *)v3;
}

- (CSCoverSheetViewController)coverSheetViewController
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverSheetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CSCoverSheetViewController *)v3;
}

- (SBHomeAffordanceInteractionManager)homeAffordanceInteractionManager
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeAffordanceInteractionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHomeAffordanceInteractionManager *)v3;
}

- (SBHomeScreenController)homeScreenController
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHomeScreenController *)v3;
}

- (SBLockedPointerManager)lockedPointerManager
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockedPointerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBLockedPointerManager *)v3;
}

- (SBModalAlertPresentationCoordinator)modalAlertPresentationCoordinator
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modalAlertPresentationCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBModalAlertPresentationCoordinator *)v3;
}

- (SBModalUIFluidDismissGestureManager)modalUIFluidDismissGestureManager
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modalUIFluidDismissGestureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBModalUIFluidDismissGestureManager *)v3;
}

- (SBReachabilitySceneOffsetProviding)reachabilitySceneOffsetProvider
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reachabilitySceneOffsetProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBReachabilitySceneOffsetProviding *)v3;
}

- (SBFSecureDisplayStateProviding)secureDisplayStateProvider
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secureDisplayStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBFSecureDisplayStateProviding *)v3;
}

- (SBWallpaperController)wallpaperController
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBWallpaperController *)v3;
}

- (SBFZStackResolver)zStackResolver
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zStackResolver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBFZStackResolver *)v3;
}

- (SBTransientUIInteractionManager)transientUIInteractionManager
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientUIInteractionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBTransientUIInteractionManager *)v3;
}

- (SBUICommandValidating)commandValidator
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandValidator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBUICommandValidating *)v3;
}

- (SBHardwareButtonBezelEffectsCoordinator)hardwareButtonBezelEffectsCoordinator
{
  void *v2;
  void *v3;

  -[SBWindowScene _abstractWindowSceneDelegate](self, "_abstractWindowSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hardwareButtonBezelEffectsCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHardwareButtonBezelEffectsCoordinator *)v3;
}

- (int64_t)_displayWindowingMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  v2 = (void *)SBApp;
  -[SBWindowScene _FBSScene](self, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "windowingModeForDisplay:", v5);

  return v6;
}

- (void)invalidate
{
  self->_isInvalidated = 1;
}

- (int64_t)keyboardFocusCoalitionAffinity
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;

  -[UIWindowScene _sbDisplayConfiguration](self, "_sbDisplayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMainDisplay");

  if ((v5 & 1) != 0)
    return 0;
  -[UIWindowScene _sbDisplayConfiguration](self, "_sbDisplayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isExternal");

  if ((v9 & 1) != 0)
    return 1;
  -[UIWindowScene _sbDisplayConfiguration](self, "_sbDisplayConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isContinuityDisplay");

  if (v12)
    return 2;
  else
    return 0;
}

- (BOOL)isEmbeddedScene
{
  void *v2;
  void *v3;
  char v4;

  -[UIWindowScene _sbDisplayConfiguration](self, "_sbDisplayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMainDisplay");

  return v4;
}

- (BOOL)isContinuityScene
{
  void *v2;
  void *v3;
  char v4;

  -[UIWindowScene _sbDisplayConfiguration](self, "_sbDisplayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isContinuityDisplay");

  return v4;
}

- (BOOL)isExternalDisplayScene
{
  void *v2;
  void *v3;
  char v4;

  -[UIWindowScene _sbDisplayConfiguration](self, "_sbDisplayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExternal");

  return v4;
}

- (void)setInvalidating:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBWindowScene.m");
  v16 = 1024;
  v17 = 56;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
