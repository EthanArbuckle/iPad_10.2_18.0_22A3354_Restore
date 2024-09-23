@implementation PBUIPosterViewController

- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v14, "clientSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pui_significantEventOptions");

  if (soft_PUIPosterSignificantEventOptionsContainsEvent(v10, 3))
  {
    v11 = objc_msgSend(v7, "pr_adjustedLuminance");
    objc_msgSend(v14, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "pr_adjustedLuminance");

    if (v11 == 2 && v13 != 2)
    {
      objc_msgSend(v7, "pui_setSignificantEventsCounter:", objc_msgSend(v7, "pui_significantEventsCounter") + 1);
      objc_msgSend(v8, "pui_setSignificantEvent:", 3);
    }
  }

}

- (id)requireWallpaperRasterizationWithReason:(id)a3
{
  id v4;
  BSCompoundAssertion *shouldRasterizeWallpaperAssertion;
  void *v6;
  BSCompoundAssertion *v7;
  BSCompoundAssertion *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  shouldRasterizeWallpaperAssertion = self->_shouldRasterizeWallpaperAssertion;
  if (!shouldRasterizeWallpaperAssertion)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0D01718];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __68__PBUIPosterViewController_requireWallpaperRasterizationWithReason___block_invoke;
    v14 = &unk_1E6B94790;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v6, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("requireWallpaperRasterization"), &v11);
    v7 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v8 = self->_shouldRasterizeWallpaperAssertion;
    self->_shouldRasterizeWallpaperAssertion = v7;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    shouldRasterizeWallpaperAssertion = self->_shouldRasterizeWallpaperAssertion;
  }
  -[BSCompoundAssertion acquireForReason:](shouldRasterizeWallpaperAssertion, "acquireForReason:", v4, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updatePoster:(id)a3
{
  (*((void (**)(id, PBUIPosterViewController *))a3 + 2))(a3, self);
  -[PBUIPosterViewController _updateForActiveVariant:](self, "_updateForActiveVariant:", 0);
}

- (void)_updateForActiveVariant:(int64_t)a3
{
  int64_t activeVariant;
  id *p_homeViewController;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PBUIPosterViewController _updateLandscapeBlur](self, "_updateLandscapeBlur");
  activeVariant = self->_activeVariant;
  p_homeViewController = (id *)&self->_homeViewController;
  -[PBUIPosterHomeViewController view](self->_homeViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (activeVariant == 1)
  {
    objc_msgSend(v7, "setHidden:", 0);

  }
  else
  {
    objc_msgSend(v7, "setHidden:", 1);

    p_homeViewController = (id *)&self->_lockViewController;
  }
  v10 = *p_homeViewController;
  -[PBUIPosterViewController _updateLockViewControllerVisibility](self, "_updateLockViewControllerVisibility");
  -[PBUIDynamicProviderWrapper setRootObject:](self->_activeVariantReplicaProvider, "setRootObject:", v10);
  -[PBUIPosterViewController _updatePosterScenesForReasons:completion:](self, "_updatePosterScenesForReasons:completion:", a3 | 2, 0);
  objc_msgSend(v10, "legibilitySettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIPosterViewController _updateLegibilitySettings:](self, "_updateLegibilitySettings:", v9);

}

- (void)_updatePosterScenesForReasons:(int64_t)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  _BOOL4 v7;
  double unlockProgress;
  BOOL wakeSourceIsSwipeToUnlock;
  int64_t activeVariant;
  BOOL v11;
  BOOL IsHidden;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  FBScene *scene;
  _QWORD v19[4];
  void (**v20)(_QWORD);
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[8];
  BOOL v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;

  v6 = (void (**)(_QWORD))a4;
  v7 = self->_activelyRequired || !PBUIWallpaperStyleIsHidden(self->_activeStyle);
  unlockProgress = self->_unlockProgress;
  wakeSourceIsSwipeToUnlock = self->_wakeSourceIsSwipeToUnlock;
  activeVariant = self->_activeVariant;
  if (self->_scene)
    v11 = self->_homeScene == 0;
  else
    v11 = 0;
  IsHidden = PBUIWallpaperStyleIsHidden(self->_lockWallpaperStyle);
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke;
  v25[3] = &unk_1E6B96B50;
  v26 = v11;
  v25[5] = a3;
  v25[6] = activeVariant;
  v27 = v7;
  *(double *)&v25[7] = unlockProgress;
  v28 = IsHidden;
  v29 = wakeSourceIsSwipeToUnlock;
  v25[4] = self;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke_48;
  v23[3] = &unk_1E6B96B78;
  v14 = (id)MEMORY[0x1BCCA5978](v25);
  v23[4] = self;
  v24 = v14;
  v15 = (void *)MEMORY[0x1BCCA5978](v23);
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke_2;
  v21[3] = &unk_1E6B96B78;
  v16 = v14;
  v21[4] = self;
  v22 = v16;
  v17 = (void *)MEMORY[0x1BCCA5978](v21);
  scene = self->_scene;
  if (v7)
  {
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke_3;
    v19[3] = &unk_1E6B96BA0;
    v20 = v6;
    -[FBScene pb_activate:withCompletion:](scene, "pb_activate:withCompletion:", v15, v19);
    -[FBScene pb_activate:](self->_homeScene, "pb_activate:", v17);

  }
  else
  {
    -[FBScene pb_update:](scene, "pb_update:", v15);
    -[FBScene pb_update:](self->_homeScene, "pb_update:", v17);
    if (v6)
      v6[2](v6);
  }

}

- (void)_updateLockViewControllerVisibility
{
  int v3;
  int64_t activeVariant;
  _BOOL4 v5;
  id v6;

  v3 = BSFloatLessThanFloat();
  activeVariant = self->_activeVariant;
  v5 = -[PBUIPosterViewController _homeScreenConfigurationRequiresPosterContent](self, "_homeScreenConfigurationRequiresPosterContent");
  if (activeVariant != 1)
    v3 = 1;
  -[PBUIPosterLockViewController view](self->_lockViewController, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", (v3 | v5) ^ 1u);

}

- (void)_updateLegibilitySettings:(id)a3
{
  id WeakRetained;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "posterComponent:didUpdateLegibilitySettings:", self, v6);

  }
}

- (void)_updateLandscapeBlur
{
  if ((soft_PUIDynamicRotationIsActive() & 1) == 0)
  {
    -[PBUIPosterVariantViewController setBlurEnabled:](self->_lockViewController, "setBlurEnabled:", self->_landscapeBlurEnabled);
    if (!-[PBUIPosterViewController homeScreenReflectsLockScreen](self, "homeScreenReflectsLockScreen"))
      -[PBUIPosterVariantViewController setBlurEnabled:](self->_homeViewController, "setBlurEnabled:", self->_landscapeBlurEnabled);
  }
}

- (BOOL)homeScreenReflectsLockScreen
{
  return !self->_homeScene && -[PBUIPosterHomeViewController reflectsLock](self->_homeViewController, "reflectsLock");
}

- (BOOL)_homeScreenConfigurationRequiresPosterContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[FBScene settings](self->_scene, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pr_posterConfiguredProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeScreenConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 || !-[FBScene pui_isLegacyProvider](self->_scene, "pui_isLegacyProvider"))
  {
    switch(objc_msgSend(v5, "selectedAppearanceType"))
    {
      case 0:
        objc_msgSend(v5, "lockPosterAppearance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 1:
        objc_msgSend(v5, "solidColorAppearance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "effectiveColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_12;
        goto LABEL_9;
      case 2:
        objc_msgSend(v5, "gradientAppearance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          goto LABEL_12;
LABEL_9:
        v7 = 0;
        break;
      case 3:
        objc_msgSend(v5, "homePosterAppearance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v12 = v8;
        objc_msgSend(v8, "isLegibilityBlurEnabled");

        goto LABEL_12;
      default:
LABEL_12:
        v7 = 1;
        break;
    }
  }
  else
  {
    -[PBUIPosterViewController _legacyWallpaperConfigurationManager](self, "_legacyWallpaperConfigurationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "variantsShareWallpaperConfiguration");

  }
  return v7;
}

- (void)setActivelyRequired:(BOOL)a3
{
  self->_activelyRequired = a3;
}

- (int64_t)activeStyleForVariant:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[PBUIPosterViewController _viewControllerForVariant:](self, "_viewControllerForVariant:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activeStyle");

  return v4;
}

- (id)_viewControllerForVariant:(int64_t)a3
{
  int *v3;

  v3 = &OBJC_IVAR___PBUIPosterViewController__homeViewController;
  if (!a3)
    v3 = &OBJC_IVAR___PBUIPosterViewController__lockViewController;
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (void)setActiveStyle:(int64_t)a3 forVariant:(int64_t)a4
{
  void *v6;

  if (!a4)
    self->_lockWallpaperStyle = a3;
  -[PBUIPosterViewController _viewControllerForVariant:](self, "_viewControllerForVariant:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveStyle:", a3);

  -[PBUIPosterViewController _updateForActiveVariant:](self, "_updateForActiveVariant:", 2);
}

void __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  _BOOL8 v16;
  char IsActive;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 64) || objc_msgSend(v8, "pb_activeVariant") == *(_QWORD *)(a1 + 48))
  {
    v11 = 0;
    v12 = *(_BYTE *)(a1 + 65) ^ 1;
  }
  else
  {
    v12 = 1;
    v11 = 1;
  }
  objc_msgSend(v8, "setJetsamMode:", v12);
  if (!objc_msgSend(v8, "pb_activeVariant"))
    objc_msgSend(v8, "pr_setUnlockProgress:", *(double *)(a1 + 56));
  objc_msgSend(v8, "pr_posterConfiguredProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "renderingConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isDepthEffectDisabled");

  v16 = (v15 & 1) != 0 || *(_BYTE *)(a1 + 66) != 0;
  objc_msgSend(v8, "pr_setDepthEffectDisallowed:", v16);
  objc_msgSend(v8, "pr_setWakeSourceIsSwipeToUnlock:", *(unsigned __int8 *)(a1 + 67));
  IsActive = soft_PUIDynamicRotationIsActive();
  v18 = *(_QWORD *)(a1 + 32);
  if ((IsActive & 1) != 0)
  {
    v19 = *(_QWORD *)(v18 + 1128);
    v20 = objc_msgSend(v8, "pui_deviceOrientation");
    if (!v20)
      v20 = objc_msgSend(v8, "interfaceOrientation");
    if (v20 != v19)
    {
      objc_msgSend(v8, "pui_setDeviceOrientation:", v19);
      v10 |= 0x40uLL;
    }
  }
  else
  {
    v21 = *(_QWORD *)(v18 + 1120);
    if (objc_msgSend(v8, "interfaceOrientation") != v21)
    {
      objc_msgSend(v8, "setInterfaceOrientation:", v21);
      v10 |= 0x20uLL;
    }
  }
  if ((v10 & 0x61) == 0 || v9 == 0)
    v23 = 1;
  else
    v23 = v11;
  if ((v23 & 1) != 0 || !objc_msgSend(v7, "isActive"))
  {
    PBUIRenderingLogFenceReason();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFrom_PBUIPosterViewControllerUpdateReasons(v10);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v32;
      _os_log_impl(&dword_1B71C0000, v26, OS_LOG_TYPE_DEFAULT, "Poster scenes un-fenced update for reasons: %{public}@", (uint8_t *)&v33, 0xCu);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "window");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "windowScene");
    v26 = objc_claimAutoreleasedReturnValue();

    -[NSObject _synchronizeDrawing](v26, "_synchronizeDrawing");
    -[NSObject _synchronizedDrawingFence](v26, "_synchronizedDrawingFence");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAnimationFence:", v27);

    v28 = (void *)MEMORY[0x1E0D016B0];
    objc_msgSend(MEMORY[0x1E0CEABB0], "inheritedAnimationDuration");
    objc_msgSend(v28, "settingsWithDuration:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAnimationSettings:", v29);

    PBUIRenderingLogFenceReason();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFrom_PBUIPosterViewControllerUpdateReasons(v10);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v31;
      _os_log_impl(&dword_1B71C0000, v30, OS_LOG_TYPE_DEFAULT, "Poster scenes FENCED update for reasons: %{public}@", (uint8_t *)&v33, 0xCu);

    }
  }

}

void __68__PBUIPosterViewController_requireWallpaperRasterizationWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateRasterization");

}

- (void)_updateRasterization
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v3 = -[BSCompoundAssertion isActive](self->_shouldRasterizeWallpaperAssertion, "isActive");
  -[PBUIPosterViewController viewIfLoaded](self, "viewIfLoaded");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldRasterize:", v3);
  if (self->_activeVariant != 1
    || (v5 = 1.0, !-[PBUIPosterHomeViewController isBlurred](self->_homeViewController, "isBlurred")))
  {
    objc_msgSend(v9, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    if (v8 == 0.0)
      v5 = 1.0;
    else
      v5 = v8;

  }
  objc_msgSend(v4, "setRasterizationScale:", v5);

}

uint64_t __32__PBUIPosterViewController_init__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "snapshotSourceProvider");
}

- (id)snapshotSourceProviderForActiveVariant
{
  return self->_activeVariantReplicaProvider;
}

- (id)legibilitySettingsForVariant:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PBUIPosterViewController _viewControllerForVariant:](self, "_viewControllerForVariant:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "legibilitySettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PBUIPosterViewController)init
{
  PBUIPosterViewController *v2;
  PBUIPosterViewController *v3;
  PBUIDefaultSessionReconnectPolicy *v4;
  PBUISessionReconnectPolicy *reconnectPolicy;
  PBUIDynamicProviderWrapper *v6;
  PBUIDynamicProviderWrapper *lockReplicaProvider;
  PBUIDynamicProviderWrapper *v8;
  PBUIDynamicProviderWrapper *homeReplicaProvider;
  PBUIDynamicProviderWrapper *v10;
  PBUIDynamicProviderWrapper *lockFloatingLayerReplicaProvider;
  PBUIDynamicProviderWrapper *v12;
  PBUIDynamicProviderWrapper *activeVariantReplicaProvider;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PBUIPosterViewController;
  v2 = -[PBUIPosterViewController init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_activelyRequired = 0;
    v2->_activeStyle = 0;
    v2->_activeVariant = -1;
    v2->_activeOrientation = 1;
    v2->_deviceOrientation = 0;
    v4 = objc_alloc_init(PBUIDefaultSessionReconnectPolicy);
    reconnectPolicy = v3->_reconnectPolicy;
    v3->_reconnectPolicy = (PBUISessionReconnectPolicy *)v4;

    v3->_unlockProgress = -1.0;
    v3->_landscapeBlurEnabled = 0;
    v3->_lockWallpaperStyle = 0;
    v3->_homeScreenUpdateLock._os_unfair_lock_opaque = 0;
    v6 = -[PBUIDynamicProviderWrapper initWithRootObject:portalProvider:snapshotProvider:]([PBUIDynamicProviderWrapper alloc], "initWithRootObject:portalProvider:snapshotProvider:", 0, &__block_literal_global_22, &__block_literal_global_4_0);
    lockReplicaProvider = v3->_lockReplicaProvider;
    v3->_lockReplicaProvider = v6;

    v8 = -[PBUIDynamicProviderWrapper initWithRootObject:portalProvider:snapshotProvider:]([PBUIDynamicProviderWrapper alloc], "initWithRootObject:portalProvider:snapshotProvider:", 0, &__block_literal_global_6_0, &__block_literal_global_8_0);
    homeReplicaProvider = v3->_homeReplicaProvider;
    v3->_homeReplicaProvider = v8;

    v10 = -[PBUIDynamicProviderWrapper initWithRootObject:portalProvider:snapshotProvider:]([PBUIDynamicProviderWrapper alloc], "initWithRootObject:portalProvider:snapshotProvider:", 0, &__block_literal_global_9, 0);
    lockFloatingLayerReplicaProvider = v3->_lockFloatingLayerReplicaProvider;
    v3->_lockFloatingLayerReplicaProvider = v10;

    v12 = -[PBUIDynamicProviderWrapper initWithRootObject:portalProvider:snapshotProvider:]([PBUIDynamicProviderWrapper alloc], "initWithRootObject:portalProvider:snapshotProvider:", 0, &__block_literal_global_11, &__block_literal_global_13_1);
    activeVariantReplicaProvider = v3->_activeVariantReplicaProvider;
    v3->_activeVariantReplicaProvider = v12;

  }
  return v3;
}

uint64_t __32__PBUIPosterViewController_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "portalSourceProvider");
}

uint64_t __32__PBUIPosterViewController_init__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "snapshotSourceProvider");
}

uint64_t __32__PBUIPosterViewController_init__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "portalSourceProvider");
}

uint64_t __32__PBUIPosterViewController_init__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "snapshotSourceProvider");
}

uint64_t __32__PBUIPosterViewController_init__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "portalProviderForFloatingLayer");
}

uint64_t __32__PBUIPosterViewController_init__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "portalSourceProvider");
}

- (void)dealloc
{
  BSCompoundAssertion *shouldRasterizeWallpaperAssertion;
  objc_super v4;

  -[BSCompoundAssertion invalidate](self->_shouldRasterizeWallpaperAssertion, "invalidate");
  shouldRasterizeWallpaperAssertion = self->_shouldRasterizeWallpaperAssertion;
  self->_shouldRasterizeWallpaperAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterViewController;
  -[PBUIPosterViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)updateConfiguration:(id)a3
{
  PRSPosterConfiguration *configuration;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void (**v17)(void);
  NSObject *v18;
  PBUIPosterLockViewController *v19;
  PBUIPosterLockViewController *lockViewController;
  NSObject *v21;
  void *v22;
  FBScene *scene;
  BOOL v24;
  id v26;
  _QWORD v27[5];
  id v28;
  uint8_t v29[8];
  _QWORD v30[5];
  id v31;
  id location;
  _BYTE buf[24];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  configuration = self->_configuration;
  if (configuration)
  {
    -[PRSPosterConfiguration _path](configuration, "_path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serverIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "posterUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "posterUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (v12)
    {
      objc_storeStrong((id *)&self->_configuration, a3);
      v13 = objc_msgSend(v9, "version");
      LOBYTE(v13) = v13 == objc_msgSend(v8, "version");
      PBUILogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if ((v13 & 1) != 0)
      {
        if (v15)
        {
          -[FBScene pui_shortDescription](self->_scene, "pui_shortDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v16;
          _os_log_impl(&dword_1B71C0000, v14, OS_LOG_TYPE_DEFAULT, "Refreshing lock poster %{public}@.", buf, 0xCu);

        }
      }
      else if (v15)
      {
        -[FBScene pui_shortDescription](self->_scene, "pui_shortDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = objc_msgSend(v8, "version");
        *(_WORD *)&buf[22] = 2048;
        v34 = objc_msgSend(v9, "version");
        _os_log_impl(&dword_1B71C0000, v14, OS_LOG_TYPE_DEFAULT, "Updating lock poster %{public}@ from version %llu to %llu.", buf, 0x20u);

      }
      scene = self->_scene;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __48__PBUIPosterViewController_updateConfiguration___block_invoke_21;
      v27[3] = &unk_1E6B96A98;
      v27[4] = self;
      v28 = v7;
      -[FBScene pb_update:](scene, "pb_update:", v27);

    }
    else
    {
      PBUILogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B71C0000, v21, OS_LOG_TYPE_DEFAULT, "Cannot update to proposed poster configuration.", buf, 2u);
      }

    }
    if (!v12)
    {
      v24 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v34) = 0;
    objc_initWeak(&location, self);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __48__PBUIPosterViewController_updateConfiguration___block_invoke;
    v30[3] = &unk_1E6B96A70;
    objc_copyWeak(&v31, &location);
    v30[4] = buf;
    v17 = (void (**)(void))MEMORY[0x1BCCA5978](v30);
    v17[2]();
    if (!self->_scene)
    {
      PBUILogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1B71C0000, v18, OS_LOG_TYPE_DEFAULT, "Failed to create new poster scene. Trying again.", v29, 2u);
      }

      *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 1;
      ((void (*)(void (**)(void)))v17[2])(v17);
    }
    v19 = -[PBUIPosterVariantViewController initWithScene:counterpart:]([PBUIPosterLockViewController alloc], "initWithScene:counterpart:", self->_scene, 0);
    lockViewController = self->_lockViewController;
    self->_lockViewController = v19;

    -[PBUIPosterVariantViewController setDelegate:](self->_lockViewController, "setDelegate:", self);
    -[PBUIPosterViewController setActiveStyle:forVariant:](self, "setActiveStyle:forVariant:", self->_lockWallpaperStyle, 0);
    -[PBUIPosterViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_lockViewController);
    -[PBUIPosterViewController _createHomeViewControllerIfNeeded](self, "_createHomeViewControllerIfNeeded");
    -[PBUIPosterViewController _updateLockViewControllerVisibility](self, "_updateLockViewControllerVisibility");
    -[PBUIDynamicProviderWrapper setRootObject:](self->_lockReplicaProvider, "setRootObject:", self->_lockViewController);
    -[PBUIDynamicProviderWrapper setRootObject:](self->_lockFloatingLayerReplicaProvider, "setRootObject:", self->_lockViewController);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
  -[PBUIPosterViewController _updateForActiveVariant:](self, "_updateForActiveVariant:", 1);
  v24 = 1;
LABEL_20:

  return v24;
}

void __48__PBUIPosterViewController_updateConfiguration___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1E0D22960];
    getPUISceneRoleRendering();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[121], "_path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pr_createPosterSceneWithRole:path:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setDelegate:", WeakRetained);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__PBUIPosterViewController_updateConfiguration___block_invoke_2;
    v9[3] = &unk_1E6B95618;
    v9[4] = WeakRetained;
    objc_msgSend(v6, "pb_update:", v9);
    objc_storeStrong(WeakRetained + 125, v6);
    if (v6)
    {
      PBUILogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "pui_shortDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v11 = v8;
        _os_log_impl(&dword_1B71C0000, v7, OS_LOG_TYPE_DEFAULT, "Created new poster scene: %@", buf, 0xCu);

      }
    }
    else
    {
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
LABEL_9:

        goto LABEL_10;
      }
      PBUILogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B71C0000, v7, OS_LOG_TYPE_DEFAULT, "Failed to create new poster scene again.", buf, 2u);
      }
    }

    goto LABEL_9;
  }
LABEL_10:

}

void __48__PBUIPosterViewController_updateConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1;
  objc_msgSend(v7, "setForeground:", 1);
  objc_msgSend(v3, "bounds");
  objc_msgSend(v7, "setFrame:");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1120);
  if (soft_PUIDynamicRotationIsActive())
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128);
  objc_msgSend(v7, "setInterfaceOrientation:", v5);
  objc_msgSend(v7, "pui_setDeviceOrientation:", v4);
  objc_msgSend(v7, "setDisplayConfiguration:", v3);
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  objc_msgSend(v7, "setActivityMode:", 4294967293);
  objc_msgSend(v7, "pb_setActiveVariant:", 0);
  objc_msgSend(v7, "pb_applyLegacySettings");

}

void __48__PBUIPosterViewController_updateConfiguration___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "pr_posterConfiguredProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "pr_updateWithPath:inSettings:", *(_QWORD *)(a1 + 40), v6);
  objc_msgSend(v6, "pb_applyLegacySettings");
  objc_msgSend(v6, "pr_posterConfiguredProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "homeScreenConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeScreenConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    PBUILogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "pui_shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1B71C0000, v12, OS_LOG_TYPE_DEFAULT, "Home appearance changed for %{public}@.", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(v5, "pb_setHomeAppearanceChanged:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_updateLockViewControllerVisibility");
  }

}

- (BOOL)updateAssociatedPosterConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_associatedConfiguration, a3);
  return -[PBUIPosterViewController updateHomeScene](self, "updateHomeScene");
}

- (BOOL)updateHomeScene
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  FBScene *homeScene;
  FBScene *v34;
  PBUIPosterHomeViewController *homeViewController;
  void *v36;
  void *v37;
  FBScene *v38;
  FBScene *v39;
  PBUIPosterVariantPathProvider *v40;
  void *v41;
  PBUIPosterVariantPathProvider *v42;
  PBUIURLBackedSnapshotSource *v43;
  void *v44;
  PBUIURLBackedSnapshotSource *v45;
  void *v46;
  uint64_t v47;
  FBScene *v48;
  id v49;
  FBScene *v50;
  void *v51;
  BOOL v52;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  FBScene *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[5];
  _QWORD v68[4];
  id v69;
  _QWORD v70[5];
  id v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  -[FBScene settings](self->_homeScene, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pui_posterContents");
  v4 = objc_claimAutoreleasedReturnValue();

  -[PRSPosterConfiguration pr_loadHomeScreenConfigurationWithError:](self->_configuration, "pr_loadHomeScreenConfigurationWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "selectedAppearanceType") == 3
    && (-[PRSPosterConfiguration _path](self->_associatedConfiguration, "_path"),
        (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    v8 = 1;
    objc_msgSend((id)v4, "serverIdentity", 968);
  }
  else
  {
    if (-[FBScene pui_isLegacyProvider](self->_scene, "pui_isLegacyProvider"))
    {
      -[PBUIPosterViewController _legacyWallpaperConfigurationManager](self, "_legacyWallpaperConfigurationManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "variantsShareWallpaperConfiguration") & 1) != 0)
      {
        v7 = 0;
      }
      else
      {
        -[PRSPosterConfiguration _path](self->_configuration, "_path");
        v7 = objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v7 = 0;
    }
    v8 = v7 != 0;
    if (!(v4 | v7))
    {
      v52 = 0;
      goto LABEL_30;
    }
    objc_msgSend((id)v4, "serverIdentity", 968);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "serverIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v10;
  v66 = v11;
  if (!v8)
    goto LABEL_21;
  objc_msgSend(v10, "posterUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "posterUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  v11 = v66;
  if (!v14)
  {
LABEL_21:
    homeScene = self->_homeScene;
LABEL_22:
    -[FBScene pui_invalidateWithCompletion:](homeScene, "pui_invalidateWithCompletion:", 0);
    v34 = self->_homeScene;
    self->_homeScene = 0;

    -[PBUIPosterVariantViewController invalidate](self->_homeViewController, "invalidate");
    -[PBUIPosterViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", self->_homeViewController);
    homeViewController = self->_homeViewController;
    self->_homeViewController = 0;

    if (v8)
    {
      v36 = (void *)MEMORY[0x1E0D22960];
      getPUISceneRoleRendering();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "pr_createPosterSceneWithRole:path:", v37, v7);
      v38 = (FBScene *)objc_claimAutoreleasedReturnValue();
      v39 = self->_homeScene;
      self->_homeScene = v38;

      -[FBScene setDelegate:](self->_homeScene, "setDelegate:", self);
      v40 = [PBUIPosterVariantPathProvider alloc];
      objc_msgSend((id)v7, "instanceURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[PBUIPosterVariantPathProvider initWithInstanceURL:variant:](v40, "initWithInstanceURL:variant:", v41, 1);

      v43 = [PBUIURLBackedSnapshotSource alloc];
      +[PBUIPosterVariantViewController snapshotFormat](PBUIPosterHomeViewController, "snapshotFormat");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[PBUIURLBackedSnapshotSource initWithPathProvider:format:](v43, "initWithPathProvider:format:", v42, v44);

      -[PBUIURLBackedSnapshotSource posterPreferredProminentColor](v45, "posterPreferredProminentColor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = MEMORY[0x1E0C809B0];
      if (v46
        || (objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v63), "pr_suggestedTintColor"),
            (v46 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v48 = self->_homeScene;
        v68[0] = v47;
        v68[1] = 3221225472;
        v68[2] = __43__PBUIPosterViewController_updateHomeScene__block_invoke_2;
        v68[3] = &unk_1E6B956E8;
        v49 = v46;
        v69 = v49;
        -[FBScene configureParameters:](v48, "configureParameters:", v68);

      }
      else
      {
        v49 = 0;
      }
      v50 = self->_homeScene;
      v67[0] = v47;
      v67[1] = 3221225472;
      v67[2] = __43__PBUIPosterViewController_updateHomeScene__block_invoke_4;
      v67[3] = &unk_1E6B95618;
      v67[4] = self;
      -[FBScene pb_update:](v50, "pb_update:", v67);

      v11 = v66;
    }
    -[PBUIPosterViewController _updateLockViewControllerVisibility](self, "_updateLockViewControllerVisibility");
    -[PBUIPosterViewController _createHomeViewControllerIfNeeded](self, "_createHomeViewControllerIfNeeded");
    v51 = v65;
    goto LABEL_28;
  }
  v64 = v5;
  v15 = objc_msgSend(v66, "version");
  v16 = objc_msgSend(v10, "version");
  objc_msgSend((id)v4, "contentsURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "contentsURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqual:", v18);

  if (v15 == v16)
  {
    v5 = v64;
    if ((v19 & 1) == 0)
    {
      PBUILogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PBUIPosterViewController updateHomeScene].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

    }
    PBUILogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      -[FBScene pui_shortDescription](self->_scene, "pui_shortDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v29;
      v30 = "Refreshing home poster %{public}@.";
      v31 = v28;
      v32 = 12;
LABEL_37:
      _os_log_impl(&dword_1B71C0000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);

    }
  }
  else
  {
    v5 = v64;
    if (v19)
    {
      PBUILogCommon();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        -[PBUIPosterViewController updateHomeScene].cold.2(v54, v55, v56, v57, v58, v59, v60, v61);

    }
    PBUILogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      -[FBScene pui_shortDescription](self->_scene, "pui_shortDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v73 = v29;
      v74 = 2048;
      v75 = objc_msgSend(v65, "version");
      v76 = 2048;
      v77 = objc_msgSend(v66, "version");
      v30 = "Updating home poster %{public}@ from version %llu to %llu.";
      v31 = v28;
      v32 = 32;
      goto LABEL_37;
    }
  }

  v62 = self->_homeScene;
  if (!v62)
  {
    homeScene = 0;
    v11 = v66;
    goto LABEL_22;
  }
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __43__PBUIPosterViewController_updateHomeScene__block_invoke;
  v70[3] = &unk_1E6B96A98;
  v70[4] = self;
  v71 = (id)v7;
  -[FBScene pb_update:](v62, "pb_update:", v70);

  v51 = v65;
  v11 = v66;
LABEL_28:

  v52 = 1;
LABEL_30:

  return v52;
}

void __43__PBUIPosterViewController_updateHomeScene__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  v7 = a3;
  v6 = a2;
  objc_msgSend(v5, "pr_updateWithPath:inSettings:", v4, v6);
  objc_msgSend(v6, "pb_applyLegacySettings");

  objc_msgSend(v7, "pb_setHomeAppearanceChanged:", 1);
}

void __43__PBUIPosterViewController_updateHomeScene__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__PBUIPosterViewController_updateHomeScene__block_invoke_3;
  v3[3] = &unk_1E6B96AC0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "updateClientSettingsWithBlock:", v3);

}

void __43__PBUIPosterViewController_updateHomeScene__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "BSColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pr_setPreferredProminentColor:", v4);

}

void __43__PBUIPosterViewController_updateHomeScene__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1;
  objc_msgSend(v6, "setForeground:", 1);
  objc_msgSend(v3, "bounds");
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(v6, "setInterfaceOrientation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1120));
  if (soft_PUIDynamicRotationIsActive())
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128);
  objc_msgSend(v6, "pui_setDeviceOrientation:", v4);
  objc_msgSend(v6, "setDisplayConfiguration:", v3);
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

  objc_msgSend(v6, "setActivityMode:", 4294967293);
  objc_msgSend(v6, "pb_setActiveVariant:", 1);
  objc_msgSend(v6, "pb_applyLegacySettings");

}

- (void)activateWithCompletion:(id)a3
{
  -[PBUIPosterViewController _updatePosterScenesForReasons:completion:](self, "_updatePosterScenesForReasons:completion:", 8, a3);
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3
{
  FBScene *scene;
  _QWORD v6[5];

  -[PBUIPosterHomeViewController noteWillRotateToInterfaceOrientation:](self->_homeViewController, "noteWillRotateToInterfaceOrientation:");
  -[PBUIPosterVariantViewController noteWillRotateToInterfaceOrientation:](self->_lockViewController, "noteWillRotateToInterfaceOrientation:", a3);
  self->_deviceOrientation = a3;
  scene = self->_scene;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PBUIPosterViewController_willRotateToInterfaceOrientation___block_invoke;
  v6[3] = &__block_descriptor_40_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
  v6[4] = a3;
  -[FBScene pb_update:](scene, "pb_update:", v6);
}

void __61__PBUIPosterViewController_willRotateToInterfaceOrientation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (soft_PUIDynamicRotationIsActive())
    v4 = *(_QWORD *)(a1 + 32);
  else
    v4 = 1;
  objc_msgSend(v5, "pui_setDeviceOrientation:", v4);

}

- (void)didRotateToInterfaceOrientation:(int64_t)a3
{
  -[PBUIPosterHomeViewController noteDidRotateToInterfaceOrientation:](self->_homeViewController, "noteDidRotateToInterfaceOrientation:");
  -[PBUIPosterVariantViewController noteDidRotateToInterfaceOrientation:](self->_lockViewController, "noteDidRotateToInterfaceOrientation:", a3);
}

- (void)finishUnlockWithAnimationParameters:(CGSize)a3
{
  FBScene *scene;
  _QWORD v4[5];
  CGSize v5;

  scene = self->_scene;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__PBUIPosterViewController_finishUnlockWithAnimationParameters___block_invoke;
  v4[3] = &unk_1E6B96B08;
  v5 = a3;
  v4[4] = self;
  -[FBScene pb_update:](scene, "pb_update:", v4);
}

uint64_t __64__PBUIPosterViewController_finishUnlockWithAnimationParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a3)
    return objc_msgSend(a3, "pr_setFinishUnlockParameters:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1136) = 0x3FF0000000000000;
  return objc_msgSend(a2, "pr_setUnlockProgress:", 1.0);
}

- (id)averageColorForVariant:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PBUIPosterViewController _viewControllerForVariant:](self, "_viewControllerForVariant:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "averageColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)averageContrastForVariant:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[PBUIPosterViewController _viewControllerForVariant:](self, "_viewControllerForVariant:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "averageContrast");
  v5 = v4;

  return v5;
}

- (id)scenesForBacklightSession
{
  void *v2;

  if (self->_scene)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)noteUserTapOccurred
{
  -[FBScene pui_postSignificantEvent:](self->_scene, "pui_postSignificantEvent:", 2);
}

- (void)noteUserTapOccurredWithLocation:(CGPoint)a3
{
  -[FBScene pui_postUserTapEventWithLocation:](self->_scene, "pui_postUserTapEventWithLocation:", a3.x, a3.y);
}

- (BOOL)userTapEventsRequested
{
  void *v3;
  uint64_t v4;
  void *v6;
  char v7;

  -[FBScene clientSettings](self->_scene, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pui_significantEventOptions");

  if ((soft_PUIPosterSignificantEventOptionsContainsEvent(v4, 2) & 1) != 0)
    return 1;
  -[FBScene clientSettings](self->_scene, "clientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "pui_userTapEventsRequested");

  return v7;
}

- (unint64_t)significantEventsCounterForPosterWithIdentifier:(id)a3
{
  FBScene *scene;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  unint64_t v11;

  scene = self->_scene;
  v5 = a3;
  -[FBScene pui_posterPath](scene, "pui_posterPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "posterUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v5);

  if (v9)
  {
    -[FBScene settings](self->_scene, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "pb_significantEventsCounter");

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)posterSignificantEventsCounter
{
  void *v2;
  unint64_t v3;

  -[FBScene settings](self->_scene, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pb_significantEventsCounter");

  return v3;
}

- (void)updateLegacyPoster
{
  OUTLINED_FUNCTION_3_0(&dword_1B71C0000, a1, a3, "Ignoring change because no Legacy poster exists.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0_1();
}

- (BOOL)handlesWakeAnimation
{
  void *v2;
  char v3;

  -[FBScene clientSettings](self->_scene, "clientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pr_handlesWakeAnimation");

  return v3;
}

- (BOOL)hidesDimmingLayer
{
  void *v2;
  char v3;

  -[FBScene clientSettings](self->_scene, "clientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pr_hideDimmingLayer");

  return v3;
}

- (void)setWallpaperObscured:(BOOL)a3
{
  FBScene *scene;
  _QWORD v4[4];
  BOOL v5;

  scene = self->_scene;
  if (scene)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __49__PBUIPosterViewController_setWallpaperObscured___block_invoke;
    v4[3] = &__block_descriptor_33_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
    v5 = a3;
    -[FBScene pb_update:](scene, "pb_update:", v4);
  }
}

uint64_t __49__PBUIPosterViewController_setWallpaperObscured___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pui_setWallpaperObscured:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setUnlockProgress:(double)a3
{
  int IsOne;
  int v6;

  if (self->_unlockProgress != a3)
  {
    IsOne = BSFloatIsOne();
    v6 = BSFloatIsOne();
    self->_unlockProgress = a3;
    if (IsOne != v6)
      -[PBUIPosterViewController _updateLockViewControllerVisibility](self, "_updateLockViewControllerVisibility");
    -[PBUIPosterViewController _updateHomeViewControllerVisibility](self, "_updateHomeViewControllerVisibility");
  }
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_delegate, 0);
  -[FBScene pui_invalidateWithCompletion:](self->_scene, "pui_invalidateWithCompletion:", 0);
  -[FBScene pui_invalidateWithCompletion:](self->_homeScene, "pui_invalidateWithCompletion:", 0);
  -[PBUIPosterLockViewController invalidate](self->_lockViewController, "invalidate");
  -[PBUIPosterVariantViewController invalidate](self->_homeViewController, "invalidate");
  -[PBUIDynamicProviderWrapper invalidate](self->_lockReplicaProvider, "invalidate");
  -[PBUIDynamicProviderWrapper invalidate](self->_homeReplicaProvider, "invalidate");
  -[PBUIDynamicProviderWrapper invalidate](self->_lockFloatingLayerReplicaProvider, "invalidate");
  -[PBUIDynamicProviderWrapper invalidate](self->_activeVariantReplicaProvider, "invalidate");
}

- (void)fetchWallpaperProminentColor:(id)a3
{
  id v5;
  void *homeViewController;
  void *v7;
  id v8;

  v5 = a3;
  homeViewController = self->_homeViewController;
  if (homeViewController || (homeViewController = self->_lockViewController) != 0)
  {
    v8 = v5;
    objc_msgSend(homeViewController, "fetchWallpaperProminentColor:", v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lockViewController/homeViewController is nil!"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterViewController fetchWallpaperProminentColor:].cold.1(a2, (uint64_t)self, (uint64_t)v7);
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (PBUIHomeVariantStyleState)currentHomeVariantStyleState
{
  PRSPosterConfiguration *configuration;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_homeViewController)
  {
    -[PBUIPosterHomeViewController currentHomeVariantStyleState](self->_homeViewController, "currentHomeVariantStyleState");
    return (PBUIHomeVariantStyleState *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    configuration = self->_configuration;
    if (configuration)
    {
      v8 = 0;
      -[PRSPosterConfiguration pr_loadHomeScreenConfigurationWithError:](configuration, "pr_loadHomeScreenConfigurationWithError:", &v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v8;
      if (v5)
      {
        PBUILogCommon();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v10 = v5;
          _os_log_impl(&dword_1B71C0000, v6, OS_LOG_TYPE_DEFAULT, "Error loading home screen configuration: %{public}@", buf, 0xCu);
        }

        v7 = 0;
      }
      else
      {
        PBUIHomeVariantStyleStateFromPRPosterHomeScreenConfiguration(v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }

      return (PBUIHomeVariantStyleState *)v7;
    }
    else
    {
      return (PBUIHomeVariantStyleState *)0;
    }
  }
}

- (void)noteHomeVariantStyleStateMayHaveUpdated
{
  -[PBUIPosterHomeViewController noteHomeVariantStyleStateMayHaveUpdated](self->_homeViewController, "noteHomeVariantStyleStateMayHaveUpdated");
}

- (BOOL)updateCurrentPosterWithUpdates:(id)a3 error:(id *)a4
{
  id v6;
  PRSPosterConfiguration *v7;
  id PRSPosterUpdaterClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self->_configuration;
  if (v7)
  {
    PRSPosterUpdaterClass = getPRSPosterUpdaterClass();
    -[PRSPosterConfiguration _path](v7, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PRSPosterUpdaterClass, "updaterForPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(a4) = objc_msgSend(v10, "applyUpdatesLocally:error:", v6, a4);
    if ((_DWORD)a4)
      -[PBUIPosterHomeViewController noteHomeVariantStyleStateMayHaveUpdated](self->_homeViewController, "noteHomeVariantStyleStateMayHaveUpdated");

  }
  else if (a4)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D68];
    v15[0] = CFSTR("No poster set; cannot updateCurrentPosterWithUpdates:error:");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PaperBoardUI"), -1, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (id)acquireDuckHomeScreenWallpaperDimAssertionWithReason:(id)a3
{
  void *homeViewController;

  homeViewController = self->_homeViewController;
  if (homeViewController)
  {
    objc_msgSend(homeViewController, "acquireDuckHomeScreenWallpaperDimAssertionWithReason:", a3);
    homeViewController = (void *)objc_claimAutoreleasedReturnValue();
  }
  return homeViewController;
}

- (id)_activeViewController
{
  id *p_homeViewController;
  int64_t activeVariant;
  id v5;

  p_homeViewController = (id *)&self->_homeViewController;
  if (-[PBUIPosterHomeViewController reflectsLock](self->_homeViewController, "reflectsLock"))
  {
LABEL_4:
    p_homeViewController = (id *)&self->_lockViewController;
    goto LABEL_5;
  }
  activeVariant = self->_activeVariant;
  if (activeVariant != 1)
  {
    if (activeVariant)
    {
      v5 = 0;
      return v5;
    }
    goto LABEL_4;
  }
LABEL_5:
  v5 = *p_homeViewController;
  return v5;
}

- (id)_replicaProviderForVariant:(int64_t)a3
{
  int *v3;

  v3 = &OBJC_IVAR___PBUIPosterViewController__homeReplicaProvider;
  if (!a3)
    v3 = &OBJC_IVAR___PBUIPosterViewController__lockReplicaProvider;
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (void)_updateHomeViewControllerVisibility
{
  -[PBUIPosterHomeViewController updateViewControllerVisibilityForUnlockProgress:](self->_homeViewController, "updateViewControllerVisibilityForUnlockProgress:", self->_unlockProgress);
}

uint64_t __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __69__PBUIPosterViewController__updatePosterScenesForReasons_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_createHomeViewControllerIfNeeded
{
  PBUIPosterHomeViewController *v3;
  PBUIPosterHomeViewController *homeViewController;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_homeViewController)
  {
    v3 = -[PBUIPosterVariantViewController initWithScene:counterpart:]([PBUIPosterHomeViewController alloc], "initWithScene:counterpart:", self->_homeScene, self->_lockViewController);
    homeViewController = self->_homeViewController;
    self->_homeViewController = v3;

    -[PBUIPosterVariantViewController setCounterpart:](self->_lockViewController, "setCounterpart:", self->_homeViewController);
    -[PBUIPosterViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_homeViewController);
    -[PBUIPosterVariantViewController setDelegate:](self->_homeViewController, "setDelegate:", self);
    -[PBUIDynamicProviderWrapper setRootObject:](self->_homeReplicaProvider, "setRootObject:", self->_homeViewController);
    PBUILogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[FBScene pui_shortDescription](self->_homeScene, "pui_shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1B71C0000, v5, OS_LOG_TYPE_DEFAULT, "Created new home poster scene: %@", (uint8_t *)&v7, 0xCu);

    }
    -[PBUIPosterViewController _updateForActiveVariant:](self, "_updateForActiveVariant:", 16);
  }
}

- (id)_legacyWallpaperConfigurationManager
{
  PBUIWallpaperConfigurationManager *lazy_legacyWallpaperConfigurationManager;
  PBUIWallpaperConfigurationManager *v4;
  PBUIWallpaperConfigurationManager *v5;

  lazy_legacyWallpaperConfigurationManager = self->_lazy_legacyWallpaperConfigurationManager;
  if (!lazy_legacyWallpaperConfigurationManager)
  {
    v4 = objc_alloc_init(PBUIWallpaperConfigurationManager);
    v5 = self->_lazy_legacyWallpaperConfigurationManager;
    self->_lazy_legacyWallpaperConfigurationManager = v4;

    lazy_legacyWallpaperConfigurationManager = self->_lazy_legacyWallpaperConfigurationManager;
  }
  return lazy_legacyWallpaperConfigurationManager;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterViewController;
  -[PBUIPosterViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PBUIPosterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PBUIPosterViewController;
  -[PBUIPosterViewController viewWillLayoutSubviews](&v7, sel_viewWillLayoutSubviews);
  -[PBUIPosterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIPosterLockViewController view](self->_lockViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");

  -[PBUIPosterHomeViewController view](self->_homeViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v5, "setFrame:");

  -[PBUIPosterHomeViewController view](self->_homeViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bringSubviewToFront:", v6);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBUIPosterViewController;
  -[PBUIPosterViewController traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PBUIPosterViewController_traitCollectionDidChange___block_invoke;
  v5[3] = &unk_1E6B95618;
  v5[4] = self;
  v4 = (void *)MEMORY[0x1BCCA5978](v5);
  -[FBScene pb_update:](self->_scene, "pb_update:", v4);
  -[FBScene pb_update:](self->_homeScene, "pb_update:", v4);

}

void __53__PBUIPosterViewController_traitCollectionDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "traitCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));

}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "processHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PBUILogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "pui_shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pb_shortDesc");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1B71C0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ now connected to %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  PBUILogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B71C0000, v5, OS_LOG_TYPE_DEFAULT, "Poster received actions: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  _QWORD block[5];
  uint8_t buf[4];
  double v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PBUILogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "pui_shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptionWithMultilinePrefix:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = *(double *)&v9;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_1B71C0000, v8, OS_LOG_TYPE_DEFAULT, "Poster %{public}@ deactivated with error: %{public}@", buf, 0x16u);

  }
  -[PBUISessionReconnectPolicy sessionDidDisconnect](self->_reconnectPolicy, "sessionDidDisconnect");
  if (-[PBUIPosterViewController _appearState](self, "_appearState"))
  {
    -[PBUISessionReconnectPolicy sessionReconnectDelay](self->_reconnectPolicy, "sessionReconnectDelay");
    v12 = v11;
    PBUILogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v12;
      _os_log_impl(&dword_1B71C0000, v13, OS_LOG_TYPE_DEFAULT, "Will attempt reactivation of wallpaper scene in %0.3f seconds.", buf, 0xCu);
    }

    v14 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PBUIPosterViewController_sceneDidDeactivate_withError___block_invoke;
    block[3] = &unk_1E6B94728;
    block[4] = self;
    dispatch_after(v14, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    PBUILogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B71C0000, v15, OS_LOG_TYPE_DEFAULT, "Not attempting reactivation of wallpaper scene at this time.", buf, 2u);
    }

  }
}

uint64_t __57__PBUIPosterViewController_sceneDidDeactivate_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePosterScenesForReasons:completion:", 4, 0);
}

- (int64_t)variant
{
  return self->_activeVariant;
}

- (UIColor)averageColor
{
  void *v2;
  void *v3;

  -[PBUIPosterViewController _activeViewController](self, "_activeViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "averageColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (double)averageContrast
{
  void *v2;
  double v3;
  double v4;

  -[PBUIPosterViewController _activeViewController](self, "_activeViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "averageContrast");
  v4 = v3;

  return v4;
}

- (_UILegibilitySettings)legibilitySettings
{
  _UILegibilitySettings *legibilitySettings;
  _UILegibilitySettings *v3;
  void *v4;

  legibilitySettings = self->_legibilitySettings;
  if (legibilitySettings)
  {
    v3 = legibilitySettings;
  }
  else
  {
    -[PBUIPosterViewController _activeViewController](self, "_activeViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "legibilitySettings");
    v3 = (_UILegibilitySettings *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)posterComponent:(id)a3 didUpdateLegibilitySettings:(id)a4
{
  int64_t activeVariant;
  id v7;

  v7 = a4;
  activeVariant = self->_activeVariant;
  if (activeVariant == objc_msgSend(a3, "variant"))
    -[PBUIPosterViewController _updateLegibilitySettings:](self, "_updateLegibilitySettings:", v7);

}

- (void)posterComponent:(id)a3 didUpdateHideDimmingLayer:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[PBUIPosterViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterComponent:didUpdateHideDimmingLayer:", self, v4);

}

- (void)posterComponent:(id)a3 didUpdatePreferredProminentColor:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PBUIPosterViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterComponent:didUpdatePreferredProminentColor:", self, v5);

}

- (id)posterComponentExternalDisplayConfiguration:(id)a3
{
  void *v4;
  void *v5;

  -[PBUIPosterViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterComponentExternalDisplayConfiguration:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)portalProviderForFloatingLayer
{
  return self->_lockFloatingLayerReplicaProvider;
}

- (id)portalSourceProviderForActiveVariant
{
  return self->_activeVariantReplicaProvider;
}

- (NSString)description
{
  return (NSString *)-[PBUIPosterViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIPosterViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIPosterViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  PBUIPosterViewController *v11;

  v4 = a3;
  -[PBUIPosterViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PBUIPosterViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6B94BC8;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __66__PBUIPosterViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1104), CFSTR("activelyRequired"));
  v3 = *(void **)(a1 + 32);
  PBUIWallpaperStyleDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1160));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("activeStyle"));

  v6 = *(void **)(a1 + 32);
  PBUIStringForWallpaperVariant(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "appendObject:withName:", v7, CFSTR("activeVariant"));

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1120);
  v10 = CFSTR("UIInterfaceOrientationLandscapeRight");
  v11 = CFSTR("UIInterfaceOrientationLandscapeLeft");
  v12 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
  if (v9 != 2)
    v12 = 0;
  if (v9 != 4)
    v11 = v12;
  if (v9 != 3)
    v10 = v11;
  if (v9 == 1)
    v13 = CFSTR("UIInterfaceOrientationPortrait");
  else
    v13 = v10;
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v13, CFSTR("activeOrientation"));
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("unlockProgress"), 2, *(double *)(*(_QWORD *)(a1 + 40) + 1136));
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1106), CFSTR("landscapeBlurEnabled"));
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 968), CFSTR("configuration"));
  v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 976), CFSTR("associatedConfiguration"));
  v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1016), CFSTR("lockController"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1056), CFSTR("homeController"));
}

- (PRSPosterConfiguration)activeConfiguration
{
  return self->_configuration;
}

- (PRSPosterConfiguration)associatedConfiguration
{
  return self->_associatedConfiguration;
}

- (int64_t)activeVariant
{
  return self->_activeVariant;
}

- (void)setActiveVariant:(int64_t)a3
{
  self->_activeVariant = a3;
}

- (int64_t)activeOrientation
{
  return self->_activeOrientation;
}

- (void)setActiveOrientation:(int64_t)a3
{
  self->_activeOrientation = a3;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

- (BOOL)activelyRequired
{
  return self->_activelyRequired;
}

- (double)unlockProgress
{
  return self->_unlockProgress;
}

- (BOOL)wakeSourceIsSwipeToUnlock
{
  return self->_wakeSourceIsSwipeToUnlock;
}

- (void)setWakeSourceIsSwipeToUnlock:(BOOL)a3
{
  self->_wakeSourceIsSwipeToUnlock = a3;
}

- (BOOL)landscapeBlurEnabled
{
  return self->_landscapeBlurEnabled;
}

- (void)setLandscapeBlurEnabled:(BOOL)a3
{
  self->_landscapeBlurEnabled = a3;
}

- (PBUIPosterComponentDelegate)delegate
{
  return (PBUIPosterComponentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BSPathProviding)storagePath
{
  return self->_storagePath;
}

- (int64_t)activeStyle
{
  return self->_activeStyle;
}

- (void)setActiveStyle:(int64_t)a3
{
  self->_activeStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storagePath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeScreenUpdateLock_service, 0);
  objc_storeStrong((id *)&self->_lazy_legacyWallpaperConfigurationManager, 0);
  objc_storeStrong((id *)&self->_shouldRasterizeWallpaperAssertion, 0);
  objc_storeStrong((id *)&self->_homeReplicaProvider, 0);
  objc_storeStrong((id *)&self->_homeViewController, 0);
  objc_storeStrong((id *)&self->_lockFloatingLayerReplicaProvider, 0);
  objc_storeStrong((id *)&self->_lockReplicaProvider, 0);
  objc_storeStrong((id *)&self->_activeVariantReplicaProvider, 0);
  objc_storeStrong((id *)&self->_lockViewController, 0);
  objc_storeStrong((id *)&self->_homeScene, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_reconnectPolicy, 0);
  objc_storeStrong((id *)&self->_associatedConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)updateHomeScene
{
  OUTLINED_FUNCTION_3_0(&dword_1B71C0000, a1, a3, "Poster versions differ, but paths match.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0_1();
}

- (void)fetchWallpaperProminentColor:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
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
  v15 = CFSTR("PBUIPosterViewController.m");
  v16 = 1024;
  v17 = 604;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1B71C0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
