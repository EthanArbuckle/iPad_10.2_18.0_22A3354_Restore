@implementation SBCoverSheetAnimator

- (SBCoverSheetAnimator)initWithCoverSheetWindow:(id)a3 sceneManager:(id)a4 hostingWindow:(id)a5 switcherWindow:(id)a6 wallpaperController:(id)a7 folderController:(id)a8 unlockSettings:(id)a9
{
  id v15;
  id v16;
  id v17;
  SBCoverSheetAnimator *v18;
  SBCoverSheetAnimator *v19;
  id v21;
  id v22;
  id v23;
  id obj;
  objc_super v25;

  obj = a3;
  v23 = a4;
  v22 = a5;
  v21 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)SBCoverSheetAnimator;
  v18 = -[SBCoverSheetAnimator init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_coverSheetWindow, obj);
    objc_storeStrong((id *)&v19->_sceneManager, a4);
    objc_storeStrong((id *)&v19->_hostingWindow, a5);
    objc_storeStrong((id *)&v19->_switcherWindow, a6);
    objc_storeStrong((id *)&v19->_wallpaperController, a7);
    objc_storeStrong((id *)&v19->_folderController, a8);
    objc_storeStrong((id *)&v19->_unlockSettings, a9);
  }

  return v19;
}

- (void)animateToCoverSheet:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v5;
  id v8;
  double v9;
  uint64_t v10;
  id v11;
  double v12;
  NSObject *v13;
  void *v14;
  SBLockToAppStatusBarAnimator *v15;
  SBLockToAppStatusBarAnimator *statusBarAnimator;
  void *v17;
  void *v18;
  SBIconZoomAnimator *iconAnimator;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[7];
  BOOL v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[16];

  v5 = a4;
  v8 = a5;
  v9 = 0.0;
  v10 = MEMORY[0x1E0C809B0];
  if (a3)
  {
    v11 = 0;
    v12 = 0.0;
  }
  else
  {
    if (v5)
    {
      SBLogTelemetrySignposts();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_LOCKSCREEN_UNLOCK_ANIMATION_START", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
      }

      kdebug_trace();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:", CFSTR("SBCoverSheetWillAnimateDeactivation"), self);

    }
    v15 = objc_alloc_init(SBLockToAppStatusBarAnimator);
    statusBarAnimator = self->_statusBarAnimator;
    self->_statusBarAnimator = v15;

    -[SBLockToAppStatusBarAnimator animateStatusBarFromLockToHome](self->_statusBarAnimator, "animateStatusBarFromLockToHome");
    -[SBCoverSheetAnimator _prepareIconAnimatorIncludingLockScreen:](self, "_prepareIconAnimatorIncludingLockScreen:", 1);
    v12 = 1.0;
    -[SBIconZoomAnimator setFraction:](self->_iconAnimator, "setFraction:", 1.0);
    objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawing");
    v17 = (void *)MEMORY[0x1E0D016E8];
    v30[0] = v10;
    v30[1] = 3221225472;
    v30[2] = __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke;
    v30[3] = &unk_1E8EA02D8;
    v30[4] = self;
    v31 = v8;
    objc_msgSend(v17, "sentinelWithQueue:signalCount:completion:", MEMORY[0x1E0C80D38], 2, v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    iconAnimator = self->_iconAnimator;
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke_2;
    v28[3] = &unk_1E8E9E980;
    v11 = v18;
    v29 = v11;
    -[SBIconZoomAnimator animateToFraction:afterDelay:withCompletion:](iconAnimator, "animateToFraction:afterDelay:withCompletion:", v28, 0.0, 0.0);

  }
  v20 = (void *)MEMORY[0x1E0CEABB0];
  v26[0] = v10;
  if (v5)
    v9 = 0.5;
  v26[1] = 3221225472;
  v26[2] = __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke_3;
  v26[3] = &unk_1E8EA49B0;
  v26[4] = self;
  v27 = a3;
  *(double *)&v26[5] = v12;
  *(double *)&v26[6] = v9;
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke_4;
  v23[3] = &unk_1E8E9F230;
  v24 = v11;
  v25 = v8;
  v21 = v8;
  v22 = v11;
  objc_msgSend(v20, "animateWithDuration:animations:completion:", v26, v23, v9);

}

uint64_t __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cleanup");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stopHosting");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

uint64_t __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAlpha:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setAlpha:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_setWallpaperToLocked:duration:", *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 48));
}

uint64_t __68__SBCoverSheetAnimator_animateToCoverSheet_animated_withCompletion___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v2, "signal");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateCoverSheetHosting
{
  SBWindowSelfHostWrapper *coverSheetWindowHostWrapper;
  UIWindow *hostingWindow;
  objc_class *v5;
  void *v6;
  SBWindowSelfHostWrapper *v7;
  SBWindowSelfHostWrapper *v8;
  id v9;

  coverSheetWindowHostWrapper = self->_coverSheetWindowHostWrapper;
  if (coverSheetWindowHostWrapper)
    -[SBWindowSelfHostWrapper stopHosting](coverSheetWindowHostWrapper, "stopHosting");
  -[SBCoverSheetAnimator coverSheetWindow](self, "coverSheetWindow");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  hostingWindow = self->_hostingWindow;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sb_hostWrapperForUseInWindow:hostRequester:", hostingWindow, v6);
  v7 = (SBWindowSelfHostWrapper *)objc_claimAutoreleasedReturnValue();
  v8 = self->_coverSheetWindowHostWrapper;
  self->_coverSheetWindowHostWrapper = v7;

}

- (void)_prepareIconAnimatorIncludingLockScreen:(BOOL)a3
{
  _BOOL4 v3;
  SBCenterAppIconZoomAnimator *v5;
  SBFolderController *folderController;
  void *v7;
  SBIconZoomAnimator *v8;
  SBIconZoomAnimator *iconAnimator;

  v3 = a3;
  if (a3)
  {
    -[SBCoverSheetAnimator _updateCoverSheetHosting](self, "_updateCoverSheetHosting");
    v5 = [SBCenterAppIconZoomAnimator alloc];
    folderController = self->_folderController;
    -[SBWindowSelfHostWrapper hostView](self->_coverSheetWindowHostWrapper, "hostView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = [SBCenterAppIconZoomAnimator alloc];
    v7 = 0;
    folderController = self->_folderController;
  }
  v8 = -[SBCenterAppIconZoomAnimator initWithFolderController:appView:](v5, "initWithFolderController:appView:", folderController, v7);
  iconAnimator = self->_iconAnimator;
  self->_iconAnimator = v8;

  if (v3)
  -[SBIconZoomAnimator setSettings:](self->_iconAnimator, "setSettings:", self->_unlockSettings);
  -[SBIconZoomAnimator setDistantScale:](self->_iconAnimator, "setDistantScale:", 0.26);
  -[SBIconZoomAnimator prepare](self->_iconAnimator, "prepare");
}

- (void)_setWallpaperToLocked:(BOOL)a3 duration:(double)a4
{
  _BOOL8 v6;
  void *v7;
  id v8;

  v6 = !a3;
  objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWallpaperController setActiveVariant:withOutAnimationFactory:inAnimationFactory:completion:](self->_wallpaperController, "setActiveVariant:withOutAnimationFactory:inAnimationFactory:completion:", v6, v7, v8, 0);

}

- (SBLockToAppStatusBarAnimator)statusBarAnimator
{
  return self->_statusBarAnimator;
}

- (void)setStatusBarAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarAnimator, a3);
}

- (SBIconZoomAnimator)iconAnimator
{
  return self->_iconAnimator;
}

- (void)setIconAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_iconAnimator, a3);
}

- (SBWindowSelfHostWrapper)coverSheetWindowHostWrapper
{
  return self->_coverSheetWindowHostWrapper;
}

- (void)setCoverSheetWindowHostWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_coverSheetWindowHostWrapper, a3);
}

- (SBSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (void)setSceneManager:(id)a3
{
  objc_storeStrong((id *)&self->_sceneManager, a3);
}

- (UIWindow)hostingWindow
{
  return self->_hostingWindow;
}

- (void)setHostingWindow:(id)a3
{
  objc_storeStrong((id *)&self->_hostingWindow, a3);
}

- (UIWindow)switcherWindow
{
  return self->_switcherWindow;
}

- (void)setSwitcherWindow:(id)a3
{
  objc_storeStrong((id *)&self->_switcherWindow, a3);
}

- (SBWallpaperController)wallpaperController
{
  return self->_wallpaperController;
}

- (void)setWallpaperController:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperController, a3);
}

- (SBFolderController)folderController
{
  return self->_folderController;
}

- (void)setFolderController:(id)a3
{
  objc_storeStrong((id *)&self->_folderController, a3);
}

- (SBHUnlockSettings)unlockSettings
{
  return self->_unlockSettings;
}

- (void)setUnlockSettings:(id)a3
{
  objc_storeStrong((id *)&self->_unlockSettings, a3);
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (UIWindow)coverSheetWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_coverSheetWindow);
}

- (void)setCoverSheetWindow:(id)a3
{
  objc_storeWeak((id *)&self->_coverSheetWindow, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coverSheetWindow);
  objc_storeStrong((id *)&self->_unlockSettings, 0);
  objc_storeStrong((id *)&self->_folderController, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_storeStrong((id *)&self->_switcherWindow, 0);
  objc_storeStrong((id *)&self->_hostingWindow, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_coverSheetWindowHostWrapper, 0);
  objc_storeStrong((id *)&self->_iconAnimator, 0);
  objc_storeStrong((id *)&self->_statusBarAnimator, 0);
}

@end
