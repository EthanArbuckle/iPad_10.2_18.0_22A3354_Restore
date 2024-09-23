@implementation SBUIController

- (SBWindow)window
{
  return (SBWindow *)self->_window;
}

+ (id)sharedInstance
{
  id v2;
  void *v3;
  SBUIController *v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x1E0D44730], "inUserSessionLoginUI") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v3 = (void *)__controllerInstance;
    if (!__controllerInstance)
    {
      kdebug_trace();
      v4 = [SBUIController alloc];
      v5 = (void *)__controllerInstance;
      __controllerInstance = (uint64_t)v4;

      kdebug_trace();
      v3 = (void *)__controllerInstance;
    }
    v2 = v3;
  }
  return v2;
}

- (SBIconController)iconController
{
  return self->_iconController;
}

+ (id)sharedInstanceIfExists
{
  return (id)__controllerInstance;
}

uint64_t __61__SBUIController_setHomeScreenAlpha_behaviorMode_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)setPointerInteractionsEnabled:(BOOL)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];

  if (self->_disallowsPointerInteraction != !a3)
  {
    self->_disallowsPointerInteraction = !a3;
    -[SBUIController iconController](self, "iconController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iconManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__SBUIController_setPointerInteractionsEnabled___block_invoke;
    v6[3] = &unk_1E8E9EE28;
    v6[4] = self;
    objc_msgSend(v4, "enumerateDisplayedIconViewsUsingBlock:", v6);

  }
}

- (void)setHomeScreenDimmingAlpha:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  id v13;
  void (**v14)(id, uint64_t, _QWORD);
  void (**v15)(_QWORD, _QWORD, _QWORD);
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  double v22;
  _QWORD v23[5];
  id v24;
  id v25;

  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  -[SBWindow rootViewController](self->_homeScreenDimmingWindow, "rootViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "alpha");
  if (v11 == a3)
  {
    if (v8)
      v8[2](v8, 1, 0);
  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __68__SBUIController_setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke;
    v23[3] = &unk_1E8E9EBD0;
    v23[4] = self;
    v13 = v10;
    v24 = v13;
    v14 = v8;
    v25 = v14;
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v23);
    -[SBWindow setHidden:](self->_homeScreenDimmingWindow, "setHidden:", 0);
    v16 = -[NSMutableSet count](self->_contentRequiringReasons, "count");
    if (a4 != 5 || v16)
    {
      v17 = (void *)MEMORY[0x1E0CEABB0];
      -[SBAppSwitcherSettings animationSettings](self->_switcherSettings, "animationSettings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "opacitySettings");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __68__SBUIController_setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke_2;
      v20[3] = &unk_1E8E9DE88;
      v21 = v13;
      v22 = a3;
      objc_msgSend(v17, "sb_animateWithSettings:mode:animations:completion:", v19, a4, v20, v15);

    }
    else
    {
      objc_msgSend(v13, "setAlpha:", a3);
      if (v14)
        v15[2](v15, 1, 0);
    }

  }
}

- (void)setHomeScreenBlurProgress:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  -[SBHomeScreenBackdropViewBase setBlurProgress:behaviorMode:completion:](self->_homeScreenBackdropView, "setBlurProgress:behaviorMode:completion:", a4, a5, a3);
}

- (void)setHomeScreenAlpha:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  double v15;

  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  -[SBUIController homeScreenScalingView](self, "homeScreenScalingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet count](self->_contentRequiringReasons, "count"))
  {
    v10 = (void *)MEMORY[0x1E0CEABB0];
    -[SBAppSwitcherSettings animationSettings](self->_switcherSettings, "animationSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "homeScreenOpacitySettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__SBUIController_setHomeScreenAlpha_behaviorMode_completion___block_invoke;
    v13[3] = &unk_1E8E9DE88;
    v14 = v9;
    v15 = a3;
    objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v12, a4, v13, v8);

  }
  else
  {
    objc_msgSend(v9, "setAlpha:", a3);
    if (v8)
      v8[2](v8, 1, 0);
  }

}

- (void)setHomeScreenScale:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  double v15;
  CGAffineTransform v16;

  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  -[SBUIController homeScreenScalingView](self, "homeScreenScalingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet count](self->_contentRequiringReasons, "count"))
  {
    v10 = (void *)MEMORY[0x1E0CEABB0];
    -[SBAppSwitcherSettings animationSettings](self->_switcherSettings, "animationSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "homeScreenScaleSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__SBUIController_setHomeScreenScale_behaviorMode_completion___block_invoke;
    v13[3] = &unk_1E8E9DE88;
    v14 = v9;
    v15 = a3;
    objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v12, a4, v13, v8);

  }
  else
  {
    CGAffineTransformMakeScale(&v16, a3, a3);
    objc_msgSend(v9, "setTransform:", &v16);
    if (v8)
      v8[2](v8, 1, 0);
  }

}

- (void)setHomeScreenBackdropBlurMaterialRecipeName:(id)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  SBAppSwitcherSettings *switcherSettings;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0CEABB0];
  switcherSettings = self->_switcherSettings;
  v11 = a5;
  -[SBAppSwitcherSettings animationSettings](switcherSettings, "animationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeScreenScaleSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__SBUIController_setHomeScreenBackdropBlurMaterialRecipeName_behaviorMode_completion___block_invoke;
  v15[3] = &unk_1E8E9E820;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v9, "sb_animateWithSettings:mode:animations:completion:", v13, a4, v15, v11);

}

uint64_t __61__SBUIController_setHomeScreenScale_behaviorMode_completion___block_invoke(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  return objc_msgSend(v1, "setTransform:", &v3);
}

void __86__SBUIController_setHomeScreenBackdropBlurMaterialRecipeName_behaviorMode_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_opt_class();
  SBSafeCast(v2, *(void **)(*(_QWORD *)(a1 + 32) + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setMaterialRecipeName:", *(_QWORD *)(a1 + 40));
    v3 = v4;
  }

}

- (void)beginRequiringContentForReason:(id)a3
{
  -[SBUIController beginRequiringContentForReason:options:](self, "beginRequiringContentForReason:options:", a3, 0);
}

uint64_t __71__SBUIController__activateWorkspaceEntity_fromIcon_location_validator___block_invoke_3(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return (*(uint64_t (**)(void))(v1 + 16))();
  else
    return 1;
}

- (void)setAllowIconRotation:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  -[SBUIController iconController](self, "iconController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeScreenViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowIconRotation:forReason:", v4, v6);

}

- (void)setHomeScreenAutorotatesEvenWhenIconIsDragging:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SBUIController iconController](self, "iconController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeScreenViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHomeScreenAutorotatesEvenWhenIconIsDragging:", v3);
  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")))
    objc_msgSend(v4, "_setNeedsUpdateOfSupportedInterfaceOrientations");

}

uint64_t __68__SBUIController_setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

void __48__SBUIController_setPointerInteractionsEnabled___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SBIconLocationGroupContainsLocation();

  if ((v4 & 1) == 0)
    objc_msgSend(v5, "setDisallowCursorInteraction:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 224));

}

- (void)cancelInProcessAnimations
{
  void *v3;

  -[SBUIController window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_removeAllRetargetableAnimations:", 1);

  -[SBWindow _removeAllRetargetableAnimations:](self->_homeScreenDimmingWindow, "_removeAllRetargetableAnimations:", 1);
  -[SBHomeScreenBackdropViewBase cancelInProcessAnimations](self->_homeScreenBackdropView, "cancelInProcessAnimations");
}

- (void)_updateRequireWallpaperRasterization
{
  _BOOL4 v3;
  BSInvalidatable *wallpaperRasterizationAssertion;
  BSInvalidatable *v5;
  BSInvalidatable *v6;
  BSInvalidatable *v7;
  void *v8;

  v3 = -[SBUIController isBackdropVisible](self, "isBackdropVisible");
  wallpaperRasterizationAssertion = self->_wallpaperRasterizationAssertion;
  if (v3)
  {
    if (!wallpaperRasterizationAssertion)
    {
      +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "requireWallpaperRasterizationWithReason:", CFSTR("SBUIControllerWallpaperRasterizationReason"));
      v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v6 = self->_wallpaperRasterizationAssertion;
      self->_wallpaperRasterizationAssertion = v5;

    }
  }
  else if (wallpaperRasterizationAssertion)
  {
    -[BSInvalidatable invalidate](wallpaperRasterizationAssertion, "invalidate");
    v7 = self->_wallpaperRasterizationAssertion;
    self->_wallpaperRasterizationAssertion = 0;

  }
}

- (BOOL)isBackdropVisible
{
  return -[SBHomeScreenBackdropViewBase requiresBackdropView](self->_homeScreenBackdropView, "requiresBackdropView")
      || -[SBHomeScreenBackdropViewBase requiresLiveBackdropView](self->_homeScreenBackdropView, "requiresLiveBackdropView");
}

- (void)beginRequiringLiveBackdropViewForReason:(id)a3
{
  -[SBHomeScreenBackdropViewBase beginRequiringLiveBackdropViewForReason:](self->_homeScreenBackdropView, "beginRequiringLiveBackdropViewForReason:", a3);
  -[SBUIController _updateRequireWallpaperRasterization](self, "_updateRequireWallpaperRasterization");
}

- (void)beginRequiringBackdropViewForReason:(id)a3
{
  -[SBHomeScreenBackdropViewBase beginRequiringBackdropViewForReason:](self->_homeScreenBackdropView, "beginRequiringBackdropViewForReason:", a3);
  -[SBUIController _updateRequireWallpaperRasterization](self, "_updateRequireWallpaperRasterization");
}

- (void)endRequiringBackdropViewForReason:(id)a3
{
  -[SBHomeScreenBackdropViewBase endRequiringBackdropViewForReason:](self->_homeScreenBackdropView, "endRequiringBackdropViewForReason:", a3);
  -[SBUIController _removeReachabilityEffectViewIfNecessary](self, "_removeReachabilityEffectViewIfNecessary");
  -[SBUIController _updateRequireWallpaperRasterization](self, "_updateRequireWallpaperRasterization");
}

- (void)endRequiringLiveBackdropViewForReason:(id)a3
{
  -[SBHomeScreenBackdropViewBase endRequiringLiveBackdropViewForReason:](self->_homeScreenBackdropView, "endRequiringLiveBackdropViewForReason:", a3);
  -[SBUIController _removeReachabilityEffectViewIfNecessary](self, "_removeReachabilityEffectViewIfNecessary");
  -[SBUIController _updateRequireWallpaperRasterization](self, "_updateRequireWallpaperRasterization");
}

- (void)_removeReachabilityEffectViewIfNecessary
{
  char v3;
  _BOOL4 v4;
  SBWallpaperEffectView *reachabilityWallpaperEffectView;
  SBWallpaperEffectView *v6;

  if (-[SBHomeScreenBackdropViewBase requiresBackdropView](self->_homeScreenBackdropView, "requiresBackdropView"))
    v3 = 0;
  else
    v3 = !-[SBHomeScreenBackdropViewBase requiresLiveBackdropView](self->_homeScreenBackdropView, "requiresLiveBackdropView");
  v4 = -[SBHomeScreenBackdropViewBase isOpaque](self->_homeScreenBackdropView, "isOpaque");
  if ((v3 & 1) != 0 || v4)
  {
    reachabilityWallpaperEffectView = self->_reachabilityWallpaperEffectView;
    if (reachabilityWallpaperEffectView)
    {
      -[SBWallpaperEffectView removeFromSuperview](reachabilityWallpaperEffectView, "removeFromSuperview");
      v6 = self->_reachabilityWallpaperEffectView;
      self->_reachabilityWallpaperEffectView = 0;

    }
  }
}

- (int64_t)interfaceOrientationForWallpaperController:(id)a3
{
  void *v3;
  int64_t v4;

  -[SBUIController window](self, "window", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");

  return v4;
}

- (void)tearDownIconListAndBar
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (!-[NSMutableSet count](self->_contentRequiringReasons, "count")
    || -[SBHomeScreenBackdropViewBase isOpaque](self->_homeScreenBackdropView, "isOpaque"))
  {
    SBLogUIController();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Tearing down home screen", v7, 2u);
    }

    -[SBUIController iconController](self, "iconController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeScreenViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIconContentHidden:", 1);
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deactivateOrientationSource:", 2);

  }
}

- (void)activateApplication:(id)a3 fromIcon:(id)a4 location:(id)a5 activationSettings:(id)a6 actions:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  SBRegionallyRestrictedAlertItem *v22;
  id v23;
  SBWebClipEligibilityAlertItem *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  SBDeviceApplicationSceneEntity *v37;
  int v38;
  char v39;
  _BOOL8 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  SBRegionallyRestrictedAlertItem *v45;
  void *v46;
  SBRegionallyRestrictedAlertItem *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  id v56;
  void (**v57)(_QWORD, SBRegionallyRestrictedAlertItem *);
  id v58;
  id v59;
  SBUIController *v60;
  SBUIController *v61;
  id v62;
  _QWORD v63[5];
  SBRegionallyRestrictedAlertItem *v64;
  id v65;
  id v66;
  id v67;
  SBRegionallyRestrictedAlertItem *v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  uint8_t buf[4];
  id v76;
  __int16 v77;
  id v78;
  __int16 v79;
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  SBLogUIController();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v76 = v12;
    v77 = 2112;
    v78 = v13;
    v79 = 2114;
    v80 = v14;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Activate application %@ from icon %@ location %{public}@", buf, 0x20u);
  }

  v18 = MEMORY[0x1E0C809B0];
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __83__SBUIController_activateApplication_fromIcon_location_activationSettings_actions___block_invoke;
  v72[3] = &unk_1E8E9EC18;
  v19 = v16;
  v73 = v19;
  v20 = v15;
  v74 = v20;
  v21 = (void *)MEMORY[0x1D17E5550](v72);
  if (objc_msgSend(v13, "isBookmarkIcon"))
  {
    v60 = self;
    v22 = (SBRegionallyRestrictedAlertItem *)v13;
    -[SBRegionallyRestrictedAlertItem webClip](v22, "webClip");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "eligibilityStatus") == 1)
    {
      v24 = -[SBWebClipEligibilityAlertItem initWithWebClip:]([SBWebClipEligibilityAlertItem alloc], "initWithWebClip:", v23);
      +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
      v25 = v21;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "activateAlertItem:", v24);

      v21 = v25;
LABEL_11:

      goto LABEL_24;
    }
    v55 = v14;
    -[SBRegionallyRestrictedAlertItem bookmark](v22, "bookmark");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v29, "isShortcutsWebClip") & 1) != 0)
    {
      -[SBRegionallyRestrictedAlertItem bookmark](v22, "bookmark");
      v58 = v13;
      v30 = v19;
      v31 = v21;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isSingleStepShortcutWebClip");

      v21 = v31;
      v19 = v30;
      v13 = v58;

      if ((v33 & 1) == 0)
      {
        -[SBUIController workflowClientFromWebClip:appToLaunch:](v60, "workflowClientFromWebClip:appToLaunch:", v23, v12);
        v24 = (SBWebClipEligibilityAlertItem *)objc_claimAutoreleasedReturnValue();
        -[SBWebClipEligibilityAlertItem start](v24, "start");
        v14 = v55;
        goto LABEL_11;
      }
    }
    else
    {

    }
    +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController](SBMainSwitcherControllerCoordinator, "_shim_activeSwitcherController");
    v59 = v20;
    v41 = v12;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "layoutStateApplicationSceneHandles");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "identifier");
    v54 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SBApp, "webClipService");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v18;
    v63[1] = 3221225472;
    v63[2] = __83__SBUIController_activateApplication_fromIcon_location_activationSettings_actions___block_invoke_2;
    v63[3] = &unk_1E8E9EC80;
    v71 = v21;
    v63[4] = v60;
    v45 = v22;
    v46 = v21;
    v47 = v45;
    v64 = v45;
    v65 = v55;
    v66 = v43;
    v67 = v42;
    v68 = v47;
    v21 = v46;
    v69 = v23;
    v70 = v41;
    v62 = v23;
    v48 = v42;
    v12 = v41;
    v20 = v59;
    v49 = v48;
    v50 = v43;
    v14 = v55;
    v23 = v50;
    objc_msgSend(v44, "prepareToLaunchWebClipWithIdentifier:handler:", v54, v63);

    v22 = (SBRegionallyRestrictedAlertItem *)v54;
    goto LABEL_24;
  }
  v57 = (void (**)(_QWORD, SBRegionallyRestrictedAlertItem *))v21;
  objc_msgSend(v12, "info");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isRegionallyRestricted");

  if (v28)
  {
    v22 = objc_alloc_init(SBRegionallyRestrictedAlertItem);
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateAlertItem:", v22);
    v21 = v57;
  }
  else
  {
    v61 = self;
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "inCallPresentationManager");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "count")
      || !objc_msgSend(v23, "hasOverrideAppSceneEntityForLaunchingApplication:", v12))
    {
      v53 = v12;
      v56 = v14;
      objc_msgSend(v20, "objectForActivationSetting:", 68);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sceneManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = [SBDeviceApplicationSceneEntity alloc];
      v38 = __sb__runningInSpringBoard();
      v39 = v38;
      if (v38)
      {
        v40 = SBFEffectiveDeviceClass() == 2;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v52, "userInterfaceIdiom") == 1;
      }
      objc_msgSend(v35, "_fbsDisplayIdentity");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[SBDeviceApplicationSceneEntity initWithApplication:generatingNewPrimarySceneIfRequired:sceneHandleProvider:displayIdentity:](v37, "initWithApplication:generatingNewPrimarySceneIfRequired:sceneHandleProvider:displayIdentity:", v53, v40, v36, v51);

      if ((v39 & 1) == 0)
      v12 = v53;
      v14 = v56;
    }
    else
    {
      objc_msgSend(v23, "overrideAppSceneEntityForLaunchingApplication:", v12);
      v22 = (SBRegionallyRestrictedAlertItem *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v57;
    v57[2](v57, v22);
    -[SBUIController _activateWorkspaceEntity:fromIcon:location:validator:](v61, "_activateWorkspaceEntity:fromIcon:location:validator:", v22, v13, v14, 0);
  }
LABEL_24:

}

- (void)endRequiringContentForReason:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIController.m"), 1054, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  SBLogUIController();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "End requiring home screen content for reason '%{public}@'", buf, 0xCu);
  }

  v7 = -[NSMutableSet count](self->_contentRequiringReasons, "count");
  -[NSMutableSet removeObject:](self->_contentRequiringReasons, "removeObject:", v5);
  v8 = -[NSMutableSet count](self->_contentRequiringReasons, "count");
  if (v7 && !v8)
    -[SBUIController tearDownIconListAndBar](self, "tearDownIconListAndBar");

}

- (void)beginRequiringContentForReason:(id)a3 options:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  NSMutableSet *contentRequiringReasons;
  NSMutableSet *v10;
  NSMutableSet *v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIController.m"), 1037, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  SBLogUIController();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Begin requiring home screen content for reason '%{public}@'", buf, 0xCu);
  }

  contentRequiringReasons = self->_contentRequiringReasons;
  if (!contentRequiringReasons)
  {
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11 = self->_contentRequiringReasons;
    self->_contentRequiringReasons = v10;

    contentRequiringReasons = self->_contentRequiringReasons;
  }
  v12 = -[NSMutableSet count](contentRequiringReasons, "count");
  -[NSMutableSet addObject:](self->_contentRequiringReasons, "addObject:", v7);
  if (!v12 || -[SBUIController isIconListViewTornDown](self, "isIconListViewTornDown"))
    -[SBUIController restoreContentWithOptions:](self, "restoreContentWithOptions:", a4);

}

- (BOOL)isIconListViewTornDown
{
  return -[UIView isHidden](self->_iconsView, "isHidden");
}

void __83__SBUIController_activateApplication_fromIcon_location_activationSettings_actions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "addActions:", v3);
  objc_msgSend(v4, "applyActivationSettings:", *(_QWORD *)(a1 + 40));

}

- (void)_activateWorkspaceEntity:(id)a3 fromIcon:(id)a4 location:(id)a5 validator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  char v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "deviceApplicationSceneEntity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activationSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForActivationSetting:", 68);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_fbsDisplayIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v15, "BOOLForActivationSetting:", 72);
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __71__SBUIController__activateWorkspaceEntity_fromIcon_location_validator___block_invoke;
  v27[3] = &unk_1E8E9ECD0;
  v27[4] = self;
  v28 = v11;
  v29 = v12;
  v30 = v10;
  v31 = v19;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __71__SBUIController__activateWorkspaceEntity_fromIcon_location_validator___block_invoke_3;
  v25[3] = &unk_1E8E9ECF8;
  v26 = v13;
  v21 = v13;
  v22 = v10;
  v23 = v12;
  v24 = v11;
  objc_msgSend(v20, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v18, v27, v25);

}

void __71__SBUIController__activateWorkspaceEntity_fromIcon_location_validator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  SBWorkspaceApplicationSceneTransitionContext *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  SBWorkspaceApplicationSceneTransitionContext *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "transitionSourceForIcon:iconLocation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (v4 == 1)
    objc_msgSend(*(id *)(a1 + 56), "setFlag:forActivationSetting:", 1, 38);
  objc_msgSend(v3, "setSource:", v4);
  objc_msgSend(v3, "setEventLabel:", CFSTR("SBUIApplicationIconLaunchEventLabel"));
  if (*(_BYTE *)(a1 + 64))
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6 = *(void **)(a1 + 56);
      objc_msgSend(v5, "leafIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forActivationSetting:", v7, 45);

    }
    v8 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
    v15[0] = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceApplicationSceneTransitionContext setEntities:startingAtLayoutRole:withPolicy:centerEntity:floatingEntity:](v8, "setEntities:startingAtLayoutRole:withPolicy:centerEntity:floatingEntity:", v9, 1, 1, v10, v11);

    -[SBWorkspaceApplicationSceneTransitionContext _setRequestedFrontmostEntity:](v8, "_setRequestedFrontmostEntity:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v3, "setApplicationContext:", v8);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__SBUIController__activateWorkspaceEntity_fromIcon_location_validator___block_invoke_2;
    v12[3] = &unk_1E8E9ECA8;
    v13 = (SBWorkspaceApplicationSceneTransitionContext *)*(id *)(a1 + 40);
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v3, "modifyApplicationContext:", v12);

    v8 = v13;
  }

}

- (int64_t)transitionSourceForIcon:(id)a3 iconLocation:(id)a4
{
  id v5;
  int64_t v6;
  uint64_t v8;

  v5 = a4;
  if ((objc_msgSend(a3, "isWidgetIcon") & 1) != 0)
  {
    v6 = 19;
  }
  else if ((SBIconLocationGroupContainsLocation() & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DAA990]) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DAA9A0]) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8 = *MEMORY[0x1E0DAA988];
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DAA988]) & 1) != 0)
      goto LABEL_9;
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DAA978]) & 1) != 0)
    {
      v6 = 42;
      goto LABEL_7;
    }
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DAA970]) & 1) != 0)
    {
      v6 = 41;
      goto LABEL_7;
    }
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DAA958]) & 1) != 0)
    {
      v6 = 38;
      goto LABEL_7;
    }
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DAA968]) & 1) != 0)
    {
      v6 = 40;
      goto LABEL_7;
    }
    if ((objc_msgSend(v5, "isEqualToString:", v8) & 1) != 0)
    {
LABEL_9:
      v6 = 39;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DAA998]) & 1) != 0)
    {
      v6 = 24;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions")) & 1) != 0)
    {
      v6 = 25;
    }
    else if (SBIconLocationGroupContainsLocation())
    {
      v6 = 46;
    }
    else
    {
      v6 = 0;
    }
  }
LABEL_7:

  return v6;
}

+ (id)zoomViewForDeviceApplicationSceneHandle:(id)a3 displayConfiguration:(id)a4 interfaceOrientation:(int64_t)a5 snapshot:(id)a6 snapshotSize:(CGSize)a7 statusBarDescriptor:(id)a8 decodeImage:(BOOL)a9 hasOrientationMismatchForClassicApp:(BOOL)a10 customContainerBounds:(CGRect)a11
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v20;
  double v21;
  id v24;
  id v25;
  id v26;
  id v27;
  double v28;
  double v29;
  void *v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  _BOOL4 v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  int v60;
  SBFullscreenZoomView *v61;
  void *v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  char v69;
  int64_t v70;
  double v71;
  double v72;
  double v73;
  char v74;
  double v75;
  double v76;
  CGFloat v77;
  uint64_t v78;
  CGFloat v79;
  double v80;
  double v81;
  double v82;
  double v83;
  uint64_t v84;
  double v85;
  double v86;
  double v87;
  uint64_t v88;
  void *v89;
  char v90;
  void *v91;
  void *v93;
  uint64_t v94;
  CGFloat v95;
  double v96;
  uint64_t v97;
  CGFloat v98;
  void *v99;
  BOOL v100;
  id v101;
  id v102;
  uint64_t v103;
  double v104;
  double v105;
  double v106;
  int64_t v107;
  CGFloat v108;
  BOOL v109;
  int64_t v110;
  double v111;
  double v112;
  double v113;
  double v114;
  __int128 v115;
  CGRect v116;
  CGRect v117;

  height = a11.size.height;
  width = a11.size.width;
  y = a11.origin.y;
  x = a11.origin.x;
  v20 = a7.height;
  v21 = a7.width;
  v109 = a10;
  v24 = a3;
  v25 = a4;
  v26 = a6;
  v27 = a8;
  if (v26)
  {
    objc_msgSend(v26, "referenceSize");
    if (v29 != v21 || v28 != v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBUIController+SBUIAnimationController.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!snapshot || CGSizeEqualToSize([snapshot referenceSize], snapshotSize)"));

    }
  }
  objc_msgSend(v24, "application");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isClassic");
  if (v32)
    objc_msgSend(v25, "bounds");
  else
    BSRectWithSize();
  v113 = v33;
  v114 = v34;
  v111 = v35;
  v112 = v36;
  v117.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v117.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D648] + 8);
  v37 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v38 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v116.origin.x = x;
  v116.origin.y = y;
  v116.size.width = width;
  v116.size.height = height;
  v95 = v117.origin.y;
  v97 = *MEMORY[0x1E0C9D648];
  v117.size.width = v37;
  v117.size.height = v38;
  v39 = CGRectEqualToRect(v116, v117);
  if (!v39)
  {
    v111 = width;
    v112 = height;
    v113 = x;
    v114 = y;
  }
  if (v26)
  {
    v100 = a9;
    v101 = v27;
    v40 = objc_msgSend(v26, "interfaceOrientation");
    if (v39)
      v41 = a5;
    else
      v41 = 0;
    if ((unint64_t)(a5 - 1) < 2 != (unint64_t)(v40 - 1) < 2)
      v42 = v40;
    else
      v42 = v41;
    v110 = v42;
    objc_msgSend(a1, "_effectiveStatusBarSettingsForSnapshot:sceneHandle:", v26, v24);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "statusBarEffectiveStyleRequestWithStyle:", _SBStatusBarStyleFromLegacyStyle(objc_msgSend(v43, "style")));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    BSRectWithSize();
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;
    objc_msgSend(v26, "contentFrame");
    v54 = v53;
    v105 = v55;
    v106 = v56;
    v58 = v57;
    v107 = a5;
    v99 = v43;
    if (v32 && !objc_msgSend(v31, "includesStatusBarInClassicJailForInterfaceOrientation:", a5))
    {
      v59 = 0;
      v60 = 1;
    }
    else
    {
      v59 = objc_msgSend(v43, "isHidden");
      v60 = 0;
    }
    objc_msgSend(a1, "statusBarFrameForSnapshotFrame:orientation:statusBarStyleRequest:hidden:", v110, v44, v59, v46, v48, v50, v52);
    v103 = v63;
    v104 = v64;
    v66 = v65;
    v108 = v67;
    v115 = SBUICUnitScaleFactor;
    objc_msgSend(v26, "name");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "isEqualToString:", CFSTR("SBSuspendSnapshot"));

    v102 = v25;
    if ((v69 & 1) != 0 || !v39)
    {
      v72 = v111;
      v71 = v112;
      if (v32)
      {
        LOBYTE(v32) = 0;
        v74 = 0;
        v109 = v39 && a10;
        v54 = v113;
        v75 = v114;
        v76 = v111;
        v77 = v37;
        v79 = v95;
        v78 = v97;
        v98 = v77;
        v108 = v38;
        v73 = v112;
LABEL_44:
        v88 = objc_msgSend(v44, "isDoubleHeight");
        objc_msgSend(v31, "info");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v89, "preventsLaunchInterfaceSplitting");

        BYTE4(v94) = v109;
        BYTE3(v94) = v74;
        BYTE2(v94) = v100;
        BYTE1(v94) = v32;
        LOBYTE(v94) = v90;
        v61 = -[SBFullscreenZoomView initWithContainingBounds:contentFrame:statusBarFrame:snapshot:snapshotOrientation:interfaceOrientation:doubleHeightStatusBar:allowStatusBarToOverlap:useLargerCornerRadii:preventSplit:needsZoomFilter:asyncDecodeImage:forJail:hasOrientationMismatchForClassicApp:]([SBFullscreenZoomView alloc], "initWithContainingBounds:contentFrame:statusBarFrame:snapshot:snapshotOrientation:interfaceOrientation:doubleHeightStatusBar:allowStatusBarToOverlap:useLargerCornerRadii:preventSplit:needsZoomFilter:asyncDecodeImage:forJail:hasOrientationMismatchForClassicApp:", v26, v110, v107, v88, v60 ^ 1u, objc_msgSend(v31, "classicAppWithRoundedCorners"), v113, v114, v72, v71, v54, v75, v76, v73, v78,
                *(_QWORD *)&v79,
                *(_QWORD *)&v98,
                *(_QWORD *)&v108,
                v94);
        -[SBFullscreenZoomView layer](v61, "layer");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "setAllowsGroupOpacity:", 0);

        v27 = v101;
        v25 = v102;
        goto LABEL_45;
      }
      v98 = v66;
      v74 = 0;
      v75 = v105;
      v76 = v106;
      v73 = v58;
    }
    else
    {
      if (v60)
        v70 = v107;
      else
        v70 = v110;
      v72 = v111;
      v71 = v112;
      v73 = v58;
      if (v32)
      {
        if (objc_msgSend(v31, "classicAppZoomedInOrRequiresHiDPI"))
          LOBYTE(v32) = objc_msgSend(v31, "classicAppZoomedIn");
        else
          LOBYTE(v32) = 0;
        objc_msgSend(v31, "snapshotFrameForClassicInsideBounds:forOrientation:scaleFactor:inReferenceSpace:", v70, &v115, 1, v113, v114, v111, v112);
        SBUICScaledRectWithOffset();
        v96 = v80;
        v105 = v81;
        v106 = v82;
        v73 = v83;
        SBUICScaledRectWithOffset();
        v103 = v84;
        v104 = v85;
        v98 = v86;
        v108 = v87;
        if (SBFEffectiveHomeButtonType() == 2
          && !objc_msgSend(v31, "classicAppNonFullScreenWithHomeAffordance"))
        {
          v74 = 0;
        }
        else
        {
          v74 = objc_msgSend(v31, "classicAppPhoneAppRunningOnPad") ^ 1;
        }
        v72 = v111;
        v71 = v112;
        v54 = v96;
      }
      else
      {
        v98 = v66;
        v74 = 0;
      }
      v75 = v105;
      v76 = v106;
    }
    v78 = v103;
    v79 = v104;
    goto LABEL_44;
  }
  v61 = -[SBZoomView _initWithFrame:]([SBZoomView alloc], "_initWithFrame:", v113, v114, v111, v112);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFullscreenZoomView setBackgroundColor:](v61, "setBackgroundColor:", v62);

LABEL_45:
  return v61;
}

+ (CGRect)statusBarFrameForSnapshotFrame:(CGRect)a3 remainderFrame:(CGRect *)a4 orientation:(int64_t)a5 statusBarStyleRequest:(id)a6 hidden:(BOOL)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  void *v15;
  CGFloat v16;
  double v17;
  CGPoint v18;
  CGSize v19;
  int v20;
  CGRectEdge v21;
  CGSize size;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect slice;
  CGRect v29;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a6;
  v15 = v14;
  v16 = 0.0;
  if (!a7)
  {
    objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", objc_msgSend(v14, "style"), a5);
    v16 = v17;
  }
  v18 = (CGPoint)*MEMORY[0x1E0C9D648];
  v19 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  if (a5 == 1)
    v20 = 1;
  else
    v20 = 3;
  if ((unint64_t)(a5 - 1) >= 2)
    v21 = 2 * (a5 != 4);
  else
    v21 = v20;
  v27.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v27.size = v19;
  slice.origin = v18;
  slice.size = v19;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  CGRectDivide(v29, &slice, &v27, v16, v21);
  if (a4)
  {
    size = v27.size;
    a4->origin = v27.origin;
    a4->size = size;
  }

  v23 = slice.origin.x;
  v24 = slice.origin.y;
  v25 = slice.size.width;
  v26 = slice.size.height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

+ (CGRect)statusBarFrameForSnapshotFrame:(CGRect)a3 orientation:(int64_t)a4 statusBarStyleRequest:(id)a5 hidden:(BOOL)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  objc_msgSend(a1, "statusBarFrameForSnapshotFrame:remainderFrame:orientation:statusBarStyleRequest:hidden:", 0, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (id)_effectiveStatusBarSettingsForSnapshot:(id)a3 sceneHandle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "statusBarSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && !objc_msgSend(v5, "contentType"))
  {
    v8 = v7;
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DA8F60]);
    objc_msgSend(v8, "setHidden:", objc_msgSend(v6, "defaultStatusBarHiddenForOrientation:", objc_msgSend(v5, "interfaceOrientation")));
    objc_msgSend(v8, "setStyle:", _SBStatusBarLegacyStyleFromStyle(objc_msgSend(v6, "defaultStatusBarStyle")));
  }

  return v8;
}

uint64_t __68__SBUIController_setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t result;

  if ((a3 & 1) == 0)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(*(id *)(a1 + 40), "alpha");
    objc_msgSend(v6, "setHidden:", BSFloatIsZero());
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

void __71__SBUIController__activateWorkspaceEntity_fromIcon_location_validator___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v3, "leafIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forActivationSetting:", v5, 45);

  }
  objc_msgSend(v6, "setActivatingEntity:", *(_QWORD *)(a1 + 40));

}

- (void)updateBatteryState:(id)a3
{
  id v4;
  char v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  float v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  char v31;
  void *v32;
  char v34;
  NSString *connectedWirelessChargerId;
  NSString *v36;
  unsigned int v37;
  int v38;
  int v39;
  _BOOL4 v40;
  void *v41;
  int v42;
  NSObject *v43;
  int v44;
  int v45;
  int v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  _BYTE *v54;
  char v55;
  int v56;
  NSObject *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  int v69;
  int v70;
  unsigned int v71;
  _QWORD v72[4];
  char v73;
  _QWORD block[4];
  BOOL v75;
  _QWORD v76[5];
  _QWORD v77[5];
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  uint8_t buf[4];
  int v83;
  __int16 v84;
  int v85;
  __int16 v86;
  _BOOL4 v87;
  __int16 v88;
  int v89;
  __int16 v90;
  int v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *((_BYTE *)self + 80);
  v6 = *((unsigned __int8 *)self + 81);
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "powerDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __hideACPower = objc_msgSend(v8, "hideACPower");

  objc_msgSend(v4, "objectForKey:", CFSTR("CurrentCapacity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "intValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("MaxCapacity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  v12 = fmax(fmin((float)((float)(int)v7 / (float)v11), 1.0), 0.0);
  self->_batteryCapacity = v12;
  objc_msgSend(v4, "objectForKey:", CFSTR("Voltage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v13, "intValue");

  if (__hideACPower)
  {
    *((_BYTE *)self + 80) &= ~0x10u;
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ExternalConnected"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "BOOLValue"))
      v15 = 16;
    else
      v15 = 0;
    *((_BYTE *)self + 80) = *((_BYTE *)self + 80) & 0xEF | v15;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("FullyCharged"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "BOOLValue"))
  {
    v17 = *((_BYTE *)self + 80);
  }
  else
  {
    v17 = *((_BYTE *)self + 80);
    if (self->_batteryCapacity <= 0.999)
    {
      v18 = 0;
      goto LABEL_12;
    }
  }
  v18 = 4;
LABEL_12:
  *((_BYTE *)self + 80) = v17 & 0xFB | v18;

  if (__hideACPower || (*((_BYTE *)self + 80) & 4) != 0)
  {
    *((_BYTE *)self + 80) &= ~2u;
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("IsCharging"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "BOOLValue"))
      v20 = 2;
    else
      v20 = 0;
    *((_BYTE *)self + 80) = *((_BYTE *)self + 80) & 0xFD | v20;

  }
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __37__SBUIController_updateBatteryState___block_invoke;
  v77[3] = &unk_1E8E9ED40;
  v77[4] = &v78;
  if (updateBatteryState__onceToken != -1)
    dispatch_once(&updateBatteryState__onceToken, v77);
  objc_msgSend(v4, "objectForKey:", CFSTR("ExternalConnected"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "BOOLValue") & 1) != 0)
  {
    v22 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ExternalChargeCapable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "BOOLValue") & 1) != 0)
    {
      v22 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("AdapterInfo"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v24, "intValue") == -536870201;

    }
  }

  if ((BKSDisplayServicesDisplayIsTethered() & 1) == 0)
    -[SBUIController setIsConnectedToUnsupportedChargingAccessory:](self, "setIsConnectedToUnsupportedChargingAccessory:", v22);
  if ((*((_BYTE *)self + 80) & 0x10) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ExternalChargeCapable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)self + 81) = *((_BYTE *)self + 81) & 0xFE | objc_msgSend(v26, "BOOLValue") ^ 1;

    v25 = *((unsigned __int8 *)self + 81);
  }
  else
  {
    v25 = *((_BYTE *)self + 81) & 0xFE;
    *((_BYTE *)self + 81) = v25;
  }
  if (((v25 ^ v6) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "postNotificationName:object:userInfo:", CFSTR("SBUIBatteryNotChargingStatusChangedNotification"), 0, 0);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("AdapterDetails"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKey:", CFSTR("FamilyCode"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "intValue");
  v31 = *((_BYTE *)self + 136);
  *((_BYTE *)self + 136) = v31 & 0xFE | (v30 == -536723453);
  if ((v30 == -536723453) == ((v31 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "postNotificationName:object:userInfo:", CFSTR("SBUIQiPowerStatusChangedNotification"), 0, 0);

  }
  if (v30 == -536723448 || v30 == -536723450)
    v34 = 4;
  else
    v34 = 0;
  *((_BYTE *)self + 81) = v34 | (8 * (v30 == -536723449)) | *((_BYTE *)self + 81) & 0xF3;
  if (v30 == -536723449 || v30 == -536723448 || v30 == -536723450)
    kdebug_trace();
  if ((*((_BYTE *)self + 81) & 4) != 0)
  {
    objc_msgSend(v28, "objectForKey:", CFSTR("Source"));
    v36 = (NSString *)objc_claimAutoreleasedReturnValue();
    connectedWirelessChargerId = self->_connectedWirelessChargerId;
    self->_connectedWirelessChargerId = v36;
  }
  else
  {
    connectedWirelessChargerId = self->_connectedWirelessChargerId;
    self->_connectedWirelessChargerId = 0;
  }

  v37 = *((unsigned __int8 *)self + 80);
  v38 = (v37 >> 4) & 1;
  if (v38 != (v5 & 0x10) >> 4)
  {
    v39 = 0;
    if ((v5 & 0x10) != 0 && (v6 & 8) != 0)
      v39 = (*((unsigned __int8 *)self + 81) >> 3) & 1;
    SBWorkspaceLogUsage(v38);
    v40 = -[SBUIController _isConnectedToWirelessCharging](self, "_isConnectedToWirelessCharging");
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "screenIsOn");

    SBLogCharging();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = (*((unsigned __int8 *)self + 80) >> 4) & 1;
      v45 = (*((unsigned __int8 *)self + 81) >> 1) & 1;
      *(_DWORD *)buf = 67110144;
      v83 = v44;
      v84 = 1024;
      v85 = (v5 & 0x10) >> 4;
      v86 = 1024;
      v87 = v40;
      v88 = 1024;
      v89 = v45;
      v90 = 1024;
      v91 = v42;
      _os_log_impl(&dword_1D0540000, v43, OS_LOG_TYPE_DEFAULT, "AC status changed (isOnAC: %{BOOL}u, wasOnAC: %{BOOL}u, isConnectedToWirelessCharging: %{BOOL}u, wasConnectedToWirelessCharging: %{BOOL}u, isScreenOn: %{BOOL}u) ䷼", buf, 0x20u);
    }

    v46 = (*((_BYTE *)self + 81) & 2) == 0 || v40;
    if (((v46 | v42) & 1) != 0)
    {
      if (((!v40 | ((*((_BYTE *)self + 81) & 2) >> 1)) & 1) == 0)
      {
        SBLogCharging();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v47, OS_LOG_TYPE_DEFAULT, "Connected to wireless charging accessory", buf, 2u);
        }

        -[SBFMotionAlarmController unregisterMotionAlarm](self->_motionAlarmController, "unregisterMotionAlarm");
        -[SBUIController _cancelDebounceWirelessChargingTimer](self, "_cancelDebounceWirelessChargingTimer");
      }
    }
    else
    {
      SBLogCharging();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v48, OS_LOG_TYPE_DEFAULT, "Wireless charging disconnection detected when screen was off", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "chargingSettings");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v50, "wirelessChargingDebounceDurationInSeconds");
      -[SBUIController _disableWirelessChargingChimeAndScreenWakeForDuration:](self, "_disableWirelessChargingChimeAndScreenWakeForDuration:");

    }
    if (v40)
      v51 = 2;
    else
      v51 = 0;
    *((_BYTE *)self + 81) = *((_BYTE *)self + 81) & 0xFD | v51;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "postNotificationName:object:userInfo:", CFSTR("SBUIACStatusChangedNotification"), 0, v4);

    if (v39)
      -[SBUIController _disableWirelessChargingChimeAndScreenWakeForDuration:withMotionAlarm:](self, "_disableWirelessChargingChimeAndScreenWakeForDuration:withMotionAlarm:", 0, 0.1);
    -[SBUIController ACPowerChanged](self, "ACPowerChanged");
    v37 = *((unsigned __int8 *)self + 80);
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("AtCriticalLevel"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (char *)self + 80;
  if (objc_msgSend(v53, "BOOLValue"))
    v55 = 8;
  else
    v55 = 0;
  *v54 = *((_BYTE *)self + 80) & 0xF7 | v55;

  v56 = (*v54 >> 3) & 1;
  if (v56 != ((v37 >> 3) & 1))
  {
    if (v56)
    {
      SBLogCharging();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[SBUIController updateBatteryState:].cold.1(v58, v59, v60, v61, v62, v63, v64, v65);

      v66 = -[SBUIController batteryCapacityAsPercentage](self, "batteryCapacityAsPercentage");
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __37__SBUIController_updateBatteryState___block_invoke_200;
      v76[3] = &unk_1E8E9DED8;
      v76[4] = self;
      +[SBBatteryLogger saveLowBatteryLogWithCapacity:voltage:completion:](SBBatteryLogger, "saveLowBatteryLogWithCapacity:voltage:completion:", v66, v71, v76);
    }
    else
    {
      SBLogCharging();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v57, OS_LOG_TYPE_DEFAULT, "Battery is no longer at critical level", buf, 2u);
      }

    }
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("CapacityEstimated"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v67;
  if ((*((_BYTE *)self + 80) & 8) == 0 && (!v67 || (objc_msgSend(v67, "BOOLValue") & 1) == 0))
    +[SBLowPowerAlertItem setBatteryLevel:](SBLowPowerAlertItem, "setBatteryLevel:", -[SBUIController batteryCapacityAsPercentage](self, "batteryCapacityAsPercentage"));
  v69 = -[SBUIController batteryCapacityAsPercentage](self, "batteryCapacityAsPercentage");
  if (updateBatteryState___prevIsFullyCharged != v69 > 89)
  {
    updateBatteryState___prevIsFullyCharged = v69 > 89;
    if (updateBatteryState__fullPowerToken != -1)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__SBUIController_updateBatteryState___block_invoke_206;
      block[3] = &__block_descriptor_33_e5_v8__0l;
      v75 = v69 > 89;
      dispatch_async((dispatch_queue_t)updateBatteryState__notificationQueue, block);
    }
  }
  if (v69 < 90)
  {
    if ((*((_BYTE *)self + 80) & 0x12) != 0 && (v5 & 0x10) == 0 && (v5 & 2) == 0)
    {
      _SBWorkspaceStartUsageTimesIfNecessary();
      _SBWorkspaceSetHavePartiallyCharged(1);
      goto LABEL_100;
    }
LABEL_99:
    _SBWorkspaceStartUsageTimesIfNecessary();
    goto LABEL_100;
  }
  if ((*((_BYTE *)self + 80) & 0x12) == 0)
  {
    if ((v5 & 0x12) != 0)
    {
      self->_batteryLoggingStartCapacity = -[SBUIController batteryCapacityAsPercentage](self, "batteryCapacityAsPercentage");
      _SBWorkspaceResetBatteryUsageTimes();
    }
    goto LABEL_99;
  }
  _SBWorkspaceResetBatteryUsageTimes();
LABEL_100:
  v70 = (*((_BYTE *)self + 80) & 0x12) != 0;
  if (updateBatteryState___prevIsPluggedIn != v70 || *((_BYTE *)v79 + 24))
  {
    kdebug_trace();
    updateBatteryState___prevIsPluggedIn = v70;
    if (updateBatteryState__pluggedInToken != -1)
    {
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __37__SBUIController_updateBatteryState___block_invoke_2_208;
      v72[3] = &__block_descriptor_33_e5_v8__0l;
      v73 = v70;
      dispatch_async((dispatch_queue_t)updateBatteryState__notificationQueue, v72);
    }
  }

  _Block_object_dispose(&v78, 8);
}

- (int)batteryCapacityAsPercentage
{
  return (int)fminf(ceilf(self->_batteryCapacity * 100.0), 100.0);
}

- (void)setIsConnectedToUnsupportedChargingAccessory:(BOOL)a3
{
  unsigned int v3;
  char v5;
  int IsSystemBootComplete;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SBDismissOnlyAlertItem *v12;
  void *v13;
  SBDismissOnlyAlertItem *v14;
  void *v15;
  void *v16;
  SBDismissOnlyAlertItem *v17;
  SBDismissOnlyAlertItem *unsupportedChargerAlert;
  void *v19;
  void *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = *((unsigned __int8 *)self + 80);
  if (a3 != v3 >> 7)
  {
    if (a3)
      v5 = 0x80;
    else
      v5 = 0;
    *((_BYTE *)self + 80) = v5 & 0x80 | v3 & 0x7F;
    IsSystemBootComplete = SBWorkspaceIsSystemBootComplete();
    v7 = *((char *)self + 80);
    if (IsSystemBootComplete)
    {
      if (v7 < 0)
      {
        +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isUILocked"))
        {
          v21 = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "unlockUIFromSource:withOptions:", 21, v10);

        }
        else
        {
          +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "resetIdleTimerForReason:", CFSTR("SBUIConnectToUnsupportedChargingAccessory"));

          v14 = [SBDismissOnlyAlertItem alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("UNSUPPORTED_CHARGING_ACCESSORY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[SBDismissOnlyAlertItem initWithTitle:body:](v14, "initWithTitle:body:", v16, 0);
          unsupportedChargerAlert = self->_unsupportedChargerAlert;
          self->_unsupportedChargerAlert = v17;

          +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "activateAlertItem:", self->_unsupportedChargerAlert);

        }
        goto LABEL_14;
      }
    }
    else if (v7 < 0)
    {
LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "postNotificationName:object:", CFSTR("SBUIUnsupportedChargingAccessoryStatusChangedNotification"), 0);

      return;
    }
    if (self->_unsupportedChargerAlert)
    {
      +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deactivateAlertItem:", self->_unsupportedChargerAlert);

      v12 = self->_unsupportedChargerAlert;
      self->_unsupportedChargerAlert = 0;

    }
    goto LABEL_14;
  }
}

- (BOOL)isBatteryCharging
{
  return (*((unsigned __int8 *)self + 80) >> 1) & 1;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0DA9E38], "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeKeyObserver:", self);

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forVariant:", self, 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB320], 0);
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB090], 0);
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB098], 0);
  notify_cancel(self->_powerStateUpdateToken);
  notify_cancel(self->_firmwareUpdateStateToken);
  -[BSAbsoluteMachTimer invalidate](self->_accessoryAttachmentAnimationBlockingTimer, "invalidate");

  v8.receiver = self;
  v8.super_class = (Class)SBUIController;
  -[SBUIController dealloc](&v8, sel_dealloc);
}

- (SBUIController)init
{
  SBUIController *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  SBIconController *v7;
  void *v8;
  SBHomeScreenViewController *v9;
  uint64_t v10;
  UIView *iconsView;
  uint64_t v12;
  UIView *contentView;
  SBHomeScreenWindow *v14;
  SBHomeScreenWindow *window;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableSet *contentRequiringReasons;
  uint64_t v20;
  SBAppSwitcherSettings *switcherSettings;
  BCBatteryDeviceController *v22;
  BCBatteryDeviceController *batteryDeviceController;
  NSObject *v24;
  void *v25;
  NSMutableDictionary *v26;
  NSMutableDictionary *powerSourceHasChimed;
  uint64_t v28;
  int *v29;
  int *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  int *v54;
  _QWORD handler[4];
  int *v56;
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)SBUIController;
  v2 = -[SBUIController init](&v57, sel_init);
  if (v2)
  {
    v2->_supportsDetailedBatteryCapacity = MGGetBoolAnswer();
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "restrictionController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginPostingChanges");

    objc_msgSend((id)SBApp, "windowSceneManager");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "connectedWindowScenes");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "bs_firstObjectPassingTest:", &__block_literal_global_9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SBApp, "userSessionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isLoginSession");

    if ((v6 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v7 = -[SBIconController initWithMainDisplayWindowScene:]([SBIconController alloc], "initWithMainDisplayWindowScene:", v4);
      objc_storeStrong((id *)&v2->_iconController, v7);
    }
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBatteryMonitoringEnabled:", 1);

    if ((SBFIsOnenessHomeScreenOnEmbeddedAvailable() & 1) == 0)
    {
      if (v6)
      {
        v9 = -[SBHomeScreenViewController initWithWindowScene:iconController:iconManager:userInterfaceController:]([SBHomeScreenViewController alloc], "initWithWindowScene:iconController:iconManager:userInterfaceController:", v4, 0, 0, v2);
      }
      else
      {
        -[SBIconController homeScreenViewController](v7, "homeScreenViewController");
        v9 = (SBHomeScreenViewController *)objc_claimAutoreleasedReturnValue();
        -[SBHomeScreenViewController iconContentView](v9, "iconContentView");
        v10 = objc_claimAutoreleasedReturnValue();
        iconsView = v2->_iconsView;
        v2->_iconsView = (UIView *)v10;

      }
      -[SBHomeScreenViewController view](v9, "view");
      v12 = objc_claimAutoreleasedReturnValue();
      contentView = v2->_contentView;
      v2->_contentView = (UIView *)v12;

      v14 = -[SBWindow initWithWindowScene:rootViewController:role:debugName:]([SBHomeScreenWindow alloc], "initWithWindowScene:rootViewController:role:debugName:", v4, v9, CFSTR("SBTraitsParticipantRoleHomeScreen"), CFSTR("HomeScreen"));
      window = v2->_window;
      v2->_window = v14;

      -[SBHomeScreenWindow setOpaque:](v2->_window, "setOpaque:", 0);
      -[SBHomeScreenWindow setWindowLevel:](v2->_window, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + -2.0);
      -[SBWindow makeKeyAndVisible](v2->_window, "makeKeyAndVisible");
      objc_msgSend(v4, "statusBarManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layoutManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setOrientationWindow:forStatusBarLayoutLayer:", v2->_window, 0);
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", CFSTR("SBUIHomeScreenActiveContentRequirementReason"), 0);
      contentRequiringReasons = v2->_contentRequiringReasons;
      v2->_contentRequiringReasons = (NSMutableSet *)v18;

      -[SBUIController _setupHomeScreenContentBackdropView](v2, "_setupHomeScreenContentBackdropView");
      -[SBUIController _setupHomeScreenDimmingWindow](v2, "_setupHomeScreenDimmingWindow");

    }
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v20 = objc_claimAutoreleasedReturnValue();
    switcherSettings = v2->_switcherSettings;
    v2->_switcherSettings = (SBAppSwitcherSettings *)v20;

    -[PTSettings addKeyObserver:](v2->_switcherSettings, "addKeyObserver:", v2);
    v22 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x1E0D01B20]);
    batteryDeviceController = v2->_batteryDeviceController;
    v2->_batteryDeviceController = v22;

    v24 = MEMORY[0x1E0C80D38];
    -[BCBatteryDeviceController addBatteryDeviceObserver:queue:](v2->_batteryDeviceController, "addBatteryDeviceObserver:queue:", v2, MEMORY[0x1E0C80D38]);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v2, sel_noteStatusBarHeightChanged_, *MEMORY[0x1E0CEB320], 0);
    objc_msgSend(v25, "addObserver:selector:name:object:", v2, sel__reduceMotionStatusDidChange_, *MEMORY[0x1E0CEB090], 0);
    objc_msgSend(v25, "addObserver:selector:name:object:", v2, sel__backgroundContrastDidChange_, *MEMORY[0x1E0CEB098], 0);
    objc_msgSend(v25, "addObserver:selector:name:object:", v2, sel__deviceUILocked, CFSTR("SBLockScreenUIDidLockNotification"), 0);
    objc_msgSend(v25, "addObserver:selector:name:object:", v2, sel__preferredContentSizeDidChange_, *MEMORY[0x1E0CEB3F0], 0);
    v2->_chargingChimeEnabled = 1;
    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    powerSourceHasChimed = v2->_powerSourceHasChimed;
    v2->_powerSourceHasChimed = v26;

    v2->_powerStateUpdateToken = -1;
    v28 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __22__SBUIController_init__block_invoke_2;
    handler[3] = &unk_1E8E9EBA8;
    v29 = v2;
    v56 = v29;
    notify_register_dispatch("com.apple.system.powersources.timeremaining", &v2->_powerStateUpdateToken, v24, handler);

    v29[63] = -1;
    v53[0] = v28;
    v53[1] = 3221225472;
    v53[2] = __22__SBUIController_init__block_invoke_112;
    v53[3] = &unk_1E8E9EBA8;
    v30 = v29;
    v54 = v30;
    notify_register_dispatch("com.apple.accessoryUpdater.uarp.firmareUpdateApplied", v29 + 63, v24, v53);

    +[SBModelessSyncController sharedInstance](SBModelessSyncController, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "beginMonitoring");

    objc_msgSend(MEMORY[0x1E0DA9E38], "rootSettings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addKeyObserver:", v30);

    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setWindowScene:", v4);
    objc_msgSend(v33, "addObserver:forVariant:", v30, 1);
    objc_msgSend(v33, "setOrientationProvider:forSource:", v30, 2);
    objc_msgSend(v33, "activateOrientationSource:", 2);
    objc_msgSend(v30, "_updateLegibility");
    objc_msgSend(MEMORY[0x1E0DAA3E8], "warmupIfNecessary");
    objc_msgSend(MEMORY[0x1E0DAA3B8], "warmupIfNecessary");
    objc_msgSend((id)SBApp, "volumeControl");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)*((_QWORD *)v30 + 19);
    *((_QWORD *)v30 + 19) = v34;

    objc_msgSend((id)SBApp, "HUDController");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)*((_QWORD *)v30 + 18);
    *((_QWORD *)v30 + 18) = v36;

    if (SBFEffectiveHomeButtonType() == 1)
    {
      v38 = objc_alloc_init(MEMORY[0x1E0CEA600]);
      v39 = (void *)*((_QWORD *)v30 + 8);
      *((_QWORD *)v30 + 8) = v38;

      objc_msgSend(*((id *)v30 + 8), "addProgressObserver:", v30);
    }
    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObserver:", v30);

    v41 = (void *)*((_QWORD *)v30 + 38);
    *((_QWORD *)v30 + 38) = 0;

    v42 = (void *)*((_QWORD *)v30 + 39);
    *((_QWORD *)v30 + 39) = 0;

    v43 = objc_opt_new();
    v44 = (void *)*((_QWORD *)v30 + 34);
    *((_QWORD *)v30 + 34) = v43;

    objc_msgSend(*((id *)v30 + 34), "setDelegate:", v30);
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "chargingSettings");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "accessoryAnimationBlockingDurationAfterBootInSeconds");
    objc_msgSend(v30, "_setAccessoryAttachmentAnimationBlockingTimerWithDuration:");
    +[SBAccessoryConnectionInfoProvider sharedInstance](SBAccessoryConnectionInfoProvider, "sharedInstance");
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)*((_QWORD *)v30 + 32);
    *((_QWORD *)v30 + 32) = v47;

    objc_msgSend(*((id *)v30 + 32), "addObserver:", v30);
  }
  return v2;
}

uint64_t __22__SBUIController_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMainDisplayWindowScene");
}

_BYTE *__22__SBUIController_init__block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  _BYTE *result;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_isConnectedToWirelessCharging");
  SBLogCharging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(unsigned __int8 *)(v4 + 280);
    LODWORD(v4) = (*(unsigned __int8 *)(v4 + 80) >> 4) & 1;
    v7[0] = 67109632;
    v7[1] = v5;
    v8 = 1024;
    v9 = v4;
    v10 = 1024;
    v11 = v2;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "isChimeDisabled: %{BOOL}u, isOnAC: %{BOOL}u, isConnectedToWirelessCharging: %{BOOL}u", (uint8_t *)v7, 0x14u);
  }

  result = *(_BYTE **)(a1 + 32);
  if (!result[280])
    return (_BYTE *)objc_msgSend(result, "playChargingChimeIfAppropriate");
  if (v2)
    return (_BYTE *)objc_msgSend(result, "_resetWirelessChargingState");
  return result;
}

void __22__SBUIController_init__block_invoke_112(uint64_t a1)
{
  NSObject *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  int v9;
  _DWORD v10[7];

  *(_QWORD *)&v10[5] = *MEMORY[0x1E0C80C00];
  SBLogCharging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 81);
    v9 = 67109376;
    v10[0] = (v3 >> 3) & 1;
    LOWORD(v10[1]) = 1024;
    *(_DWORD *)((char *)&v10[1] + 2) = (v3 >> 2) & 1;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "kUarpFirmwareUpdateAppliedNotification is received when _isConnectedToWirelessInternalChargingAccessory: %{BOOL}u, _isConnectedToWirelessInternalCharger: %{BOOL}u", (uint8_t *)&v9, 0xEu);
  }

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 81) & 0xC) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chargingSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "wirelessChargingFirmwareUpdateDebounceDurationInSeconds");
    v7 = v6;
    SBLogCharging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      *(double *)v10 = v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Disabling chime and screen wake for %f seconds", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_disableWirelessChargingChimeAndScreenWakeForDuration:", v7);
  }
}

- (void)setWindowScene:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_windowScene, obj);
    -[SBHomeScreenWindow setWindowScene:](self->_window, "setWindowScene:", obj);
    -[SBWindow setWindowScene:](self->_homeScreenDimmingWindow, "setWindowScene:", obj);
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIController windowScene](self, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWindowScene:", v6);

    objc_msgSend(obj, "statusBarManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setOrientationWindow:forStatusBarLayoutLayer:", self->_window, 0);
  }

}

- (void)_willRevealOrHideContentView
{
  void *v2;
  id v3;

  -[SBUIController iconController](self, "iconController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllFolderScrolling");

}

- (void)_setupHomeScreenDimmingWindow
{
  void *v3;
  void *v4;
  void *v5;
  SBWindow *v6;
  void *v7;
  SBWindow *v8;
  SBWindow *homeScreenDimmingWindow;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x1E0CEABB8]);
  objc_msgSend(v10, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v10, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  v6 = [SBWindow alloc];
  -[SBUIController windowScene](self, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBWindow initWithWindowScene:rootViewController:role:debugName:](v6, "initWithWindowScene:rootViewController:role:debugName:", v7, v10, CFSTR("SBTraitsParticipantRoleHomeScreenDimming"), CFSTR("HomeScreenDimming"));
  homeScreenDimmingWindow = self->_homeScreenDimmingWindow;
  self->_homeScreenDimmingWindow = v8;

  -[SBWindow setWindowLevel:](self->_homeScreenDimmingWindow, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + -2.0 + 1.0);
  -[SBWindow bs_setHitTestingDisabled:](self->_homeScreenDimmingWindow, "bs_setHitTestingDisabled:", 1);

}

- (void)_setupHomeScreenContentBackdropView
{
  _BOOL4 IsReduceTransparencyEnabled;
  __objc2_class **v4;
  id v5;
  SBHomeScreenBackdropViewBase *v6;
  SBHomeScreenBackdropViewBase *homeScreenBackdropView;

  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  v4 = off_1E8E96688;
  if (!IsReduceTransparencyEnabled)
    v4 = off_1E8E96690;
  v5 = objc_alloc(*v4);
  -[UIView bounds](self->_contentView, "bounds");
  v6 = (SBHomeScreenBackdropViewBase *)objc_msgSend(v5, "initWithFrame:");
  homeScreenBackdropView = self->_homeScreenBackdropView;
  self->_homeScreenBackdropView = v6;

  -[SBHomeScreenBackdropViewBase setAutoresizingMask:](self->_homeScreenBackdropView, "setAutoresizingMask:", 18);
  -[SBHomeScreenBackdropViewBase bs_setHitTestingDisabled:](self->_homeScreenBackdropView, "bs_setHitTestingDisabled:", 1);
  -[SBHomeScreenBackdropViewBase setDelegate:](self->_homeScreenBackdropView, "setDelegate:", self);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_homeScreenBackdropView);
}

- (void)setLockScreenScale:(double)a3 withDuration:(double)a4 behaviorMode:(int64_t)a5 completion:(id)a6
{
  void *v9;
  SBAppSwitcherSettings *switcherSettings;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[6];

  v9 = (void *)MEMORY[0x1E0CEABB0];
  switcherSettings = self->_switcherSettings;
  v11 = a6;
  -[SBAppSwitcherSettings animationSettings](switcherSettings, "animationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeScreenScaleSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__SBUIController_setLockScreenScale_withDuration_behaviorMode_completion___block_invoke;
  v14[3] = &__block_descriptor_48_e5_v8__0l;
  *(double *)&v14[4] = a3;
  *(double *)&v14[5] = a4;
  objc_msgSend(v9, "sb_animateWithSettings:mode:animations:completion:", v13, a5, v14, v11);

}

void __74__SBUIController_setLockScreenScale_withDuration_behaviorMode_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lockScreenEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spotlightPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateScaleViewWithScale:withDuration:", *(double *)(a1 + 32), *(double *)(a1 + 40));

}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3)
    a3->var6 = 0;
}

- (id)workflowClientFromWebClip:(id)a3 appToLaunch:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  Class (*v19)(uint64_t);
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a3;
  v6 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v7 = (void *)getWFSpringBoardWebClipMetadataClass_softClass;
  v25 = getWFSpringBoardWebClipMetadataClass_softClass;
  if (!getWFSpringBoardWebClipMetadataClass_softClass)
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __getWFSpringBoardWebClipMetadataClass_block_invoke;
    v20 = &unk_1E8E9ED40;
    v21 = &v22;
    __getWFSpringBoardWebClipMetadataClass_block_invoke((uint64_t)&v17);
    v7 = (void *)v23[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v22, 8);
  v9 = [v8 alloc];
  objc_msgSend(v5, "shortcutIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithShortcutIdentifier:applicationIdentifier:appIsInstalled:", v10, v11, v6 != 0);

  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v13 = (void *)getWFSpringBoardWorkflowRunnerClientClass_softClass;
  v25 = getWFSpringBoardWorkflowRunnerClientClass_softClass;
  if (!getWFSpringBoardWorkflowRunnerClientClass_softClass)
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __getWFSpringBoardWorkflowRunnerClientClass_block_invoke;
    v20 = &unk_1E8E9ED40;
    v21 = &v22;
    __getWFSpringBoardWorkflowRunnerClientClass_block_invoke((uint64_t)&v17);
    v13 = (void *)v23[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v22, 8);
  v15 = (void *)objc_msgSend([v14 alloc], "initWithWebClipMetadata:", v12);

  return v15;
}

void __83__SBUIController_activateApplication_fromIcon_location_activationSettings_actions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v3 = a2;
  if ((objc_msgSend(v3, "isApplicationSceneEntity") & 1) != 0
    || objc_msgSend(v3, "isAppClipPlaceholderEntity"))
  {
    if (objc_msgSend(v3, "isApplicationSceneEntity"))
      (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __83__SBUIController_activateApplication_fromIcon_location_activationSettings_actions___block_invoke_3;
    v13 = &unk_1E8E9EA50;
    v6 = *(_QWORD *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    v15 = *(id *)(a1 + 64);
    objc_msgSend(v4, "_activateWorkspaceEntity:fromIcon:location:validator:", v3, v5, v6, &v10);
    objc_msgSend(*(id *)(a1 + 72), "bookmark", v10, v11, v12, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isShortcutsWebClip"))
    {
      objc_msgSend(*(id *)(a1 + 72), "bookmark");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isSingleStepShortcutWebClip");

      if (!v9)
      {
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(*(id *)(a1 + 32), "workflowClientFromWebClip:appToLaunch:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "showSingleStepCompletionWithCompletion:", &__block_literal_global_137);
    }

    goto LABEL_9;
  }
LABEL_10:

}

uint64_t __83__SBUIController_activateApplication_fromIcon_location_activationSettings_actions___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 40), "layoutStateApplicationSceneHandles");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualSets();

  return v2;
}

- (void)_closeOpenFolderIfNecessary
{
  void *v2;
  void *v3;
  id v4;

  -[SBUIController iconController](self, "iconController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconToReveal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && objc_msgSend(v2, "hasOpenFolder"))
    objc_msgSend(v2, "popToCurrentRootIconList");

}

- (void)restoreContent
{
  -[SBUIController restoreContentWithOptions:](self, "restoreContentWithOptions:", 0);
}

- (void)restoreContentWithOptions:(unint64_t)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  UIView *iconsView;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[3];
  _QWORD v31[3];
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUILocked");
  SBLogUIController();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSBUIControllerRequireContentOptions(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Attempting restoreContentWithOptions:(%@)", buf, 0xCu);

  }
  if ((a3 & 2) != 0)
    goto LABEL_10;
  objc_msgSend((id)SBApp, "lockOutController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isLockedOut") & 1) != 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(v5, "lockScreenEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "callController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isMakingEmergencyCall");

  if (!v12)
  {
LABEL_10:
    if (v6)
      goto LABEL_11;
    objc_msgSend((id)SBApp, "restartManager");
    v14 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isPendingExit](v14, "isPendingExit"))
    {
      SBLogUIController();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v17 = "abort restoreContentWithOptions: restartManager isPendingExit";
LABEL_37:
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
      }
    }
    else
    {
      iconsView = self->_iconsView;
      if (iconsView && !-[UIView isHidden](iconsView, "isHidden"))
      {
        SBLogUIController();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v17 = "abort restoreContentWithOptions: _iconsView is already visible";
          goto LABEL_37;
        }
      }
      else
      {
        v19 = -[SBHomeScreenBackdropViewBase isOpaque](self->_homeScreenBackdropView, "isOpaque");
        SBLogUIController();
        v16 = objc_claimAutoreleasedReturnValue();
        v20 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        if (!v19)
        {
          if (v20)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Restoring home screen", buf, 2u);
          }

          v21 = -[SBUIController isIconListViewTornDown](self, "isIconListViewTornDown");
          -[SBUIController _willRevealOrHideContentView](self, "_willRevealOrHideContentView");
          -[SBUIController iconController](self, "iconController");
          v16 = objc_claimAutoreleasedReturnValue();
          -[NSObject homeScreenViewController](v16, "homeScreenViewController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          SBLogUIController();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "Setting _iconsView to visible", buf, 2u);
          }

          objc_msgSend(v22, "setIconContentHidden:", 0);
          -[SBWindow traitsParticipant](self->_window, "traitsParticipant");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setNeedsUpdatePreferencesWithReason:animate:", CFSTR("restore icons"), 0);

          -[SBUIController _closeOpenFolderIfNecessary](self, "_closeOpenFolderIfNecessary");
          -[NSObject updateNumberOfRowsWithDuration:](v16, "updateNumberOfRowsWithDuration:", 0.0);
          if ((a3 & 1) == 0)
            -[SBUIController updateStatusBarLegibilityForWindowScene:](self, "updateStatusBarLegibilityForWindowScene:", 0);
          -[SBUIController _switchToHomeScreenWallpaperAnimated:](self, "_switchToHomeScreenWallpaperAnimated:", 1);
          +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "activateOrientationSource:", 2);

          if (v21)
          {
            -[SBUIController window](self, "window");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")) & 1) == 0)
              objc_msgSend(v26, "_updateInterfaceOrientationFromActiveInterfaceOrientationIfRotationEnabled:", 0);
            objc_msgSend(v26, "layoutBelowIfNeeded");

          }
          if ((a3 & 4) != 0)
          {
            -[SBUIController iconController](self, "iconController");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "iconManager");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "rootFolderController");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "presentSpotlightAnimated:completionHandler:", 0, &__block_literal_global_151);

          }
          goto LABEL_38;
        }
        if (v20)
        {
          *(_WORD *)buf = 0;
          v17 = "abort restoreContentWithOptions: _homeScreenBackdropView is opaque";
          goto LABEL_37;
        }
      }
    }
LABEL_38:

    goto LABEL_39;
  }
LABEL_7:
  if ((v6 & 1) == 0)
  {
    v30[0] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
    v30[1] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
    v31[0] = MEMORY[0x1E0C9AAA0];
    v31[1] = MEMORY[0x1E0C9AAB0];
    v30[2] = CFSTR("SBUILockOptionsForceLockKey");
    v31[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lockUIFromSource:withOptions:", 6, v13);

    SBLogUIController();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "abort restoreContentWithOptions: Force lock case";
LABEL_13:
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      goto LABEL_39;
    }
    goto LABEL_39;
  }
LABEL_11:
  SBLogUIController();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v15 = "abort restoreContentWithOptions: UI is locked";
    goto LABEL_13;
  }
LABEL_39:

}

- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3
{
  -[SBUIController restoreContentAndUnscatterIconsAnimated:withCompletion:](self, "restoreContentAndUnscatterIconsAnimated:withCompletion:", a3, 0);
}

- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3 withCompletion:(id)a4
{
  -[SBUIController restoreContentAndUnscatterIconsAnimated:afterDelay:withCompletion:](self, "restoreContentAndUnscatterIconsAnimated:afterDelay:withCompletion:", a3, a4, 0.0);
}

- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3 afterDelay:(double)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;

  v6 = a3;
  v8 = a5;
  -[SBUIController restoreContent](self, "restoreContent");
  -[SBUIController iconController](self, "iconController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unscatterAnimated:afterDelay:withCompletion:", v6, v8, a4);

}

- (void)_switchToHomeScreenWallpaperAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "activeVariant") != 1)
  {
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      v6 = (void *)MEMORY[0x1E0D01908];
      objc_msgSend(v4, "unlockToPhoneWallpaperOutSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "BSAnimationSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "factoryWithSettings:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0D01908];
      objc_msgSend(v5, "unlockToPhoneWallpaperInSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "BSAnimationSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "factoryWithSettings:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
      v9 = 0;
    }
    objc_msgSend(v14, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + -3.0);
    objc_msgSend(v14, "setActiveVariant:withOutAnimationFactory:inAnimationFactory:completion:", 1, v9, v13, 0);

  }
}

- (BOOL)hasVisibleAlertItemOrSheet:(BOOL *)a3
{
  void *v4;
  char v5;
  void *v6;

  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasVisibleAlert") & 1) != 0)
  {
    v5 = 1;
    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend((id)SBApp, "modalAlertPresentationCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isShowingModalAlert");

  if (a3)
LABEL_5:
    *a3 = objc_msgSend(v4, "canDeactivateAlertForMenuClickOrSystemGesture");
LABEL_6:

  return v5;
}

- (BOOL)dissmissAlertItemsAndSheetsIfPossible
{
  void *v2;
  char v3;

  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deactivateAlertForMenuClickOrSystemGestureWithAnimation:", 1);

  return v3;
}

- (BOOL)disableAppSwitchForcePressDueToHomeButtonForce
{
  return self->_disableAppSwitchForcePressDueToHomeButtonForce;
}

- (BOOL)handleHomeButtonSinglePressUpForWindowScene:(id)a3
{
  return -[SBUIController handleHomeButtonSinglePressUpForWindowScene:withSourceType:](self, "handleHomeButtonSinglePressUpForWindowScene:withSourceType:", a3, 0);
}

- (BOOL)handleHomeButtonSinglePressUpForWindowScene:(id)a3 withSourceType:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  NSObject *v34;
  void *v35;
  void *v36;
  int v37;
  NSObject *v38;
  void *v39;
  const char *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  const char *v44;
  int v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  int v49;
  NSObject *v50;
  void *v51;
  char v52;
  void *v53;
  char v54;
  NSObject *v55;
  void *v56;
  unsigned __int8 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(v7, "isExternalDisplayWindowScene"))
  {
    objc_msgSend(v7, "floatingDockController");
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isPresentingFolder](v8, "isPresentingFolder"))
    {
      -[NSObject dismissPresentedFolderAnimated:completion:](v8, "dismissPresentedFolderAnimated:completion:", 1, 0);
LABEL_70:

      goto LABEL_71;
    }
    -[NSObject floatingDockViewController](v8, "floatingDockViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isPresentingLibrary");

    if (v18)
    {
      -[NSObject floatingDockViewController](v8, "floatingDockViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dismissLibraryAnimated:completion:", 1, 0);
LABEL_9:

      goto LABEL_70;
    }

    goto LABEL_48;
  }
  objc_msgSend(v7, "switcherController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "unlockedEnvironmentMode") != 3)
  {

    goto LABEL_11;
  }
  -[SBUIController iconController](self, "iconController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0DAA998];
  v13 = objc_msgSend(v11, "hasOpenFolderInLocation:", *MEMORY[0x1E0DAA998]);

  if (!v13)
  {
LABEL_11:
    objc_msgSend((id)SBApp, "menuButtonInterceptApp");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject processState](v8, "processState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v8
      && objc_msgSend(v20, "isRunning")
      && (!objc_msgSend((id)SBApp, "menuButtonInterceptAppEnabledForever")
       || SBWorkspaceHasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication(v8)))
    {
      SBLogButtonsHome();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject bundleIdentifier](v8, "bundleIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v23;
        v61 = 2114;
        v62 = v24;
        _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_INFO, "%{public}@ result: intercepting menu button event and forwarding to %{public}@", buf, 0x16u);

      }
      -[NSObject bundleIdentifier](v8, "bundleIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      SBSendFakeHomeButtonTapEventToApplication(v25, objc_msgSend(v21, "pid"));

      if ((objc_msgSend((id)SBApp, "menuButtonInterceptAppEnabledForever") & 1) == 0)
        objc_msgSend((id)SBApp, "setMenuButtonInterceptApp:forever:", 0, 0);
LABEL_26:

      goto LABEL_70;
    }

    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setupApplication");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = -[NSObject isInSetupModeReadyToExit](v8, "isInSetupModeReadyToExit");
    if (a4 != 1 || (v27 & 1) == 0)
    {
      if (v21 && SBWorkspaceUnlockedEnvironmentLayoutStateHasMatchingApplication(v21))
      {
        SBLogButtonsHome();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v60 = v29;
          _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_INFO, "%{public}@ result: ignoring because setup is active", buf, 0xCu);

        }
        goto LABEL_26;
      }
      if (-[NSObject isInSetupMode](v8, "isInSetupMode")
        && -[NSObject updateInSetupMode](v8, "updateInSetupMode"))
      {
        objc_msgSend((id)SBApp, "authenticationController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v30, "isAuthenticated") & 1) != 0)
        {
          +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "transientOverlayPresentationManager");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "hasActivePresentation");

          if ((v33 & 1) == 0)
          {
            SBLogButtonsHome();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v60 = v35;
              _os_log_impl(&dword_1D0540000, v34, OS_LOG_TYPE_INFO, "%{public}@ result: activating setup", buf, 0xCu);

            }
            SBWorkspaceActivateApplication(v21);
            goto LABEL_26;
          }
        }
        else
        {

        }
      }
    }

    objc_msgSend((id)SBApp, "remoteTransientOverlaySessionManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "hasSessionWithPendingButtonEvents:options:", 1, 0);

    if (v37)
    {
      SBLogButtonsHome();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v39;
        v40 = "%{public}@ result: ignoring because a session with a pending lock event exists";
LABEL_54:
        _os_log_impl(&dword_1D0540000, v38, OS_LOG_TYPE_INFO, v40, buf, 0xCu);

      }
LABEL_55:

LABEL_71:
      v16 = 1;
      goto LABEL_72;
    }
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "transientOverlayPresentationManager");
    v8 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject hasActivePresentation](v8, "hasActivePresentation")
      && -[NSObject handleHomeButtonPress](v8, "handleHomeButtonPress"))
    {
      SBLogButtonsHome();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v43;
        v44 = "%{public}@ result: transient overlay handled it";
LABEL_68:
        _os_log_impl(&dword_1D0540000, v42, OS_LOG_TYPE_INFO, v44, buf, 0xCu);

      }
LABEL_69:

      goto LABEL_70;
    }

    v58 = 1;
    if (-[SBUIController hasVisibleAlertItemOrSheet:](self, "hasVisibleAlertItemOrSheet:", &v58))
    {
      v45 = v58;
      SBLogButtonsHome();
      v8 = objc_claimAutoreleasedReturnValue();
      v46 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (!v45)
      {
        if (!v46)
          goto LABEL_70;
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v19;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "%{public}@ result: ignoring because an alert item or sheet is showing and can't be dismissed", buf, 0xCu);
        goto LABEL_9;
      }
      if (v46)
      {
        NSStringFromSelector(a2);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v47;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "%{public}@ result: ignoring because attempting to dismiss alert items or sheets", buf, 0xCu);

      }
      if (-[SBUIController dissmissAlertItemsAndSheetsIfPossible](self, "dissmissAlertItemsAndSheetsIfPossible"))
        goto LABEL_71;
    }
LABEL_48:
    objc_msgSend(v7, "_fbsDisplayConfiguration");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = SBWorkspaceSuspendDisplayWithSource(v48, 20);

    if (v49)
    {
      SBLogButtonsHome();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v39;
        v40 = "%{public}@ result: suspending display";
        goto LABEL_54;
      }
      goto LABEL_55;
    }
    if (-[SBHomeScreenWindow isRotating](self->_window, "isRotating"))
    {
      SBLogButtonsHome();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v39;
        v40 = "%{public}@ result: ignoring because we're rotating";
        goto LABEL_54;
      }
      goto LABEL_55;
    }
    objc_msgSend(v7, "homeScreenController");
    v50 = objc_claimAutoreleasedReturnValue();
    v8 = v50;
    if (!v50
      || (-[NSObject iconManager](v50, "iconManager"),
          v51 = (void *)objc_claimAutoreleasedReturnValue(),
          v52 = objc_msgSend(v51, "isScrolling"),
          v51,
          (v52 & 1) != 0))
    {

      -[SBUIController iconController](self, "iconController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "iconManager");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "isScrolling");

      if ((v54 & 1) == 0)
      {
        objc_msgSend(v14, "handleHomeButtonTap");
        SBLogButtonsHome();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v60 = v56;
          _os_log_impl(&dword_1D0540000, v55, OS_LOG_TYPE_INFO, "%{public}@ result: icon controller handled it", buf, 0xCu);

        }
      }
      v16 = v54 ^ 1;
      goto LABEL_63;
    }
    -[NSObject handleHomeButtonTap](v8, "handleHomeButtonTap");
    SBLogButtonsHome();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v43;
      v44 = "%{public}@ result: home screen controller handled it";
      goto LABEL_68;
    }
    goto LABEL_69;
  }
  -[SBUIController iconController](self, "iconController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "iconManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 1;
  objc_msgSend(v15, "popExpandedIconFromLocation:interactionContext:animated:completionHandler:", v12, 0, 1, 0);

LABEL_63:
LABEL_72:

  return v16;
}

- (void)_reduceMotionStatusDidChange:(id)a3
{
  -[SBHomeScreenBackdropViewBase removeFromSuperview](self->_homeScreenBackdropView, "removeFromSuperview", a3);
  -[SBUIController _setupHomeScreenContentBackdropView](self, "_setupHomeScreenContentBackdropView");
}

- (void)_backgroundContrastDidChange:(id)a3
{
  -[SBHomeScreenBackdropViewBase removeFromSuperview](self->_homeScreenBackdropView, "removeFromSuperview", a3);
  -[SBUIController _setupHomeScreenContentBackdropView](self, "_setupHomeScreenContentBackdropView");
  -[SBUIController updateStatusBarLegibilityForWindowScene:](self, "updateStatusBarLegibilityForWindowScene:", 0);
}

- (BOOL)handleHomeButtonDoublePressDown
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController](SBMainSwitcherControllerCoordinator, "_shim_activeSwitcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlockedEnvironmentMode");

  ADClientAddValueForScalarKey();
  SBLogButtonsHome();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "%{public}@ result: activating app switcher", (uint8_t *)&v10, 0xCu);

  }
  -[SBUIController windowScene](self, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "switcherController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toggleMainSwitcherWithSource:animated:", 20, 1);

  return 1;
}

- (void)handleVolumeButtonWithType:(int64_t)a3 down:(BOOL)a4
{
  -[SBVolumeControl handleVolumeButtonWithType:down:](self->_volumeControl, "handleVolumeButtonWithType:down:", a3, a4);
}

- (void)cancelVolumeEvent
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self->_volumeControl, sel_increaseVolume, 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self->_volumeControl, sel_decreaseVolume, 0);
}

uint64_t __37__SBUIController_updateBatteryState___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  void *v3;
  uint64_t result;

  v2 = dispatch_queue_create("com.apple.SpringBoard.batterynotificationqueue", 0);
  v3 = (void *)updateBatteryState__notificationQueue;
  updateBatteryState__notificationQueue = (uint64_t)v2;

  notify_register_check("com.apple.springboard.fullycharged", &updateBatteryState__fullPowerToken);
  result = notify_register_check("com.apple.springboard.pluggedin", &updateBatteryState__pluggedInToken);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __37__SBUIController_updateBatteryState___block_invoke_200()
{
  return BSDispatchMain();
}

void __37__SBUIController_updateBatteryState___block_invoke_2(uint64_t a1)
{
  char v1;
  NSObject *v2;
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v1 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80);
  if ((v1 & 8) != 0)
  {
    SBLogUIController();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
    if ((v1 & 0x10) != 0)
    {
      if (v3)
        __37__SBUIController_updateBatteryState___block_invoke_2_cold_2(v2, v4, v5, v6, v7, v8, v9, v10);

      objc_msgSend((id)SBApp, "restartManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rebootForReason:", CFSTR("BatteryAtCriticalLevel"));
    }
    else
    {
      if (v3)
        __37__SBUIController_updateBatteryState___block_invoke_2_cold_1(v2, v4, v5, v6, v7, v8, v9, v10);

      objc_msgSend((id)SBApp, "restartManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shutdownForReason:", CFSTR("BatteryAtCriticalLevel"));
    }

  }
}

uint64_t __37__SBUIController_updateBatteryState___block_invoke_206(uint64_t a1)
{
  notify_set_state(updateBatteryState__fullPowerToken, *(unsigned __int8 *)(a1 + 32));
  return notify_post("com.apple.springboard.fullycharged");
}

uint64_t __37__SBUIController_updateBatteryState___block_invoke_2_208(uint64_t a1)
{
  notify_set_state(updateBatteryState__pluggedInToken, *(unsigned __int8 *)(a1 + 32));
  return notify_post("com.apple.springboard.pluggedin");
}

- (id)connectedWirelessChargerIdentifier
{
  return self->_connectedWirelessChargerId;
}

- (void)_disableWirelessChargingChimeAndScreenWakeForDuration:(double)a3
{
  -[SBUIController _disableWirelessChargingChimeAndScreenWakeForDuration:withMotionAlarm:](self, "_disableWirelessChargingChimeAndScreenWakeForDuration:withMotionAlarm:", 1, a3);
}

- (void)_disableWirelessChargingChimeAndScreenWakeForDuration:(double)a3 withMotionAlarm:(BOOL)a4
{
  *(_WORD *)&self->_disableChimeForWirelessCharging = 257;
  if (a4)
    -[SBFMotionAlarmController registerMotionAlarm](self->_motionAlarmController, "registerMotionAlarm");
  -[SBUIController _setDebounceWirelessChargingTimerWithDuration:](self, "_setDebounceWirelessChargingTimerWithDuration:", a3);
}

- (void)setChargingChimeEnabled:(BOOL)a3
{
  if (self->_chargingChimeEnabled != a3)
  {
    self->_chargingChimeEnabled = a3;
    if (a3)
      -[SBUIController playChargingChimeIfAppropriate](self, "playChargingChimeIfAppropriate");
    else
      -[NSMutableDictionary removeAllObjects](self->_powerSourceHasChimed, "removeAllObjects");
  }
}

- (void)_enumeratePowerSourcesWithBlock:(id)a3
{
  const void *v3;
  const void *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex i;
  const void *ValueAtIndex;
  CFDictionaryRef v11;
  void (**v12)(id, CFDictionaryRef);

  v12 = (void (**)(id, CFDictionaryRef))a3;
  v3 = (const void *)IOPSCopyPowerSourcesByType();
  if (v3)
  {
    v4 = v3;
    v5 = IOPSCopyPowerSourcesList(v3);
    if (v5)
    {
      v6 = v5;
      Count = CFArrayGetCount(v5);
      if (Count >= 1)
      {
        v8 = Count;
        for (i = 0; i != v8; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v6, i);
          v11 = IOPSGetPowerSourceDescription(v4, ValueAtIndex);
          v12[2](v12, v11);
        }
      }
      CFRelease(v4);
    }
    else
    {
      v6 = (const __CFArray *)v4;
    }
    CFRelease(v6);
  }

}

- (BOOL)_powerSourceWantsToPlayChime
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__SBUIController__powerSourceWantsToPlayChime__block_invoke;
  v4[3] = &unk_1E8E9ED88;
  v4[4] = self;
  v4[5] = &v5;
  -[SBUIController _enumeratePowerSourcesWithBlock:](self, "_enumeratePowerSourcesWithBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __46__SBUIController__powerSourceWantsToPlayChime__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Power Source ID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Play Charging Chime"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v5 && (v7 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      v8 = MEMORY[0x1E0C9AAB0];
LABEL_7:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setObject:forKeyedSubscript:", v8, v3);
      goto LABEL_8;
    }
    if ((v5 & 1) == 0)
    {
      v8 = MEMORY[0x1E0C9AAA0];
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)suppressChimeForConnectedPowerSources
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__SBUIController_suppressChimeForConnectedPowerSources__block_invoke;
  v2[3] = &unk_1E8E9EDB0;
  v2[4] = self;
  -[SBUIController _enumeratePowerSourcesWithBlock:](self, "_enumeratePowerSourcesWithBlock:", v2);
}

void __55__SBUIController_suppressChimeForConnectedPowerSources__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Power Source ID"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Play Charging Chime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "BOOLValue");
  v6 = v7;
  if (v7 && v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v7);
    v6 = v7;
  }

}

- (void)playChargingChimeIfAppropriate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _DWORD v15[2];
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)SBApp, "restartManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startupTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "overlay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = 0;
    else
      v7 = objc_msgSend(v5, "isDark") ^ 1;

  }
  else
  {
    v7 = 0;
  }
  v8 = -[SBUIController _powerSourceWantsToPlayChime](self, "_powerSourceWantsToPlayChime");
  v9 = -[SBUIController chargingChimeEnabled](self, "chargingChimeEnabled") & v7 & v8;
  SBLogCharging();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109632;
    v15[1] = v9;
    v16 = 1024;
    v17 = -[SBUIController chargingChimeEnabled](self, "chargingChimeEnabled");
    v18 = 1024;
    v19 = v8;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Should chime: %{BOOL}u, charging enabled: %{BOOL}u, _powerSourceWantsToPlayChime: %{BOOL}u", (uint8_t *)v15, 0x14u);
  }

  -[SBUIController chargingChimeEnabled](self, "chargingChimeEnabled");
  kdebug_trace();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DAC2A0], "soundWithFeedbackEventType:", 1003);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*((_BYTE *)self + 81) & 0xC) != 0)
    {
      SBLogAccessory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Play chime for internal charging accessory", (uint8_t *)v15, 2u);
      }

      objc_msgSend(MEMORY[0x1E0DAC2A0], "soundWithFeedbackEventType:", 1020);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    +[SBSoundController sharedInstance](SBSoundController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "playSoundWithDefaultEnvironment:", v11);

  }
}

- (void)didDetectDeviceMotion
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogCharging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Device motion detected", v4, 2u);
  }

  -[SBUIController _resetWirelessChargingState](self, "_resetWirelessChargingState");
}

- (BOOL)_isConnectedToWirelessCharging
{
  if ((*((_BYTE *)self + 81) & 0xC) != 0)
    return 1;
  else
    return *((_BYTE *)self + 136) & 1;
}

- (void)_setDebounceWirelessChargingTimerWithDuration:(double)a3
{
  SWWakingTimer *debounceWirelessChargingTimer;
  double v6;
  double v7;
  NSObject *v8;
  SWWakingTimer *v9;
  SWWakingTimer *v10;
  SWWakingTimer *v11;
  SWWakingTimer *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id location;
  uint8_t buf[4];
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  debounceWirelessChargingTimer = self->_debounceWirelessChargingTimer;
  if (!debounceWirelessChargingTimer)
    goto LABEL_7;
  -[SWWakingTimer timeRemaining](debounceWirelessChargingTimer, "timeRemaining");
  if (v6 < a3)
  {
    v7 = v6;
    SBLogCharging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v19 = v7;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Overriding debounce wireless charging timer because current time remaining (%f seconds) is less than requested fire interval (%f seconds)", buf, 0x16u);
    }

    -[SWWakingTimer invalidate](self->_debounceWirelessChargingTimer, "invalidate");
    v9 = self->_debounceWirelessChargingTimer;
    self->_debounceWirelessChargingTimer = 0;

  }
  if (!self->_debounceWirelessChargingTimer)
  {
LABEL_7:
    objc_initWeak(&location, self);
    v10 = (SWWakingTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0F88]), "initWithIdentifier:", CFSTR("SBUIController-DebounceWirelessCharging"));
    v11 = self->_debounceWirelessChargingTimer;
    self->_debounceWirelessChargingTimer = v10;

    v12 = self->_debounceWirelessChargingTimer;
    v13 = MEMORY[0x1E0C80D38];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__SBUIController__setDebounceWirelessChargingTimerWithDuration___block_invoke;
    v15[3] = &unk_1E8E9EDD8;
    objc_copyWeak(&v16, &location);
    -[SWWakingTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v12, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v15, a3, 1.0);

    SBLogCharging();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = a3;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Debounce wireless charging timer scheduled for %f seconds", buf, 0xCu);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __64__SBUIController__setDebounceWirelessChargingTimerWithDuration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_debounceWirelessChargingTimerFired");

}

- (void)_debounceWirelessChargingTimerFired
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogCharging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Debounce wireless charging timer fired", v4, 2u);
  }

  -[SBUIController _resetWirelessChargingState](self, "_resetWirelessChargingState");
}

- (void)_resetWirelessChargingState
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogCharging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Resetting wireless charging state", v4, 2u);
  }

  *(_WORD *)&self->_disableChimeForWirelessCharging = 0;
  if (!-[SBUIController _isConnectedToWirelessCharging](self, "_isConnectedToWirelessCharging"))
  {
    -[NSMutableDictionary removeAllObjects](self->_powerSourceHasChimed, "removeAllObjects");
    -[SBUIController possiblyWakeForPowerStatusChangeWithUnlockSource:](self, "possiblyWakeForPowerStatusChangeWithUnlockSource:", 21);
  }
  -[SBFMotionAlarmController unregisterMotionAlarm](self->_motionAlarmController, "unregisterMotionAlarm");
  -[SBUIController _cancelDebounceWirelessChargingTimer](self, "_cancelDebounceWirelessChargingTimer");
}

- (void)_cancelDebounceWirelessChargingTimer
{
  NSObject *v3;
  SWWakingTimer *debounceWirelessChargingTimer;
  uint8_t v5[16];

  if (self->_debounceWirelessChargingTimer)
  {
    SBLogCharging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Debounce wireless charging timer canceled", v5, 2u);
    }

    -[SWWakingTimer invalidate](self->_debounceWirelessChargingTimer, "invalidate");
    debounceWirelessChargingTimer = self->_debounceWirelessChargingTimer;
    self->_debounceWirelessChargingTimer = 0;

  }
}

- (void)_playAccessoryChimeIfAppropriateForAccessory:(id)a3 attaching:(BOOL)a4 withDelay:(double)a5
{
  id v8;
  dispatch_time_t v9;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;

  v8 = a3;
  v9 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__SBUIController__playAccessoryChimeIfAppropriateForAccessory_attaching_withDelay___block_invoke;
  block[3] = &unk_1E8E9EE00;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v10 = v8;
  dispatch_after(v9, MEMORY[0x1E0C80D38], block);

}

void __83__SBUIController__playAccessoryChimeIfAppropriateForAccessory_attaching_withDelay___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (objc_msgSend(*(id *)(a1 + 32), "_isAppropriateToReactToAccessoryEvent"))
  {
    SBLogAccessory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Play chime for internal accessory", v7, 2u);
    }

    if (objc_msgSend(*(id *)(a1 + 40), "type") == 8 && *(_BYTE *)(a1 + 48) == 0)
      v4 = 1021;
    else
      v4 = 1019;
    objc_msgSend(MEMORY[0x1E0DAC2A0], "soundWithFeedbackEventType:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSoundController sharedInstance](SBSoundController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playSoundWithDefaultEnvironment:", v5);

  }
}

- (BOOL)_isAppropriateToReactToAccessoryEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend((id)SBApp, "restartManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startupTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "overlay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else if ((objc_msgSend(v5, "isDark") & 1) == 0)
    {
      v7 = -[SBUIController isAccessoryAnimationAllowed](self, "isAccessoryAnimationAllowed");
      goto LABEL_6;
    }
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (float)batteryCapacity
{
  return self->_batteryCapacity;
}

- (BOOL)isFullyCharged
{
  return (*((unsigned __int8 *)self + 80) >> 2) & 1;
}

- (BOOL)isOnAC
{
  return (*((unsigned __int8 *)self + 80) >> 4) & 1;
}

- (BOOL)isConnectedToExternalChargingSource
{
  return (*((_BYTE *)self + 80) & 0x30) != 0;
}

- (BOOL)isConnectedToChargeIncapablePowerSource
{
  return *((_BYTE *)self + 81) & 1;
}

- (BOOL)isConnectedToWirelessInternalCharger
{
  return (*((unsigned __int8 *)self + 81) >> 2) & 1;
}

- (BOOL)isConnectedToWirelessInternalChargingAccessory
{
  return (*((unsigned __int8 *)self + 81) >> 3) & 1;
}

- (BOOL)isConnectedToWirelessInternalAccessory
{
  return (*((unsigned __int8 *)self + 81) >> 4) & 1;
}

- (BOOL)isConnectedToWindowedAccessory
{
  return (*((unsigned __int8 *)self + 81) >> 5) & 1;
}

- (CGRect)visibleScreenCoordinatesForWindowedAccessory
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleScreenCoordinatesForWindowedAccessory.origin.x;
  y = self->_visibleScreenCoordinatesForWindowedAccessory.origin.y;
  width = self->_visibleScreenCoordinatesForWindowedAccessory.size.width;
  height = self->_visibleScreenCoordinatesForWindowedAccessory.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isConnectedToQiPower
{
  return *((_BYTE *)self + 136) & 1;
}

- (void)possiblyWakeForPowerStatusChangeWithUnlockSource:(int)a3
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)SBApp, "caseIsEnabledAndLatched") & 1) == 0)
  {
    +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isUILocked"))
    {
      SBLogCharging();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromUnlockSource();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Unlock UI for source: %@", buf, 0xCu);

      }
      v15[0] = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v7;
      v15[1] = CFSTR("SBUIUnlockOptionsStartFadeInAnimation");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "unlockUIFromSource:withOptions:", v3, v9);

    }
    else
    {
      +[SBIdleTimerGlobalCoordinator sharedInstanceIfExists](SBIdleTimerGlobalCoordinator, "sharedInstanceIfExists");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromUnlockSource();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("SBUIPossiblyWake:%@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resetIdleTimerForReason:", v12);

    }
    +[SBScreenLongevityController sharedInstanceIfExists](SBScreenLongevityController, "sharedInstanceIfExists");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromUnlockSource();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resetTimerForReason:", v14);

  }
}

- (void)ACPowerChanged
{
  if (!self->_disableScreenWakeForWirelessCharging)
    -[SBUIController possiblyWakeForPowerStatusChangeWithUnlockSource:](self, "possiblyWakeForPowerStatusChangeWithUnlockSource:", 21);
}

- (void)connectedDevicesDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE *v10;
  int v11;
  int v12;
  char v13;
  int v14;
  void *v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
      if ((objc_msgSend(v9, "isInternal", (_QWORD)v17) & 1) == 0)
      {
        if (objc_msgSend(v9, "isPowerSource"))
          break;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    if (objc_msgSend(v9, "percentCharge"))
      v11 = 1;
    else
      v11 = objc_msgSend(v9, "isCharging");

    v10 = (char *)self + 80;
    if ((*((_BYTE *)self + 80) & 0x20) == 0)
    {
      v12 = 1;
      kdebug_trace();
      v13 = 32;
      goto LABEL_20;
    }
    v12 = 0;
    v14 = 1;
LABEL_23:
    if (((v11 ^ ((*v10 & 0x40) == 0)) & 1) == 0)
    {
      kdebug_trace();
      v16 = v11 ? 64 : 0;
      *v10 = *v10 & 0xBF | v16;
      if (((v14 | v12) & 1) == 0)
        goto LABEL_28;
    }
    goto LABEL_29;
  }
LABEL_10:

  v10 = (char *)self + 80;
  if ((*((_BYTE *)self + 80) & 0x20) != 0)
  {
    kdebug_trace();
    v11 = 0;
    v12 = 0;
    v13 = 0;
LABEL_20:
    *v10 = *v10 & 0xDF | v13;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", (_QWORD)v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:", CFSTR("SBUIExternalChargeAccessoryConnectedStatusChangedNotification"), 0);

    if (v12)
    {
      -[SBUIController possiblyWakeForPowerStatusChangeWithUnlockSource:](self, "possiblyWakeForPowerStatusChangeWithUnlockSource:", 22);
      v14 = 1;
      v12 = 1;
    }
    else
    {
      v14 = 0;
    }
    goto LABEL_23;
  }
  if ((*((_BYTE *)self + 80) & 0x40) != 0)
  {
    kdebug_trace();
    *v10 &= ~0x40u;
LABEL_28:
    -[SBUIController possiblyWakeForPowerStatusChangeWithUnlockSource:](self, "possiblyWakeForPowerStatusChangeWithUnlockSource:", 22, (_QWORD)v17);
  }
LABEL_29:

}

- (BOOL)isConnectedToUnsupportedChargingAccessory
{
  return *((unsigned __int8 *)self + 80) >> 7;
}

- (BOOL)supportsDetailedBatteryCapacity
{
  return self->_supportsDetailedBatteryCapacity;
}

- (void)noteStatusBarHeightChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  SBUIController *v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D229B0];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __45__SBUIController_noteStatusBarHeightChanged___block_invoke;
  v12 = &unk_1E8E9E820;
  v13 = v4;
  v14 = self;
  v6 = v4;
  objc_msgSend(v5, "eventWithName:handler:", CFSTR("updateLayoutForStatusBarHeightChange"), &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance", v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeOrPrependEvent:", v7);

}

void __45__SBUIController_noteStatusBarHeightChanged___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  id v6;

  if (SBWorkspaceSpringBoardIsActive())
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CEB318]);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      v4 = v3;
    }
    else
    {
      v4 = 0.0;
    }
    objc_msgSend(*(id *)(a1 + 40), "iconController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateNumberOfRowsWithDuration:", v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "iconController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateNumberOfRowsWithDuration:", 0.0);
  }

}

- (NSString)description
{
  return (NSString *)-[SBUIController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (void)nudgeIconInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  void *v6;
  id v7;

  -[SBUIController iconController](self, "iconController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeScreenViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nudgeIconInterfaceOrientation:duration:", a3, a4);

}

- (BOOL)homeScreenAutorotatesEvenWhenIconIsDragging
{
  void *v2;
  void *v3;
  char v4;

  -[SBUIController iconController](self, "iconController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "homeScreenAutorotatesEvenWhenIconIsDragging");

  return v4;
}

- (void)disableAnimationForNextIconRotation
{
  void *v2;
  id v3;

  -[SBUIController iconController](self, "iconController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableAnimationForNextIconRotation");

}

- (BOOL)isHeadsetDocked
{
  return 0;
}

- (BOOL)isHeadsetBatteryCharging
{
  return 0;
}

- (unsigned)headsetBatteryCapacity
{
  return 0;
}

- (void)interactionProgressDidUpdate:(id)a3
{
  double v4;

  if (self->_homeButtonForceProgress == a3)
  {
    objc_msgSend(a3, "percentComplete");
    self->_disableAppSwitchForcePressDueToHomeButtonForce = v4 > 0.001;
  }
}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  if (self->_homeButtonForceProgress == a3)
    self->_disableAppSwitchForcePressDueToHomeButtonForce = 0;
}

- (void)_activateApplicationFromAccessibility:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SBUIController__activateApplicationFromAccessibility___block_invoke;
  v6[3] = &unk_1E8E9EE78;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "requestTransitionWithBuilder:", v6);

}

void __56__SBUIController__activateApplicationFromAccessibility___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SBUIController__activateApplicationFromAccessibility___block_invoke_2;
  v4[3] = &unk_1E8E9EE50;
  v5 = *(id *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "modifyApplicationContext:", v4);
  objc_msgSend(v3, "setSource:", 18);

}

void __56__SBUIController__activateApplicationFromAccessibility___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SBDeviceApplicationSceneEntity *v4;

  v3 = a2;
  v4 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setActivatingEntity:", v4);

}

- (void)handleWillBeginReachabilityAnimation
{
  SBWallpaperEffectView *v3;
  SBWallpaperEffectView *reachabilityWallpaperEffectView;
  _QWORD v5[5];

  if (-[SBHomeScreenBackdropViewBase requiresBackdropView](self->_homeScreenBackdropView, "requiresBackdropView")
    || -[SBHomeScreenBackdropViewBase requiresLiveBackdropView](self->_homeScreenBackdropView, "requiresLiveBackdropView"))
  {
    -[SBUIController beginRequiringLiveBackdropViewForReason:](self, "beginRequiringLiveBackdropViewForReason:", CFSTR("ReachabilityAnimation"));
    if (!self->_reachabilityWallpaperEffectView)
    {
      v3 = -[SBWallpaperEffectView initWithWallpaperVariant:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:", 1);
      reachabilityWallpaperEffectView = self->_reachabilityWallpaperEffectView;
      self->_reachabilityWallpaperEffectView = v3;

      -[PBUIWallpaperEffectViewBase setForcesOpaque:](self->_reachabilityWallpaperEffectView, "setForcesOpaque:", 1);
      -[PBUIWallpaperEffectViewBase setFullscreen:](self->_reachabilityWallpaperEffectView, "setFullscreen:", 1);
      -[PBUIWallpaperEffectViewBase setStyle:](self->_reachabilityWallpaperEffectView, "setStyle:", 0);
      -[UIView addSubview:](self->_contentView, "addSubview:", self->_reachabilityWallpaperEffectView);
      -[UIView sendSubviewToBack:](self->_contentView, "sendSubviewToBack:", self->_reachabilityWallpaperEffectView);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __54__SBUIController_handleWillBeginReachabilityAnimation__block_invoke;
      v5[3] = &unk_1E8E9DED8;
      v5[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v5);
    }
  }
}

uint64_t __54__SBUIController_handleWillBeginReachabilityAnimation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  objc_msgSend(*(id *)(v2 + 24), "bounds");
  objc_msgSend(v3, "setFrame:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "layoutIfNeeded");
}

- (void)handleDidEndReachabilityAnimation
{
  -[SBUIController endRequiringLiveBackdropViewForReason:](self, "endRequiringLiveBackdropViewForReason:", CFSTR("ReachabilityAnimation"));
}

- (void)homeScreenBackdropView:(id)a3 opaquenessDidChange:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if (v4)
  {
    -[SBUIController iconController](self, "iconController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isShowingSpotlightUnderOpaqueBackdrop = objc_msgSend(v7, "isShowingPullDownSearch");

    -[SBUIController tearDownIconListAndBar](self, "tearDownIconListAndBar");
    -[SBUIController _removeReachabilityEffectViewIfNecessary](self, "_removeReachabilityEffectViewIfNecessary");
  }
  else if (-[NSMutableSet count](self->_contentRequiringReasons, "count")
         && -[SBUIController isIconListViewTornDown](self, "isIconListViewTornDown"))
  {
    if (self->_isShowingSpotlightUnderOpaqueBackdrop)
    {
      self->_isShowingSpotlightUnderOpaqueBackdrop = 0;
      v8 = 5;
    }
    else
    {
      v8 = 1;
    }
    -[SBUIController restoreContentWithOptions:](self, "restoreContentWithOptions:", v8);
  }

}

- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4
{
  if (a4 == 1)
    -[SBUIController _updateLegibility](self, "_updateLegibility", a3);
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 1)
  {
    -[SBUIController _updateLegibility](self, "_updateLegibility", v3, v4);
    objc_msgSend(MEMORY[0x1E0DAA3B8], "warmupIfNecessary");
  }
}

- (void)_updateLegibility
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[SBUIController _legibilitySettings](self, "_legibilitySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DAA620];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelMaximumHeightForContentSizeCategory:", v5);
  v7 = v6;

  objc_msgSend(v3, "setMinFillHeight:", v7);
  -[SBUIController iconController](self, "iconController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "legibilitySettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = SBUILegibilitySettingsAreEqual();

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", *MEMORY[0x1E0DAC8C8], 0);

  }
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "sb_description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v13;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "Using legibility settings: %@", (uint8_t *)&v17, 0xCu);

  }
  -[SBUIController iconController](self, "iconController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLegibilitySettings:", v3);

  -[SBUIController iconController](self, "iconController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "homeScreenViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLegibilitySettings:", v3);

  -[SBUIController updateStatusBarLegibilityForWindowScene:](self, "updateStatusBarLegibilityForWindowScene:", 0);
}

- (void)updateStatusBarLegibilityForWindowScene:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSMapTable *v8;
  NSMapTable *statusBarAssertionsByWindowScene;
  SBMutableStatusBarSettings *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[SBUIController _currentHomeScreenLegibilitySettings](self, "_currentHomeScreenLegibilitySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_statusBarAssertionsByWindowScene)
  {
    if (v4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    statusBarAssertionsByWindowScene = self->_statusBarAssertionsByWindowScene;
    self->_statusBarAssertionsByWindowScene = v8;

    if (v4)
      goto LABEL_3;
  }
  -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  -[NSMapTable objectForKey:](self->_statusBarAssertionsByWindowScene, "objectForKey:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__SBUIController_updateStatusBarLegibilityForWindowScene___block_invoke;
    v13[3] = &unk_1E8E9EEA0;
    v14 = v5;
    objc_msgSend(v7, "modifySettingsWithBlock:", v13);

  }
  else
  {
    v10 = objc_alloc_init(SBMutableStatusBarSettings);
    -[SBMutableStatusBarSettings setStyle:](v10, "setStyle:", SBDefaultStatusBarStyle());
    -[SBMutableStatusBarSettings setLegibilitySettings:](v10, "setLegibilitySettings:", v5);
    objc_msgSend(v4, "statusBarManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assertionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(v12, "newSettingsAssertionWithSettings:atLevel:reason:", v10, 0, CFSTR("SBHomeScreenStatusBar"));
    objc_msgSend(v7, "acquire");
    -[NSMapTable setObject:forKey:](self->_statusBarAssertionsByWindowScene, "setObject:forKey:", v7, v4);

  }
}

void __58__SBUIController_updateStatusBarLegibilityForWindowScene___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setStyle:", SBDefaultStatusBarStyle());
  objc_msgSend(v3, "setLegibilitySettings:", *(_QWORD *)(a1 + 32));

}

- (id)_legibilitySettings
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "legibilitySettingsForVariant:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)_currentHomeScreenLegibilitySettings
{
  void *v2;
  void *v3;

  -[SBUIController iconController](self, "iconController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "legibilitySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0DA9E38];
  v6 = a3;
  objc_msgSend(v5, "rootSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SBUIController iconController](self, "iconController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLegibilitySettings:", v9);

    -[SBUIController _updateLegibility](self, "_updateLegibility");
  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBUIController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_contentRequiringReasons, CFSTR("contentRequiringReasons"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBUIController isIconListViewTornDown](self, "isIconListViewTornDown"), CFSTR("isIconListViewTornDown"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBUIController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (CSMagSafeAccessory)lastAttachedAccessory
{
  return self->_lastAttachedAccessory;
}

- (CSMagSafeAccessory)lastDetachedAccessory
{
  return self->_lastDetachedAccessory;
}

- (void)storeAttachedAccessory:(id)a3
{
  void *v4;
  NSMutableDictionary *accessoriesAttachedByUUID;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  id v8;

  v8 = a3;
  -[SBUIController setLastAttachedAccessory:](self, "setLastAttachedAccessory:", v8);
  objc_msgSend(v8, "endpointUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessoriesAttachedByUUID = self->_accessoriesAttachedByUUID;
  if (accessoriesAttachedByUUID)
  {
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = (NSMutableDictionary *)objc_opt_new();
  v7 = self->_accessoriesAttachedByUUID;
  self->_accessoriesAttachedByUUID = v6;

  accessoriesAttachedByUUID = self->_accessoriesAttachedByUUID;
  if (v4)
  {
LABEL_3:
    -[NSMutableDictionary setObject:forKeyedSubscript:](accessoriesAttachedByUUID, "setObject:forKeyedSubscript:", v8, v4);
    -[NSMutableDictionary removeObjectForKey:](self->_accessoriesSuppressedByUUID, "removeObjectForKey:", v4);
    accessoriesAttachedByUUID = self->_accessoriesAttachedByUUID;
  }
LABEL_4:
  if (-[NSMutableDictionary count](accessoriesAttachedByUUID, "count"))
    *((_BYTE *)self + 81) |= 0x10u;

}

- (void)removeDetachedAccessory:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBUIController setLastDetachedAccessory:](self, "setLastDetachedAccessory:", v4);
  objc_msgSend(v4, "endpointUUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NSMutableDictionary removeObjectForKey:](self->_accessoriesAttachedByUUID, "removeObjectForKey:", v5);
  if (!-[NSMutableDictionary count](self->_accessoriesAttachedByUUID, "count"))
    *((_BYTE *)self + 81) &= ~0x10u;

}

- (void)_storeSuppressedAccessory:(id)a3
{
  uint64_t v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *accessoriesSuppressedByUUID;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "endpointUUID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!self->_accessoriesSuppressedByUUID)
  {
    v6 = (NSMutableDictionary *)objc_opt_new();
    accessoriesSuppressedByUUID = self->_accessoriesSuppressedByUUID;
    self->_accessoriesSuppressedByUUID = v6;

    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
LABEL_3:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accessoriesSuppressedByUUID, "setObject:forKeyedSubscript:", v8, v5);
LABEL_4:

}

- (void)_removeSuppressedAccessory:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "endpointUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[NSMutableDictionary removeObjectForKey:](self->_accessoriesAttachedByUUID, "removeObjectForKey:", v4);
    v4 = v5;
  }

}

- (void)setLastAttachedAccessory:(id)a3
{
  CSMagSafeAccessory *v5;
  CSMagSafeAccessory *v6;

  v5 = (CSMagSafeAccessory *)a3;
  if (self->_lastAttachedAccessory != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_lastAttachedAccessory, a3);
    v5 = v6;
  }

}

- (void)setLastDetachedAccessory:(id)a3
{
  CSMagSafeAccessory *v5;
  CSMagSafeAccessory *v6;

  v5 = (CSMagSafeAccessory *)a3;
  if (self->_lastDetachedAccessory != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_lastDetachedAccessory, a3);
    v5 = v6;
  }

}

- (BOOL)isAccessoryAnimationAllowed
{
  return self->_isAccessoryAnimationAllowed;
}

- (void)setIsAccessoryAnimationAllowed:(BOOL)a3
{
  id v3;

  if (self->_isAccessoryAnimationAllowed != a3)
  {
    self->_isAccessoryAnimationAllowed = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("SBUIAccessoryAnimationStatusChangedNotification"), 0, 0);

  }
}

- (void)windowedAccessoryDismissed
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SBUIController_windowedAccessoryDismissed__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __44__SBUIController_windowedAccessoryDismissed__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  void *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "isWindowed"))
        {
          SBLogAccessory();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "description");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v15 = v9;
            _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Windowed accessory dismissed: %@", buf, 0xCu);

          }
          objc_msgSend(*(id *)(a1 + 32), "_dismissAccessory:playChime:", v7, 0);
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)windowedAccessoryPresented
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SBUIController_windowedAccessoryPresented__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __44__SBUIController_windowedAccessoryPresented__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[SBAccessoryController sharedInstance](SBAccessoryController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showWindowedAccessoryWindow:forWindowScene:", 1, v2);

}

- (void)_dismissAccessory:(id)a3 playChime:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
    -[SBUIController removeDetachedAccessory:](self, "removeDetachedAccessory:", v6);
  if (objc_msgSend(v6, "isWindowed"))
  {
    -[SBUIController _setConnectedToWindowedAccessory:](self, "_setConnectedToWindowedAccessory:", 0);
    +[SBAccessoryController sharedInstance](SBAccessoryController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIController windowScene](self, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showWindowedAccessoryWindow:forWindowScene:", 0, v8);

  }
  if (objc_msgSend(v6, "shouldShowAnimation"))
  {
    SBLogAccessory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "About to dismiss animation for accessory: %@ ", (uint8_t *)&v12, 0xCu);

    }
    if (v4)
      -[SBUIController _playAccessoryChimeIfAppropriateForAccessory:attaching:withDelay:](self, "_playAccessoryChimeIfAppropriateForAccessory:attaching:withDelay:", v6, 0, 0.0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("SBUIAccessoryDetachedNotification"), 0);

  }
}

- (BOOL)_shouldInitiateAnimationForAccessory:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (-[SBUIController _shouldShowAnimationForAccessory:](self, "_shouldShowAnimationForAccessory:", v4))
  {
    if ((objc_msgSend(v4, "isWindowed") & 1) != 0)
      LOBYTE(v5) = 1;
    else
      v5 = !-[SBUIController _isConnectedToWirelessCharging](self, "_isConnectedToWirelessCharging");
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_blocksAnimationForAccessoryType:(int64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allValues](self->_accessoriesAttachedByUUID, "allValues");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "blocksAttachAnimationForAccessoryType:", a3, (_QWORD)v11) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)_shouldShowAnimationForAccessory:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "shouldShowAnimation");
  v6 = objc_msgSend(v4, "type");

  if (-[SBUIController _blocksAnimationForAccessoryType:](self, "_blocksAnimationForAccessoryType:", v6))
  {
    SBLogAccessory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Wallet animation is not allowed because Clear Case is attached.", v9, 2u);
    }

    return 0;
  }
  return v5;
}

- (void)_setAccessoryAttachmentAnimationBlockingTimerWithDuration:(double)a3
{
  NSObject *v5;
  BSAbsoluteMachTimer *v6;
  BSAbsoluteMachTimer *accessoryAttachmentAnimationBlockingTimer;
  BSAbsoluteMachTimer *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id buf[2];

  if (!self->_accessoryAttachmentAnimationBlockingTimer)
  {
    SBLogAccessory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Disable accessory animations", (uint8_t *)buf, 2u);
    }

    -[SBUIController setIsAccessoryAnimationAllowed:](self, "setIsAccessoryAnimationAllowed:", 0);
    objc_initWeak(buf, self);
    v6 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBUIController.accessoryAttachmentAnimationBlockingTimer"));
    accessoryAttachmentAnimationBlockingTimer = self->_accessoryAttachmentAnimationBlockingTimer;
    self->_accessoryAttachmentAnimationBlockingTimer = v6;

    v8 = self->_accessoryAttachmentAnimationBlockingTimer;
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__SBUIController__setAccessoryAttachmentAnimationBlockingTimerWithDuration___block_invoke;
    v11[3] = &unk_1E8E9EEC8;
    objc_copyWeak(&v12, buf);
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v8, "scheduleWithFireInterval:leewayInterval:queue:handler:", v9, v11, a3, 0.0);

    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
}

void __76__SBUIController__setAccessoryAttachmentAnimationBlockingTimerWithDuration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_animationBlockingTimerFired");

}

- (void)_animationBlockingTimerFired
{
  NSObject *v3;
  BSAbsoluteMachTimer *accessoryAttachmentAnimationBlockingTimer;
  uint8_t v5[16];

  SBLogAccessory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Enable accessory animations", v5, 2u);
  }

  -[SBUIController setIsAccessoryAnimationAllowed:](self, "setIsAccessoryAnimationAllowed:", 1);
  -[BSAbsoluteMachTimer invalidate](self->_accessoryAttachmentAnimationBlockingTimer, "invalidate");
  accessoryAttachmentAnimationBlockingTimer = self->_accessoryAttachmentAnimationBlockingTimer;
  self->_accessoryAttachmentAnimationBlockingTimer = 0;

}

- (void)accessoryConnectionInfoProvider:(id)a3 accessoryEndpointAttached:(id)a4 transportType:(int)a5 protocol:(int)a6 properties:(id)a7 forConnection:(id)a8
{
  id v11;
  id v12;
  void *v13;
  _QWORD block[4];
  id v15;
  id v16;
  SBUIController *v17;

  v11 = a4;
  v12 = a7;
  v13 = v12;
  if (a5 == 13)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __124__SBUIController_accessoryConnectionInfoProvider_accessoryEndpointAttached_transportType_protocol_properties_forConnection___block_invoke;
    block[3] = &unk_1E8E9E270;
    v15 = v12;
    v16 = v11;
    v17 = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __124__SBUIController_accessoryConnectionInfoProvider_accessoryEndpointAttached_transportType_protocol_properties_forConnection___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BBE0]), "initWithDictionary:endpointUUID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (objc_msgSend(v2, "isSupported"))
  {
    objc_msgSend(*(id *)(a1 + 48), "_accessoryEndpointAttached:", v2);
  }
  else
  {
    SBLogAccessory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Suppressing unsupported accessory: %@, endpointUUID: %@", (uint8_t *)&v6, 0x16u);

    }
    if ((objc_msgSend(*(id *)(a1 + 48), "_isAppropriateToReactToAccessoryEvent") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 48), "_storeSuppressedAccessory:", v2);
  }

}

- (void)_accessoryEndpointAttached:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "endpointUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIController storeAttachedAccessory:](self, "storeAttachedAccessory:", v5);
    SBLogAccessory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Accessory attached: %@, endpointUUID: %@", buf, 0x16u);

    }
    if (-[SBUIController _shouldInitiateAnimationForAccessory:](self, "_shouldInitiateAnimationForAccessory:", v5))
    {
      if ((*((_BYTE *)self + 81) & 0x20) == 0 && objc_msgSend(v5, "isWindowed"))
      {
        objc_msgSend(v5, "visibleScreenCoordinates");
        self->_visibleScreenCoordinatesForWindowedAccessory.origin.x = v9;
        self->_visibleScreenCoordinatesForWindowedAccessory.origin.y = v10;
        self->_visibleScreenCoordinatesForWindowedAccessory.size.width = v11;
        self->_visibleScreenCoordinatesForWindowedAccessory.size.height = v12;
        -[SBUIController _setConnectedToWindowedAccessory:](self, "_setConnectedToWindowedAccessory:", 1);
      }
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "inCallPresentationManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __45__SBUIController__accessoryEndpointAttached___block_invoke;
      v15[3] = &unk_1E8E9EEF0;
      v15[4] = self;
      v16 = v6;
      v17 = v5;
      objc_msgSend(v14, "handleAccessoryAttachWithCompletion:", v15);

    }
  }

}

void __45__SBUIController__accessoryEndpointAttached___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
  if (v4)
  {
    objc_msgSend(v4, "endpointUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 40));

    if ((v6 & 1) != 0)
    {
      SBLogAccessory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Accessory already detached: %@", buf, 0xCu);
      }
      goto LABEL_15;
    }
  }
  SBLogAccessory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "About to show animation for accessory: %@ ", buf, 0xCu);

  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v7 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject isUILocked](v7, "isUILocked"))
  {
    v21[0] = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
    v21[1] = CFSTR("SBUIUnlockOptionsStartFadeInAnimation");
    v22[0] = MEMORY[0x1E0C9AAB0];
    v22[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject unlockUIFromSource:withOptions:](v7, "unlockUIFromSource:withOptions:", 31, v11);
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "shouldLockScreenWhenAttached"))
  {
    v20[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2, CFSTR("SBUILockOptionsLockAutomaticallyKey"), CFSTR("SBUILockOptionsPreserveTransientOverlaysKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
    v20[1] = v11;
    v20[2] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject lockUIFromSource:withOptions:](v7, "lockUIFromSource:withOptions:", 24, v12);

    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "chargingSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "omniAccessoryAnimationDelayInMilliseconds");
  v16 = v15 / 1000.0;
  if (objc_msgSend(*(id *)(a1 + 48), "shouldDelayAnimation"))
  {
    objc_msgSend(*(id *)(a1 + 48), "attachAnimationDelay");
    v16 = v16 + v17;
  }
  objc_msgSend(*(id *)(a1 + 32), "_playAccessoryChimeIfAppropriateForAccessory:attaching:withDelay:", *(_QWORD *)(a1 + 48), 1, v16);
  objc_msgSend(*(id *)(a1 + 32), "storeAttachedAccessory:", *(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("SBUIAccessoryAttachedNotification"), 0, 0);

LABEL_15:
}

- (void)accessoryConnectionInfoProvider:(id)a3 accessoryEndpointInfoPropertyChanged:(id)a4 properties:(id)a5 forConnection:(id)a6
{
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v9 = a4;
  v10 = a5;
  if (-[SBAccessoryConnectionInfoProvider accessoryEndpointTransportType:connection:](self->_accessoryConnectionInfoProvider, "accessoryEndpointTransportType:connection:", v9, a6) == 13)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __112__SBUIController_accessoryConnectionInfoProvider_accessoryEndpointInfoPropertyChanged_properties_forConnection___block_invoke;
    block[3] = &unk_1E8E9E270;
    block[4] = self;
    v12 = v9;
    v13 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __112__SBUIController_accessoryConnectionInfoProvider_accessoryEndpointInfoPropertyChanged_properties_forConnection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BBE0]), "initWithDictionary:endpointUUID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    if (objc_msgSend(*(id *)(a1 + 32), "_treatsAccessoryAsSupported:"))
      objc_msgSend(*(id *)(a1 + 32), "_accessoryEndpointAttached:", v3);
    v2 = v3;
  }

}

- (void)accessoryConnectionInfoProvider:(id)a3 accessoryEndpointDetached:(id)a4 forConnection:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__SBUIController_accessoryConnectionInfoProvider_accessoryEndpointDetached_forConnection___block_invoke;
  v8[3] = &unk_1E8E9E820;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __90__SBUIController_accessoryConnectionInfoProvider_accessoryEndpointDetached_forConnection___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "_treatsAccessoryAsSupported:");
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "_accessoryEndpointDetached:", v4);
  else
    objc_msgSend(v3, "_removeSuppressedAccessory:", v4);

}

- (BOOL)_treatsAccessoryAsSupported:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "isSupported");
  objc_msgSend(v4, "endpointUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_accessoriesSuppressedByUUID, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;

    if (v7 && ((v5 ^ 1) & 1) == 0)
    {
      SBLogAccessory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "endpointUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = v10;
        v15 = 2112;
        v16 = v11;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Suppressing late-arriving accessory: %@, endpointUUID: %@", (uint8_t *)&v13, 0x16u);

      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v5 & v8;
}

- (void)_accessoryEndpointDetached:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "endpointUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogAccessory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Accessory detached: %@, endpointUUID: %@", (uint8_t *)&v8, 0x16u);

  }
  if (v4)
    -[SBUIController _dismissAccessory:playChime:](self, "_dismissAccessory:playChime:", v4, objc_msgSend(v4, "chimeOnDetach"));

}

- (void)_setConnectedToWindowedAccessory:(BOOL)a3
{
  char v3;
  _BOOL8 v4;
  char v6;
  BSInvalidatable *suspendProximityForAttachedWindowedAccessoryAssertion;
  void *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  void *v11;
  void *v12;
  SBFZStackParticipant *v13;
  SBFZStackParticipant *zStackParticipant;
  BSInvalidatable *v15;
  SBFZStackParticipant *v16;
  CGSize v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = *((_BYTE *)self + 81);
  if (((((v3 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    if (a3)
      v6 = 32;
    else
      v6 = 0;
    *((_BYTE *)self + 81) = v3 & 0xDF | v6;
    suspendProximityForAttachedWindowedAccessoryAssertion = self->_suspendProximityForAttachedWindowedAccessoryAssertion;
    if (a3)
    {
      if (!suspendProximityForAttachedWindowedAccessoryAssertion)
      {
        objc_msgSend((id)SBApp, "HIDUISensorController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "suspendProximityDetectionForSource:reason:", 36, CFSTR("Windowed Accessory Attached"));
        v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
        v10 = self->_suspendProximityForAttachedWindowedAccessoryAssertion;
        self->_suspendProximityForAttachedWindowedAccessoryAssertion = v9;

      }
      if (!self->_zStackParticipant)
      {
        -[SBUIController windowScene](self, "windowScene");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "zStackResolver");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "acquireParticipantWithIdentifier:delegate:", 29, self);
        v13 = (SBFZStackParticipant *)objc_claimAutoreleasedReturnValue();
        zStackParticipant = self->_zStackParticipant;
        self->_zStackParticipant = v13;

      }
    }
    else
    {
      if (suspendProximityForAttachedWindowedAccessoryAssertion)
      {
        -[BSInvalidatable invalidate](suspendProximityForAttachedWindowedAccessoryAssertion, "invalidate");
        v15 = self->_suspendProximityForAttachedWindowedAccessoryAssertion;
        self->_suspendProximityForAttachedWindowedAccessoryAssertion = 0;

      }
      -[SBFZStackParticipant invalidate](self->_zStackParticipant, "invalidate");
      v16 = self->_zStackParticipant;
      self->_zStackParticipant = 0;

      v17 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      self->_visibleScreenCoordinatesForWindowedAccessory.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      self->_visibleScreenCoordinatesForWindowedAccessory.size = v17;
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("SBUIWindowedAccessoryAttachedKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("SBUIWindowedAccessoryDidAttachOrDetachNotification"), self, v20);

  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "setActivationPolicyForParticipantsBelow:", 0);
  objc_msgSend(v4, "setHomeGestureConsumption:", 1);

}

- (UIView)homeScreenContentView
{
  return self->_contentView;
}

- (UIView)homeScreenScalingView
{
  return self->_iconsView;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (BOOL)chargingChimeEnabled
{
  return self->_chargingChimeEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconController, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_accessoriesSuppressedByUUID, 0);
  objc_storeStrong((id *)&self->_accessoriesAttachedByUUID, 0);
  objc_storeStrong((id *)&self->_lastDetachedAccessory, 0);
  objc_storeStrong((id *)&self->_lastAttachedAccessory, 0);
  objc_storeStrong((id *)&self->_debounceWirelessChargingTimer, 0);
  objc_storeStrong((id *)&self->_motionAlarmController, 0);
  objc_storeStrong((id *)&self->_accessoryAttachmentAnimationBlockingTimer, 0);
  objc_storeStrong((id *)&self->_accessoryConnectionInfoProvider, 0);
  objc_storeStrong((id *)&self->_connectedWirelessChargerId, 0);
  objc_storeStrong((id *)&self->_wallpaperRasterizationAssertion, 0);
  objc_storeStrong((id *)&self->_appDirectoryClient, 0);
  objc_storeStrong((id *)&self->_contentRequiringReasons, 0);
  objc_storeStrong((id *)&self->_switcherSettings, 0);
  objc_storeStrong((id *)&self->_unsupportedChargerAlert, 0);
  objc_storeStrong((id *)&self->_powerSourceHasChimed, 0);
  objc_storeStrong((id *)&self->_volumeControl, 0);
  objc_storeStrong((id *)&self->_HUDController, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_suspendProximityForAttachedWindowedAccessoryAssertion, 0);
  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
  objc_storeStrong((id *)&self->_homeButtonForceProgress, 0);
  objc_storeStrong((id *)&self->_statusBarAssertionsByWindowScene, 0);
  objc_storeStrong((id *)&self->_reachabilityWallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_homeScreenDimmingWindow, 0);
  objc_storeStrong((id *)&self->_homeScreenBackdropView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_iconsView, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

+ (CGAffineTransform)_transformForStatusBarWithOrientation:(SEL)a3 scaleFactor:(int64_t)a4
{
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CGAffineTransform *result;
  __int128 v12;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v7 = MEMORY[0x1E0C9BAA8];
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v7 + 32);
  if ((unint64_t)(a4 - 2) <= 2)
    CGAffineTransformMakeRotation(retstr, dbl_1D0E8AB28[a4 - 2]);
  v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v14.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v14.c = v9;
  *(_OWORD *)&v14.tx = *(_OWORD *)&retstr->tx;
  UIIntegralTransform();
  v10 = *(_OWORD *)&v15.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v15.a;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v15.tx;
  result = (CGAffineTransform *)BSFloatEqualToFloat();
  if ((result & 1) == 0)
  {
    v12 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v14.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v14.c = v12;
    *(_OWORD *)&v14.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformScale(&v15, &v14, a5, a5);
    v13 = *(_OWORD *)&v15.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v15.a;
    *(_OWORD *)&retstr->c = v13;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v15.tx;
  }
  return result;
}

+ (CGAffineTransform)_transformAndFrame:(SEL)a3 forLaunchImageHostViewWithOrientation:(CGRect *)a4 statusBarHeight:(int64_t)a5 inJailRect:(double)a6
{
  double width;
  __int128 v9;
  double height;
  double v11;
  double v12;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  width = a7.size.width;
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v16.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v16.c = v9;
  *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  height = a7.size.height;
  switch(a5)
  {
    case 1:
      a4->origin.x = a7.origin.x;
      a4->origin.y = a7.origin.y + a6;
      a4->size.width = width;
      a4->size.height = a7.size.height - a6;
      break;
    case 2:
      a4->origin.x = a7.origin.x;
      a4->origin.y = a7.origin.y;
      a4->size.width = width;
      a4->size.height = a7.size.height - a6;
      CGAffineTransformMakeRotation(&v16, 3.14159265);
      break;
    case 3:
      a4->origin.x = a7.origin.x;
      a4->origin.y = a7.origin.y + a6;
      a4->size.width = a7.size.height;
      a4->size.height = width - a6;
      CGAffineTransformMakeRotation(&v16, 1.57079633);
      v11 = (height - width - a6) * 0.5;
      v12 = v11 + a6;
      v14 = v16;
      goto LABEL_6;
    case 4:
      a4->origin.x = a7.origin.x;
      a4->origin.y = a7.origin.y + a6;
      a4->size.width = a7.size.height;
      a4->size.height = width - a6;
      CGAffineTransformMakeRotation(&v16, -1.57079633);
      v11 = (height - width - a6) * -0.5;
      v14 = v16;
      v12 = v11;
LABEL_6:
      CGAffineTransformTranslate(&v15, &v14, v11, v12);
      v16 = v15;
      break;
    default:
      break;
  }
  v15 = v16;
  return (CGAffineTransform *)UIIntegralTransform();
}

+ (CGRect)statusBarFrameForDeviceApplicationSceneHandle:(id)a3 displayConfiguration:(id)a4 interfaceOrientation:(int64_t)a5 statusBarStyleRequest:(id)a6 withinBounds:(CGRect)a7 inReferenceSpace:(BOOL)a8
{
  _BOOL4 v8;
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  void *v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  id *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect result;

  v8 = a8;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v17 = a4;
  v18 = a6;
  objc_msgSend(a3, "application");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = a5 - 3;
  v64.origin.x = x;
  v64.origin.y = y;
  v64.size.width = width;
  v64.size.height = height;
  v21 = CGRectGetHeight(v64);
  v65.origin.x = x;
  v65.origin.y = y;
  v65.size.width = width;
  v65.size.height = height;
  v22 = CGRectGetWidth(v65);
  if ((unint64_t)(a5 - 3) < 2)
  {
    v23 = v21;
  }
  else
  {
    v22 = height;
    v23 = width;
  }
  v24 = 0.0;
  if (v20 >= 2)
    v25 = y;
  else
    v25 = 0.0;
  if (v20 >= 2)
    v24 = x;
  if (v8)
    v26 = height;
  else
    v26 = v22;
  if (v8)
    v27 = width;
  else
    v27 = v23;
  v62 = v27;
  v63 = v26;
  if (v8)
    v28 = y;
  else
    v28 = v25;
  if (v8)
    v29 = x;
  else
    v29 = v24;
  v60 = v28;
  v61 = v29;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "userInterfaceIdiom");

  if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1
    && SBApplicationClassicModeRepresentsPad(objc_msgSend(v19, "_classicMode"))
    && objc_msgSend(v19, "classicAppNonFullScreenWithHomeAffordance"))
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "defaultLaunchingSizeForDisplayConfiguration:", v17);
    v34 = v62;
    v33 = v63;
    SBClassicUtilitiesScaleFactorForPresentationWithHomeAffordance(v32, a5, objc_msgSend(v19, "includesStatusBarInClassicJailForInterfaceOrientation:", a5), v62, v63, v35, v36, 1.0);
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", objc_msgSend(v18, "style"), a5);
      UIRectCenteredXInRect();
      v37 = v66.origin.x;
      if (CGRectGetMinX(v66) >= 16.0)
      {
        v38 = v37;
      }
      else
      {
        v67.origin.x = x;
        v67.origin.y = y;
        v67.size.width = width;
        v67.size.height = height;
        v38 = CGRectGetWidth(v67);
      }
      SBClassicUtilitiesStatusBarInsetsForPadOnRoundedPad((uint64_t)v32, objc_msgSend(v19, "_classicMode", v38));
      v55 = (id *)MEMORY[0x1E0CEB258];
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      objc_msgSend(*v55, "userInterfaceLayoutDirection");
      UIRectInset();
      v40 = v56;
      v42 = v57;
      v44 = v58;
      v46 = v59;
      if (v8)
        goto LABEL_29;
      goto LABEL_30;
    }
  }
  else
  {
    v32 = 0;
    v34 = v62;
    v33 = v63;
  }
  objc_msgSend(a1, "statusBarFrameForSnapshotFrame:orientation:statusBarStyleRequest:hidden:", a5, v18, 0, v61, v60, v34, v33);
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  if (!v8)
  {
LABEL_29:
    _UIWindowConvertRectFromOrientationToOrientation();
    v40 = v47;
    v42 = v48;
    v44 = v49;
    v46 = v50;
  }
LABEL_30:

  v51 = v40;
  v52 = v42;
  v53 = v44;
  v54 = v46;
  result.size.height = v54;
  result.size.width = v53;
  result.origin.y = v52;
  result.origin.x = v51;
  return result;
}

- (void)updateBatteryState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Battery is at critical level", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __37__SBUIController_updateBatteryState___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Shutting down immediately due to kIOPMPSAtCriticalLevelKey battery notification", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __37__SBUIController_updateBatteryState___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Restarting immediately due to kIOPMPSAtCriticalLevelKey battery notification", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
