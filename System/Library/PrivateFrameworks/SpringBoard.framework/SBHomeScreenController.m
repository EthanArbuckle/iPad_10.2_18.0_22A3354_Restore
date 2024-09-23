@implementation SBHomeScreenController

- (SBWindow)window
{
  return (SBWindow *)self->_homeScreenWindow;
}

- (UIView)homeScreenContentView
{
  return self->_homeScreenContentView;
}

- (UIView)homeScreenScalingView
{
  return self->_homeScreenScalingView;
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
  -[SBHomeScreenController homeScreenScalingView](self, "homeScreenScalingView");
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
    v13[2] = __92__SBHomeScreenController_AppearanceControlling__setHomeScreenAlpha_behaviorMode_completion___block_invoke;
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

uint64_t __92__SBHomeScreenController_AppearanceControlling__setHomeScreenAlpha_behaviorMode_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
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
  -[SBHomeScreenController homeScreenScalingView](self, "homeScreenScalingView");
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
    v13[2] = __92__SBHomeScreenController_AppearanceControlling__setHomeScreenScale_behaviorMode_completion___block_invoke;
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

uint64_t __92__SBHomeScreenController_AppearanceControlling__setHomeScreenScale_behaviorMode_completion___block_invoke(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  return objc_msgSend(v1, "setTransform:", &v3);
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
    v23[2] = __99__SBHomeScreenController_AppearanceControlling__setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke;
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
      v20[2] = __99__SBHomeScreenController_AppearanceControlling__setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke_2;
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

uint64_t __99__SBHomeScreenController_AppearanceControlling__setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t result;

  if ((a3 & 1) == 0)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(*(id *)(a1 + 40), "alpha");
    objc_msgSend(v6, "setHidden:", BSFloatIsZero());
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

uint64_t __99__SBHomeScreenController_AppearanceControlling__setHomeScreenDimmingAlpha_behaviorMode_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)setHomeScreenBlurProgress:(double)a3 behaviorMode:(int64_t)a4 completion:(id)a5
{
  -[SBHomeScreenBackdropViewBase setBlurProgress:behaviorMode:completion:](self->_homeScreenBackdropView, "setBlurProgress:behaviorMode:completion:", a4, a5, a3);
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
  v15[2] = __117__SBHomeScreenController_AppearanceControlling__setHomeScreenBackdropBlurMaterialRecipeName_behaviorMode_completion___block_invoke;
  v15[3] = &unk_1E8E9E820;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v9, "sb_animateWithSettings:mode:animations:completion:", v13, a4, v15, v11);

}

void __117__SBHomeScreenController_AppearanceControlling__setHomeScreenBackdropBlurMaterialRecipeName_behaviorMode_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_opt_class();
  SBSafeCast(v2, *(void **)(*(_QWORD *)(a1 + 32) + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setMaterialRecipeName:", *(_QWORD *)(a1 + 40));
    v3 = v4;
  }

}

- (void)_willRevealOrHideContentView
{
  id v2;

  -[SBHomeScreenController iconManager](self, "iconManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllFolderScrolling");

}

- (void)_closeOpenFolderIfNecessary
{
  void *v2;
  id v3;

  -[SBHomeScreenController iconManager](self, "iconManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconToReveal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && objc_msgSend(v3, "hasOpenFolder"))
    objc_msgSend(v3, "popToCurrentRootIconList");

}

- (void)restoreContent
{
  -[SBHomeScreenController restoreContentWithOptions:](self, "restoreContentWithOptions:", 0);
}

- (void)restoreContentWithOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  _BOOL4 v22;
  const char *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[3];
  _QWORD v33[3];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[SBHomeScreenController windowScene](self, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isUILocked");
  v8 = objc_msgSend(v5, "isContinuityDisplayWindowScene");
  SBLogUIController();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSBUIControllerRequireContentOptions(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v10;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Attempting restoreContentWithOptions:(%@)", buf, 0xCu);

  }
  if ((a3 & 2) == 0)
  {
    objc_msgSend((id)SBApp, "lockOutController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isLockedOut") & 1) != 0)
    {

      if ((v7 & 1) == 0)
        goto LABEL_6;
    }
    else
    {
      objc_msgSend(v6, "lockScreenEnvironment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "callController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isMakingEmergencyCall");

      if (((v17 ^ 1 | v7) & 1) == 0)
      {
LABEL_6:
        v32[0] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
        v32[1] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
        v33[0] = MEMORY[0x1E0C9AAA0];
        v33[1] = MEMORY[0x1E0C9AAB0];
        v32[2] = CFSTR("SBUILockOptionsForceLockKey");
        v33[2] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lockUIFromSource:withOptions:", 6, v12);

        SBLogUIController();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v14 = "abort restoreContentWithOptions: Force lock case";
LABEL_15:
          _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
          goto LABEL_41;
        }
        goto LABEL_41;
      }
    }
  }
  if (((v7 ^ 1 | v8) & 1) != 0)
  {
    objc_msgSend((id)SBApp, "restartManager");
    v13 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isPendingExit](v13, "isPendingExit"))
    {
      SBLogUIController();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "abort restoreContentWithOptions: restartManager isPendingExit", buf, 2u);
      }
      goto LABEL_40;
    }
    -[SBHomeScreenController homeScreenScalingView](self, "homeScreenScalingView");
    v19 = objc_claimAutoreleasedReturnValue();
    v18 = v19;
    if (v19 && (-[NSObject isHidden](v19, "isHidden") & 1) == 0)
    {
      SBLogUIController();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v23 = "abort restoreContentWithOptions: _iconsView is already visible";
        goto LABEL_33;
      }
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
    v20 = -[SBHomeScreenBackdropViewBase isOpaque](self->_homeScreenBackdropView, "isOpaque");
    SBLogUIController();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v22)
      {
        *(_WORD *)buf = 0;
        v23 = "abort restoreContentWithOptions: _homeScreenBackdropView is opaque";
LABEL_33:
        _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
        goto LABEL_39;
      }
      goto LABEL_39;
    }
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "Restoring home screen", buf, 2u);
    }

    v24 = -[SBHomeScreenController isIconListViewTornDown](self, "isIconListViewTornDown");
    -[SBHomeScreenController _willRevealOrHideContentView](self, "_willRevealOrHideContentView");
    -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
    v21 = objc_claimAutoreleasedReturnValue();
    SBLogUIController();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "Setting _iconsView to visible", buf, 2u);
    }

    -[NSObject setIconContentHidden:](v21, "setIconContentHidden:", 0);
    -[SBHomeScreenController window](self, "window");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "traitsParticipant");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setNeedsUpdatePreferencesWithReason:animate:", CFSTR("restore icons"), 0);

    -[SBHomeScreenController _closeOpenFolderIfNecessary](self, "_closeOpenFolderIfNecessary");
    -[SBHomeScreenController updateNumberOfRowsWithDuration:](self, "updateNumberOfRowsWithDuration:", 0.0);
    if ((a3 & 1) == 0)
      -[SBHomeScreenController updateStatusBarLegibilityForWindowScene:](self, "updateStatusBarLegibilityForWindowScene:", v5);
    if (objc_msgSend(v5, "isMainDisplayWindowScene"))
    {
      -[SBHomeScreenController _switchToHomeScreenWallpaperAnimated:](self, "_switchToHomeScreenWallpaperAnimated:", 1);
      +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "activateOrientationSource:", 2);

      if (!v24)
      {
LABEL_29:
        if ((a3 & 4) == 0)
          goto LABEL_39;
        goto LABEL_38;
      }
    }
    else if (!v24)
    {
      goto LABEL_29;
    }
    -[SBHomeScreenController window](self, "window");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")) & 1) == 0)
      objc_msgSend(v29, "_updateInterfaceOrientationFromActiveInterfaceOrientationIfRotationEnabled:", 0);
    objc_msgSend(v29, "layoutBelowIfNeeded");

    if ((a3 & 4) == 0)
      goto LABEL_39;
LABEL_38:
    -[SBHomeScreenController iconManager](self, "iconManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "rootFolderController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "presentSpotlightAnimated:completionHandler:", 0, &__block_literal_global_227);

    goto LABEL_39;
  }
  SBLogUIController();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v14 = "abort restoreContentWithOptions: UI is locked";
    goto LABEL_15;
  }
LABEL_41:

}

- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3
{
  -[SBHomeScreenController restoreContentAndUnscatterIconsAnimated:withCompletion:](self, "restoreContentAndUnscatterIconsAnimated:withCompletion:", a3, 0);
}

- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3 withCompletion:(id)a4
{
  -[SBHomeScreenController restoreContentAndUnscatterIconsAnimated:afterDelay:withCompletion:](self, "restoreContentAndUnscatterIconsAnimated:afterDelay:withCompletion:", a3, a4, 0.0);
}

- (void)restoreContentAndUnscatterIconsAnimated:(BOOL)a3 afterDelay:(double)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;

  v6 = a3;
  v8 = a5;
  -[SBHomeScreenController restoreContent](self, "restoreContent");
  -[SBHomeScreenController iconManager](self, "iconManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unscatterAnimated:afterDelay:withCompletion:", v6, v8, a4);

}

- (void)tearDownIconListAndBar
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint8_t v8[16];

  if (!-[NSMutableSet count](self->_contentRequiringReasons, "count")
    || -[SBHomeScreenBackdropViewBase isOpaque](self->_homeScreenBackdropView, "isOpaque"))
  {
    SBLogUIController();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Tearing down home screen", v8, 2u);
    }

    -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIconContentHidden:", 1);
    -[SBHomeScreenController windowScene](self, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isMainDisplayWindowScene");

    if (v6)
    {
      +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deactivateOrientationSource:", 2);

    }
  }
}

- (BOOL)isIconListViewTornDown
{
  void *v2;
  char v3;

  -[SBHomeScreenController homeScreenScalingView](self, "homeScreenScalingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)beginRequiringContentForReason:(id)a3
{
  -[SBHomeScreenController beginRequiringContentForReason:options:](self, "beginRequiringContentForReason:options:", a3, 0);
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
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenController+AppearanceControlling.m"), 315, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

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
  if (!v12 || -[SBHomeScreenController isIconListViewTornDown](self, "isIconListViewTornDown"))
    -[SBHomeScreenController restoreContentWithOptions:](self, "restoreContentWithOptions:", a4);

}

- (void)endRequiringContentForReason:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenController+AppearanceControlling.m"), 332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  SBLogUIController();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "End requiring home screen content for reason '%{public}@'", buf, 0xCu);
  }

  v7 = -[NSMutableSet count](self->_contentRequiringReasons, "count");
  -[NSMutableSet removeObject:](self->_contentRequiringReasons, "removeObject:", v5);
  v8 = -[NSMutableSet count](self->_contentRequiringReasons, "count");
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (v9)
    -[SBHomeScreenController tearDownIconListAndBar](self, "tearDownIconListAndBar");

}

- (void)beginRequiringBackdropViewForReason:(id)a3
{
  -[SBHomeScreenBackdropViewBase beginRequiringBackdropViewForReason:](self->_homeScreenBackdropView, "beginRequiringBackdropViewForReason:", a3);
  -[SBHomeScreenController _updateRequireWallpaperRasterization](self, "_updateRequireWallpaperRasterization");
}

- (void)beginRequiringLiveBackdropViewForReason:(id)a3
{
  -[SBHomeScreenBackdropViewBase beginRequiringLiveBackdropViewForReason:](self->_homeScreenBackdropView, "beginRequiringLiveBackdropViewForReason:", a3);
  -[SBHomeScreenController _updateRequireWallpaperRasterization](self, "_updateRequireWallpaperRasterization");
}

- (void)endRequiringBackdropViewForReason:(id)a3
{
  -[SBHomeScreenBackdropViewBase endRequiringBackdropViewForReason:](self->_homeScreenBackdropView, "endRequiringBackdropViewForReason:", a3);
  -[SBHomeScreenController _removeReachabilityEffectViewIfNecessary](self, "_removeReachabilityEffectViewIfNecessary");
  -[SBHomeScreenController _updateRequireWallpaperRasterization](self, "_updateRequireWallpaperRasterization");
}

- (void)endRequiringLiveBackdropViewForReason:(id)a3
{
  -[SBHomeScreenBackdropViewBase endRequiringLiveBackdropViewForReason:](self->_homeScreenBackdropView, "endRequiringLiveBackdropViewForReason:", a3);
  -[SBHomeScreenController _removeReachabilityEffectViewIfNecessary](self, "_removeReachabilityEffectViewIfNecessary");
  -[SBHomeScreenController _updateRequireWallpaperRasterization](self, "_updateRequireWallpaperRasterization");
}

- (void)_updateRequireWallpaperRasterization
{
  _BOOL4 v3;
  BSInvalidatable *wallpaperRasterizationAssertion;
  BSInvalidatable *v5;
  BSInvalidatable *v6;
  BSInvalidatable *v7;
  void *v8;

  v3 = -[SBHomeScreenController isBackdropVisible](self, "isBackdropVisible");
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

- (void)cancelInProcessAnimations
{
  void *v3;

  -[SBHomeScreenController window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_removeAllRetargetableAnimations:", 1);

  -[SBWindow _removeAllRetargetableAnimations:](self->_homeScreenDimmingWindow, "_removeAllRetargetableAnimations:", 1);
  -[SBHomeScreenBackdropViewBase cancelInProcessAnimations](self->_homeScreenBackdropView, "cancelInProcessAnimations");
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

- (void)handleWillBeginReachabilityAnimation
{
  void *v3;
  SBWallpaperEffectView *v4;
  SBWallpaperEffectView *reachabilityWallpaperEffectView;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  if (-[SBHomeScreenBackdropViewBase requiresBackdropView](self->_homeScreenBackdropView, "requiresBackdropView")
    || -[SBHomeScreenBackdropViewBase requiresLiveBackdropView](self->_homeScreenBackdropView, "requiresLiveBackdropView"))
  {
    -[SBHomeScreenController beginRequiringLiveBackdropViewForReason:](self, "beginRequiringLiveBackdropViewForReason:", CFSTR("ReachabilityAnimation"));
    if (!self->_reachabilityWallpaperEffectView)
    {
      -[SBHomeScreenController homeScreenContentView](self, "homeScreenContentView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[SBWallpaperEffectView initWithWallpaperVariant:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:", 1);
      reachabilityWallpaperEffectView = self->_reachabilityWallpaperEffectView;
      self->_reachabilityWallpaperEffectView = v4;

      -[PBUIWallpaperEffectViewBase setForcesOpaque:](self->_reachabilityWallpaperEffectView, "setForcesOpaque:", 1);
      -[PBUIWallpaperEffectViewBase setFullscreen:](self->_reachabilityWallpaperEffectView, "setFullscreen:", 1);
      -[PBUIWallpaperEffectViewBase setStyle:](self->_reachabilityWallpaperEffectView, "setStyle:", 0);
      objc_msgSend(v3, "addSubview:", self->_reachabilityWallpaperEffectView);
      objc_msgSend(v3, "sendSubviewToBack:", self->_reachabilityWallpaperEffectView);
      v6 = (void *)MEMORY[0x1E0CEABB0];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __85__SBHomeScreenController_AppearanceControlling__handleWillBeginReachabilityAnimation__block_invoke;
      v8[3] = &unk_1E8E9E820;
      v8[4] = self;
      v9 = v3;
      v7 = v3;
      objc_msgSend(v6, "_performWithoutRetargetingAnimations:", v8);

    }
  }
}

uint64_t __85__SBHomeScreenController_AppearanceControlling__handleWillBeginReachabilityAnimation__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v2, "setFrame:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "layoutIfNeeded");
}

- (void)handleDidEndReachabilityAnimation
{
  -[SBHomeScreenController endRequiringLiveBackdropViewForReason:](self, "endRequiringLiveBackdropViewForReason:", CFSTR("ReachabilityAnimation"));
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

- (void)_setupAppearanceControlling
{
  SBHomeScreenWindow *v3;
  void *v4;
  SBHomeScreenWindow *v5;
  SBHomeScreenWindow *homeScreenWindow;
  void *v7;
  void *v8;
  NSMutableSet *v9;
  NSMutableSet *contentRequiringReasons;
  SBAppSwitcherSettings *v11;
  SBAppSwitcherSettings *switcherSettings;
  id v13;

  -[SBHomeScreenController windowScene](self, "windowScene");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [SBHomeScreenWindow alloc];
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBWindow initWithWindowScene:rootViewController:role:debugName:](v3, "initWithWindowScene:rootViewController:role:debugName:", v13, v4, CFSTR("SBTraitsParticipantRoleHomeScreen"), CFSTR("HomeScreen"));
  homeScreenWindow = self->_homeScreenWindow;
  self->_homeScreenWindow = v5;

  -[SBHomeScreenWindow setOpaque:](self->_homeScreenWindow, "setOpaque:", 0);
  -[SBHomeScreenWindow setWindowLevel:](self->_homeScreenWindow, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + -2.0);
  -[SBWindow makeKeyAndVisible](self->_homeScreenWindow, "makeKeyAndVisible");
  objc_msgSend(v13, "statusBarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOrientationWindow:forStatusBarLayoutLayer:", self->_homeScreenWindow, 0);
  v9 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", CFSTR("SBUIHomeScreenActiveContentRequirementReason"), 0);
  contentRequiringReasons = self->_contentRequiringReasons;
  self->_contentRequiringReasons = v9;

  -[SBHomeScreenController _setupHomeScreenContentBackdropView](self, "_setupHomeScreenContentBackdropView");
  -[SBHomeScreenController _setupHomeScreenDimmingWindow](self, "_setupHomeScreenDimmingWindow");
  +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
  v11 = (SBAppSwitcherSettings *)objc_claimAutoreleasedReturnValue();
  switcherSettings = self->_switcherSettings;
  self->_switcherSettings = v11;

  -[PTSettings addKeyObserver:](self->_switcherSettings, "addKeyObserver:", self);
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
  -[SBHomeScreenController windowScene](self, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBWindow initWithWindowScene:rootViewController:role:debugName:](v6, "initWithWindowScene:rootViewController:role:debugName:", v7, v10, CFSTR("SBTraitsParticipantRoleHomeScreenDimming"), CFSTR("HomeScreenDimming"));
  homeScreenDimmingWindow = self->_homeScreenDimmingWindow;
  self->_homeScreenDimmingWindow = v8;

  -[SBWindow setWindowLevel:](self->_homeScreenDimmingWindow, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + -2.0 + 1.0);
  -[SBWindow bs_setHitTestingDisabled:](self->_homeScreenDimmingWindow, "bs_setHitTestingDisabled:", 1);

}

- (void)_setupHomeScreenContentBackdropView
{
  __objc2_class *v3;
  id v4;
  SBHomeScreenBackdropViewBase *v5;
  SBHomeScreenBackdropViewBase *homeScreenBackdropView;
  id v7;

  -[SBHomeScreenController homeScreenContentView](self, "homeScreenContentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsReduceTransparencyEnabled())
    v3 = SBHomeScreenBackdropDarkTintView;
  else
    v3 = SBHomeScreenBackdropView;
  v4 = [v3 alloc];
  objc_msgSend(v7, "bounds");
  v5 = (SBHomeScreenBackdropViewBase *)objc_msgSend(v4, "initWithFrame:");
  homeScreenBackdropView = self->_homeScreenBackdropView;
  self->_homeScreenBackdropView = v5;

  -[SBHomeScreenBackdropViewBase setAutoresizingMask:](self->_homeScreenBackdropView, "setAutoresizingMask:", 18);
  -[SBHomeScreenBackdropViewBase bs_setHitTestingDisabled:](self->_homeScreenBackdropView, "bs_setHitTestingDisabled:", 1);
  -[SBHomeScreenBackdropViewBase setDelegate:](self->_homeScreenBackdropView, "setDelegate:", self);
  objc_msgSend(v7, "addSubview:", self->_homeScreenBackdropView);

}

- (void)homeScreenBackdropView:(id)a3 opaquenessDidChange:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (v4)
  {
    -[SBHomeScreenController iconManager](self, "iconManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isShowingSpotlightUnderOpaqueBackdrop = objc_msgSend(v6, "isShowingPullDownSearch");

    -[SBHomeScreenController tearDownIconListAndBar](self, "tearDownIconListAndBar");
    -[SBHomeScreenController _removeReachabilityEffectViewIfNecessary](self, "_removeReachabilityEffectViewIfNecessary");
  }
  else if (-[NSMutableSet count](self->_contentRequiringReasons, "count")
         && -[SBHomeScreenController isIconListViewTornDown](self, "isIconListViewTornDown"))
  {
    if (self->_isShowingSpotlightUnderOpaqueBackdrop)
    {
      self->_isShowingSpotlightUnderOpaqueBackdrop = 0;
      v7 = 5;
    }
    else
    {
      v7 = 1;
    }
    -[SBHomeScreenController restoreContentWithOptions:](self, "restoreContentWithOptions:", v7);
  }

}

- (SBHomeScreenController)initWithWindowScene:(id)a3
{
  return -[SBHomeScreenController initWithWindowScene:alertItemsController:applicationController:applicationPlaceholderController:assistantController:coverSheetPresentationManager:lockScreenManager:mainDisplaySceneManager:policyAggregator:userInterfaceController:](self, "initWithWindowScene:alertItemsController:applicationController:applicationPlaceholderController:assistantController:coverSheetPresentationManager:lockScreenManager:mainDisplaySceneManager:policyAggregator:userInterfaceController:", a3, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (SBHomeScreenController)initWithWindowScene:(id)a3 alertItemsController:(id)a4 applicationController:(id)a5 applicationPlaceholderController:(id)a6 assistantController:(id)a7 coverSheetPresentationManager:(id)a8 lockScreenManager:(id)a9 mainDisplaySceneManager:(id)a10 policyAggregator:(id)a11 userInterfaceController:(id)a12
{
  SBHomeScreenController *v18;
  SBHomeScreenController *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SBHIconManager *v29;
  SBHIconManager *iconManager;
  SBWallpaperIconStyleCoordinator *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  SBWallpaperIconStyleCoordinator *iconStyleCoordinator;
  SBHomeScreenViewController *v37;
  SBHomeScreenViewController *v38;
  void *v39;
  uint64_t v40;
  SBHomeScreenViewController *homeScreenViewController;
  uint64_t v42;
  void *homeScreenScalingView;
  uint64_t v44;
  SBHomeScreenViewController *v45;
  uint64_t v46;
  UIView *homeScreenContentView;
  SBHIconManager *v48;
  void *v49;
  SBHIconManager *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  SBTipsHomeScreenUsageObserver *v56;
  SBTipsHomeScreenUsageObserver *tipsUsageObserver;
  void *v58;
  uint64_t v59;
  SBHRootFolderSettings *rootFolderSettings;
  uint64_t v61;
  NSMapTable *deviceOrientationUpdateDeferralAssertionsByReason;
  uint64_t v63;
  NSMapTable *activeInterfaceOrientationChangeDeferralAssertionsByReason;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  uint64_t v79;
  id v80;
  void *v81;
  uint64_t v82;
  SBHIconEditingSettings *iconEditingSettings;
  void *v84;
  uint64_t v85;
  SBHWidgetSettings *widgetSettings;
  id v87;
  uint64_t v88;
  DNDStateService *dndStateService;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id obj;
  _QWORD v105[4];
  id v106;
  _QWORD v107[4];
  id v108;
  _QWORD v109[4];
  id v110;
  _QWORD v111[4];
  id v112;
  _QWORD v113[4];
  id v114;
  id location;
  objc_super v116;

  obj = a3;
  v103 = a4;
  v102 = a5;
  v101 = a6;
  v100 = a7;
  v99 = a8;
  v98 = a9;
  v97 = a10;
  v96 = a11;
  v95 = a12;
  v116.receiver = self;
  v116.super_class = (Class)SBHomeScreenController;
  v18 = -[SBHomeScreenController init](&v116, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_windowScene, obj);
    objc_storeStrong((id *)&v19->_override_alertItemsController, a4);
    objc_storeStrong((id *)&v19->_override_applicationController, a5);
    objc_storeStrong((id *)&v19->_override_applicationPlaceholderController, a6);
    objc_storeStrong((id *)&v19->_override_assistantController, a7);
    objc_storeStrong((id *)&v19->_override_coverSheetPresentationManager, a8);
    objc_storeStrong((id *)&v19->_override_lockScreenManager, a9);
    objc_storeStrong((id *)&v19->_override_mainDisplaySceneManager, a10);
    objc_storeStrong((id *)&v19->_override_policyAggregator, a11);
    objc_storeStrong((id *)&v19->_override_userInterfaceController, a12);
    -[SBHomeScreenController userInterfaceController](v19, "userInterfaceController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "iconController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    objc_msgSend(v21, "model");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v91 = (void *)v24;
    -[SBHomeScreenController setModel:](v19, "setModel:", v24);
    objc_msgSend(v21, "addIconModelControllerObserver:", v19);
    -[SBHomeScreenController coverSheetPresentationManager](v19, "coverSheetPresentationManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__unlockAnimationDidFinish_, CFSTR("SBLockScreenManagerUnlockAnimationDidFinish"), 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__lockScreenUIWillLock_, CFSTR("SBLockScreenUIWillLockNotification"), 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__lockScreenUIWillLock_, CFSTR("SBLockScreenUIRelockedNotification"), 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__iconModelDidChange_, SBIconControllerIconModelDidChangeNotification, v21);
    +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__controlCenterWillPresent_, CFSTR("SBControlCenterControllerWillPresentNotification"), v27);

    +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__controlCenterWillDismiss_, CFSTR("SBControlCenterControllerWillDismissNotification"), v28);

    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__coverSheetWillPresent_, CFSTR("SBCoverSheetWillPresentNotification"), v25);
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__coverSheetDidPresent_, CFSTR("SBCoverSheetDidPresentNotification"), v25);
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__forceTouchControllerWillPresent_, *MEMORY[0x1E0DAAA50], 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__mainSwitcherCreated_, CFSTR("SBMainSwitcherSwitcherSharedInstanceCreatedNotification"), 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__reduceMotionStatusDidChange_, *MEMORY[0x1E0CEB090], 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__policyAggregatorCapabilitiesDidChange_, CFSTR("SBPolicyAggregatorCapabilitiesChangedNotification"), 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__colorDropperWillPresent_, *MEMORY[0x1E0DAA7F0], 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__colorDropperDismissed_, *MEMORY[0x1E0DAA7C8], 0);
    v29 = (SBHIconManager *)objc_alloc_init(MEMORY[0x1E0DAA4A8]);
    iconManager = v19->_iconManager;
    v19->_iconManager = v29;

    -[SBHIconManager setDelegate:](v19->_iconManager, "setDelegate:", v19);
    -[SBHIconManager setOwnsIconModel:](v19->_iconManager, "setOwnsIconModel:", 0);
    v31 = [SBWallpaperIconStyleCoordinator alloc];
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "homeScreenDefaults");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[SBWallpaperIconStyleCoordinator initWithWallpaperController:homeScreenDefaults:](v31, "initWithWallpaperController:homeScreenDefaults:", v32, v34);
    iconStyleCoordinator = v19->_iconStyleCoordinator;
    v19->_iconStyleCoordinator = (SBWallpaperIconStyleCoordinator *)v35;

    -[SBWallpaperIconStyleCoordinator addIconStyleObserver:](v19->_iconStyleCoordinator, "addIconStyleObserver:", v19);
    v37 = [SBHomeScreenViewController alloc];
    v38 = v37;
    if (v21)
    {
      v39 = obj;
      v40 = -[SBHomeScreenViewController initWithWindowScene:iconController:iconManager:userInterfaceController:](v37, "initWithWindowScene:iconController:iconManager:userInterfaceController:", obj, v21, v19->_iconManager, v20);
      homeScreenViewController = v19->_homeScreenViewController;
      v19->_homeScreenViewController = (SBHomeScreenViewController *)v40;

      -[SBHomeScreenViewController iconContentView](v19->_homeScreenViewController, "iconContentView");
      v42 = objc_claimAutoreleasedReturnValue();
      homeScreenScalingView = v19->_homeScreenScalingView;
      v19->_homeScreenScalingView = (UIView *)v42;
    }
    else
    {
      -[SBHomeScreenController userInterfaceController](v19, "userInterfaceController");
      homeScreenScalingView = (void *)objc_claimAutoreleasedReturnValue();
      v39 = obj;
      v44 = -[SBHomeScreenViewController initWithWindowScene:iconController:iconManager:userInterfaceController:](v38, "initWithWindowScene:iconController:iconManager:userInterfaceController:", obj, 0, 0, homeScreenScalingView);
      v45 = v19->_homeScreenViewController;
      v19->_homeScreenViewController = (SBHomeScreenViewController *)v44;

    }
    -[SBHomeScreenViewController view](v19->_homeScreenViewController, "view");
    v46 = objc_claimAutoreleasedReturnValue();
    homeScreenContentView = v19->_homeScreenContentView;
    v19->_homeScreenContentView = (UIView *)v46;

    -[SBHIconManager configureFeedbackView:](v19->_iconManager, "configureFeedbackView:", v19->_homeScreenContentView);
    -[SBHomeScreenController updateHomeScreenTraitOverridesForViewController:](v19, "updateHomeScreenTraitOverridesForViewController:", v19->_homeScreenViewController);
    -[SBHIconManager setListLayoutProviderLayoutOptions:](v19->_iconManager, "setListLayoutProviderLayoutOptions:", -[SBHomeScreenController bestListLayoutProviderLayoutOptions](v19, "bestListLayoutProviderLayoutOptions"));
    -[SBHIconManager setIconModel:](v19->_iconManager, "setIconModel:", v19->_iconModel);
    if (!-[SBHomeScreenController _isCoplanarHomeScreenEnabled](v19, "_isCoplanarHomeScreenEnabled"))
      -[SBHomeScreenController _setupOverlayLibraryViewController](v19, "_setupOverlayLibraryViewController");
    v92 = v21;
    -[SBHomeScreenController _setupOverlayLibraryViewController](v19, "_setupOverlayLibraryViewController");
    -[SBHomeScreenController _makeTodayViewControllers](v19, "_makeTodayViewControllers");
    if (!-[SBHomeScreenController _isCoplanarHomeScreenEnabled](v19, "_isCoplanarHomeScreenEnabled"))
    {
      v48 = v19->_iconManager;
      -[SBHomeScreenController todayViewController](v19, "todayViewController");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconManager setOverlayTodayViewController:](v48, "setOverlayTodayViewController:", v49);

    }
    v50 = v19->_iconManager;
    -[SBHomeScreenController coverSheetTodayViewController](v19, "coverSheetTodayViewController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconManager setOverlayCoverSheetTodayViewController:](v50, "setOverlayCoverSheetTodayViewController:", v51);

    -[SBHomeScreenController _setupAppearanceControlling](v19, "_setupAppearanceControlling");
    -[SBHomeScreenController alertItemsController](v19, "alertItemsController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addObserver:", v19);

    -[SBHomeScreenController assistantController](v19, "assistantController");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addObserver:", v19);

    objc_msgSend(v39, "displayLayoutPublisher");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObserver:", v19);

    objc_msgSend(v39, "layoutStateTransitionCoordinator");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addObserver:", v19);

    v56 = -[SBTipsHomeScreenUsageObserver initWithIconManager:]([SBTipsHomeScreenUsageObserver alloc], "initWithIconManager:", v19->_iconManager);
    tipsUsageObserver = v19->_tipsUsageObserver;
    v19->_tipsUsageObserver = v56;

    objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "rootFolderSettings");
    v59 = objc_claimAutoreleasedReturnValue();
    rootFolderSettings = v19->_rootFolderSettings;
    v19->_rootFolderSettings = (SBHRootFolderSettings *)v59;

    -[SBHRootFolderSettings addKeyObserver:](v19->_rootFolderSettings, "addKeyObserver:", v19);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v61 = objc_claimAutoreleasedReturnValue();
    deviceOrientationUpdateDeferralAssertionsByReason = v19->_deviceOrientationUpdateDeferralAssertionsByReason;
    v19->_deviceOrientationUpdateDeferralAssertionsByReason = (NSMapTable *)v61;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v63 = objc_claimAutoreleasedReturnValue();
    activeInterfaceOrientationChangeDeferralAssertionsByReason = v19->_activeInterfaceOrientationChangeDeferralAssertionsByReason;
    v19->_activeInterfaceOrientationChangeDeferralAssertionsByReason = (NSMapTable *)v63;

    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "homeScreenDefaults");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "floatingDockDefaults");
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v19);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldUseLargeDefaultSizedIcons");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = MEMORY[0x1E0C80D38];
    v70 = MEMORY[0x1E0C80D38];
    v71 = MEMORY[0x1E0C809B0];
    v113[0] = MEMORY[0x1E0C809B0];
    v113[1] = 3221225472;
    v113[2] = __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke;
    v113[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v114, &location);
    v72 = (id)objc_msgSend(v66, "observeDefault:onQueue:withBlock:", v68, v69, v113);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "recentsEnabled");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v111[0] = v71;
    v111[1] = 3221225472;
    v111[2] = __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_2;
    v111[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v112, &location);
    v74 = (id)objc_msgSend(v94, "observeDefault:onQueue:withBlock:", v73, MEMORY[0x1E0C80D38], v111);

    objc_msgSend(v93, "addKeyObserver:", v19);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showsBadgesInAppLibrary");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v109[0] = v71;
    v109[1] = 3221225472;
    v109[2] = __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_3;
    v109[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v110, &location);
    v76 = (id)objc_msgSend(v66, "observeDefault:onQueue:withBlock:", v75, MEMORY[0x1E0C80D38], v109);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showsHomeScreenSearchAffordance");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v107[0] = v71;
    v107[1] = 3221225472;
    v107[2] = __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_4;
    v107[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v108, &location);
    v78 = (id)objc_msgSend(v66, "observeDefault:onQueue:withBlock:", v77, MEMORY[0x1E0C80D38], v107);
    v79 = MEMORY[0x1E0C80D38];

    v105[0] = v71;
    v105[1] = 3221225472;
    v105[2] = __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_5;
    v105[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v106, &location);
    v80 = (id)objc_msgSend(v66, "observeIconTintColorOnQueue:withBlock:", v79, v105);

    objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "iconEditingSettings");
    v82 = objc_claimAutoreleasedReturnValue();
    iconEditingSettings = v19->_iconEditingSettings;
    v19->_iconEditingSettings = (SBHIconEditingSettings *)v82;

    -[SBHIconEditingSettings addKeyObserver:](v19->_iconEditingSettings, "addKeyObserver:", v19);
    -[SBHomeScreenController _configureEditingGestureRecognizers](v19, "_configureEditingGestureRecognizers");
    objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "widgetSettings");
    v85 = objc_claimAutoreleasedReturnValue();
    widgetSettings = v19->_widgetSettings;
    v19->_widgetSettings = (SBHWidgetSettings *)v85;

    v87 = +[SBDraggingSystemManager sharedInstance](SBDraggingSystemManager, "sharedInstance");
    objc_msgSend(MEMORY[0x1E0D1D758], "serviceForClientIdentifier:", CFSTR("com.apple.springboard.SBIconController"));
    v88 = objc_claimAutoreleasedReturnValue();
    dndStateService = v19->_dndStateService;
    v19->_dndStateService = (DNDStateService *)v88;

    -[DNDStateService addStateUpdateListener:withCompletionHandler:](v19->_dndStateService, "addStateUpdateListener:withCompletionHandler:", v19, 0);
    -[SBHomeScreenController updateRootFolderWithCurrentDoNotDisturbState](v19, "updateRootFolderWithCurrentDoNotDisturbState");
    objc_destroyWeak(&v106);
    objc_destroyWeak(&v108);
    objc_destroyWeak(&v110);
    objc_destroyWeak(&v112);
    objc_destroyWeak(&v114);
    objc_destroyWeak(&location);

  }
  return v19;
}

void __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "iconManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setListLayoutProviderLayoutOptions:animated:", objc_msgSend(WeakRetained, "bestListLayoutProviderLayoutOptions"), 0);

}

void __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "iconManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setListLayoutProviderLayoutOptions:", objc_msgSend(WeakRetained, "bestListLayoutProviderLayoutOptions"));

}

void __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showsBadgesInAppLibraryDidChange");

}

void __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "iconManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tearDownAndResetRootIconLists");

}

void __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_5(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)MEMORY[0x1D17E5334]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_6;
    v5[3] = &unk_1E8EA69F0;
    v6 = WeakRetained;
    objc_msgSend(v6, "enumerateTintableViewControllersUsingBlock:", v5);

  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __255__SBHomeScreenController_initWithWindowScene_alertItemsController_applicationController_applicationPlaceholderController_assistantController_coverSheetPresentationManager_lockScreenManager_mainDisplaySceneManager_policyAggregator_userInterfaceController___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateHomeScreenTraitOverridesForViewController:", a2);
}

- (void)_setupOverlayLibraryViewController
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (!-[SBHomeScreenController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
  {
    -[SBHomeScreenController overlayLibraryViewController](self, "overlayLibraryViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = -[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported");
      v3 = 0;
      if (v4)
      {
        -[SBHomeScreenController iconManager](self, "iconManager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v5)
          return;
        -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHomeScreenController _setUpLibraryViewControllerForWindowScene:](self, "_setUpLibraryViewControllerForWindowScene:", v6);
        v7 = objc_claimAutoreleasedReturnValue();

        -[SBHomeScreenController setOverlayLibraryViewController:](self, "setOverlayLibraryViewController:", v7);
        if (!-[SBHomeScreenController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
          -[SBHIconManager setOverlayLibraryViewController:](self->_iconManager, "setOverlayLibraryViewController:", v7);
        v3 = (void *)v7;
      }
    }

  }
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenController.m"), 504, CFSTR("SBHomeScreenController must be invalidated before -dealloc"));

  }
  v5.receiver = self;
  v5.super_class = (Class)SBHomeScreenController;
  -[SBHomeScreenController dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  self->_invalidated = 1;
  -[SBHomeScreenController iconManager](self, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController spotlightViewController](self, "spotlightViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isShowingPullDownOrLeadingCustomViewSearch"))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __36__SBHomeScreenController_invalidate__block_invoke;
    v22[3] = &unk_1E8E9DED8;
    v23 = v4;
    objc_msgSend(v3, "dismissSpotlightAnimated:completionHandler:", 0, v22);

  }
  else
  {
    objc_msgSend(v4, "invalidate");
  }
  objc_msgSend(v3, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController iconManager:willDestroyRootViewController:](self, "iconManager:willDestroyRootViewController:", v3, v5);

  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMapTable removeObjectForKey:](self->_windowSceneToMedusaDragWindowContext, "removeObjectForKey:", v6);
    -[SBHomeScreenController iconDragManager](self, "iconDragManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowSceneDidDisconnect:", v6);

    objc_msgSend(v6, "displayLayoutPublisher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", self);

    objc_msgSend(v6, "layoutStateTransitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:", self);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  -[SBHIconEditingSettings removeKeyObserver:](self->_iconEditingSettings, "removeKeyObserver:", self);
  -[BSInvalidatable invalidate](self->_duckWallpaperDimmingAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_displayLayoutTransition, "invalidate");
  -[BSInvalidatable invalidate](self->_folderDisplayLayoutAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_todayViewDisplayLayoutAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_widgetEditingLayoutAssertion, "invalidate");
  -[NSMapTable bs_each:](self->_suspendWallpaperAnimationForFolderAssertions, "bs_each:", &__block_literal_global_361);
  -[BSInvalidatable invalidate](self->_suspendWallpaperAnimationForOverlayViewAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_suspendWallpaperAnimationForSpotlightAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_wallpaperRasterizationAssertion, "invalidate");
  -[SBFloatingDockBehaviorAssertion invalidate](self->_homeScreenOverlayFloatingDockBehaviorAssertion, "invalidate");
  -[SBFloatingDockBehaviorAssertion invalidate](self->_addWidgetSheetFloatingDockBehaviorAssertion, "invalidate");
  -[SBFloatingDockBehaviorAssertion invalidate](self->_widgetConfigurationFloatingDockBehaviorAssertion, "invalidate");
  -[SBFloatingDockBehaviorAssertion invalidate](self->_modalInteractionFloatingDockBehaviorAssertion, "invalidate");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SBHomeScreenController floatingDockBehaviorAssertions](self, "floatingDockBehaviorAssertions", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15++), "invalidate");
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v13);
  }

  -[BSInvalidatable invalidate](self->_addWidgetSheetKeyboardFocusAssertion, "invalidate");
  -[SBLibraryViewController invalidate](self->_overlayLibraryViewController, "invalidate");
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "iconStyleCoordinator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeIconStyleObserver:", self);

}

uint64_t __36__SBHomeScreenController_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __36__SBHomeScreenController_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (SBIconModel)model
{
  return self->_iconModel;
}

- (id)iconDragManager
{
  void *v2;
  void *v3;

  -[SBHomeScreenController iconManager](self, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconDragManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)alertItemsController
{
  SBAlertItemsController *override_alertItemsController;
  SBAlertItemsController *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  SBAlertItemsController *v7;

  override_alertItemsController = self->_override_alertItemsController;
  if (override_alertItemsController)
  {
    v3 = override_alertItemsController;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "alertItemsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
      v7 = (SBAlertItemsController *)objc_claimAutoreleasedReturnValue();
    }
    v3 = v7;

  }
  return v3;
}

- (id)applicationController
{
  SBApplicationController *override_applicationController;

  override_applicationController = self->_override_applicationController;
  if (override_applicationController)
    return override_applicationController;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)applicationPlaceholderController
{
  SBApplicationPlaceholderController *override_applicationPlaceholderController;

  override_applicationPlaceholderController = self->_override_applicationPlaceholderController;
  if (override_applicationPlaceholderController)
    return override_applicationPlaceholderController;
  +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)assistantController
{
  SBAssistantController *override_assistantController;

  override_assistantController = self->_override_assistantController;
  if (override_assistantController)
    return override_assistantController;
  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)coverSheetPresentationManager
{
  SBCoverSheetPresentationManager *override_coverSheetPresentationManager;

  override_coverSheetPresentationManager = self->_override_coverSheetPresentationManager;
  if (override_coverSheetPresentationManager)
    return override_coverSheetPresentationManager;
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)lockScreenManager
{
  SBLockScreenManager *override_lockScreenManager;

  override_lockScreenManager = self->_override_lockScreenManager;
  if (override_lockScreenManager)
    return override_lockScreenManager;
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)policyAggregator
{
  SBPolicyAggregatorCapabilityQuerying *override_policyAggregator;
  SBPolicyAggregatorCapabilityQuerying *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  override_policyAggregator = self->_override_policyAggregator;
  if (override_policyAggregator)
  {
    v3 = override_policyAggregator;
  }
  else
  {
    -[SBHomeScreenController mainDisplaySceneManager](self, "mainDisplaySceneManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "policyAggregator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v3 = v6;
    }
    else
    {
      -[SBHomeScreenController externalDisplaySceneManager](self, "externalDisplaySceneManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "policyAggregator");
      v3 = (SBPolicyAggregatorCapabilityQuerying *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (SBUIController)userInterfaceController
{
  SBUIController *override_userInterfaceController;

  override_userInterfaceController = self->_override_userInterfaceController;
  if (override_userInterfaceController)
    return override_userInterfaceController;
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  return (SBUIController *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_currentMainDisplayLayoutState
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHomeScreenController windowScene](self, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateLegibility
{
  void *v3;
  id WeakRetained;
  id v5;

  -[SBHomeScreenController _iconController](self, "_iconController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "legibilitySettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenController setLegibilitySettings:](self, "setLegibilitySettings:", v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  -[SBHomeScreenController updateStatusBarLegibilityForWindowScene:](self, "updateStatusBarLegibilityForWindowScene:", WeakRetained);

}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (id)_iconController
{
  void *v2;
  void *v3;

  -[SBHomeScreenController userInterfaceController](self, "userInterfaceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mainDisplayWindowScene
{
  return objc_loadWeakRetained((id *)&self->_windowScene);
}

- (id)mainDisplaySceneManager
{
  SBMainDisplaySceneManager *override_mainDisplaySceneManager;
  SBMainDisplaySceneManager *v3;
  uint64_t v5;
  void *v6;
  void *v7;

  override_mainDisplaySceneManager = self->_override_mainDisplaySceneManager;
  if (override_mainDisplaySceneManager)
  {
    v3 = override_mainDisplaySceneManager;
  }
  else
  {
    v5 = objc_opt_class();
    -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v5, v7);
    v3 = (SBMainDisplaySceneManager *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)externalDisplaySceneManager
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class();
  -[SBHomeScreenController windowScene](self, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)_disableEditingByDefaultDuringStaging
{
  id WeakRetained;
  int v2;

  if (result)
  {
    WeakRetained = objc_loadWeakRetained((id *)(result + 88));
    v2 = objc_msgSend(WeakRetained, "isContinuityDisplayWindowScene");

    if (v2)
      return SBFIsOnenessHomeScreenEditingAvailable() ^ 1;
    else
      return 0;
  }
  return result;
}

- (void)updateStatusBarLegibilityForWindowScene:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHomeScreenController userInterfaceController](self, "userInterfaceController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateStatusBarLegibilityForWindowScene:", v4);

}

- (void)iconModelDidImportIconState:(id)a3
{
  id v3;

  -[SBHomeScreenController iconManager](self, "iconManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relayout");

}

- (void)iconModelInstalledAppsDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SBHomeScreenController _libraryViewControllers](self, "_libraryViewControllers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "noteInstalledApplicationsDidChange");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  -[SBHomeScreenController iconManager](self, "iconManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "checkForInvalidCustomElements");

}

- (void)iconModel:(id)a3 backupRestoringStatusDidChange:(BOOL)a4
{
  void *v5;
  id v6;

  if (!a4)
  {
    -[SBHomeScreenController iconManager](self, "iconManager", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "checkForInvalidWidgets");

    -[SBHomeScreenController iconManager](self, "iconManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "checkForInvalidCustomElements");

  }
}

- (void)iconModel:(id)a3 wantsToRevealAnyApplicationFromIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBHomeScreenController iconManager](self, "iconManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "applicationIconForBundleIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[SBHomeScreenController _currentMainDisplayLayoutState](self, "_currentMainDisplayLayoutState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unlockedEnvironmentMode");

  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    if (v10)
    {
      if (v12 == 3)
        v22 = 4;
      else
        v22 = 6;
      objc_msgSend(v8, "addNewIconToDesignatedLocation:options:", v10, v22);
    }
  }
  else if (v12 != 3 && v10)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = v7;
    v25 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v25)
    {
      v14 = *(_QWORD *)v32;
      v26 = v13;
      v24 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v13);
          v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          objc_msgSend(v6, "applicationIconsForBundleIdentifier:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v28;
            while (2)
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v28 != v20)
                  objc_enumerationMutation(v17);
                if (objc_msgSend(v8, "isDisplayingIcon:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j)))
                {

                  SBLogIconController();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v36 = v9;
                    _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "Skipping revealing added/modified icon: %@", buf, 0xCu);
                  }

                  goto LABEL_31;
                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
              if (v19)
                continue;
              break;
            }
          }

          v13 = v26;
          v14 = v24;
        }
        v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v25);
    }

    objc_msgSend(v8, "scrollToIconListContainingIcon:animate:", v10, 1);
  }
LABEL_31:

}

- (id)featureIntroductionItemForWidgetSetupAtLocation:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SBHomeScreenController iconManager](self, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureIntroductionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureIntroductionItemAtLocation:withIdentifier:", a3, CFSTR("SBFeatureIntroductionLocationNone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "shouldSetupFeatureIntroductionAtLocations:", a3))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)_beginDisablingAllOrientationChangesForReason:(id)a3
{
  void *v4;
  SBDisableActiveInterfaceOrientationChangeAssertion *v5;
  id v6;

  v6 = a3;
  -[NSMapTable objectForKey:](self->_deviceOrientationUpdateDeferralAssertionsByReason, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend((id)SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_deviceOrientationUpdateDeferralAssertionsByReason, "setObject:forKey:", v4, v6);
  }
  -[NSMapTable objectForKey:](self->_activeInterfaceOrientationChangeDeferralAssertionsByReason, "objectForKey:", v6);
  v5 = (SBDisableActiveInterfaceOrientationChangeAssertion *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[SBDisableActiveInterfaceOrientationChangeAssertion initWithReason:nudgeOrientationOnInvalidate:]([SBDisableActiveInterfaceOrientationChangeAssertion alloc], "initWithReason:nudgeOrientationOnInvalidate:", v6, 0);
    -[NSMapTable setObject:forKey:](self->_activeInterfaceOrientationChangeDeferralAssertionsByReason, "setObject:forKey:", v5, v6);
  }

}

- (void)_endDisablingAllOrientationChangesForReason:(id)a3
{
  NSMapTable *deviceOrientationUpdateDeferralAssertionsByReason;
  id v5;
  void *v6;
  id v7;

  deviceOrientationUpdateDeferralAssertionsByReason = self->_deviceOrientationUpdateDeferralAssertionsByReason;
  v5 = a3;
  -[NSMapTable objectForKey:](deviceOrientationUpdateDeferralAssertionsByReason, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_deviceOrientationUpdateDeferralAssertionsByReason, "removeObjectForKey:", v5);
  objc_msgSend(v7, "invalidate");
  -[NSMapTable objectForKey:](self->_activeInterfaceOrientationChangeDeferralAssertionsByReason, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_activeInterfaceOrientationChangeDeferralAssertionsByReason, "removeObjectForKey:", v5);

  objc_msgSend(v6, "invalidate");
}

- (unint64_t)bestListLayoutProviderLayoutOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  unint64_t v10;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatingDockDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "recentsEnabled"))
    v7 = 0;
  else
    v7 = 4;
  if (objc_msgSend(v4, "shouldUseLargeDefaultSizedIcons"))
  {
    if (__sb__runningInSpringBoard())
    {
      v8 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "userInterfaceIdiom") == 1;

    }
    if (v8)
      v7 |= 8uLL;
  }
  if (-[SBWallpaperIconStyleCoordinator shouldUseLargeHomeScreenIcons](self->_iconStyleCoordinator, "shouldUseLargeHomeScreenIcons"))
  {
    v10 = v7 | 0x18;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (id)rootFolder
{
  void *v2;
  void *v3;

  -[SBHomeScreenController model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SBRootFolderController)_rootFolderController
{
  void *v2;
  void *v3;

  -[SBHomeScreenController iconManager](self, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBRootFolderController *)v3;
}

- (SBFolderController)_openFolderController
{
  void *v2;
  void *v3;

  -[SBHomeScreenController iconManager](self, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openedFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBFolderController *)v3;
}

- (SBFolderController)_currentFolderController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SBHomeScreenController _openFolderController](self, "_openFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (SBFolderController *)v6;
}

- (void)_showInfoAlertIfNeeded:(BOOL)a3
{
  void *v5;
  void *v6;
  char v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  SBReorderInfoAlert *v13;
  id v14;

  -[SBHomeScreenController alertItemsController](self, "alertItemsController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "didShowIconReorderAlert");

  v8 = objc_msgSend(v14, "hasAlertOfClass:", objc_opt_class());
  if (a3)
  {
    v9 = 1;
    if ((v7 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    -[SBHomeScreenController applicationPlaceholderController](self, "applicationPlaceholderController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "hasDownloadedStoreApplication");

    if ((v7 & 1) != 0)
      goto LABEL_7;
  }
  -[SBHomeScreenController iconManager](self, "iconManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEditingAllowed") & ~v8 & v9;

  if (v12 == 1)
  {
    v13 = objc_alloc_init(SBReorderInfoAlert);
    objc_msgSend(v14, "activateAlertItem:", v13);

  }
LABEL_7:

}

- (void)handleHomeButtonTap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  -[SBHomeScreenController iconManager](self, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBHomeScreenController areAnyIconViewContextMenusShowing](self, "areAnyIconViewContextMenusShowing"))
  {
    if (objc_msgSend(v3, "areAnyIconShareSheetsShowing"))
    {
      objc_msgSend(v3, "dismissIconShareSheets");
      goto LABEL_7;
    }
    objc_msgSend(v4, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
      goto LABEL_7;
    }
    if (objc_msgSend(v3, "hasOpenFolder")
      && (!objc_msgSend(v3, "isEditing") || objc_msgSend(v3, "isIconDragging")))
    {
      objc_msgSend(v3, "popExpandedIconAnimated:completionHandler:", 1, 0);
      goto LABEL_7;
    }
    if (objc_msgSend(v3, "isShowingModalInteraction"))
    {
      objc_msgSend(v3, "popModalInteraction");
      goto LABEL_7;
    }
    if (objc_msgSend(v3, "isFolderPageManagementUIVisible"))
    {
      objc_msgSend(v3, "dismissFolderPageManagementUI");
      goto LABEL_7;
    }
    if (objc_msgSend(v3, "isEditing"))
    {
      objc_msgSend(v3, "setEditing:", 0);
      goto LABEL_7;
    }
    if (objc_msgSend(v3, "isShowingPullDownSearchOrTransitioningToVisible"))
    {
      objc_msgSend(v3, "dismissSpotlightAnimated:completionHandler:", 1, 0);
      goto LABEL_7;
    }
    if (-[SBHomeScreenController isMainDisplayLibraryViewVisible](self, "isMainDisplayLibraryViewVisible"))
    {
      if (!-[SBHomeScreenController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
      {
        -[SBHomeScreenController overlayLibraryViewController](self, "overlayLibraryViewController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "popPresentationState");
LABEL_35:

        goto LABEL_7;
      }
      -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "modalLibraryController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isPresentingLibrary"))
      {
LABEL_34:

        goto LABEL_35;
      }
      objc_msgSend(v7, "libraryViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "popPresentationState");
    }
    else
    {
      if (-[SBHomeScreenController isTodayOverlaySpotlightVisible](self, "isTodayOverlaySpotlightVisible"))
      {
        -[SBHomeScreenController dismissTodayOverlaySpotlightAnimated:](self, "dismissTodayOverlaySpotlightAnimated:", 1);
        goto LABEL_7;
      }
      if (-[SBHomeScreenController isTodayOverlayPresented](self, "isTodayOverlayPresented"))
      {
        -[SBHomeScreenController dismissTodayOverlayAnimated:](self, "dismissTodayOverlayAnimated:", 1);
        goto LABEL_7;
      }
      SBLogTelemetrySignposts();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)v11 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_ANIMATE_TO_FIRST_HOME_PAGE", " enableTelemetry=YES  isAnimation=YES ", v11, 2u);
      }

      kdebug_trace();
      objc_msgSend(v3, "animateToDefaultStateWithCompletionHandler:", &__block_literal_global_103_0);
      objc_msgSend(v4, "iconContentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_eventRoutingScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_34;
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_cancelAllEventsOfType:onEventRoutingScene:", 0, v7);
    }

    goto LABEL_34;
  }
  -[SBHomeScreenController dismissAppIconForceTouchControllers:](self, "dismissAppIconForceTouchControllers:", 0);
LABEL_7:

}

uint64_t __45__SBHomeScreenController_handleHomeButtonTap__block_invoke()
{
  NSObject *v0;
  uint8_t v2[16];

  SBLogTelemetrySignposts();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_ANIMATE_TO_FIRST_HOME_PAGE", " enableTelemetry=YES  isAnimation=YES ", v2, 2u);
  }

  return kdebug_trace();
}

- (BOOL)allowsUninstall
{
  void *v2;
  char v3;

  -[SBHomeScreenController _iconController](self, "_iconController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsUninstall");

  return v3;
}

- (BOOL)isUninstallingSystemAppsRestricted
{
  void *v2;
  char v3;

  -[SBHomeScreenController _iconController](self, "_iconController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUninstallingSystemAppsRestricted");

  return v3;
}

- (BOOL)isUninstallSupportedForAnyIcon
{
  int v2;
  void *v3;
  void *v4;
  char v5;

  v2 = -[SBHomeScreenController allowsUninstall](self, "allowsUninstall");
  if (v2)
  {
    if (objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode"))
    {
      +[SBDefaults externalDefaults](SBDefaults, "externalDefaults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "demoDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "shouldLockIconsInStoreDemoMode");

      LOBYTE(v2) = v5 ^ 1;
    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

- (BOOL)isUninstallSupportedForIcon:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v8;
  uint64_t v9;

  v4 = a3;
  if (-[SBHomeScreenController isUninstallSupportedForAnyIcon](self, "isUninstallSupportedForAnyIcon")
    && objc_msgSend(v4, "isUninstallSupported"))
  {
    if (objc_msgSend(v4, "isApplicationIcon"))
    {
      objc_msgSend(v4, "application");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isSystemApplication")
        && -[SBHomeScreenController isUninstallingSystemAppsRestricted](self, "isUninstallingSystemAppsRestricted"))
      {
        v6 = 0;
      }
      else if (v5)
      {
        objc_msgSend(v5, "info");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "uninstallCapability");

        if (v9)
          v6 = -1;
        else
          v6 = 0;
      }
      else
      {
        v6 = 1;
      }

    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6 & 1;
}

- (BOOL)isHideSupportedForIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported")
    && (SBIconLocationGroupContainsLocation() & 1) == 0)
  {
    if ((objc_msgSend(v6, "isApplicationIcon") & 1) != 0 || (objc_msgSend(v6, "isFolderIcon") & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[SBHomeScreenController iconManager](self, "iconManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "canAddIconToIgnoredList:", v6);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isUninstallOrHideSupportedForIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  v7 = -[SBHomeScreenController isHideSupportedForIcon:inLocation:](self, "isHideSupportedForIcon:inLocation:", v6, a4)
    || -[SBHomeScreenController isUninstallSupportedForIcon:](self, "isUninstallSupportedForIcon:", v6);

  return v7;
}

- (BOOL)isOnlyHideSuggestionSupportedForIcon:(id)a3 inLocation:(id)a4
{
  return objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions"));
}

- (BOOL)isHideSuggestionSupportedForIconView:(id)a3 inLocation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions")))
  {
    -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatingDockController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldShowHideSuggestionForIconView:proposedValue:", v6, 1);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateNumberOfRowsWithDuration:(double)a3
{
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__SBHomeScreenController_updateNumberOfRowsWithDuration___block_invoke;
  v5[3] = &unk_1E8E9DED8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 2, v5, 0, a3, 0.0);
  -[SBHomeScreenController iconManager](self, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIconListsWithAnimationType:forceRelayout:", 0, 0);

}

void __57__SBHomeScreenController_updateNumberOfRowsWithDuration___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "homeScreenViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconContentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)_launchFromIconView:(id)a3 withActions:(id)a4 modifierFlags:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  SBIconLaunchContext *v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[SBHomeScreenController delayedLaunchRequestTimer](self, "delayedLaunchRequestTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  -[SBHomeScreenController setDelayedLaunchRequestTimer:](self, "setDelayedLaunchRequestTimer:", 0);
  -[SBHomeScreenController iconManager](self, "iconManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reasonToDisallowTapOnIconView:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v11, "clearHighlightedIcon");
    SBLogIcon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v8;
      v39 = 2114;
      v40 = v13;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring launch from icon view: %@, reason: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v32 = a5;
    v34 = v9;
    SBLogIcon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v8;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Initiating launch from icon view: %@", buf, 0xCu);
    }

    objc_msgSend(v8, "_sbWindowScene");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject switcherController](v14, "switcherController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cancelEventsWithName:", CFSTR("SBUIApplicationIconLaunchEventLabel"));

    objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "toggleSwitcherEventName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cancelEventsWithName:", v19);

    objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateSwitcherEventName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cancelEventsWithName:", v21);

    objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "emitEvent:", 10);

    -[SBHomeScreenController launchActivationSettingsForIconView:](self, "launchActivationSettingsForIconView:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v16;
    v24 = objc_msgSend(v16, "windowManagementStyle");
    if ((v32 & 0x20000) != 0 && v24 == 2)
      objc_msgSend(v23, "setFlag:forActivationSetting:", 1, 72);
    objc_msgSend(v8, "location", v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc_init(SBIconLaunchContext);
    -[SBIconLaunchContext setActivationSettings:](v26, "setActivationSettings:", v23);
    -[SBIconLaunchContext setActions:](v26, "setActions:", v34);
    -[SBIconLaunchContext setIconView:](v26, "setIconView:", v8);
    if (objc_msgSend(v12, "isWidgetIcon"))
    {
      -[SBHomeScreenController _launchWidgetIcon:fromLocation:withContext:](self, "_launchWidgetIcon:fromLocation:withContext:", v12, v25, v26);
    }
    else
    {
      v27 = objc_msgSend(v12, "performLaunchFromLocation:context:", v25, v26);
      SBLogIcon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = v27;
        _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "Icon handled launch: %{BOOL}u", buf, 8u);
      }

    }
    v29 = (void *)MEMORY[0x1E0D229B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __72__SBHomeScreenController__launchFromIconView_withActions_modifierFlags___block_invoke;
    v35[3] = &unk_1E8E9DED8;
    v36 = v8;
    objc_msgSend(v29, "eventWithName:handler:", CFSTR("noteActivatingAppSuggestion"), v35);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "executeOrAppendEvent:", v30);

    v9 = v34;
  }

}

void __72__SBHomeScreenController__launchFromIconView_withActions_modifierFlags___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "continuityInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[SBAppSuggestionManager sharedInstance](SBAppSuggestionManager, "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "noteActivatingForAppSuggestion:fromSource:", v2, 2);

  }
}

- (void)_launchWidgetIcon:(id)a3 fromLocation:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  SBActivationSettings *v13;
  SBActivationSettings *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SBLockScreenUnlockRequest *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  SBActivationSettings *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "activationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v13 = v11;
  else
    v13 = objc_alloc_init(SBActivationSettings);
  v14 = v13;
  objc_msgSend(v8, "activeWidget");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v26 = v9;
    objc_msgSend(v15, "extensionBundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "containerBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenController applicationController](self, "applicationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "applicationWithBundleIdentifier:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogIcon();
    v21 = (SBLockScreenUnlockRequest *)objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(&v21->super, OS_LOG_TYPE_INFO);
    if (v20)
    {
      v25 = v12;
      if (v22)
      {
        *(_DWORD *)buf = 138412802;
        v34 = v18;
        v35 = 2112;
        v36 = v8;
        v37 = 2112;
        v38 = v26;
        _os_log_impl(&dword_1D0540000, &v21->super, OS_LOG_TYPE_INFO, "Launching application %@ from widget icon %@, location: %@", buf, 0x20u);
      }

      -[SBActivationSettings setObject:forActivationSetting:](v14, "setObject:forActivationSetting:", v17, 14);
      v21 = objc_alloc_init(SBLockScreenUnlockRequest);
      -[SBLockScreenUnlockRequest setSource:](v21, "setSource:", 24);
      -[SBLockScreenUnlockRequest setIntent:](v21, "setIntent:", 3);
      -[SBLockScreenUnlockRequest setName:](v21, "setName:", CFSTR("Launch From Widget Icon Unlock"));
      -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v21, "setWantsBiometricPresentation:", 1);
      -[SBHomeScreenController windowScene](self, "windowScene");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenUnlockRequest setWindowScene:](v21, "setWindowScene:", v23);

      -[SBHomeScreenController lockScreenManager](self, "lockScreenManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __69__SBHomeScreenController__launchWidgetIcon_fromLocation_withContext___block_invoke;
      v27[3] = &unk_1E8EA6288;
      v27[4] = self;
      v28 = v20;
      v29 = v8;
      v30 = v26;
      v31 = v14;
      v32 = v25;
      objc_msgSend(v24, "unlockWithRequest:completion:", v21, v27);

      v12 = v25;
    }
    else if (v22)
    {
      *(_DWORD *)buf = 138412802;
      v34 = v18;
      v35 = 2112;
      v36 = v8;
      v37 = 2112;
      v38 = v26;
      _os_log_impl(&dword_1D0540000, &v21->super, OS_LOG_TYPE_INFO, "Failed to launch application %@ from widget icon %@, location: %@", buf, 0x20u);
    }

    v9 = v26;
  }

}

void __69__SBHomeScreenController__launchWidgetIcon_fromLocation_withContext___block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInterfaceController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activateApplication:fromIcon:location:activationSettings:actions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

  }
}

- (void)noteTransientOverlayPresented
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  SBLogIconDragging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "transient overlay presented", v6, 2u);
  }

  -[SBHomeScreenController iconManager](self, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditing:", 0);

  -[SBHomeScreenController iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllDrags");

}

- (void)noteViewCovered
{
  id v2;

  -[SBHomeScreenController iconManager](self, "iconManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllFolderScrolling");

}

- (void)_lockScreenUIWillLock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMainDisplayWindowScene");

  if (v6)
  {
    -[SBHomeScreenController iconManager](self, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEditing:", 0);
    v8 = objc_opt_class();
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("Animated"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v11;
    v12 = objc_msgSend(v11, "BOOLValue");
    -[SBHomeScreenController dismissAppIconForceTouchControllers:](self, "dismissAppIconForceTouchControllers:", 0);
    objc_msgSend(v7, "dismissIconShareSheets");
    -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentedViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v13, "dismissViewControllerAnimated:completion:", v12, 0);
    -[SBHomeScreenController dismissTodayOverlayAnimated:](self, "dismissTodayOverlayAnimated:", v12);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "connectedWindowScenes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "modalLibraryController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "isPresentingLibraryInForeground"))
            objc_msgSend(v21, "dismissLibraryAnimated:completion:", v12, 0);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v18);
    }

    if ((_DWORD)v12)
      objc_msgSend(v7, "dismissModalInteractions");
    else
      objc_msgSend(v7, "dismissModalInteractionsImmediately");
    objc_msgSend(v7, "focusModeManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dismissAllFocusModePopovers");
    -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCurrentPageIndex:animated:", objc_msgSend(v23, "nearestIconPageIndex"), 0);

  }
}

- (unint64_t)_foldersInList:(id)a3
{
  id v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__SBHomeScreenController__foldersInList___block_invoke;
  v6[3] = &unk_1E8EA62B0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateFolderIconsUsingBlock:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __41__SBHomeScreenController__foldersInList___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (id)currentAnimationContainer
{
  void *v3;
  void *v4;
  id v5;

  -[SBHomeScreenController _currentFolderController](self, "_currentFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = v3;

  return v5;
}

- (id)launchActionsForIconView:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "continuityInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEA2C0]);
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithIdentifier:activityTypeIdentifier:appSuggestion:", v6, v7, v3);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)launchURLForIconView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "continuityInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launchURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "launchURLRequiresInboxCopy");
  objc_msgSend(v3, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "application");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "info");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "documentInboxURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "makeInboxCopyOfLaunchURLToInboxURL:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = v9;
    goto LABEL_6;
  }
  v13 = objc_msgSend(v7, "isBookmarkIcon");

  if (v13)
  {
    objc_msgSend(v3, "icon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationToLaunch");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
LABEL_7:

      goto LABEL_8;
    }
    objc_msgSend(v8, "launchURL");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:

    v5 = (void *)v12;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (id)launchActivationSettingsForIconView:(id)a3
{
  id v4;
  SBActivationSettings *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  v5 = objc_alloc_init(SBActivationSettings);
  -[SBHomeScreenController launchURLForIconView:](self, "launchURLForIconView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[SBActivationSettings setObject:forActivationSetting:](v5, "setObject:forActivationSetting:", v6, 5);
  objc_msgSend(v4, "_sbWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "application");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9
    && objc_msgSend(v9, "restrictedToTheEmbeddedDisplayInChamois")
    && objc_msgSend(v7, "isExtendedDisplayWindowScene"))
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "embeddedDisplayWindowScene");
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }
  -[SBActivationSettings setObject:forActivationSetting:](v5, "setObject:forActivationSetting:", v7, 68);

  return v5;
}

- (BOOL)allowsBadgingForIcon:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "overrideBadgeNumberOrString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "applicationBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      if (objc_msgSend(v4, "isBookmarkIcon"))
      {
        objc_msgSend(v4, "bookmark");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "placeholderBundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }
    }
    v6 = -[SBHomeScreenController _allowsBadgingForApplicationBundleIdentifier:](self, "_allowsBadgingForApplicationBundleIdentifier:", v7);

  }
  return v6;
}

- (BOOL)_allowsBadgingForApplicationBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;

  v4 = a3;
  -[SBHomeScreenController iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusModeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeFocusMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "showsOnlyAllowedApplicationBadges");
  v9 = objc_msgSend(v7, "hidesOnlyDeniedApplicationBadges");
  if (v4)
  {
    v10 = v9;
    -[SBHomeScreenController _iconController](self, "_iconController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayIDsWithBadgingEnabled");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "containsObject:", v4);
    if (v8)
    {
      objc_msgSend(v7, "allowedApplicationBundleIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = objc_msgSend(v14, "containsObject:", v4);
    }
    else
    {
      if (!v10)
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(v7, "deniedApplicationBundleIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v4) ^ 1;
    }
    v13 &= v15;

    goto LABEL_8;
  }
  v13 = v8 ^ 1;
LABEL_9:

  return v13;
}

- (double)minimumHomeScreenScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "minimumHomeScreenScale");
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }

  return v5;
}

- (void)_mainSwitcherCreated:(id)a3
{
  id v3;

  -[SBHomeScreenController iconManager](self, "iconManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumHomeScreenScaleDidChange");

}

- (BOOL)_isCoplanarHomeScreenEnabled
{
  BOOL v2;
  void *v3;

  if (__sb__runningInSpringBoard())
  {
    return !SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "userInterfaceIdiom") == 0;

  }
  return v2;
}

- (BOOL)isShowingHomeScreenOverlay
{
  return -[SBHomeScreenController isTodayOverlayPresented](self, "isTodayOverlayPresented")
      || -[SBHomeScreenController isMainDisplayLibraryViewVisible](self, "isMainDisplayLibraryViewVisible");
}

- (void)dismissHomeScreenOverlays
{
  -[SBHomeScreenController dismissHomeScreenOverlaysAnimated:](self, "dismissHomeScreenOverlaysAnimated:", 1);
}

- (void)dismissHomeScreenOverlaysAnimated:(BOOL)a3
{
  -[SBHomeScreenController dismissHomeScreenOverlaysAnimated:completion:](self, "dismissHomeScreenOverlaysAnimated:completion:", a3, 0);
}

- (void)dismissHomeScreenOverlaysAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[4];
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD *v32;
  _QWORD v33[3];
  char v34;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD *v37;
  _QWORD v38[3];
  char v39;
  _BYTE v40[128];
  uint64_t v41;

  v4 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v7 = dispatch_group_create();
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v39 = 1;
    dispatch_group_enter(v7);
    v8 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __71__SBHomeScreenController_dismissHomeScreenOverlaysAnimated_completion___block_invoke;
    v35[3] = &unk_1E8EA62D8;
    v37 = v38;
    v9 = v7;
    v36 = v9;
    v10 = (void *)MEMORY[0x1D17E5550](v35);
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v34 = 1;
    v30[0] = v8;
    v30[1] = 3221225472;
    v30[2] = __71__SBHomeScreenController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_2;
    v30[3] = &unk_1E8EA62D8;
    v32 = v33;
    v11 = v9;
    v31 = v11;
    v12 = (void *)MEMORY[0x1D17E5550](v30);
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __71__SBHomeScreenController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_3;
    block[3] = &unk_1E8EA6300;
    v27 = v6;
    v28 = v38;
    v29 = v33;
    dispatch_group_notify(v11, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v38, 8);
    if (!-[SBHomeScreenController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
    {
      if (v11)
        dispatch_group_enter(v11);
      goto LABEL_16;
    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    if (!-[SBHomeScreenController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
    {
LABEL_16:
      -[SBHomeScreenController dismissLibraryAnimated:completion:](self, "dismissLibraryAnimated:completion:", v4, v12);
      goto LABEL_17;
    }
  }
  v21 = v10;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "connectedWindowScenes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v40, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (v11)
          dispatch_group_enter(v11);
        objc_msgSend(v19, "modalLibraryController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "dismissLibraryAnimated:completion:", v4, v12);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v40, 16);
    }
    while (v16);
  }

  v10 = v21;
LABEL_17:
  -[SBHomeScreenController dismissTodayOverlayAnimated:completion:](self, "dismissTodayOverlayAnimated:completion:", v4, v10);

}

void __71__SBHomeScreenController_dismissHomeScreenOverlaysAnimated_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __71__SBHomeScreenController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __71__SBHomeScreenController_dismissHomeScreenOverlaysAnimated_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  _BOOL8 v3;

  v2 = a1[4];
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    v3 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24) != 0;
  else
    v3 = 0;
  return (*(uint64_t (**)(uint64_t, _BOOL8))(v2 + 16))(v2, v3);
}

- (void)dismissTodayOverlay
{
  -[SBHomeScreenController dismissTodayOverlayAnimated:](self, "dismissTodayOverlayAnimated:", 1);
}

- (void)dismissTodayOverlayAnimated:(BOOL)a3
{
  -[SBHomeScreenController dismissTodayOverlayAnimated:completion:](self, "dismissTodayOverlayAnimated:completion:", a3, 0);
}

- (void)dismissTodayOverlayAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, uint64_t);

  v4 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  if (-[SBHomeScreenController isTodayOverlayPresented](self, "isTodayOverlayPresented"))
  {
    -[SBHomeScreenController dismissHomeScreenOverlayControllerAnimated:completion:](self, "dismissHomeScreenOverlayControllerAnimated:completion:", v4, v6);
  }
  else if (v6)
  {
    v6[2](v6, 1);
  }

}

- (BOOL)isTodayOverlaySpotlightVisible
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[SBHomeScreenController todayViewController](self, "todayViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isSpotlightVisible");
  return (char)v4;
}

- (void)dismissTodayOverlaySpotlightAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = objc_opt_class();
  -[SBHomeScreenController todayViewController](self, "todayViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dismissSpotlightAnimated:", v3);
}

- (void)dismissHomeScreenOverlayControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  v6 = a4;
  -[SBHomeScreenController homeScreenOverlayController](self, "homeScreenOverlayController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isPresented"))
  {
    if (-[SBHomeScreenController isBackdropVisible](self, "isBackdropVisible"))
      -[SBHomeScreenController beginRequiringLiveBackdropViewForReason:](self, "beginRequiringLiveBackdropViewForReason:", CFSTR("SBIconControllerLiveBackdropForDismissingTodayViewReason"));
    objc_msgSend(v7, "setShouldUseReducedMotionAnimation:", UIAccessibilityIsReduceMotionEnabled());
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__SBHomeScreenController_dismissHomeScreenOverlayControllerAnimated_completion___block_invoke;
    v8[3] = &unk_1E8EA47F0;
    v8[4] = self;
    v9 = v7;
    v10 = v6;
    objc_msgSend(v9, "dismissAnimated:completionHandler:", v4, v8);

  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

uint64_t __80__SBHomeScreenController_dismissHomeScreenOverlayControllerAnimated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "endRequiringLiveBackdropViewForReason:", CFSTR("SBIconControllerLiveBackdropForDismissingTodayViewReason"));
  objc_msgSend(*(id *)(a1 + 40), "setShouldUseReducedMotionAnimation:", 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)dismissHomeScreenOverlayUsingTransitionCoordinator:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = a3;
  -[SBHomeScreenController homeScreenOverlayController](self, "homeScreenOverlayController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isPresented"))
  {
    v6 = -[SBHomeScreenController isBackdropVisible](self, "isBackdropVisible");
    v7 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      -[SBHomeScreenController beginRequiringLiveBackdropViewForReason:](self, "beginRequiringLiveBackdropViewForReason:", CFSTR("SBIconControllerLiveBackdropForDismissingTodayViewReason"));
      v9[0] = v7;
      v9[1] = 3221225472;
      v9[2] = __77__SBHomeScreenController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke;
      v9[3] = &unk_1E8E9EA28;
      v9[4] = self;
      objc_msgSend(v4, "notifyWhenInteractionChangesUsingBlock:", v9);
    }
    objc_msgSend(v5, "dismissUsingViewControllerTransitionCoordinator:", v4);
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __77__SBHomeScreenController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke_2;
    v8[3] = &unk_1E8E9EA28;
    v8[4] = self;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", v8, 0);
  }

}

uint64_t __77__SBHomeScreenController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endRequiringLiveBackdropViewForReason:", CFSTR("SBIconControllerLiveBackdropForDismissingTodayViewReason"));
}

void __77__SBHomeScreenController_dismissHomeScreenOverlayUsingTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_rootFolderController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSuppressesExtraEditingButtons:", 0);

}

- (void)setTemporaryIntent:(id)a3 forIconWithIdentifier:(id)a4 widgetUniqueIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *temporaryWidgetIntents;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && !self->_temporaryWidgetIntents)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    temporaryWidgetIntents = self->_temporaryWidgetIntents;
    self->_temporaryWidgetIntents = v11;

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@^%@"), v9, v10);
  if (v8)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v25;
    if (!v14)
    {
      SBLogWidgetIntent();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_msgSend(v8, "_indexingHash");
        *(_DWORD *)buf = 138544130;
        v27 = v10;
        v28 = 2048;
        v29 = v24;
        v30 = 2112;
        v31 = v13;
        v32 = 2112;
        v33 = v15;
        _os_log_error_impl(&dword_1D0540000, v17, OS_LOG_TYPE_ERROR, "Error archiving temporary intent widget unique identifier '%{public}@/%lld/%@': %@", buf, 0x2Au);
      }
      goto LABEL_17;
    }
    -[NSMutableDictionary setObject:forKey:](self->_temporaryWidgetIntents, "setObject:forKey:", v14, v13);
    v16 = objc_msgSend(v14, "length");
    SBLogWidgetIntent();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        v19 = objc_msgSend(v8, "_indexingHash");
        *(_DWORD *)buf = 138543618;
        v27 = v10;
        v28 = 2048;
        v29 = v19;
        v20 = "Saving temporary intent for widget unique identifier '%{public}@'/%lld";
        v21 = v17;
        v22 = 22;
LABEL_16:
        _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
    }
    else if (v18)
    {
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      v20 = "Saving 0-length temporary intent for widget unique identifier '%{public}@'";
      v21 = v17;
      v22 = 12;
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  SBLogWidgetIntent();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v27 = v10;
    v28 = 2048;
    v29 = objc_msgSend(0, "_indexingHash");
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "Removing temporary intent for widget unique identifier '%{public}@'/%lld/%@", buf, 0x20u);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_temporaryWidgetIntents, "removeObjectForKey:", v13);
LABEL_18:

}

- (id)temporaryIntentDataForIconWithIdentifier:(id)a3 widgetUniqueIdentifier:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%@^%@"), v8, v7);

  -[NSMutableDictionary objectForKey:](self->_temporaryWidgetIntents, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "length");

  return v11;
}

- (BOOL)allowsHomeScreenOverlay
{
  void *v3;
  BOOL v4;
  void *v5;

  objc_msgSend((id)SBApp, "userSessionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sessionType") != 2;

  -[SBHomeScreenController iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v4 & ~objc_msgSend(v5, "isFolderPageManagementUIVisible");

  return (char)v3;
}

- (void)getLeadingTopButtonFrame:(CGRect *)a3 trailingTopButtonFrame:(CGRect *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL8 v19;
  id v20;

  -[SBHomeScreenController iconManager](self, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "listLayoutProvider");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "layoutForIconLocation:", *MEMORY[0x1E0DAA9E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
  objc_msgSend(MEMORY[0x1E0DAA658], "_getTopLeadingButtonFrame:topTrailingButtonFrame:inBounds:forListLayout:withTranslationOffset:inRTL:", a3, a4, v8, v19, v12, v14, v16, v18, 0.0);

}

- (void)enumerateTintableViewControllersUsingBlock:(id)a3
{
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SBHomeScreenController *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __69__SBHomeScreenController_enumerateTintableViewControllersUsingBlock___block_invoke;
  v23[3] = &unk_1E8EA6328;
  v5 = v4;
  v24 = v5;
  v17 = self;
  -[SBHomeScreenController _enumerateTodayViewControllers:](self, "_enumerateTodayViewControllers:", v23);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectedWindowScenes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "modalLibraryController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "libraryViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          ((void (*)(id, void *))v4[2])(v5, v14);
        objc_msgSend(v12, "floatingDockController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "viewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          ((void (*)(id, void *))v4[2])(v5, v16);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v9);
  }

  if (v17->_overlayLibraryViewController)
    v4[2](v5);

}

uint64_t __69__SBHomeScreenController_enumerateTintableViewControllersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateHomeScreenTraitOverridesForViewController:(id)a3
{
  SBHIconManager *iconManager;
  id v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  iconManager = self->_iconManager;
  v5 = a3;
  -[SBHomeScreenController iconStylePickerConfigurationForIconManager:](self, "iconStylePickerConfigurationForIconManager:", iconManager);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "styleType");
  v7 = (v6 | 2) != 3;
  if ((v6 | 2) == 3)
    v8 = 2;
  else
    v8 = 0;
  objc_msgSend(v5, "traitOverrides");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v9, "setObject:forTrait:", v12, v10);
  else
    objc_msgSend(v9, "removeTrait:", v10);

  if (v7)
  {
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeTrait:", v11);

  }
  else
  {
    objc_msgSend(v9, "setUserInterfaceStyle:", v8);
  }

}

- (id)iconStylePickerConfigurationForIconManager:(id)a3
{
  return -[SBWallpaperIconStyleCoordinator currentStyleConfiguration](self->_iconStyleCoordinator, "currentStyleConfiguration", a3);
}

- (void)updateStyleConfiguration:(id)a3 forIconManager:(id)a4
{
  -[SBWallpaperIconStyleCoordinator setCurrentStyleConfiguration:](self->_iconStyleCoordinator, "setCurrentStyleConfiguration:", a3, a4);
}

- (void)iconManagerWantsIconSizeToggled:(id)a3
{
  -[SBWallpaperIconStyleCoordinator setShouldUseLargeHomeScreenIcons:](self->_iconStyleCoordinator, "setShouldUseLargeHomeScreenIcons:", -[SBWallpaperIconStyleCoordinator shouldUseLargeHomeScreenIcons](self->_iconStyleCoordinator, "shouldUseLargeHomeScreenIcons", a3) ^ 1);
}

- (BOOL)shouldUseHomeScreenLargeIconSizeForIconManager:(id)a3
{
  return -[SBWallpaperIconStyleCoordinator shouldUseLargeHomeScreenIcons](self->_iconStyleCoordinator, "shouldUseLargeHomeScreenIcons", a3);
}

- (void)removeHomeScreenTraitOverridesForViewController:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "traitOverrides");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTrait:", v3);

  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTrait:", v4);

}

- (id)currentIconImageStyleConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHomeScreenController rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "sbh_iconImageStyleConfigurationFromTraitCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)currentIconImageAppearance
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHomeScreenController rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "sbh_iconImageAppearanceFromTraitCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)description
{
  return (NSString *)-[SBHomeScreenController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)createFloatingDockControllerForWindowScene:(id)a3
{
  id v4;
  SBFloatingDockController *v5;

  v4 = a3;
  if (+[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported"))
  {
    v5 = -[SBFloatingDockController initWithWindowScene:homeScreenContextProvider:]([SBFloatingDockController alloc], "initWithWindowScene:homeScreenContextProvider:", v4, self);
    -[SBHomeScreenController _configureFloatingDockController:forWindowScene:](self, "_configureFloatingDockController:forWindowScene:", v5, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_configureFloatingDockController:(id)a3 forWindowScene:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(v6, "registerForWindowScene:", a4);
  -[SBHomeScreenController notifyFloatingDockControllerObserversDidRegister:](self, "notifyFloatingDockControllerObserversDidRegister:", v6);
  objc_msgSend(v6, "viewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenController updateHomeScreenTraitOverridesForViewController:](self, "updateHomeScreenTraitOverridesForViewController:", v7);
}

- (void)addFloatingDockControllerObserver:(id)a3
{
  id v5;
  NSHashTable *floatingDockControllerObservers;
  NSHashTable *v7;
  NSHashTable *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenController.m"), 1550, CFSTR("cannot be observed by a nil object"));

    v5 = 0;
  }
  if (!-[NSHashTable containsObject:](self->_floatingDockControllerObservers, "containsObject:", v5))
  {
    floatingDockControllerObservers = self->_floatingDockControllerObservers;
    if (!floatingDockControllerObservers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_floatingDockControllerObservers;
      self->_floatingDockControllerObservers = v7;

      floatingDockControllerObservers = self->_floatingDockControllerObservers;
    }
    -[NSHashTable addObject:](floatingDockControllerObservers, "addObject:", v10);
  }

}

- (void)removeFloatingDockControllerObserver:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenController.m"), 1560, CFSTR("cannot be observed by a nil object"));

    v5 = 0;
  }
  -[NSHashTable removeObject:](self->_floatingDockControllerObservers, "removeObject:", v5);

}

- (void)notifyFloatingDockControllerObserversDidRegister:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_floatingDockControllerObservers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "floatingDockControllerDidRegister:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[SBHomeScreenController _currentFolderController](self, "_currentFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController homeScreenOverlayController](self, "homeScreenOverlayController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modalLibraryController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isPresented"))
  {
    objc_msgSend(v4, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = (void **)v14;
LABEL_5:
    objc_msgSend(v8, "arrayWithObjects:count:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (objc_msgSend(v6, "isPresentingLibraryInForeground"))
  {
    objc_msgSend(v6, "libraryViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = &v13;
    goto LABEL_5;
  }
  if (v3)
  {
    v12 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_6:

  return v10;
}

- (void)_reduceMotionStatusDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;

  -[SBHomeScreenController searchPresentableViewController](self, "searchPresentableViewController", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invalidateBackgroundView");
  objc_msgSend(v14, "invalidateSearchAffordanceView");
  -[SBHomeScreenController scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[SBHomeScreenController searchPresenter](self, "searchPresenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isPresenting");

    if (v7)
    {
      v8 = objc_opt_class();
      -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      SBSafeCast(v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (UIAccessibilityIsReduceMotionEnabled())
        v12 = 1.0;
      else
        v12 = 0.0;
      objc_msgSend(v11, "scrollAccessoryView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAlpha:", v12);

    }
  }

}

- (void)handleNavigationCommand:(id)a3 withDirection:(int64_t)a4
{
  void *v6;
  int v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  SBLibraryViewController *v12;
  char v13;
  int v14;
  void *v15;
  int v16;
  BOOL v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  char v28;
  void *v29;
  uint64_t v30;
  char v31;
  char v32;
  char v33;
  void *v34;
  uint64_t v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;

  objc_msgSend((id)SBApp, "windowSceneManager", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeDisplayWindowScene");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v41, "isMainDisplayWindowScene");
  v8 = v41;
  if (!v7)
    goto LABEL_79;
  v9 = -[SBHomeScreenController isModalAppLibrarySupported](self, "isModalAppLibrarySupported");
  v10 = v9;
  if (a4 == 4)
  {
    if (v9)
    {
      objc_msgSend(v41, "modalLibraryController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "libraryViewController");
      v12 = (SBLibraryViewController *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isPresentingLibrary");

      if ((v13 & 1) != 0)
      {
LABEL_5:
        -[SBHLibraryViewController popPresentationState](v12, "popPresentationState");
        v14 = 1;
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v12 = self->_overlayLibraryViewController;
      -[SBHomeScreenController iconManager](self, "iconManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isMainDisplayLibraryViewVisible");

      if (v16)
        goto LABEL_5;
    }
    v14 = 0;
    goto LABEL_9;
  }
  v14 = 0;
LABEL_10:
  v17 = -[SBHomeScreenController areHomeScreenIconsOccluded](self, "areHomeScreenIconsOccluded");
  v8 = v41;
  if (!v17)
  {
    v18 = objc_msgSend(v41, "isMainDisplayWindowScene");
    v8 = v41;
    if (v18)
    {
      -[SBHomeScreenController _currentFolderController](self, "_currentFolderController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "currentPageIndex");
      v22 = objc_msgSend(v19, "contentVisibility");
      if (v21 == objc_msgSend(v19, "firstIconPageIndex"))
        v23 = v14;
      else
        v23 = 1;
      v24 = v14;
      if ((v23 & 1) == 0)
      {
        v24 = v14;
        if (v19 == v20)
        {
          v25 = -[SBHomeScreenController isTodayOverlayPresented](self, "isTodayOverlayPresented");
          if (a4 != 1 || v25 || v22)
          {
            if ((a4 == 4 || a4 == 2) && v25)
            {
              v24 = 1;
              -[SBHomeScreenController dismissTodayOverlayAnimated:](self, "dismissTodayOverlayAnimated:", 1);
            }
            else
            {
              v24 = 0;
            }
          }
          else
          {
            -[SBHomeScreenController iconManager](self, "iconManager");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBHomeScreenController presentTodayOverlayForIconManager:](self, "presentTodayOverlayForIconManager:", v26);

            v24 = 1;
          }
        }
      }
      if (v10)
      {
        v27 = objc_msgSend(v20, "trailingCustomViewPageIndex");
        if (v21 == objc_msgSend(v19, "lastIconPageIndex"))
          v28 = v24;
        else
          v28 = 1;
        if ((v28 & 1) == 0 && v19 == v20 && a4 == 2 && !v22)
        {
          v29 = v19;
          v30 = v27;
          goto LABEL_35;
        }
        if (v21 == v27)
          v33 = v24;
        else
          v33 = 1;
        if (a4 == 1 && (v33 & 1) == 0 && v19 == v20)
        {
          objc_msgSend(v41, "modalLibraryController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "dismissLibraryAnimated:completion:", 1, 0);

          goto LABEL_78;
        }
      }
      else
      {
        if (v21 == objc_msgSend(v19, "lastIconPageIndex"))
          v31 = v24;
        else
          v31 = 1;
        if ((v31 & 1) == 0 && v19 == v20)
        {
          if (a4 == 2)
            v32 = v14;
          else
            v32 = 1;
          if ((v32 & 1) == 0 && !v22)
          {
            -[SBHomeScreenController presentLibraryFromOverlayControllerAnimated:completion:](self, "presentLibraryFromOverlayControllerAnimated:completion:", 1, 0);
            goto LABEL_78;
          }
          if ((a4 == 4 || a4 == 1) && v14)
          {
            -[SBHomeScreenController dismissLibraryAnimated:completion:](self, "dismissLibraryAnimated:completion:", 1, 0);
            goto LABEL_78;
          }
          v24 = 0;
        }
      }
      if ((unint64_t)(a4 - 3) < 0xFFFFFFFFFFFFFFFELL || (v24 & 1) != 0)
      {
        if (a4 == 4)
          v36 = v24;
        else
          v36 = 1;
        if ((v36 & 1) == 0 && !v22)
        {
          if (objc_msgSend(v19, "isOpen"))
          {
            objc_msgSend(v19, "folder");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "isRootFolder");

            if ((v38 & 1) == 0)
              objc_msgSend(v19, "_closeFolder");
          }
        }
        goto LABEL_78;
      }
      if (a4 == 2)
        v35 = v21 + 1;
      else
        v35 = v21 - 1;
      if (v22 || !objc_msgSend(v19, "_isValidPageIndex:", v35))
      {
LABEL_78:

        v8 = v41;
        goto LABEL_79;
      }
      if (__sb__runningInSpringBoard())
      {
        if (SBFEffectiveDeviceClass() == 2
          && !objc_msgSend(v19, "doesPageContainIconListView:", v35))
        {
          goto LABEL_78;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v39, "userInterfaceIdiom") == 1)
        {
          v40 = objc_msgSend(v19, "doesPageContainIconListView:", v35);

          if ((v40 & 1) == 0)
            goto LABEL_78;
        }
        else
        {

        }
      }
      v29 = v19;
      v30 = v35;
LABEL_35:
      objc_msgSend(v29, "setCurrentPageIndex:animated:", v30, 1);
      goto LABEL_78;
    }
  }
LABEL_79:

}

- (void)_configureEditingGestureRecognizers
{
  UILongPressGestureRecognizer *v3;
  UILongPressGestureRecognizer *longPressToEditGestureRecognizer;
  void *v5;
  void *v6;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *tapToEndEditingGestureRecognizer;
  void *v9;
  void *v10;
  UILongPressGestureRecognizer *v11;

  if (!self->_longPressToEditGestureRecognizer)
  {
    v3 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel__handleEditingGesture_);
    longPressToEditGestureRecognizer = self->_longPressToEditGestureRecognizer;
    self->_longPressToEditGestureRecognizer = v3;

    -[UILongPressGestureRecognizer setDelegate:](self->_longPressToEditGestureRecognizer, "setDelegate:", self);
    -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", self->_longPressToEditGestureRecognizer);

  }
  if (!self->_tapToEndEditingGestureRecognizer)
  {
    v7 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleEditingGesture_);
    tapToEndEditingGestureRecognizer = self->_tapToEndEditingGestureRecognizer;
    self->_tapToEndEditingGestureRecognizer = v7;

    -[UITapGestureRecognizer setDelegate:](self->_tapToEndEditingGestureRecognizer, "setDelegate:", self);
    -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:", self->_tapToEndEditingGestureRecognizer);

  }
  v11 = self->_longPressToEditGestureRecognizer;
  -[SBHIconEditingSettings longPressToEditDuration](self->_iconEditingSettings, "longPressToEditDuration");
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v11, "setMinimumPressDuration:");
}

- (void)_handleEditingGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UITapGestureRecognizer *v8;

  v8 = (UITapGestureRecognizer *)a3;
  -[SBHomeScreenController iconManager](self, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer == v8)
  {
    if (-[UITapGestureRecognizer state](v8, "state") == 1)
    {
      objc_msgSend(v4, "iconEditingFeedbackBehavior");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITapGestureRecognizer locationInView:](v8, "locationInView:", v7);
      objc_msgSend(v4, "setEditing:withFeedbackBehavior:location:", 1, v5);

      -[UITapGestureRecognizer setEnabled:](v8, "setEnabled:", 0);
      -[UITapGestureRecognizer setEnabled:](v8, "setEnabled:", 1);
    }
  }
  else if (self->_tapToEndEditingGestureRecognizer == v8)
  {
    objc_msgSend(v4, "setEditing:withFeedbackBehavior:location:", 0, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  BOOL v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  id v29;
  id v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  char v35;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  CGPoint v45;
  CGRect v46;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer == v6
    || self->_tapToEndEditingGestureRecognizer == v6)
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 1;
    -[SBHomeScreenController iconManager](self, "iconManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEditing");
    v11 = objc_msgSend(v9, "isFolderPageManagementUIVisible");
    v12 = objc_msgSend(v9, "isShowingIconContextMenu");
    if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer == v6)
    {
      *((_BYTE *)v42 + 24) = (v10 | v11 | v12) ^ 1;
    }
    else if (self->_tapToEndEditingGestureRecognizer == v6)
    {
      if (((v10 ^ 1 | v11 | v12) & 1) != 0)
      {
        *((_BYTE *)v42 + 24) = 0;
      }
      else
      {
        -[SBHomeScreenController iconDragManager](self, "iconDragManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isTrackingUserActiveIconDrags");
        *((_BYTE *)v42 + 24) = v14 ^ 1;

      }
    }
    if (*((_BYTE *)v42 + 24))
    {
      if ((UITapGestureRecognizer *)self->_longPressToEditGestureRecognizer != v6)
        goto LABEL_15;
      v15 = objc_opt_class();
      -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      SBSafeCast(v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v18, "enterEditingTouchRect");
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v26 = v25;
        objc_msgSend(v7, "locationInView:", v18);
        v45.x = v27;
        v45.y = v28;
        v46.origin.x = v20;
        v46.origin.y = v22;
        v46.size.width = v24;
        v46.size.height = v26;
        *((_BYTE *)v42 + 24) = CGRectContainsPoint(v46, v45);
      }

      if (*((_BYTE *)v42 + 24))
      {
LABEL_15:
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __63__SBHomeScreenController_gestureRecognizer_shouldReceiveTouch___block_invoke;
        v37[3] = &unk_1E8EA6440;
        v29 = v7;
        v38 = v29;
        v30 = v9;
        v39 = v30;
        v40 = &v41;
        objc_msgSend(v30, "enumerateDisplayedIconViewsUsingBlock:", v37);

        if (*((_BYTE *)v42 + 24) && objc_msgSend(v30, "isOverlayTodayViewVisible"))
        {
          -[SBHomeScreenController todayViewController](self, "todayViewController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[SBHomeScreenController _shouldTodayViewController:receiveTouch:](self, "_shouldTodayViewController:receiveTouch:", v31, v29);
          *((_BYTE *)v42 + 24) = v32;

        }
      }
    }
    if (*((_BYTE *)v42 + 24) && objc_msgSend(v9, "isMainDisplayLibraryViewVisible"))
    {
      -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeScreenController libraryViewControllerForWindowScene:](self, "libraryViewControllerForWindowScene:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = objc_msgSend(v34, "isPresentingSearch");
      *((_BYTE *)v42 + 24) = v35 ^ 1;

    }
    v8 = *((_BYTE *)v42 + 24) != 0;

    _Block_object_dispose(&v41, 8);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

void __63__SBHomeScreenController_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  id v9;
  CGPoint v10;
  CGRect v11;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "locationInView:", v9);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v9, "bounds");
  v10.x = v6;
  v10.y = v8;
  if (CGRectContainsPoint(v11, v10) && SBIconViewQueryingDisplayingIconView())
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }

}

- (BOOL)_shouldTodayViewController:(id)a3 receiveTouch:(id)a4
{
  id v4;
  int v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "isSpotlightVisible") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  char isKindOfClass;

  v6 = a4;
  if (self->_longPressToEditGestureRecognizer == a3
    && (objc_opt_self(),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_isKindOfClass(),
        v7,
        (v8 & 1) != 0))
  {
    objc_msgSend(v6, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)areHomeScreenIconsOccluded
{
  return -[SBHomeScreenController iconOcclusionReasons](self, "iconOcclusionReasons") != 0;
}

- (void)addIconOcclusionReason:(unint64_t)a3 updateVisibleIcons:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;

  v4 = a4;
  v7 = -[SBHomeScreenController iconOcclusionReasons](self, "iconOcclusionReasons");
  if ((a3 & ~v7) != 0)
  {
    -[SBHomeScreenController setIconOcclusionReasons:](self, "setIconOcclusionReasons:", v7 | a3);
    if (v4)
      -[SBHomeScreenController _updateVisibleIconsAfterOcclusionChange](self, "_updateVisibleIconsAfterOcclusionChange");
  }
}

- (void)removeIconOcclusionReason:(unint64_t)a3 updateVisibleIcons:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;

  v4 = a4;
  v7 = -[SBHomeScreenController iconOcclusionReasons](self, "iconOcclusionReasons");
  if ((v7 & a3) != 0)
  {
    -[SBHomeScreenController setIconOcclusionReasons:](self, "setIconOcclusionReasons:", v7 & ~a3);
    if (v4)
      -[SBHomeScreenController _updateVisibleIconsAfterOcclusionChange](self, "_updateVisibleIconsAfterOcclusionChange");
  }
}

- (void)_updateVisibleIconsAfterOcclusionChange
{
  unint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = -[SBHomeScreenController iconOcclusionReasons](self, "iconOcclusionReasons");
  v5 = (v4 & 0x12) != 0;
  if ((v4 & 0x12) != 0)
    v6 = 2;
  else
    v6 = v4 != 0;
  -[SBHomeScreenController iconManager](self, "iconManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentVisibility:", v6);
  -[SBHomeScreenController homeScreenOverlayController](self, "homeScreenOverlayController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentVisibility:", v6);
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController setWallpaperAnimationDisabled:forReason:](self, "setWallpaperAnimationDisabled:forReason:", v5, v8);

}

- (id)markIconsOccludedForReason:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *iconsOccludedAssertions;
  SBIconsOccludedAssertion *v7;

  v4 = a3;
  if (!self->_iconsOccludedAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    iconsOccludedAssertions = self->_iconsOccludedAssertions;
    self->_iconsOccludedAssertions = v5;

  }
  v7 = -[SBIconsOccludedAssertion initWithInvalidator:reason:]([SBIconsOccludedAssertion alloc], "initWithInvalidator:reason:", self, v4);
  -[NSHashTable addObject:](self->_iconsOccludedAssertions, "addObject:", v7);
  -[SBHomeScreenController addIconOcclusionReason:updateVisibleIcons:](self, "addIconOcclusionReason:updateVisibleIcons:", 64, 1);

  return v7;
}

- (void)removeIconsOccludedAssertion:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSHashTable containsObject:](self->_iconsOccludedAssertions, "containsObject:"))
  {
    -[NSHashTable removeObject:](self->_iconsOccludedAssertions, "removeObject:", v4);
    if (!-[NSHashTable count](self->_iconsOccludedAssertions, "count"))
      -[SBHomeScreenController removeIconOcclusionReason:updateVisibleIcons:](self, "removeIconOcclusionReason:updateVisibleIcons:", 64, 1);
  }

}

- (void)_coverSheetWillPresent:(id)a3
{
  void *v4;
  id v5;

  -[SBHomeScreenController iconManager](self, "iconManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditing:", 0);

  -[SBHomeScreenController iconManager](self, "iconManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllDrags");

}

- (void)_coverSheetDidPresent:(id)a3
{
  -[SBHomeScreenController dismissTodayOverlayAnimated:](self, "dismissTodayOverlayAnimated:", 0);
}

- (void)_controlCenterWillPresent:(id)a3
{
  void *v4;
  id v5;

  if (-[SBHomeScreenController _controlCenterIsOnTheSameWindowScene](self, "_controlCenterIsOnTheSameWindowScene", a3))
  {
    -[SBHomeScreenController addIconOcclusionReason:updateVisibleIcons:](self, "addIconOcclusionReason:updateVisibleIcons:", 4, 1);
    -[SBHomeScreenController iconManager](self, "iconManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEditing:", 0);

    -[SBHomeScreenController iconManager](self, "iconManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelAllDrags");

  }
}

- (void)_controlCenterWillDismiss:(id)a3
{
  if (-[SBHomeScreenController _controlCenterIsOnTheSameWindowScene](self, "_controlCenterIsOnTheSameWindowScene", a3))
    -[SBHomeScreenController removeIconOcclusionReason:updateVisibleIcons:](self, "removeIconOcclusionReason:updateVisibleIcons:", 4, 1);
}

- (BOOL)_controlCenterIsOnTheSameWindowScene
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_controlCenterWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sbWindowScene");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v2;
  v8 = v7;

  return v2 == v8;
}

- (void)_policyAggregatorCapabilitiesDidChange:(id)a3
{
  void *v4;
  id v5;

  -[SBHomeScreenController policyAggregator](self, "policyAggregator", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "allowsCapability:", 23) & 1) == 0)
    -[SBHomeScreenController dismissTodayOverlay](self, "dismissTodayOverlay");
  if ((objc_msgSend(v5, "allowsCapability:", 17) & 1) == 0)
  {
    -[SBHomeScreenController iconManager](self, "iconManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEditing:", 0);

  }
}

- (void)setModel:(id)a3
{
  SBIconModel *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  NSObject *v11;
  NSMutableSet *v12;
  NSMutableSet *delayedStyleWallpaperEffectViews;
  void *v14;
  void *v15;
  NSMutableSet *v16;
  void *v17;
  void *v18;
  NSMutableSet *v19;
  NSMutableSet *v20;
  NSMutableSet *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableSet *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (SBIconModel *)a3;
  if (self->_iconModel != v5)
  {
    -[SBHomeScreenController iconManager](self, "iconManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0DAAA08];
    objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0DAAA08], self->_iconModel);
    -[SBHomeScreenController overlayLibraryViewController](self, "overlayLibraryViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    -[SBHomeScreenController setOverlayLibraryViewController:](self, "setOverlayLibraryViewController:", 0);
    objc_msgSend(v6, "setOverlayLibraryViewController:", 0);
    -[SBHomeScreenController setHomeScreenOverlayController:](self, "setHomeScreenOverlayController:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    SBLogIcon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SBHomeScreenController setModel:].cold.1(WeakRetained, v11);

    objc_storeStrong((id *)&self->_iconModel, a3);
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    delayedStyleWallpaperEffectViews = self->_delayedStyleWallpaperEffectViews;
    self->_delayedStyleWallpaperEffectViews = v12;

    objc_msgSend(v6, "setIconModel:", v5);
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__iconModelDidLayout_, v8, self->_iconModel);
    -[SBHIconModel rootFolder](self->_iconModel, "rootFolder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      -[SBHomeScreenController _rootFolderDidChange](self, "_rootFolderDidChange");
    if (!-[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported"))
      goto LABEL_11;
    -[SBHomeScreenController iconManager](self, "iconManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15 || -[SBHomeScreenController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
      goto LABEL_11;
    -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v16 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenController _setUpLibraryViewControllerForWindowScene:](self, "_setUpLibraryViewControllerForWindowScene:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenController setOverlayLibraryViewController:](self, "setOverlayLibraryViewController:", v17);
    -[SBHomeScreenController iconManager](self, "iconManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setOverlayLibraryViewController:", v17);

    while (1)
    {

LABEL_11:
      if (!-[NSMutableSet count](self->_delayedStyleWallpaperEffectViews, "count"))
        break;
      v19 = self->_delayedStyleWallpaperEffectViews;
      v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v21 = self->_delayedStyleWallpaperEffectViews;
      self->_delayedStyleWallpaperEffectViews = v20;

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v16 = v19;
      v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v28;
        do
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v28 != v24)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v25++), "setStyle:", 29);
          }
          while (v23 != v25);
          v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v23);
      }

    }
    v26 = self->_delayedStyleWallpaperEffectViews;
    self->_delayedStyleWallpaperEffectViews = 0;

  }
}

- (void)_showsBadgesInAppLibraryDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showsBadgesInAppLibrary");

  -[SBHomeScreenController _libraryViewControllers](self, "_libraryViewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setAllowsBadging:", v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_iconModelDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController setModel:](self, "setModel:", v4);

}

- (void)addSmartStacksForWidgetDiscoverabilityAndPrepareWidgetIntroduction
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  -[SBHomeScreenController iconManager](self, "iconManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v8, "deviceTypeSupportModalWidgetIntroduction");
  if (v5)
  {
    -[SBHomeScreenController alertItemsController](self, "alertItemsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setForceAlertsToPend:forReason:", 1, CFSTR("SBHomeScreenWidgetDiscoverabilityIntroduction"));

  }
  if (objc_msgSend(v8, "addDefaultWidgetsToHomeScreen"))
  {
    objc_msgSend(v8, "scrollToDefaultWidgets");
    objc_msgSend(v4, "setShouldAddDefaultWidgetsToHomeScreen:", 0);
    -[SBHomeScreenController iconManager](self, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disableUserInteractionForWidgetDiscoverability");
LABEL_9:

    goto LABEL_10;
  }
  if (objc_msgSend(v8, "rootFolderContainsWidgets"))
    objc_msgSend(v4, "setShouldAddDefaultWidgetsToHomeScreen:", 0);
  if (v5)
  {
    -[SBHomeScreenController alertItemsController](self, "alertItemsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setForceAlertsToPend:forReason:", 0, CFSTR("SBHomeScreenWidgetDiscoverabilityIntroduction"));
    goto LABEL_9;
  }
LABEL_10:

}

- (void)obtainProactiveSecondPageWidgetSuggestion
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[SBHomeScreenController iconManager](self, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetExtensionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA580]), "initWithKind:extensionBundleIdentifier:", CFSTR("com.apple.tv"), CFSTR("com.apple.tv.TVWidgetExtension"));
  objc_msgSend(v3, "sbh_descriptorForWidgetIdentifiable:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDefaultSecondPageWidgetDescriptors:", v8);

    objc_msgSend(v2, "setDefaultSecondPageWidgetSizeClass:", *MEMORY[0x1E0DAA758]);
  }

}

- (void)updateDefaultFirstPageWidgetDescriptors:(id)a3 withSizeClass:(id)a4 andGridCellInfoOptions:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[SBHomeScreenController iconManager](self, "iconManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultFirstPageWidgetDescriptors:", v9);

  objc_msgSend(v10, "setDefaultFirstPageWidgetSizeClass:", v8);
  objc_msgSend(v10, "setGridCellInfoOptionsForInsertingDefaultWidgets:", a5);

}

- (void)displayFeatureIntroductionItem:(id)a3 atLocation:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a3;
  if (objc_msgSend(v6, "shouldDisplayFeatureIntroductionAtLocations:", a4))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    objc_msgSend(v6, "featureIntroductionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "shouldDeferAlertsAtLocations:", a4))
    {
      *((_BYTE *)v14 + 24) = 1;
      -[SBHomeScreenController alertItemsController](self, "alertItemsController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setForceAlertsToPend:forReason:", 1, v7);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || !objc_msgSend(v6, "shouldPauseUserInteractionAtLocations:", a4))
      {
        goto LABEL_9;
      }
      -[SBHomeScreenController iconManager](self, "iconManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "disableUserInteractionForWidgetDiscoverability");
    }

LABEL_9:
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__SBHomeScreenController_displayFeatureIntroductionItem_atLocation___block_invoke;
    v10[3] = &unk_1E8E9FD30;
    v12 = &v13;
    v10[4] = self;
    v9 = v7;
    v11 = v9;
    objc_msgSend(v6, "displayFeatureIntroductionAtLocations:presentCompletion:dismissCompletion:", a4, 0, v10);

    _Block_object_dispose(&v13, 8);
  }

}

void __68__SBHomeScreenController_displayFeatureIntroductionItem_atLocation___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "alertItemsController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setForceAlertsToPend:forReason:", 0, *(_QWORD *)(a1 + 40));

  }
}

- (void)displayFeatureIntroductionsAtLocation:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SBHomeScreenController iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureIntroductionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureIntroductionItemAtLocation:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v7, "allObjects", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[SBHomeScreenController displayFeatureIntroductionItem:atLocation:](self, "displayFeatureIntroductionItem:atLocation:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), a3);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_unlockAnimationDidFinish:(id)a3
{
  void *v4;
  id v5;

  -[SBHomeScreenController iconManager](self, "iconManager", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusModeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateFocusModePopoverVisibility");
  -[SBHomeScreenController displayFeatureIntroductionsAtLocation:](self, "displayFeatureIntroductionsAtLocation:", 4);

}

- (void)_rootFolderDidChange
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  id v10;
  void *v11;
  char v12;
  id v13;
  id v14;

  -[SBHomeScreenController iconManager](self, "iconManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "userSessionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sessionType");

  if (v6 == 2)
    objc_msgSend(v14, "removeWidgetIconsFromHomeScreen");
  objc_msgSend(v4, "todayList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController todayViewController](self, "todayViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SBHomeScreenController todayViewController](self, "todayViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRootFolder:", v4);
  }
  else
  {
    if (!v14)
      goto LABEL_9;
    v10 = -[SBHomeScreenController _newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:](self, "_newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:", v14, v7, v4, 1);
    -[SBHomeScreenController setTodayViewController:](self, "setTodayViewController:", v10);
    if (!-[SBHomeScreenController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
      -[SBHIconManager setOverlayTodayViewController:](self->_iconManager, "setOverlayTodayViewController:", v10);
  }

LABEL_9:
  -[SBHomeScreenController _setupOverlayLibraryViewController](self, "_setupOverlayLibraryViewController");
  -[SBHomeScreenController coverSheetTodayViewController](self, "coverSheetTodayViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) != 0)
  {
    -[SBHomeScreenController coverSheetTodayViewController](self, "coverSheetTodayViewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRootFolder:", v4);
LABEL_13:

    goto LABEL_14;
  }
  if (v14)
  {
    v13 = -[SBHomeScreenController _newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:](self, "_newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:", v14, v7, v4, 2);
    -[SBHomeScreenController setCoverSheetTodayViewController:](self, "setCoverSheetTodayViewController:", v13);
    goto LABEL_13;
  }
LABEL_14:
  -[SBHomeScreenController updateRootFolderWithCurrentDoNotDisturbState](self, "updateRootFolderWithCurrentDoNotDisturbState");
  objc_msgSend(v4, "addFolderObserver:", self);

}

- (void)_makeTodayViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  -[SBHomeScreenController iconManager](self, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "todayList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController todayViewController](self, "todayViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = -[SBHomeScreenController _newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:](self, "_newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:", v3, v6, v5, 1);
    -[SBHomeScreenController setTodayViewController:](self, "setTodayViewController:", v8);
    if (!-[SBHomeScreenController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
      -[SBHIconManager setOverlayTodayViewController:](self->_iconManager, "setOverlayTodayViewController:", v8);

  }
  -[SBHomeScreenController coverSheetTodayViewController](self, "coverSheetTodayViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = -[SBHomeScreenController _newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:](self, "_newTodayViewControllerWithIconManager:iconListModel:rootFolder:location:", v3, v6, v5, 2);
    -[SBHomeScreenController setCoverSheetTodayViewController:](self, "setCoverSheetTodayViewController:", v10);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__SBHomeScreenController__makeTodayViewControllers__block_invoke;
  v11[3] = &unk_1E8EA6580;
  v11[4] = self;
  -[SBHomeScreenController _enumerateTodayViewControllers:](self, "_enumerateTodayViewControllers:", v11);

}

uint64_t __51__SBHomeScreenController__makeTodayViewControllers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateHomeScreenTraitOverridesForViewController:", a2);
}

- (void)_rebuildTodayViewControllers
{
  -[SBHomeScreenController setTodayViewController:](self, "setTodayViewController:", 0);
  -[SBHomeScreenController setCoverSheetTodayViewController:](self, "setCoverSheetTodayViewController:", 0);
  -[SBHomeScreenController _makeTodayViewControllers](self, "_makeTodayViewControllers");
}

- (void)_enumerateTodayViewControllers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    -[SBHomeScreenController todayViewController](self, "todayViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v5 = (void *)objc_opt_new();
      -[SBHomeScreenController todayViewController](self, "todayViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bs_safeAddObject:", v6);

    }
    -[SBHomeScreenController coverSheetTodayViewController](self, "coverSheetTodayViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (!v5)
        v5 = (void *)objc_opt_new();
      -[SBHomeScreenController coverSheetTodayViewController](self, "coverSheetTodayViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bs_safeAddObject:", v8);

    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__SBHomeScreenController__enumerateTodayViewControllers___block_invoke;
    v10[3] = &unk_1E8EA65A8;
    v11 = v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

    v4 = v9;
  }

}

uint64_t __57__SBHomeScreenController__enumerateTodayViewControllers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)iconsSnapToGrid
{
  BOOL v2;
  void *v3;

  if (__sb__runningInSpringBoard())
    return SBFEffectiveDeviceClass() == 2;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  return v2;
}

- (BOOL)isAppLibrarySupported
{
  return 1;
}

- (BOOL)isModalAppLibrarySupported
{
  _BOOL4 v2;

  v2 = -[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported");
  if (v2)
    LOBYTE(v2) = +[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported");
  return v2;
}

- (BOOL)isAppLibraryAllowed
{
  BOOL v3;
  void *v4;

  if (!-[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported"))
    return 0;
  if (objc_msgSend((id)SBApp, "homeScreenRotationStyle") == 1)
    return 1;
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)(objc_msgSend(v4, "orientation") - 5) < 0xFFFFFFFFFFFFFFFELL;

  return v3;
}

- (id)createModalLibraryControllerForWindowScene:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  SBModalLibraryController *v10;
  void *v11;
  SBModalLibraryController *v12;
  void *v14;

  v5 = a3;
  if (-[SBHomeScreenController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
  {
    if (SBFIsOnenessHomeScreenOnEmbeddedAvailable())
    {
      -[SBHomeScreenController _iconController](self, "_iconController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v6, "createModalLibraryControllerForWindowScene:", v5);

    }
    objc_msgSend(v5, "floatingDockController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenController.m"), 2247, CFSTR("floating dock controller must exist in order to create a modal library controller"));

    }
    -[SBHomeScreenController iconManager](self, "iconManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SBHomeScreenController _setUpLibraryViewControllerForWindowScene:](self, "_setUpLibraryViewControllerForWindowScene:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = [SBModalLibraryController alloc];
    -[SBHomeScreenController iconManager](self, "iconManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBModalLibraryController initWithIconManager:libraryViewController:floatingDockController:windowScene:](v10, "initWithIconManager:libraryViewController:floatingDockController:windowScene:", v11, v9, v8, v5);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_setUpLibraryViewControllerForWindowScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBLibraryViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  v5 = a3;
  -[SBHomeScreenController iconManager](self, "iconManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenController.m"), 2263, CFSTR("icon manager must exist in order to create a library view controller"));

  }
  objc_msgSend(v6, "iconModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenController.m"), 2264, CFSTR("icon model must exist in order to create a library view controller"));

  }
  -[SBHomeScreenController _iconController](self, "_iconController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryCategoryMapProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homeScreenDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SBLibraryViewController initWithCategoryMapProvider:windowScene:]([SBLibraryViewController alloc], "initWithCategoryMapProvider:windowScene:", v10, v5);
  if (!-[SBHomeScreenController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
    -[SBHLibraryViewController setIconLocation:](v13, "setIconLocation:", *MEMORY[0x1E0DAA980]);
  -[SBHLibraryViewController setIconModel:](v13, "setIconModel:", v7);
  -[SBHLibraryViewController addObserver:](v13, "addObserver:", self);
  -[SBHLibraryViewController setBehaviorDelegate:](v13, "setBehaviorDelegate:", self);
  -[SBLibraryViewController setEditing:](v13, "setEditing:", objc_msgSend(v6, "isEditing"));
  -[SBHLibraryViewController setAllowsBadging:](v13, "setAllowsBadging:", objc_msgSend(v12, "showsBadgesInAppLibrary"));
  -[SBHLibraryViewController setContentVisibility:](v13, "setContentVisibility:", 2);
  -[SBHLibraryViewController setIconViewProvider:](v13, "setIconViewProvider:", v6);
  -[SBHLibraryViewController setIconViewDelegate:](v13, "setIconViewDelegate:", v6);
  -[SBHLibraryViewController setHomeScreenIconTransitionAnimatorDelegate:](v13, "setHomeScreenIconTransitionAnimatorDelegate:", v6);
  -[SBHomeScreenController _appLibraryListLayoutProviderForWindowScene:](self, "_appLibraryListLayoutProviderForWindowScene:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController setListLayoutProvider:](v13, "setListLayoutProvider:", v14);
  objc_msgSend(v6, "iconImageCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController setIconImageCache:](v13, "setIconImageCache:", v15);

  objc_msgSend(v6, "legibilitySettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController setLegibilitySettings:](v13, "setLegibilitySettings:", v16);

  -[SBHLibraryViewController addObserver:](v13, "addObserver:", v6);
  return v13;
}

- (id)libraryViewControllerForWindowScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[SBHomeScreenController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
  {
    objc_msgSend(v4, "modalLibraryController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "libraryViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SBHomeScreenController overlayLibraryViewController](self, "overlayLibraryViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_appLibraryListLayoutProviderForWindowScene:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[9];
  _QWORD v31[11];

  v31[9] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    SBLogIconController();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[SBHomeScreenController _appLibraryListLayoutProviderForWindowScene:].cold.1(v5);

  }
  -[SBHomeScreenController iconManager](self, "iconManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isContinuityDisplayWindowScene") & 1) != 0
    || objc_msgSend(v4, "isMainDisplayWindowScene"))
  {
    objc_msgSend(v6, "listLayoutProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "listLayoutProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DAA968];
    objc_msgSend(v8, "layoutForIconLocation:", *MEMORY[0x1E0DAA968]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    v12 = v10;
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

    objc_msgSend(v14, "layoutConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v12;
    v16 = (void *)objc_msgSend(v15, "copy");

    objc_msgSend(v16, "landscapeLayoutInsets");
    objc_msgSend(v16, "portraitLayoutInsets");
    objc_msgSend(v16, "setPortraitLayoutInsets:");
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA5E0]), "initWithLayoutConfiguration:", v16);
    v30[0] = *MEMORY[0x1E0DAA9E8];
    objc_msgSend(v8, "layoutForIconLocation:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v28;
    v30[1] = *MEMORY[0x1E0DAA950];
    objc_msgSend(v8, "layoutForIconLocation:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v27;
    v30[2] = *MEMORY[0x1E0DAA980];
    objc_msgSend(v8, "layoutForIconLocation:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v26;
    v30[3] = *MEMORY[0x1E0DAA958];
    objc_msgSend(v8, "layoutForIconLocation:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v17;
    v30[4] = *MEMORY[0x1E0DAA978];
    objc_msgSend(v8, "layoutForIconLocation:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[4] = v18;
    v30[5] = *MEMORY[0x1E0DAA970];
    objc_msgSend(v8, "layoutForIconLocation:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[5] = v19;
    v30[6] = *MEMORY[0x1E0DAA960];
    objc_msgSend(v8, "layoutForIconLocation:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[6] = v20;
    v31[7] = v25;
    v21 = *MEMORY[0x1E0DAA988];
    v30[7] = v9;
    v30[8] = v21;
    objc_msgSend(v8, "layoutForIconLocation:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[8] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA430]), "initWithListLayouts:", v23);
  }

  return v7;
}

- (id)animator:(id)a3 animationSettingsForOperation:(unint64_t)a4 childViewController:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  uint64_t v13;

  objc_msgSend(a3, "iconAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (a4)
          objc_msgSend(v8, "folderCloseSettings");
        else
          objc_msgSend(v8, "folderOpenSettings");
LABEL_9:
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!a4)
        {
          objc_msgSend(v8, "crossfadeLaunchSettings");
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_4;
        }
        objc_msgSend((id)SBApp, "homeHardwareButton");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "supportsAcceleratedAppDismiss") & 1) != 0)
          objc_msgSend(v8, "crossfadeAcceleratedSuspendSettings");
        else
          objc_msgSend(v8, "crossfadeSuspendSettings");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v10 = 0;
            goto LABEL_5;
          }
          if (a4)
            objc_msgSend(v8, "libraryPodCloseSettings");
          else
            objc_msgSend(v8, "libraryPodOpenSettings");
          goto LABEL_9;
        }
        if (!a4)
        {
          objc_msgSend(v8, "centerLaunchSettings");
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_4;
        }
        objc_msgSend((id)SBApp, "homeHardwareButton");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "supportsAcceleratedAppDismiss") & 1) != 0)
          objc_msgSend(v8, "centerAcceleratedSuspendSettings");
        else
          objc_msgSend(v8, "centerSuspendSettings");
      }
      v13 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v13;

      goto LABEL_5;
    }
  }
  objc_msgSend(v8, "reducedMotionSettings");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_4:
  v10 = (void *)v9;
LABEL_5:

  return v10;
}

- (void)iconManager:(id)a3 folderControllerWillBeginScrolling:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  SBLogTelemetrySignposts();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_SCROLL_TO_ICON_FROM_ICON", " enableTelemetry=YES  isAnimation=YES ", v5, 2u);
  }

  kdebug_trace();
}

- (void)iconManager:(id)a3 folderControllerDidEndScrolling:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a3;
  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasOpenFolder");

  if ((v7 & 1) == 0 && (objc_msgSend(v6, "isDockExternal") & 1) == 0)
  {
    -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pictureInPictureManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dockHeight");
    objc_msgSend(v9, "applyPictureInPictureInsets:forSource:", 1, 0.0, 0.0, v10, 0.0);

  }
  SBLogTelemetrySignposts();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_SCROLL_TO_ICON_FROM_ICON", " enableTelemetry=YES  isAnimation=YES ", v12, 2u);
  }

  kdebug_trace();
}

- (void)folderController:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = *MEMORY[0x1E0DABD88];
  v14[0] = &unk_1E91D2060;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a5;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DA9D78];
  v10 = v8;
  objc_msgSend(v9, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emitEvent:withPayload:", 31, v10);

  -[SBHomeScreenController iconDragManager](self, "iconDragManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "performSpringLoadedInteractionForIconDragOnIconView:", v7);

}

- (UIEdgeInsets)contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a3
{
  void *v3;
  double v4;
  double v5;
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
  UIEdgeInsets result;

  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_contentOverlayInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)iconManager:(id)a3 willOpenFolderController:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  if (objc_msgSend(v6, "suspendsWallpaperAnimationWhileOpen"))
  {
    if (self->_invalidated)
    {
      SBLogIconController();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[SBHomeScreenController iconManager:willOpenFolderController:].cold.1((uint64_t)self, (uint64_t)a2, v7);

    }
    else
    {
      objc_msgSend(v6, "extraAssertions");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v6, "setExtraAssertions:", v8);
      }
      objc_msgSend(v8, "valueForKey:", CFSTR("SuspendWallpaperAnimationAssertion"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        objc_msgSend(v9, "invalidate");
      +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("SBIconControllerOpenFolderWallpaperAnimationSuspensionReason"), "stringByAppendingFormat:", CFSTR("-%p"), v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "suspendWallpaperAnimationForReason:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setValue:forKey:", v13, CFSTR("SuspendWallpaperAnimationAssertion"));
    }
  }

}

- (void)iconManager:(id)a3 willCloseFolderController:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (objc_msgSend(v8, "suspendsWallpaperAnimationWhileOpen"))
  {
    objc_msgSend(v8, "extraAssertions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("SuspendWallpaperAnimationAssertion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "invalidate");
      objc_msgSend(v4, "removeObjectForKey:", CFSTR("SuspendWallpaperAnimationAssertion"));
    }

  }
  objc_msgSend(MEMORY[0x1E0DAA4C8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "noteFolderControllerWillClose:", v8);

}

- (void)setLegibilitySettings:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBHomeScreenController iconManager](self, "iconManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLegibilitySettings:", self->_legibilitySettings);

    -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatingDockController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLegibilitySettings:", self->_legibilitySettings);
    -[SBHomeScreenController spotlightViewController](self, "spotlightViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLegibilitySettings:", self->_legibilitySettings);

    -[SBHomeScreenController searchPresentableViewController](self, "searchPresentableViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchAffordanceView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLegibilitySettings:", self->_legibilitySettings);

    -[SBHomeScreenController scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLegibilitySettings:", self->_legibilitySettings);

  }
}

- (double)distanceToTopOfSpotlightIconsForIconManager:(id)a3
{
  void *v4;
  char v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController](SBSpotlightMultiplexingViewController, "sharedRemoteSearchViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "source") == 6)
  {
    v5 = objc_msgSend(MEMORY[0x1E0DA9D10], "enableFloatingWindow");

    v6 = 0.0;
    if ((v5 & 1) != 0)
      return v6;
  }
  else
  {

  }
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaInsets");
  v10 = v9;

  +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController](SBSpotlightMultiplexingViewController, "sharedRemoteSearchViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "distanceToTopOfIcons");
  v13 = v12;

  v6 = v10 + v13;
  return v6;
}

- (id)iconManager:(id)a3 backgroundViewForDockForRootFolderController:(id)a4
{
  void *v4;

  if (__sb__runningInSpringBoard())
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      objc_msgSend((id)SBApp, "homeScreenSupportsRotation");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "userInterfaceIdiom"))
      objc_msgSend((id)SBApp, "homeScreenSupportsRotation");

  }
  return 0;
}

- (BOOL)iconManagerCanUseSeparateWindowForRotation:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;
  char v11;

  -[SBHomeScreenController _currentMainDisplayLayoutState](self, "_currentMainDisplayLayoutState", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unlockedEnvironmentMode");

  if (v5 == 3)
    return 0;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transientOverlayPresentationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasActivePresentation");

  if ((v8 & 1) != 0)
    return 0;
  -[SBHomeScreenController coverSheetPresentationManager](self, "coverSheetPresentationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isVisible");

  return v11 ^ 1;
}

- (void)iconManager:(id)a3 statusBarInsetsDidChange:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  void *v9;
  id v10;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "statusBarManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStatusBarEdgeInsets:forLayoutLayer:", 0, top, left, bottom, right);

}

- (BOOL)iconManager:(id)a3 folderController:(id)a4 canChangeCurrentPageIndexToIndex:(int64_t)a5
{
  if (iconManager_folderController_canChangeCurrentPageIndexToIndex__onceToken_0 != -1)
    dispatch_once(&iconManager_folderController_canChangeCurrentPageIndexToIndex__onceToken_0, &__block_literal_global_194);
  return iconManager_folderController_canChangeCurrentPageIndexToIndex__suppressSetCurrentPage_0 == 0;
}

void __88__SBHomeScreenController_iconManager_folderController_canChangeCurrentPageIndexToIndex___block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "iconDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  iconManager_folderController_canChangeCurrentPageIndexToIndex__suppressSetCurrentPage_0 = objc_msgSend(v1, "suppressSetCurrentPage");

  if (iconManager_folderController_canChangeCurrentPageIndexToIndex__suppressSetCurrentPage_0)
  {
    SBLogIcon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __88__SBHomeScreenController_iconManager_folderController_canChangeCurrentPageIndexToIndex___block_invoke_cold_1(v2);

  }
}

- (BOOL)isIconContentPossiblyVisibleOverApplicationForIconManager:(id)a3
{
  void *v3;
  BOOL v4;

  -[SBHomeScreenController _currentMainDisplayLayoutState](self, "_currentMainDisplayLayoutState", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unlockedEnvironmentMode") == 3;

  return v4;
}

- (id)_createHomeScreenOverlayControllerIfNeeded
{
  SBHomeScreenOverlayController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  SBLeftOfHomeAppViewController *v15;
  SBLeftOfHomeAppViewController *leftOfHomeAppViewController;
  void *v17;
  void *v18;
  void *v19;
  void *v21;

  -[SBHomeScreenController homeScreenOverlayController](self, "homeScreenOverlayController");
  v3 = (SBHomeScreenOverlayController *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SBHomeScreenController iconManager](self, "iconManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "listLayoutProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[SBHomeScreenOverlayController initWithListLayoutProvider:]([SBHomeScreenOverlayController alloc], "initWithListLayoutProvider:", v4);
    -[SBHomeScreenOverlayController setDelegate:](v3, "setDelegate:", self);
    -[SBHomeScreenOverlayController addHomeScreenOverlayObserver:](v3, "addHomeScreenOverlayObserver:", self);
    -[SBHomeScreenController overlayLibraryViewController](self, "overlayLibraryViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenOverlayController addHomeScreenOverlayObserver:](v3, "addHomeScreenOverlayObserver:", v5);

    -[SBHomeScreenController todayViewController](self, "todayViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenOverlayController addHomeScreenOverlayObserver:](v3, "addHomeScreenOverlayObserver:", v6);

    -[SBHomeScreenOverlayController setContentVisibility:](v3, "setContentVisibility:", 2);
    -[SBHomeScreenOverlayController viewController](v3, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bs_addChildViewController:withSuperview:", v7, v9);
    objc_msgSend(v7, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (id)SBHPinViewWithinView();
    -[SBHomeScreenOverlayController dismissTapGestureRecognizer](v3, "dismissTapGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requireGestureRecognizerToFail:", self->_longPressToEditGestureRecognizer);

    -[SBHomeScreenOverlayController dismissTapGestureRecognizer](v3, "dismissTapGestureRecognizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requireGestureRecognizerToFail:", self->_tapToEndEditingGestureRecognizer);

    -[SBHomeScreenController todayViewController](self, "todayViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SBLeftOfHomeAppViewController isEnabled](SBLeftOfHomeAppViewController, "isEnabled"))
    {
      v15 = objc_alloc_init(SBLeftOfHomeAppViewController);
      -[SBHomeScreenOverlayController setLeadingSidebarViewController:](v3, "setLeadingSidebarViewController:", v15);
      leftOfHomeAppViewController = self->_leftOfHomeAppViewController;
      self->_leftOfHomeAppViewController = v15;

    }
    else
    {
      -[SBHomeScreenOverlayController setLeadingSidebarViewController:](v3, "setLeadingSidebarViewController:", v14);
    }
    -[SBHomeScreenOverlayController viewController](v3, "viewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContainerViewController:", v17);

    objc_msgSend(v14, "setDismissalDelegate:", v3);
    if (-[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported")
      && !-[SBHomeScreenController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
    {
      -[SBHomeScreenController overlayLibraryViewController](self, "overlayLibraryViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeScreenOverlayController setTrailingSidebarViewController:](v3, "setTrailingSidebarViewController:", v18);
      -[SBHomeScreenOverlayController viewController](v3, "viewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPresenter:", v19);

    }
    -[SBHomeScreenController setHomeScreenOverlayController:](self, "setHomeScreenOverlayController:", v3);

  }
  return v3;
}

- (id)_homeScreenOverlayControllerIfNeeded
{
  void *v3;

  if (-[SBHomeScreenController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
  {
    v3 = 0;
  }
  else
  {
    -[SBHomeScreenController _createHomeScreenOverlayControllerIfNeeded](self, "_createHomeScreenOverlayControllerIfNeeded");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 didOverscrollOnFirstPageByAmount:(double)a5
{
  void *v7;
  char v8;
  NSNumber *homeScreenOverlayInitialPresentationProgress;
  void *v10;
  double v11;
  NSNumber *v12;
  NSNumber *v13;
  SBHomeScreenOverlayController *homeScreenOverlayController;
  double v15;
  NSNumber *v16;
  id v17;

  -[SBHomeScreenController _homeScreenOverlayControllerIfNeeded](self, "_homeScreenOverlayControllerIfNeeded", a3, a4);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SBHomeScreenController allowsHomeScreenOverlay](self, "allowsHomeScreenOverlay")
    && (-[SBHomeScreenController policyAggregator](self, "policyAggregator"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "allowsCapability:", 23),
        v7,
        (v8 & 1) != 0))
  {
    homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
    if (!homeScreenOverlayInitialPresentationProgress)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      -[SBHomeScreenOverlayController layerPresentationProgress](self->_homeScreenOverlayController, "layerPresentationProgress");
      *(float *)&v11 = v11;
      objc_msgSend(v10, "numberWithFloat:", v11);
      v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v13 = self->_homeScreenOverlayInitialPresentationProgress;
      self->_homeScreenOverlayInitialPresentationProgress = v12;

      homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
    }
    homeScreenOverlayController = self->_homeScreenOverlayController;
    -[NSNumber doubleValue](homeScreenOverlayInitialPresentationProgress, "doubleValue");
    -[SBHomeScreenOverlayController presentationProgressForTranslation:initialPresentationProgress:fromLeading:](homeScreenOverlayController, "presentationProgressForTranslation:initialPresentationProgress:fromLeading:", 1, a5, v15);
    objc_msgSend(v17, "setPresentationProgress:fromLeading:interactive:animated:completionHandler:", 1, 1, 1, 0);
  }
  else
  {
    v16 = self->_homeScreenOverlayInitialPresentationProgress;
    self->_homeScreenOverlayInitialPresentationProgress = 0;

    objc_msgSend(v17, "setPresentationProgress:fromLeading:", 1, 0.0);
  }

}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 didEndOverscrollOnFirstPageWithVelocity:(double)a5 translation:(double)a6
{
  NSNumber *homeScreenOverlayInitialPresentationProgress;
  void *v10;
  char v11;
  double v12;
  id v13;

  -[SBHomeScreenController _homeScreenOverlayControllerIfNeeded](self, "_homeScreenOverlayControllerIfNeeded", a3, a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
  self->_homeScreenOverlayInitialPresentationProgress = 0;

  if (-[SBHomeScreenController allowsHomeScreenOverlay](self, "allowsHomeScreenOverlay")
    && (-[SBHomeScreenController policyAggregator](self, "policyAggregator"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "allowsCapability:", 23),
        v10,
        (v11 & 1) != 0))
  {
    -[NSNumber doubleValue](self->_homeScreenOverlayInitialPresentationProgress, "doubleValue");
    objc_msgSend(v13, "finalPresentationProgressForTranslation:velocity:initialPresentationProgress:fromLeading:", 1, a6, a5, v12);
    objc_msgSend(v13, "animatePresentationProgress:withGestureLiftOffVelocity:completionHandler:", 0);
  }
  else
  {
    objc_msgSend(v13, "setPresentationProgress:fromLeading:", 1, 0.0);
  }

}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 didOverscrollOnLastPageByAmount:(double)a5
{
  NSNumber *homeScreenOverlayInitialPresentationProgress;
  void *v8;
  double v9;
  NSNumber *v10;
  NSNumber *v11;
  SBHomeScreenOverlayController *homeScreenOverlayController;
  double v13;
  NSNumber *v14;
  id v15;

  -[SBHomeScreenController _homeScreenOverlayControllerIfNeeded](self, "_homeScreenOverlayControllerIfNeeded", a3, a4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SBHomeScreenController allowsHomeScreenOverlay](self, "allowsHomeScreenOverlay")
    && -[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported"))
  {
    homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
    if (!homeScreenOverlayInitialPresentationProgress)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      -[SBHomeScreenOverlayController layerPresentationProgress](self->_homeScreenOverlayController, "layerPresentationProgress");
      *(float *)&v9 = v9;
      objc_msgSend(v8, "numberWithFloat:", v9);
      v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v11 = self->_homeScreenOverlayInitialPresentationProgress;
      self->_homeScreenOverlayInitialPresentationProgress = v10;

      homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
    }
    homeScreenOverlayController = self->_homeScreenOverlayController;
    -[NSNumber doubleValue](homeScreenOverlayInitialPresentationProgress, "doubleValue");
    -[SBHomeScreenOverlayController presentationProgressForTranslation:initialPresentationProgress:fromLeading:](homeScreenOverlayController, "presentationProgressForTranslation:initialPresentationProgress:fromLeading:", 0, a5, v13);
    objc_msgSend(v15, "setPresentationProgress:fromLeading:interactive:animated:completionHandler:", 0, 1, 1, 0);
  }
  else
  {
    v14 = self->_homeScreenOverlayInitialPresentationProgress;
    self->_homeScreenOverlayInitialPresentationProgress = 0;

    objc_msgSend(v15, "setPresentationProgress:fromLeading:", 0, 0.0);
  }

}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 didEndOverscrollOnLastPageWithVelocity:(double)a5 translation:(double)a6
{
  NSNumber *homeScreenOverlayInitialPresentationProgress;
  double v10;
  id v11;

  -[SBHomeScreenController homeScreenOverlayController](self, "homeScreenOverlayController", a3, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  homeScreenOverlayInitialPresentationProgress = self->_homeScreenOverlayInitialPresentationProgress;
  self->_homeScreenOverlayInitialPresentationProgress = 0;

  if (-[SBHomeScreenController allowsHomeScreenOverlay](self, "allowsHomeScreenOverlay")
    && -[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported"))
  {
    -[NSNumber doubleValue](self->_homeScreenOverlayInitialPresentationProgress, "doubleValue");
    objc_msgSend(v11, "finalPresentationProgressForTranslation:velocity:initialPresentationProgress:fromLeading:", 0, a6, a5, v10);
    objc_msgSend(v11, "animatePresentationProgress:withGestureLiftOffVelocity:completionHandler:", 0);
  }
  else
  {
    objc_msgSend(v11, "setPresentationProgress:fromLeading:", 0, 0.0);
  }

}

- (BOOL)iconManager:(id)a3 isIconVisibleForBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[SBHomeScreenController _iconController](self, "_iconController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isIconVisibleForBundleIdentifier:", v5);

  return v7;
}

- (id)iconManager:(id)a3 bundleIdentifierToLaunchForWidgetURL:(id)a4
{
  void *v4;
  void *v5;

  SBWorkspaceApplicationForURLWithError(a4, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)iconManager:(id)a3 wantsLaunchForWidgetURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  SBLockScreenUnlockRequest *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a4;
  -[SBHomeScreenController windowScene](self, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sbDisplayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(SBLockScreenUnlockRequest);
  -[SBLockScreenUnlockRequest setSource:](v8, "setSource:", 24);
  -[SBLockScreenUnlockRequest setIntent:](v8, "setIntent:", 3);
  -[SBLockScreenUnlockRequest setName:](v8, "setName:", CFSTR("Launch From Widget Icon Unlock"));
  -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v8, "setWantsBiometricPresentation:", 1);
  -[SBLockScreenUnlockRequest setWindowScene:](v8, "setWindowScene:", v6);
  -[SBHomeScreenController lockScreenManager](self, "lockScreenManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__SBHomeScreenController_iconManager_wantsLaunchForWidgetURL___block_invoke;
  v12[3] = &unk_1E8E9DEB0;
  v13 = v5;
  v14 = v7;
  v10 = v7;
  v11 = v5;
  objc_msgSend(v9, "unlockWithRequest:completion:", v8, v12);

}

void __62__SBHomeScreenController_iconManager_wantsLaunchForWidgetURL___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __62__SBHomeScreenController_iconManager_wantsLaunchForWidgetURL___block_invoke_2;
    v4[3] = &unk_1E8E9EE78;
    v5 = v2;
    SBWorkspaceActivateApplicationFromURLWithDisplayConfiguration(v3, v5, 0, v4);

  }
}

void __62__SBHomeScreenController_iconManager_wantsLaunchForWidgetURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 1);
  objc_msgSend(v3, "setDisplayConfiguration:", *(_QWORD *)(a1 + 32));

}

- (id)iconManager:(id)a3 viewControllerForCustomIcon:(id)a4 element:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  char v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  id v49;
  NSObject *v50;
  NSObject *v51;
  id v52;
  void *v53;
  NSMutableDictionary *v55;
  NSMutableDictionary *filesWidgetExtensionProviders;
  uint64_t v57;
  id v58;
  NSMutableDictionary *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "gridSizeClass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = SBHIconGridSizeClassToStackLayoutSize();

    v15 = objc_alloc(MEMORY[0x1E0CF9618]);
    objc_msgSend(v10, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF8EA0], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v15, "initWithIdentifier:suggestionsClient:layoutSize:", v16, v17, v14);

    goto LABEL_5;
  }
  objc_opt_self();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_isKindOfClass();

  if ((v20 & 1) != 0)
  {
    objc_msgSend(v9, "gridSizeClass");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = SBHIconGridSizeClassToStackLayoutSize();

    v23 = -[SBHomeScreenController canAppPredictionsWidgetAlignWithGrid](self, "canAppPredictionsWidgetAlignWithGrid") ^ 1;
    v24 = objc_alloc(MEMORY[0x1E0CF9610]);
    objc_msgSend(v9, "uniqueIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v24, "initWithIdentifier:layoutSize:mode:", v25, v22, v23);

    objc_msgSend(v18, "setDelegate:", self);
    objc_msgSend(v8, "listLayoutProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutForIconLocation:", *MEMORY[0x1E0DAA9E8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "iconImageInfoForGridSizeClass:", *MEMORY[0x1E0DAA768]);
    v28 = v27;
    -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "iconContentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v32 = (v31 - v28) * 0.5;

    objc_msgSend(v18, "setParentLayoutInsets:", 0.0, v32, 0.0, v32);
LABEL_5:

    if (v18)
      goto LABEL_28;
    goto LABEL_25;
  }
  objc_opt_self();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_opt_isKindOfClass();

  if ((v34 & 1) != 0)
  {
    v35 = v10;
    v36 = objc_alloc_init(MEMORY[0x1E0DDA108]);
    objc_msgSend(v9, "gridSizeClass");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFamily:", CHSWidgetFamilyForSBHIconGridSizeClass());

    -[SBHomeScreenController iconManager](self, "iconManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "intentForDataSource:ofIcon:", v35, v9);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      WFCreateShortcutsWidgetConfigurationIntent();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v39, 1, &v64);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v64;
      if (!v40)
      {
        SBLogCommon();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = v61;
          -[SBHomeScreenController iconManager:viewControllerForCustomIcon:element:].cold.2();
LABEL_17:

          goto LABEL_18;
        }
LABEL_16:
        v42 = v61;
        goto LABEL_17;
      }
LABEL_15:
      -[SBHomeScreenController iconManager](self, "iconManager", v61);
      v41 = objc_claimAutoreleasedReturnValue();
      -[SBHomeScreenController iconManager:dataSource:ofIcon:didUpdateConfigurationData:](self, "iconManager:dataSource:ofIcon:didUpdateConfigurationData:", v41, v35, v9, v40);
      goto LABEL_16;
    }
    goto LABEL_18;
  }
  objc_opt_self();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_opt_isKindOfClass();

  if ((v44 & 1) != 0)
  {
    v35 = v10;
    v36 = objc_alloc_init(MEMORY[0x1E0DDA108]);
    objc_msgSend(v9, "gridSizeClass");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFamily:", CHSWidgetFamilyForSBHIconGridSizeClass());

    -[SBHomeScreenController iconManager](self, "iconManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "intentForDataSource:ofIcon:", v35, v9);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      WFCreateShortcutsSmallWidgetConfigurationIntent();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v39, 1, &v63);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v63;
      if (!v40)
      {
        SBLogCommon();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = v61;
          -[SBHomeScreenController iconManager:viewControllerForCustomIcon:element:].cold.3();
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      goto LABEL_15;
    }
LABEL_18:
    objc_msgSend(v36, "setIntent:", v39, v61);
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DDA110]), "initWithOptions:", v36);
    goto LABEL_19;
  }
  objc_opt_self();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_opt_isKindOfClass();

  if ((v47 & 1) != 0)
  {
    v35 = v10;
    -[SBHomeScreenController iconManager](self, "iconManager");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "intentForDataSource:ofIcon:", v35, v9);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      DOCCreateDefaultHomeScreenWidgetIntent();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v38, 1, &v62);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v62;
      if (v48)
      {
        -[SBHomeScreenController iconManager](self, "iconManager");
        v50 = objc_claimAutoreleasedReturnValue();
        -[SBHomeScreenController iconManager:dataSource:ofIcon:didUpdateConfigurationData:](self, "iconManager:dataSource:ofIcon:didUpdateConfigurationData:", v50, v35, v9, v48);
      }
      else
      {
        SBLogCommon();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          -[SBHomeScreenController iconManager:viewControllerForCustomIcon:element:].cold.4();
      }

    }
    if (!self->_filesWidgetExtensionProviders)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v55 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      filesWidgetExtensionProviders = self->_filesWidgetExtensionProviders;
      self->_filesWidgetExtensionProviders = v55;

    }
    objc_msgSend(v35, "uniqueIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_filesWidgetExtensionProviders, "objectForKey:", v39);
    v57 = objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      v58 = (id)v57;
      objc_msgSend(MEMORY[0x1E0C99E08], "cancelPreviousPerformRequestsWithTarget:selector:object:", self->_filesWidgetExtensionProviders, sel_removeObjectForKey_, v39);
    }
    else
    {
      v58 = objc_alloc_init(MEMORY[0x1E0DAA450]);
      v59 = self->_filesWidgetExtensionProviders;
      objc_msgSend(v35, "uniqueIdentifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v59, "setObject:forKey:", v58, v60);

    }
    objc_msgSend(v58, "filesWidgetViewControllerWithConfiguration:", v38);
    v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
    if (v18)
      goto LABEL_28;
  }
LABEL_25:
  SBLogCommon();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    -[SBHomeScreenController iconManager:viewControllerForCustomIcon:element:].cold.1((uint64_t)v10, v51);

  v52 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(MEMORY[0x1E0CEA478], "cyanColor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setBackgroundColor:", v53);

  v18 = objc_alloc_init(MEMORY[0x1E0CEABB8]);
  objc_msgSend(v18, "setView:", v52);

LABEL_28:
  return v18;
}

- (BOOL)iconManager:(id)a3 shouldCacheRecentViewController:(id)a4 forIdentifier:(id)a5
{
  NSMutableDictionary *filesWidgetExtensionProviders;
  id v6;
  void *v7;
  char v8;

  filesWidgetExtensionProviders = self->_filesWidgetExtensionProviders;
  v6 = a5;
  -[NSMutableDictionary allKeys](filesWidgetExtensionProviders, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  return v8 ^ 1;
}

- (void)iconManager:(id)a3 willRemoveViewControllerForIdentifier:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_filesWidgetExtensionProviders, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NSMutableDictionary performSelector:withObject:afterDelay:](self->_filesWidgetExtensionProviders, "performSelector:withObject:afterDelay:", sel_removeObjectForKey_, v6, 10.0);

}

- (id)fallbackDefaultFirstPageWidgetsForIconManager:(id)a3
{
  void *v3;
  uint64_t v4;
  id *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = (id *)MEMORY[0x1E0DAA770];
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v5 = (id *)MEMORY[0x1E0DAA7A0];
  v6 = *v5;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = objc_alloc(MEMORY[0x1E0DAA678]);
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v10 = (void *)objc_msgSend(v9, "initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:", &unk_1E91CF2E0, &unk_1E91CF2F8, &unk_1E91CF2E0);
    objc_msgSend(v10, "setGridSizeClass:", v6);
    v11 = objc_alloc(MEMORY[0x1E0DAA678]);
    v19[0] = CFSTR("com.apple.weather");
    v19[1] = CFSTR("com.apple.reminders.widget");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:", &unk_1E91CF310, v13, &unk_1E91CF328);

    v15 = v14;
  }
  else
  {
    v10 = (void *)objc_msgSend(v9, "initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:", &unk_1E91CF388, &unk_1E91CF3A0, &unk_1E91CF3B8);
    objc_msgSend(v10, "setGridSizeClass:", v6);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA678]), "initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:", &unk_1E91CF340, &unk_1E91CF358, &unk_1E91CF370);
    v14 = v15;
  }
  objc_msgSend(v15, "setGridSizeClass:", v6);
  v18[0] = v10;
  v18[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)iconManager:(id)a3 willAddDefaultFirstPageWidgetsBasedOnPinnedWidgets:(id)a4 suggestionWidgets:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  SBWidgetOnboardingLayoutBuilder *v20;
  id v21;
  NSObject *v22;
  const __CFString *v23;
  int v25;
  const __CFString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogWidgetDiscoverability();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Beginning enter builder logic", (uint8_t *)&v25, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[SBHomeScreenController _iconController](self, "_iconController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userIconStateFileStatus");

    SBLogWidgetDiscoverability();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 67109120;
      LODWORD(v26) = v16 == 1;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Beginning enter builder logic isDefaultIconState(%d)", (uint8_t *)&v25, 8u);
    }

    if ((unint64_t)objc_msgSend(v10, "count") <= 1)
    {
      -[SBHomeScreenController fallbackDefaultFirstPageWidgetsForIconManager:](self, "fallbackDefaultFirstPageWidgetsForIconManager:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v19;
    }
    v20 = -[SBWidgetOnboardingLayoutBuilder initWithPinnedWidgets:suggestionWidgets:]([SBWidgetOnboardingLayoutBuilder alloc], "initWithPinnedWidgets:suggestionWidgets:", v9, v10);
    -[SBWidgetOnboardingLayoutBuilder migratedDefaultWidgets:](v20, "migratedDefaultWidgets:", v16 == 1);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    SBLogWidgetDiscoverability();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = CFSTR("upgrade");
      v25 = 138412802;
      if (v16 == 1)
        v23 = CFSTR("erase");
      v26 = v23;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "Migration pinned widgets with %@ install \n PinnedWidgets = %@ \n SuggestionWidgets = %@", (uint8_t *)&v25, 0x20u);
    }

    v11 = v20;
  }
  else
  {
    v21 = v10;
    v10 = v21;
  }

  return v21;
}

- (BOOL)iconManagerShouldShowWidgetIntroductionPopoverForDefaultWidgets:(id)a3
{
  void *v5;
  uint64_t v6;

  if ((objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode", a3) & 1) != 0)
    return 0;
  -[SBHomeScreenController _iconController](self, "_iconController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userIconStateFileStatus");

  return v6 == 2;
}

- (id)widgetIntroductionPreviewViewForIconManager:(id)a3
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBHomeScreenPreviewView *v11;
  void *v12;
  SBHomeScreenPreviewView *v13;
  void *v14;
  SBViewSnapshotProvider *v15;
  id v16;
  void *v17;
  void *v18;

  v4 = -[SBHomeScreenController interfaceOrientationForIconManager:](self, "interfaceOrientationForIconManager:", a3);
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  SBScreenBounds(v4);
  v8 = v7;
  v10 = v9;
  v11 = [SBHomeScreenPreviewView alloc];
  -[SBHomeScreenController iconManager](self, "iconManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SBHomeScreenPreviewView initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:](v11, "initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:", v12, 0, 0, 0, 0, v5, v6, v8, v10);

  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SBViewSnapshotProvider initWithWindowScene:view:orientation:]([SBViewSnapshotProvider alloc], "initWithWindowScene:view:orientation:", v14, v13, v4);
  v16 = objc_alloc(MEMORY[0x1E0DAA630]);
  -[SBViewSnapshotProvider snapshot](v15, "snapshot");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithPreview:withSnapshot:", v13, v17);

  return v18;
}

- (void)iconManagerDidAddOrRemoveWidgetIcon:(id)a3
{
  id v4;

  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")))
  {
    -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsUpdateOfSupportedInterfaceOrientations");

  }
}

- (int64_t)iconManagerListsFixedIconLocationBehavior:(id)a3
{
  return 4;
}

- (BOOL)iconManagerAppliesListsFixedIconLocationBehaviorOnlyToNewLists:(id)a3
{
  return 1;
}

- (void)iconManagerPreferredProminentPosterColor:(id)a3 handler:(id)a4
{
  if (a4)
    -[SBWallpaperIconStyleCoordinator fetchWallpaperProminentColor:](self->_iconStyleCoordinator, "fetchWallpaperProminentColor:", a4);
}

- (void)rootFolderPageStateProvider:(id)a3 willBeginTransitionToState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  __int16 v16;
  __int16 v17;

  v7 = a3;
  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")))
  {
    -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdateOfSupportedInterfaceOrientations");

  }
  v9 = SBRootFolderPageStateIsOnLeadingCustomPage();
  if ((v9 & 1) == 0)
    -[SBTodayViewController resetForSpotlightDismissalAnimated:](self->_todayViewController, "resetForSpotlightDismissalAnimated:", 1);
  -[SBHomeScreenController removeIconOcclusionReason:updateVisibleIcons:](self, "removeIconOcclusionReason:updateVisibleIcons:", 1, 1);
  v10 = objc_msgSend(v7, "pageState");

  if (SBRootFolderPageStateIsSearch())
  {
    -[SBHomeScreenController iconManager](self, "iconManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isShowingModalInteraction"))
      objc_msgSend(v11, "dismissModalInteractionsImmediately");

  }
  if (v10 == 2)
  {
    -[SBHomeScreenController todayViewController](self, "todayViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDisplayLayoutElementActive:", 1);
    objc_msgSend(v12, "setNeedsFocusUpdate");

  }
  if ((v9 & SBRootFolderPageStateIsOnIconPage()) == 1)
  {
    SBLogTelemetrySignposts();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      v17 = 0;
      v14 = "SB_HOME_SCROLL_TO_TODAYVIEW_FROM_ICON";
      v15 = (uint8_t *)&v17;
LABEL_18:
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v14, " enableTelemetry=YES  isAnimation=YES ", v15, 2u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (SBRootFolderPageStateIsOnLeadingCustomPage() && SBRootFolderPageStateIsOnIconPage())
  {
    SBLogTelemetrySignposts();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      v16 = 0;
      v14 = "SB_HOME_SCROLL_TO_ICON_FROM_TODAYVIEW";
      v15 = (uint8_t *)&v16;
      goto LABEL_18;
    }
LABEL_19:

    kdebug_trace();
  }
}

- (void)rootFolderPageStateProvider:(id)a3 didContinueTransitionToState:(int64_t)a4 progress:(double)a5
{
  void *v6;
  id v7;

  if (a4 == 1)
  {
    -[SBHomeScreenController searchPresentableViewController](self, "searchPresentableViewController", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController](SBSpotlightMultiplexingViewController, "sharedRemoteSearchViewController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRevealProgress:", a5);

    }
  }
}

- (void)rootFolderPageStateProvider:(id)a3 didEndTransitionFromState:(int64_t)a4 toState:(int64_t)a5 successfully:(BOOL)a6
{
  _BOOL4 v6;
  void *v11;
  int64_t v12;
  int IsSearch;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  uint8_t *v24;
  __int16 v25;
  __int16 v26;

  v6 = a6;
  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")))
  {
    -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsUpdateOfSupportedInterfaceOrientations");

  }
  if (v6)
    v12 = a5;
  else
    v12 = a4;
  IsSearch = SBRootFolderPageStateIsSearch();
  if (IsSearch)
  {
    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deactivateReachability");

  }
  if (a4 == 3 && a5 == 2)
  {
    -[SBTodayViewController transitionContext](self->_todayViewController, "transitionContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[SBTodayViewController resetForSpotlightDismissalAnimated:](self->_todayViewController, "resetForSpotlightDismissalAnimated:", 0);
      -[SBTodayViewController setTransitionContext:](self->_todayViewController, "setTransitionContext:", 0);
    }
  }
  if (IsSearch)
  {
    -[SBHomeScreenController addIconOcclusionReason:updateVisibleIcons:](self, "addIconOcclusionReason:updateVisibleIcons:", 1, 1);
    -[SBHomeScreenController suspendWallpaperAnimationForSpotlightAssertion](self, "suspendWallpaperAnimationForSpotlightAssertion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidate");

    if (self->_invalidated)
    {
      SBLogIconController();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SBHomeScreenController iconManager:willOpenFolderController:].cold.1((uint64_t)self, (uint64_t)a2, v17);

    }
    else
    {
      +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "suspendWallpaperAnimationForReason:", CFSTR("SBIconControllerSuspendingWallpaperForSpotlightReason"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeScreenController setSuspendWallpaperAnimationForSpotlightAssertion:](self, "setSuspendWallpaperAnimationForSpotlightAssertion:", v20);

    }
  }
  else
  {
    -[SBHomeScreenController removeIconOcclusionReason:updateVisibleIcons:](self, "removeIconOcclusionReason:updateVisibleIcons:", 1, 1);
    if (SBRootFolderPageStateIsSearch())
    {
      -[SBHomeScreenController suspendWallpaperAnimationForSpotlightAssertion](self, "suspendWallpaperAnimationForSpotlightAssertion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "invalidate");

      -[SBHomeScreenController setSuspendWallpaperAnimationForSpotlightAssertion:](self, "setSuspendWallpaperAnimationForSpotlightAssertion:", 0);
    }
  }
  if (v12 == 2)
  {
    -[SBHomeScreenController todayViewController](self, "todayViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDisplayLayoutElementActive:", 1);
    objc_msgSend(v21, "setNeedsFocusUpdate");

  }
  if (SBRootFolderPageStateIsOnIconPage() && SBRootFolderPageStateIsOnLeadingCustomPage())
  {
    SBLogTelemetrySignposts();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      v26 = 0;
      v23 = "SB_HOME_SCROLL_TO_TODAYVIEW_FROM_ICON";
      v24 = (uint8_t *)&v26;
LABEL_30:
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v23, " enableTelemetry=YES  isAnimation=YES ", v24, 2u);
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  if (SBRootFolderPageStateIsOnLeadingCustomPage() && SBRootFolderPageStateIsOnIconPage())
  {
    SBLogTelemetrySignposts();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      v25 = 0;
      v23 = "SB_HOME_SCROLL_TO_ICON_FROM_TODAYVIEW";
      v24 = (uint8_t *)&v25;
      goto LABEL_30;
    }
LABEL_31:

    kdebug_trace();
  }
}

- (id)rootFolderController:(id)a3 transitionContextForTransitioningToState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t IsSearch;
  uint64_t v14;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = objc_msgSend(v10, "pageState");
  objc_msgSend(v10, "headerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (a4 == 3 || v11 == 3)
    {
      IsSearch = SBRootFolderPageStateIsSearch();
      goto LABEL_9;
    }
    return 0;
  }
  if ((SBRootFolderPageStateIsSearch() & 1) == 0)
  {
    if (SBRootFolderPageStateIsSearch())
    {
      IsSearch = 0;
      goto LABEL_9;
    }
    return 0;
  }
  IsSearch = 1;
LABEL_9:
  if ((SBRootFolderPageStateIsOnLeadingCustomPage() & 1) != 0)
    v14 = 1;
  else
    v14 = SBRootFolderPageStateIsOnLeadingCustomPage();
  -[SBHomeScreenController transitionContextToShowSpotlight:fromTodayView:animated:interactive:](self, "transitionContextToShowSpotlight:fromTodayView:animated:interactive:", IsSearch, v14, v7, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)rootFolderController:(id)a3 transitionWillBegin:(id)a4
{
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;

  -[SBHomeScreenController displayLayoutTransition](self, "displayLayoutTransition", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "displayLayoutPublisher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionAssertionWithReason:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[SBHomeScreenController setDisplayLayoutTransition:](self, "setDisplayLayoutTransition:", v8);
    v5 = v8;
  }

}

- (void)rootFolderController:(id)a3 transitionDidFinish:(id)a4
{
  void *v5;

  -[SBHomeScreenController displayLayoutTransition](self, "displayLayoutTransition", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[SBHomeScreenController setDisplayLayoutTransition:](self, "setDisplayLayoutTransition:", 0);
}

- (id)transitionContextToShowSpotlight:(BOOL)a3 fromTodayView:(BOOL)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  SBSpotlightTransitionAnimator *v15;
  _BOOL4 v16;
  SBSpotlightTransitionInteractor *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  SBSpotlightTransitionAnimator *v28;
  _BOOL4 v29;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v11 = (id)*MEMORY[0x1E0CEBDB8];
  v12 = (id)*MEMORY[0x1E0CEBDC0];
  if (!a3)
  {
    v13 = (id)*MEMORY[0x1E0CEBDA8];

    v14 = (id)*MEMORY[0x1E0CEBDB0];
    v12 = v14;
    v11 = v13;
  }
  v29 = v7;
  v27 = v12;
  if (v7)
  {
    v15 = objc_alloc_init(SBSpotlightTransitionAnimator);
    v28 = v15;
    v16 = v8;
    if (v6)
      v17 = -[SBSpotlightTransitionInteractor initWithAnimator:]([SBSpotlightTransitionInteractor alloc], "initWithAnimator:", v15);
    else
      v17 = 0;
  }
  else
  {
    v16 = v8;
    v17 = 0;
    v28 = 0;
  }
  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController spotlightViewController](self, "spotlightViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  objc_msgSend(v21, "setFrame:");
  v22 = objc_alloc_init(MEMORY[0x1E0DAA670]);
  objc_msgSend(v18, "searchableLeadingCustomWrapperView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContainerView:", v23);

  if (v16)
  {
    -[SBHomeScreenController todayViewController](self, "todayViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(v22, "setViewController:forKey:", v24, CFSTR("SBSpotlightInitiatingViewControllerKey"));
  }
  else
  {
    objc_msgSend(v18, "headerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(v22, "setView:forKey:", v24, CFSTR("SBSpotlightSearchHeaderViewKey"));
  }

  objc_msgSend(v22, "setViewController:forKey:", v20, v11);
  objc_msgSend(v22, "setView:forKey:", v21, v27);
  objc_msgSend(v18, "searchBackdropView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setView:forKey:", v25, CFSTR("SBSpotlightSearchBackdropViewKey"));

  objc_msgSend(v22, "setAnimator:", v28);
  objc_msgSend(v22, "setInteractor:", v17);
  objc_msgSend(v22, "setWantsAnimation:", v29);

  return v22;
}

- (void)popToCurrentRootIconListWhenPossible
{
  void *v3;

  -[SBHomeScreenController iconManager](self, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popToCurrentRootIconListWhenPossible");

  -[SBHomeScreenController dismissHomeScreenOverlaysAnimated:](self, "dismissHomeScreenOverlaysAnimated:", 0);
}

- (void)overlayControllerDidBeginChangingPresentationProgress:(id)a3
{
  id v3;

  -[SBHomeScreenController iconManager](self, "iconManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isShowingModalInteraction"))
    objc_msgSend(v3, "dismissModalInteractions");
  objc_msgSend(v3, "dismissIconContextMenu");

}

- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6
{
  _BOOL4 v6;
  double v8;
  double v9;
  int v10;
  SBFloatingDockBehaviorAssertion *homeScreenOverlayFloatingDockBehaviorAssertion;
  void *v12;
  void *v13;
  SBFloatingDockBehaviorAssertion *v14;
  SBFloatingDockBehaviorAssertion *v15;
  uint64_t v16;
  SBFloatingDockBehaviorAssertion *v17;
  _BOOL4 v18;
  void *v19;
  id v20;

  v6 = a6;
  objc_msgSend(a3, "presentationProgress");
  v9 = v8;
  v10 = BSFloatGreaterThanFloat();
  homeScreenOverlayFloatingDockBehaviorAssertion = self->_homeScreenOverlayFloatingDockBehaviorAssertion;
  if (v10)
  {
    if (!homeScreenOverlayFloatingDockBehaviorAssertion)
    {
      -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatingDockController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v13, 1, 1, 4, CFSTR("homeScreenOverlay"), 0, 1.0 - v9);
      v15 = self->_homeScreenOverlayFloatingDockBehaviorAssertion;
      self->_homeScreenOverlayFloatingDockBehaviorAssertion = v14;

    }
    if ((BSFloatIsZero() & 1) != 0)
      v16 = 0;
    else
      v16 = BSFloatIsOne() ^ 1;
    -[SBFloatingDockBehaviorAssertion modifyProgress:interactive:completion:](self->_homeScreenOverlayFloatingDockBehaviorAssertion, "modifyProgress:interactive:completion:", v16, 0, 1.0 - v9);
  }
  else
  {
    -[SBFloatingDockBehaviorAssertion invalidate](homeScreenOverlayFloatingDockBehaviorAssertion, "invalidate");
    v17 = self->_homeScreenOverlayFloatingDockBehaviorAssertion;
    self->_homeScreenOverlayFloatingDockBehaviorAssertion = 0;

  }
  v18 = v9 < 1.0 && v9 > 0.0;
  -[SBHomeScreenController iconManager](self, "iconManager");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setOverlayTodayViewVisible:todayViewTransitioning:", v10 & v6, v18 & v6);
  -[SBHomeScreenOverlayController trailingSidebarViewController](self->_homeScreenOverlayController, "trailingSidebarViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v20, "setMainDisplayLibraryViewVisible:libraryViewTransitioning:", v10 & !v6, v18 && !v6);
  if ((BSFloatIsZero() & 1) != 0 || BSFloatIsZero())
    -[SBHomeScreenOverlayController updateExtraButtonVisibilityAnimated:](self->_homeScreenOverlayController, "updateExtraButtonVisibilityAnimated:", 0);

}

- (void)overlayController:(id)a3 visibilityDidChange:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  SBFloatingDockBehaviorAssertion *homeScreenOverlayFloatingDockBehaviorAssertion;
  void *v8;
  id v9;

  v4 = a4;
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController setWallpaperAnimationDisabled:forReason:](self, "setWallpaperAnimationDisabled:forReason:", v4, v6);

  if (!v4)
  {
    -[SBFloatingDockBehaviorAssertion invalidate](self->_homeScreenOverlayFloatingDockBehaviorAssertion, "invalidate");
    homeScreenOverlayFloatingDockBehaviorAssertion = self->_homeScreenOverlayFloatingDockBehaviorAssertion;
    self->_homeScreenOverlayFloatingDockBehaviorAssertion = 0;

  }
  -[SBHomeScreenOverlayController updateExtraButtonVisibilityAnimated:](self->_homeScreenOverlayController, "updateExtraButtonVisibilityAnimated:", 0);
  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSuppressesExtraEditingButtons:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", SBIconControllerOverlayVisibilityDidChangeNotification, self);

}

- (id)backgroundViewForEditingDoneButtonForHomeScreenOverlayController:(id)a3
{
  return 0;
}

- (void)homeScreenOverlayWantsToEndEditing:(id)a3
{
  id v3;

  -[SBHomeScreenController iconManager](self, "iconManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:", 0);

}

- (void)homeScreenOverlayWantsWidgetEditingViewControllerPresented:(id)a3
{
  void *v4;
  id v5;

  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenOverlayController viewController](self->_homeScreenOverlayController, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentWidgetEditingViewControllerFromViewController:", v4);

}

- (BOOL)showsAddWidgetButtonWhileEditingForHomeScreenOverlayController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "activeSidebarViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "activeSidebarViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenController iconManager](self, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "overlayTodayViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6 == v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)showsDoneButtonWhileEditingForHomeScreenOverlayController:(id)a3
{
  void *v3;
  char v4;

  -[SBHomeScreenController iconManager](self, "iconManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsDoneButtonWhileEditing");

  return v4;
}

- (BOOL)isEditingForHomeScreenOverlayController:(id)a3
{
  void *v3;
  char v4;

  -[SBHomeScreenController iconManager](self, "iconManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditing");

  return v4;
}

- (void)homeScreenOverlayController:(id)a3 setSuppressesEditingStateForListView:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  -[SBHomeScreenController todayViewController](self, "todayViewController", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSuppressesEditingStateForListViews:", v4);
  -[SBHomeScreenController overlayLibraryViewController](self, "overlayLibraryViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSuppressesEditingStateForListViews:", v4);

}

- (id)homeScreenOverlayController:(id)a3 displayLayoutIdentifierForSidebarViewController:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id *v11;
  id v12;

  v6 = a4;
  -[SBHomeScreenController overlayLibraryViewController](self, "overlayLibraryViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    v11 = (id *)MEMORY[0x1E0DAB648];
  }
  else
  {
    -[SBHomeScreenController todayViewController](self, "todayViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v6
      || v6
      && (-[SBHomeScreenController leftOfHomeAppViewController](self, "leftOfHomeAppViewController"),
          v9 = (id)objc_claimAutoreleasedReturnValue(),
          v9,
          v9 == v6))
    {
      v11 = (id *)MEMORY[0x1E0DAB6B0];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenController.m"), 3266, CFSTR("unexpected sidebar view controller: %@"), v6);

      v11 = (id *)MEMORY[0x1E0DAB668];
    }
  }
  v12 = *v11;

  return v12;
}

- (void)handleSpotlightPresentationFromViewController:(id)a3
{
  id v3;

  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isTransitioningPageState") & 1) == 0)
    objc_msgSend(v3, "presentSpotlightAnimated:completionHandler:", 1, 0);

}

- (void)handleSpotlightDismissalFromViewController:(id)a3
{
  id v3;

  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isTransitioningPageState") & 1) == 0)
    objc_msgSend(v3, "dismissSpotlightAnimated:completionHandler:", 1, 0);

}

- (unint64_t)defaultSearchViewPresentationSourceForViewController:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pageState");
  v5 = objc_msgSend(v3, "destinationPageState");
  if (objc_msgSend(v3, "presentationSource"))
  {
    v6 = objc_msgSend(v3, "presentationSource");
  }
  else if (v5 == 3 || v4 == 3)
  {
    v6 = 2;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)todayViewWantsToEndEditing:(id)a3
{
  id v3;

  -[SBHomeScreenController iconManager](self, "iconManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:", 0);

}

- (void)todayViewControllerWillPresentSpotlight:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", SBIconControllerOverlayVisibilityDidChangeNotification, self);

  -[SBHomeScreenController iconManager](self, "iconManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissModalInteractionsImmediately");

}

- (void)todayViewDidAppear:(id)a3
{
  id v3;

  -[SBHomeScreenController proactiveUsageObserver](self, "proactiveUsageObserver", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logTodayViewDidAppear");

}

- (BOOL)isTodayViewRotating:(id)a3
{
  return self->_rotating;
}

- (void)todayViewControllerDidAppear:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[SBHomeScreenController todayViewDisplayLayoutAssertion](self, "todayViewDisplayLayoutAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[SBHomeScreenController _homeScreenOverlayControllerIfNeeded](self, "_homeScreenOverlayControllerIfNeeded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingSidebarViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v17)
    {
      v4 = 0;
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x1E0DAAE30]);
      v8 = (void *)objc_msgSend(v7, "initWithIdentifier:", *MEMORY[0x1E0DAB6B0]);
      objc_msgSend(v17, "listView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "level");
      objc_msgSend(v8, "setLevel:", (uint64_t)v11);

      objc_msgSend(v8, "setLayoutRole:", 6);
      objc_msgSend(v17, "listView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      objc_msgSend(v13, "_convertRectToSceneReferenceSpace:");
      objc_msgSend(v8, "setReferenceFrame:");
      objc_msgSend(v17, "_sbWindowScene");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "displayLayoutPublisher");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addElement:", v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBHomeScreenController setTodayViewDisplayLayoutAssertion:](self, "setTodayViewDisplayLayoutAssertion:", v4);
    }
  }
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHomeAffordanceInteractionAllowed:", 0);

}

- (void)todayViewControllerDidDisappear:(id)a3
{
  void *v4;
  id v5;

  -[SBHomeScreenController todayViewDisplayLayoutAssertion](self, "todayViewDisplayLayoutAssertion", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");
  -[SBHomeScreenController setTodayViewDisplayLayoutAssertion:](self, "setTodayViewDisplayLayoutAssertion:", 0);
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHomeAffordanceInteractionAllowed:", 1);

}

- (void)activateTodayViewWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "minimumPageIndex");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__SBHomeScreenController_activateTodayViewWithCompletion___block_invoke;
  v8[3] = &unk_1E8EA02D8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "setCurrentPageIndex:animated:completion:", v6, 1, v8);

}

void __58__SBHomeScreenController_activateTodayViewWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_homeScreenOverlayControllerIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__SBHomeScreenController_activateTodayViewWithCompletion___block_invoke_2;
  v3[3] = &unk_1E8E9F1C0;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "setPresentationProgress:interactive:animated:completionHandler:", 0, 1, v3, 1.0);

}

uint64_t __58__SBHomeScreenController_activateTodayViewWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)searchPresentablesForPresenter:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[SBHomeScreenController searchPresentableViewController](self, "searchPresentableViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBHomeScreenController searchPresentableViewController](self, "searchPresentableViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    v8[1] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)displayConfigurationForPresenter:(id)a3
{
  void *v3;
  void *v4;

  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sbDisplayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)searchTopOffsetForSearchPresenter:(id)a3
{
  double v3;

  objc_msgSend(a3, "interactivePresentationMetrics");
  return -v3;
}

- (BOOL)searchPresenterCanPresent:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;

  -[SBHomeScreenController policyAggregator](self, "policyAggregator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsCapability:", 9);

  if (v5)
  {
    -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenController searchPresenterPageStateTransition](self, "searchPresenterPageStateTransition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else if ((objc_msgSend(v6, "canTransitionPageStateToState:", 1) & 1) == 0)
    {
      LOBYTE(v8) = 0;
      goto LABEL_8;
    }
    v8 = objc_msgSend(v6, "isScrolling") ^ 1;
LABEL_8:

    return v8;
  }
  LOBYTE(v8) = 0;
  return v8;
}

- (void)searchPresenterWillPresentSearch:(id)a3 animated:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollingDisabled:forReason:", 1, CFSTR("SBIconControllerDisableScrollingForSearchPresentationReason"));
  v6 = objc_opt_class();
  objc_msgSend(v5, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!UIAccessibilityIsReduceMotionEnabled())
    {
      -[SBHomeScreenController scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v8, "setPageControlAlpha:", 0.0);
    }
    -[SBHomeScreenController scrollAccessoryBorrowedForSearchPresentationAssertion](self, "scrollAccessoryBorrowedForSearchPresentationAssertion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v8, "borrowScrollAccessoryForReason:", CFSTR("SearchPresentation"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeScreenController setScrollAccessoryBorrowedForSearchPresentationAssertion:](self, "setScrollAccessoryBorrowedForSearchPresentationAssertion:", v11);

    }
  }
  -[SBHomeScreenController searchPresentableViewController](self, "searchPresentableViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHidden:", 0);
  objc_msgSend(v13, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bringSubviewToFront:", v13);

  -[SBHomeScreenController searchPresenterPageStateTransition](self, "searchPresenterPageStateTransition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isValid");
  SBLogRootController();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if ((v16 & 1) != 0)
  {
    if (v18)
    {
      _SBFLoggingMethodProem();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v19;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ keeping transition", (uint8_t *)&v24, 0xCu);

    }
  }
  else
  {
    if (v18)
    {
      _SBFLoggingMethodProem();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v20;
      v26 = 1026;
      v27 = v15 == 0;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ creating new transition; wasNil: %{public}u",
        (uint8_t *)&v24,
        0x12u);

    }
    -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "beginPageStateTransitionToState:reason:animated:interactive:", 1, CFSTR("SBHomeScreenController-SearchPresenter-Present"), 1, 1);
    v22 = objc_claimAutoreleasedReturnValue();

    -[SBHomeScreenController setSearchPresenterPageStateTransition:](self, "setSearchPresenterPageStateTransition:", v22);
    -[SBHomeScreenController setSearchPresenterDestinationPageState:](self, "setSearchPresenterDestinationPageState:", 1);
    v15 = (void *)v22;
  }
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHomeAffordanceInteractionAllowed:", 0);

}

- (void)searchPresenterDidPresentSearch:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[SBHomeScreenController searchPresenterPageStateTransition](self, "searchPresenterPageStateTransition", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endTransitionSuccessfully:", -[SBHomeScreenController searchPresenterDestinationPageState](self, "searchPresenterDestinationPageState") == 1);
  SBLogRootController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ nil-ing out transition", (uint8_t *)&v7, 0xCu);

  }
  -[SBHomeScreenController setSearchPresenterPageStateTransition:](self, "setSearchPresenterPageStateTransition:", 0);
  -[SBHomeScreenController setSearchPresenterDestinationPageState:](self, "setSearchPresenterDestinationPageState:", -1);

}

- (void)searchPresenterWillDismissSearch:(id)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollingDisabled:forReason:", 0, CFSTR("SBIconControllerDisableScrollingForSearchPresentationReason"));
  -[SBHomeScreenController searchPresenterPageStateTransition](self, "searchPresenterPageStateTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isValid");
  SBLogRootController();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if ((v7 & 1) != 0)
  {
    if (v9)
    {
      _SBFLoggingMethodProem();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ keeping transition", (uint8_t *)&v15, 0xCu);

    }
  }
  else
  {
    if (v9)
    {
      _SBFLoggingMethodProem();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 1026;
      v18 = v6 == 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ creating new transition; wasNil: %{public}u",
        (uint8_t *)&v15,
        0x12u);

    }
    -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "beginPageStateTransitionToState:reason:animated:interactive:", 0, CFSTR("SBHomeScreenController-SearchPresenter-Dismiss"), 1, 1);
    v13 = objc_claimAutoreleasedReturnValue();

    -[SBHomeScreenController setSearchPresenterPageStateTransition:](self, "setSearchPresenterPageStateTransition:", v13);
    -[SBHomeScreenController setSearchPresenterDestinationPageState:](self, "setSearchPresenterDestinationPageState:", 0);
    v6 = (void *)v13;
  }
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHomeAffordanceInteractionAllowed:", 1);

}

- (void)searchPresenterDidDismissSearch:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBHomeScreenController scrollAccessoryBorrowedForSearchPresentationAssertion](self, "scrollAccessoryBorrowedForSearchPresentationAssertion", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[SBHomeScreenController setScrollAccessoryBorrowedForSearchPresentationAssertion:](self, "setScrollAccessoryBorrowedForSearchPresentationAssertion:", 0);
  v5 = objc_opt_class();
  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!UIAccessibilityIsReduceMotionEnabled())
    {
      -[SBHomeScreenController scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v8, "setPageControlAlpha:", 1.0);
    }
  }
  -[SBHomeScreenController searchPresentableViewController](self, "searchPresentableViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  -[SBHomeScreenController searchPresenterPageStateTransition](self, "searchPresenterPageStateTransition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endTransitionSuccessfully:", -[SBHomeScreenController searchPresenterDestinationPageState](self, "searchPresenterDestinationPageState") == 0);
  SBLogRootController();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v14;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ nil-ing out transition", (uint8_t *)&v15, 0xCu);

  }
  -[SBHomeScreenController setSearchPresenterPageStateTransition:](self, "setSearchPresenterPageStateTransition:", 0);
  -[SBHomeScreenController setSearchPresenterDestinationPageState:](self, "setSearchPresenterDestinationPageState:", -1);

}

- (void)spotlightPresentableViewControllerShouldDismiss:(id)a3
{
  id v3;

  -[SBHomeScreenController searchPresenter](self, "searchPresenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissSearchAnimated:", 1);

}

- (id)searchAffordanceViewForSpotlightPresentableViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL IsReduceMotionEnabled;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[SBHomeScreenController scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController rootViewController](self, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (!v5 || !v4)
  {
LABEL_8:

    goto LABEL_9;
  }
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();

  if (!IsReduceMotionEnabled)
  {
    objc_msgSend(MEMORY[0x1E0DAA520], "searchPillViewWithSystemDefaultBackground");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "legibilitySettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLegibilitySettings:", v8);

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleSearchAffordanceTap);
    objc_msgSend(v6, "addGestureRecognizer:", v5);
    objc_msgSend(v6, "setSearchAffordanceReferenceView:", v4);
    v9 = -[SBHomeScreenController _newSearchPillBackgroundView](self, "_newSearchPillBackgroundView");
    objc_msgSend(v6, "setSearchAffordanceReferenceBackgroundView:", v9);

    v10 = objc_opt_class();
    -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "scalingView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSearchAffordanceReferenceContainerView:", v14);

    }
    goto LABEL_8;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (id)backgroundViewForSpotlightPresentableViewController:(id)a3
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA660]), "initWithFrame:style:", 3, v6, v8, v10, v12);
  objc_msgSend(v13, "prepareForTransitionToBlurred:", 1);
  return v13;
}

- (BOOL)wantsHomeAffordanceForSpotlightPresentableViewController:(id)a3
{
  return 1;
}

- (void)_handleSearchAffordanceTap
{
  id v2;

  -[SBHomeScreenController searchPresenter](self, "searchPresenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "presentationState"))
    objc_msgSend(v2, "presentSearchAnimated:", 1);

}

- (id)_newSearchPillBackgroundView
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 19);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGroupNameBase:", 0);
  objc_msgSend(v2, "setGroupName:", CFSTR("WallpaperCaptureGroup"));
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
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

  objc_msgSend(v7, "setGroupNamespace:", *MEMORY[0x1E0CD2958]);
  return v2;
}

- (void)updatePresentationProgress:(double)a3 withOffset:(double)a4 velocity:(double)a5 presentationState:(int64_t)a6
{
  double v6;
  id v8;

  v6 = a3;
  if (-[SBHomeScreenController searchPresenterDestinationPageState](self, "searchPresenterDestinationPageState", a6, a3, a4, a5) != 1)v6 = 1.0 - v6;
  -[SBHomeScreenController searchPresenterPageStateTransition](self, "searchPresenterPageStateTransition");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTransitionProgress:", v6);

}

- (id)willBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4 needsInitialLayout:(BOOL *)a5
{
  unint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;

  if (!a4)
    return 0;
  v8 = -[SBHomeScreenController searchPresenterOutstandingAnimationCount](self, "searchPresenterOutstandingAnimationCount");
  if (a3 != 1 && !v8)
    *a5 = 1;
  -[SBHomeScreenController setSearchPresenterOutstandingAnimationCount:](self, "setSearchPresenterOutstandingAnimationCount:", v8 + 1);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __101__SBHomeScreenController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke;
  v11[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v12, &location);
  v9 = (void *)MEMORY[0x1D17E5550](v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v9;
}

void __101__SBHomeScreenController_willBeginModifyingPresentationProgressForState_animated_needsInitialLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSearchPresenterOutstandingAnimationCount:", objc_msgSend(WeakRetained, "searchPresenterOutstandingAnimationCount") - 1);

}

- (id)_identifierForSearchPresenter
{
  id WeakRetained;
  int v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v3 = objc_msgSend(WeakRetained, "isContinuityDisplayWindowScene");

  if (v3)
    return CFSTR("Continuity");
  else
    return CFSTR("HomeScreen");
}

- (void)dismissSearchView
{
  id v2;

  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isTransitioningPageState") & 1) == 0)
    objc_msgSend(v2, "dismissSpotlightAnimated:completionHandler:", 1, 0);

}

- (void)dismissAppIconForceTouchControllers:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DAA4C8];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissAppIconForceTouchControllers:", v4);

}

- (BOOL)areAnyIconViewContextMenusShowing
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DAA4C8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areAnyIconViewContextMenusShowing");

  return v3;
}

- (BOOL)areAnyIconViewContextMenusAnimating
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DAA4C8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areAnyIconViewContextMenusAnimating");

  return v3;
}

- (BOOL)isAnySearchVisibleOrTransitioning
{
  void *v2;
  char v3;

  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnySearchVisibleOrTransitioning");

  return v3;
}

- (void)performAfterContextMenuAnimationsHaveCompleted:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DAA4C8];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAfterContextMenuAnimationsHaveCompleted:", v4);

}

- (void)earlyTerminateAnyContextMenuAnimations
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DAA4C8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "earlyTerminateAnyContextMenuAnimations");

}

- (BOOL)_isHostedByCoverSheet
{
  void *v2;
  char v3;

  -[SBHomeScreenController coverSheetPresentationManager](self, "coverSheetPresentationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCoverSheetHostingUnlockedEnvironmentWindows");

  return v3;
}

- (BOOL)_shouldHideAppIconForceTouchInfoForApplication:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBlockedForScreenTimeExpiration");

  return v4;
}

- (id)iconManager:(id)a3 applicationShortcutItemsForIconView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  SBForceTouchAppIconInfoProvider *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  SBForceTouchAppIconInfoProvider *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  char v42;
  char v43;
  char v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  NSObject *v49;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  uint64_t v57;
  BOOL v58;
  void *v59;
  uint64_t v60;
  char v61;
  void *v62;
  id v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  SBHomeScreenController *v71;
  _QWORD v72[4];
  SBForceTouchAppIconInfoProvider *v73;
  uint8_t buf[4];
  SBHomeScreenController *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEditingAllowedForIconView:", v7);
  if ((_DWORD)v10)
  {
    if (-[SBHomeScreenController isOnlyHideSuggestionSupportedForIcon:inLocation:](self, "isOnlyHideSuggestionSupportedForIcon:inLocation:", v8, v9))
    {
      v11 = -[SBHomeScreenController isHideSuggestionSupportedForIconView:inLocation:](self, "isHideSuggestionSupportedForIconView:inLocation:", v7, v9);
    }
    else if (-[SBHomeScreenController isHideSupportedForIcon:inLocation:](self, "isHideSupportedForIcon:inLocation:", v8, v9))
    {
      v11 = 2;
    }
    else if (-[SBHomeScreenController isUninstallSupportedForIcon:](self, "isUninstallSupportedForIcon:", v8))
    {
      v11 = 3;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  v71 = self;
  if (objc_msgSend(v8, "isApplicationIcon"))
  {
    objc_msgSend(v8, "application");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationPlaceholder");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12)
    {
      v62 = v9;
      v59 = (void *)v13;
      v60 = v11;
      v15 = -[SBHomeScreenController _shouldHideAppIconForceTouchInfoForApplication:](self, "_shouldHideAppIconForceTouchInfoForApplication:", v12);
      objc_msgSend(v12, "bundleIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_recentAppLayoutsController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)v16;
      objc_msgSend(v18, "recentDisplayItemsForBundleIdentifier:includingHiddenAppLayouts:", v16, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v19, "count");

      v54 = objc_msgSend(v6, "isIconIgnored:", v8);
      v55 = (void *)MEMORY[0x1E0DAA478];
      objc_msgSend(v8, "displayName");
      v68 = v6;
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v15;
      v63 = v7;
      v61 = v10;
      if (v15)
      {
        v56 = 0;
        v64 = 0;
      }
      else
      {
        objc_msgSend(v12, "info");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "staticApplicationShortcutItems");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dynamicApplicationShortcutItems");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "info");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "itemID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "unsignedIntegerValue");
      objc_msgSend(v12, "info");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "supportsMultiwindow");
      v43 = objc_msgSend(v12, "isSystemApplication");
      v44 = objc_msgSend(v12, "isInternalApplication");
      objc_msgSend(v12, "info");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE5(v51) = v61;
      BYTE4(v51) = v54;
      BYTE3(v51) = objc_msgSend(v45, "isBeta");
      BYTE2(v51) = v44;
      BYTE1(v51) = v43;
      LOBYTE(v51) = v42;
      v36 = v66;
      objc_msgSend(v55, "composedShortcutsForApplicationWithBundleIdentifier:iconDisplayName:staticItems:dynamicItems:applicationItemID:numberOfDisplayItemsInSwitcher:supportsMultipleWindows:isSystemApplication:isInternalApplication:isApplicationInBeta:isApplicationHidden:iconManagerAllowsEditing:removeStyle:", v66, v69, v56, v64, v40, v57, v51, v60);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        v6 = v68;
        v9 = v62;
        v7 = v63;
        v14 = v59;
LABEL_25:

LABEL_26:
        goto LABEL_35;
      }

      v9 = v62;
      v7 = v63;
      v14 = v59;
      v34 = v53;
    }
    else
    {
      if (!v13)
      {
        v23 = 0;
        goto LABEL_26;
      }
      v68 = v6;
      -[SBHomeScreenController applicationPlaceholderController](self, "applicationPlaceholderController");
      v30 = v14;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "placeholdersByDisplayID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (unint64_t)objc_msgSend(v32, "count") > 1;

      LOBYTE(v31) = objc_msgSend(v30, "canBeShared");
      v70 = (void *)MEMORY[0x1E0DAA478];
      objc_msgSend(v8, "applicationBundleID");
      v67 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayName");
      v33 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "applicationItemID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "unsignedIntegerValue");
      LOBYTE(v52) = (_BYTE)v31;
      v14 = v30;
      v36 = (void *)v67;
      LOBYTE(v51) = v10;
      v37 = v70;
      v69 = (void *)v33;
      objc_msgSend(v37, "composedShortcutsForDownloadingApplicationWithBundleIdentifier:iconDisplayName:applicationItemID:canModifyDownloadState:prioritizationIsAvailable:downloadingInformationAgent:iconManagerAllowsEditing:removeStyle:canShare:", v67, v33, v35, 1, v65, v14, v51, v11, v52);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v6 = v68;
    goto LABEL_25;
  }
  if (objc_msgSend(v8, "isBookmarkIcon"))
  {
    v20 = (void *)MEMORY[0x1E0DAA478];
    v21 = v8;
    objc_msgSend(v21, "displayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "composedShortcutsForBookmarkIcon:withDisplayName:iconManagerAllowsEditing:removeStyle:", v21, v22, v10, v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_35;
  }
  if (objc_msgSend(v8, "isFolderIcon"))
  {
    v24 = objc_alloc_init(SBForceTouchAppIconInfoProvider);
    v25 = (void *)MEMORY[0x1E0DAA478];
    -[SBHomeScreenController iconManager](self, "iconManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "iconImageCache");
    v27 = v11;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __74__SBHomeScreenController_iconManager_applicationShortcutItemsForIconView___block_invoke;
    v72[3] = &unk_1E8EA6610;
    v73 = v24;
    v29 = v24;
    objc_msgSend(v25, "composedShortcutsForFolderIcon:iconImageCache:iconManagerAllowsEditing:removeStyle:badgeViewGenerator:", v8, v28, v10, v27, v72);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!objc_msgSend(v8, "isWidgetIcon"))
    {
      v23 = 0;
      goto LABEL_35;
    }
    objc_msgSend(v7, "customIconImageViewController");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_opt_respondsToSelector();

    if ((v47 & 1) != 0)
    {
      objc_msgSend(v7, "customIconImageViewController");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "applicationShortcutItems");
      v29 = (SBForceTouchAppIconInfoProvider *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v29 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DAA478], "composedShortcutsForWidgetIcon:additionalApplicationShortcutItems:widgetIconSupportsConfiguration:iconManagerAllowsEditing:widgetSettings:", v8, v29, objc_msgSend(v7, "supportsConfigurationCard"), v10, self->_widgetSettings);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_35:
  SBLogIcon();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v75 = v71;
    v76 = 2114;
    v77 = v23;
    _os_log_impl(&dword_1D0540000, v49, OS_LOG_TYPE_DEFAULT, "%p: iconManager:applicationShortcutItemsForIconView: %{public}@", buf, 0x16u);
  }

  return v23;
}

id __74__SBHomeScreenController_iconManager_applicationShortcutItemsForIconView___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0DAA5B8];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "configureForIcon:infoProvider:", v4, *(_QWORD *)(a1 + 32));

  return v5;
}

- (BOOL)iconManager:(id)a3 shouldActivateApplicationShortcutItem:(id)a4 atIndex:(unint64_t)a5 forIconView:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const __CFString *v20;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char v31;
  id *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  _QWORD v59[4];
  id v60;
  id v61;
  _QWORD v62[5];
  id v63;
  _QWORD v64[4];
  id v65;
  uint8_t buf[4];
  SBHomeScreenController *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  unint64_t v71;
  __int16 v72;
  id v73;
  __int16 v74;
  const __CFString *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v11, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB78]) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB90]) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB70]) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB98]) & 1) != 0
    || objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB80]))
  {
    objc_msgSend(v9, "iconCloseBoxTapped:", v11);
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB18])
    && objc_msgSend(v11, "supportsConfigurationCard"))
  {
    objc_msgSend(v11, "presentConfigurationCard");
    goto LABEL_7;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB10])
    && objc_msgSend(v11, "supportsStackConfigurationCard"))
  {
    objc_msgSend(v11, "presentStackConfigurationCard");
    goto LABEL_7;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB20]))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("tap-to-radar://new?ComponentID=1083491&ComponentName=Proactive%20Stacks&ComponentVersion=UI&Title=Stack%20rotation%20feedback:&Classification=UI%2FUsability&Description=Give%20details%20here..."));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    SBWorkspaceActivateApplicationFromURL(v22, 0, 0);
LABEL_25:

    goto LABEL_7;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB38]))
  {
    v23 = objc_opt_class();
    objc_msgSend(v11, "icon");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v23, v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "hideSuggestedWidgetFromStack:", v25);
LABEL_60:

    goto LABEL_7;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB30]))
  {
    v26 = objc_opt_class();
    objc_msgSend(v11, "icon");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v26, v27);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "hideSiriSuggestionOnWidgetFromStack:", v25);
    goto LABEL_60;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAC0]))
  {
    v28 = objc_opt_class();
    objc_msgSend(v11, "icon");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v28, v29);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addSuggestedActiveWidgetToStack:", v25);
    goto LABEL_60;
  }
  if ((objc_msgSend(v12, "isWidgetIcon") & 1) != 0 || objc_msgSend(v12, "isApplicationIcon"))
  {
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB00]))
    {
      v30 = *MEMORY[0x1E0DAAAE8];
LABEL_40:
      if ((objc_msgSend(v13, "isEqualToString:", v30) & 1) != 0)
      {
        v32 = (id *)MEMORY[0x1E0DAA768];
      }
      else if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAE0]) & 1) != 0)
      {
        v32 = (id *)MEMORY[0x1E0DAA758];
      }
      else if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAF8]) & 1) != 0)
      {
        v32 = (id *)MEMORY[0x1E0DAA778];
      }
      else
      {
        v39 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAF0]);
        v32 = (id *)MEMORY[0x1E0DAA7A0];
        if (v39)
          v32 = (id *)MEMORY[0x1E0DAA770];
      }
      v25 = *v32;
      if (objc_msgSend(v12, "isWidgetIcon"))
        objc_msgSend(v9, "changeSizeOfWidgetIcon:toSizeClass:", v12, v25);
      else
        objc_msgSend(v9, "replaceAppIcon:withWidgetOfSize:", v12, v25);
      goto LABEL_60;
    }
    v31 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAF0]);
    v30 = *MEMORY[0x1E0DAAAE8];
    if ((v31 & 1) != 0
      || (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAE8]) & 1) != 0
      || (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAE0]) & 1) != 0
      || objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAF8]))
    {
      goto LABEL_40;
    }
  }
  if (objc_msgSend(v12, "isWidgetIcon")
    && (objc_msgSend(v12, "isWidgetStackIcon") & 1) == 0
    && objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB08]))
  {
    objc_msgSend(v9, "replaceWidgetIconWithAppIcon:", v12);
    goto LABEL_7;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB88]))
  {
    objc_msgSend(v11, "startForbiddingEditingModeWithReason:", CFSTR("SBIconViewForbidEditingModeBecauseWeAreAnimatingTheContextMenuOutButWantEditingToStateImmediately"));
    objc_msgSend(v9, "setEditing:fromIconView:", 1, v11);
    objc_initWeak((id *)buf, v11);
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __96__SBHomeScreenController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke;
    v64[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v65, (id *)buf);
    objc_msgSend(v11, "performAfterContextMenusDismissUsingBlock:", v64);
    objc_destroyWeak(&v65);
    objc_destroyWeak((id *)buf);
    goto LABEL_7;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAB8]))
  {
    v33 = (void *)MEMORY[0x1E0CF9688];
    objc_msgSend(v11, "icon");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "applicationBundleID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "applicationWithBundleIdentifier:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v36, "isHidden"))
    {
      -[SBHomeScreenController rootViewController](self, "rootViewController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __96__SBHomeScreenController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_2;
      v62[3] = &unk_1E8E9E820;
      v62[4] = self;
      v63 = v12;
      _SBUnhideProtectedAppAlertControllerFor(v36, v62);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "presentViewController:animated:completion:", v38, 1, 0);

    }
    else
    {
      -[SBHomeScreenController addIconToHomeScreen:](self, "addIconToHomeScreen:", v12);
    }
    -[SBHomeScreenController addIconToHomeScreen:](self, "addIconToHomeScreen:", v12);

    goto LABEL_7;
  }
  if (objc_msgSend(v12, "isApplicationIcon"))
  {
    v57 = v12;
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAABA0]))
    {
      objc_msgSend((id)SBApp, "windowSceneManager");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "activeDisplayWindowScene");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "_fbsDisplayConfiguration");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBApplicationMultiwindowService sharedInstance](SBApplicationMultiwindowService, "sharedInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "applicationBundleID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "triggerShowAllWindowsForApplicationBundleIdentifier:displayConfiguration:", v43, v41);

    }
    else if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB50]))
    {
      objc_msgSend(v57, "prioritizeDownload");
    }
    else if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB48]))
    {
      objc_msgSend(v57, "pauseDownload");
    }
    else if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB60]))
    {
      objc_msgSend(v57, "resumeDownload");
    }
    else if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAD8]))
    {
      objc_msgSend(v57, "cancelDownload");
    }
    else if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB68]))
    {
      objc_msgSend(v9, "iconShareSheetManager");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "presentShareSheetForIconView:", v11);

    }
    else
    {
      v54 = *MEMORY[0x1E0DAAB40];
      if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB40]) & 1) != 0
        || objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAABB0]))
      {
        objc_msgSend(v57, "changeLockedStatusToLocked:", objc_msgSend(v13, "isEqualToString:", v54));
      }
      else
      {
        v55 = *MEMORY[0x1E0DAAB28];
        if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB28]) & 1) == 0
          && !objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAABA8]))
        {
          v14 = 1;
          goto LABEL_98;
        }
        objc_msgSend(v57, "changeHiddenStatusToHidden:", objc_msgSend(v13, "isEqualToString:", v55));
      }
    }
    v14 = 0;
LABEL_98:

    goto LABEL_8;
  }
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAAC8]))
  {
    objc_msgSend(v10, "userInfo");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKey:", *MEMORY[0x1E0DAAAD0]);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      SBWorkspaceActivateApplicationFromURL(v45, 0, 0);

    }
    goto LABEL_60;
  }
  if (objc_msgSend(v12, "isBookmarkIcon"))
  {
    if (!objc_msgSend(v12, "displaysShareBookmarkShortcutItem")
      || !objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB68]))
    {
      goto LABEL_7;
    }
    objc_msgSend(v9, "iconShareSheetManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "presentShareSheetForIconView:", v11);
    goto LABEL_25;
  }
  if (objc_msgSend(v12, "isFolderIcon"))
  {
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAABB8]))
    {
      -[SBHomeScreenController applicationController](self, "applicationController");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleIdentifierToLaunch");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "applicationWithBundleIdentifier:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      SBWorkspaceActivateApplication(v48);
    }
    else if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAAB58]))
    {
      objc_msgSend(v11, "location");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __96__SBHomeScreenController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_3;
      v59[3] = &unk_1E8E9DEB0;
      v60 = v9;
      v61 = v11;
      objc_msgSend(v60, "openFolderIcon:location:animated:withCompletion:", v12, v52, 1, v59);

    }
    goto LABEL_7;
  }
  objc_msgSend(v11, "customIconImageViewController");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_opt_respondsToSelector();

  if ((v50 & 1) != 0)
  {
    objc_msgSend(v11, "customIconImageViewController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "didSelectApplicationShortcutItem:", v10);

  }
  v14 = 1;
LABEL_8:
  v15 = (void *)MEMORY[0x1E0CB3940];
  -[SBHomeScreenController _aggregateLoggingAppKeyForIcon:](self, "_aggregateLoggingAppKeyForIcon:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("com.apple.springboard.quickaction.selected.%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isApplicationIcon"))
  {
    objc_msgSend(v12, "application");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isSystemApplication") & 1) == 0)
      objc_msgSend(v18, "isInternalApplication");

  }
  ADClientAddValueForScalarKey();
  SBLogIcon();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    v20 = CFSTR("NO");
    v67 = self;
    v68 = 2114;
    if (v14)
      v20 = CFSTR("YES");
    v69 = v10;
    v70 = 2048;
    v71 = a5;
    v72 = 2114;
    v73 = v11;
    v74 = 2114;
    v75 = v20;
    _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "%p: iconManager:shouldActivateApplicationShortcutItem:%{public}@ atIndex:%lu forIconView:%{public}@ -- Returning %{public}@", buf, 0x34u);
  }

  return v14;
}

void __96__SBHomeScreenController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endForbiddingEditingModeWithReason:", CFSTR("SBIconViewForbidEditingModeBecauseWeAreAnimatingTheContextMenuOutButWantEditingToStateImmediately"));

}

uint64_t __96__SBHomeScreenController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIconToHomeScreen:", *(_QWORD *)(a1 + 40));
}

void __96__SBHomeScreenController_iconManager_shouldActivateApplicationShortcutItem_atIndex_forIconView___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setEditing:fromIconView:", 1, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "openedFolderController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginEditingTitle");

}

- (unint64_t)iconManager:(id)a3 supportedMultitaskingShortcutActionsForIconView:(id)a4
{
  void *v5;
  unint64_t v6;
  void *v7;
  char v8;

  objc_msgSend(a4, "icon", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2 || !objc_msgSend(v5, "isApplicationIcon"))
      goto LABEL_4;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userInterfaceIdiom") != 1)
  {
    v6 = 0;
    goto LABEL_9;
  }
  v8 = objc_msgSend(v5, "isApplicationIcon");

  if ((v8 & 1) != 0)
  {
LABEL_7:
    objc_msgSend(v5, "applicationBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _SBHMultitaskingApplicationSupportedShortcutActionMaskFromSBSMask(-[SBHomeScreenController supportedMultitaskingShortcutActionsForBundleIdentifier:](self, "supportedMultitaskingShortcutActionsForBundleIdentifier:", v7));
LABEL_9:

    goto LABEL_10;
  }
LABEL_4:
  v6 = 0;
LABEL_10:

  return v6;
}

- (unint64_t)supportedMultitaskingShortcutActionsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v4 = a3;
  -[SBHomeScreenController applicationController](self, "applicationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationWithBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeDisplayWindowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "switcherController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "canPerformKeyboardShortcutAction:forBundleIdentifier:", 11, v4);
    if (objc_msgSend(v9, "canPerformKeyboardShortcutAction:forBundleIdentifier:", 13, v4))
      v10 |= 6uLL;
    if (objc_msgSend(v9, "canPerformKeyboardShortcutAction:forBundleIdentifier:", 3, v4))
      v10 |= 8uLL;
    if (objc_msgSend(v9, "canPerformKeyboardShortcutAction:forBundleIdentifier:", 18, v4))
      v10 |= 0x10uLL;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)addIconToHomeScreen:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[SBHomeScreenController iconManager](self, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isShowingSpotlightOrLeadingCustomView"))
    objc_msgSend(v4, "dismissSpotlightAnimated:completionHandler:", 1, 0);
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transientOverlayPresentationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasActivePresentation"))
  {
    +[SBTransientOverlayDismissalRequest dismissalRequestForAllViewControllers](SBTransientOverlayDismissalRequest, "dismissalRequestForAllViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performDismissalRequest:", v7);

  }
  objc_msgSend(v4, "addNewIconToDesignatedLocation:options:", v11, 91);
  if (-[SBHomeScreenController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
  {
    -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modalLibraryController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "libraryViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SBHomeScreenController overlayLibraryViewController](self, "overlayLibraryViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "forcedSearchTextFieldNoneditable:", 1);
  objc_msgSend(v4, "setDisablesScrollingToLastIconPageForLibraryDismissal:", 1);
  -[SBHomeScreenController dismissHomeScreenOverlaysAnimated:](self, "dismissHomeScreenOverlaysAnimated:", 1);
  objc_msgSend(v4, "setDisablesScrollingToLastIconPageForLibraryDismissal:", 0);
  objc_msgSend(v10, "forcedSearchTextFieldNoneditable:", 0);

}

- (void)_forceTouchControllerWillPresent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SBSafeCast(v5, v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatingDockController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isFloatingDockPresented"))
    {
      objc_msgSend(v11, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0DAA998]) & 1) == 0)
      {
        objc_msgSend(v11, "location");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "isEqual:", CFSTR("SBIconLocationFloatingDockSuggestions"));

      }
    }

  }
}

- (id)_aggregateLoggingAppKeyForIcon:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v3 = a3;
  if (objc_msgSend(v3, "isApplicationIcon"))
  {
    objc_msgSend(v3, "application");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applicationPlaceholder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isSystemApplication") & 1) != 0 || objc_msgSend(v4, "isInternalApplication"))
    {
      objc_msgSend(v4, "bundleIdentifier");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (v4)
    {
      v6 = CFSTR("thirdParty");
    }
    else if (v5)
    {
      objc_msgSend(v3, "applicationBundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v8, 1, 0);
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "typeForInstallMachinery");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("User"));

        if ((v12 & 1) != 0)
          v6 = CFSTR("thirdParty");
        else
          v6 = v8;
      }
      else
      {
        v6 = CFSTR("unknown");
      }

    }
    else
    {
      v6 = CFSTR("unknown");
    }

  }
  else if ((objc_msgSend(v3, "isBookmarkIcon") & 1) != 0)
  {
    v6 = CFSTR("bookmark");
  }
  else if (objc_msgSend(v3, "isFolderIcon"))
  {
    v6 = CFSTR("folder");
  }
  else
  {
    v6 = CFSTR("unknown");
  }

  return v6;
}

- (void)_colorDropperWillPresent:(id)a3
{
  id v5;
  void *v6;
  SBFloatingDockBehaviorAssertion *colorPickerInterfactionFloatingDockBehaviorAssertion;
  SBFloatingDockBehaviorAssertion *v8;
  void *v9;
  SBFloatingDockBehaviorAssertion *v10;
  SBFloatingDockBehaviorAssertion *v11;
  BSInvalidatable *duckWallpaperDimmingAssertion;
  void *v13;
  void *v14;
  BSInvalidatable *v15;
  BSInvalidatable *v16;
  id v17;

  v5 = a3;
  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatingDockController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  colorPickerInterfactionFloatingDockBehaviorAssertion = self->_colorPickerInterfactionFloatingDockBehaviorAssertion;
  if (colorPickerInterfactionFloatingDockBehaviorAssertion)
    -[SBFloatingDockBehaviorAssertion invalidate](colorPickerInterfactionFloatingDockBehaviorAssertion, "invalidate");
  v8 = [SBFloatingDockBehaviorAssertion alloc];
  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:](v8, "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v6, 1, 0, 0, v9, 0, 0.0);
  v11 = self->_colorPickerInterfactionFloatingDockBehaviorAssertion;
  self->_colorPickerInterfactionFloatingDockBehaviorAssertion = v10;

  duckWallpaperDimmingAssertion = self->_duckWallpaperDimmingAssertion;
  if (duckWallpaperDimmingAssertion)
    -[BSInvalidatable invalidate](duckWallpaperDimmingAssertion, "invalidate");
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "acquireDuckHomeScreenWallpaperDimAssertionWithReason:", v14);
  v15 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  v16 = self->_duckWallpaperDimmingAssertion;
  self->_duckWallpaperDimmingAssertion = v15;

  -[SBHomeScreenController _beginDisablingAllOrientationChangesForReason:](self, "_beginDisablingAllOrientationChangesForReason:", CFSTR("SBIconControllerDisableRotationForStyleColorDropperReason"));
}

- (void)_colorDropperDismissed:(id)a3
{
  SBFloatingDockBehaviorAssertion *colorPickerInterfactionFloatingDockBehaviorAssertion;
  BSInvalidatable *duckWallpaperDimmingAssertion;

  -[SBFloatingDockBehaviorAssertion invalidate](self->_colorPickerInterfactionFloatingDockBehaviorAssertion, "invalidate", a3);
  colorPickerInterfactionFloatingDockBehaviorAssertion = self->_colorPickerInterfactionFloatingDockBehaviorAssertion;
  self->_colorPickerInterfactionFloatingDockBehaviorAssertion = 0;

  -[BSInvalidatable invalidate](self->_duckWallpaperDimmingAssertion, "invalidate");
  duckWallpaperDimmingAssertion = self->_duckWallpaperDimmingAssertion;
  self->_duckWallpaperDimmingAssertion = 0;

  -[SBHomeScreenController _endDisablingAllOrientationChangesForReason:](self, "_endDisablingAllOrientationChangesForReason:", CFSTR("SBIconControllerDisableRotationForStyleColorDropperReason"));
}

- (void)_iconForceTouchControllerWillPresent:(id)a3
{
  -[SBHomeScreenController _beginDisablingAllOrientationChangesForReason:](self, "_beginDisablingAllOrientationChangesForReason:", CFSTR("SBIconControllerDisableRotationForAppIconForceTouchReason"));
}

- (void)_iconForceTouchControllerDidDismiss:(id)a3
{
  -[SBHomeScreenController _endDisablingAllOrientationChangesForReason:](self, "_endDisablingAllOrientationChangesForReason:", CFSTR("SBIconControllerDisableRotationForAppIconForceTouchReason"));
}

- (void)_startSpotlightInteractiveGestureTransactionForGesture:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  SBHomeScreenController *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0DA9D10], "enableFloatingWindow"))
  {
    -[SBHomeScreenController policyAggregator](self, "policyAggregator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "allowsCapability:", 9);

    if (v6)
    {
      if (!self->_spotlightInteractiveGestureTransaction)
      {
        v7 = (void *)SBApp;
        v8 = MEMORY[0x1E0C809B0];
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __81__SBHomeScreenController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke;
        v12[3] = &unk_1E8EA3E78;
        v13 = v4;
        v9[0] = v8;
        v9[1] = 3221225472;
        v9[2] = __81__SBHomeScreenController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_2;
        v9[3] = &unk_1E8EA6660;
        v10 = v13;
        v11 = self;
        objc_msgSend(v7, "beginInteractiveSpotlightTransientOverlayPresentationWithValidator:beginHandler:", v12, v9);

      }
    }
  }

}

uint64_t __81__SBHomeScreenController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isDragging");
}

void __81__SBHomeScreenController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isDragging"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 312), a2);
    objc_initWeak(&location, *(id *)(a1 + 40));
    objc_msgSend(v4, "completionBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__SBHomeScreenController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_3;
    v7[3] = &unk_1E8EA6638;
    v6 = v5;
    v8 = v6;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "setCompletionBlock:", v7);
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v4, "noteGestureFinishedBeforeTransactionBegan");
  }

}

void __81__SBHomeScreenController__startSpotlightInteractiveGestureTransactionForGesture___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  _QWORD *WeakRetained;
  void *v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[39];
    WeakRetained[39] = 0;
    v5 = WeakRetained;

    WeakRetained = v5;
  }

}

- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4
{
  if (a4)
    -[SBHomeScreenController _startSpotlightInteractiveGestureTransactionForGesture:](self, "_startSpotlightInteractiveGestureTransactionForGesture:", a3);
}

- (void)searchGesture:(id)a3 changedPercentComplete:(double)a4
{
  double v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isTracking"))
  {
    if (self->_spotlightInteractiveGestureTransaction
      || (-[SBHomeScreenController _startSpotlightInteractiveGestureTransactionForGesture:](self, "_startSpotlightInteractiveGestureTransactionForGesture:", v7), self->_spotlightInteractiveGestureTransaction))
    {
      objc_msgSend((id)objc_opt_class(), "searchHeaderHeight");
      -[SBSpotlightTransientOverlayInteractiveGestureTransaction updatePresentationWithProgress:translation:](self->_spotlightInteractiveGestureTransaction, "updatePresentationWithProgress:translation:", a4, v6 * a4);
    }
  }

}

- (void)searchGesture:(id)a3 endedGesture:(BOOL)a4
{
  SBSpotlightTransientOverlayInteractiveGestureTransaction *spotlightInteractiveGestureTransaction;

  spotlightInteractiveGestureTransaction = self->_spotlightInteractiveGestureTransaction;
  if (spotlightInteractiveGestureTransaction)
    -[SBSpotlightTransientOverlayInteractiveGestureTransaction endPresentation:](spotlightInteractiveGestureTransaction, "endPresentation:", a4);
}

- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  _QWORD block[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a4, "elements", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    v10 = *MEMORY[0x1E0D22C78];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "isSpringBoardElement"))
        {
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v10);

          if (v14)
          {
            v8 |= 0x10uLL;
          }
          else
          {
            objc_msgSend(v12, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.InCallService"));

            if (v16)
              v8 |= 0x20uLL;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SBHomeScreenController_publisher_didUpdateLayout_withTransition___block_invoke;
  block[3] = &unk_1E8E9DE88;
  block[4] = self;
  block[5] = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __67__SBHomeScreenController_publisher_didUpdateLayout_withTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIconOcclusionReasons:", objc_msgSend(*(id *)(a1 + 32), "iconOcclusionReasons") & 0xFFFFFFFFFFFFFFCFLL | *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateVisibleIconsAfterOcclusionChange");
}

- (UIView)containerView
{
  void *v2;
  void *v3;

  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)alertItemsController:(id)a3 willActivateAlertItem:(id)a4
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  SBLogIconDragging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "alert item will activate", v7, 2u);
  }

  -[SBHomeScreenController iconManager](self, "iconManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelAllDrags");

}

- (void)assistantWillAppear:(id)a3 windowScene:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  if (objc_msgSend(a4, "isMainDisplayWindowScene", a3))
  {
    SBLogIconDragging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "assistant will appear", v8, 2u);
    }

    -[SBHomeScreenController iconManager](self, "iconManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEditing:", 0);

    -[SBHomeScreenController iconManager](self, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelAllDrags");

  }
}

- (void)iconManager:(id)a3 willDestroyRootFolderController:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v5 = a4;
  objc_msgSend(v5, "removePageStateObserver:", self);
  objc_msgSend(v5, "setAccessoryViewControllerDelegate:", 0);

  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iconContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "setContentView:", 0);
  -[SBHomeScreenController spotlightViewController](self, "spotlightViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidate");

  -[SBHomeScreenController setSpotlightViewController:](self, "setSpotlightViewController:", 0);
}

- (void)iconManager:(id)a3 willDestroyRootViewController:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v5 = a4;
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "setContentView:", 0);
  objc_msgSend(v5, "removeFromParentViewController");

  -[SBHomeScreenController setRootViewController:](self, "setRootViewController:", 0);
}

- (void)iconManager:(id)a3 willUseRootFolderControllerConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  SBHomeScreenSpotlightViewController *v13;
  SBSpotlightPresentableViewController *v14;
  SBSearchPresenter *v15;
  void *v16;
  void *v17;
  void *v18;
  SBSearchPresenter *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a3;
  v6 = a4;
  if (MEMORY[0x1D17E3C78]())
  {
    if (SBHHomeScreenSearchAffordanceEnabled()
      && (+[SBDefaults localDefaults](SBDefaults, "localDefaults"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "homeScreenDefaults"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "showsHomeScreenSearchAffordance"),
          v8,
          v7,
          v9))
    {
      v10 = objc_alloc_init(MEMORY[0x1E0DAA520]);
      -[SBHomeScreenController legibilitySettings](self, "legibilitySettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLegibilitySettings:", v11);

      objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("spotlight-pill"));
      -[SBHomeScreenController setScrollAccessoryAuxiliaryView:](self, "setScrollAccessoryAuxiliaryView:", v10);
      objc_msgSend(v6, "setScrollAccessoryAuxiliaryView:", v10);
      v12 = -[SBHomeScreenController _newSearchPillBackgroundView](self, "_newSearchPillBackgroundView");
      objc_msgSend(v6, "setScrollAccessoryBackgroundView:", v12);

    }
    else
    {
      -[SBHomeScreenController setScrollAccessoryAuxiliaryView:](self, "setScrollAccessoryAuxiliaryView:", 0);
    }
    v13 = -[SBHomeScreenSpotlightViewController initWithDelegate:]([SBHomeScreenSpotlightViewController alloc], "initWithDelegate:", self);
    -[SBHomeScreenController setSpotlightViewController:](self, "setSpotlightViewController:", v13);
    v14 = -[SBSpotlightPresentableViewController initWithSpotlightMultiplexingViewController:]([SBSpotlightPresentableViewController alloc], "initWithSpotlightMultiplexingViewController:", v13);
    -[SBSpotlightPresentableViewController setDelegate:](v14, "setDelegate:", self);
    -[SBHomeScreenController setSearchPresentableViewController:](self, "setSearchPresentableViewController:", v14);
    v15 = [SBSearchPresenter alloc];
    objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "homeScreenPullToSearchSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenController _identifierForSearchPresenter](self, "_identifierForSearchPresenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SBSearchPresenter initWithSettings:identifier:](v15, "initWithSettings:identifier:", v17, v18);

    -[SBSearchPresenter setSearchPresenterDelegate:](v19, "setSearchPresenterDelegate:", self);
    -[SBSearchPresenter setUsesTransitionDistanceAsStartOffset:](v19, "setUsesTransitionDistanceAsStartOffset:", 1);
    -[SBHomeScreenController setSearchPresenter:](self, "setSearchPresenter:", v19);
    objc_msgSend(v6, "setSearchPresenter:", v19);
    objc_msgSend(v6, "setSearchPresentableViewController:", v14);

  }
  else
  {
    -[SBHomeScreenController setSpotlightViewController:](self, "setSpotlightViewController:", 0);
    -[SBHomeScreenController setSearchPresentableViewController:](self, "setSearchPresentableViewController:", 0);
    -[SBHomeScreenController setSearchPresenter:](self, "setSearchPresenter:", 0);
    if ((objc_msgSend(MEMORY[0x1E0DA9D10], "enableFloatingWindow") & 1) != 0)
      goto LABEL_10;
    v13 = -[SBHomeScreenSpotlightViewController initWithDelegate:]([SBHomeScreenSpotlightViewController alloc], "initWithDelegate:", self);
    -[SBSpotlightMultiplexingViewController setSpotlightDelegate:](v13, "setSpotlightDelegate:", self);
    -[SBHomeScreenController setSpotlightViewController:](self, "setSpotlightViewController:", v13);
    objc_msgSend(v6, "setPullDownSearchViewController:", v13);
  }

LABEL_10:
  if (-[SBHomeScreenController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
  {
    -[SBHomeScreenController todayViewController](self, "todayViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeadingCustomViewController:", v20);

    -[SBHomeScreenController overlayLibraryViewController](self, "overlayLibraryViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTrailingCustomViewController:", v21);

    -[SBHomeScreenController overlayLibraryViewController](self, "overlayLibraryViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPresenter:", v26);

  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceIdiom");

  if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (-[SBHomeScreenController allowsHomeScreenOverlay](self, "allowsHomeScreenOverlay"))
      objc_msgSend(v6, "setIgnoresOverscrollOnFirstPageOrientations:", 30);
    objc_msgSend(v6, "setFolderPageManagementAllowedOrientations:", 30);
    objc_msgSend(v6, "setShowsAddWidgetButtonWhileEditingAllowedOrientations:", 30);
    if (-[SBHomeScreenController isFocusAllowedForIconManager:](self, "isFocusAllowedForIconManager:", v26))
      objc_msgSend(v6, "setAddsFocusGuidesForWrapping:", 1);
  }
  else
  {
    if (!-[SBHomeScreenController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
    {
      objc_msgSend(v6, "setIgnoresOverscrollOnFirstPageOrientations:", 30);
      if (-[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported"))
        objc_msgSend(v6, "setIgnoresOverscrollOnLastPageOrientations:", 6);
    }
    objc_msgSend(v6, "setFolderPageManagementAllowedOrientations:", 6);
    objc_msgSend(v6, "setShowsAddWidgetButtonWhileEditingAllowedOrientations:", 6);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "postNotificationName:object:", SBIconControllerDidReconfigureChildControllersNotification, self);

}

- (id)_newTodayViewControllerWithIconManager:(id)a3 iconListModel:(id)a4 rootFolder:(id)a5 location:(int64_t)a6
{
  id v10;
  id v11;
  SBTodayViewController *v12;
  void *v13;
  SBTodayViewController *v14;
  void *v16;

  v10 = a3;
  v11 = a5;
  v12 = [SBTodayViewController alloc];
  objc_msgSend(v10, "listLayoutProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBHTodayViewController initWithListLayoutProvider:iconViewProvider:legacyWidgetListViewController:location:](v12, "initWithListLayoutProvider:iconViewProvider:legacyWidgetListViewController:location:", v13, v10, 0, a6);

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeScreenController.m"), 4224, CFSTR("Today view controller is not initialized."));

  }
  if (!-[SBHomeScreenController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
    -[SBHTodayViewController setIconLocation:](v14, "setIconLocation:", *MEMORY[0x1E0DAA9F8]);
  -[SBHTodayViewController setDelegate:](v14, "setDelegate:", self);
  -[SBHTodayViewController addObserver:](v14, "addObserver:", self);
  -[SBHTodayViewController setRootFolder:](v14, "setRootFolder:", v11);

  -[SBHTodayViewController setIconManager:](v14, "setIconManager:", v10);
  -[SBHTodayViewController setEditing:](v14, "setEditing:", objc_msgSend(v10, "isEditing"));

  return v14;
}

- (void)iconManager:(id)a3 didCreateRootFolderController:(id)a4
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v12, "addPageStateObserver:", self);
  objc_msgSend(v12, "setAccessoryViewControllerDelegate:", self);
  v6 = (void *)MEMORY[0x1E0DAA3C8];
  objc_msgSend(WeakRetained, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController animationWindow](self, "animationWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController homeScreenContentView](self, "homeScreenContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextWithScreen:animationWindow:fallbackIconContainer:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAnimationContext:", v10);

  objc_msgSend(v12, "searchGesture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:", self);

  if (objc_msgSend(WeakRetained, "isContinuityDisplayWindowScene"))
    objc_msgSend(v12, "setParallaxDisabled:forReason:", 1, CFSTR("Continuity"));

}

- (void)iconManager:(id)a3 didCreateRootViewController:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id WeakRetained;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  SBHomeScreenController *v22;
  id v23;

  v5 = a4;
  -[SBHomeScreenController updateHomeScreenTraitOverridesForViewController:](self, "updateHomeScreenTraitOverridesForViewController:", v5);
  v6 = (void *)*MEMORY[0x1E0CEB258];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __66__SBHomeScreenController_iconManager_didCreateRootViewController___block_invoke;
  v21 = &unk_1E8E9E820;
  v22 = self;
  v7 = v5;
  v23 = v7;
  objc_msgSend(v6, "_performBlockAfterCATransactionCommits:", &v18);
  objc_msgSend(v7, "view", v18, v19, v20, v21, v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v12 = v10;
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

  objc_msgSend(v9, "addChildViewController:", v7);
  objc_msgSend(v14, "setContentView:", v8);
  objc_msgSend(v7, "didMoveToParentViewController:", v9);
  objc_msgSend(v14, "sendSubviewToBack:", v8);

  -[SBHomeScreenController userInterfaceController](self, "userInterfaceController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v15, "updateStatusBarLegibilityForWindowScene:", WeakRetained);

  -[SBHomeScreenController setRootViewController:](self, "setRootViewController:", v7);
  -[SBHomeScreenController searchPresentableViewController](self, "searchPresentableViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "invalidateSearchAffordanceView");

  if (v7 && v9)
    -[SBHomeScreenController _updateLegibility](self, "_updateLegibility");

}

uint64_t __66__SBHomeScreenController_iconManager_didCreateRootViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeHomeScreenTraitOverridesForViewController:", *(_QWORD *)(a1 + 40));
}

- (int64_t)interfaceOrientationForIconManager:(id)a3
{
  void *v3;
  int64_t v4;

  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveOrientation");

  return v4;
}

- (unint64_t)allowedInterfaceOrientationsForIconManager:(id)a3
{
  void *v3;
  unint64_t v4;

  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowedInterfaceOrientations");

  return v4;
}

- (unint64_t)possibleInterfaceOrientationsForIconManager:(id)a3
{
  void *v3;
  unint64_t v4;

  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "possibleInterfaceOrientations");

  return v4;
}

- (BOOL)isRootFolderContentVisibleForIconManager:(id)a3
{
  void *v3;
  BOOL v4;

  -[SBHomeScreenController _currentMainDisplayLayoutState](self, "_currentMainDisplayLayoutState", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unlockedEnvironmentMode") == 1;

  return v4;
}

- (BOOL)isEditingAllowedForIconManager:(id)a3
{
  void *v5;
  char v6;

  if ((-[SBHomeScreenController _disableEditingByDefaultDuringStaging]((uint64_t)self) & 1) != 0)
    return 0;
  -[SBHomeScreenController policyAggregator](self, "policyAggregator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsCapability:", 17);

  return v6;
}

- (BOOL)iconManager:(id)a3 isPartialEditingAllowedForIconLocation:(id)a4
{
  id v5;
  void *v6;
  int v7;
  char v8;

  v5 = a4;
  if ((-[SBHomeScreenController _disableEditingByDefaultDuringStaging]((uint64_t)self) & 1) != 0
    || (-[SBHomeScreenController _iconController](self, "_iconController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hasRestrictedEnforcedLayout"),
        v6,
        !v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = SBIconLocationGroupContainsLocation();
  }

  return v8;
}

- (void)iconManagerEditingDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  SBFloatingDockBehaviorAssertion *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHomeScreenController homeScreenOverlayController](self, "homeScreenOverlayController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateExtraButtonVisibilityAnimated:", 1);

  if (objc_msgSend(v4, "isEditing"))
  {
    v23 = v4;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "connectedWindowScenes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v11, "isExternalDisplayWindowScene"))
          {
            objc_msgSend(v11, "floatingDockController");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v12, 1, 0, 1, CFSTR("hideFloatingDockOnExternalDisplayForHomeScreenEditMode"), 0, 0.0);
            -[SBHomeScreenController floatingDockBehaviorAssertions](self, "floatingDockBehaviorAssertions");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v15 = v14;
              objc_msgSend(v14, "setByAddingObject:", v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v13, 0);
            }
            -[SBHomeScreenController setFloatingDockBehaviorAssertions:](self, "setFloatingDockBehaviorAssertions:", v16);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v8);
    }

    v4 = v23;
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[SBHomeScreenController floatingDockBehaviorAssertions](self, "floatingDockBehaviorAssertions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "invalidate");
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v19);
    }

    -[SBHomeScreenController setFloatingDockBehaviorAssertions:](self, "setFloatingDockBehaviorAssertions:", 0);
  }

}

- (void)iconManager:(id)a3 willUseIconImageCache:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend((id)SBApp, "userSessionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sessionType");

  if (v7 == 2)
    objc_msgSend(v5, "setPoolingBypassCount:", 200);
  -[SBHomeScreenController _libraryViewControllers](self, "_libraryViewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setIconImageCache:", v5);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)iconManagerListLayoutProviderDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBHomeScreenController _libraryViewControllers](self, "_libraryViewControllers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "_sbWindowScene");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHomeScreenController _appLibraryListLayoutProviderForWindowScene:](self, "_appLibraryListLayoutProviderForWindowScene:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setListLayoutProvider:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (id)localizedFolderNameForDefaultDisplayName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBHomeScreenController _iconController](self, "_iconController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedFolderNameForDefaultDisplayName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)iconManager:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBHomeScreenController _iconController](self, "_iconController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedFolderNameForDefaultDisplayName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localizedDefaultFolderNameForIconManager:(id)a3
{
  void *v3;
  void *v4;

  -[SBHomeScreenController _iconController](self, "_iconController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedFolderNameForDefaultDisplayName:", CFSTR("Folder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)iconManagerDidFinishInstallForIcon:(id)a3
{
  void *v4;
  uint64_t v5;

  -[SBHomeScreenController _currentMainDisplayLayoutState](self, "_currentMainDisplayLayoutState", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unlockedEnvironmentMode");

  if (v5 == 1)
    -[SBHomeScreenController _showInfoAlertIfNeeded:](self, "_showInfoAlertIfNeeded:", 1);
}

- (void)iconManager:(id)a3 possibleUserIconTapBegan:(id)a4
{
  kdebug_trace();
}

- (void)iconManager:(id)a3 possibleUserIconTapBeganAfterInformingIcon:(id)a4
{
  kdebug_trace();
}

- (void)iconManager:(id)a3 willPrepareIconViewForLaunch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBHomeScreenController delayedLaunchRequestTimer](self, "delayedLaunchRequestTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SBHomeScreenController setDelayedLaunchRequestTimer:](self, "setDelayedLaunchRequestTimer:", 0);
  objc_msgSend(v5, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeScreenController rootFolder](self, "rootFolder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForIcon:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0DABE08];
  v20[0] = v8;
  v12 = *MEMORY[0x1E0DABE00];
  v19[0] = v11;
  v19[1] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isFolderIcon"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  v19[2] = *MEMORY[0x1E0DABDF8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "indexAtPosition:", objc_msgSend(v10, "length") - 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0DA9D78];
  v17 = v15;
  objc_msgSend(v16, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "emitEvent:withPayload:", 9, v17);

}

- (void)iconManager:(id)a3 didReceiveTapOnLaunchDisabledIconView:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBHomeScreenController delayedLaunchRequestTimer](self, "delayedLaunchRequestTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SBHomeScreenController setDelayedLaunchRequestTimer:](self, "setDelayedLaunchRequestTimer:", 0);
  SBLogIcon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "icon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Received tap on launch-disabled icon view '%@'", (uint8_t *)&v10, 0xCu);

  }
  kdebug_trace();

}

- (void)iconManager:(id)a3 launchIconForIconView:(id)a4 withActions:(id)a5 modifierFlags:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  SBHomeScreenController *v24;
  id v25;
  id v26;
  int64_t v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  -[SBHomeScreenController delayedLaunchRequestTimer](self, "delayedLaunchRequestTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidate");

  -[SBHomeScreenController setDelayedLaunchRequestTimer:](self, "setDelayedLaunchRequestTimer:", 0);
  objc_msgSend(v9, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isApplicationIcon")
    && (objc_msgSend(v12, "application"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isAnyTerminationAssertionInEffect"),
        v13,
        v14))
  {
    SBLogIcon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "applicationBundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Delaying launch of %@ because termination assertion is held", buf, 0xCu);

    }
    v17 = (void *)MEMORY[0x1E0C99E88];
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __86__SBHomeScreenController_iconManager_launchIconForIconView_withActions_modifierFlags___block_invoke;
    v23 = &unk_1E8EA6688;
    v24 = self;
    v25 = v9;
    v26 = v10;
    v27 = a6;
    objc_msgSend(v17, "timerWithTimeInterval:repeats:block:", 0, &v20, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop", v20, v21, v22, v23, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addTimer:forMode:", v18, *MEMORY[0x1E0C99860]);

    -[SBHomeScreenController setDelayedLaunchRequestTimer:](self, "setDelayedLaunchRequestTimer:", v18);
  }
  else
  {
    -[SBHomeScreenController _launchFromIconView:withActions:modifierFlags:](self, "_launchFromIconView:withActions:modifierFlags:", v9, v10, a6);
  }

}

uint64_t __86__SBHomeScreenController_iconManager_launchIconForIconView_withActions_modifierFlags___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchFromIconView:withActions:modifierFlags:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)iconManager:(id)a3 touchesEndedForIconView:(id)a4
{
  kdebug_trace();
}

- (id)iconManager:(id)a3 launchActionsForIconView:(id)a4
{
  return -[SBHomeScreenController launchActionsForIconView:](self, "launchActionsForIconView:", a4);
}

- (id)iconManager:(id)a3 launchURLForIconView:(id)a4
{
  return -[SBHomeScreenController launchURLForIconView:](self, "launchURLForIconView:", a4);
}

- (void)iconManager:(id)a3 launchIcon:(id)a4 location:(id)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  void (**v12)(id, _BOOL8);
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  NSObject *v18;
  void *v19;
  SBActivationSettings *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  int v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _BOOL8))a7;
  if (!objc_msgSend(v10, "isApplicationIcon"))
  {
    v17 = 0;
    if (!v12)
      goto LABEL_21;
    goto LABEL_20;
  }
  objc_msgSend(v10, "application");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applicationBundleID");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v13)
  {
    if (v14)
    {
      -[SBHomeScreenController applicationController](self, "applicationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "applicationWithBundleIdentifier:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
  }
  SBLogIcon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    v27 = 138412802;
    v28 = v10;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v13;
    _os_log_fault_impl(&dword_1D0540000, v18, OS_LOG_TYPE_FAULT, "Fallback launch path: Trying to launch app icon: %@ (%@), found app: %@", (uint8_t *)&v27, 0x20u);
  }

  v17 = v13 != 0;
  if (v13)
  {
    -[SBHomeScreenController userInterfaceController](self, "userInterfaceController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(SBActivationSettings);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateApplication:fromIcon:location:activationSettings:actions:", v13, v10, v11, v20, v21);

    if (v15)
    {
      -[SBHomeScreenController model](self, "model");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "applicationIconForBundleIdentifier:", v15);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      if (v23 && v23 != v10)
      {
        -[SBHomeScreenController rootFolder](self, "rootFolder");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "indexPathForIcon:", v10);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(v24, "iconAtIndexPath:", v25);
          v26 = (id)objc_claimAutoreleasedReturnValue();

          if (v26 != v23)
            objc_msgSend(v24, "replaceIcon:withIcon:", v10, v23);
        }

      }
    }
  }

  if (v12)
LABEL_20:
    v12[2](v12, v17);
LABEL_21:

}

- (id)iconManager:(id)a3 containerViewForPresentingContextMenuForIconView:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerViewForPresentingContextMenuForIconView:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)iconManager:(id)a3 containerViewControllerForConfigurationOfIconView:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a4, "location", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (SBIconLocationGroupContainsLocation())
  {
    v7 = v6;
  }
  else
  {
    if (!SBIconLocationGroupContainsLocation())
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "containerViewControllerForPresentingFromTodayViewControllerAllowingCoverSheet:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (id)iconManager:(id)a3 containerViewForConfigurationOfIconView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[SBHomeScreenController iconManager:containerViewControllerForConfigurationOfIconView:](self, "iconManager:containerViewControllerForConfigurationOfIconView:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
    objc_msgSend(v5, "iconContentView");
  else
    objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGRect)iconManager:(id)a3 contentBoundingRectForConfigurationOfIconView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
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
  double v24;
  CGRect result;

  v6 = a4;
  -[SBHomeScreenController iconManager:containerViewForConfigurationOfIconView:](self, "iconManager:containerViewForConfigurationOfIconView:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    objc_msgSend(v6, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    if (SBIconLocationGroupContainsLocation())
    {
      v11 = v9;
      if (-[SBHomeScreenController isTodayOverlayPresented](self, "isTodayOverlayPresented"))
      {
        -[SBHomeScreenController todayViewController](self, "todayViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v11, "bounds");
    objc_msgSend(v11, "convertRect:toView:", v9);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

  }
  else
  {
    v14 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)iconManager:(id)a3 homeScreenContentViewForConfigurationOfIconView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a4, "location", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (SBIconLocationGroupContainsLocation()
    && -[SBHomeScreenController isTodayOverlayPresented](self, "isTodayOverlayPresented"))
  {
    -[SBHomeScreenController todayViewController](self, "todayViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)iconManager:(id)a3 containerViewControllerForModalInteractionFromIconView:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a4, "location", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (SBIconLocationGroupContainsLocation())
  {
    v7 = v6;
  }
  else
  {
    if (!SBIconLocationGroupContainsLocation())
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "containerViewControllerForPresentingFromTodayViewControllerAllowingCoverSheet:", 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (id)iconManager:(id)a3 containerViewForModalInteractionFromIconView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[SBHomeScreenController iconManager:containerViewControllerForModalInteractionFromIconView:](self, "iconManager:containerViewControllerForModalInteractionFromIconView:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
    objc_msgSend(v5, "iconContentView");
  else
    objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)iconManager:(id)a3 homeScreenContentViewForModalInteractionFromIconView:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a4, "location", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!SBIconLocationGroupContainsLocation())
    goto LABEL_9;
  -[SBHomeScreenController coverSheetPresentationManager](self, "coverSheetPresentationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isVisible");

  if (v7)
    -[SBHomeScreenController coverSheetTodayViewController](self, "coverSheetTodayViewController");
  else
    -[SBHomeScreenController todayViewController](self, "todayViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_appearState") != 2 && objc_msgSend(v8, "_appearState") != 1)
  {

LABEL_9:
    -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[SBHomeScreenController todayViewController](self, "todayViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v10;
}

- (void)iconManager:(id)a3 iconView:(id)a4 configurationWillBeginWithInteraction:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SBFloatingDockBehaviorAssertion *v10;
  objc_class *v11;
  void *v12;
  SBFloatingDockBehaviorAssertion *v13;
  SBFloatingDockBehaviorAssertion *widgetConfigurationFloatingDockBehaviorAssertion;
  id v15;

  v15 = a5;
  -[SBHomeScreenController _iconController](self, "_iconController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "powerLogAggregator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emitEventOfType:", 1);

  if (!self->_widgetConfigurationFloatingDockBehaviorAssertion)
  {
    -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatingDockController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [SBFloatingDockBehaviorAssertion alloc];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:](v10, "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v9, 1, 1, 3, v12, 0, 0.0);
    widgetConfigurationFloatingDockBehaviorAssertion = self->_widgetConfigurationFloatingDockBehaviorAssertion;
    self->_widgetConfigurationFloatingDockBehaviorAssertion = v13;

  }
}

- (void)iconManager:(id)a3 iconView:(id)a4 configurationDidEndWithInteraction:(id)a5
{
  SBFloatingDockBehaviorAssertion *widgetConfigurationFloatingDockBehaviorAssertion;

  -[SBFloatingDockBehaviorAssertion invalidate](self->_widgetConfigurationFloatingDockBehaviorAssertion, "invalidate", a3, a4, a5);
  widgetConfigurationFloatingDockBehaviorAssertion = self->_widgetConfigurationFloatingDockBehaviorAssertion;
  self->_widgetConfigurationFloatingDockBehaviorAssertion = 0;

}

- (void)iconManager:(id)a3 modalInteractionWillBegin:(id)a4
{
  id v5;
  void *v6;
  SBFloatingDockBehaviorAssertion *v7;
  objc_class *v8;
  void *v9;
  SBFloatingDockBehaviorAssertion *v10;
  SBFloatingDockBehaviorAssertion *modalInteractionFloatingDockBehaviorAssertion;
  id v12;

  if (!self->_modalInteractionFloatingDockBehaviorAssertion)
  {
    v5 = a4;
    -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatingDockController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [SBFloatingDockBehaviorAssertion alloc];
    v8 = (objc_class *)objc_opt_class();

    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:](v7, "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v6, 1, 1, 3, v9, 0, 0.0);
    modalInteractionFloatingDockBehaviorAssertion = self->_modalInteractionFloatingDockBehaviorAssertion;
    self->_modalInteractionFloatingDockBehaviorAssertion = v10;

  }
}

- (void)iconManager:(id)a3 modalInteractionDidEnd:(id)a4
{
  SBFloatingDockBehaviorAssertion *modalInteractionFloatingDockBehaviorAssertion;

  -[SBFloatingDockBehaviorAssertion invalidate](self->_modalInteractionFloatingDockBehaviorAssertion, "invalidate", a3, a4);
  modalInteractionFloatingDockBehaviorAssertion = self->_modalInteractionFloatingDockBehaviorAssertion;
  self->_modalInteractionFloatingDockBehaviorAssertion = 0;

}

- (unint64_t)addWidgetSheetStyleForIconManager:(id)a3
{
  _BOOL4 v3;
  void *v4;

  if (__sb__runningInSpringBoard())
  {
    return SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "userInterfaceIdiom") == 1;

  }
  return v3;
}

- (void)iconManager:(id)a3 iconView:(id)a4 willUseContextMenuStyle:(id)a5
{
  double v6;
  double v7;
  void *v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  CGFloat v15;
  id v16;
  CGRect v17;
  CGRect v18;

  v16 = a5;
  -[SBHomeScreenController minimumHomeScreenScale](self, "minimumHomeScreenScale");
  v7 = v6;
  if (v6 != 1.0)
  {
    objc_msgSend(v16, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
    v13 = v7 + -1.0;
    v14 = (v7 + -1.0) * CGRectGetWidth(v17) * 0.5;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v15 = CGRectGetHeight(v18);
    objc_msgSend(v16, "setPreferredBackgroundInsets:", v13 * v15 * 0.5, v14, v13 * v15 * 0.5, v14);

  }
}

- (BOOL)iconManager:(id)a3 iconViewDisplaysCloseBox:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  int v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a4;
  objc_msgSend(v5, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported");
  v8 = objc_msgSend(v6, "isApplicationIcon");
  v9 = v8 && v7 || -[SBHomeScreenController isUninstallSupportedForIcon:](self, "isUninstallSupportedForIcon:", v6);
  objc_msgSend(v5, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatingDockController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isPresentingIconLocation:", v10))
  {
    v13 = objc_msgSend(v12, "shouldShowCloseBoxForIconView:proposedValue:", v5, v9);
LABEL_10:
    LOBYTE(v9) = v13;
    goto LABEL_11;
  }
  if (v8 && SBIconLocationGroupContainsLocation())
  {
    v13 = -[SBHomeScreenController isUninstallSupportedForIcon:](self, "isUninstallSupportedForIcon:", v6);
    goto LABEL_10;
  }
LABEL_11:

  return v9;
}

- (void)iconManager:(id)a3 wantsUninstallForIcon:(id)a4 location:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  SBRemoveWidgetAlertItem *v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v16;
  SBRemoveWidgetAlertItem *v17;
  void *v18;
  SBRemoveWidgetAlertItem *v19;
  __objc2_class *v20;
  SBHideAppIconAlertItem *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  SBHomeScreenController *v26;

  v7 = a4;
  v8 = a5;
  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatingDockController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "handlePromptingUserToUninstallIcon:location:", v7, v8) & 1) == 0)
  {
    if (objc_msgSend(v7, "isApplicationIcon"))
    {
      -[SBHomeScreenController applicationController](self, "applicationController");
      v11 = (SBRemoveWidgetAlertItem *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applicationBundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SBHomeScreenController isUninstallSupportedForIcon:](self, "isUninstallSupportedForIcon:", v7);
      if (v12)
      {
        v14 = v13;
        v15 = -[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported");
        if (v14)
        {
          if (v15)
            v16 = SBIconLocationGroupContainsLocation() ^ 1;
          else
            v16 = 0;
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __69__SBHomeScreenController_iconManager_wantsUninstallForIcon_location___block_invoke;
          v24[3] = &unk_1E8EA66B0;
          v25 = v7;
          v26 = self;
          -[SBRemoveWidgetAlertItem requestUninstallApplicationWithBundleIdentifier:options:withCompletion:](v11, "requestUninstallApplicationWithBundleIdentifier:options:withCompletion:", v12, v16, v24);

        }
        else if (v15)
        {
          v21 = -[SBHideAppIconAlertItem initWithIcon:location:]([SBHideAppIconAlertItem alloc], "initWithIcon:location:", v7, v8);
          -[SBAlertItem _setPreferredActivationWindowScene:](v21, "_setPreferredActivationWindowScene:", v9);
          -[SBHomeScreenController alertItemsController](self, "alertItemsController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "activateAlertItem:", v21);

        }
      }

    }
    else
    {
      if (objc_msgSend(v7, "isWidgetIcon"))
      {
        v17 = [SBRemoveWidgetAlertItem alloc];
        -[SBHomeScreenController iconManager](self, "iconManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[SBRemoveWidgetAlertItem initWithWidgetIcon:location:iconManager:](v17, "initWithWidgetIcon:location:iconManager:", v7, v8, v18);

        v19 = v11;
      }
      else
      {
        if (objc_msgSend(v7, "isFolderIcon"))
          v20 = SBHideFolderContentsAlertItem;
        else
          v20 = SBDeleteNonAppIconAlertItem;
        v19 = (SBRemoveWidgetAlertItem *)objc_msgSend([v20 alloc], "initWithIcon:location:", v7, v8);
        v11 = v19;
      }
      -[SBAlertItem _setPreferredActivationWindowScene:](v19, "_setPreferredActivationWindowScene:", v9);
      -[SBHomeScreenController alertItemsController](self, "alertItemsController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "activateAlertItem:", v11);

    }
  }

}

void __69__SBHomeScreenController_iconManager_wantsUninstallForIcon_location___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = v7;
  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isApplicationIcon"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setUninstalledByUser:", 1);
      objc_msgSend(*(id *)(a1 + 32), "cancelDownload");
    }
    objc_msgSend(*(id *)(a1 + 40), "iconManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__SBHomeScreenController_iconManager_wantsUninstallForIcon_location___block_invoke_2;
    v16[3] = &unk_1E8E9E980;
    v17 = v8;
    objc_msgSend(v9, "uninstallIcon:animate:completion:", v10, 1, v16);

    v11 = v17;
  }
  else
  {
    if (!a3)
    {
      objc_msgSend(v7, "invalidate");
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 40), "iconManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__SBHomeScreenController_iconManager_wantsUninstallForIcon_location___block_invoke_3;
    v14[3] = &unk_1E8E9E980;
    v15 = v8;
    objc_msgSend(v12, "addIconToIgnoredList:options:completion:", v13, 1, v14);

    v11 = v15;
  }

LABEL_9:
}

uint64_t __69__SBHomeScreenController_iconManager_wantsUninstallForIcon_location___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __69__SBHomeScreenController_iconManager_wantsUninstallForIcon_location___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (BOOL)iconManager:(id)a3 iconViewDisplaysLabel:(id)a4
{
  void *v4;
  BOOL v5;
  void *v6;

  objc_msgSend(a4, "icon", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isWidgetIcon"))
  {
    if (__sb__runningInSpringBoard())
    {
      v5 = SBFEffectiveDeviceClass() != 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "userInterfaceIdiom") != 1;

    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)iconManager:(id)a3 canBeginDragForIconView:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientOverlayPresentationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasActivePresentation");

  return v6 ^ 1;
}

- (BOOL)_dragSessionContainsAppClipWebClipIcon:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a3, "items", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "sbh_appDragLocalContext");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "uniqueIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHomeScreenController model](self, "model");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bookmarkIconForWebClipIdentifier:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "webClip");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isAppClip");

          if ((v15 & 1) != 0)
          {

            v16 = 1;
            goto LABEL_12;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (BOOL)iconManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5
{
  return !-[SBHomeScreenController _dragSessionContainsAppClipWebClipIcon:](self, "_dragSessionContainsAppClipWebClipIcon:", a4);
}

- (BOOL)iconManager:(id)a3 canAcceptDropInSession:(id)a4 inIconListView:(id)a5
{
  return !-[SBHomeScreenController _dragSessionContainsAppClipWebClipIcon:](self, "_dragSessionContainsAppClipWebClipIcon:", a4);
}

- (double)iconManager:(id)a3 additionalDragLiftScaleForIconView:(id)a4
{
  return 1.1;
}

- (int64_t)iconManager:(id)a3 draggingStartLocationForIconView:(id)a4 proposedStartLocation:(int64_t)a5
{
  void *v6;

  objc_msgSend(a4, "location", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions")))
    a5 = 7;

  return a5;
}

- (void)iconManager:(id)a3 iconDropSessionDidEnter:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;

  v5 = (void *)MEMORY[0x1E0CEA578];
  v6 = a4;
  objc_msgSend(v5, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionForDropSession:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "info");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "processIdentifier");
  if ((_DWORD)v7 != getpid())
  {
    v14 = 0u;
    v15 = 0u;
    if (v9)
      objc_msgSend(v9, "auditToken");
    v13[0] = v14;
    v13[1] = v15;
    objc_msgSend(MEMORY[0x1E0D016E0], "tokenFromAuditToken:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.springboard.app-drag")) & 1) == 0)
    {
      -[SBHomeScreenController iconManager](self, "iconManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cancelAllDrags");

      goto LABEL_8;
    }

  }
  +[SBDraggingSystemManager sharedInstance](SBDraggingSystemManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCommandeered:forDraggingSystemSession:forReason:", 1, v8, CFSTR("SBIconController-IconDrag"));

LABEL_8:
}

- (BOOL)shouldCommandeerContentDragsInLocation:(id)a3
{
  return SBIconLocationGroupContainsLocation();
}

- (void)iconManager:(id)a3 iconView:(id)a4 contentDropSessionDidEnter:(id)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(a4, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBHomeScreenController shouldCommandeerContentDragsInLocation:](self, "shouldCommandeerContentDragsInLocation:", v7))
  {
    +[SBDraggingSystemManager sharedInstance](SBDraggingSystemManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCommandeered:forDropSession:forReason:", 1, v9, CFSTR("SBIconController-ContentDrag"));

  }
}

- (void)iconManager:(id)a3 iconView:(id)a4 contentDropSessionDidExit:(id)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(a4, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBHomeScreenController shouldCommandeerContentDragsInLocation:](self, "shouldCommandeerContentDragsInLocation:", v7))
  {
    +[SBDraggingSystemManager sharedInstance](SBDraggingSystemManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCommandeered:forDropSession:forReason:", 0, v9, CFSTR("SBIconController-ContentDrag"));

  }
}

- (BOOL)shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:(id)a3
{
  return 1;
}

- (id)iconManager:(id)a3 backgroundViewForComponentsOfIconView:(id)a4
{
  SBWallpaperEffectView *v5;
  NSMutableSet *delayedStyleWallpaperEffectViews;
  uint64_t v7;

  if (-[SBHomeScreenController shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:](self, "shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:", a4))
  {
    v5 = 0;
  }
  else
  {
    v5 = -[SBWallpaperEffectView initWithWallpaperVariant:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:", 1);
    delayedStyleWallpaperEffectViews = self->_delayedStyleWallpaperEffectViews;
    if (delayedStyleWallpaperEffectViews)
    {
      -[NSMutableSet addObject:](delayedStyleWallpaperEffectViews, "addObject:", v5);
      v7 = 2;
    }
    else
    {
      v7 = 29;
    }
    -[PBUIWallpaperEffectViewBase setStyle:](v5, "setStyle:", v7);
  }
  return v5;
}

- (BOOL)iconManager:(id)a3 shouldContinueToUseBackgroundView:(id)a4 forComponentsOfIconView:(id)a5
{
  id v7;
  void *v8;
  char isKindOfClass;

  v7 = a4;
  LOBYTE(a5) = -[SBHomeScreenController shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:](self, "shouldUseLiveBlurForBackgroundViewForComponentsOfIconView:", a5);
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return (a5 ^ isKindOfClass) & 1;
}

- (BOOL)iconManager:(id)a3 supportsParallaxForIconView:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a4, "_sbWindowScene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMainDisplayWindowScene");

  return v5;
}

- (id)iconManager:(id)a3 screenSnapshotProviderForComponentsOfIconView:(id)a4
{
  id v6;
  id v7;
  SBHomeScreenController *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIView *screenSnapshotForIconViews;
  SBIconViewSnapshotProvider *v13;
  void *v14;
  SBIconViewSnapshotProvider *v15;
  NSMutableArray *outstandingSnapshotProviders;
  NSMutableArray *v17;
  NSMutableArray *v18;
  _QWORD v20[5];
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (v8->_screenSnapshotForIconViews)
    goto LABEL_3;
  objc_msgSend(v7, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "snapshotViewAfterScreenUpdates:", 0);
  v11 = objc_claimAutoreleasedReturnValue();
  screenSnapshotForIconViews = v8->_screenSnapshotForIconViews;
  v8->_screenSnapshotForIconViews = (UIView *)v11;

  if (v8->_screenSnapshotForIconViews)
  {
LABEL_3:
    objc_initWeak(&location, v8);
    v13 = [SBIconViewSnapshotProvider alloc];
    v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initAsCopyOf:", v8->_screenSnapshotForIconViews);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __84__SBHomeScreenController_iconManager_screenSnapshotProviderForComponentsOfIconView___block_invoke;
    v20[3] = &unk_1E8EA66D8;
    objc_copyWeak(&v21, &location);
    v20[4] = v8;
    v15 = -[SBIconViewSnapshotProvider initWithSnapshotView:invalidation:](v13, "initWithSnapshotView:invalidation:", v14, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    if (v15)
    {
      outstandingSnapshotProviders = v8->_outstandingSnapshotProviders;
      if (!outstandingSnapshotProviders)
      {
        v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v18 = v8->_outstandingSnapshotProviders;
        v8->_outstandingSnapshotProviders = v17;

        outstandingSnapshotProviders = v8->_outstandingSnapshotProviders;
      }
      -[NSMutableArray addObject:](outstandingSnapshotProviders, "addObject:", v15);
    }
  }
  else
  {
    v15 = 0;
  }
  objc_sync_exit(v8);

  return v15;
}

void __84__SBHomeScreenController_iconManager_screenSnapshotProviderForComponentsOfIconView___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (id *)WeakRetained;
    objc_sync_enter(v5);
    v6 = objc_msgSend(v5[43], "indexOfObject:", v10);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5[43], "removeObjectAtIndex:", v6);
    if (!objc_msgSend(v5[43], "count", v6))
    {
      v7 = v5[43];
      v5[43] = 0;

      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 336);
      *(_QWORD *)(v8 + 336) = 0;

    }
    objc_sync_exit(v5);

  }
}

- (id)recycledViewsContainerProviderForIconManager:(id)a3
{
  void *v3;
  void *v4;

  -[SBHomeScreenController userInterfaceController](self, "userInterfaceController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)iconManager:(id)a3 closeBoxTypeForIconView:(id)a4 proposedType:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  objc_msgSend(v7, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions")) & 1) != 0
    || (objc_msgSend(v8, "isWidgetIcon") & 1) != 0)
  {
    a5 = 1;
  }
  else if (-[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported"))
  {
    a5 = SBIconLocationGroupContainsLocation() ^ 1;
  }

  return a5;
}

- (BOOL)iconManager:(id)a3 allowsBadgingForIcon:(id)a4
{
  return -[SBHomeScreenController allowsBadgingForIcon:](self, "allowsBadgingForIcon:", a4);
}

- (BOOL)iconManager:(id)a3 allowsBadgingForIconLocation:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;

  v4 = a4;
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeScreenDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showsBadgesInAppLibrary");

  if ((v7 & 1) != 0 || !SBIconLocationGroupContainsLocation())
    v8 = 1;
  else
    v8 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAA968]);

  return v8;
}

- (BOOL)isFocusAllowedForIconManager:(id)a3
{
  BOOL v3;
  void *v4;

  if (__sb__runningInSpringBoard())
    return SBFEffectiveDeviceClass() == 2;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "userInterfaceIdiom") == 1;

  return v3;
}

- (unint64_t)iconManager:(id)a3 focusEffectTypeForIconView:(id)a4
{
  return 1;
}

- (id)iconManager:(id)a3 accessibilityTintColorForIconView:(id)a4
{
  void *v4;
  void *v5;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "averageColorForVariant:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)iconManagerCanBeginIconDrags:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  uint8_t v8[16];

  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInSetupMode");

  if (v5)
  {
    SBLogIconDragging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "disallowing icon drag because we are in setup mode", v8, 2u);
    }

  }
  return (-[SBHomeScreenController _disableEditingByDefaultDuringStaging]((uint64_t)self) | v5) ^ 1;
}

- (id)iconManager:(id)a3 dragPreviewForIconView:(id)a4
{
  id v4;
  SBAppPlatterDragPreview *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = a4;
  v5 = -[SBAppPlatterDragPreview initWithReferenceIconView:sourceView:]([SBAppPlatterDragPreview alloc], "initWithReferenceIconView:sourceView:", v4, 0);
  objc_msgSend(v4, "iconImageCenter");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:toView:", v10, v7, v9);
  v12 = v11;
  v14 = v13;

  -[SBAppPlatterDragPreview setCenter:](v5, "setCenter:", v12, v14);
  -[SBAppPlatterDragPreview setAlpha:](v5, "setAlpha:", 0.0);
  return v5;
}

- (id)windowForIconDragPreviewsForIconManager:(id)a3 forWindowScene:(id)a4
{
  void *v5;
  id v6;
  NSMapTable *v7;
  NSMapTable *windowSceneToMedusaDragWindowContext;
  uint64_t v9;
  void *v10;
  SBMedusaDragWindowContext *v11;
  void *v12;
  void *v13;
  SBIconDragPlatterWindow *v14;
  SBTraitsWindowParticipantDelegate *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;

  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a4;
  if ((objc_msgSend(v5, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBHomeScreenController windowForIconDragPreviewsForIconManager:forWindowScene:]");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("SBHomeScreenController.m"), 4979, CFSTR("this call must be made on the main thread"));

  }
  if (!self->_windowSceneToMedusaDragWindowContext)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    windowSceneToMedusaDragWindowContext = self->_windowSceneToMedusaDragWindowContext;
    self->_windowSceneToMedusaDragWindowContext = v7;

  }
  v9 = objc_opt_class();
  SBSafeCast(v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NSMapTable objectForKey:](self->_windowSceneToMedusaDragWindowContext, "objectForKey:", v10);
    v11 = (SBMedusaDragWindowContext *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  -[SBMedusaDragWindowContext dragWindow](v11, "dragWindow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && !v11)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB8]), "initWithNibName:bundle:", 0, 0);
    if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleMedusaDrag")))
    {
      v14 = -[SBWindow initWithWindowScene:rootViewController:role:debugName:]([SBIconDragPlatterWindow alloc], "initWithWindowScene:rootViewController:role:debugName:", v10, v13, CFSTR("SBTraitsParticipantRoleMedusaDrag"), CFSTR("Medusa Portal Source Window"));
    }
    else
    {
      v14 = -[SBMainScreenActiveInterfaceOrientationWindow initWithWindowScene:role:debugName:]([SBOldIconDragPlatterWindow alloc], "initWithWindowScene:role:debugName:", v10, CFSTR("SBTraitsParticipantRoleMedusaDrag"), CFSTR("Medusa Portal Source Window"));
      -[SBIconDragPlatterWindow setContentViewController:](v14, "setContentViewController:", v13);
    }

    v15 = objc_alloc_init(SBTraitsWindowParticipantDelegate);
    objc_msgSend(v10, "traitsArbiter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleMedusaDrag"), v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBTraitsWindowParticipantDelegate setParticipant:ownedByWindow:](v15, "setParticipant:ownedByWindow:", v17, v14);
    -[SBTraitsWindowParticipantDelegate windowDidUpdatePreferredWindowLevel:ownedParticipant:](v15, "windowDidUpdatePreferredWindowLevel:ownedParticipant:", v17, 1.79769313e308);
    -[SBTraitsWindowParticipantDelegate windowDidUpdateSupportedOrientations:ownedParticipant:](v15, "windowDidUpdateSupportedOrientations:ownedParticipant:", 30, v17);
    -[SBTraitsWindowParticipantDelegate windowWillBecomeVisible:ownedParticipant:](v15, "windowWillBecomeVisible:ownedParticipant:", v14, v17);
    objc_msgSend(v17, "setNeedsUpdatePreferencesWithReason:", CFSTR("Setup"));
    -[SBIconDragPlatterWindow setWindowLevel:](v14, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + -3.0 + -1.0);
    -[SBWindow setHidden:](v14, "setHidden:", 0);
    -[SBIconDragPlatterWindow setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 0);
    v11 = -[SBMedusaDragWindowContext initWithDragWindow:traitsParticipant:traitsParticipantDelegate:]([SBMedusaDragWindowContext alloc], "initWithDragWindow:traitsParticipant:traitsParticipantDelegate:", v14, v17, v15);
    -[NSMapTable setObject:forKey:](self->_windowSceneToMedusaDragWindowContext, "setObject:forKey:", v11, v10);

    v12 = v14;
  }

  return v12;
}

- (void)iconManagerIconDraggingDidChange:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "isIconDragging"))
    -[SBHomeScreenController _beginDisablingAllOrientationChangesForReason:](self, "_beginDisablingAllOrientationChangesForReason:", CFSTR("SBIconController Dragging"));
  else
    -[SBHomeScreenController _endDisablingAllOrientationChangesForReason:](self, "_endDisablingAllOrientationChangesForReason:", CFSTR("SBIconController Dragging"));
  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")))
  {
    -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsUpdateOfSupportedInterfaceOrientations");

  }
}

- (void)iconManager:(id)a3 willBeginIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSDate *v13;
  NSDate *iconDragSessionBeginDate;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0DABDE8];
  objc_msgSend(a4, "UUIDString", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v15[1] = *MEMORY[0x1E0DABDF0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DA9D78];
  v11 = v9;
  objc_msgSend(v10, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "emitEvent:withPayload:", 28, v11);

  if (!self->_iconDragSessionBeginDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    iconDragSessionBeginDate = self->_iconDragSessionBeginDate;
    self->_iconDragSessionBeginDate = v13;

  }
}

- (void)iconManager:(id)a3 didAddItemsToIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0DABDE8];
  objc_msgSend(a4, "UUIDString", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = *MEMORY[0x1E0DABDF0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DA9D78];
  v10 = v8;
  objc_msgSend(v9, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emitEvent:withPayload:", 29, v10);

}

- (void)iconManager:(id)a3 didEndIconDragWithUniqueIdentifier:(id)a4 numberOfDraggedItems:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSDate *iconDragSessionBeginDate;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0DABDE8];
  objc_msgSend(a4, "UUIDString", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  v19[1] = *MEMORY[0x1E0DABDF0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DA9D78];
  v11 = v9;
  objc_msgSend(v10, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "emitEvent:withPayload:", 30, v11);

  if (self->_iconDragSessionBeginDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", self->_iconDragSessionBeginDate);
    v15 = v14;

    iconDragSessionBeginDate = self->_iconDragSessionBeginDate;
    self->_iconDragSessionBeginDate = 0;

    -[SBHomeScreenController _iconController](self, "_iconController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "powerLogAggregator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "emitEventOfType:withDuration:", 2, v15);

  }
}

- (void)iconManager:(id)a3 didSpringLoadIconView:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = *MEMORY[0x1E0DABD88];
  v13[0] = &unk_1E91D2060;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a4;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DA9D78];
  v9 = v7;
  objc_msgSend(v8, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emitEvent:withPayload:", 31, v9);

  -[SBHomeScreenController iconDragManager](self, "iconDragManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performSpringLoadedInteractionForIconDragOnIconView:", v6);

}

- (id)iconManager:(id)a3 wantsToHideStatusBarForFolderController:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a5;
  v7 = a4;
  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statusBarManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBFolderController - %p"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v10, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", 1, 1, v11);
  if (v5)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
    objc_msgSend(v12, "acquireWithAnimationParameters:", v13);

  }
  else
  {
    objc_msgSend(v12, "acquire");
  }

  return v12;
}

- (id)iconManager:(id)a3 fakeStatusBarForFolderController:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reusePool");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getReusableStatusBarWithReason:", CFSTR("SBFolderController - Blurred Status Bar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)iconManager:(id)a3 statusBarStyleRequestForFolderController:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectiveStatusBarStyleRequestForLevel:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)iconManager:(id)a3 willRemoveFakeStatusBar:(id)a4 forFolderController:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "statusBarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reusePool");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recycleStatusBar:", v6);

}

- (UIEdgeInsets)iconManager:(id)a3 statusBarEdgeInsetsForFolderController:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
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
  double v18;
  UIEdgeInsets result;

  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBarEdgeInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (UIEdgeInsets)iconManager:(id)a3 contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a4
{
  void *v4;
  double v5;
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
  UIEdgeInsets result;

  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_contentOverlayInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)_setFolderDisplayLayoutElementActive:(BOOL)a3
{
  BSInvalidatable *folderDisplayLayoutAssertion;
  id v5;
  id WeakRetained;
  void *v7;
  BSInvalidatable *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  void *v11;

  folderDisplayLayoutAssertion = self->_folderDisplayLayoutAssertion;
  if (a3)
  {
    if (!folderDisplayLayoutAssertion)
    {
      v5 = objc_alloc(MEMORY[0x1E0DAAE30]);
      v11 = (void *)objc_msgSend(v5, "initWithIdentifier:", *MEMORY[0x1E0DAB670]);
      objc_msgSend(v11, "setLevel:", 0);
      objc_msgSend(v11, "setFillsDisplayBounds:", 1);
      objc_msgSend(v11, "setLayoutRole:", 6);
      WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
      objc_msgSend(WeakRetained, "displayLayoutPublisher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addElement:", v11);
      v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v9 = self->_folderDisplayLayoutAssertion;
      self->_folderDisplayLayoutAssertion = v8;

    }
  }
  else if (folderDisplayLayoutAssertion)
  {
    -[BSInvalidatable invalidate](folderDisplayLayoutAssertion, "invalidate");
    v10 = self->_folderDisplayLayoutAssertion;
    self->_folderDisplayLayoutAssertion = 0;

  }
}

- (void)_setWidgetEditingDisplayLayoutElementActive:(BOOL)a3
{
  BSInvalidatable *widgetEditingLayoutAssertion;
  id v5;
  id WeakRetained;
  void *v7;
  BSInvalidatable *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  void *v11;

  widgetEditingLayoutAssertion = self->_widgetEditingLayoutAssertion;
  if (a3)
  {
    if (!widgetEditingLayoutAssertion)
    {
      v5 = objc_alloc(MEMORY[0x1E0DAAE30]);
      v11 = (void *)objc_msgSend(v5, "initWithIdentifier:", *MEMORY[0x1E0DAB6B8]);
      objc_msgSend(v11, "setLevel:", 0);
      objc_msgSend(v11, "setFillsDisplayBounds:", 1);
      objc_msgSend(v11, "setLayoutRole:", 6);
      WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
      objc_msgSend(WeakRetained, "displayLayoutPublisher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addElement:", v11);
      v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v9 = self->_widgetEditingLayoutAssertion;
      self->_widgetEditingLayoutAssertion = v8;

    }
  }
  else if (widgetEditingLayoutAssertion)
  {
    -[BSInvalidatable invalidate](widgetEditingLayoutAssertion, "invalidate");
    v10 = self->_widgetEditingLayoutAssertion;
    self->_widgetEditingLayoutAssertion = 0;

  }
}

- (void)iconManager:(id)a3 willOpenFolder:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;

  v4 = a4;
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateReachability");

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReachabilityTemporarilyDisabled:forReason:", 1, CFSTR("Open Folder"));

  v7 = objc_msgSend(v4, "isLibraryCategoryFolder");
  SBLogTelemetrySignposts();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_enabled(v8);
  if (v7)
  {
    if (v9)
    {
      v13 = 0;
      v10 = "SB_HOME_DEWEY_POD_OPEN";
      v11 = (uint8_t *)&v13;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v10, " enableTelemetry=YES  isAnimation=YES ", v11, 2u);
    }
  }
  else if (v9)
  {
    v12 = 0;
    v10 = "SB_HOME_FOLDER_OPEN";
    v11 = (uint8_t *)&v12;
    goto LABEL_6;
  }

  kdebug_trace();
}

- (void)iconManager:(id)a3 didOpenFolder:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v5 = a4;
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReachabilityTemporarilyDisabled:forReason:", 0, CFSTR("Open Folder"));

  v7 = objc_msgSend(v5, "isLibraryCategoryFolder");
  SBLogTelemetrySignposts();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_enabled(v8);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_DEWEY_POD_OPEN", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
    }

    kdebug_trace();
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_FOLDER_OPEN", " enableTelemetry=YES  isAnimation=YES ", v13, 2u);
    }

    kdebug_trace();
    -[SBHomeScreenController _setFolderDisplayLayoutElementActive:](self, "_setFolderDisplayLayoutElementActive:", 1);
  }
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E0], "focusSystemForEnvironment:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusedItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v10, "setNeedsFocusUpdate");

}

- (void)iconManager:(id)a3 willCloseFolder:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;

  v4 = a4;
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateReachability");

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReachabilityTemporarilyDisabled:forReason:", 1, CFSTR("Close Folder"));

  v7 = objc_msgSend(v4, "isLibraryCategoryFolder");
  SBLogTelemetrySignposts();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_enabled(v8);
  if (v7)
  {
    if (v9)
    {
      v13 = 0;
      v10 = "SB_HOME_DEWEY_POD_CLOSE";
      v11 = (uint8_t *)&v13;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v10, " enableTelemetry=YES  isAnimation=YES ", v11, 2u);
    }
  }
  else if (v9)
  {
    v12 = 0;
    v10 = "SB_HOME_FOLDER_CLOSE";
    v11 = (uint8_t *)&v12;
    goto LABEL_6;
  }

  kdebug_trace();
}

- (void)iconManager:(id)a3 didCloseFolder:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v5 = a4;
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReachabilityTemporarilyDisabled:forReason:", 0, CFSTR("Close Folder"));

  v7 = objc_msgSend(v5, "isLibraryCategoryFolder");
  SBLogTelemetrySignposts();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_enabled(v8);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_DEWEY_POD_CLOSE", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
    }

    kdebug_trace();
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_FOLDER_CLOSE", " enableTelemetry=YES  isAnimation=YES ", v13, 2u);
    }

    kdebug_trace();
    -[SBHomeScreenController _setFolderDisplayLayoutElementActive:](self, "_setFolderDisplayLayoutElementActive:", 0);
  }
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E0], "focusSystemForEnvironment:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusedItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v10, "setNeedsFocusUpdate");

}

- (void)iconManagerFolderAnimatingDidChange:(id)a3
{
  void *v4;
  _QWORD block[5];

  if ((objc_msgSend(a3, "hasAnimatingFolder") & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SBHomeScreenController_iconManagerFolderAnimatingDidChange___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleHomeScreen")))
  {
    -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsUpdateOfSupportedInterfaceOrientations");

  }
}

void __62__SBHomeScreenController_iconManagerFolderAnimatingDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "userInterfaceController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_updateInterfaceOrientationFromActiveInterfaceOrientation");

}

- (void)iconManager:(id)a3 nestingViewController:(id)a4 willPerformOperation:(int64_t)a5 onViewController:(id)a6 withTransitionCoordinator:(id)a7
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;

  v10 = a4;
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = a7;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("SBTransitioningToOrFromFolder-<%@ %p>"), objc_opt_class(), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController userInterfaceController](self, "userInterfaceController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowIconRotation:forReason:", 0, v13);

  -[SBHomeScreenController _beginDisablingAllOrientationChangesForReason:](self, "_beginDisablingAllOrientationChangesForReason:", v13);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_10;
  v25[3] = &unk_1E8EA6840;
  v25[4] = self;
  v15 = v13;
  v26 = v15;
  objc_msgSend(v12, "animateAlongsideTransition:completion:", &__block_literal_global_415, v25);

  if (!+[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported"))
  {
    if (a5 != 1
      && (-[SBHomeScreenController _rootFolderController](self, "_rootFolderController"),
          v16 = (id)objc_claimAutoreleasedReturnValue(),
          v16,
          v16 == v10))
    {
      -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dockHeight");
      v19 = v22;

      v20 = 0.0;
      v17 = 0.0;
      v18 = 0.0;
    }
    else
    {
      v18 = *MEMORY[0x1E0CEB4B0];
      v17 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
      v19 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
      v20 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    }
    -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pictureInPictureManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "applyPictureInPictureInsets:forSource:", 1, v18, v17, v19, v20);

  }
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke()
{
  id *v0;
  uint64_t result;
  int v2;
  id v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  int v8;
  id v9;
  int v10;
  id v11;
  int v12;
  int v13;
  int v14;
  id v15;

  v0 = (id *)MEMORY[0x1E0CEB258];
  result = objc_msgSend((id)*MEMORY[0x1E0CEB258], "isRunningTest");
  if ((_DWORD)result)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
    v2 = objc_msgSend(*v0, "isRunningTest:", CFSTR("AppOpen"));
    v3 = *v0;
    if (v2)
    {
      objc_msgSend(v3, "finishedSubTest:forTest:", CFSTR("workspaceActivate"), CFSTR("AppOpen"));
      v4 = *v0;
      v5 = &__block_literal_global_419;
    }
    else
    {
      v6 = objc_msgSend(v3, "isRunningTest:", CFSTR("AppClose"));
      v7 = *v0;
      if (v6)
      {
        objc_msgSend(v7, "finishedSubTest:forTest:", CFSTR("workspaceDeactivate"), CFSTR("AppClose"));
        v4 = *v0;
        v5 = &__block_literal_global_422;
      }
      else
      {
        v8 = objc_msgSend(v7, "isRunningTest:", CFSTR("AppOpenInFolder"));
        v9 = *v0;
        if (v8)
        {
          objc_msgSend(v9, "finishedSubTest:forTest:", CFSTR("workspaceActivate"), CFSTR("AppOpenInFolder"));
          v4 = *v0;
          v5 = &__block_literal_global_423;
        }
        else
        {
          v10 = objc_msgSend(v9, "isRunningTest:", CFSTR("AppCloseInFolder"));
          v11 = *v0;
          if (v10)
          {
            objc_msgSend(v11, "finishedSubTest:forTest:", CFSTR("workspaceDeactivate"), CFSTR("AppCloseInFolder"));
            v4 = *v0;
            v5 = &__block_literal_global_424;
          }
          else
          {
            v12 = objc_msgSend(v11, "isRunningTest:", CFSTR("FolderOpen"));
            v4 = *v0;
            if (v12)
            {
              v5 = &__block_literal_global_425;
            }
            else
            {
              v13 = objc_msgSend(v4, "isRunningTest:", CFSTR("FolderClose"));
              v4 = *v0;
              if (v13)
              {
                v5 = &__block_literal_global_426;
              }
              else
              {
                v14 = objc_msgSend(v4, "isRunningTest:", CFSTR("AppOpenInScreenTime"));
                v15 = *v0;
                if (v14)
                {
                  objc_msgSend(v15, "finishedSubTest:forTest:", CFSTR("workspaceActivate"), CFSTR("AppOpenInScreenTime"));
                  v4 = *v0;
                  v5 = &__block_literal_global_427;
                }
                else
                {
                  result = objc_msgSend(v15, "isRunningTest:", CFSTR("AppCloseInScreenTime"));
                  if (!(_DWORD)result)
                    return result;
                  objc_msgSend(*v0, "finishedSubTest:forTest:", CFSTR("workspaceDeactivate"), CFSTR("AppCloseInScreenTime"));
                  v4 = *v0;
                  v5 = &__block_literal_global_428;
                }
              }
            }
          }
        }
      }
    }
    return objc_msgSend(v4, "installCACommitCompletionBlock:", v5);
  }
  return result;
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppOpenAnimation"), CFSTR("AppOpen"));
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_3()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppCloseAnimation"), CFSTR("AppClose"));
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_4()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppOpenAnimation"), CFSTR("AppOpenInFolder"));
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_5()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppCloseAnimation"), CFSTR("AppCloseInFolder"));
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_6()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("FolderOpenAnimation"), CFSTR("FolderOpen"));
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_7()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("FolderCloseAnimation"), CFSTR("FolderClose"));
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_8()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppOpenAnimation"), CFSTR("AppOpenInScreenTime"));
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_9()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppCloseAnimation"), CFSTR("AppCloseInScreenTime"));
}

uint64_t __124__SBHomeScreenController_iconManager_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_10(uint64_t a1)
{
  void *v2;
  id *v3;
  uint64_t result;
  const __CFString *v5;
  int v6;
  id v7;
  __CFString **v8;
  int v9;
  int v10;
  int v11;
  const __CFString *v12;
  int v13;
  id v14;
  __CFString **v15;
  int v16;
  int v17;

  objc_msgSend(*(id *)(a1 + 32), "userInterfaceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowIconRotation:forReason:", 1, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "_endDisablingAllOrientationChangesForReason:", *(_QWORD *)(a1 + 40));
  v3 = (id *)MEMORY[0x1E0CEB258];
  result = objc_msgSend((id)*MEMORY[0x1E0CEB258], "isRunningTest");
  if ((_DWORD)result)
  {
    v5 = CFSTR("AppOpen");
    v6 = objc_msgSend(*v3, "isRunningTest:", CFSTR("AppOpen"));
    v7 = *v3;
    if (v6)
    {
LABEL_3:
      v8 = __PPTAppOpenAnimationSubTestName;
      return objc_msgSend(v7, "finishedSubTest:forTest:", *v8, v5);
    }
    v5 = CFSTR("AppClose");
    v9 = objc_msgSend(v7, "isRunningTest:", CFSTR("AppClose"));
    v7 = *v3;
    if (v9)
      goto LABEL_5;
    v5 = CFSTR("AppOpenInFolder");
    v10 = objc_msgSend(v7, "isRunningTest:", CFSTR("AppOpenInFolder"));
    v7 = *v3;
    if (v10)
      goto LABEL_3;
    v5 = CFSTR("AppCloseInFolder");
    v11 = objc_msgSend(v7, "isRunningTest:", CFSTR("AppCloseInFolder"));
    v7 = *v3;
    if (v11)
    {
LABEL_5:
      v8 = __PPTAppCloseAnimationSubTestName;
      return objc_msgSend(v7, "finishedSubTest:forTest:", *v8, v5);
    }
    v12 = CFSTR("FolderOpen");
    v13 = objc_msgSend(v7, "isRunningTest:", CFSTR("FolderOpen"));
    v14 = *v3;
    if (v13)
    {
      v15 = __PPTFolderOpenAnimationSubTestName;
LABEL_13:
      objc_msgSend(v14, "finishedSubTest:forTest:", *v15, v12);
      return objc_msgSend(*v3, "finishedTest:", v12);
    }
    v12 = CFSTR("FolderClose");
    v16 = objc_msgSend(v14, "isRunningTest:", CFSTR("FolderClose"));
    v14 = *v3;
    if (v16)
    {
      v15 = __PPTFolderCloseAnimationSubTestName;
      goto LABEL_13;
    }
    v5 = CFSTR("AppOpenInScreenTime");
    v17 = objc_msgSend(v14, "isRunningTest:", CFSTR("AppOpenInScreenTime"));
    v7 = *v3;
    if (v17)
      goto LABEL_3;
    v5 = CFSTR("AppCloseInScreenTime");
    result = objc_msgSend(v7, "isRunningTest:", CFSTR("AppCloseInScreenTime"));
    if ((_DWORD)result)
    {
      v7 = *v3;
      goto LABEL_5;
    }
  }
  return result;
}

- (BOOL)iconManagerCanSaveIconState:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBHomeScreenController _iconController](self, "_iconController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "iconManagerCanSaveIconState:", v4);

  return v6;
}

- (void)iconManagerDidSaveIconState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHomeScreenController _iconController](self, "_iconController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconManagerDidSaveIconState:", v4);

}

- (id)iconManager:(id)a3 animator:(id)a4 animationSettingsForOperation:(unint64_t)a5 childViewController:(id)a6
{
  return -[SBHomeScreenController animator:animationSettingsForOperation:childViewController:](self, "animator:animationSettingsForOperation:childViewController:", a4, a5, a6);
}

- (id)iconManager:(id)a3 accessibilityTintColorForScreenRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "averageColorInRect:forVariant:", 1, x, y, width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isFloatingDockSupportedForIconManager:(id)a3
{
  return +[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported", a3);
}

- (BOOL)isFloatingDockVisibleForIconManager:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatingDockController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFloatingDockPresented");

  return v5;
}

- (void)presentTodayOverlayForIconManager:(id)a3
{
  id v4;

  if (-[SBHomeScreenController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled", a3))
  {
    -[SBHomeScreenController iconManager](self, "iconManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentLeadingCustomViewWithCompletion:", 0);
  }
  else
  {
    -[SBHomeScreenController _homeScreenOverlayControllerIfNeeded](self, "_homeScreenOverlayControllerIfNeeded");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentAnimated:fromLeading:", 1, 1);
  }

}

- (void)presentLibraryForIconManager:(id)a3 windowScene:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v5 = a5;
  v14 = a4;
  v7 = -[SBHomeScreenController isAppLibraryAllowed](self, "isAppLibraryAllowed");
  v8 = v14;
  if (v7)
  {
    if (-[SBHomeScreenController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
    {
      v9 = objc_opt_class();
      v10 = v14;
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

      objc_msgSend(v12, "modalLibraryController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v13, "isPresentingLibraryInForeground") & 1) == 0)
        objc_msgSend(v13, "toggleLibraryPresentedAnimated:completion:", v5, 0);

    }
    else
    {
      -[SBHomeScreenController presentLibraryFromOverlayControllerAnimated:completion:](self, "presentLibraryFromOverlayControllerAnimated:completion:", v5, 0);
    }
    v8 = v14;
  }

}

- (void)presentLibraryFromOverlayControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v4 = a3;
  v6 = a4;
  if (-[SBHomeScreenController isAppLibraryAllowed](self, "isAppLibraryAllowed"))
  {
    -[SBHomeScreenController _homeScreenOverlayControllerIfNeeded](self, "_homeScreenOverlayControllerIfNeeded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isPresented")
      || (objc_msgSend(v7, "activeSidebarViewController"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "trailingSidebarViewController"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v8 == v9))
    {
      if (!-[SBHomeScreenController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
      {
        objc_msgSend(v7, "presentAnimated:fromLeading:completionHandler:", v4, 0, v6);
        goto LABEL_11;
      }
      -[SBHomeScreenController iconManager](self, "iconManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __81__SBHomeScreenController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke_2;
      v12[3] = &unk_1E8E9E8D0;
      v13 = v6;
      objc_msgSend(v11, "presentTrailingCustomViewWithCompletion:", v12);

      v10 = v13;
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __81__SBHomeScreenController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke;
      v14[3] = &unk_1E8EA6868;
      v15 = v7;
      v17 = v4;
      v16 = v6;
      objc_msgSend(v15, "dismissAnimated:completionHandler:", v4, v14);

      v10 = v15;
    }

LABEL_11:
    goto LABEL_12;
  }
  if (v6)
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
LABEL_12:

}

uint64_t __81__SBHomeScreenController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentAnimated:fromLeading:completionHandler:", *(unsigned __int8 *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
}

uint64_t __81__SBHomeScreenController_presentLibraryFromOverlayControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  SBLibraryViewController *v10;
  uint64_t v11;
  id v12;
  SBLibraryViewController *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  SBLibraryViewController *v23;
  id v24;
  BOOL v25;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = self->_overlayLibraryViewController;
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __114__SBHomeScreenController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke;
  v21[3] = &unk_1E8EA0DF8;
  v25 = v6;
  v21[4] = self;
  v22 = v8;
  v23 = v10;
  v24 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  v15 = (void *)MEMORY[0x1D17E5550](v21);
  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "lastIconPageIndex");
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __114__SBHomeScreenController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_3;
  v19[3] = &unk_1E8E9E8D0;
  v20 = v15;
  v18 = v15;
  objc_msgSend(v16, "setCurrentPageIndex:animated:completion:", v17, v6, v19);

}

void __114__SBHomeScreenController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  char v8;

  v2 = *(unsigned __int8 *)(a1 + 64);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __114__SBHomeScreenController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_2;
  v4[3] = &unk_1E8EA0470;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v8 = *(_BYTE *)(a1 + 64);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "presentLibraryFromOverlayControllerAnimated:completion:", v2, v4);

}

void __114__SBHomeScreenController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 40), "presentPodWithCategoryIdentifier:animated:completion:", v2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
    }
    else
    {
      v4 = *(_QWORD *)(a1 + 48);
      if (v4)
        (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
    }
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
    {
      SBHLibraryPresentationErrorForCode();
      v5 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

    }
  }
}

uint64_t __114__SBHomeScreenController_presentLibraryCategoryPodFromOverlayControllerForCategoryIdentifier_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v6 = a4;
  if (-[SBHomeScreenController _isCoplanarHomeScreenEnabled](self, "_isCoplanarHomeScreenEnabled"))
  {
    if (-[SBHomeScreenController isMainDisplayLibraryViewVisible](self, "isMainDisplayLibraryViewVisible"))
    {
      -[SBHomeScreenController iconManager](self, "iconManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __60__SBHomeScreenController_dismissLibraryAnimated_completion___block_invoke;
      v8[3] = &unk_1E8E9E8D0;
      v9 = v6;
      objc_msgSend(v7, "animateToDefaultStateWithCompletionHandler:", v8);

    }
    else if (v6)
    {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }
  }
  else
  {
    -[SBHomeScreenController dismissLibraryFromOverlayControllerAnimated:completion:](self, "dismissLibraryFromOverlayControllerAnimated:completion:", v4, v6);
  }

}

uint64_t __60__SBHomeScreenController_dismissLibraryAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)dismissLibraryFromOverlayControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  SBLibraryViewController *v7;
  SBLibraryViewController *overlayLibraryViewController;
  void (**v9)(id, uint64_t);
  void (**v10)(id, uint64_t);

  v4 = a3;
  v10 = (void (**)(id, uint64_t))a4;
  if (-[SBHomeScreenController isAppLibraryAllowed](self, "isAppLibraryAllowed"))
  {
    -[SBHomeScreenController _homeScreenOverlayControllerIfNeeded](self, "_homeScreenOverlayControllerIfNeeded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBHomeScreenController isMainDisplayLibraryViewVisible](self, "isMainDisplayLibraryViewVisible")
      && (objc_msgSend(v6, "activeSidebarViewController"),
          v7 = (SBLibraryViewController *)objc_claimAutoreleasedReturnValue(),
          overlayLibraryViewController = self->_overlayLibraryViewController,
          v7,
          v7 == overlayLibraryViewController))
    {
      -[SBHomeScreenController dismissHomeScreenOverlayControllerAnimated:completion:](self, "dismissHomeScreenOverlayControllerAnimated:completion:", v4, v10);
    }
    else if (v10)
    {
      v10[2](v10, 1);
    }

    goto LABEL_10;
  }
  v9 = v10;
  if (v10)
  {
    v10[2](v10, 0);
LABEL_10:
    v9 = v10;
  }

}

- (id)_libraryViewControllers
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  SBLibraryViewController *overlayLibraryViewController;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[SBHomeScreenController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend((id)SBApp, "windowSceneManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "connectedWindowScenes", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "modalLibraryController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "libraryViewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            objc_msgSend(v3, "addObject:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    if (self->_overlayLibraryViewController)
    {
      overlayLibraryViewController = self->_overlayLibraryViewController;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &overlayLibraryViewController, 1);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = (id)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (BOOL)isMainDisplayLibraryViewVisible
{
  void *v2;
  char v3;

  -[SBHomeScreenController iconManager](self, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMainDisplayLibraryViewVisible");

  return v3;
}

- (BOOL)isTodayOverlayPresented
{
  void *v2;
  char v3;

  -[SBHomeScreenController iconManager](self, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOverlayTodayViewVisible");

  return v3;
}

- (void)dismissTodayOverlayForIconManager:(id)a3
{
  -[SBHomeScreenController dismissTodayOverlayAnimated:](self, "dismissTodayOverlayAnimated:", 1);
}

- (void)dismissLibraryForIconManager:(id)a3 windowScene:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a4;
  if (-[SBHomeScreenController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
  {
    v7 = objc_opt_class();
    v8 = v12;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    objc_msgSend(v10, "modalLibraryController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "dismissLibraryAnimated:completion:", v5, 0);
  }
  else
  {
    -[SBHomeScreenController dismissLibraryAnimated:completion:](self, "dismissLibraryAnimated:completion:", v5, 0);
  }

}

- (void)dismissOverlaysForIconManager:(id)a3
{
  -[SBHomeScreenController dismissHomeScreenOverlaysAnimated:](self, "dismissHomeScreenOverlaysAnimated:", 1);
}

- (unint64_t)maximumListCountForFoldersForIconManager:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maxIconListCount");

  if (v5 - 1 >= 0xE)
    return 15;
  else
    return v5;
}

- (BOOL)listsAllowRotatedLayoutForIconManager:(id)a3
{
  return objc_msgSend((id)SBApp, "homeScreenRotationStyle", a3) == 1;
}

- (void)iconManagerDidNoteIconStateChangedExternally:(id)a3
{
  id v4;

  v4 = a3;
  -[SBHomeScreenController dismissAppIconForceTouchControllers:](self, "dismissAppIconForceTouchControllers:", 0);
  objc_msgSend(v4, "dismissIconShareSheets");

}

- (void)iconManager:(id)a3 rootFolderController:(id)a4 willUseTransitionContext:(id)a5 toTransitionToState:(int64_t)a6
{
  uint64_t v9;
  id v10;

  v10 = a5;
  v9 = objc_msgSend(a4, "pageState");
  if (a6 == 2 && v9 == 3)
    -[SBTodayViewController setTransitionContext:](self->_todayViewController, "setTransitionContext:", v10);

}

- (id)iconManager:(id)a3 configurationDataForDataSource:(id)a4 ofIcon:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBHomeScreenController _iconController](self, "_iconController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconManager:configurationDataForDataSource:ofIcon:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)iconManager:(id)a3 dataSource:(id)a4 ofIcon:(id)a5 didUpdateConfigurationData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[SBHomeScreenController _iconController](self, "_iconController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "iconManager:dataSource:ofIcon:didUpdateConfigurationData:", v13, v12, v11, v10);

}

- (void)iconManager:(id)a3 didRemoveConfigurableDataSource:(id)a4 ofIcon:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBHomeScreenController _iconController](self, "_iconController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconManager:didRemoveConfigurableDataSource:ofIcon:", v10, v9, v8);

}

- (void)iconManager:(id)a3 prepareForPageHidingEducationWithCompletionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBHomeScreenController homeScreenOverlayController](self, "homeScreenOverlayController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissAnimated:completionHandler:", 1, v5);

}

- (void)iconManager:(id)a3 willPresentPageManagementWithLayoutManager:(id)a4 animator:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  void *v10;
  SBDisableActiveInterfaceOrientationChangeAssertion *v11;
  void *v12;
  void *v13;
  SBFloatingDockBehaviorAssertion *v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a6;
  objc_msgSend((id)SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", CFSTR("SBIconControllerDisableRotationForPageHidingReason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("SBIconControllerPreventDeviceOrientationChangesForPageHiding"));
  v11 = -[SBDisableActiveInterfaceOrientationChangeAssertion initWithReason:nudgeOrientationOnInvalidate:]([SBDisableActiveInterfaceOrientationChangeAssertion alloc], "initWithReason:nudgeOrientationOnInvalidate:", CFSTR("SBIconControllerDisableRotationForPageHidingReason"), 0);
  if (v11)
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("SBIconControllerPreventActiveInterfaceOrientationChangesForPageHiding"));
  -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatingDockController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v13, 1, 0, 1, CFSTR("pageManagement"), 0, 0.0);
  if (v14)
    objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("SBIconControllerPageHidingFloatingDockBehaviorAssertion"));
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__SBHomeScreenController_iconManager_willPresentPageManagementWithLayoutManager_animator_context___block_invoke;
  v18[3] = &unk_1E8E9DED8;
  v19 = v9;
  v15 = v9;
  v16 = MEMORY[0x1D17E5550](v18);
  v17 = (void *)v16;
  if (v8)
    objc_msgSend(v8, "addAnimations:", v16);
  else
    (*(void (**)(uint64_t))(v16 + 16))(v16);

}

void __98__SBHomeScreenController_iconManager_willPresentPageManagementWithLayoutManager_animator_context___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  id v4;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumHomescreenWallpaperScale");
  objc_msgSend(v4, "setHomescreenWallpaperScale:withAnimationFactory:", 0, fmax(v2, 0.8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, CFSTR("SBIconControllerChangeWallpaperScaleForPageHiding"));

}

- (void)iconManager:(id)a3 willDismissPageManagementUsingAnimator:(id)a4 context:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a5;
  objc_msgSend(v7, "objectForKey:", CFSTR("SBIconControllerChangeWallpaperScaleForPageHiding"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("SBIconControllerChangeWallpaperScaleForPageHiding"));
  objc_msgSend(v7, "objectForKey:", CFSTR("SBIconControllerPageHidingFloatingDockBehaviorAssertion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "invalidate");
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("SBIconControllerPageHidingFloatingDockBehaviorAssertion"));
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__SBHomeScreenController_iconManager_willDismissPageManagementUsingAnimator_context___block_invoke;
  v14[3] = &unk_1E8E9DED8;
  v15 = v8;
  v11 = v8;
  v12 = MEMORY[0x1D17E5550](v14);
  v13 = (void *)v12;
  if (v6)
    objc_msgSend(v6, "addAnimations:", v12);
  else
    (*(void (**)(uint64_t))(v12 + 16))(v12);

}

uint64_t __85__SBHomeScreenController_iconManager_willDismissPageManagementUsingAnimator_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)iconManager:(id)a3 didDismissPageManagementWithLayoutManager:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a5;
  objc_msgSend(v6, "objectForKey:", CFSTR("SBIconControllerPreventDeviceOrientationChangesForPageHiding"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("SBIconControllerPreventDeviceOrientationChangesForPageHiding"));
  objc_msgSend(v6, "objectForKey:", CFSTR("SBIconControllerPreventActiveInterfaceOrientationChangesForPageHiding"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("SBIconControllerPreventActiveInterfaceOrientationChangesForPageHiding"));

  objc_msgSend(v11, "completionURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    SBWorkspaceActivateApplicationFromURL(v9, 0, 0);
    objc_msgSend(v11, "setCompletionURL:", 0);
  }

}

- (void)iconManagerWillPresentWidgetEditing:(id)a3
{
  void *v4;
  void *v5;
  SBFloatingDockBehaviorAssertion *v6;
  SBFloatingDockBehaviorAssertion *addWidgetSheetFloatingDockBehaviorAssertion;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BSInvalidatable *v14;
  BSInvalidatable *addWidgetSheetKeyboardFocusAssertion;

  if (!self->_addWidgetSheetFloatingDockBehaviorAssertion)
  {
    -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatingDockController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v5, 1, 1, 3, CFSTR("addWidgetSheet"), 0, 0.0);
    addWidgetSheetFloatingDockBehaviorAssertion = self->_addWidgetSheetFloatingDockBehaviorAssertion;
    self->_addWidgetSheetFloatingDockBehaviorAssertion = v6;

    -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_addWidgetSheetKeyboardFocusAssertion)
    {
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "keyboardFocusController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBKeyboardFocusLockReason addWidgetSheet](SBKeyboardFocusLockReason, "addWidgetSheet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "focusLockSpringBoardWindow:forReason:", v10, v13);
      v14 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      addWidgetSheetKeyboardFocusAssertion = self->_addWidgetSheetKeyboardFocusAssertion;
      self->_addWidgetSheetKeyboardFocusAssertion = v14;

    }
    if ((objc_msgSend(v10, "isKeyWindow") & 1) == 0)
      objc_msgSend(v10, "makeKeyWindow");

  }
  -[SBBarSwipeAffordanceViewController setWantsToBeActiveAffordance:](self->_widgetAddSheetAffordanceViewController, "setWantsToBeActiveAffordance:", 1);
  -[SBHomeScreenController _setWidgetEditingDisplayLayoutElementActive:](self, "_setWidgetEditingDisplayLayoutElementActive:", 1);
}

- (void)iconManagerDidDismissWidgetEditing:(id)a3
{
  SBFloatingDockBehaviorAssertion *addWidgetSheetFloatingDockBehaviorAssertion;
  BSInvalidatable *addWidgetSheetKeyboardFocusAssertion;
  BSInvalidatable *v6;

  -[SBFloatingDockBehaviorAssertion invalidate](self->_addWidgetSheetFloatingDockBehaviorAssertion, "invalidate", a3);
  addWidgetSheetFloatingDockBehaviorAssertion = self->_addWidgetSheetFloatingDockBehaviorAssertion;
  self->_addWidgetSheetFloatingDockBehaviorAssertion = 0;

  -[SBHomeScreenController _setWidgetEditingDisplayLayoutElementActive:](self, "_setWidgetEditingDisplayLayoutElementActive:", 0);
  -[SBBarSwipeAffordanceViewController setWantsToBeActiveAffordance:](self->_widgetAddSheetAffordanceViewController, "setWantsToBeActiveAffordance:", 0);
  addWidgetSheetKeyboardFocusAssertion = self->_addWidgetSheetKeyboardFocusAssertion;
  if (addWidgetSheetKeyboardFocusAssertion)
  {
    -[BSInvalidatable invalidate](addWidgetSheetKeyboardFocusAssertion, "invalidate");
    v6 = self->_addWidgetSheetKeyboardFocusAssertion;
    self->_addWidgetSheetKeyboardFocusAssertion = 0;

  }
}

- (void)iconManagerWillAnimateWidgetInsertion:(id)a3
{
  void *v3;
  id v4;

  -[SBHomeScreenController _iconController](self, "_iconController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "powerLogAggregator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emitEventOfType:", 0);

}

- (BOOL)iconManager:(id)a3 canAddIconToIgnoredList:(id)a4
{
  return objc_msgSend(a4, "isApplicationIcon", a3);
}

- (BOOL)iconManager:(id)a3 shouldPlaceIconOnIgnoredList:(id)a4
{
  void *v4;
  char v5;

  -[SBHomeScreenController _iconController](self, "_iconController", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldAddNewIconsToRootFolder") ^ 1;

  return v5;
}

- (BOOL)iconManager:(id)a3 isWidgetValid:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  SBLogWidgetDiscoverability();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "containerBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[ContainerBundleIdentifier debugging] checking widget = %@", (uint8_t *)&v12, 0xCu);

  }
  -[SBHomeScreenController _iconController](self, "_iconController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "_isWidgetWithContainerBundleIdentifierValid:", v9);

  return v10;
}

- (BOOL)iconManager:(id)a3 isCustomElementValid:(id)a4
{
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a4, "containerBundleIdentifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBHomeScreenController _iconController](self, "_iconController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_isWidgetWithContainerBundleIdentifierValid:", v5);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)canAppPredictionsWidgetAlignWithGrid
{
  BOOL v2;
  void *v3;

  if (__sb__runningInSpringBoard())
  {
    v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  }
  return !v2;
}

- (BOOL)iconManager:(id)a3 canCustomElementAlignWithGrid:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;

  v5 = a4;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0
      || -[SBHomeScreenController canAppPredictionsWidgetAlignWithGrid](self, "canAppPredictionsWidgetAlignWithGrid");
}

- (BOOL)iconManager:(id)a3 canAddIcon:(id)a4 toIconList:(id)a5 inFolder:(id)a6
{
  return 1;
}

- (void)iconManager:(id)a3 prepareAddSheetViewController:(id)a4
{
  id v5;
  SBBarSwipeAffordanceViewController *widgetAddSheetAffordanceViewController;
  void *v7;
  SBBarSwipeAffordanceViewController *v8;
  SBBarSwipeAffordanceViewController *v9;
  SBBarSwipeAffordanceViewController *v10;
  void *v11;
  id v12;

  v5 = a4;
  widgetAddSheetAffordanceViewController = self->_widgetAddSheetAffordanceViewController;
  v12 = v5;
  if (!widgetAddSheetAffordanceViewController)
  {
    -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBBarSwipeAffordanceViewController initWithZStackParticipantIdentifier:windowScene:]([SBBarSwipeAffordanceViewController alloc], "initWithZStackParticipantIdentifier:windowScene:", 6, v7);
    v9 = self->_widgetAddSheetAffordanceViewController;
    self->_widgetAddSheetAffordanceViewController = v8;
    v10 = v8;

    -[SBBarSwipeAffordanceViewController view](v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObserver:", self);
    objc_msgSend(v11, "setDelegate:", self);
    objc_msgSend(v11, "setHomeAffordanceHidden:", 1);

    v5 = v12;
    widgetAddSheetAffordanceViewController = self->_widgetAddSheetAffordanceViewController;
  }
  objc_msgSend(v5, "setBarSwipeViewController:", widgetAddSheetAffordanceViewController);

}

- (void)iconManager:(id)a3 displayFeatureIntroductionItem:(id)a4 atLocation:(unint64_t)a5
{
  -[SBHomeScreenController displayFeatureIntroductionItem:atLocation:](self, "displayFeatureIntroductionItem:atLocation:", a4, a5);
}

- (void)iconManager:(id)a3 displayFeatureIntroductionItemIfUnlocked:(id)a4
{
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "featureIntroductionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addFeatureIntroductionItem:atLocations:", v9, 4);
  -[SBHomeScreenController lockScreenManager](self, "lockScreenManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isUILocked");

  if ((v8 & 1) == 0)
    -[SBHomeScreenController displayFeatureIntroductionItem:atLocation:](self, "displayFeatureIntroductionItem:atLocation:", v9, 4);

}

- (id)iconManager:(id)a3 floatingDockViewControllerForView:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a4, "_sbWindowScene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingDockController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatingDockViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)iconManager:(id)a3 floatingDockViewControllerForViewController:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a4, "_sbWindowScene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingDockController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatingDockViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)iconManager:(id)a3 isEditingAllowedForIconView:(id)a4
{
  id v5;
  char v6;
  void *v7;

  v5 = a4;
  if ((-[SBHomeScreenController _disableEditingByDefaultDuringStaging]((uint64_t)self) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "_sbWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isContinuityDisplayWindowScene") & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(v7, "isMainDisplayWindowScene");

  }
  return v6;
}

- (id)iconManager:(id)a3 widgetDataSourceForReplacingIconWithWidget:(id)a4 proposedWidgetDataSource:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v9)
  {
    if (objc_msgSend(v8, "isApplicationIcon"))
    {
      objc_msgSend(v8, "applicationBundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
      {
        objc_msgSend(v7, "widgetExtensionProvider");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sbh_defaultDescriptorForContainerBundleIdentifier:", CFSTR("com.apple.PeopleViewService"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "sbh_iconDataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)iconManager:(id)a3 applicationIconForReplacingIconWithAppIcon:(id)a4 proposedApplicationIcon:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (!v8)
  {
    if (objc_msgSend(v7, "isWidgetIcon") && (objc_msgSend(v7, "isWidgetStackIcon") & 1) == 0)
    {
      objc_msgSend(v7, "activeWidget");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "containerBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "extensionBundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "kind");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.PeopleViewService"))
        && objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.PeopleViewService.PeopleWidget-iOS"))
        && objc_msgSend(v13, "isEqualToString:", CFSTR("SingleContactWidget_iOS")))
      {
        -[SBHomeScreenController model](self, "model");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "applicationIconForBundleIdentifier:", CFSTR("com.apple.MobileAddressBook"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)iconManager:(id)a3 willChangeSizeOfIcon:(id)a4 toSizeClass:(id)a5 byReplacingWithIcon:(id)a6
{
  -[SBHomeScreenController _beginDisablingAllOrientationChangesForReason:](self, "_beginDisablingAllOrientationChangesForReason:", CFSTR("ChangeSizeOfIcon"), a4, a5, a6);
}

- (void)iconManager:(id)a3 didChangeSizeOfIcon:(id)a4 toSizeClass:(id)a5 byReplacingWithIcon:(id)a6
{
  -[SBHomeScreenController _endDisablingAllOrientationChangesForReason:](self, "_endDisablingAllOrientationChangesForReason:", CFSTR("ChangeSizeOfIcon"), a4, a5, a6);
}

- (void)iconManagerToggleHomeScreenWallpaperDimming:(id)a3
{
  -[SBWallpaperIconStyleCoordinator setWallpaperDimmed:](self->_iconStyleCoordinator, "setWallpaperDimmed:", -[SBWallpaperIconStyleCoordinator isWallpaperDimmed](self->_iconStyleCoordinator, "isWallpaperDimmed", a3) ^ 1);
}

- (BOOL)isHomeScreenWallpaperDimmedForIconManager:(id)a3
{
  return -[SBWallpaperIconStyleCoordinator isWallpaperDimmed](self->_iconStyleCoordinator, "isWallpaperDimmed", a3);
}

- (id)iconManager:(id)a3 containerBundleIdentifierForDescriptor:(id)a4
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v4 = a4;
  objc_msgSend(v4, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerBundleIdentifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "extensionIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "extensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("com.apple.Health.Sleep"))
    && objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Health.Sleep.SleepWidgetExtension")))
  {

    v6 = CFSTR("com.apple.Health");
  }

  return v6;
}

- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  SBBarSwipeAffordanceViewController *widgetAddSheetAffordanceViewController;
  id v6;
  id v7;

  widgetAddSheetAffordanceViewController = self->_widgetAddSheetAffordanceViewController;
  v6 = a3;
  -[SBBarSwipeAffordanceViewController barSwipeAffordanceView](widgetAddSheetAffordanceViewController, "barSwipeAffordanceView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6 && a4 == 1)
    return 58;
  else
    return 0;
}

- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3
{
  SBBarSwipeAffordanceViewController *widgetAddSheetAffordanceViewController;
  id v5;
  id v6;
  id v7;

  widgetAddSheetAffordanceViewController = self->_widgetAddSheetAffordanceViewController;
  v5 = a3;
  -[SBBarSwipeAffordanceViewController barSwipeAffordanceView](widgetAddSheetAffordanceViewController, "barSwipeAffordanceView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)libraryViewControllerRequestsDismissal:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[SBHomeScreenController isModalAppLibrarySupported](self, "isModalAppLibrarySupported"))
  {
    objc_msgSend(v6, "_sbWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modalLibraryController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "dismissLibraryAnimated:completion:", 1, 0);
  }
  else
  {
    -[SBHomeScreenController dismissLibraryAnimated:completion:](self, "dismissLibraryAnimated:completion:", 1, 0);
  }

}

- (void)libraryViewController:(id)a3 willPresentFolderController:(id)a4
{
  id v4;

  -[SBHomeScreenController homeScreenOverlayController](self, "homeScreenOverlayController", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addReasonToDisableDismissGestureRecognizer:", CFSTR("kSBHLibraryViewControllerReasonToForbidDismissalOfHomeScreenOverlayController"));

}

- (void)libraryViewController:(id)a3 willDismissFolderController:(id)a4
{
  id v4;

  -[SBHomeScreenController homeScreenOverlayController](self, "homeScreenOverlayController", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeReasonToDisableDismissGestureRecognizer:", CFSTR("kSBHLibraryViewControllerReasonToForbidDismissalOfHomeScreenOverlayController"));

}

- (void)libraryViewControllerWillPresent:(id)a3
{
  id v3;

  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissWidgetEditingViewControllerIfPresentedAnimated:", 1);

}

- (void)libraryViewControllerDidDismiss:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogTelemetrySignposts();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_LIBRARY_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v4, 2u);
  }

  kdebug_trace();
}

- (void)libraryViewController:(id)a3 willPresentSearchController:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  NSHashTable *libraryViewControllersActivatingSpotlightAppService;
  NSHashTable *v9;
  NSHashTable *v10;
  uint64_t v11;
  id v12;

  v5 = (void *)MEMORY[0x1E0CB37D0];
  v6 = a3;
  objc_msgSend(v5, "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", SBIconControllerOverlayVisibilityDidChangeNotification, self);

  libraryViewControllersActivatingSpotlightAppService = self->_libraryViewControllersActivatingSpotlightAppService;
  if (!libraryViewControllersActivatingSpotlightAppService)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v10 = self->_libraryViewControllersActivatingSpotlightAppService;
    self->_libraryViewControllersActivatingSpotlightAppService = v9;

    libraryViewControllersActivatingSpotlightAppService = self->_libraryViewControllersActivatingSpotlightAppService;
  }
  v11 = -[NSHashTable count](libraryViewControllersActivatingSpotlightAppService, "count");
  -[NSHashTable addObject:](self->_libraryViewControllersActivatingSpotlightAppService, "addObject:", v6);

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0DA9D08], "sharedAppService");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activate");

  }
}

- (void)libraryViewController:(id)a3 willDismissSearchController:(id)a4
{
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", SBIconControllerOverlayVisibilityDidChangeNotification, self);

  SBLogTelemetrySignposts();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_LIBRARY_SEARCH_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v7, 2u);
  }

  kdebug_trace();
}

- (void)libraryViewController:(id)a3 didDismissSearchController:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v5 = a3;
  SBLogTelemetrySignposts();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_LIBRARY_SEARCH_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v8, 2u);
  }

  kdebug_trace();
  -[NSHashTable removeObject:](self->_libraryViewControllersActivatingSpotlightAppService, "removeObject:", v5);

  if (!-[NSHashTable count](self->_libraryViewControllersActivatingSpotlightAppService, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DA9D08], "sharedAppService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deactivate");

  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  SBHIconEditingSettings *v7;
  void *v8;
  SBHIconEditingSettings *v9;

  v9 = (SBHIconEditingSettings *)a3;
  v6 = a4;
  -[SBHomeScreenController rootFolderSettings](self, "rootFolderSettings");
  v7 = (SBHIconEditingSettings *)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("showsSpotlightOnEveryPage")))
    {
      -[SBHomeScreenController iconManager](self, "iconManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tearDownAndResetRootIconLists");

    }
  }
  else if (self->_iconEditingSettings == v9)
  {
    -[SBHomeScreenController _configureEditingGestureRecognizers](self, "_configureEditingGestureRecognizers");
  }

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a4;
  objc_msgSend(v5, "fromLayoutState");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v19, "unlockedEnvironmentMode");
  objc_msgSend(v5, "toLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unlockedEnvironmentMode");
  v9 = v8;
  if (v6 == 2 || v8 != 2)
  {
    if (v6 != 3 && v8 == 3)
      -[SBHomeScreenController addIconOcclusionReason:updateVisibleIcons:](self, "addIconOcclusionReason:updateVisibleIcons:", 2, 1);
    if (v6 == 2 && v9 != 2)
    {
      v10 = 8;
      goto LABEL_13;
    }
  }
  else
  {
    -[SBHomeScreenController addIconOcclusionReason:updateVisibleIcons:](self, "addIconOcclusionReason:updateVisibleIcons:", 8, 1);
  }
  if (v6 == 3 && v9 != 3)
  {
    v10 = 2;
LABEL_13:
    -[SBHomeScreenController removeIconOcclusionReason:updateVisibleIcons:](self, "removeIconOcclusionReason:updateVisibleIcons:", v10, 1);
  }
  -[SBHomeScreenController todayViewController](self, "todayViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController homeScreenOverlayController](self, "homeScreenOverlayController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController keepTodayViewIconImagesStaticAssertion](self, "keepTodayViewIconImagesStaticAssertion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v9 == 1 || v13)
  {
    if (v9 == 1 && v13)
    {
      objc_msgSend(v13, "invalidate");
      -[SBHomeScreenController setKeepTodayViewIconImagesStaticAssertion:](self, "setKeepTodayViewIconImagesStaticAssertion:", 0);
    }
  }
  else if (objc_msgSend(v12, "isPresented"))
  {
    objc_msgSend(v12, "activeSidebarViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 == v11)
    {
      SBStringForUnlockedEnvironmentMode(v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("Layout State: "), "stringByAppendingString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "keepIconImageViewControllersStaticForReason:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeScreenController setKeepTodayViewIconImagesStaticAssertion:](self, "setKeepTodayViewIconImagesStaticAssertion:", v18);

    }
  }

}

- (void)folderIconStateDidDirty:(id)a3
{
  objc_msgSend((id)SBApp, "noteHomeScreenLayoutDidChange", a3);
}

- (void)searchBarDidFocus
{
  id v2;

  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isTransitioningPageState") & 1) == 0 && (SBSpotlightIsVisible() & 1) == 0)
    objc_msgSend(v2, "presentSpotlightAnimated:completionHandler:", 1, 0);

}

- (BOOL)appPredictionViewController:(id)a3 launchAppFromIcon:(id)a4
{
  return 0;
}

- (id)appPredictionViewController:(id)a3 badgeValueForApplicationWithBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  -[SBHomeScreenController _iconController](self, "_iconController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayIDsWithBadgingEnabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if (v8)
  {
    -[SBHomeScreenController applicationController](self, "applicationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applicationWithBundleIdentifier:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "badgeValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)appPredictionViewController:(id)a3 shouldDisplayBadgeWithBundleIdentifier:(id)a4
{
  return -[SBHomeScreenController _allowsBadgingForApplicationBundleIdentifier:](self, "_allowsBadgingForApplicationBundleIdentifier:", a4);
}

- (id)appPredictionViewController:(id)a3 iconForApplicationWithBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBHomeScreenController model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationIconForBundleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)additionalIconListLayoutObserversForAppPredictionViewController:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[SBHomeScreenController iconManager](self, "iconManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SBHomeScreenController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__SBHomeScreenController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __73__SBHomeScreenController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_updateFocusModeManagerWithDoNotDisturbState:", v2);

}

- (id)createStatusBarVisibiltyAssertionForWindowScene:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "statusBarManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", 0, 0, CFSTR("show on homescreen backstop"));

  return v5;
}

- (void)updateRootFolderWithCurrentDoNotDisturbState
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SBHomeScreenController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __70__SBHomeScreenController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "queryCurrentStateWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__SBHomeScreenController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke_2;
  v4[3] = &unk_1E8E9E820;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __70__SBHomeScreenController_updateRootFolderWithCurrentDoNotDisturbState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFocusModeManagerWithDoNotDisturbState:", *(_QWORD *)(a1 + 40));
}

- (void)_updateFocusModeManagerWithDoNotDisturbState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SBHomeScreenController iconManager](self, "iconManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "focusModeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController _focusModeFromDoNotDisturbState:](self, "_focusModeFromDoNotDisturbState:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setActiveFocusMode:", v6);
  if (objc_msgSend(v6, "customizedHomeScreenPagesEnabled"))
  {
    -[SBHomeScreenController mainDisplayWindowScene](self, "mainDisplayWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatingDockController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resetRecentsAndSuggestions");

  }
}

- (id)_focusModeFromDoNotDisturbState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  SEL v12;
  uint64_t v13;
  NSString *v14;
  SEL v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v34;
  NSString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isActive"))
  {
    objc_msgSend(v4, "activeModeConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();

    -[SBHomeScreenController rootFolder](self, "rootFolder");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)v8;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA468]), "initWithIdentifier:folder:", v8, v37);
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setName:", v10);

    objc_msgSend(v6, "symbolImageName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSymbol:", v11);

    if (objc_msgSend(v6, "semanticType") == 1)
      objc_msgSend(v9, "setSleepFocus:", 1);
    objc_msgSend(v6, "tintColorName");
    v35 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = NSSelectorFromString(v35);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "performSelector:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1D5F0], "defaultTintColorName");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      v15 = NSSelectorFromString(v14);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "performSelector:", v15);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

    }
    objc_msgSend(v9, "setColor:", v13);
    objc_msgSend(v5, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hideApplicationBadges");
    v40 = v4;
    if (objc_msgSend(v16, "applicationConfigurationType"))
    {
      if (objc_msgSend(v16, "applicationConfigurationType", v13, v35) == 1)
        objc_msgSend(v9, "setHidesOnlyDeniedApplicationBadges:", v17 == 2);
    }
    else
    {
      objc_msgSend(v9, "setShowsOnlyAllowedApplicationBadges:", v17 == 2, v13, v35);
    }
    v39 = v5;
    v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v16, "allowedApplicationIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v46 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "bundleID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v22);
    }

    objc_msgSend(v9, "setAllowedApplicationBundleIdentifiers:", v18);
    v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v16, "deniedApplicationIdentifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v42 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "bundleID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v32);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v29);
    }

    objc_msgSend(v9, "setDeniedApplicationBundleIdentifiers:", v26);
    v4 = v40;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setWallpaperAnimationDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v7 = a4;
  -[SBHomeScreenController suspendWallpaperAnimationForOverlayViewAssertion](self, "suspendWallpaperAnimationForOverlayViewAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  if (v4)
  {
    if (self->_invalidated)
    {
      SBLogIconController();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SBHomeScreenController iconManager:willOpenFolderController:].cold.1((uint64_t)self, (uint64_t)a2, v9);

    }
    else
    {
      +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "suspendWallpaperAnimationForReason:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeScreenController setSuspendWallpaperAnimationForOverlayViewAssertion:](self, "setSuspendWallpaperAnimationForOverlayViewAssertion:", v11);

    }
  }

}

- (id)testSetupForIconManagerWidgetScrollPerformanceTest:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[10];
  _QWORD v38[10];
  _QWORD v39[7];
  _QWORD v40[5];

  v40[3] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DAA770];
  objc_msgSend(MEMORY[0x1E0DAA568], "todayNewsWidgetIconDescriptorForSizeClass:", *MEMORY[0x1E0DAA770]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v36;
  v4 = *MEMORY[0x1E0DAA7A0];
  objc_msgSend(MEMORY[0x1E0DAA568], "overviewStocksWidgetIconDescriptorForSizeClass:", *MEMORY[0x1E0DAA7A0]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v35;
  objc_msgSend(MEMORY[0x1E0DAA568], "calendarWidgetIconDescriptorForSizeClass:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v34;
  objc_msgSend(MEMORY[0x1E0DAA558], "health");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v33;
  objc_msgSend(MEMORY[0x1E0DAA558], "home");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v32;
  objc_msgSend(MEMORY[0x1E0DAA558], "passbook");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v31;
  objc_msgSend(MEMORY[0x1E0DAA558], "preferences");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v29;
  objc_msgSend(MEMORY[0x1E0DAA568], "remindersWidgetIconDescriptorForSizeClass:", v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v28;
  objc_msgSend(MEMORY[0x1E0DAA568], "tvWidgetIconDescriptorForSizeClass:", v3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v27;
  objc_msgSend(MEMORY[0x1E0DAA558], "documents");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v26;
  objc_msgSend(MEMORY[0x1E0DAA558], "findMy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v25;
  objc_msgSend(MEMORY[0x1E0DAA558], "shortcuts");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v24;
  objc_msgSend(MEMORY[0x1E0DAA558], "iTunesStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v23;
  objc_msgSend(MEMORY[0x1E0DAA558], "tips");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v22;
  objc_msgSend(MEMORY[0x1E0DAA558], "translate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v21;
  objc_msgSend(MEMORY[0x1E0DAA558], "contacts");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[8] = v20;
  objc_msgSend(MEMORY[0x1E0DAA558], "watch");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[9] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v18;
  objc_msgSend(MEMORY[0x1E0DAA570], "defaultStackIconDescriptorForSizeClass:", v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v17;
  objc_msgSend(MEMORY[0x1E0DAA568], "recentsWidgetIconDescriptorForSizeClass:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v16;
  objc_msgSend(MEMORY[0x1E0DAA558], "documents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v5;
  objc_msgSend(MEMORY[0x1E0DAA558], "findMy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v6;
  objc_msgSend(MEMORY[0x1E0DAA558], "shortcuts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v7;
  objc_msgSend(MEMORY[0x1E0DAA558], "iTunesStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v8;
  objc_msgSend(MEMORY[0x1E0DAA558], "health");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v9;
  objc_msgSend(MEMORY[0x1E0DAA558], "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v10;
  objc_msgSend(MEMORY[0x1E0DAA558], "passbook");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[8] = v11;
  objc_msgSend(MEMORY[0x1E0DAA558], "preferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37[9] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)testSetupForIconManagerAddWidgetsToEachPage:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DAA770];
  objc_msgSend(MEMORY[0x1E0DAA568], "gasparWatchDogWidgetIconDescriptorForSizeClass:", *MEMORY[0x1E0DAA770]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0DAA568], "relivePhotosWidgetIconDescriptorForSizeClass:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0DAA568], "mobileNotesWidgetIconDescriptorForSizeClass:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0DAA568], "remindersWidgetIconDescriptorForSizeClass:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)testSetupForIconManagerWidgetScrollTest:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
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
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _QWORD v38[8];
  _QWORD v39[19];

  v39[17] = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v34 = (id)objc_opt_new();
  v3 = 0;
  v32 = (void *)*MEMORY[0x1E0DAA770];
  v24 = *MEMORY[0x1E0DAA768];
  v25 = *MEMORY[0x1E0DAA7A0];
  v23 = *MEMORY[0x1E0DAA758];
  do
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      v32;
      __asm { BR              X9 }
    }
    if ((v3 & 1 | 2) == 2)
    {
      objc_msgSend(MEMORY[0x1E0DAA568], "dateTimeWidgetIconDescriptorForSizeClass:", v25);
      v35 = objc_claimAutoreleasedReturnValue();
      v39[0] = v35;
      objc_msgSend(MEMORY[0x1E0DAA568], "notesWidgetIconDescriptorForSizeClass:", v25);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v37;
      objc_msgSend(MEMORY[0x1E0DAA570], "padDefaultLeadingHomescreenLayoutStackWidgetIconDescriptorForSizeClass:", v24);
      v31 = objc_claimAutoreleasedReturnValue();
      v39[2] = v31;
      objc_msgSend(MEMORY[0x1E0DAA568], "calendarWidgetIconDescriptorForSizeClass:", v32);
      v30 = objc_claimAutoreleasedReturnValue();
      v39[3] = v30;
      objc_msgSend(MEMORY[0x1E0DAA570], "padDefaultTrailingHomescreenLayoutStackWidgetIconDescriptorForSizeClass:", v24);
      v7 = objc_claimAutoreleasedReturnValue();
      v39[4] = v7;
      v33 = v4;
      objc_msgSend(MEMORY[0x1E0DAA558], "facetime");
      v8 = objc_claimAutoreleasedReturnValue();
      v39[5] = v8;
      objc_msgSend(MEMORY[0x1E0DAA558], "documents");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39[6] = v36;
      objc_msgSend(MEMORY[0x1E0DAA558], "reminders");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v39[7] = v9;
      objc_msgSend(MEMORY[0x1E0DAA558], "maps");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v39[8] = v10;
      objc_msgSend(MEMORY[0x1E0DAA558], "home");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v39[9] = v29;
      objc_msgSend(MEMORY[0x1E0DAA558], "camera");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39[10] = v28;
      objc_msgSend(MEMORY[0x1E0DAA558], "appStore");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v39[11] = v27;
      objc_msgSend(MEMORY[0x1E0DAA558], "books");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v39[12] = v26;
      objc_msgSend(MEMORY[0x1E0DAA558], "podcasts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v39[13] = v11;
      objc_msgSend(MEMORY[0x1E0DAA558], "tv");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v39[14] = v12;
      objc_msgSend(MEMORY[0x1E0DAA558], "news");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v39[15] = v13;
      objc_msgSend(MEMORY[0x1E0DAA558], "preferences");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39[16] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObjectsFromArray:", v15);

      v16 = (void *)v8;
      v17 = (void *)v7;

      v4 = v33;
      v18 = (void *)v35;
      v19 = (void *)v31;

      v20 = (void *)v30;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DAA568], "tvWidgetIconDescriptorForSizeClass:", v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v18;
      objc_msgSend(MEMORY[0x1E0DAA558], "findMy");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v37;
      objc_msgSend(MEMORY[0x1E0DAA558], "shortcuts");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38[2] = v19;
      objc_msgSend(MEMORY[0x1E0DAA558], "iTunesStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v38[3] = v20;
      objc_msgSend(MEMORY[0x1E0DAA558], "health");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38[4] = v17;
      objc_msgSend(MEMORY[0x1E0DAA558], "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38[5] = v16;
      objc_msgSend(MEMORY[0x1E0DAA558], "passbook");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v38[6] = v36;
      objc_msgSend(MEMORY[0x1E0DAA558], "preferences");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v38[7] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v10);
    }

    objc_msgSend(v34, "addObject:", v4);
    ++v3;
  }
  while (v3 != 8);

  return v34;
}

- (id)testSetupHomeScreenForWidgetScrollPerformanceTest:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DAA7A0];
  objc_msgSend(MEMORY[0x1E0DAA568], "calendarWidgetIconDescriptorForSizeClass:", *MEMORY[0x1E0DAA7A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0DAA568], "podcastWidgetIconDescriptorForSizeClass:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0DAA568], "relivePhotosWidgetIconDescriptorForSizeClass:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0DAA568], "batteryWidgetIconDescriptorForSizeClass:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_configureCategoryMapProviderToUseCategoryMapAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v9;

  v4 = a3;
  if (-[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported"))
  {
    -[SBHomeScreenController _iconController](self, "_iconController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "libraryCategoryMapProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    objc_msgSend(v6, "overrideCategoryMapForTestingAtURL:error:", v4, &v9);
    v7 = v9;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_configureDeweyOneCategoryWithAllApps
{
  SBIconModel *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported"))
  {
    v3 = self->_iconModel;
    -[SBHIconModel leafIcons](v3, "leafIcons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (-[SBIconModel isIconVisible:](v3, "isIconVisible:", v11, (_QWORD)v20))
          {
            objc_msgSend(v11, "applicationBundleID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              objc_msgSend(v11, "leafIdentifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v11, v13);

            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v8);
    }

    v14 = objc_alloc_init(MEMORY[0x1E0DAA4E0]);
    objc_msgSend(MEMORY[0x1E0DAA4D0], "categoryWithLocalizedDisplayName:categoryID:categoryIndex:", CFSTR("Reference & Reading"), 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCategoryIdentifiers:", v16);

    objc_msgSend(v14, "setLocalizedCategoryName:forCategoryIdentifier:", CFSTR("Reference & Reading"), v15);
    objc_msgSend(v5, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSortedApplicationIdentifiers:forCategoryIdentifier:", v17, v15);

    -[SBHomeScreenController _iconController](self, "_iconController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "libraryCategoryMapProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "overrideCategoryMapForTesting:", v14);
  }
}

- (void)_configureDeweyEachAppHasItsOwnCategory:(unint64_t)a3
{
  SBIconModel *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v24[4];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported"))
  {
    v19 = a3;
    v5 = self->_iconModel;
    -[SBHIconModel leafIcons](v5, "leafIcons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (-[SBIconModel isIconVisible:](v5, "isIconVisible:", v12, v19))
          {
            objc_msgSend(v12, "applicationBundleID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              objc_msgSend(v12, "leafIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v12, v14);

            }
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v9);
    }

    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0;
    v15 = objc_alloc_init(MEMORY[0x1E0DAA4E0]);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __66__SBHomeScreenController__configureDeweyEachAppHasItsOwnCategory___block_invoke;
    v20[3] = &unk_1E8EA69C8;
    v22 = v24;
    v16 = v15;
    v21 = v16;
    v23 = v19;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v20);
    -[SBHomeScreenController _iconController](self, "_iconController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "libraryCategoryMapProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "overrideCategoryMapForTesting:", v16);
    _Block_object_dispose(v24, 8);

  }
}

void __66__SBHomeScreenController__configureDeweyEachAppHasItsOwnCategory___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0DAA4D0];
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v9 = a3;
  v10 = a2;
  objc_msgSend(v7, "categoryWithLocalizedDisplayName:categoryID:categoryIndex:", v10, v8, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addCategoryIdentifier:", v11);
  v12 = *(void **)(a1 + 32);
  v19[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSortedApplicationIdentifiers:forCategoryIdentifier:", v13, v11);

  v14 = *(void **)(a1 + 32);
  objc_msgSend(v9, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setLocalizedCategoryName:forCategoryIdentifier:", v15, v11);
  v16 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  v17 = *(_QWORD *)(a1 + 48);
  if (v16 > v17 && v17 != 0)
    *a4 = 1;

}

- (void)_configureLibraryWithCategoryLimit:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[SBHomeScreenController isAppLibrarySupported](self, "isAppLibrarySupported"))
  {
    -[SBHomeScreenController _libraryViewControllers](self, "_libraryViewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "podFolderViewController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "dataSource");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setMaximumNumberOfDisplayedCategories:", a3);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)_teardownDeweyTestConfigurations
{
  void *v3;
  id v4;
  id v5;

  -[SBHomeScreenController _iconController](self, "_iconController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryCategoryMapProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "overrideCategoryMapForTesting:", 0);
  v4 = (id)objc_msgSend(v5, "requestLibraryCategoryMapRefreshWithOptions:reason:", 15, CFSTR("Tearing down test config"));
  -[SBHomeScreenController _configureLibraryWithCategoryLimit:](self, "_configureLibraryWithCategoryLimit:", -1);

}

- (void)_presentPageManagement:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_presentPageManagement:", v4);

}

- (void)_dismissPageManagementIfPresented:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dismissPageManagementIfPresented:", v4);

}

- (void)iconManager:(id)a3 setTemporaryIntent:(id)a4 forIconWithIdentifier:(id)a5 widgetUniqueIdentifier:(id)a6
{
  -[SBHomeScreenController setTemporaryIntent:forIconWithIdentifier:widgetUniqueIdentifier:](self, "setTemporaryIntent:forIconWithIdentifier:widgetUniqueIdentifier:", a4, a5, a6);
}

- (void)iconStyleCoordinatorDidUpdate:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[SBHomeScreenController iconManager](self, "iconManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setListLayoutProviderLayoutOptions:animated:", -[SBHomeScreenController bestListLayoutProviderLayoutOptions](self, "bestListLayoutProviderLayoutOptions"), 1);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__SBHomeScreenController_iconStyleCoordinatorDidUpdate___block_invoke;
  v5[3] = &unk_1E8EA69F0;
  v5[4] = self;
  -[SBHomeScreenController enumerateTintableViewControllersUsingBlock:](self, "enumerateTintableViewControllersUsingBlock:", v5);

}

uint64_t __56__SBHomeScreenController_iconStyleCoordinatorDidUpdate___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateHomeScreenTraitOverridesForViewController:", a2);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHomeScreenController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenController homeScreenViewController](self, "homeScreenViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "orientation") == 1)
  {
    v6 = CFSTR("UIInterfaceOrientationPortrait");
  }
  else if (objc_msgSend(v5, "orientation") == 4)
  {
    v6 = CFSTR("UIInterfaceOrientationLandscapeLeft");
  }
  else if (objc_msgSend(v5, "orientation") == 3)
  {
    v6 = CFSTR("UIInterfaceOrientationLandscapeRight");
  }
  else if (objc_msgSend(v5, "orientation") == 2)
  {
    v6 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
  }
  else
  {
    v6 = 0;
  }
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("orientation"));
  -[SBHomeScreenController model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", v8, CFSTR("model"));

  -[SBHomeScreenController _rootFolderController](self, "_rootFolderController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "appendObject:withName:", v10, CFSTR("rootFolderController"));

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHomeScreenController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (double)topOffset
{
  return self->topOffset;
}

- (void)setTopOffset:(double)a3
{
  self->topOffset = a3;
}

- (double)maxPresentationOffset
{
  return self->maxPresentationOffset;
}

- (void)setMaxPresentationOffset:(double)a3
{
  self->maxPresentationOffset = a3;
}

- (SBHIconManager)iconManager
{
  return self->_iconManager;
}

- (SBHomeScreenViewController)homeScreenViewController
{
  return self->_homeScreenViewController;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBHIconRootViewProviding)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (NSTimer)delayedLaunchRequestTimer
{
  return self->_delayedLaunchRequestTimer;
}

- (void)setDelayedLaunchRequestTimer:(id)a3
{
  objc_storeStrong((id *)&self->_delayedLaunchRequestTimer, a3);
}

- (SBHomeScreenOverlayController)homeScreenOverlayController
{
  return self->_homeScreenOverlayController;
}

- (void)setHomeScreenOverlayController:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenOverlayController, a3);
}

- (SBHomeScreenWindow)homeScreenWindow
{
  return self->_homeScreenWindow;
}

- (BSInvalidatable)displayLayoutTransition
{
  return self->_displayLayoutTransition;
}

- (void)setDisplayLayoutTransition:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutTransition, a3);
}

- (SBHRootFolderSettings)rootFolderSettings
{
  return self->_rootFolderSettings;
}

- (BSInvalidatable)keepTodayViewIconImagesStaticAssertion
{
  return self->_keepTodayViewIconImagesStaticAssertion;
}

- (void)setKeepTodayViewIconImagesStaticAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_keepTodayViewIconImagesStaticAssertion, a3);
}

- (BSInvalidatable)suspendWallpaperAnimationForSpotlightAssertion
{
  return self->_suspendWallpaperAnimationForSpotlightAssertion;
}

- (void)setSuspendWallpaperAnimationForSpotlightAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForSpotlightAssertion, a3);
}

- (BSInvalidatable)suspendWallpaperAnimationForOverlayViewAssertion
{
  return self->_suspendWallpaperAnimationForOverlayViewAssertion;
}

- (void)setSuspendWallpaperAnimationForOverlayViewAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForOverlayViewAssertion, a3);
}

- (SBProactiveHomeScreenUsageObserver)proactiveUsageObserver
{
  return self->_proactiveUsageObserver;
}

- (void)setProactiveUsageObserver:(id)a3
{
  objc_storeStrong((id *)&self->_proactiveUsageObserver, a3);
}

- (SBTipsHomeScreenUsageObserver)tipsUsageObserver
{
  return self->_tipsUsageObserver;
}

- (void)setTipsUsageObserver:(id)a3
{
  objc_storeStrong((id *)&self->_tipsUsageObserver, a3);
}

- (SBBarSwipeAffordanceViewController)widgetAddSheetAffordanceViewController
{
  return self->_widgetAddSheetAffordanceViewController;
}

- (void)setWidgetAddSheetAffordanceViewController:(id)a3
{
  objc_storeStrong((id *)&self->_widgetAddSheetAffordanceViewController, a3);
}

- (DNDStateService)dndStateService
{
  return self->_dndStateService;
}

- (void)setDndStateService:(id)a3
{
  objc_storeStrong((id *)&self->_dndStateService, a3);
}

- (unint64_t)iconOcclusionReasons
{
  return self->_iconOcclusionReasons;
}

- (void)setIconOcclusionReasons:(unint64_t)a3
{
  self->_iconOcclusionReasons = a3;
}

- (SBLeftOfHomeAppViewController)leftOfHomeAppViewController
{
  return self->_leftOfHomeAppViewController;
}

- (void)setLeftOfHomeAppViewController:(id)a3
{
  objc_storeStrong((id *)&self->_leftOfHomeAppViewController, a3);
}

- (SBTodayViewController)todayViewController
{
  return self->_todayViewController;
}

- (void)setTodayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_todayViewController, a3);
}

- (SBTodayViewController)coverSheetTodayViewController
{
  return self->_coverSheetTodayViewController;
}

- (void)setCoverSheetTodayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_coverSheetTodayViewController, a3);
}

- (SBHomeScreenSpotlightViewController)spotlightViewController
{
  return self->_spotlightViewController;
}

- (void)setSpotlightViewController:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightViewController, a3);
}

- (SBLibraryViewController)overlayLibraryViewController
{
  return self->_overlayLibraryViewController;
}

- (void)setOverlayLibraryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_overlayLibraryViewController, a3);
}

- (SBRootFolderPageTransition)interactivePullToTodaySearchTransition
{
  return self->_interactivePullToTodaySearchTransition;
}

- (void)setInteractivePullToTodaySearchTransition:(id)a3
{
  objc_storeStrong((id *)&self->_interactivePullToTodaySearchTransition, a3);
}

- (NSHashTable)floatingDockControllerObservers
{
  return self->_floatingDockControllerObservers;
}

- (void)setFloatingDockControllerObservers:(id)a3
{
  objc_storeStrong((id *)&self->_floatingDockControllerObservers, a3);
}

- (NSSet)floatingDockBehaviorAssertions
{
  return self->_floatingDockBehaviorAssertions;
}

- (void)setFloatingDockBehaviorAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_floatingDockBehaviorAssertions, a3);
}

- (SBHSearchPresenting)searchPresenter
{
  return self->_searchPresenter;
}

- (void)setSearchPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_searchPresenter, a3);
}

- (SBSpotlightPresentableViewController)searchPresentableViewController
{
  return self->_searchPresentableViewController;
}

- (void)setSearchPresentableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_searchPresentableViewController, a3);
}

- (SBRootFolderPageTransition)searchPresenterPageStateTransition
{
  return self->_searchPresenterPageStateTransition;
}

- (void)setSearchPresenterPageStateTransition:(id)a3
{
  objc_storeStrong((id *)&self->_searchPresenterPageStateTransition, a3);
}

- (int64_t)searchPresenterDestinationPageState
{
  return self->_searchPresenterDestinationPageState;
}

- (void)setSearchPresenterDestinationPageState:(int64_t)a3
{
  self->_searchPresenterDestinationPageState = a3;
}

- (unint64_t)searchPresenterOutstandingAnimationCount
{
  return self->_searchPresenterOutstandingAnimationCount;
}

- (void)setSearchPresenterOutstandingAnimationCount:(unint64_t)a3
{
  self->_searchPresenterOutstandingAnimationCount = a3;
}

- (SBHLegibility)scrollAccessoryAuxiliaryView
{
  return self->_scrollAccessoryAuxiliaryView;
}

- (void)setScrollAccessoryAuxiliaryView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollAccessoryAuxiliaryView, a3);
}

- (BSInvalidatable)scrollAccessoryBorrowedForSearchPresentationAssertion
{
  return self->_scrollAccessoryBorrowedForSearchPresentationAssertion;
}

- (void)setScrollAccessoryBorrowedForSearchPresentationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_scrollAccessoryBorrowedForSearchPresentationAssertion, a3);
}

- (BSInvalidatable)addWidgetSheetKeyboardFocusAssertion
{
  return self->_addWidgetSheetKeyboardFocusAssertion;
}

- (void)setAddWidgetSheetKeyboardFocusAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_addWidgetSheetKeyboardFocusAssertion, a3);
}

- (BSInvalidatable)todayViewDisplayLayoutAssertion
{
  return self->_todayViewDisplayLayoutAssertion;
}

- (void)setTodayViewDisplayLayoutAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_todayViewDisplayLayoutAssertion, a3);
}

- (NSSet)appIconForceTouchWindows
{
  return self->_appIconForceTouchWindows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconForceTouchWindows, 0);
  objc_storeStrong((id *)&self->_todayViewDisplayLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryBorrowedForSearchPresentationAssertion, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryAuxiliaryView, 0);
  objc_storeStrong((id *)&self->_searchPresenterPageStateTransition, 0);
  objc_storeStrong((id *)&self->_searchPresentableViewController, 0);
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_storeStrong((id *)&self->_floatingDockBehaviorAssertions, 0);
  objc_storeStrong((id *)&self->_floatingDockControllerObservers, 0);
  objc_storeStrong((id *)&self->_interactivePullToTodaySearchTransition, 0);
  objc_storeStrong((id *)&self->_overlayLibraryViewController, 0);
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_storeStrong((id *)&self->_coverSheetTodayViewController, 0);
  objc_storeStrong((id *)&self->_todayViewController, 0);
  objc_storeStrong((id *)&self->_leftOfHomeAppViewController, 0);
  objc_storeStrong((id *)&self->_dndStateService, 0);
  objc_storeStrong((id *)&self->_widgetAddSheetAffordanceViewController, 0);
  objc_storeStrong((id *)&self->_tipsUsageObserver, 0);
  objc_storeStrong((id *)&self->_proactiveUsageObserver, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForOverlayViewAssertion, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForSpotlightAssertion, 0);
  objc_storeStrong((id *)&self->_keepTodayViewIconImagesStaticAssertion, 0);
  objc_storeStrong((id *)&self->_rootFolderSettings, 0);
  objc_storeStrong((id *)&self->_displayLayoutTransition, 0);
  objc_storeStrong((id *)&self->_homeScreenOverlayController, 0);
  objc_storeStrong((id *)&self->_delayedLaunchRequestTimer, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_homeScreenViewController, 0);
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_iconStyleCoordinator, 0);
  objc_storeStrong((id *)&self->_windowSceneToMedusaDragWindowContext, 0);
  objc_storeStrong((id *)&self->_iconsOccludedAssertions, 0);
  objc_storeStrong((id *)&self->_iconDragSessionBeginDate, 0);
  objc_storeStrong((id *)&self->_widgetEditingLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_folderDisplayLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_outstandingSnapshotProviders, 0);
  objc_storeStrong((id *)&self->_screenSnapshotForIconViews, 0);
  objc_storeStrong((id *)&self->_homeScreenOverlayInitialPresentationProgress, 0);
  objc_storeStrong((id *)&self->_filesWidgetExtensionProviders, 0);
  objc_storeStrong((id *)&self->_spotlightInteractiveGestureTransaction, 0);
  objc_storeStrong((id *)&self->_tapToEndEditingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressToEditGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
  objc_storeStrong((id *)&self->_libraryViewControllersActivatingSpotlightAppService, 0);
  objc_storeStrong((id *)&self->_temporaryWidgetIntents, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationForFolderAssertions, 0);
  objc_storeStrong((id *)&self->_delayedStyleWallpaperEffectViews, 0);
  objc_storeStrong((id *)&self->_duckWallpaperDimmingAssertion, 0);
  objc_storeStrong((id *)&self->_colorPickerInterfactionFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_modalInteractionFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_widgetConfigurationFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_homeScreenOverlayFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_deviceOrientationUpdateDeferralAssertionsByReason, 0);
  objc_storeStrong((id *)&self->_activeInterfaceOrientationChangeDeferralAssertionsByReason, 0);
  objc_storeStrong((id *)&self->_override_userInterfaceController, 0);
  objc_storeStrong((id *)&self->_override_policyAggregator, 0);
  objc_storeStrong((id *)&self->_override_mainDisplaySceneManager, 0);
  objc_storeStrong((id *)&self->_override_assistantController, 0);
  objc_storeStrong((id *)&self->_override_applicationPlaceholderController, 0);
  objc_storeStrong((id *)&self->_override_coverSheetPresentationManager, 0);
  objc_storeStrong((id *)&self->_override_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_override_applicationController, 0);
  objc_storeStrong((id *)&self->_override_alertItemsController, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_reachabilityWallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_wallpaperRasterizationAssertion, 0);
  objc_storeStrong((id *)&self->_homeScreenScalingView, 0);
  objc_storeStrong((id *)&self->_homeScreenContentView, 0);
  objc_storeStrong((id *)&self->_switcherSettings, 0);
  objc_storeStrong((id *)&self->_contentRequiringReasons, 0);
  objc_storeStrong((id *)&self->_homeScreenDimmingWindow, 0);
  objc_storeStrong((id *)&self->_homeScreenWindow, 0);
  objc_storeStrong((id *)&self->_homeScreenBackdropView, 0);
}

- (void)setModel:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_sceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "Home Screen is updating icon model for %@", v4, 0xCu);

  OUTLINED_FUNCTION_2_2();
}

- (void)_appLibraryListLayoutProviderForWindowScene:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0540000, log, OS_LOG_TYPE_FAULT, "attempting to construct a list layout provider with a nil windowScene!", v1, 2u);
}

- (void)iconManager:(NSObject *)a3 willOpenFolderController:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a3, v5, "%@ attempting to suspend wallpaper animation after invalidation!", v6);

  OUTLINED_FUNCTION_2_2();
}

void __88__SBHomeScreenController_iconManager_folderController_canChangeCurrentPageIndexToIndex___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
}

- (void)iconManager:(uint64_t)a1 viewControllerForCustomIcon:(NSObject *)a2 element:.cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Did not make a view controller for custom widget element: %@ (%{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)iconManager:viewControllerForCustomIcon:element:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v0, v1, "Error archiving Shortcuts folder widget intent: %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)iconManager:viewControllerForCustomIcon:element:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v0, v1, "Error archiving Shortcuts single widget intent: %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)iconManager:viewControllerForCustomIcon:element:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v0, v1, "Error archiving Files widget intent: %@", v2);
  OUTLINED_FUNCTION_2_0();
}

@end
