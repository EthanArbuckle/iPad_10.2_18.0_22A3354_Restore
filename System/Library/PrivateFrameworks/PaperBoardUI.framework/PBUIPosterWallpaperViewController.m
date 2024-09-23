@implementation PBUIPosterWallpaperViewController

- (id)requireWallpaperWithReason:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  BSCompoundAssertion *v7;
  BSCompoundAssertion *wallpaperRequiredAssertion;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = v4;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperViewController requireWallpaperWithReason:].cold.1();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B71C2F20);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperViewController requireWallpaperWithReason:].cold.1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B71C2F84);
  }

  v6 = MEMORY[0x1E0C809B0];
  if (!self->_wallpaperRequiredAssertion)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __64__PBUIPosterWallpaperViewController_requireWallpaperWithReason___block_invoke;
    v21[3] = &unk_1E6B95E78;
    v21[4] = self;
    objc_msgSend(MEMORY[0x1E0D01718], "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("WallpaperRequired"), v21);
    v7 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    wallpaperRequiredAssertion = self->_wallpaperRequiredAssertion;
    self->_wallpaperRequiredAssertion = v7;

  }
  PBUILogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_1B71C0000, v9, OS_LOG_TYPE_DEFAULT, "Requiring wallpaper for reason: %@", buf, 0xCu);
  }

  -[BSCompoundAssertion acquireForReason:](self->_wallpaperRequiredAssertion, "acquireForReason:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D01868]);
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __64__PBUIPosterWallpaperViewController_requireWallpaperWithReason___block_invoke_49;
  v18[3] = &unk_1E6B95EA0;
  v19 = v5;
  v20 = v10;
  v12 = v10;
  v13 = v5;
  v14 = (void *)objc_msgSend(v11, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("WallpaperRequired"), v13, v18);

  return v14;
}

uint64_t __64__PBUIPosterWallpaperViewController_requireWallpaperWithReason___block_invoke_2(uint64_t a1)
{
  char v2;
  NSObject *v3;
  void *v4;
  _QWORD v6[4];
  char v7;
  uint8_t buf[16];

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = 1;
  }
  else
  {
    PBUILogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B71C0000, v3, OS_LOG_TYPE_DEFAULT, "Wallpaper is no longer required.", buf, 2u);
    }

    v2 = *(_BYTE *)(a1 + 40);
  }
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__PBUIPosterWallpaperViewController_requireWallpaperWithReason___block_invoke_46;
  v6[3] = &__block_descriptor_33_e30_v16__0___PBUIPosterUpdating__8l;
  v7 = v2;
  return objc_msgSend(v4, "updatePoster:", v6);
}

- (int64_t)activeStyleForVariant:(int64_t)a3
{
  return -[PBUIPosterViewController activeStyleForVariant:](self->_posterController, "activeStyleForVariant:", a3);
}

uint64_t __64__PBUIPosterWallpaperViewController_requireWallpaperWithReason___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "isActive");
  return BSDispatchMain();
}

- (id)requireWallpaperRasterizationWithReason:(id)a3
{
  return -[PBUIPosterViewController requireWallpaperRasterizationWithReason:](self->_posterController, "requireWallpaperRasterizationWithReason:", a3);
}

uint64_t __41__PBUIPosterWallpaperViewController_init__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "snapshotSourceProviderForActiveVariant");
}

- (void)setWallpaperStyle:(int64_t)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5
{
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant(a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIWallpaperStyleDescription(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperStylePriority(a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1B71C0000, v9, OS_LOG_TYPE_DEFAULT, "Setting %@ override style \"%@\" for %@", (uint8_t *)&v13, 0x20u);

  }
  self->_activeStyles[a5][a4] = a3;
  -[PBUIPosterWallpaperViewController _updateStyleForVariant:](self, "_updateStyleForVariant:", a5);
}

- (id)legibilitySettingsForVariant:(int64_t)a3
{
  return -[PBUIPosterViewController legibilitySettingsForVariant:](self->_posterController, "legibilitySettingsForVariant:", a3);
}

- (id)snapshotSourceProviderForActiveVariant
{
  return self->_activeVariantReplicaProvider;
}

- (PBUIPosterWallpaperViewController)init
{
  PBUIPosterWallpaperViewController *v2;
  PBUIPosterWallpaperViewController *v3;
  id *v4;
  int64x2_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  PRSWallpaperObserver *posterObserver;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  BSInvalidatable *keepForegroundRunning;
  PBUIPosterViewController *v17;
  PBUIPosterViewController *posterController;
  PBUIDynamicProviderWrapper *v19;
  PBUIDynamicProviderWrapper *lockPosterReplicaProvider;
  PBUIDynamicProviderWrapper *v21;
  PBUIDynamicProviderWrapper *homePosterReplicaProvider;
  PBUIDynamicProviderWrapper *v23;
  PBUIDynamicProviderWrapper *lockFloatingLayerPosterReplicaProvider;
  PBUIDynamicProviderWrapper *v25;
  PBUIDynamicProviderWrapper *activeVariantReplicaProvider;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)PBUIPosterWallpaperViewController;
  v2 = -[PBUIPosterWallpaperViewController init](&v31, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_activeVariant = -1;
    v4 = (id *)MEMORY[0x1E0CEB258];
    v2->_activeOrientation = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
    v3->_unlockProgress = -1.0;
    v5 = vdupq_lane_s64(-1, 0);
    *(int64x2_t *)&v3->_activeStyles[0][1] = v5;
    *(int64x2_t *)&v3->_activeStyles[1][1] = v5;
    *(int64x2_t *)&v3->_activeStyles[1][3] = v5;
    *(int64x2_t *)&v3->_activeStyles[0][3] = v5;
    objc_initWeak(&location, v3);
    getPRSWallpaperLocationStateObserverClass();
    v6 = (void *)objc_opt_new();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __41__PBUIPosterWallpaperViewController_init__block_invoke;
    v28[3] = &unk_1E6B95CD8;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v6, "setHandler:", v28);
    objc_msgSend(v6, "setLocations:", 12);
    objc_msgSend(v6, "setNeedsSandboxExtensions:", 1);
    v7 = objc_alloc_init((Class)getPRSWallpaperObserverConfigurationClass());
    objc_msgSend(v7, "setLocationStateObserver:", v6);
    dispatch_get_global_queue(25, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setQueue:", v8);

    v9 = objc_alloc((Class)getPRSWallpaperObserverClass());
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PBUIPosterWallpaperViewController-%p"), v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithExplanation:", v10);
    posterObserver = v3->_posterObserver;
    v3->_posterObserver = (PRSWallpaperObserver *)v11;

    -[PRSWallpaperObserver activateWithConfiguration:](v3->_posterObserver, "activateWithConfiguration:", v7);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v13, "BOOLForKey:", CFSTR("PBKeepWallpaperForegroundRunning"));

    if ((_DWORD)v9)
    {
      PBUILogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[PBUIPosterWallpaperViewController init].cold.1(v14);

      -[PBUIPosterWallpaperViewController requireWallpaperWithReason:](v3, "requireWallpaperWithReason:", CFSTR("KeepForegroundRunning"));
      v15 = objc_claimAutoreleasedReturnValue();
      keepForegroundRunning = v3->_keepForegroundRunning;
      v3->_keepForegroundRunning = (BSInvalidatable *)v15;

    }
    v17 = objc_alloc_init(PBUIPosterViewController);
    posterController = v3->_posterController;
    v3->_posterController = v17;

    -[PBUIPosterViewController setDelegate:](v3->_posterController, "setDelegate:", v3);
    if (+[PBUIPosterWallpaperRemoteViewController supportsLandscapeWallpaperContents](PBUIPosterWallpaperRemoteViewController, "supportsLandscapeWallpaperContents"))
    {
      -[PBUIPosterWallpaperViewController rotateToInterfaceOrientation:duration:](v3, "rotateToInterfaceOrientation:duration:", objc_msgSend(*v4, "activeInterfaceOrientation"), 0.0);
    }
    v19 = -[PBUIDynamicProviderWrapper initWithRootObject:portalProvider:snapshotProvider:]([PBUIDynamicProviderWrapper alloc], "initWithRootObject:portalProvider:snapshotProvider:", v3->_posterController, &__block_literal_global_12, &__block_literal_global_12_1);
    lockPosterReplicaProvider = v3->_lockPosterReplicaProvider;
    v3->_lockPosterReplicaProvider = v19;

    v21 = -[PBUIDynamicProviderWrapper initWithRootObject:portalProvider:snapshotProvider:]([PBUIDynamicProviderWrapper alloc], "initWithRootObject:portalProvider:snapshotProvider:", v3->_posterController, &__block_literal_global_13_0, &__block_literal_global_14_1);
    homePosterReplicaProvider = v3->_homePosterReplicaProvider;
    v3->_homePosterReplicaProvider = v21;

    v23 = -[PBUIDynamicProviderWrapper initWithRootObject:portalProvider:snapshotProvider:]([PBUIDynamicProviderWrapper alloc], "initWithRootObject:portalProvider:snapshotProvider:", v3->_posterController, &__block_literal_global_15_0, 0);
    lockFloatingLayerPosterReplicaProvider = v3->_lockFloatingLayerPosterReplicaProvider;
    v3->_lockFloatingLayerPosterReplicaProvider = v23;

    v25 = -[PBUIDynamicProviderWrapper initWithRootObject:portalProvider:snapshotProvider:]([PBUIDynamicProviderWrapper alloc], "initWithRootObject:portalProvider:snapshotProvider:", v3->_posterController, &__block_literal_global_16_0, &__block_literal_global_17_0);
    activeVariantReplicaProvider = v3->_activeVariantReplicaProvider;
    v3->_activeVariantReplicaProvider = v25;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __41__PBUIPosterWallpaperViewController_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_posterConfigsDidChange:withTransition:", v6, v5);

}

uint64_t __41__PBUIPosterWallpaperViewController_init__block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "portalSourceProviderForVariant:", 0);
}

uint64_t __41__PBUIPosterWallpaperViewController_init__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "snapshotSourceProviderForVariant:", 0);
}

uint64_t __41__PBUIPosterWallpaperViewController_init__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "portalSourceProviderForVariant:", 1);
}

uint64_t __41__PBUIPosterWallpaperViewController_init__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "snapshotSourceProviderForVariant:", 1);
}

uint64_t __41__PBUIPosterWallpaperViewController_init__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "portalProviderForFloatingLayer");
}

uint64_t __41__PBUIPosterWallpaperViewController_init__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "portalSourceProviderForActiveVariant");
}

- (void)setActiveVariant:(int64_t)a3
{
  PBUIPosterViewController *posterController;
  void *v6;
  _QWORD v7[6];

  if (PBUIWallpaperVariantIsValid(a3))
  {
    self->_activeVariant = a3;
    posterController = self->_posterController;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__PBUIPosterWallpaperViewController_setActiveVariant___block_invoke;
    v7[3] = &unk_1E6B95D20;
    v7[4] = self;
    v7[5] = a3;
    -[PBUIPosterViewController updatePoster:](posterController, "updatePoster:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid variant"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperViewController setActiveVariant:].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

uint64_t __54__PBUIPosterWallpaperViewController_setActiveVariant___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setActiveVariant:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateStyleForVariant:", *(_QWORD *)(a1 + 40));
}

- (void)setUnlockProgress:(double)a3
{
  int IsZero;
  int IsOne;
  NSObject *v7;
  const char *v8;
  int v9;
  BSInvalidatable *v10;
  BSInvalidatable *transitioningLockState;
  PBUIPosterViewController *posterController;
  BSInvalidatable *v13;
  BSInvalidatable *v14;
  _QWORD v15[5];
  uint8_t buf[16];

  if (self->_unlockProgress == a3)
    return;
  self->_unlockProgress = a3;
  IsZero = BSFloatIsZero();
  IsOne = BSFloatIsOne();
  if (IsOne)
  {
    PBUILogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "Now all the way unlocked.";
LABEL_8:
      _os_log_impl(&dword_1B71C0000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
    }
  }
  else
  {
    if (!IsZero)
    {
      if (!self->_transitioningLockState)
      {
        -[PBUIPosterWallpaperViewController requireWallpaperWithReason:](self, "requireWallpaperWithReason:", CFSTR("LockUnlock"));
        v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
        transitioningLockState = self->_transitioningLockState;
        self->_transitioningLockState = v10;

      }
      v9 = 0;
      goto LABEL_13;
    }
    PBUILogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "Now all the way locked.";
      goto LABEL_8;
    }
  }

  v9 = IsZero | IsOne;
LABEL_13:
  posterController = self->_posterController;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__PBUIPosterWallpaperViewController_setUnlockProgress___block_invoke;
  v15[3] = &__block_descriptor_40_e30_v16__0___PBUIPosterUpdating__8l;
  *(double *)&v15[4] = a3;
  -[PBUIPosterViewController updatePoster:](posterController, "updatePoster:", v15);
  if (v9)
  {
    v13 = self->_transitioningLockState;
    if (v13)
    {
      -[BSInvalidatable invalidate](v13, "invalidate");
      v14 = self->_transitioningLockState;
      self->_transitioningLockState = 0;

    }
  }
}

uint64_t __55__PBUIPosterWallpaperViewController_setUnlockProgress___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUnlockProgress:", *(double *)(a1 + 32));
}

- (void)setWakeSourceIsSwipeToUnlock:(BOOL)a3
{
  PBUIPosterViewController *posterController;
  _QWORD v4[4];
  BOOL v5;

  posterController = self->_posterController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__PBUIPosterWallpaperViewController_setWakeSourceIsSwipeToUnlock___block_invoke;
  v4[3] = &__block_descriptor_33_e30_v16__0___PBUIPosterUpdating__8l;
  v5 = a3;
  -[PBUIPosterViewController updatePoster:](posterController, "updatePoster:", v4);
}

uint64_t __66__PBUIPosterWallpaperViewController_setWakeSourceIsSwipeToUnlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWakeSourceIsSwipeToUnlock:", *(unsigned __int8 *)(a1 + 32));
}

- (void)fetchWallpaperProminentColor:(id)a3
{
  -[PBUIPosterViewController fetchWallpaperProminentColor:](self->_posterController, "fetchWallpaperProminentColor:", a3);
}

- (void)finishUnlockWithAnimationParameters:(CGSize)a3
{
  -[PBUIPosterViewController finishUnlockWithAnimationParameters:](self->_posterController, "finishUnlockWithAnimationParameters:", a3.width, a3.height);
}

- (void)updateConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  id v6;
  id v7;
  id v8;
  PBUIPosterViewController **p_posterController;
  PBUIPosterViewController *v10;
  uint64_t v11;
  PBUIPosterViewController *v12;
  void *v13;
  PBUIPosterViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  PBUIPosterViewController *v18;
  PBUIPosterViewController *v19;
  PBUIPosterViewController *v20;
  id v21;
  PBUIPosterViewController *v22;
  void *v23;
  _QWORD v24[5];
  PBUIPosterViewController *v25;
  id v26;
  id v27;
  _QWORD v28[5];
  PBUIPosterViewController *v29;
  _QWORD v30[5];
  PBUIPosterViewController *v31;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  NSClassFromString(CFSTR("PRSPosterConfiguration"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperViewController updateConfiguration:withAnimationSettings:].cold.1();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B72001D8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterWallpaperViewController updateConfiguration:withAnimationSettings:].cold.1();
    goto LABEL_15;
  }

  p_posterController = &self->_posterController;
  if (!-[PBUIPosterViewController updateConfiguration:](self->_posterController, "updateConfiguration:", v8))
  {
    v10 = *p_posterController;
    -[PBUIPosterViewController setDelegate:](v10, "setDelegate:", 0);
    v11 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke;
    v30[3] = &unk_1E6B94BC8;
    v30[4] = self;
    v12 = v10;
    v31 = v12;
    v13 = (void *)MEMORY[0x1BCCA5978](v30);
    v14 = objc_alloc_init(PBUIPosterViewController);
    -[PBUIPosterViewController view](v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIPosterWallpaperViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    objc_msgSend(v15, "setFrame:");

    objc_msgSend(v15, "setAutoresizingMask:", 18);
    objc_msgSend(v15, "setAlpha:", 0.0);
    if (v7)
    {
      objc_msgSend(v15, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAllowsGroupOpacity:", 1);

    }
    -[PBUIPosterWallpaperViewController bs_addChildViewController:](self, "bs_addChildViewController:", v14);
    objc_storeStrong((id *)&self->_posterController, v14);
    if (+[PBUIPosterWallpaperRemoteViewController supportsLandscapeWallpaperContents](PBUIPosterWallpaperRemoteViewController, "supportsLandscapeWallpaperContents"))
    {
      -[PBUIPosterWallpaperViewController rotateToInterfaceOrientation:duration:](self, "rotateToInterfaceOrientation:duration:", objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation"), 0.0);
    }
    -[PBUIPosterViewController setDelegate:](*p_posterController, "setDelegate:", self);
    -[PBUIPosterViewController updateConfiguration:](*p_posterController, "updateConfiguration:", v8);
    -[PBUIPosterWallpaperViewController _posterControllerDidChange](self, "_posterControllerDidChange");
    v18 = *p_posterController;
    v28[0] = v11;
    v28[1] = 3221225472;
    v28[2] = __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_2;
    v28[3] = &unk_1E6B95D88;
    v28[4] = self;
    v29 = v12;
    v19 = v12;
    -[PBUIPosterViewController updatePoster:](v18, "updatePoster:", v28);
    v20 = *p_posterController;
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_3;
    v24[3] = &unk_1E6B95E00;
    v24[4] = self;
    v25 = v14;
    v26 = v7;
    v27 = v13;
    v21 = v13;
    v22 = v14;
    -[PBUIPosterViewController activateWithCompletion:](v20, "activateWithCompletion:", v24);

  }
}

uint64_t __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bs_removeChildViewController:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

void __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!+[PBUIPosterWallpaperRemoteViewController supportsLandscapeWallpaperContents](PBUIPosterWallpaperRemoteViewController, "supportsLandscapeWallpaperContents"))objc_msgSend(v3, "setLandscapeBlurEnabled:", (unint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048) - 3) < 2);
  objc_msgSend(v3, "setActiveVariant:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));
  objc_msgSend(v3, "setUnlockProgress:", *(double *)(*(_QWORD *)(a1 + 32) + 1144));
  objc_msgSend(v3, "setActiveStyle:forVariant:", objc_msgSend(*(id *)(a1 + 40), "activeStyleForVariant:", objc_msgSend(*(id *)(a1 + 40), "activeVariant")), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));
  objc_msgSend(v3, "setActivelyRequired:", 1);

}

void __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_QWORD *);
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  BSDispatchQueueAssertMain();
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
  if (v2 == *(void **)(a1 + 40))
  {
    v3 = (void *)MEMORY[0x1E0D01908];
    v4 = *(_QWORD *)(a1 + 48);
    v5 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_4;
    v14[3] = &unk_1E6B94728;
    v15 = v2;
    v7 = v5;
    v8 = 3221225472;
    v9 = __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_5;
    v10 = &unk_1E6B95DD8;
    v6 = *(void **)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = v6;
    v13 = *(id *)(a1 + 56);
    objc_msgSend(v3, "animateWithSettings:actions:completion:", v4, v14, &v7);
    objc_msgSend(*(id *)(a1 + 32), "_posterControllerDidChange", v7, v8, v9, v10, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = *(void **)(v2 + 976);
  if (v4 == v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_6;
    v6[3] = &unk_1E6B95DB0;
    v6[4] = v2;
    objc_msgSend(v4, "updatePoster:", v6);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __79__PBUIPosterWallpaperViewController_updateConfiguration_withAnimationSettings___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1016);
  v3 = a2;
  objc_msgSend(v3, "setActivelyRequired:", objc_msgSend(v2, "isActive"));

}

- (void)updateAssociatedPosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  -[PBUIPosterViewController updateAssociatedPosterConfiguration:](self->_posterController, "updateAssociatedPosterConfiguration:", a3, a4);
}

- (void)triggerSceneUpdate
{
  -[PBUIPosterViewController updateHomeScene](self->_posterController, "updateHomeScene");
}

- (void)rotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  int IsActive;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[6];

  IsActive = soft_PUIDynamicRotationIsActive();
  v8 = MEMORY[0x1E0C809B0];
  if (IsActive)
  {
    -[PBUIPosterViewController willRotateToInterfaceOrientation:](self->_posterController, "willRotateToInterfaceOrientation:", a3);
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __75__PBUIPosterWallpaperViewController_rotateToInterfaceOrientation_duration___block_invoke;
    v13[3] = &unk_1E6B95E28;
    v13[4] = self;
    v13[5] = a3;
    v9 = (void *)MEMORY[0x1BCCA5978](v13);
  }
  else
  {
    v9 = 0;
  }
  self->_activeOrientation = a3;
  v10 = (void *)MEMORY[0x1E0D01908];
  objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __75__PBUIPosterWallpaperViewController_rotateToInterfaceOrientation_duration___block_invoke_2;
  v12[3] = &unk_1E6B94728;
  v12[4] = self;
  objc_msgSend(v10, "animateWithSettings:actions:completion:", v11, v12, v9);

}

uint64_t __75__PBUIPosterWallpaperViewController_rotateToInterfaceOrientation_duration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "didRotateToInterfaceOrientation:", *(_QWORD *)(a1 + 40));
}

void __75__PBUIPosterWallpaperViewController_rotateToInterfaceOrientation_duration___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v6, "setBackgroundColor:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v3);

  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 976);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__PBUIPosterWallpaperViewController_rotateToInterfaceOrientation_duration___block_invoke_3;
  v7[3] = &unk_1E6B95DB0;
  v7[4] = v4;
  objc_msgSend(v5, "updatePoster:", v7);

}

void __75__PBUIPosterWallpaperViewController_rotateToInterfaceOrientation_duration___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!+[PBUIPosterWallpaperRemoteViewController supportsLandscapeWallpaperContents](PBUIPosterWallpaperRemoteViewController, "supportsLandscapeWallpaperContents"))objc_msgSend(v3, "setLandscapeBlurEnabled:", (unint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048) - 3) < 2);

}

uint64_t __64__PBUIPosterWallpaperViewController_requireWallpaperWithReason___block_invoke_46(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setActivelyRequired:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __64__PBUIPosterWallpaperViewController_requireWallpaperWithReason___block_invoke_49(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B71C0000, v2, OS_LOG_TYPE_DEFAULT, "No longer requiring wallpaper for reason: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)removeWallpaperStyleForPriority:(int64_t)a3 forVariant:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperStylePriority(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1B71C0000, v7, OS_LOG_TYPE_DEFAULT, "Removing %@ override style for %@", (uint8_t *)&v10, 0x16u);

  }
  self->_activeStyles[a4][a3] = -1;
  -[PBUIPosterWallpaperViewController _updateStyleForVariant:](self, "_updateStyleForVariant:", a4);
}

- (id)averageColorForVariant:(int64_t)a3
{
  return -[PBUIPosterViewController averageColorForVariant:](self->_posterController, "averageColorForVariant:", a3);
}

- (double)averageContrastForVariant:(int64_t)a3
{
  double result;

  -[PBUIPosterViewController averageContrastForVariant:](self->_posterController, "averageContrastForVariant:", a3);
  return result;
}

- (id)portalProviderForFloatingLayer
{
  return self->_lockFloatingLayerPosterReplicaProvider;
}

- (id)replicaProviderForVariant:(int64_t)a3
{
  int *v3;

  v3 = &OBJC_IVAR___PBUIPosterWallpaperViewController__lockPosterReplicaProvider;
  if (a3 == 1)
    v3 = &OBJC_IVAR___PBUIPosterWallpaperViewController__homePosterReplicaProvider;
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (id)portalSourceProviderForActiveVariant
{
  return self->_activeVariantReplicaProvider;
}

- (id)scenesForBacklightSession
{
  return -[PBUIPosterViewController scenesForBacklightSession](self->_posterController, "scenesForBacklightSession");
}

- (void)noteUserTapOccurred
{
  -[PBUIPosterViewController noteUserTapOccurred](self->_posterController, "noteUserTapOccurred");
}

- (void)noteUserTapOccurredWithLocation:(CGPoint)a3
{
  -[PBUIPosterViewController noteUserTapOccurredWithLocation:](self->_posterController, "noteUserTapOccurredWithLocation:", a3.x, a3.y);
}

- (BOOL)userTapEventsRequested
{
  return -[PBUIPosterViewController userTapEventsRequested](self->_posterController, "userTapEventsRequested");
}

- (unint64_t)significantEventsCounterForPosterWithIdentifier:(id)a3
{
  return -[PBUIPosterViewController significantEventsCounterForPosterWithIdentifier:](self->_posterController, "significantEventsCounterForPosterWithIdentifier:", a3);
}

- (unint64_t)posterSignificantEventsCounter
{
  return -[PBUIPosterViewController posterSignificantEventsCounter](self->_posterController, "posterSignificantEventsCounter");
}

- (void)updateLegacyPoster
{
  -[PBUIPosterViewController updateLegacyPoster](self->_posterController, "updateLegacyPoster");
}

- (BOOL)homeScreenReflectsLockScreen
{
  return -[PBUIPosterViewController homeScreenReflectsLockScreen](self->_posterController, "homeScreenReflectsLockScreen");
}

- (BOOL)posterHandlesWakeAnimation
{
  return -[PBUIPosterViewController handlesWakeAnimation](self->_posterController, "handlesWakeAnimation");
}

- (BOOL)posterHidesDimmingLayer
{
  return -[PBUIPosterViewController hidesDimmingLayer](self->_posterController, "hidesDimmingLayer");
}

- (void)setWallpaperObscured:(BOOL)a3
{
  -[PBUIPosterViewController setWallpaperObscured:](self->_posterController, "setWallpaperObscured:", a3);
}

- (PBUIHomeVariantStyleState)currentHomeVariantStyleState
{
  return -[PBUIPosterViewController currentHomeVariantStyleState](self->_posterController, "currentHomeVariantStyleState");
}

- (void)noteHomeVariantStyleStateMayHaveUpdated
{
  -[PBUIPosterViewController noteHomeVariantStyleStateMayHaveUpdated](self->_posterController, "noteHomeVariantStyleStateMayHaveUpdated");
}

- (BOOL)updateCurrentPosterWithUpdates:(id)a3 error:(id *)a4
{
  return -[PBUIPosterViewController updateCurrentPosterWithUpdates:error:](self->_posterController, "updateCurrentPosterWithUpdates:error:", a3, a4);
}

- (id)acquireDuckHomeScreenWallpaperDimAssertionWithReason:(id)a3
{
  return -[PBUIPosterViewController acquireDuckHomeScreenWallpaperDimAssertionWithReason:](self->_posterController, "acquireDuckHomeScreenWallpaperDimAssertionWithReason:", a3);
}

- (void)invalidate
{
  -[BSCompoundAssertion invalidate](self->_wallpaperRequiredAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_transitioningLockState, "invalidate");
  -[BSInvalidatable invalidate](self->_keepForegroundRunning, "invalidate");
  -[PBUIPosterViewController invalidate](self->_posterController, "invalidate");
  -[PRSWallpaperObserver invalidate](self->_posterObserver, "invalidate");
}

- (void)_posterControllerDidChange
{
  -[PBUIDynamicProviderWrapper setRootObject:](self->_homePosterReplicaProvider, "setRootObject:", self->_posterController);
  -[PBUIDynamicProviderWrapper setRootObject:](self->_lockPosterReplicaProvider, "setRootObject:", self->_posterController);
  -[PBUIDynamicProviderWrapper setRootObject:](self->_activeVariantReplicaProvider, "setRootObject:", self->_posterController);
  -[PBUIDynamicProviderWrapper setRootObject:](self->_lockFloatingLayerPosterReplicaProvider, "setRootObject:", self->_posterController);
}

- (void)_posterConfigsDidChange:(id)a3 withTransition:(id)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  BSDispatchMain();

}

void __76__PBUIPosterWallpaperViewController__posterConfigsDidChange_withTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  id v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "activeConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverIdentity");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "activeLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "associatedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "activeHome");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serverIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v15, "isEqual:", v10);

  if ((v11 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "updateConfiguration:withAnimationSettings:", v4, 0);
  objc_msgSend(v8, "_path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serverIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v7, "isEqual:", v13);

  if ((v14 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "updateAssociatedPosterConfiguration:withAnimationSettings:", v8, 0);

}

- (void)_updateStyleForVariant:(int64_t)a3
{
  int64_t *v5;
  uint64_t v6;
  uint64_t v7;
  PBUIPosterViewController *posterController;
  _QWORD v9[6];

  v5 = self->_activeStyles[a3];
  v6 = 4;
  while (1)
  {
    v7 = v5[v6];
    if (PBUIWallpaperStyleIsValid(v7))
      break;
    if (--v6 == -1)
    {
      v7 = 0;
      break;
    }
  }
  posterController = self->_posterController;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__PBUIPosterWallpaperViewController__updateStyleForVariant___block_invoke;
  v9[3] = &__block_descriptor_48_e30_v16__0___PBUIPosterUpdating__8l;
  v9[4] = v7;
  v9[5] = a3;
  -[PBUIPosterViewController updatePoster:](posterController, "updatePoster:", v9);
}

uint64_t __60__PBUIPosterWallpaperViewController__updateStyleForVariant___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setActiveStyle:forVariant:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBUIPosterWallpaperViewController;
  -[PBUIPosterWallpaperViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PBUIPosterWallpaperViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIPosterViewController view](self->_posterController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  -[PBUIPosterWallpaperViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_posterController, v3);

}

- (int64_t)variant
{
  return self->_activeVariant;
}

- (UIColor)averageColor
{
  return -[PBUIPosterViewController averageColor](self->_posterController, "averageColor");
}

- (double)averageContrast
{
  double result;

  -[PBUIPosterViewController averageContrast](self->_posterController, "averageContrast");
  return result;
}

- (_UILegibilitySettings)legibilitySettings
{
  return -[PBUIPosterViewController legibilitySettings](self->_posterController, "legibilitySettings");
}

- (void)posterComponent:(id)a3 didUpdateLegibilitySettings:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PBUIPosterWallpaperViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterComponent:didUpdateLegibilitySettings:", self, v5);

}

- (void)posterComponent:(id)a3 didUpdateHideDimmingLayer:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[PBUIPosterWallpaperViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterComponent:didUpdateHideDimmingLayer:", self, v4);

}

- (void)posterComponent:(id)a3 didUpdatePreferredProminentColor:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PBUIPosterWallpaperViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterComponent:didUpdatePreferredProminentColor:", self, v5);

}

- (id)posterComponentExternalDisplayConfiguration:(id)a3
{
  void *v4;
  void *v5;

  -[PBUIPosterWallpaperViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterComponentExternalDisplayConfiguration:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)description
{
  return (NSString *)-[PBUIPosterWallpaperViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIPosterWallpaperViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[PBUIPosterWallpaperViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  PBUIPosterWallpaperViewController *v11;

  v4 = a3;
  -[PBUIPosterWallpaperViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__PBUIPosterWallpaperViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6B94BC8;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __75__PBUIPosterWallpaperViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 976), CFSTR("posterController"));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1016), "orderedReasons");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("requiredReasons"), 1);

}

- (int64_t)activeVariant
{
  return self->_activeVariant;
}

- (double)unlockProgress
{
  return self->_unlockProgress;
}

- (PBUIPosterComponentDelegate)delegate
{
  return (PBUIPosterComponentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)wakeSourceIsSwipeToUnlock
{
  return self->_wakeSourceIsSwipeToUnlock;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transitioningLockState, 0);
  objc_storeStrong((id *)&self->_keepForegroundRunning, 0);
  objc_storeStrong((id *)&self->_wallpaperRequiredAssertion, 0);
  objc_storeStrong((id *)&self->_lockFloatingLayerPosterReplicaProvider, 0);
  objc_storeStrong((id *)&self->_lockPosterReplicaProvider, 0);
  objc_storeStrong((id *)&self->_homePosterReplicaProvider, 0);
  objc_storeStrong((id *)&self->_activeVariantReplicaProvider, 0);
  objc_storeStrong((id *)&self->_posterController, 0);
  objc_storeStrong((id *)&self->_posterObserver, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B71C0000, log, OS_LOG_TYPE_ERROR, "User default set to keep the active wallpaper always foreground running!", v1, 2u);
}

- (void)setActiveVariant:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)updateConfiguration:withAnimationSettings:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)requireWallpaperWithReason:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

@end
