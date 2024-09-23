@implementation PBUIPosterVariantViewController

- (void)setActiveStyle:(int64_t)a3
{
  _BOOL8 IsHidden;
  void *v6;
  id v7;

  if (self->_activeStyle != a3)
  {
    self->_activeStyle = a3;
    IsHidden = PBUIWallpaperStyleIsHidden(a3);
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    -[UIView setHidden:](self->_contentContainer, "setHidden:", IsHidden);
    -[PBUISnapshotReplicaView setHidden:](self->_snapshotView, "setHidden:", IsHidden);
    -[PBUIPosterVariantViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

  }
}

- (_UILegibilitySettings)legibilitySettings
{
  void *v3;
  void *v4;
  void *v5;

  -[PBUIPosterVariantViewController desiredLegibilitySettings](self, "desiredLegibilitySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PBUIPosterVariantViewController desiredLegibilitySettings](self, "desiredLegibilitySettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "convertToUILegibility");
  }
  else
  {
    -[PBUIPosterVariantViewController contentColorStatistics](self, "contentColorStatistics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "legibilitySettings");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UILegibilitySettings *)v5;
}

- (PRPosterLegibilitySettings)desiredLegibilitySettings
{
  return (PRPosterLegibilitySettings *)objc_getProperty(self, a2, 1136, 1);
}

- (PUIColorStatistics)contentColorStatistics
{
  PUIColorStatistics *posterColorStatistics;

  posterColorStatistics = self->_posterColorStatistics;
  if (posterColorStatistics)
    return posterColorStatistics;
  -[PBUIURLBackedSnapshotSource contentColorStatistics](self->_snapshotSource, "contentColorStatistics");
  return (PUIColorStatistics *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setBlurEnabled:(BOOL)a3
{
  UIVisualEffectView *v4;
  UIVisualEffectView *blurView;
  UIVisualEffectView *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[5];

  if (a3)
  {
    self->_isBlurEnabled = 1;
    if (!self->_blurView)
    {
      objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 19);
      v9 = objc_claimAutoreleasedReturnValue();
      v4 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v9);
      blurView = self->_blurView;
      self->_blurView = v4;

      -[UIVisualEffectView setAutoresizingMask:](self->_blurView, "setAutoresizingMask:", 18);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __50__PBUIPosterVariantViewController_setBlurEnabled___block_invoke;
      v15[3] = &unk_1E6B94728;
      v15[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v15);
      -[UIView addSubview:](self->_contentContainer, "addSubview:", self->_blurView);
      -[UIVisualEffectView setAlpha:](self->_blurView, "setAlpha:", 1.0);
      v6 = (UIVisualEffectView *)v9;
LABEL_9:

    }
  }
  else
  {
    self->_isBlurEnabled = 0;
    if (self->_blurView)
    {
      if (!objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock"))
      {
        -[UIVisualEffectView removeFromSuperview](self->_blurView, "removeFromSuperview");
        v6 = self->_blurView;
        self->_blurView = 0;
        goto LABEL_9;
      }
      objc_initWeak(&location, self);
      v7 = (void *)MEMORY[0x1E0CEABB0];
      v8 = MEMORY[0x1E0C809B0];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __50__PBUIPosterVariantViewController_setBlurEnabled___block_invoke_2;
      v12[3] = &unk_1E6B95B70;
      objc_copyWeak(&v13, &location);
      v10[0] = v8;
      v10[1] = 3221225472;
      v10[2] = __50__PBUIPosterVariantViewController_setBlurEnabled___block_invoke_3;
      v10[3] = &unk_1E6B95A80;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v7, "animateWithDuration:animations:completion:", v12, v10, 0.0);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  unint64_t lastExtantUpdate;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  UIColor *derivedProminentColor;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  self->_lastExtantUpdate = objc_msgSend(v5, "transactionID");
  PBUILogSnapshot();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant(-[PBUIPosterVariantViewController variant](self, "variant"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    lastExtantUpdate = self->_lastExtantUpdate;
    *(_DWORD *)buf = 138543618;
    v26 = v7;
    v27 = 2048;
    v28 = lastExtantUpdate;
    _os_log_impl(&dword_1B71C0000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Poster Extact update changed %lu", buf, 0x16u);

  }
  objc_msgSend(v5, "settingsDiff");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "pui_posterContentDidChange");
  if ((v11 & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v5, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "pui_userInterfaceStyle");

  if (v13 != self->_mostRecentSnapshotInterfaceStyle)
  {
    -[PBUIPosterVariantViewController _applicableScene](self, "_applicableScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "settings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pui_provider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.WallpaperKit.CollectionsPoster")))
    {
      PBUILogSnapshot();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        PBUIStringForWallpaperVariant(-[PBUIPosterVariantViewController variant](self, "variant"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v18;
        _os_log_impl(&dword_1B71C0000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] catching undetected system appearance change for collections poster", buf, 0xCu);

      }
LABEL_9:
      v19 = v11 ^ 1;
      -[PBUIPosterVariantViewController _setupCachesIfNeeded](self, "_setupCachesIfNeeded");
      if (-[PBUIPosterVariantViewController variant](self, "variant") == 1)
      {
        -[PBUIURLBackedSnapshotSource clearDerivedProminentColor](self->_snapshotSource, "clearDerivedProminentColor");
        derivedProminentColor = self->_derivedProminentColor;
        self->_derivedProminentColor = 0;

        -[PBUIURLBackedSnapshotSource invalidateCurrentSnapshot](self->_snapshotSource, "invalidateCurrentSnapshot");
      }
      v21 = (void *)MEMORY[0x1E0CB3940];
      MEMORY[0x1BCCA4FB8](v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1BCCA4FB8](v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("contentDidChange:%@ needsUpdateForInterfaceStyle:%@"), v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIPosterVariantViewController setNeedsNewSnapshot:](self, "setNeedsNewSnapshot:", v24);

      -[PBUIPosterVariantViewController _updateParallax](self, "_updateParallax");
      goto LABEL_16;
    }

  }
  if ((objc_msgSend(v9, "pr_posterPropertiesDidChange") & 1) != 0
    || (objc_msgSend(v9, "pr_unlockProgressDidChange") & 1) != 0
    || objc_msgSend(v10, "pb_homeAppearanceChanged"))
  {
LABEL_16:
    -[PBUIPosterVariantViewController _updatePresentation](self, "_updatePresentation");
  }

}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  unint64_t lastExtantUpdate;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PBUILogSnapshot();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant(-[PBUIPosterVariantViewController variant](self, "variant"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    lastExtantUpdate = self->_lastExtantUpdate;
    v13 = 138543874;
    v14 = v8;
    v15 = 2048;
    v16 = lastExtantUpdate;
    v17 = 2048;
    v18 = objc_msgSend(v6, "transactionID");
    _os_log_impl(&dword_1B71C0000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Poster Extact update COULD change %lu (%lu)", (uint8_t *)&v13, 0x20u);

  }
  v10 = self->_lastExtantUpdate;
  if (v10 == objc_msgSend(v6, "transactionID"))
  {
    PBUILogSnapshot();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      PBUIStringForWallpaperVariant(-[PBUIPosterVariantViewController variant](self, "variant"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1B71C0000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Poster Extact update DID change", (uint8_t *)&v13, 0xCu);

    }
    self->_lastExtantUpdate = 0;
    -[PBUIPosterVariantViewController invalidateSnapshotPreconditions:](self, "invalidateSnapshotPreconditions:", CFSTR("Poster Extact update DID change"));
  }

}

- (id)_applicableScene
{
  FBScene *scene;
  FBScene *v3;
  id WeakRetained;

  scene = self->_scene;
  if (scene)
  {
    v3 = scene;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_counterpart);
    objc_msgSend(WeakRetained, "scene");
    v3 = (FBScene *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (int64_t)activeStyle
{
  return self->_activeStyle;
}

- (FBScene)scene
{
  return self->_scene;
}

- (BOOL)needsSnapshot
{
  return -[BSAtomicFlag getFlag](self->_snapshotNeeded, "getFlag");
}

- (BOOL)isSnapshotInCorrectOrientation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v8;
  uint64_t v10;
  uint64_t v11;

  -[PBUIPosterVariantViewController _applicableScene](self, "_applicableScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pui_deviceOrientation");
  v6 = objc_msgSend(v4, "interfaceOrientation");
  v10 = 0;
  v11 = 0;
  -[PBUIURLBackedSnapshotSource currentSnapshotInterfaceOrientation:outDeviceOrientation:](self->_snapshotSource, "currentSnapshotInterfaceOrientation:outDeviceOrientation:", &v10, &v11);
  v8 = v5 == v11 || v6 == v10;

  return v8;
}

- (id)snapshotSourceProvider
{
  return self->_snapshotProvider;
}

- (PBUIPosterVariantViewController)initWithScene:(id)a3 counterpart:(id)a4
{
  id v7;
  id v8;
  id v9;
  PBUIPosterVariantViewController *v10;
  PBUIPosterVariantViewController *v11;
  uint64_t v12;
  BSAtomicFlag *snapshotNeeded;
  uint64_t v14;
  BSAtomicFlag *snapshotScheduled;
  uint64_t v16;
  BSAtomicFlag *isRotating;
  void *v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  UIScenePresenter *presenter;
  void *v23;
  PBUIPosterVariantViewController *result;
  void *v25;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (v9 && (NSClassFromString(CFSTR("FBScene")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSceneClass]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterVariantViewController initWithScene:counterpart:].cold.1();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    result = (PBUIPosterVariantViewController *)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v26.receiver = self;
    v26.super_class = (Class)PBUIPosterVariantViewController;
    v10 = -[PBUIPosterVariantViewController initWithNibName:bundle:](&v26, sel_initWithNibName_bundle_, 0, 0);
    v11 = v10;
    if (v10)
    {
      v10->_isBlurEnabled = 0;
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
      snapshotNeeded = v11->_snapshotNeeded;
      v11->_snapshotNeeded = (BSAtomicFlag *)v12;

      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
      snapshotScheduled = v11->_snapshotScheduled;
      v11->_snapshotScheduled = (BSAtomicFlag *)v14;

      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
      isRotating = v11->_isRotating;
      v11->_isRotating = (BSAtomicFlag *)v16;

      objc_storeStrong((id *)&v11->_scene, a3);
      if (v11->_scene)
      {
        -[FBScene uiPresentationManager](v11->_scene, "uiPresentationManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "createPresenterWithIdentifier:priority:", v20, -100);
        v21 = objc_claimAutoreleasedReturnValue();
        presenter = v11->_presenter;
        v11->_presenter = (UIScenePresenter *)v21;

        -[UIScenePresenter modifyPresentationContext:](v11->_presenter, "modifyPresentationContext:", &__block_literal_global_18);
        -[UIScenePresenter activate](v11->_presenter, "activate");
        -[PBUIPosterVariantViewController _monitorScene:](v11, "_monitorScene:", v11->_scene);
        -[PBUIPosterVariantViewController _updateInterfaceStyle](v11, "_updateInterfaceStyle");
      }
      if (v8)
        -[PBUIPosterVariantViewController setCounterpart:](v11, "setCounterpart:", v8);
      else
        -[PBUIPosterVariantViewController _setupCachesIfNeeded](v11, "_setupCachesIfNeeded");
      objc_msgSend(MEMORY[0x1E0CB35B0], "notificationCenterForType:", CFSTR("POSTERBOARD"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObserver:selector:name:object:", v11, sel__invalidateSnapshots_, CFSTR("POSTERBOARD_CLEAR_ALL_CACHED_SNAPSHOTS"), 0);

    }
    return v11;
  }
  return result;
}

void __61__PBUIPosterVariantViewController_initWithScene_counterpart___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setClippingDisabled:", 1);

}

- (void)noteWillRotateToInterfaceOrientation:(int64_t)a3
{
  -[BSAtomicFlag setFlag:](self->_isRotating, "setFlag:", 1);
  -[PBUIURLBackedSnapshotSource invalidateCurrentSnapshot](self->_snapshotSource, "invalidateCurrentSnapshot");
}

- (void)noteDidRotateToInterfaceOrientation:(int64_t)a3
{
  -[BSAtomicFlag setFlag:](self->_isRotating, "setFlag:", 0);
  -[PBUIPosterVariantViewController setNeedsNewSnapshot:](self, "setNeedsNewSnapshot:", CFSTR("did rotate to new interface orientation"));
}

- (void)_invalidateSnapshots:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PBUIURLBackedSnapshotSource invalidateCurrentSnapshot](self->_snapshotSource, "invalidateCurrentSnapshot", a3);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIPosterVariantPathProvider snapshotURL](self->_pathProvider, "snapshotURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtURL:error:", v5, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIPosterVariantPathProvider snapshotMetadataURL](self->_pathProvider, "snapshotMetadataURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeItemAtURL:error:", v7, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIPosterVariantPathProvider snapshotColorStatisticsURL](self->_pathProvider, "snapshotColorStatisticsURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeItemAtURL:error:", v9, 0);

  -[PBUIPosterVariantViewController setNeedsNewSnapshot:](self, "setNeedsNewSnapshot:", CFSTR("snapshots were invalidate"));
}

- (void)dealloc
{
  PBUICachedSnapshotEffectProvider *snapshotProvider;
  FBScene *fauxExternalScene;
  PUIManagedCacheIdentifying *cache;
  objc_super v6;

  -[PBUIFixedReplicaSourceProvider invalidate](self->_portalProvider, "invalidate");
  -[PBUICachedSnapshotEffectProvider invalidate](self->_snapshotProvider, "invalidate");
  -[FBScene invalidate](self->_fauxExternalScene, "invalidate");
  snapshotProvider = self->_snapshotProvider;
  self->_snapshotProvider = 0;

  fauxExternalScene = self->_fauxExternalScene;
  self->_fauxExternalScene = 0;

  cache = self->_cache;
  self->_cache = 0;

  v6.receiver = self;
  v6.super_class = (Class)PBUIPosterVariantViewController;
  -[PBUIPosterVariantViewController dealloc](&v6, sel_dealloc);
}

- (void)_setupCachesIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PBUIPosterVariantPathProvider *v15;
  PBUIPosterVariantPathProvider **p_pathProvider;
  _BOOL4 v17;
  void *v18;
  int v19;
  void *v20;
  PUIManagedCacheIdentifying *v21;
  PUIManagedCacheIdentifying *cache;
  PBUIURLBackedSnapshotSource *snapshotSource;
  PBUIURLBackedSnapshotSource *v24;
  PBUIPosterVariantPathProvider *v25;
  void *v26;
  PBUIURLBackedSnapshotSource *v27;
  PBUIURLBackedSnapshotSource *v28;
  PBUICachedSnapshotEffectProvider *snapshotProvider;
  PBUICachedSnapshotEffectProvider *v30;
  PBUICachedSnapshotEffectProvider *v31;
  PBUIFixedReplicaSourceProvider *portalProvider;
  PBUIFixedReplicaSourceProvider *v33;
  PBUIFixedReplicaSourceProvider *v34;
  PBUIFixedReplicaSourceProvider *v35;
  void *v36;
  void *v37;
  id v38;

  -[PBUIPosterVariantViewController _applicableScene](self, "_applicableScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pui_posterPath");
  v38 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v38;
  if (v38)
  {
    v5 = objc_msgSend(v38, "isServerPosterPath");
    v6 = -[PBUIPosterVariantViewController variant](self, "variant");
    if (v5)
    {
      objc_msgSend(v38, "instanceURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "serverIdentity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stablePersistenceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("Non-serverposterpath-"), "stringByAppendingString:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "pf_temporaryDirectoryURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(CFSTR("["), "stringByAppendingString:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperVariant(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("]-[%@]"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[PBUIPosterVariantPathProvider initWithInstanceURL:variant:]([PBUIPosterVariantPathProvider alloc], "initWithInstanceURL:variant:", v7, v6);
    p_pathProvider = &self->_pathProvider;
    v17 = -[PBUIPosterVariantPathProvider isEqualToPosterVariantPathProvider:](v15, "isEqualToPosterVariantPathProvider:", self->_pathProvider);
    if (!v17)
      objc_storeStrong((id *)&self->_pathProvider, v15);
    -[PUIManagedCacheIdentifying pui_cacheIdentifier](self->_cache, "pui_cacheIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", v14);

    if ((v17 & v19 & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "defaultCacheManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "checkoutImageCache:", v14);
      v21 = (PUIManagedCacheIdentifying *)objc_claimAutoreleasedReturnValue();
      cache = self->_cache;
      self->_cache = v21;

      snapshotSource = self->_snapshotSource;
      if (snapshotSource)
      {
        -[PBUIURLBackedSnapshotSource updateFromPathProvider:](snapshotSource, "updateFromPathProvider:", *p_pathProvider);
      }
      else
      {
        v24 = [PBUIURLBackedSnapshotSource alloc];
        v25 = *p_pathProvider;
        objc_msgSend((id)objc_opt_class(), "snapshotFormat");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[PBUIURLBackedSnapshotSource initWithPathProvider:format:delegate:](v24, "initWithPathProvider:format:delegate:", v25, v26, self);
        v28 = self->_snapshotSource;
        self->_snapshotSource = v27;

      }
      snapshotProvider = self->_snapshotProvider;
      if (snapshotProvider)
      {
        -[PBUICachedSnapshotEffectProvider setCacheIdentifier:]((uint64_t)snapshotProvider, v14);
        -[PBUICachedSnapshotEffectProvider setSnapshotProvider:](self->_snapshotProvider, "setSnapshotProvider:", self->_snapshotSource);
      }
      else
      {
        v30 = -[PBUICachedSnapshotEffectProvider initForSnapshotProvider:cacheIdentifier:]([PBUICachedSnapshotEffectProvider alloc], "initForSnapshotProvider:cacheIdentifier:", self->_snapshotSource, v14);
        v31 = self->_snapshotProvider;
        self->_snapshotProvider = v30;

      }
      portalProvider = self->_portalProvider;
      if (!portalProvider)
      {
        v33 = objc_alloc_init(PBUIFixedReplicaSourceProvider);
        v34 = self->_portalProvider;
        self->_portalProvider = v33;

        portalProvider = self->_portalProvider;
      }
      -[PBUIFixedReplicaSourceProvider setIdentifier:](portalProvider, "setIdentifier:", v14);
      v35 = self->_portalProvider;
      -[PBUIPosterVariantViewController legibilitySettings](self, "legibilitySettings");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIPosterVariantViewController makePortalSourceWithLegibilitySettings:](self, "makePortalSourceWithLegibilitySettings:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIFixedReplicaSourceProvider setPortalSource:](v35, "setPortalSource:", v37);

      -[PBUIPosterVariantViewController setNeedsNewSnapshot:](self, "setNeedsNewSnapshot:", CFSTR("caches were updated"));
    }

    v4 = v38;
  }

}

- (void)setCounterpart:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_counterpart);
  objc_storeWeak((id *)&self->_counterpart, v4);
  if (!self->_scene)
  {
    if (WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("oldCounterpart == nil"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBUIPosterVariantViewController setCounterpart:].cold.1();
      objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1B721F08CLL);
    }
    objc_msgSend(v4, "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "scene");
      v7 = objc_claimAutoreleasedReturnValue();
      -[PBUIPosterVariantViewController _monitorScene:](self, "_monitorScene:", v7);
    }
    else
    {
      PBUILogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        PBUIStringForWallpaperVariant(-[PBUIPosterVariantViewController variant](self, "variant"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        PBUIStringForWallpaperVariant(objc_msgSend(v4, "variant"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v12 = v8;
        v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_1B71C0000, v7, OS_LOG_TYPE_DEFAULT, "Neither %@ nor counterpart: %@ has a scene.", buf, 0x16u);

      }
    }

  }
  -[PBUIPosterVariantViewController _setupCachesIfNeeded](self, "_setupCachesIfNeeded");
  -[PBUIPosterVariantViewController _updateInterfaceStyle](self, "_updateInterfaceStyle");

}

- (UIColor)averageColor
{
  void *v2;
  void *v3;

  -[PBUIPosterVariantViewController contentColorStatistics](self, "contentColorStatistics");
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

  -[PBUIPosterVariantViewController contentColorStatistics](self, "contentColorStatistics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "averageContrast");
  v4 = v3;

  return v4;
}

- (id)portalSourceProvider
{
  return self->_portalProvider;
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  UIScenePresenter *presenter;
  void *v6;
  FBScene *scene;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  PBUICachedSnapshotEffectProvider *snapshotProvider;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant(-[PBUIPosterVariantViewController variant](self, "variant"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v4;
    _os_log_impl(&dword_1B71C0000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidated.", (uint8_t *)&v14, 0xCu);

  }
  objc_storeWeak((id *)&self->_delegate, 0);
  -[UIScenePresenter invalidate](self->_presenter, "invalidate");
  presenter = self->_presenter;
  self->_presenter = 0;

  -[FBScene layerManager](self->_scene, "layerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[FBScene removeObserver:](self->_scene, "removeObserver:", self);
  scene = self->_scene;
  self->_scene = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_counterpart);
  objc_msgSend(WeakRetained, "scene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layerManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  v11 = objc_loadWeakRetained((id *)&self->_counterpart);
  objc_msgSend(v11, "scene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:", self);

  objc_storeWeak((id *)&self->_counterpart, 0);
  -[PBUIFixedReplicaSourceProvider invalidate](self->_portalProvider, "invalidate");
  -[PBUICachedSnapshotEffectProvider invalidate](self->_snapshotProvider, "invalidate");
  snapshotProvider = self->_snapshotProvider;
  self->_snapshotProvider = 0;

}

- (void)fetchWallpaperProminentColor:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = -[PBUIPosterVariantViewController variant](self, "variant");
    if (v5 == 1)
    {
      v11 = v4;
      BSDispatchMain();

    }
    else
    {
      v6 = v5;
      -[PBUIPosterVariantViewController counterpart](self, "counterpart");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      PBUILogSnapshot();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (v7)
      {
        if (v9)
          -[PBUIPosterVariantViewController fetchWallpaperProminentColor:].cold.2(v6);

        -[PBUIPosterVariantViewController counterpart](self, "counterpart");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fetchWallpaperProminentColor:", v4);
      }
      else
      {
        if (v9)
          -[PBUIPosterVariantViewController fetchWallpaperProminentColor:].cold.1(v6);

        objc_msgSend(MEMORY[0x1E0CEA478], "magentaColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v4 + 2))(v4, v10);
      }

    }
  }

}

void __64__PBUIPosterVariantViewController_fetchWallpaperProminentColor___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[6];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  PBUILogSnapshot();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant(*(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v3;
    _os_log_impl(&dword_1B71C0000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking preferred prominent color...", buf, 0xCu);

  }
  v4 = *(void **)(a1 + 32);
  v22 = 0;
  objc_msgSend(v4, "_preferredProminentColor:source:", 0, &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;
  if (v5)
  {
    PBUILogSnapshot();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      PBUIStringForWallpaperVariant(*(_QWORD *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v8;
      v25 = 2114;
      v26 = v5;
      v27 = 2114;
      v28 = v6;
      _os_log_impl(&dword_1B71C0000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found preferred prominent color: %{public}@/%{public}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 1128);
    if (!v9)
    {
      v10 = objc_opt_new();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 1128);
      *(_QWORD *)(v11 + 1128) = v10;

      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 1128);
    }
    v13 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v9, "addObject:", v13);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "snapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "pui_canDetermineProminentColor");
    PBUILogSnapshot();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        PBUIStringForWallpaperVariant(*(_QWORD *)(a1 + 48));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v18;
        _os_log_impl(&dword_1B71C0000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] using last snapshot taken to determine prominent color...", buf, 0xCu);

      }
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __64__PBUIPosterVariantViewController_fetchWallpaperProminentColor___block_invoke_43;
      v21[3] = &unk_1E6B965D0;
      v19 = *(_QWORD *)(a1 + 48);
      v21[4] = *(_QWORD *)(a1 + 32);
      v21[5] = v19;
      objc_msgSend(v14, "pui_determineProminentColorWithCompletion:", v21);
    }
    else
    {
      if (v17)
      {
        PBUIStringForWallpaperVariant(*(_QWORD *)(a1 + 48));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v20;
        _os_log_impl(&dword_1B71C0000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] scheduling prominent color snapshot for *NOW*...", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "_snapshotNow:", CFSTR("prominent color fetch"));
    }

  }
}

void __64__PBUIPosterVariantViewController_fetchWallpaperProminentColor___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PBUILogSnapshot();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__PBUIPosterVariantViewController_fetchWallpaperProminentColor___block_invoke_43_cold_1();

  }
  PBUILogSnapshot();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      PBUIStringForWallpaperVariant(*(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_1B71C0000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] using last snapshot determined a color: %{public}@", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_handleUpdateProminentPosterDerivedColor:posterPreferredProminentColor:timeColor:fallbackColor:", v5, 0, 0, 0);
  }
  else
  {
    if (v9)
    {
      PBUIStringForWallpaperVariant(*(_QWORD *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1B71C0000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] last snapshot prominent color determination failed; scheduling prominent color snapshot for *NOW*...",
        (uint8_t *)&v12,
        0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_snapshotNow:", CFSTR("prominent color fetch after failing to use last snapshot taken"));
  }

}

- (BOOL)updatePresentation
{
  return 0;
}

uint64_t __50__PBUIPosterVariantViewController_setBlurEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1048);
  objc_msgSend(*(id *)(v2 + 968), "bounds");
  objc_msgSend(v3, "setFrame:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "setAlpha:", 0.0);
}

void __50__PBUIPosterVariantViewController_setBlurEnabled___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[131], "setAlpha:", 0.0);
    WeakRetained = v2;
  }

}

void __50__PBUIPosterVariantViewController_setBlurEnabled___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((_BYTE *)WeakRetained + 1113))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[131], "removeFromSuperview");
    v2 = v3[131];
    v3[131] = 0;

    WeakRetained = v3;
  }

}

+ (id)defaultCacheManager
{
  return (id)objc_msgSend(getPUIMappedImageCacheManagerClass(), "defaultCacheManager");
}

- (void)_monitorScene:(id)a3
{
  FBScene *scene;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FBScene *v11;

  v11 = (FBScene *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can't monitor a scene that doesn't exist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterVariantViewController _monitorScene:].cold.1();
LABEL_16:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B721FB38);
  }
  scene = self->_scene;
  if (scene != v11 && scene != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("only one scene should be monitored"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBUIPosterVariantViewController _monitorScene:].cold.2();
    goto LABEL_16;
  }
  -[FBScene addObserver:](v11, "addObserver:", self);
  -[FBScene layerManager](v11, "layerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  if (-[FBScene isActive](v11, "isActive"))
  {
    -[PBUIPosterVariantViewController sceneDidActivate:](self, "sceneDidActivate:", v11);
    -[FBScene clientHandle](v11, "clientHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[FBScene clientHandle](v11, "clientHandle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIPosterVariantViewController scene:clientDidConnect:](self, "scene:clientDidConnect:", v11, v8);

    }
  }

}

- (id)makePortalSourceWithLegibilitySettings:(id)a3
{
  PBUIPosterVariantPathProvider *pathProvider;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  PBUISimpleReplicaPortalSource *v11;
  void *v12;
  PBUISimpleReplicaPortalSource *v13;

  pathProvider = self->_pathProvider;
  v5 = a3;
  -[PBUIPosterVariantPathProvider instanceURL](pathProvider, "instanceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("UnknownURL");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  v11 = [PBUISimpleReplicaPortalSource alloc];
  -[PBUIPosterVariantViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PBUISimpleReplicaPortalSource initWithTargetView:cacheIdentifier:legibilitySettings:effectsAreBakedIn:](v11, "initWithTargetView:cacheIdentifier:legibilitySettings:effectsAreBakedIn:", v12, v10, v5, 0);

  return v13;
}

+ (id)snapshotFormat
{
  return (id)objc_msgSend(getPUIImageOnDiskFormatClass(), "defaultATX");
}

- (void)_updatePresentation
{
  BSDispatchQueueAssertMain();
  if (-[PBUIPosterVariantViewController updatePresentation](self, "updatePresentation"))
    -[PBUIPosterVariantViewController setNeedsNewSnapshot:](self, "setNeedsNewSnapshot:", CFSTR("presentation was updated"));
}

- (void)_updateParallax
{
  UIView *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  UIView *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  CGSize v37;
  CGSize v38;
  CGSize v39;
  CGSize v40;

  v36 = *MEMORY[0x1E0C80C00];
  if (self->_scene)
  {
    v3 = self->_contentContainer;
    -[FBScene settings](self->_scene, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "pr_isParallaxEffectivelyEnabled");

    if (v5)
    {
      -[FBScene clientSettings](self->_scene, "clientSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pr_contentSize");
      v8 = v7;
      v10 = v9;

      +[PBUIWallpaperParallaxSettings minimumWallpaperSizeForCurrentDevice](PBUIWallpaperParallaxSettings, "minimumWallpaperSizeForCurrentDevice");
      v12 = v11;
      v14 = v13;
      if (BSSizeGreaterThanOrEqualToSize())
      {
        if (!self->_parallaxApplied)
        {
          self->_parallaxApplied = 1;
          PBUILogCommon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            -[FBScene pui_shortDescription](self->_scene, "pui_shortDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v37.width = v8;
            v37.height = v10;
            NSStringFromCGSize(v37);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v38.width = v12;
            v38.height = v14;
            NSStringFromCGSize(v38);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v31 = v16;
            v32 = 2112;
            v33 = v17;
            v34 = 2112;
            v35 = v18;
            _os_log_impl(&dword_1B71C0000, v15, OS_LOG_TYPE_DEFAULT, "Parallax is enabled, %@ provided content size %@ and %@ is needed.", buf, 0x20u);

          }
          +[PBUIWallpaperDomain rootSettings](PBUIWallpaperDomain, "rootSettings");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "parallaxSettingsForVariant:", -[PBUIPosterVariantViewController variant](self, "variant"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x1E0CEABB0];
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __50__PBUIPosterVariantViewController__updateParallax__block_invoke;
          v27[3] = &unk_1E6B94BC8;
          v28 = v20;
          v29 = v3;
          v22 = v20;
          objc_msgSend(v21, "animateWithDuration:delay:options:animations:completion:", 251658240, v27, 0, 0.3, 0.0);

        }
        goto LABEL_12;
      }
      PBUILogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        -[FBScene pui_shortDescription](self->_scene, "pui_shortDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v39.width = v8;
        v39.height = v10;
        NSStringFromCGSize(v39);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v40.width = v12;
        v40.height = v14;
        NSStringFromCGSize(v40);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v31 = v24;
        v32 = 2112;
        v33 = v25;
        v34 = 2112;
        v35 = v26;
        _os_log_error_impl(&dword_1B71C0000, v23, OS_LOG_TYPE_ERROR, "Parallax is enabled, but %@ provided content size %@ when %@ is needed. Parallax will be disabled.", buf, 0x20u);

      }
    }
    PBUIApplyParallaxSettingsToViewWithFactor(0, v3, 1.0);
    self->_parallaxApplied = 0;
LABEL_12:

  }
}

void __50__PBUIPosterVariantViewController__updateParallax__block_invoke(uint64_t a1)
{
  PBUIApplyParallaxSettingsToViewWithFactor(*(void **)(a1 + 32), *(void **)(a1 + 40), 1.0);
}

- (void)_updateInterfaceStyle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int64_t mostRecentSnapshotInterfaceStyle;
  int v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PBUIPosterVariantViewController _applicableScene](self, "_applicableScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pui_userInterfaceStyle");

  if (v5 != self->_mostRecentSnapshotInterfaceStyle)
  {
    -[PBUIPosterVariantViewController _applicableScene](self, "_applicableScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_mostRecentSnapshotInterfaceStyle = objc_msgSend(v7, "pui_userInterfaceStyle");

    PBUILogSnapshot();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      mostRecentSnapshotInterfaceStyle = self->_mostRecentSnapshotInterfaceStyle;
      v10 = 134217984;
      v11 = mostRecentSnapshotInterfaceStyle;
      _os_log_impl(&dword_1B71C0000, v8, OS_LOG_TYPE_DEFAULT, "Updating most recent snapshot interface style: %lu", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)setNeedsNewSnapshot:(id)a3
{
  BSAtomicFlag *snapshotNeeded;
  id v5;

  snapshotNeeded = self->_snapshotNeeded;
  v5 = a3;
  -[BSAtomicFlag setFlag:](snapshotNeeded, "setFlag:", 1);
  -[PBUIPosterVariantViewController _scheduleSnapshotIfNeeded:](self, "_scheduleSnapshotIfNeeded:", v5);

}

- (void)invalidateSnapshotPreconditions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[BSAtomicFlag getFlag](self->_snapshotNeeded, "getFlag"))
  {
    PBUILogSnapshot();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      PBUIStringForWallpaperVariant(-[PBUIPosterVariantViewController variant](self, "variant"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_1B71C0000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidateSnapshotPreconditions for reason: %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("snapshot preconditions invalidated for reason '%@'; so scheduling a new snapshot"),
      v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIPosterVariantViewController _scheduleSnapshotIfNeeded:](self, "_scheduleSnapshotIfNeeded:", v7);

  }
}

- (void)_scheduleSnapshotIfNeeded:(id)a3
{
  id v4;
  dispatch_time_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[BSAtomicFlag setFlag:](self->_snapshotScheduled, "setFlag:", 1))
  {
    v5 = dispatch_time(0, 250000000);
    PBUILogSnapshot();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      PBUIStringForWallpaperVariant(-[PBUIPosterVariantViewController variant](self, "variant"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.25);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1B71C0000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Snapshot scheduled for %{public}@ for reason: %{public}@", buf, 0x20u);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PBUIPosterVariantViewController__scheduleSnapshotIfNeeded___block_invoke;
    block[3] = &unk_1E6B94728;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __61__PBUIPosterVariantViewController__scheduleSnapshotIfNeeded___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "snapshotIfNeeded:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setFlag:", 0);
}

- (void)_snapshotNow:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  PBUILogSnapshot();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[PBUIPosterVariantViewController _snapshotNow:].cold.1();

  BSDispatchMain();
}

uint64_t __48__PBUIPosterVariantViewController__snapshotNow___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "snapshotIfNeeded:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setFlag:", 0);
}

- (void)snapshotIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __52__PBUIPosterVariantViewController_snapshotIfNeeded___block_invoke;
  v22[3] = &unk_1E6B965F8;
  v22[4] = self;
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1BCCA5978](v22);
  if ((-[BSAtomicFlag getFlag](self->_snapshotNeeded, "getFlag") & 1) != 0 || v3)
  {
    -[PBUIPosterVariantViewController evaluateSnapshotPreconditions](self, "evaluateSnapshotPreconditions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "canSnapshot") & 1) != 0 || v3)
    {
      ((void (**)(_QWORD, void *))v5)[2](v5, v6);
    }
    else
    {
      v17 = v5;
      PBUILogSnapshot();
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
        -[PBUIPosterVariantViewController snapshotIfNeeded:].cold.1(self, v7);

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v16 = v6;
      objc_msgSend(v6, "reasonsToNotSnapshot");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
            PBUILogSnapshot();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              PBUIStringForWallpaperVariant(-[PBUIPosterVariantViewController variant](self, "variant"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v24 = v15;
              v25 = 2114;
              v26 = v13;
              _os_log_error_impl(&dword_1B71C0000, v14, OS_LOG_TYPE_ERROR, "[%{public}@]\t--> '%{public}@'", buf, 0x16u);

            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
        }
        while (v10);
      }

      v6 = v16;
      v5 = v17;
    }

  }
}

void __52__PBUIPosterVariantViewController_snapshotIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "isSnapshottingForExternalDisplayHostedWallpaper");
  v4 = *(void **)(a1 + 32);
  if (!v3)
  {
    objc_msgSend(v4, "_applicableScene");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (!v8)
      goto LABEL_11;
    goto LABEL_10;
  }
  objc_msgSend(v4, "_prepareFauxExternalScene");
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1056);
  v18 = 0;
  v6 = objc_msgSend(v5, "pui_sceneIsReadyToSnapshot:", &v18);
  v7 = v18;
  if (v6)
  {
    v8 = *(id *)(*(_QWORD *)(a1 + 32) + 1056);
    objc_initWeak(location, *(id *)(a1 + 32));
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __52__PBUIPosterVariantViewController_snapshotIfNeeded___block_invoke_2;
    v16[3] = &unk_1E6B95A80;
    objc_copyWeak(&v17, location);
    v9 = (void *)MEMORY[0x1BCCA5978](v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(location);
  }
  else
  {
    PBUILogSnapshot();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      PBUIStringForWallpaperVariant(objc_msgSend(*(id *)(a1 + 32), "variant"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v11;
      _os_log_impl(&dword_1B71C0000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Faux external scene is not ready for snapshot. Scheduling a new snapshot.", (uint8_t *)location, 0xCu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setFlag:", 0);
    v12 = *(void **)(a1 + 32);
    v13 = (void *)MEMORY[0x1E0CB3940];
    PBUIStringForWallpaperVariant(objc_msgSend(v12, "variant"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("scheduling new snapshot because faux %@ external scene is not ready"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_scheduleSnapshotIfNeeded:", v15);

    v9 = 0;
    v8 = 0;
  }

  if (v8)
  {
LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "_snapshotScene:completion:", v8, v9);
    objc_msgSend(*(id *)(a1 + 32), "_updateInterfaceStyle");
  }
LABEL_11:

}

void __52__PBUIPosterVariantViewController_snapshotIfNeeded___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v1);
}

void __52__PBUIPosterVariantViewController_snapshotIfNeeded___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[132], "invalidate");
    v2 = v3[132];
    v3[132] = 0;

    WeakRetained = v3;
  }

}

- (void)_prepareFauxExternalScene
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id buf[2];

  if (!self->_fauxExternalScene)
  {
    PBUILogSnapshot();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B71C0000, v3, OS_LOG_TYPE_DEFAULT, "Preparing a new scene for external display tailored snapshot", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    -[PBUIPosterVariantViewController _applicableScene](self, "_applicableScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __60__PBUIPosterVariantViewController__prepareFauxExternalScene__block_invoke;
    v5[3] = &unk_1E6B96620;
    objc_copyWeak(&v6, buf);
    -[PBUIPosterVariantViewController _prepareFauxExternalSceneFromScene:completion:](self, "_prepareFauxExternalSceneFromScene:completion:", v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __60__PBUIPosterVariantViewController__prepareFauxExternalScene__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id *WeakRetained;
  id *v6;
  NSObject *v7;

  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v4)
    {
      objc_storeStrong(WeakRetained + 132, a2);
    }
    else
    {
      PBUILogSnapshot();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __60__PBUIPosterVariantViewController__prepareFauxExternalScene__block_invoke_cold_1();

    }
  }

}

- (void)_prepareFauxExternalSceneFromScene:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  PBUIPosterVariantViewController *v19;
  id v20;

  v6 = a4;
  objc_msgSend(a3, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pui_posterContents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PBUIPosterVariantViewController _externalDisplayConfiguration](self, "_externalDisplayConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(getPFPosterExtensionInstanceClass(), "extensionInstanceForPath:instanceIdentifier:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke;
        v15[3] = &unk_1E6B966C0;
        v16 = v8;
        v17 = v11;
        v18 = v7;
        v19 = self;
        v20 = v6;
        objc_msgSend(v17, "bootupExtensionInstance:", v15);

      }
      else
      {
        PBUILogSnapshot();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[PBUIPosterVariantViewController _prepareFauxExternalSceneFromScene:completion:].cold.3();

        (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
      }

    }
    else
    {
      PBUILogSnapshot();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[PBUIPosterVariantViewController _prepareFauxExternalSceneFromScene:completion:].cold.2();

      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }

  }
  else
  {
    PBUILogSnapshot();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PBUIPosterVariantViewController _prepareFauxExternalSceneFromScene:completion:].cold.1();

    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    PBUILogSnapshot();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke_cold_1(v4);

    (*((void (**)(void))a1[8] + 2))();
  }
  else
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = a1[6];
    v9 = a1[8];
    BSDispatchMain();

  }
}

void __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v2 = (void *)MEMORY[0x1E0D22960];
  getPUISceneRoleRendering();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pr_createPosterSceneWithRole:path:instance:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke_3;
  v7[3] = &unk_1E6B96670;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v8 = v4;
  v9 = v5;
  objc_msgSend(v6, "configureParameters:", v7);
  objc_msgSend(v6, "activate:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke_4;
  v6[3] = &unk_1E6B96648;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "updateSettingsWithBlock:", v6);

}

void __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "pui_applyToMutableSceneSettings:", v3);
  objc_msgSend(*(id *)(a1 + 40), "applyFauxExternalSceneSettings:", v4);

}

- (void)applyFauxExternalSceneSettings:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "pr_setAdjustedLuminance:", 2);

}

- (void)_snapshotScene:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16[2];
  id buf[2];

  v6 = a3;
  v7 = a4;
  PBUILogSnapshot();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (char *)os_signpost_id_generate(v8);

  PBUILogSnapshot();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B71C0000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "SnapshotUpdating", (const char *)&unk_1B7249F83, (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  if (PBUIColorSamplingQueue_onceToken != -1)
    dispatch_once(&PBUIColorSamplingQueue_onceToken, &__block_literal_global_433);
  v12 = (id)PBUIColorSamplingQueue_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke;
  v14[3] = &unk_1E6B96710;
  objc_copyWeak(v16, buf);
  v13 = v7;
  v14[4] = self;
  v15 = v13;
  v16[1] = v9;
  -[PBUIPosterVariantViewController performSnapshotOnQueue:scene:completion:](self, "performSnapshotOnQueue:scene:completion:", v12, v6, v14);

  objc_destroyWeak(v16);
  objc_destroyWeak(buf);

}

void __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  char *v12;
  id WeakRetained;
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
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  void *v37;
  void *v38;
  void *v39;
  char *v40;
  id v41;
  id v42[5];
  NSObject *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v9)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "variant") == 1)
      {
        v14 = (void *)MEMORY[0x1E0CB3710];
        objc_opt_self();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kDerivedProminentPosterColorMetadataKey"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "unarchivedObjectOfClass:fromData:error:", v15, v16, 0);
        v40 = v12;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "UIColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)MEMORY[0x1E0CB3710];
        objc_opt_self();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kPosterPreferredProminentPosterColorMetadataKey"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "unarchivedObjectOfClass:fromData:error:", v20, v21, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UIColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "averageColor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "pui_invertColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "colorWithAlphaComponent:", 1.0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(WeakRetained, "_handleUpdateProminentPosterDerivedColor:posterPreferredProminentColor:timeColor:fallbackColor:", v18, v23, 0, v26);
        v12 = v40;

      }
      v42[0] = 0;
      v27 = objc_msgSend(WeakRetained, "postprocessNewSnapshot:colorStatistics:metadata:error:", v9, v10, v11, v42);
      v28 = v42[0];
      PBUILogSnapshot();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v28)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke_cold_2();
      }
      else if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        PBUIStringForWallpaperVariant(objc_msgSend(WeakRetained, "variant"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v45 = v33;
        _os_log_impl(&dword_1B71C0000, v30, OS_LOG_TYPE_INFO, "[%{public}@] Snapshot capture succeeded.", buf, 0xCu);

      }
    }
    else
    {
      PBUILogSnapshot();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke_cold_1(WeakRetained, v12, v28);
      v27 = 0;
    }

    PBUILogSnapshot();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    v36 = *(_QWORD *)(a1 + 56);
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      MEMORY[0x1BCCA4FB8](v27);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v37;
      _os_signpost_emit_with_name_impl(&dword_1B71C0000, v35, OS_SIGNPOST_INTERVAL_END, v36, "SnapshotUpdating", "wasSnapshotUpdated=%{public, name=wasSnapshotUpdated}@", buf, 0xCu);

    }
    v38 = *(void **)(a1 + 40);
    if (v38)
    {
      v41 = v38;
      BSDispatchMain();

    }
    PBUILogSnapshot();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      PBUIStringForWallpaperVariant(objc_msgSend(*(id *)(a1 + 32), "variant"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v39;
      v46 = 1024;
      v47 = v27;
      _os_log_impl(&dword_1B71C0000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Snapshotted poster; success? %{BOOL}u",
        buf,
        0x12u);

    }
    goto LABEL_23;
  }
  v31 = *(void **)(a1 + 40);
  if (v31)
  {
    v42[1] = (id)MEMORY[0x1E0C809B0];
    v42[2] = (id)3221225472;
    v42[3] = __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke_2;
    v42[4] = &unk_1E6B94FA0;
    v43 = v31;
    BSDispatchMain();
    v32 = v43;
LABEL_23:

  }
}

uint64_t __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke_82(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)postprocessNewSnapshot:(id)a3 colorStatistics:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PBUIURLBackedSnapshotSource *snapshotSource;
  _BOOL4 v15;
  id v16;
  void *v17;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[BSAtomicFlag setFlag:](self->_snapshotNeeded, "setFlag:", 0);
  if (!v11)
  {
    objc_msgSend(getPUIColorBoxesClass(), "colorBoxesForImage:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(objc_alloc((Class)getPUIColorStatisticsClass()), "initWithDelegate:", 0);
    objc_msgSend(v11, "updateWithColorBoxes:", v13);

  }
  if (!objc_msgSend(v12, "count"))
  {

    v12 = &unk_1E6BC3468;
  }
  snapshotSource = self->_snapshotSource;
  v20 = 0;
  v15 = -[PBUIURLBackedSnapshotSource updateWithImage:contentColorStatistics:metadata:error:](snapshotSource, "updateWithImage:contentColorStatistics:metadata:error:", v10, v11, v12, &v20);
  v16 = v20;
  v17 = v16;
  if (a6 && v16)
    *a6 = objc_retainAutorelease(v16);
  if (v15)
  {
    v19 = v11;
    BSDispatchMain();

  }
  return v15;
}

void __89__PBUIPosterVariantViewController_postprocessNewSnapshot_colorStatistics_metadata_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "averageColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_applicableScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pr_desiredLegibilitySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updatePosterAverageColor:desiredLegibilitySettings:", v6, v5);

}

- (PRSPosterConfiguration)lockScreenConfiguration
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (-[PBUIPosterVariantViewController variant](self, "variant"))
  {
    -[PBUIPosterVariantViewController counterpart](self, "counterpart");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lockScreenConfiguration");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PBUIPosterVariantViewController scene](self, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pui_posterPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v6 = 0;
      goto LABEL_6;
    }
    v4 = objc_msgSend(objc_alloc((Class)getPRSPosterConfigurationClass()), "initWithPath:", v3);
  }
  v6 = (void *)v4;
LABEL_6:

  return (PRSPosterConfiguration *)v6;
}

- (id)_lockVariantScene
{
  id WeakRetained;
  FBScene *v4;

  if (-[PBUIPosterVariantViewController variant](self, "variant"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_counterpart);
    objc_msgSend(WeakRetained, "scene");
    v4 = (FBScene *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_scene;
  }
  return v4;
}

- (id)_homeVariantScene
{
  FBScene *v3;
  id WeakRetained;

  if (-[PBUIPosterVariantViewController variant](self, "variant") == 1)
  {
    v3 = self->_scene;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_counterpart);
    objc_msgSend(WeakRetained, "scene");
    v3 = (FBScene *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)evaluateSnapshotPreconditions
{
  void *v3;
  PBUISnapshotPreconditionResult *v4;
  void *v5;
  PBUISnapshotPreconditionResult *v6;
  BOOL v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  id v16;

  BSDispatchQueueAssertMain();
  -[PBUIPosterVariantViewController _applicableScene](self, "_applicableScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PBUISnapshotPreconditionResult alloc];
  -[PBUIPosterVariantViewController _externalDisplayConfiguration](self, "_externalDisplayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PBUISnapshotPreconditionResult initWithExternalDisplayConfiguration:variant:](v4, "initWithExternalDisplayConfiguration:variant:", v5, -[PBUIPosterVariantViewController variant](self, "variant"));

  if (-[PBUISnapshotPreconditionResult canSnapshot](v6, "canSnapshot"))
    v7 = v3 == 0;
  else
    v7 = 0;
  if (v7)
    -[PBUISnapshotPreconditionResult appendPreconditionResultFailureWithFormat:](v6, "appendPreconditionResultFailureWithFormat:", CFSTR("Poster scene is nil"));
  if (-[PBUISnapshotPreconditionResult canSnapshot](v6, "canSnapshot"))
  {
    objc_msgSend(v3, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      -[PBUISnapshotPreconditionResult appendPreconditionResultFailureWithFormat:](v6, "appendPreconditionResultFailureWithFormat:", CFSTR("Poster scene is in a transitory state (no scene settings)"));
  }
  if (-[PBUISnapshotPreconditionResult canSnapshot](v6, "canSnapshot") && self->_lastExtantUpdate)
    -[PBUISnapshotPreconditionResult appendPreconditionResultFailureWithFormat:](v6, "appendPreconditionResultFailureWithFormat:", CFSTR("Poster scene is not ready for snapshotting (mid-update)."));
  if (-[PBUISnapshotPreconditionResult canSnapshot](v6, "canSnapshot"))
  {
    objc_msgSend(v3, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "activityMode");

    if (v10 != -3)
      -[PBUISnapshotPreconditionResult appendPreconditionResultFailureWithFormat:](v6, "appendPreconditionResultFailureWithFormat:", CFSTR("Poster scene is not ready for snapshotting (not suspended)."));
  }
  if (-[PBUISnapshotPreconditionResult canSnapshot](v6, "canSnapshot"))
  {
    v16 = 0;
    v11 = objc_msgSend(v3, "pui_sceneIsReadyToSnapshot:", &v16);
    v12 = v16;
    v13 = v12;
    if ((v11 & 1) == 0)
      -[PBUISnapshotPreconditionResult appendPreconditionResultFailureWithFormat:](v6, "appendPreconditionResultFailureWithFormat:", CFSTR("Poster scene is not ready: %@"), v12);
  }
  else
  {
    v13 = 0;
  }
  if (-[PBUISnapshotPreconditionResult canSnapshot](v6, "canSnapshot")
    && -[BSAtomicFlag getFlag](self->_isRotating, "getFlag"))
  {
    -[PBUISnapshotPreconditionResult appendPreconditionResultFailureWithFormat:](v6, "appendPreconditionResultFailureWithFormat:", CFSTR("Poster scene is currently rotating"));
  }
  if (-[PBUISnapshotPreconditionResult canSnapshot](v6, "canSnapshot"))
  {
    objc_msgSend(v3, "settings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIPosterVariantViewController validateSnapshottingPreconditionsForSettings:result:](self, "validateSnapshottingPreconditionsForSettings:result:", v14, v6);

  }
  return v6;
}

- (id)_externalDisplayConfiguration
{
  void *v3;
  void *v4;

  -[PBUIPosterVariantViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterComponentExternalDisplayConfiguration:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)performSnapshotOnQueue:(id)a3 scene:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v7 = a3;
  v11 = a4;
  v12 = v7;
  v13 = a5;
  v8 = v13;
  v9 = v7;
  v10 = v11;
  BSDispatchMain();

}

void __75__PBUIPosterVariantViewController_performSnapshotOnQueue_scene_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__PBUIPosterVariantViewController_performSnapshotOnQueue_scene_completion___block_invoke_2;
  v4[3] = &unk_1E6B96738;
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "pui_executeSnapshotForLevelSets:determineColorStatistics:onQueue:completion:", MEMORY[0x1E0C9AA60], 1, v3, v4);

}

void __75__PBUIPosterVariantViewController_performSnapshotOnQueue_scene_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  v16 = v6;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v6, "infoDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("SNAPSHOT_SOURCE"));

    objc_msgSend(v16, "capturedSnapshotLevelSets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "capturedSnapshotForLevelSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "capturedColorStatistics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v16, "infoDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    (*(void (**)(uint64_t, void *, void *, void *, _QWORD))(v13 + 16))(v13, v11, v12, v15, 0);

  }
}

- (UIImage)snapshot
{
  void *v3;

  if (-[PBUIPosterVariantViewController isSnapshotInCorrectOrientation](self, "isSnapshotInCorrectOrientation"))
  {
    -[PBUIURLBackedSnapshotSource snapshot](self->_snapshotSource, "snapshot");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (UIImage *)v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  UIView *v5;
  UIView *contentContainer;
  PBUISnapshotReplicaView *v7;
  PBUISnapshotReplicaView *v8;
  PBUISnapshotReplicaView *snapshotView;
  PBUISnapshotReplicaView *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PBUIPosterVariantViewController;
  -[PBUIPosterVariantViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[PBUIPosterVariantViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v3, "bounds");
  v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  contentContainer = self->_contentContainer;
  self->_contentContainer = v5;

  -[UIView setAutoresizingMask:](self->_contentContainer, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", self->_contentContainer);
  v7 = [PBUISnapshotReplicaView alloc];
  objc_msgSend(v3, "bounds");
  v8 = -[PBUISnapshotReplicaView initWithFrame:](v7, "initWithFrame:");
  snapshotView = self->_snapshotView;
  self->_snapshotView = v8;

  v10 = self->_snapshotView;
  -[PBUIPosterVariantViewController snapshotSourceProvider](self, "snapshotSourceProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUISnapshotReplicaView setProvider:](v10, "setProvider:", v11);

  objc_msgSend(v3, "addSubview:", self->_snapshotView);
  objc_msgSend(v3, "sendSubviewToBack:", self->_snapshotView);
  -[PBUIPosterVariantViewController _updatePresentation](self, "_updatePresentation");

}

- (void)sceneDidActivate:(id)a3
{
  -[PBUIPosterVariantViewController invalidateSnapshotPreconditions:](self, "invalidateSnapshotPreconditions:", CFSTR("scene activated"));
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  self->_lastExtantUpdate = 0;
}

- (void)sceneContentStateDidChange:(id)a3
{
  if (objc_msgSend(a3, "contentState") == 2)
    -[PBUIPosterVariantViewController invalidateSnapshotPreconditions:](self, "invalidateSnapshotPreconditions:", CFSTR("scene content state did change to ready"));
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v9;
  void *v10;
  char v11;
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
  id v25;

  v25 = a3;
  v9 = a4;
  if (objc_msgSend(a6, "pr_updateSnapshot"))
  {
    -[PBUIPosterVariantViewController setNeedsNewSnapshot:](self, "setNeedsNewSnapshot:", CFSTR("transition context requested new snapshot"));
  }
  else if (objc_msgSend(v9, "pui_extendedRenderSessionDidChange"))
  {
    objc_msgSend(v25, "clientSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "pui_inExtendedRenderSession");

    if ((v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      PBUIStringForWallpaperVariant(-[PBUIPosterVariantViewController variant](self, "variant"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1BCCA4FB8](objc_msgSend(v9, "pui_extendedRenderSessionDidChange"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "clientSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1BCCA4FB8](objc_msgSend(v15, "pui_inExtendedRenderSession"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("didUpdateClientSettings with diff for variant %@; extendedRenderSessionDidChange %@ inExtendedRenderSession %@"),
        v13,
        v14,
        v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIPosterVariantViewController invalidateSnapshotPreconditions:](self, "invalidateSnapshotPreconditions:", v17);

    }
  }
  if (objc_msgSend(v9, "pr_hideDimmingLayerDidChange"))
  {
    -[PBUIPosterVariantViewController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "clientSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "posterComponent:didUpdateHideDimmingLayer:", self, objc_msgSend(v19, "pr_hideDimmingLayer"));

  }
  if ((objc_msgSend(v9, "pr_averageColorDidChange") & 1) != 0
    || objc_msgSend(v9, "pr_desiredLegibilitySettingsDidChange"))
  {
    objc_msgSend(v25, "clientSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pr_averageColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UIColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "clientSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pr_desiredLegibilitySettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIPosterVariantViewController _updatePosterAverageColor:desiredLegibilitySettings:](self, "_updatePosterAverageColor:desiredLegibilitySettings:", v22, v24);

  }
  if (objc_msgSend(v9, "pr_prominentColorDidChange"))
    -[PBUIPosterVariantViewController _updatePosterPreferredProminentColor](self, "_updatePosterPreferredProminentColor");
  if (objc_msgSend(v9, "pr_contentSizeDidChange"))
    -[PBUIPosterVariantViewController _updateParallax](self, "_updateParallax");

}

- (UIColor)derivedProminentColor
{
  UIColor *derivedProminentColor;
  UIColor *v3;
  UIColor *v6;
  UIColor *v7;
  void *v8;
  void *v9;

  derivedProminentColor = self->_derivedProminentColor;
  if (derivedProminentColor)
    goto LABEL_2;
  if (-[PBUIPosterVariantViewController variant](self, "variant") != 1)
  {
    -[PBUIPosterVariantViewController counterpart](self, "counterpart");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[PBUIPosterVariantViewController counterpart](self, "counterpart");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "derivedProminentColor");
      v3 = (UIColor *)objc_claimAutoreleasedReturnValue();

      return v3;
    }
LABEL_9:
    v3 = 0;
    return v3;
  }
  -[PBUIPosterVariantViewController _fetchDerivedProminentColor](self, "_fetchDerivedProminentColor");
  v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
  v7 = self->_derivedProminentColor;
  self->_derivedProminentColor = v6;

  derivedProminentColor = self->_derivedProminentColor;
  if (!derivedProminentColor)
    goto LABEL_9;
LABEL_2:
  v3 = derivedProminentColor;
  return v3;
}

- (UIColor)posterPreferredProminentColor
{
  return (UIColor *)-[PBUIPosterVariantViewController _posterPreferredProminentColor:](self, "_posterPreferredProminentColor:", 1);
}

- (id)_posterPreferredProminentColor:(BOOL)a3
{
  _BOOL8 v3;
  UIColor *posterPreferredProminentColor;
  UIColor *v6;
  UIColor *v7;
  UIColor *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (-[PBUIPosterVariantViewController variant](self, "variant") == 1)
  {
    if (!v3)
    {
      -[PBUIPosterVariantViewController _fetchPosterPreferredProminentColor](self, "_fetchPosterPreferredProminentColor");
      v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    posterPreferredProminentColor = self->_posterPreferredProminentColor;
    if (posterPreferredProminentColor
      || (-[PBUIPosterVariantViewController _fetchPosterPreferredProminentColor](self, "_fetchPosterPreferredProminentColor"), v6 = (UIColor *)objc_claimAutoreleasedReturnValue(), v7 = self->_posterPreferredProminentColor, self->_posterPreferredProminentColor = v6, v7, (posterPreferredProminentColor = self->_posterPreferredProminentColor) != 0))
    {
      v8 = posterPreferredProminentColor;
LABEL_9:
      v11 = v8;
      return v11;
    }
LABEL_10:
    v11 = 0;
    return v11;
  }
  -[PBUIPosterVariantViewController counterpart](self, "counterpart");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_10;
  -[PBUIPosterVariantViewController counterpart](self, "counterpart");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_posterPreferredProminentColor:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (UIColor)timeColor
{
  void *v3;
  void *v4;
  UIColor *v5;
  UIColor *timeColor;
  UIColor *v7;
  UIColor *v8;

  if (-[PBUIPosterVariantViewController variant](self, "variant") == 1
    && (-[PBUIPosterVariantViewController counterpart](self, "counterpart"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[PBUIPosterVariantViewController counterpart](self, "counterpart");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    timeColor = self->_timeColor;
    if (!timeColor)
    {
      -[PBUIPosterVariantViewController _fetchTimeColor](self, "_fetchTimeColor");
      v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v8 = self->_timeColor;
      self->_timeColor = v7;

      timeColor = self->_timeColor;
    }
    v5 = timeColor;
  }
  return v5;
}

- (UIColor)preferredProminentColor
{
  void *v3;
  void *v4;

  if (-[PBUIPosterVariantViewController variant](self, "variant") == 1)
  {
    -[PBUIPosterVariantViewController _preferredProminentColor:source:](self, "_preferredProminentColor:source:", 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PBUIPosterVariantViewController counterpart](self, "counterpart");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredProminentColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (UIColor *)v3;
}

- (id)_preferredProminentColor:(BOOL)a3 source:(id *)a4
{
  _BOOL8 v5;
  UIColor *preferredProminentColor;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v5 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if (-[PBUIPosterVariantViewController variant](self, "variant"))
  {
    if (v5)
    {
      preferredProminentColor = self->_preferredProminentColor;
      if (preferredProminentColor)
        return preferredProminentColor;
    }
    -[PBUIPosterVariantViewController derivedProminentColor](self, "derivedProminentColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIPosterVariantViewController _posterPreferredProminentColor:](self, "_posterPreferredProminentColor:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIPosterVariantViewController timeColor](self, "timeColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIPosterVariantViewController fallbackColor](self, "fallbackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend((id)objc_opt_class(), "_determinePreferredProminentColorFromDerivedProminentColor:posterPreferredProminentColor:timeColor:fallbackColor:outChosenColor:", v9, v10, v11, v12, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;
    if (v13)
    {
      -[PBUIPosterVariantViewController setPreferredProminentColor:chosenColorSource:notifyObservers:](self, "setPreferredProminentColor:chosenColorSource:notifyObservers:", v13, v14, 1);
      PBUILogSnapshot();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        PBUIStringForWallpaperVariant(-[PBUIPosterVariantViewController variant](self, "variant"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v19 = v16;
        v20 = 2114;
        v21 = v13;
        v22 = 2114;
        v23 = v14;
        _os_log_impl(&dword_1B71C0000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] loaded preferred prominent color %{public}@/%{public}@", buf, 0x20u);

      }
    }
    if (a4)
      *a4 = objc_retainAutorelease(v14);

  }
  else
  {
    -[PBUIPosterVariantViewController counterpart](self, "counterpart");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_preferredProminentColor:source:", v5, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)setPreferredProminentColor:(id)a3 chosenColorSource:(id)a4 notifyObservers:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  id v14;
  id v15;
  id location;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  if ((-[UIColor isEqual:](self->_preferredProminentColor, "isEqual:", v9) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredProminentColor, a3);
    v11 = objc_msgSend(v10, "copy");
    v12 = (void *)v11;
    if (v11)
      v13 = (__CFString *)v11;
    else
      v13 = CFSTR("UNKNOWN");
    objc_storeStrong((id *)&self->_preferredProminentColorSource, v13);

    -[PBUIPosterVariantViewController updateHomeVariantStyleState](self, "updateHomeVariantStyleState");
    if (v5)
    {
      objc_initWeak(&location, self);
      objc_copyWeak(&v15, &location);
      v14 = v9;
      BSDispatchMain();

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }

}

void __96__PBUIPosterVariantViewController_setPreferredProminentColor_chosenColorSource_notifyObservers___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  char v5;
  id v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained + 145;
    v7 = WeakRetained;
    v4 = objc_loadWeakRetained(WeakRetained + 145);
    v5 = objc_opt_respondsToSelector();

    WeakRetained = v7;
    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained(v3);
      objc_msgSend(v6, "posterComponent:didUpdatePreferredProminentColor:", v7, *(_QWORD *)(a1 + 32));

      WeakRetained = v7;
    }
  }

}

- (BOOL)updateHomeVariantStyleState
{
  return 0;
}

- (void)snapshotSource:(id)a3 failedToReadSnapshotAtURL:(id)a4 error:(id)a5
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PBUILogSnapshot();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[PBUIPosterVariantViewController snapshotSource:failedToReadSnapshotAtURL:error:].cold.1();

  -[PBUIPosterVariantViewController setNeedsNewSnapshot:](self, "setNeedsNewSnapshot:", CFSTR("failed to read snapshot; requesting new one"));
}

- (void)snapshotSource:(id)a3 failedToReadColorStatisticsAtURL:(id)a4 error:(id)a5
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PBUILogSnapshot();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[PBUIPosterVariantViewController snapshotSource:failedToReadColorStatisticsAtURL:error:].cold.1();

  -[PBUIPosterVariantViewController setNeedsNewSnapshot:](self, "setNeedsNewSnapshot:", CFSTR("failed to read color statistics; requesting new snapshot for new color statistics"));
}

- (void)sceneLayerManagerDidUpdateLayers:(id)a3
{
  -[PBUIPosterVariantViewController invalidateSnapshotPreconditions:](self, "invalidateSnapshotPreconditions:", CFSTR("scene layer manager did update layers"));
}

- (void)colorStatisticsDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *WeakRetained;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  double v17;
  int v18;
  double v19;
  int v20;
  double v21;
  int v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PBUIPosterVariantViewController contentColorStatistics](self, "contentColorStatistics");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      -[PBUIPosterVariantViewController desiredLegibilitySettings](self, "desiredLegibilitySettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        PBUILogSnapshot();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          PBUIStringForWallpaperVariant(-[PBUIPosterVariantViewController variant](self, "variant"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v27 = v8;
          _os_log_impl(&dword_1B71C0000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Legibility settings did change", buf, 0xCu);

        }
        PBUILogSnapshot();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v27 = v6;
          _os_log_impl(&dword_1B71C0000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Legibility settings will use desired legibility:", buf, 0xCu);
        }

        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v6, "convertToUILegibility");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "posterComponent:didUpdateLegibilitySettings:", self, v11);
      }
      else
      {
        objc_msgSend(v4, "averageColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "BSColor");
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

        PBUILogSnapshot();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          PBUIStringForWallpaperVariant(-[PBUIPosterVariantViewController variant](self, "variant"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v27 = v14;
          _os_log_impl(&dword_1B71C0000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Legibility settings did change", buf, 0xCu);

        }
        PBUILogSnapshot();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          PBUIStringForWallpaperVariant(-[PBUIPosterVariantViewController variant](self, "variant"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "red");
          v18 = (int)(v17 * 255.0);
          objc_msgSend(WeakRetained, "green");
          v20 = (int)(v19 * 255.0);
          objc_msgSend(WeakRetained, "blue");
          v22 = (int)(v21 * 255.0);
          objc_msgSend(WeakRetained, "alpha");
          *(_DWORD *)buf = 138544386;
          v27 = v16;
          v28 = 1024;
          v29 = v18;
          v30 = 1024;
          v31 = v20;
          v32 = 1024;
          v33 = v22;
          v34 = 2048;
          v35 = v23;
          _os_log_impl(&dword_1B71C0000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updated average color to: #%02X%02X%02X (%.1f)", buf, 0x28u);

        }
        v11 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v4, "legibilitySettings");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "posterComponent:didUpdateLegibilitySettings:", self, v24);

      }
      -[PBUIPosterVariantViewController legibilitySettingsDidChange](self, "legibilitySettingsDidChange");

    }
    else
    {
      v25 = v4;
      BSDispatchMain();

    }
  }

}

uint64_t __60__PBUIPosterVariantViewController_colorStatisticsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "colorStatisticsDidChange:", *(_QWORD *)(a1 + 40));
}

- (void)legibilitySettingsDidChange
{
  PBUIFixedReplicaSourceProvider *portalProvider;
  void *v4;
  id v5;

  portalProvider = self->_portalProvider;
  -[PBUIPosterVariantViewController legibilitySettings](self, "legibilitySettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PBUIPosterVariantViewController makePortalSourceWithLegibilitySettings:](self, "makePortalSourceWithLegibilitySettings:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIFixedReplicaSourceProvider setPortalSource:](portalProvider, "setPortalSource:", v4);

}

- (id)_fetchPosterPreferredProminentColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v13;

  if (-[PBUIPosterVariantViewController variant](self, "variant") == 1)
  {
    -[PBUIPosterVariantViewController _applicableScene](self, "_applicableScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pr_preferredProminentColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UIColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[PBUIURLBackedSnapshotSource posterPreferredProminentColor](self->_snapshotSource, "posterPreferredProminentColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        -[PBUIPosterVariantViewController lockScreenConfiguration](self, "lockScreenConfiguration");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
        objc_msgSend(v7, "pr_loadHomeScreenConfigurationWithError:", &v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v13;

        objc_msgSend(v8, "customizationConfiguration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "suggestedTintColor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          PBUILogCommon();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            -[PBUIPosterVariantViewController _fetchPosterPreferredProminentColor].cold.1();

        }
      }
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_fetchDerivedProminentColor
{
  void *v3;

  if (-[PBUIPosterVariantViewController variant](self, "variant") == 1)
  {
    -[PBUIURLBackedSnapshotSource derivedProminentPosterColor](self->_snapshotSource, "derivedProminentPosterColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_fetchTimeColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  if (-[PBUIPosterVariantViewController variant](self, "variant"))
  {
    v3 = 0;
  }
  else
  {
    -[PBUIPosterVariantViewController _applicableScene](self, "_applicableScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pr_posterConfiguredProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "titleStyleConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "effectiveTitleColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
      }
      else
      {
        objc_msgSend(v8, "color");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;
      objc_msgSend(v9, "colorWithAlphaComponent:", 1.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (void)_handleUpdateProminentPosterDerivedColor:(id)a3 posterPreferredProminentColor:(id)a4 timeColor:(id)a5 fallbackColor:(id)a6
{
  UIColor *v10;
  UIColor *v11;
  UIColor *v12;
  id v13;
  UIColor *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id PRSPosterUpdateClass;
  void *v26;
  void *v27;
  id PRSPosterUpdaterClass;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  UIColor *v40;
  UIColor *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  UIColor *v52;
  NSObject *v53;
  NSObject *v54;
  UIColor *v55;
  UIColor *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  id v65;
  _QWORD block[5];
  UIColor *v67;
  UIColor *v68;
  UIColor *v69;
  id v70;
  uint8_t v71[128];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  UIColor *v75;
  __int16 v76;
  UIColor *v77;
  __int16 v78;
  UIColor *v79;
  __int16 v80;
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v10 = (UIColor *)a3;
  v11 = (UIColor *)a4;
  v12 = (UIColor *)a5;
  v13 = a6;
  if (-[PBUIPosterVariantViewController variant](self, "variant") == 1)
  {
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
    {
      v14 = self->_preferredProminentColor;
      if (v12 || v10 || v11 || v13)
      {
        PBUILogSnapshot();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          PBUIStringForWallpaperVariant(1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v73 = v19;
          v74 = 2114;
          v75 = v10;
          v76 = 2114;
          v77 = v11;
          v78 = 2114;
          v79 = v12;
          v80 = 2114;
          v81 = v13;
          _os_log_impl(&dword_1B71C0000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] running _handleUpdateProminentPosterDerivedColor; derivedProminentColor %{public}@ posterPrefer"
            "redProminentColor %{public}@ timeColor %{public}@ fallbackColor: %{public}@",
            buf,
            0x34u);

        }
        if (v10)
        {
          if (!v11)
            goto LABEL_73;
          goto LABEL_16;
        }
      }
      else
      {
        PBUILogSnapshot();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            PBUIStringForWallpaperVariant(1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v73 = v17;
            v74 = 2114;
            v75 = v14;
            _os_log_impl(&dword_1B71C0000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping _handleUpdateProminentPosterDerivedColor; no colors specified and currentPreferredPr"
              "ominentColor is populated %{public}@",
              buf,
              0x16u);

          }
          v12 = 0;
          v11 = 0;
          v10 = 0;
          goto LABEL_67;
        }
        if (v16)
        {
          PBUIStringForWallpaperVariant(1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v73 = v51;
          _os_log_impl(&dword_1B71C0000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] running _handleUpdateProminentPosterDerivedColor; no currentPreferredProminentColor is populated",
            buf,
            0xCu);

        }
      }
      -[PBUIPosterVariantViewController _fetchDerivedProminentColor](self, "_fetchDerivedProminentColor");
      v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
LABEL_73:
        -[PBUIPosterVariantViewController _fetchPosterPreferredProminentColor](self, "_fetchPosterPreferredProminentColor");
        v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
        if (v12)
          goto LABEL_17;
        goto LABEL_74;
      }
LABEL_16:
      if (v12)
        goto LABEL_17;
LABEL_74:
      -[PBUIPosterVariantViewController timeColor](self, "timeColor");
      v12 = (UIColor *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      -[PBUIPosterVariantViewController timeColor](self, "timeColor");
      v15 = objc_claimAutoreleasedReturnValue();
      -[PBUIPosterVariantViewController posterPreferredProminentColor](self, "posterPreferredProminentColor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIPosterVariantViewController derivedProminentColor](self, "derivedProminentColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIPosterVariantViewController fallbackColor](self, "fallbackColor");
      v57 = v20;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        if ((objc_msgSend(v20, "isEqual:", v10) & 1) != 0)
          goto LABEL_19;
      }
      else if (!v10)
      {
LABEL_19:
        if (v15)
          goto LABEL_20;
        goto LABEL_26;
      }
      -[PBUIPosterVariantViewController setDerivedProminentColor:](self, "setDerivedProminentColor:", v10);
      PBUILogSnapshot();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        PBUIStringForWallpaperVariant(1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = v22;
        v74 = 2114;
        v75 = v10;
        _os_log_impl(&dword_1B71C0000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating DERIVED PROMINENT COLOR: %{public}@", buf, 0x16u);

      }
      if (v15)
      {
LABEL_20:
        if ((-[NSObject isEqual:](v15, "isEqual:", v12) & 1) != 0)
          goto LABEL_30;
        goto LABEL_27;
      }
LABEL_26:
      if (!v12)
        goto LABEL_30;
LABEL_27:
      -[PBUIPosterVariantViewController setTimeColor:](self, "setTimeColor:", v12);
      PBUILogSnapshot();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        PBUIStringForWallpaperVariant(1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = v24;
        v74 = 2114;
        v75 = v12;
        _os_log_impl(&dword_1B71C0000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating TIME COLOR: %{public}@", buf, 0x16u);

      }
LABEL_30:
      if (v59)
      {
        if ((objc_msgSend(v59, "isEqual:", v11) & 1) != 0)
          goto LABEL_42;
      }
      else if (!v11)
      {
        goto LABEL_42;
      }
      v53 = v15;
      v55 = v14;
      -[PBUIPosterVariantViewController setPosterPreferredProminentColor:](self, "setPosterPreferredProminentColor:", v11);
      -[PBUIURLBackedSnapshotSource updatePosterPreferredProminentColor:error:](self->_snapshotSource, "updatePosterPreferredProminentColor:error:", v11, 0);
      PRSPosterUpdateClass = getPRSPosterUpdateClass();
      -[UIColor BSColor](v11, "BSColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(PRSPosterUpdateClass, "posterUpdateHomeScreenSuggestedTintColor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      PRSPosterUpdaterClass = getPRSPosterUpdaterClass();
      -[PBUIPosterVariantViewController _lockVariantScene](self, "_lockVariantScene");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pui_posterPath");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(PRSPosterUpdaterClass, "updaterForPath:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = 0;
      LODWORD(PRSPosterUpdaterClass) = objc_msgSend(v31, "applyUpdateLocally:error:", v27, &v65);
      v32 = v65;
      v33 = v32;
      if (!(_DWORD)PRSPosterUpdaterClass || v32)
      {
        PBUILogSnapshot();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[PBUIPosterVariantViewController _handleUpdateProminentPosterDerivedColor:posterPreferredProminentColor:timeColor:fallbackColor:].cold.1();

      }
      PBUILogSnapshot();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        PBUIStringForWallpaperVariant(1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = v36;
        v74 = 2114;
        v75 = v11;
        _os_log_impl(&dword_1B71C0000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating POSTER PREFERRED PROMINENT COLOR color: %{public}@", buf, 0x16u);

      }
      v15 = v53;
      v14 = v55;
LABEL_42:
      if (v58)
      {
        if ((objc_msgSend(v58, "isEqual:", v13) & 1) != 0)
          goto LABEL_49;
      }
      else if (!v13)
      {
        goto LABEL_49;
      }
      -[PBUIPosterVariantViewController setFallbackColor:](self, "setFallbackColor:", v13);
      PBUILogSnapshot();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        PBUIStringForWallpaperVariant(1);
        v38 = v15;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = v39;
        v74 = 2114;
        v75 = v11;
        _os_log_impl(&dword_1B71C0000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating POSTER FALLBACK COLOR: %{public}@", buf, 0x16u);

        v15 = v38;
      }

LABEL_49:
      v64 = 0;
      objc_msgSend((id)objc_opt_class(), "_determinePreferredProminentColorFromDerivedProminentColor:posterPreferredProminentColor:timeColor:fallbackColor:outChosenColor:", v10, v11, v12, v13, &v64);
      v40 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v41 = (UIColor *)v64;
      if (v14)
      {
        if ((-[UIColor isEqual:](v14, "isEqual:", v40) & 1) != 0)
          goto LABEL_66;
      }
      else if (!v40)
      {
LABEL_66:

LABEL_67:
        goto LABEL_68;
      }
      v52 = v41;
      -[PBUIPosterVariantViewController setPreferredProminentColor:chosenColorSource:notifyObservers:](self, "setPreferredProminentColor:chosenColorSource:notifyObservers:", v40, v41, v40 != 0);
      PBUILogSnapshot();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        PBUIStringForWallpaperVariant(1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v73 = v43;
        v74 = 2114;
        v75 = v40;
        v76 = 2114;
        v77 = v52;
        _os_log_impl(&dword_1B71C0000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}@] preferred prominent color WAS UPDATED: %{public}@/%{public}@", buf, 0x20u);

      }
      v44 = (void *)-[NSMutableArray copy](self->_fetchBlocks, "copy");
      v45 = v44;
      if (v40 && objc_msgSend(v44, "count"))
      {
        v54 = v15;
        v56 = v14;
        -[NSMutableArray removeAllObjects](self->_fetchBlocks, "removeAllObjects");
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v46 = v45;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v61;
          do
          {
            for (i = 0; i != v48; ++i)
            {
              if (*(_QWORD *)v61 != v49)
                objc_enumerationMutation(v46);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i) + 16))();
            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
          }
          while (v48);
        }

        v15 = v54;
        v14 = v56;
      }

      v41 = v52;
      goto LABEL_66;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __130__PBUIPosterVariantViewController__handleUpdateProminentPosterDerivedColor_posterPreferredProminentColor_timeColor_fallbackColor___block_invoke;
    block[3] = &unk_1E6B96760;
    block[4] = self;
    v10 = v10;
    v67 = v10;
    v11 = v11;
    v68 = v11;
    v12 = v12;
    v69 = v12;
    v70 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
LABEL_68:

}

uint64_t __130__PBUIPosterVariantViewController__handleUpdateProminentPosterDerivedColor_posterPreferredProminentColor_timeColor_fallbackColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleUpdateProminentPosterDerivedColor:posterPreferredProminentColor:timeColor:fallbackColor:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_updatePosterAverageColor:(id)a3 desiredLegibilitySettings:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  PUIColorStatistics *posterColorStatistics;
  PUIColorStatistics *v14;
  PUIColorStatistics *v15;
  void *v16;
  char v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  if (!v7)
    goto LABEL_4;
  -[PBUIPosterVariantViewController desiredLegibilitySettings](self, "desiredLegibilitySettings");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_5;
  v9 = (void *)v8;
  -[PBUIPosterVariantViewController desiredLegibilitySettings](self, "desiredLegibilitySettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v7);

  if ((v11 & 1) != 0)
  {
LABEL_4:
    v12 = 0;
  }
  else
  {
LABEL_5:
    -[PBUIPosterVariantViewController setDesiredLegibilitySettings:](self, "setDesiredLegibilitySettings:", v7);
    v12 = 1;
  }
  posterColorStatistics = self->_posterColorStatistics;
  if (v6)
  {
    if (!posterColorStatistics)
    {
      v14 = (PUIColorStatistics *)objc_msgSend(objc_alloc((Class)getPUIColorStatisticsClass()), "initWithDelegate:", self);
      v15 = self->_posterColorStatistics;
      self->_posterColorStatistics = v14;

      posterColorStatistics = self->_posterColorStatistics;
    }
    -[PUIColorStatistics averageColor](posterColorStatistics, "averageColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "_isSimilarToColor:withinPercentage:", v6, 0.00000011920929);

    if ((v17 & 1) == 0)
    {
      -[PUIColorStatistics resetWithColor:](self->_posterColorStatistics, "resetWithColor:", v6);
      goto LABEL_13;
    }
  }
  else if (posterColorStatistics)
  {
    self->_posterColorStatistics = 0;

LABEL_13:
    v18 = 0;
    if (!v12)
      goto LABEL_18;
    goto LABEL_16;
  }
  v18 = 1;
  if (!v12)
    goto LABEL_18;
LABEL_16:
  -[PBUIPosterVariantViewController legibilitySettingsDidChange](self, "legibilitySettingsDidChange");
  -[PBUIPosterVariantViewController desiredLegibilitySettings](self, "desiredLegibilitySettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v22, &location);
    v21 = v7;
    BSDispatchMain();

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    goto LABEL_20;
  }
LABEL_18:
  if ((v18 & 1) == 0)
  {
    -[PBUIPosterVariantViewController contentColorStatistics](self, "contentColorStatistics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIPosterVariantViewController colorStatisticsDidChange:](self, "colorStatisticsDidChange:", v20);

  }
LABEL_20:

}

void __87__PBUIPosterVariantViewController__updatePosterAverageColor_desiredLegibilitySettings___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 145);
    objc_msgSend(*(id *)(a1 + 32), "convertToUILegibility");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "posterComponent:didUpdateLegibilitySettings:", v5, v4);

    WeakRetained = v5;
  }

}

- (void)_updatePosterPreferredProminentColor
{
  id v3;

  -[PBUIPosterVariantViewController _fetchPosterPreferredProminentColor](self, "_fetchPosterPreferredProminentColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PBUIPosterVariantViewController _handleUpdateProminentPosterDerivedColor:posterPreferredProminentColor:timeColor:fallbackColor:](self, "_handleUpdateProminentPosterDerivedColor:posterPreferredProminentColor:timeColor:fallbackColor:", 0, v3, 0, 0);

}

+ (id)_determinePreferredProminentColorFromDerivedProminentColor:(id)a3 posterPreferredProminentColor:(id)a4 timeColor:(id)a5 fallbackColor:(id)a6 outChosenColor:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  __CFString *v17;
  id v18;
  id v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v12;
  v16 = v15;
  if (v15 && a7)
  {
    v17 = CFSTR("posterPreferredProminentColor");
    v18 = v15;
LABEL_18:
    *a7 = v17;
    goto LABEL_19;
  }
  if (!v11 || v15)
  {
    if (v15 || !v13)
    {
      v18 = v15;
      if (!v15)
      {
        if (v14)
        {
          v19 = v14;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA478], "purpleColor");
          v19 = (id)objc_claimAutoreleasedReturnValue();
        }
        v18 = v19;
        if (a7)
        {
          v17 = CFSTR("fallbackColor");
          goto LABEL_18;
        }
      }
    }
    else
    {
      v18 = v13;
      if (a7)
      {
        v17 = CFSTR("timeColor");
        goto LABEL_18;
      }
    }
  }
  else
  {
    v18 = v11;
    if (a7)
    {
      v17 = CFSTR("derivedPreferredProminentColor");
      goto LABEL_18;
    }
  }
LABEL_19:

  return v18;
}

- (NSString)description
{
  return (NSString *)-[PBUIPosterVariantViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIPosterVariantViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[PBUIPosterVariantViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  PBUIPosterVariantViewController *v11;

  v4 = a3;
  -[PBUIPosterVariantViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__PBUIPosterVariantViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6B94BC8;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __73__PBUIPosterVariantViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 976), CFSTR("scene"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 984), CFSTR("presenter"), 1);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentColorStatistics");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v6, CFSTR("colorStats"), 1);

}

- (void)setDesiredLegibilitySettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1136);
}

- (void)setPosterPreferredProminentColor:(id)a3
{
  objc_storeStrong((id *)&self->_posterPreferredProminentColor, a3);
}

- (void)setTimeColor:(id)a3
{
  objc_storeStrong((id *)&self->_timeColor, a3);
}

- (PBUIPosterVariantViewController)counterpart
{
  return (PBUIPosterVariantViewController *)objc_loadWeakRetained((id *)&self->_counterpart);
}

- (PBUIPosterComponentDelegate)delegate
{
  return (PBUIPosterComponentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIScenePresenter)presenter
{
  return self->_presenter;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)setDerivedProminentColor:(id)a3
{
  objc_storeStrong((id *)&self->_derivedProminentColor, a3);
}

- (UIColor)fallbackColor
{
  return self->_fallbackColor;
}

- (void)setFallbackColor:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackColor, a3);
}

- (void)setPreferredProminentColor:(id)a3
{
  objc_storeStrong((id *)&self->_preferredProminentColor, a3);
}

- (PUIManagedCacheIdentifying)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_preferredProminentColor, 0);
  objc_storeStrong((id *)&self->_fallbackColor, 0);
  objc_storeStrong((id *)&self->_derivedProminentColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeColor, 0);
  objc_storeStrong((id *)&self->_posterPreferredProminentColor, 0);
  objc_storeStrong((id *)&self->_desiredLegibilitySettings, 0);
  objc_storeStrong((id *)&self->_fetchBlocks, 0);
  objc_storeStrong((id *)&self->_preferredProminentColorSource, 0);
  objc_storeStrong((id *)&self->_isRotating, 0);
  objc_storeStrong((id *)&self->_snapshotScheduled, 0);
  objc_storeStrong((id *)&self->_snapshotNeeded, 0);
  objc_storeStrong((id *)&self->_snapshotProvider, 0);
  objc_storeStrong((id *)&self->_pathProvider, 0);
  objc_storeStrong((id *)&self->_fauxExternalScene, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_portalProvider, 0);
  objc_storeStrong((id *)&self->_snapshotSource, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_posterColorStatistics, 0);
  objc_destroyWeak((id *)&self->_counterpart);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_contentContainer, 0);
}

- (void)initWithScene:counterpart:.cold.1()
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
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)setCounterpart:.cold.1()
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
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)fetchWallpaperProminentColor:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  PBUIStringForWallpaperVariant(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1B71C0000, v2, v3, "[%{public}@] no counter part on a non-lockscreen variant... returning magenta", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_15();
}

- (void)fetchWallpaperProminentColor:(uint64_t)a1 .cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  PBUIStringForWallpaperVariant(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1B71C0000, v2, v3, "[%{public}@] non-lock screen variant, calling through to counterpart", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_15();
}

void __64__PBUIPosterVariantViewController_fetchWallpaperProminentColor___block_invoke_43_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_0();
  PBUIStringForWallpaperVariant(*(_QWORD *)(v0 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1_4(&dword_1B71C0000, v2, v3, "[%{public}@] error determining prominent color determination from last snapshot taken:  %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_14();
}

- (void)_monitorScene:.cold.1()
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
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)_monitorScene:.cold.2()
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
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)_snapshotNow:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_14_0();
  v11 = *MEMORY[0x1E0C80C00];
  PBUIStringForWallpaperVariant(objc_msgSend(v2, "variant"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543874;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  v9 = 2114;
  v10 = v1;
  _os_log_debug_impl(&dword_1B71C0000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@] Snapshot scheduled for (now) %{public}@ for reason %{public}@", (uint8_t *)&v5, 0x20u);

}

- (void)snapshotIfNeeded:(void *)a1 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = OUTLINED_FUNCTION_12_0(a1, a2);
  PBUIStringForWallpaperVariant(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1B71C0000, v4, v5, "[%{public}@]\tSnapshot attempt failed because preconditions failed: ", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_15();
}

void __60__PBUIPosterVariantViewController__prepareFauxExternalScene__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1B71C0000, v0, v1, "Error preparing faux external scene", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)_prepareFauxExternalSceneFromScene:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1B71C0000, v0, v1, "Cannot prepare faux external scene. Path is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)_prepareFauxExternalSceneFromScene:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1B71C0000, v0, v1, "Cannot prepare faux external scene. No external display configuration identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

- (void)_prepareFauxExternalSceneFromScene:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_1B71C0000, v0, v1, "Cannot prepare faux external scene. Extension instance is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_1();
}

void __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_1B71C0000, v2, v3, "Failed to boot up extension instance for faux external scene preparation: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_15();
}

void __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke_cold_1(void *a1, char *a2, NSObject *a3)
{
  uint64_t v5;
  id v6;
  __CFString *v7;
  int v8;
  id v9;
  __int16 v10;
  __CFString *v11;

  v5 = OUTLINED_FUNCTION_12_0(a1, a2);
  PBUIStringForWallpaperVariant(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    objc_msgSend(a2, "descriptionWithMultilinePrefix:", 0);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("None");
  }
  v8 = 138543618;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_1B71C0000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Snapshot capture failed. Error=%@", (uint8_t *)&v8, 0x16u);
  if (a2)

  OUTLINED_FUNCTION_14();
}

void __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke_cold_2()
{
  void *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_12_0(v1, v2);
  PBUIStringForWallpaperVariant(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_13_0(), "descriptionWithMultilinePrefix:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_4(&dword_1B71C0000, v5, v6, "[%{public}@] Snapshot capture failed. Error=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_14();
}

- (void)snapshotSource:failedToReadSnapshotAtURL:error:.cold.1()
{
  void *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_12_0(v1, v2);
  PBUIStringForWallpaperVariant(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_13_0(), "descriptionWithMultilinePrefix:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_4(&dword_1B71C0000, v5, v6, "[%{public}@] Existing snapshot failed to be read. Requesting new one. error=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_14();
}

- (void)snapshotSource:failedToReadColorStatisticsAtURL:error:.cold.1()
{
  void *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_12_0(v1, v2);
  PBUIStringForWallpaperVariant(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_13_0(), "descriptionWithMultilinePrefix:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_4(&dword_1B71C0000, v5, v6, "[%{public}@] Existing snapshot color attributes failed to be read. Requesting a new one. error=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_14();
}

- (void)_fetchPosterPreferredProminentColor
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_1B71C0000, v0, OS_LOG_TYPE_ERROR, "Unable to load  home screen configuration: %{public}@", v1, 0xCu);
}

- (void)_handleUpdateProminentPosterDerivedColor:posterPreferredProminentColor:timeColor:fallbackColor:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  PBUIStringForWallpaperVariant(1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1_4(&dword_1B71C0000, v1, v2, "[%{public}@] error updating POSTER PREFERRED PROMINENT COLOR: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_14();
}

@end
