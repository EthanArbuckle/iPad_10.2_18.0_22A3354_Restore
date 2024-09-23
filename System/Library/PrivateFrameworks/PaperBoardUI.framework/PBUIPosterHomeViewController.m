@implementation PBUIPosterHomeViewController

- (id)contentColorStatistics
{
  PUIColorStatistics *fixedColorStatistics;
  objc_super v4;

  fixedColorStatistics = self->_fixedColorStatistics;
  if (fixedColorStatistics)
    return fixedColorStatistics;
  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterHomeViewController;
  -[PBUIPosterVariantViewController contentColorStatistics](&v4, sel_contentColorStatistics);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)reflectsLock
{
  return !self->_fixedColorStatistics && !self->super._scene && (unint64_t)(self->_currentMode - 1) < 2;
}

- (int64_t)variant
{
  return 1;
}

- (void)setActiveStyle:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterHomeViewController;
  -[PBUIPosterVariantViewController setActiveStyle:](&v4, sel_setActiveStyle_, a3);
  -[PBUIPosterHomeViewController configureForZOrder](self, "configureForZOrder");
}

- (void)configureForZOrder
{
  void *v3;
  void *v4;
  UIView **p_contentContainer;
  void *snapshotView;
  UIView *contentContainer;
  PBUISnapshotReplicaView **p_snapshotView;
  void *dynamicWrapperView;

  -[PBUIPosterHomeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bringSubviewToFront:", self->_dimView);

  -[BSUIOrientationTransformWrapperView superview](self->_dynamicWrapperView, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (-[PBUIPosterHomeViewController canShowSnapshot](self, "canShowSnapshot")
      && !-[PBUIPosterHomeViewController reflectsLock](self, "reflectsLock"))
    {
      p_contentContainer = &self->super._contentContainer;
      contentContainer = self->super._contentContainer;
      p_snapshotView = &self->super._snapshotView;
      snapshotView = self->super._snapshotView;
      dynamicWrapperView = self->_dynamicWrapperView;
    }
    else
    {
      p_contentContainer = &self->super._contentContainer;
      snapshotView = self->_dynamicWrapperView;
      contentContainer = self->super._contentContainer;
      p_snapshotView = &self->super._snapshotView;
      dynamicWrapperView = self->super._snapshotView;
    }
    -[UIView insertSubview:aboveSubview:](contentContainer, "insertSubview:aboveSubview:", snapshotView, dynamicWrapperView);
    -[UIView insertSubview:aboveSubview:](*p_contentContainer, "insertSubview:aboveSubview:", self->_effectView, *p_snapshotView);
  }
}

- (BOOL)canShowSnapshot
{
  return !-[PBUIPosterVariantViewController needsSnapshot](self, "needsSnapshot")
      && -[PBUIPosterVariantViewController isSnapshotInCorrectOrientation](self, "isSnapshotInCorrectOrientation")
      && -[PBUIPosterHomeViewController showsSnapshotWhenIdleForMode:](self, "showsSnapshotWhenIdleForMode:", self->_currentMode)&& -[PBUIPosterHomeViewController isSettledPosition](self, "isSettledPosition");
}

- (BOOL)showsSnapshotWhenIdleForMode:(int64_t)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  void *v11;
  BOOL v12;
  char v13;

  if (a3 == 2)
    return 1;
  if (a3 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._counterpart);
    objc_msgSend(WeakRetained, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pui_provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider")))
    {

      return 1;
    }
    v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.WallpaperKit.CollectionsPoster"));
    -[PBUIPosterHomeViewController _descriptorIdentity](self, "_descriptorIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (!v12)
    {
      v13 = _PRCollectionsPosterDescriptorNeedsSnapshotReplacement(v10);

      return v13;
    }

  }
  return 0;
}

- (id)_descriptorIdentity
{
  id WeakRetained;
  FBScene *scene;
  void *v4;
  void *v5;
  void *v6;

  scene = self->super._scene;
  v4 = scene;
  if (!scene)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._counterpart);
    objc_msgSend(WeakRetained, "scene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "pui_posterPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptorIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!scene)
  {

  }
  return v6;
}

- (BOOL)isBlurred
{
  return self->_currentMode == 2;
}

- (void)dealloc
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSHashTable *duckHomeScreenWallpaperDimAssertions;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_duckHomeScreenWallpaperDimAssertions;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  duckHomeScreenWallpaperDimAssertions = self->_duckHomeScreenWallpaperDimAssertions;
  self->_duckHomeScreenWallpaperDimAssertions = 0;

  v9.receiver = self;
  v9.super_class = (Class)PBUIPosterHomeViewController;
  -[PBUIPosterVariantViewController dealloc](&v9, sel_dealloc);
}

- (void)loadView
{
  BSUIOrientationTransformWrapperView *v3;
  BSUIOrientationTransformWrapperView *dynamicWrapperView;
  UIView *v5;
  UIView *dimView;
  UIView *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PBUIPosterHomeViewController;
  -[PBUIPosterHomeViewController loadView](&v9, sel_loadView);
  v3 = (BSUIOrientationTransformWrapperView *)objc_alloc_init(MEMORY[0x1E0D01940]);
  dynamicWrapperView = self->_dynamicWrapperView;
  self->_dynamicWrapperView = v3;

  v5 = (UIView *)objc_opt_new();
  dimView = self->_dimView;
  self->_dimView = v5;

  v7 = self->_dimView;
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

}

- (void)viewDidLoad
{
  BSUIOrientationTransformWrapperView *dynamicWrapperView;
  int64_t initialOrientation;
  BSUIOrientationTransformWrapperView *v5;
  void *v6;
  id v7;
  MTMaterialView *v8;
  MTMaterialView *wallpaperCaptureView;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v19.receiver = self;
  v19.super_class = (Class)PBUIPosterHomeViewController;
  -[PBUIPosterVariantViewController viewDidLoad](&v19, sel_viewDidLoad);
  dynamicWrapperView = self->_dynamicWrapperView;
  -[UIView bounds](self->super._contentContainer, "bounds");
  -[BSUIOrientationTransformWrapperView setFrame:](dynamicWrapperView, "setFrame:");
  initialOrientation = 1;
  -[BSUIOrientationTransformWrapperView setCounterTransformView:](self->_dynamicWrapperView, "setCounterTransformView:", 1);
  self->_initialOrientation = 1;
  v5 = self->_dynamicWrapperView;
  if (soft_PUIDynamicRotationIsActive())
    initialOrientation = self->_initialOrientation;
  -[BSUIOrientationTransformWrapperView setContainerOrientation:](v5, "setContainerOrientation:", initialOrientation);
  -[UIView addSubview:](self->super._contentContainer, "addSubview:", self->_dynamicWrapperView);
  -[PBUIPosterHomeViewController _updateRotationForOrientation:](self, "_updateRotationForOrientation:", self->_initialOrientation);
  if (_PRNeedsWallpaperCaptureView_onceToken != -1)
    dispatch_once(&_PRNeedsWallpaperCaptureView_onceToken, &__block_literal_global_15);
  if (_PRNeedsWallpaperCaptureView_needsWallpaperCaptureView)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v6 = (void *)getMTMaterialViewClass_softClass_0;
    v24 = getMTMaterialViewClass_softClass_0;
    if (!getMTMaterialViewClass_softClass_0)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __getMTMaterialViewClass_block_invoke_0;
      v20[3] = &unk_1E6B94840;
      v20[4] = &v21;
      __getMTMaterialViewClass_block_invoke_0((uint64_t)v20);
      v6 = (void *)v22[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v21, 8);
    objc_msgSend(v7, "materialViewWithRecipe:options:", 19, 4);
    v8 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    wallpaperCaptureView = self->_wallpaperCaptureView;
    self->_wallpaperCaptureView = v8;

    -[MTMaterialView setGroupName:](self->_wallpaperCaptureView, "setGroupName:", CFSTR("WallpaperCaptureGroup"));
    -[MTMaterialView layer](self->_wallpaperCaptureView, "layer");
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

    objc_msgSend(v14, "setGroupNamespace:", *MEMORY[0x1E0CD2958]);
    objc_msgSend(v12, "setName:", CFSTR("WallpaperCaptureLayer"));
    -[MTMaterialView setAutoresizingMask:](self->_wallpaperCaptureView, "setAutoresizingMask:", 18);
    -[PBUIPosterHomeViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", self->_wallpaperCaptureView);

    -[PBUIPosterHomeViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bringSubviewToFront:", self->_wallpaperCaptureView);

  }
  -[PBUIPosterHomeViewController configureForZOrder](self, "configureForZOrder");
  -[PBUIPosterHomeViewController unlockProgress](self, "unlockProgress");
  -[PBUIPosterHomeViewController _updateDimHomeScreenWallpaperViewForUnlockProgress:animated:](self, "_updateDimHomeScreenWallpaperViewForUnlockProgress:animated:", 0);
  -[PBUIPosterHomeViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", self->_dimView);

  -[PBUIPosterHomeViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bringSubviewToFront:", self->_dimView);

  -[PBUIPosterHomeViewController _updateEnableHomeScreenWallpaperDimming](self, "_updateEnableHomeScreenWallpaperDimming");
}

- (void)viewDidLayoutSubviews
{
  BSUIOrientationTransformWrapperView *dynamicWrapperView;
  MTMaterialView *wallpaperCaptureView;
  void *v5;
  UIView *dimView;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PBUIPosterHomeViewController;
  -[PBUIPosterHomeViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  dynamicWrapperView = self->_dynamicWrapperView;
  -[UIView bounds](self->super._contentContainer, "bounds");
  -[BSUIOrientationTransformWrapperView setFrame:](dynamicWrapperView, "setFrame:");
  wallpaperCaptureView = self->_wallpaperCaptureView;
  if (wallpaperCaptureView)
  {
    -[PBUIPosterHomeViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    -[MTMaterialView setFrame:](wallpaperCaptureView, "setFrame:");

  }
  dimView = self->_dimView;
  -[PBUIPosterHomeViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[UIView setFrame:](dimView, "setFrame:");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterHomeViewController;
  -[PBUIPosterHomeViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PBUIPosterHomeViewController unlockProgress](self, "unlockProgress");
  -[PBUIPosterHomeViewController _updateDimHomeScreenWallpaperViewForUnlockProgress:animated:](self, "_updateDimHomeScreenWallpaperViewForUnlockProgress:animated:", 0);
}

- (PBUIHomeVariantStyleState)currentHomeVariantStyleState
{
  PBUIHomeVariantStyleState *currentHomeVariantStyleState;
  PBUIHomeVariantStyleState *v4;
  PBUIHomeVariantStyleState *v5;

  currentHomeVariantStyleState = self->_currentHomeVariantStyleState;
  if (!currentHomeVariantStyleState)
  {
    -[PBUIPosterHomeViewController _fetchStyleState](self, "_fetchStyleState");
    v4 = (PBUIHomeVariantStyleState *)objc_claimAutoreleasedReturnValue();
    v5 = self->_currentHomeVariantStyleState;
    self->_currentHomeVariantStyleState = v4;

    currentHomeVariantStyleState = self->_currentHomeVariantStyleState;
  }
  return currentHomeVariantStyleState;
}

- (id)homeScreenConfiguration
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._counterpart);
  objc_msgSend(WeakRetained, "lockScreenConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v3, "pr_loadHomeScreenConfigurationWithError:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    PBUILogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PBUIPosterHomeViewController homeScreenConfiguration].cold.1((uint64_t)v5, v6);

  }
  return v4;
}

- (id)averageColor
{
  void *v2;
  objc_super v4;

  if (self->_fixedColorStatistics)
  {
    -[PUIColorStatistics averageColor](self->_fixedColorStatistics, "averageColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PBUIPosterHomeViewController;
    -[PBUIPosterVariantViewController averageColor](&v4, sel_averageColor);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (double)averageContrast
{
  double result;
  objc_super v3;

  if (self->_fixedColorStatistics)
  {
    -[PUIColorStatistics averageContrast](self->_fixedColorStatistics, "averageContrast");
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)PBUIPosterHomeViewController;
    -[PBUIPosterVariantViewController averageContrast](&v3, sel_averageContrast);
  }
  return result;
}

- (void)noteWillRotateToInterfaceOrientation:(int64_t)a3
{
  _QWORD v5[6];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBUIPosterHomeViewController;
  -[PBUIPosterVariantViewController noteWillRotateToInterfaceOrientation:](&v6, sel_noteWillRotateToInterfaceOrientation_);
  self->_mostRecentOrientation = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__PBUIPosterHomeViewController_noteWillRotateToInterfaceOrientation___block_invoke;
  v5[3] = &unk_1E6B951E0;
  v5[4] = self;
  v5[5] = a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v5, 0.4);
  self->_isUpdatingOrientation = 1;
}

uint64_t __69__PBUIPosterHomeViewController_noteWillRotateToInterfaceOrientation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRotationForOrientation:", *(_QWORD *)(a1 + 40));
}

- (void)noteDidRotateToInterfaceOrientation:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterHomeViewController;
  -[PBUIPosterVariantViewController noteDidRotateToInterfaceOrientation:](&v4, sel_noteDidRotateToInterfaceOrientation_, a3);
  self->_isUpdatingOrientation = 0;
}

- (void)_updateRotationForOrientation:(int64_t)a3
{
  BSUIOrientationTransformWrapperView *dynamicWrapperView;
  int64_t v5;
  FBScene *scene;
  _QWORD v8[5];

  dynamicWrapperView = self->_dynamicWrapperView;
  if (self->_gradientView)
  {
    if (soft_PUIDynamicRotationIsActive())
      v5 = a3;
    else
      v5 = 1;
    -[BSUIOrientationTransformWrapperView setContentOrientation:](dynamicWrapperView, "setContentOrientation:", v5);
  }
  else
  {
    -[BSUIOrientationTransformWrapperView setContentOrientation:](self->_dynamicWrapperView, "setContentOrientation:", 1);
    scene = self->super._scene;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__PBUIPosterHomeViewController__updateRotationForOrientation___block_invoke;
    v8[3] = &unk_1E6B95618;
    v8[4] = self;
    -[FBScene pb_update:](scene, "pb_update:", v8);
  }
}

void __62__PBUIPosterHomeViewController__updateRotationForOrientation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  v6 = a2;
  if ((soft_PUIDynamicRotationIsActive() & 1) != 0)
    v7 = 1;
  else
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1272);
  objc_msgSend(v6, "setInterfaceOrientation:", v7);
  objc_msgSend(v6, "pui_setDeviceOrientation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1272));

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_synchronizeDrawing");
  objc_msgSend(v13, "_synchronizedDrawingFence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimationFence:", v10);

  v11 = (void *)MEMORY[0x1E0D016B0];
  objc_msgSend(MEMORY[0x1E0CEABB0], "inheritedAnimationDuration");
  objc_msgSend(v11, "settingsWithDuration:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimationSettings:", v12);

}

- (void)performSnapshotOnQueue:(id)a3 scene:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int64_t currentMode;
  objc_super v22;
  _QWORD v23[4];
  id v24;
  PBUIPosterHomeViewController *v25;
  id v26;
  objc_super v27;
  _QWORD v28[4];
  id v29;
  PBUIPosterHomeViewController *v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke;
  v37[3] = &unk_1E6B95FF8;
  v12 = v9;
  v38 = v12;
  v13 = (void *)MEMORY[0x1BCCA5978](v37);
  v34[0] = v11;
  v34[1] = 3221225472;
  v34[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_2;
  v34[3] = &unk_1E6B96070;
  objc_copyWeak(&v36, &location);
  v14 = v8;
  v35 = v14;
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1BCCA5978](v34);
  v28[0] = v11;
  v28[1] = 3221225472;
  v28[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_5;
  v28[3] = &unk_1E6B96110;
  v16 = v12;
  v29 = v16;
  v30 = self;
  v17 = v10;
  v32 = v17;
  v18 = v14;
  v31 = v18;
  v19 = v13;
  v33 = v19;
  v20 = (void *)MEMORY[0x1BCCA5978](v28);
  currentMode = self->_currentMode;
  if (currentMode == 2)
  {
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_4_77;
    v23[3] = &unk_1E6B96138;
    v24 = v18;
    v25 = self;
    v26 = v20;
    v22.receiver = self;
    v22.super_class = (Class)PBUIPosterHomeViewController;
    -[PBUIPosterVariantViewController performSnapshotOnQueue:scene:completion:](&v22, sel_performSnapshotOnQueue_scene_completion_, v24, v16, v23);

  }
  else if (currentMode == 1)
  {
    v27.receiver = self;
    v27.super_class = (Class)PBUIPosterHomeViewController;
    -[PBUIPosterVariantViewController performSnapshotOnQueue:scene:completion:](&v27, sel_performSnapshotOnQueue_scene_completion_, v18, v16, v20);
  }
  else
  {
    ((void (**)(_QWORD, void *))v15)[2](v15, v20);
  }

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

id __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = (void *)objc_msgSend(a2, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  v10 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(v5, "BSColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("kDerivedProminentPosterColorMetadataKey"));

  v13 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(*(id *)(a1 + 32), "clientSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pr_preferredProminentColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("kPosterPreferredProminentPosterColorMetadataKey"));

  return v9;
}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = v3;
  v4 = *(id *)(a1 + 32);
  BSDispatchMain();

  objc_destroyWeak(&v6);
}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = objc_msgSend(v4, "newSnapshotWithRect:");

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_4;
    v13[3] = &unk_1E6B96020;
    v15 = v6;
    v7 = *(NSObject **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v13[4] = v3;
    v14 = v8;
    dispatch_async(v7, v13);
    v9 = v14;
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D68];
    v17[0] = CFSTR("calling object was deallocated before we could access");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PaperBoardUI"), -2, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v10 + 16))(v10, 0, 0, 0, v12);

  }
}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  CGImageRelease(*(CGImageRef *)(a1 + 48));

}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_6;
  block[3] = &unk_1E6B960E8;
  v13 = *(id *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v20 = v13;
  v21 = v14;
  v22 = v12;
  v23 = v9;
  v27 = *(id *)(a1 + 56);
  v24 = v10;
  v25 = v11;
  v26 = *(id *)(a1 + 48);
  v28 = *(id *)(a1 + 64);
  v15 = v11;
  v16 = v10;
  v17 = v9;
  v18 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "clientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pr_preferredProminentColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "derivedProminentColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  PBUILogSnapshot();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant(objc_msgSend(*(id *)(a1 + 40), "variant"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v7;
    v21 = 1024;
    v22 = v4;
    _os_log_impl(&dword_1B71C0000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] needsPosterDerivedProminentColorDetermination: %{BOOL}u", buf, 0x12u);

  }
  v8 = *(void **)(a1 + 56);
  if (!*(_QWORD *)(a1 + 48) && v8 && v4)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_70;
    v11[3] = &unk_1E6B960C0;
    v12 = *(id *)(a1 + 80);
    v17 = *(id *)(a1 + 88);
    v9 = *(id *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 40);
    v13 = v9;
    v14 = v10;
    v15 = *(id *)(a1 + 64);
    v16 = *(id *)(a1 + 72);
    v18 = *(id *)(a1 + 96);
    objc_msgSend(v8, "pui_determineProminentColorWithCompletion:", v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }
}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_70(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  BSDispatchQueueAssertMain();
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_2_71;
  block[3] = &unk_1E6B96098;
  v10 = v3;
  v15 = *(id *)(a1 + 72);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v14 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 80);
  v8 = v3;
  dispatch_async(v4, block);

}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_2_71(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD block[5];

  if (a1[4])
  {
    (*(void (**)(void))(a1[10] + 16))();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 1248);
    if (!v3)
      v3 = a1[7];
    (*(void (**)(_QWORD, _QWORD, uint64_t, void *, _QWORD))(a1[9] + 16))(a1[9], a1[5], v3, v2, 0);

  }
  else
  {
    v4 = a1[9];
    v5 = *(_QWORD *)(a1[6] + 1248);
    if (!v5)
      v5 = a1[7];
    (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, a1[5], v5, a1[8], 0);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_3_72;
  block[3] = &unk_1E6B94728;
  block[4] = a1[6];
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_3_72(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateHomeVariantStyleState");
}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_4_77(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  PBUIMaterialCompositor *v12;
  PBUIWallpaperEffectConfiguration *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t Property;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;

  v36 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  BSDispatchQueueAssert();
  if (!v36 || v11)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v12 = objc_alloc_init(PBUIMaterialCompositor);
    -[PBUIMaterialCompositor setDownsampleFactor:](v12, "setDownsampleFactor:", 1.0);
    v13 = [PBUIWallpaperEffectConfiguration alloc];
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PBUIWallpaperEffectConfiguration initWithStyle:contentColor:userInterfaceStyle:](v13, 0x1EuLL, v14, objc_msgSend(v15, "userInterfaceStyle"));

    v17 = (void *)objc_msgSend(v10, "mutableCopy");
    v18 = v17;
    if (v17)
      v19 = v17;
    else
      v19 = (id)objc_opt_new();
    v20 = v19;

    objc_msgSend(v20, "objectForKey:", CFSTR("AppliedEffects"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");
    v23 = v22;
    if (v22)
      v24 = v22;
    else
      v24 = (id)objc_opt_new();
    v25 = v24;

    objc_msgSend(v25, "addObject:", CFSTR("HomeLegibilityBlur"));
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, CFSTR("AppliedEffects"));

    -[PBUIMaterialCompositor applyEffect:toImage:](v12, "applyEffect:toImage:", v16, v36);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      if ((objc_msgSend(v27, "pui_canDetermineProminentColor") & 1) == 0)
      {
        v28 = objc_retainAutorelease(v28);
        v29 = objc_msgSend(v28, "CGImage");
        Property = CGImageGetProperty();
        if (soft_PUIIOSurfaceUpdatePurgable(Property, 0))
        {
          v35 = objc_alloc(MEMORY[0x1E0CEA638]);
          objc_msgSend(v28, "scale");
          v32 = objc_msgSend(v35, "initWithCGImage:scale:orientation:", v29, objc_msgSend(v28, "imageOrientation"), v31);

          v28 = (id)v32;
        }
      }
    }
    v33 = *(_QWORD *)(a1 + 48);
    v34 = (void *)objc_msgSend(v20, "copy");
    (*(void (**)(uint64_t, id, _QWORD, void *, _QWORD))(v33 + 16))(v33, v28, 0, v34, 0);

  }
}

+ (int64_t)presentationModeForHomeConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;

  v3 = a3;
  switch(objc_msgSend(v3, "selectedAppearanceType"))
  {
    case 0:
      objc_msgSend(v3, "lockPosterAppearance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      objc_msgSend(v3, "solidColorAppearance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "effectiveColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_11;
      v7 = 3;
      break;
    case 2:
      objc_msgSend(v3, "gradientAppearance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        v7 = 4;
      else
        v7 = 1;
      break;
    case 3:
      objc_msgSend(v3, "homePosterAppearance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v9 = v4;
      v10 = objc_msgSend(v4, "isLegibilityBlurEnabled");

      if ((v10 & 1) == 0)
        goto LABEL_11;
      v7 = 2;
      break;
    default:
LABEL_11:
      v7 = 1;
      break;
  }

  return v7;
}

- (id)_fetchPosterPreferredProminentColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[PBUIPosterHomeViewController homeScreenConfiguration](self, "homeScreenConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(+[PBUIPosterHomeViewController presentationModeForHomeConfiguration:](PBUIPosterHomeViewController, "presentationModeForHomeConfiguration:", v3)- 3) > 1)
  {
    v8.receiver = self;
    v8.super_class = (Class)PBUIPosterHomeViewController;
    -[PBUIPosterVariantViewController _fetchPosterPreferredProminentColor](&v8, sel__fetchPosterPreferredProminentColor);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "solidColorAppearance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effectiveColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)updatePresentation
{
  void *v4;
  void (**v5)(_QWORD);
  int64_t v6;
  _BOOL4 v7;
  int64_t v8;
  UIView *v9;
  PBUIGradientView *gradientView;
  UIScenePresenter *presenter;
  UIScenePresentation *v12;
  UIScenePresentation *sceneView;
  UIScenePresentation *v14;
  UIScenePresentation *v15;
  PBUIEffectTrackingReplicaView *v16;
  PBUIWallpaperGradient *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIScenePresentation *v23;
  PBUIEffectTrackingReplicaView *v24;
  void *v25;
  void *v26;
  PBUIEffectTrackingReplicaView *v27;
  PBUIEffectTrackingReplicaView *v28;
  PBUIEffectTrackingReplicaView *effectView;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  -[PBUIPosterHomeViewController homeScreenConfiguration](self, "homeScreenConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __50__PBUIPosterHomeViewController_updatePresentation__block_invoke;
  v32[3] = &unk_1E6B94728;
  v32[4] = self;
  v5 = (void (**)(_QWORD))MEMORY[0x1BCCA5978](v32);
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_homeConfiguration, v4);
    v8 = +[PBUIPosterHomeViewController presentationModeForHomeConfiguration:](PBUIPosterHomeViewController, "presentationModeForHomeConfiguration:", v4);
    goto LABEL_6;
  }
  v6 = +[PBUIPosterHomeViewController presentationModeForHomeConfiguration:](PBUIPosterHomeViewController, "presentationModeForHomeConfiguration:", v4);
  if (self->_currentMode != v6)
  {
    v8 = v6;
LABEL_6:
    self->_currentMode = v8;
    v9 = self->super._contentContainer;
    if ((unint64_t)(v8 - 1) <= 1)
    {
      -[PBUIPosterHomeViewController setFixedAverageColor:](self, "setFixedAverageColor:", 0);
      -[PBUIGradientView removeFromSuperview](self->_gradientView, "removeFromSuperview");
      gradientView = self->_gradientView;
      self->_gradientView = 0;

      -[PBUIPosterHomeViewController setFixedAverageColor:](self, "setFixedAverageColor:", 0);
      presenter = self->super._presenter;
      if (self->super._scene)
      {
        if (!presenter)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("presenter is nil"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[PBUIPosterHomeViewController updatePresentation].cold.1(a2, (uint64_t)self, (uint64_t)v31);
          objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1B7207804);
        }
        -[UIScenePresenter activate](presenter, "activate");
        -[UIScenePresenter presentationView](self->super._presenter, "presentationView");
        v12 = (UIScenePresentation *)objc_claimAutoreleasedReturnValue();
        sceneView = self->super._sceneView;
        self->super._sceneView = v12;

        v14 = self->super._sceneView;
        -[UIView bounds](v9, "bounds");
        -[UIScenePresentation setFrame:](v14, "setFrame:");
        -[UIScenePresentation setAutoresizingMask:](self->super._sceneView, "setAutoresizingMask:", 18);
        -[BSUIOrientationTransformWrapperView addContentView:](self->_dynamicWrapperView, "addContentView:", self->super._sceneView);
      }
      else
      {
        -[UIScenePresenter deactivate](presenter, "deactivate");
        -[UIScenePresentation removeFromSuperview](self->super._sceneView, "removeFromSuperview");
        v23 = self->super._sceneView;
        self->super._sceneView = 0;

      }
      if (-[PBUIPosterHomeViewController showsSnapshotWhenIdleForMode:](self, "showsSnapshotWhenIdleForMode:", v8)
        || !self->super._scene)
      {
        if (self->_effectView)
        {
          -[UIView bringSubviewToFront:](v9, "bringSubviewToFront:");
        }
        else
        {
          v27 = [PBUIEffectTrackingReplicaView alloc];
          -[UIView bounds](v9, "bounds");
          v28 = -[PBUIEffectTrackingReplicaView initWithFrame:](v27, "initWithFrame:");
          effectView = self->_effectView;
          self->_effectView = v28;

          -[PBUIEffectTrackingReplicaView setReason:](self->_effectView, "setReason:", CFSTR("HomeVC blurs"));
          -[PBUIEffectTrackingReplicaView setRequiresSnapshotTreatment:](self->_effectView, "setRequiresSnapshotTreatment:", 0);
          -[PBUIEffectTrackingReplicaView setAutoresizingMask:](self->_effectView, "setAutoresizingMask:", 18);
          -[PBUIEffectTrackingReplicaView setDelegate:](self->_effectView, "setDelegate:", self);
          -[UIView addSubview:](v9, "addSubview:", self->_effectView);
        }
        -[PBUIPosterHomeViewController configureEffectViewForMode](self, "configureEffectViewForMode");
      }
      else
      {
        -[PBUIEffectTrackingReplicaView invalidate](self->_effectView, "invalidate");
        -[PBUIEffectTrackingReplicaView removeFromSuperview](self->_effectView, "removeFromSuperview");
        v24 = self->_effectView;
        self->_effectView = 0;

      }
      v5[2](v5);
      LOBYTE(v7) = 1;
LABEL_27:

      goto LABEL_28;
    }
    -[UIScenePresenter deactivate](self->super._presenter, "deactivate");
    -[UIScenePresentation removeFromSuperview](self->super._sceneView, "removeFromSuperview");
    v15 = self->super._sceneView;
    self->super._sceneView = 0;

    -[PBUIEffectTrackingReplicaView invalidate](self->_effectView, "invalidate");
    -[PBUIEffectTrackingReplicaView removeFromSuperview](self->_effectView, "removeFromSuperview");
    v16 = self->_effectView;
    self->_effectView = 0;

    v17 = objc_alloc_init(PBUIWallpaperGradient);
    if (v8 == 3)
    {
      objc_msgSend(v4, "solidColorAppearance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "effectiveColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "color");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v20;
      v33[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperGradient setColors:](v17, "setColors:", v26);

      -[PBUIPosterHomeViewController setFixedAverageColor:](self, "setFixedAverageColor:", v20);
    }
    else
    {
      if (v8 != 4)
      {
LABEL_21:
        v7 = -[PBUIPosterHomeViewController updateGradientViewWithGradient:](self, "updateGradientViewWithGradient:", v17);
        if (v7)
          v5[2](v5);

        goto LABEL_27;
      }
      objc_msgSend(v4, "gradientAppearance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "effectiveColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "color");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "gradientAppearance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "gradientColors");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[PBUIWallpaperGradient setColors:](v17, "setColors:", v22);
      -[PBUIPosterHomeViewController setFixedAverageColor:](self, "setFixedAverageColor:", v20);

    }
    goto LABEL_21;
  }
  v5[2](v5);
  LOBYTE(v7) = 0;
LABEL_28:

  return v7;
}

uint64_t __50__PBUIPosterHomeViewController_updatePresentation__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "updateHomeVariantStyleState");
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[154];
  objc_msgSend(v2, "weightingForEffectView");
  objc_msgSend(v3, "setEffectWeight:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "setShowsSnapshot:", objc_msgSend(*(id *)(a1 + 32), "canShowSnapshot"));
  return objc_msgSend(*(id *)(a1 + 32), "configureForZOrder");
}

- (void)setFixedAverageColor:(id)a3
{
  id v4;
  PUIColorStatistics *fixedColorStatistics;
  id v6;
  PUIColorStatistics *v7;
  PUIColorStatistics *v8;
  void *v9;
  id v10;

  v4 = a3;
  fixedColorStatistics = self->_fixedColorStatistics;
  v10 = v4;
  if (v4)
  {
    v6 = v4;
    if (!fixedColorStatistics)
    {
      v7 = (PUIColorStatistics *)objc_msgSend(objc_alloc((Class)getPUIColorStatisticsClass()), "initWithDelegate:", self);
      v8 = self->_fixedColorStatistics;
      self->_fixedColorStatistics = v7;

      v6 = v10;
      fixedColorStatistics = self->_fixedColorStatistics;
    }
    -[PUIColorStatistics resetWithColor:](fixedColorStatistics, "resetWithColor:", v6);
  }
  else
  {
    self->_fixedColorStatistics = 0;

    if (fixedColorStatistics)
    {
      -[PBUIPosterHomeViewController contentColorStatistics](self, "contentColorStatistics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIPosterVariantViewController colorStatisticsDidChange:](self, "colorStatisticsDidChange:", v9);

    }
  }

}

- (BOOL)updateGradientViewWithGradient:(id)a3
{
  id v4;
  PBUIGradientView *gradientView;
  PBUIGradientView *v6;
  PBUIGradientView *v7;
  PBUIGradientView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  gradientView = self->_gradientView;
  if (!gradientView)
  {
    v6 = [PBUIGradientView alloc];
    -[UIView bounds](self->super._contentContainer, "bounds");
    v7 = -[PBUIGradientView initWithFrame:](v6, "initWithFrame:");
    v8 = self->_gradientView;
    self->_gradientView = v7;

    -[PBUIGradientView setAutoresizingMask:](self->_gradientView, "setAutoresizingMask:", 18);
    -[BSUIOrientationTransformWrapperView addContentView:](self->_dynamicWrapperView, "addContentView:", self->_gradientView);
    -[PBUIPosterVariantViewController counterpart](self, "counterpart");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIPosterHomeViewController _updateRotationForOrientation:](self, "_updateRotationForOrientation:", objc_msgSend(v11, "pui_deviceOrientation"));

    gradientView = self->_gradientView;
  }
  -[PBUIGradientView gradient](gradientView, "gradient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = BSEqualObjects() ^ 1;

  -[PBUIGradientView setGradient:](self->_gradientView, "setGradient:", v4);
  return v13;
}

- (void)validateSnapshottingPreconditionsForSettings:(id)a3 result:(id)a4
{
  id v6;
  int64_t currentMode;
  void *v8;
  PBUIGradientView *gradientView;
  void *v10;
  unint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  BOOL v17;
  BOOL v18;
  void *v19;
  void *v20;
  int v21;
  id v22;

  v22 = a3;
  v6 = a4;
  currentMode = self->_currentMode;
  if ((unint64_t)(currentMode - 3) <= 1)
  {
    -[PBUIPosterHomeViewController viewIfLoaded](self, "viewIfLoaded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      objc_msgSend(v6, "appendPreconditionResultFailureWithFormat:", CFSTR("poster scene view has not been created"));
    if (objc_msgSend(v8, "isHidden"))
      objc_msgSend(v6, "appendPreconditionResultFailureWithFormat:", CFSTR("poster scene view is hidden"));
    gradientView = self->_gradientView;
    if (!gradientView)
    {
      objc_msgSend(v6, "appendPreconditionResultFailureWithFormat:", CFSTR("poster scene view's gradient view has not been created"));
      gradientView = self->_gradientView;
    }
    if (-[PBUIGradientView isHidden](gradientView, "isHidden"))
      objc_msgSend(v6, "appendPreconditionResultFailureWithFormat:", CFSTR("poster scene view's gradient view is hidden"));
    -[PBUIGradientView superview](self->_gradientView, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      objc_msgSend(v6, "appendPreconditionResultFailureWithFormat:", CFSTR("poster scene view's gradient view has not been added to a superview"));

  }
  v11 = currentMode - 5;
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "deviceClass");

  if (v13 != 2
    && objc_msgSend(v22, "pr_adjustedLuminance") != 2
    && (objc_msgSend(v6, "isSnapshottingForExternalDisplayHostedWallpaper") & 1) == 0)
  {
    v14 = objc_msgSend(v22, "pr_adjustedLuminance");
    MEMORY[0x1BCCA4FB8](0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendPreconditionResultFailureWithFormat:", CFSTR("screen is off; Backlight mode: %lu; isPad: %@"),
      v14,
      v15);

  }
  v16 = -[PBUIPosterHomeViewController reflectsLock](self, "reflectsLock");
  v17 = -[PBUIPosterHomeViewController isSettledPosition](self, "isSettledPosition");
  v18 = v11 > 0xFFFFFFFFFFFFFFFDLL || !v16;
  if (!v18 && !v17)
    objc_msgSend(v6, "appendPreconditionResultFailure:", CFSTR("poster is not in settled position"));
  -[PBUIPosterVariantViewController _externalDisplayConfiguration](self, "_externalDisplayConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "externalDisplayConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = BSEqualObjects();

  if (v21 && self->_isUpdatingOrientation)
    objc_msgSend(v6, "appendPreconditionResultFailure:", CFSTR("poster is updating orientation"));

}

- (void)applyFauxExternalSceneSettings:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterHomeViewController;
  v3 = a3;
  -[PBUIPosterVariantViewController applyFauxExternalSceneSettings:](&v4, sel_applyFauxExternalSceneSettings_, v3);
  objc_msgSend(v3, "pr_setUnlockProgress:", 1.0, v4.receiver, v4.super_class);

}

- (void)setCounterpart:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterHomeViewController;
  -[PBUIPosterVariantViewController setCounterpart:](&v4, sel_setCounterpart_, a3);
  -[PBUIPosterHomeViewController updatePresentation](self, "updatePresentation");
  -[PBUIPosterHomeViewController configureForZOrder](self, "configureForZOrder");
}

- (void)updateViewControllerVisibilityForUnlockProgress:(double)a3
{
  -[PBUIPosterHomeViewController _updateDimHomeScreenWallpaperViewForUnlockProgress:animated:](self, "_updateDimHomeScreenWallpaperViewForUnlockProgress:animated:", 0, a3);
}

- (id)acquireDuckHomeScreenWallpaperDimAssertionWithReason:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *duckHomeScreenWallpaperDimAssertions;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_duckHomeScreenWallpaperDimAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    duckHomeScreenWallpaperDimAssertions = self->_duckHomeScreenWallpaperDimAssertions;
    self->_duckHomeScreenWallpaperDimAssertions = v5;

  }
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0D01868]);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __85__PBUIPosterHomeViewController_acquireDuckHomeScreenWallpaperDimAssertionWithReason___block_invoke;
  v13 = &unk_1E6B95898;
  objc_copyWeak(&v14, &location);
  v8 = (void *)objc_msgSend(v7, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("duck_home_screen_wallpaper_dimming"), v4, &v10);
  -[NSHashTable addObject:](self->_duckHomeScreenWallpaperDimAssertions, "addObject:", v8, v10, v11, v12, v13);
  -[PBUIPosterHomeViewController _updateEnableHomeScreenWallpaperDimming](self, "_updateEnableHomeScreenWallpaperDimming");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __85__PBUIPosterHomeViewController_acquireDuckHomeScreenWallpaperDimAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __85__PBUIPosterHomeViewController_acquireDuckHomeScreenWallpaperDimAssertionWithReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_duckHomeScreenWallpaperDimAssertionDidInvalidate:", *(_QWORD *)(a1 + 32));

}

- (BOOL)isHomeScreenWallpaperDimmed
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PBUIPosterVariantViewController lockScreenConfiguration](self, "lockScreenConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pr_loadHomeScreenConfigurationWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customizationConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDimmed");

  return v5;
}

- (BOOL)_shouldHomeScreenWallpaperBeDimmed
{
  BOOL v3;

  v3 = -[PBUIPosterHomeViewController isHomeScreenWallpaperDimmed](self, "isHomeScreenWallpaperDimmed");
  return !-[NSHashTable count](self->_duckHomeScreenWallpaperDimAssertions, "count") && v3;
}

- (void)_updateEnableHomeScreenWallpaperDimming
{
  int isHomeScreenWallpaperCurrentlyDimmed;
  int v4;
  double v5;

  isHomeScreenWallpaperCurrentlyDimmed = self->_isHomeScreenWallpaperCurrentlyDimmed;
  v4 = -[PBUIPosterHomeViewController _shouldHomeScreenWallpaperBeDimmed](self, "_shouldHomeScreenWallpaperBeDimmed");
  if (isHomeScreenWallpaperCurrentlyDimmed != v4)
  {
    self->_isHomeScreenWallpaperCurrentlyDimmed = v4;
    -[PBUIPosterHomeViewController unlockProgress](self, "unlockProgress");
    -[PBUIPosterHomeViewController _updateDimHomeScreenWallpaperViewForUnlockProgress:animated:](self, "_updateDimHomeScreenWallpaperViewForUnlockProgress:animated:", -[PBUIPosterHomeViewController isSettledPosition](self, "isSettledPosition"), v5);
  }
}

- (void)_duckHomeScreenWallpaperDimAssertionDidInvalidate:(id)a3
{
  NSHashTable *duckHomeScreenWallpaperDimAssertions;

  -[NSHashTable removeObject:](self->_duckHomeScreenWallpaperDimAssertions, "removeObject:", a3);
  if (!-[NSHashTable count](self->_duckHomeScreenWallpaperDimAssertions, "count"))
  {
    duckHomeScreenWallpaperDimAssertions = self->_duckHomeScreenWallpaperDimAssertions;
    self->_duckHomeScreenWallpaperDimAssertions = 0;

  }
  -[PBUIPosterHomeViewController _updateEnableHomeScreenWallpaperDimming](self, "_updateEnableHomeScreenWallpaperDimming");
}

- (void)_updateDimHomeScreenWallpaperViewForUnlockProgress:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a4;
  v6 = a3 * 0.4 + 0.0;
  if (self->_isHomeScreenWallpaperCurrentlyDimmed)
    v7 = v6;
  else
    v7 = 0.0;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", !v4);
  -[UIView layer](self->_dimView, "layer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "animationForKey:", CFSTR("DIM_ANIMATION"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v16, "removeAnimationForKey:", CFSTR("DIM_ANIMATION"));
  if (v4)
  {
    objc_msgSend(v16, "presentationLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "opacity");
    v12 = v11;

    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDuration:", 0.3388);
    objc_msgSend(v13, "setMass:", 1.0);
    objc_msgSend(v13, "setStiffness:", 343.985);
    objc_msgSend(v13, "setDamping:", 37.0937);
    objc_msgSend(v13, "setInitialVelocity:", 0.0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFromValue:", v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setToValue:", v15);

    objc_msgSend(v13, "setRemovedOnCompletion:", 0);
    objc_msgSend(v13, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    objc_msgSend(v16, "addAnimation:forKey:", v13, CFSTR("DIM_ANIMATION"));

  }
  else
  {
    *(float *)&v9 = v7;
    objc_msgSend(v16, "setOpacity:", v9);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (void)noteHomeVariantStyleStateMayHaveUpdated
{
  BSDispatchQueueAssertMain();
  -[PBUIPosterHomeViewController _updateEnableHomeScreenWallpaperDimming](self, "_updateEnableHomeScreenWallpaperDimming");
  -[PBUIPosterHomeViewController updateHomeVariantStyleState](self, "updateHomeVariantStyleState");
}

- (BOOL)updateHomeVariantStyleState
{
  PBUIHomeVariantStyleState **p_currentHomeVariantStyleState;
  PBUIHomeVariantStyleState *v4;
  void *v5;
  BOOL v6;

  p_currentHomeVariantStyleState = &self->_currentHomeVariantStyleState;
  v4 = self->_currentHomeVariantStyleState;
  -[PBUIPosterHomeViewController _fetchStyleState](self, "_fetchStyleState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PBUIHomeVariantStyleState isEqualToState:](v4, "isEqualToState:", v5);
  if (!v6)
    objc_storeStrong((id *)p_currentHomeVariantStyleState, v5);

  return !v6;
}

- (id)_fetchStyleState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[PBUIPosterHomeViewController homeScreenConfiguration](self, "homeScreenConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBUIHomeVariantStyleStateFromPRPosterHomeScreenConfiguration(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestedTintColor");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
  }
  else
  {
    -[PBUIPosterVariantViewController _posterPreferredProminentColor:](self, "_posterPreferredProminentColor:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "styleStateByUpdatingSuggestedTintColor:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }

  return v4;
}

- (void)effectTrackingReplicaViewHasValidSnapshot:(id)a3
{
  -[PBUIEffectTrackingReplicaView setShowsSnapshot:](self->_effectView, "setShowsSnapshot:", -[PBUIPosterHomeViewController canShowSnapshot](self, "canShowSnapshot", a3));
}

- (void)configureEffectViewForMode
{
  BOOL v3;
  PBUIEffectTrackingReplicaView *effectView;
  void *v5;
  PBUIEffectTrackingReplicaView *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;

  v3 = -[PBUIPosterHomeViewController reflectsLock](self, "reflectsLock");
  effectView = self->_effectView;
  -[PBUIPosterVariantViewController snapshotSourceProvider](self, "snapshotSourceProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIEffectTrackingReplicaView setSnapshotProvider:](effectView, "setSnapshotProvider:", v5);

  v6 = self->_effectView;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._counterpart);
    objc_msgSend(WeakRetained, "portalSourceProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIEffectTrackingReplicaView setPortalProvider:](v6, "setPortalProvider:", v8);

  }
  else
  {
    -[PBUIEffectTrackingReplicaView setPortalProvider:](self->_effectView, "setPortalProvider:", 0);
  }
  if (-[PBUIPosterHomeViewController isBlurred](self, "isBlurred"))
    v9 = 30;
  else
    v9 = 0;
  -[PBUIEffectTrackingReplicaView requestStyle:](self->_effectView, "requestStyle:", v9);
  -[PBUIPosterHomeViewController configureForZOrder](self, "configureForZOrder");
}

- (BOOL)isSettledPosition
{
  int IsOne;

  if (!-[PBUIPosterHomeViewController reflectsLock](self, "reflectsLock")
    || (-[PBUIPosterHomeViewController unlockProgress](self, "unlockProgress"), (IsOne = BSFloatIsOne()) != 0))
  {
    LOBYTE(IsOne) = !self->_isUpdatingOrientation;
  }
  return IsOne;
}

- (double)weightingForEffectView
{
  _BOOL4 v3;
  double result;
  double v5;

  v3 = -[PBUIPosterHomeViewController isBlurred](self, "isBlurred");
  result = 1.0;
  if (v3)
  {
    -[PBUIPosterHomeViewController unlockProgress](self, "unlockProgress", 1.0);
    return fmin(fmax((v5 + -0.2) / 0.8 + 0.0, 0.0), 1.0);
  }
  return result;
}

- (double)unlockProgress
{
  id WeakRetained;
  void *v4;
  void *v5;
  double v6;
  double v7;

  if (!-[PBUIPosterHomeViewController reflectsLock](self, "reflectsLock"))
    return 1.0;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._counterpart);
  objc_msgSend(WeakRetained, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pr_unlockProgress");
  v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHomeVariantStyleState, 0);
  objc_storeStrong((id *)&self->_duckHomeScreenWallpaperDimAssertions, 0);
  objc_storeStrong((id *)&self->_dimView, 0);
  objc_storeStrong((id *)&self->_dynamicWrapperView, 0);
  objc_storeStrong((id *)&self->_wallpaperCaptureView, 0);
  objc_storeStrong((id *)&self->_fixedColorStatistics, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_homeConfiguration, 0);
}

- (void)homeScreenConfiguration
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B71C0000, a2, OS_LOG_TYPE_ERROR, "Unable to load home screen configuration: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)updatePresentation
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
  v15 = CFSTR("PBUIPosterHomeViewController.m");
  v16 = 1024;
  v17 = 459;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1B71C0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
