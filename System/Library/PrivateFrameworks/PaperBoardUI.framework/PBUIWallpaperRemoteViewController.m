@implementation PBUIWallpaperRemoteViewController

- (PBUIWallpaperRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PBUIWallpaperRemoteViewController *v4;
  uint64_t v5;
  NSMutableSet *stateCaptureHandles;
  uint64_t v7;
  NSHashTable *lockscreenObservers;
  uint64_t v9;
  NSHashTable *homescreenObservers;
  uint64_t v11;
  NSHashTable *lockscreenBlurViews;
  uint64_t v13;
  NSHashTable *homescreenBlurViews;
  PBUIDefaultSessionReconnectPolicy *v15;
  PBUISessionReconnectPolicy *reconnectPolicy;
  NSMutableSet *v17;
  NSMutableSet *disallowRasterizationReasonsHomeVariant;
  NSMutableSet *v19;
  NSMutableSet *disallowRasterizationReasonsLockVariant;
  NSMutableSet *v21;
  NSMutableSet *hideWallpaperReasonsHomeVariant;
  NSMutableSet *v23;
  NSMutableSet *hideWallpaperReasonsLockVariant;
  NSMutableSet *v25;
  NSMutableSet *wallpaperAnimationSuspendedReasons;
  NSMutableSet *v27;
  NSMutableSet *wallpaperRequiredReasons;
  NSMutableSet *v29;
  NSMutableSet *homescreenChangesDelayedReasons;
  uint64_t v31;
  NSHashTable *wallpaperScaleAssertions;
  uint64_t v33;
  NSMutableSet *externalSceneModeAssertionActions;
  id v35;
  objc_class *v36;
  void *v37;
  uint64_t v38;
  BSEventQueue *eventQueue;
  PBUIRemoteIrisWallpaperPlayer *v40;
  PBUIRemoteIrisWallpaperPlayer *remoteIrisWallpaperPlayer;
  uint64_t v42;
  NSMutableSet *pendingEffectViewImageSlots;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)PBUIWallpaperRemoteViewController;
  v4 = -[PBUIWallpaperRemoteViewController initWithNibName:bundle:](&v45, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    stateCaptureHandles = v4->_stateCaptureHandles;
    v4->_stateCaptureHandles = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    lockscreenObservers = v4->_lockscreenObservers;
    v4->_lockscreenObservers = (NSHashTable *)v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    homescreenObservers = v4->_homescreenObservers;
    v4->_homescreenObservers = (NSHashTable *)v9;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    lockscreenBlurViews = v4->_lockscreenBlurViews;
    v4->_lockscreenBlurViews = (NSHashTable *)v11;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    homescreenBlurViews = v4->_homescreenBlurViews;
    v4->_homescreenBlurViews = (NSHashTable *)v13;

    v15 = objc_alloc_init(PBUIDefaultSessionReconnectPolicy);
    reconnectPolicy = v4->_reconnectPolicy;
    v4->_reconnectPolicy = (PBUISessionReconnectPolicy *)v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    disallowRasterizationReasonsHomeVariant = v4->_disallowRasterizationReasonsHomeVariant;
    v4->_disallowRasterizationReasonsHomeVariant = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    disallowRasterizationReasonsLockVariant = v4->_disallowRasterizationReasonsLockVariant;
    v4->_disallowRasterizationReasonsLockVariant = v19;

    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    hideWallpaperReasonsHomeVariant = v4->_hideWallpaperReasonsHomeVariant;
    v4->_hideWallpaperReasonsHomeVariant = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    hideWallpaperReasonsLockVariant = v4->_hideWallpaperReasonsLockVariant;
    v4->_hideWallpaperReasonsLockVariant = v23;

    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    wallpaperAnimationSuspendedReasons = v4->_wallpaperAnimationSuspendedReasons;
    v4->_wallpaperAnimationSuspendedReasons = v25;

    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    wallpaperRequiredReasons = v4->_wallpaperRequiredReasons;
    v4->_wallpaperRequiredReasons = v27;

    v29 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    homescreenChangesDelayedReasons = v4->_homescreenChangesDelayedReasons;
    v4->_homescreenChangesDelayedReasons = v29;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v31 = objc_claimAutoreleasedReturnValue();
    wallpaperScaleAssertions = v4->_wallpaperScaleAssertions;
    v4->_wallpaperScaleAssertions = (NSHashTable *)v31;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v33 = objc_claimAutoreleasedReturnValue();
    externalSceneModeAssertionActions = v4->_externalSceneModeAssertionActions;
    v4->_externalSceneModeAssertionActions = (NSMutableSet *)v33;

    v35 = objc_alloc(MEMORY[0x1E0D01770]);
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v35, "initWithName:onQueue:", v37, MEMORY[0x1E0C80D38]);
    eventQueue = v4->_eventQueue;
    v4->_eventQueue = (BSEventQueue *)v38;

    v40 = objc_alloc_init(PBUIRemoteIrisWallpaperPlayer);
    remoteIrisWallpaperPlayer = v4->_remoteIrisWallpaperPlayer;
    v4->_remoteIrisWallpaperPlayer = v40;

    -[PBUIRemoteIrisWallpaperPlayer setDelegate:](v4->_remoteIrisWallpaperPlayer, "setDelegate:", v4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v42 = objc_claimAutoreleasedReturnValue();
    pendingEffectViewImageSlots = v4->_pendingEffectViewImageSlots;
    v4->_pendingEffectViewImageSlots = (NSMutableSet *)v42;

    -[PBUIWallpaperRemoteViewController _addStateCaptureHandlers](v4, "_addStateCaptureHandlers");
  }
  return v4;
}

- (void)dealloc
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_stateCaptureHandles;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)PBUIWallpaperRemoteViewController;
  -[PBUIWallpaperRemoteViewController dealloc](&v8, sel_dealloc);
}

- (void)setCachingIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *cachingIdentifier;
  _QWORD v7[5];

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", self->_cachingIdentifier) & 1) == 0)
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    cachingIdentifier = self->_cachingIdentifier;
    self->_cachingIdentifier = v5;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__PBUIWallpaperRemoteViewController_setCachingIdentifier___block_invoke;
    v7[3] = &unk_1E6B95198;
    v7[4] = self;
    -[PBUIWallpaperRemoteViewController _updateWallpaperSceneSettingsWithBlock:](self, "_updateWallpaperSceneSettingsWithBlock:", v7);
  }

}

uint64_t __58__PBUIWallpaperRemoteViewController_setCachingIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCachingIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176));
}

- (void)setWallpaperConfigurationManager:(id)a3
{
  PBUIWallpaperConfigurationManager *v5;
  PBUIWallpaperConfigurationManager *wallpaperConfigurationManager;
  PBUIWallpaperConfigurationManager *v7;

  v5 = (PBUIWallpaperConfigurationManager *)a3;
  wallpaperConfigurationManager = self->_wallpaperConfigurationManager;
  if (wallpaperConfigurationManager != v5)
  {
    v7 = v5;
    -[PBUIWallpaperConfigurationManager setDelegate:](wallpaperConfigurationManager, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_wallpaperConfigurationManager, a3);
    -[PBUIWallpaperConfigurationManager setDelegate:](self->_wallpaperConfigurationManager, "setDelegate:", self);
    v5 = v7;
  }

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperRemoteViewController;
  -[PBUIWallpaperRemoteViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PBUIWallpaperRemoteViewController _setupScene](self, "_setupScene");
}

- (void)viewWillAppear:(BOOL)a3
{
  BSInvalidatable *v4;
  BSInvalidatable *sceneModeAssertionForViewAppeared;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBUIWallpaperRemoteViewController;
  -[PBUIWallpaperRemoteViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (!self->_sceneModeAssertionForViewAppeared)
  {
    -[PBUIWallpaperRemoteViewController _acquireSceneModeAssertionForReason:sceneMode:](self, "_acquireSceneModeAssertionForReason:sceneMode:", CFSTR("View Appeared"), 3);
    v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    sceneModeAssertionForViewAppeared = self->_sceneModeAssertionForViewAppeared;
    self->_sceneModeAssertionForViewAppeared = v4;

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BSInvalidatable *sceneModeAssertionForViewAppeared;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBUIWallpaperRemoteViewController;
  -[PBUIWallpaperRemoteViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[BSInvalidatable invalidate](self->_sceneModeAssertionForViewAppeared, "invalidate");
  sceneModeAssertionForViewAppeared = self->_sceneModeAssertionForViewAppeared;
  self->_sceneModeAssertionForViewAppeared = 0;

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  objc_super v13;

  height = a3.height;
  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)PBUIWallpaperRemoteViewController;
  v7 = a4;
  -[PBUIWallpaperRemoteViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[PBUIWallpaperRemoteViewController view](self, "view", v13.receiver, v13.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_toWindowOrientation");
  objc_msgSend(v7, "transitionDuration");
  v12 = v11;

  -[PBUIWallpaperRemoteViewController noteWillAnimateToInterfaceOrientation:duration:](self, "noteWillAnimateToInterfaceOrientation:duration:", v10, v12);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[6];
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PBUIWallpaperRemoteViewController;
  v4 = a3;
  -[PBUIWallpaperRemoteViewController traitCollectionDidChange:](&v15, sel_traitCollectionDidChange_, v4);
  -[PBUIWallpaperRemoteViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);
  v7 = objc_msgSend(v4, "_backlightLuminance");

  v8 = objc_msgSend(v5, "_backlightLuminance");
  if (v6 || (v7 != 1) == (v8 == 1))
  {
    v9 = objc_msgSend(v5, "userInterfaceStyle");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__PBUIWallpaperRemoteViewController_traitCollectionDidChange___block_invoke;
    v14[3] = &unk_1E6B951E0;
    v14[4] = self;
    v14[5] = v9;
    -[PBUIWallpaperRemoteViewController _performWithLiveScene:](self, "_performWithLiveScene:", v14);
    v10 = v9 == 1;
    if (v9 == 2)
      v10 = 2;
    if (v8 == 1)
      v11 = 3;
    else
      v11 = v10;
    PBUILogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      PBUIStringForWallpaperMode(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl(&dword_1B71C0000, v12, OS_LOG_TYPE_DEFAULT, "Setting wallpaper mode to %@", buf, 0xCu);

    }
    if (v11)
      -[PBUIWallpaperConfigurationManager setWallpaperMode:](self->_wallpaperConfigurationManager, "setWallpaperMode:", v11);
  }

}

uint64_t __62__PBUIWallpaperRemoteViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__PBUIWallpaperRemoteViewController_traitCollectionDidChange___block_invoke_2;
  v3[3] = &__block_descriptor_40_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "_updateWallpaperSceneSettingsWithBlock:", v3);
}

uint64_t __62__PBUIWallpaperRemoteViewController_traitCollectionDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserInterfaceStyle:", *(_QWORD *)(a1 + 32));
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewWillLayoutSubviews
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
  UIScenePresentation *scenePresentationView;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PBUIWallpaperRemoteViewController;
  -[PBUIWallpaperRemoteViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[PBUIWallpaperRemoteViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIScenePresentation setBounds:](self->_scenePresentationView, "setBounds:", v5, v7, v9, v11);
  scenePresentationView = self->_scenePresentationView;
  UIRectGetCenter();
  -[UIScenePresentation setCenter:](scenePresentationView, "setCenter:");
}

- (void)wallpaperConfigurationManager:(id)a3 didChangeWallpaperConfigurationForVariants:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  _QWORD v8[6];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperLocations(a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1B71C0000, v6, OS_LOG_TYPE_DEFAULT, "Wallpaper did change for variants: %{public}@", buf, 0xCu);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke;
  v8[3] = &unk_1E6B951E0;
  v8[4] = self;
  v8[5] = a4;
  -[PBUIWallpaperRemoteViewController _performWithLiveScene:](self, "_performWithLiveScene:", v8);
}

void __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke(uint64_t a1)
{
  dispatch_group_t v2;
  void *v3;
  PBUIWallpaperUpdateLocationsAction *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  PBUIWallpaperUpdateLocationsAction *v10;
  PBUIWallpaperUpdateAndPrewarmAction *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  PBUIWallpaperUpdateAndPrewarmAction *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  id v22;
  uint8_t buf[8];
  _QWORD v24[4];
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v2 = dispatch_group_create();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = [PBUIWallpaperUpdateLocationsAction alloc];
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)MEMORY[0x1E0D016A0];
  v7 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke_2;
  v26[3] = &unk_1E6B95208;
  v8 = v2;
  v27 = v8;
  objc_msgSend(v6, "responderWithHandler:", v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PBUIWallpaperUpdateLocationsAction initWithLocations:wallpaperMode:responder:](v4, "initWithLocations:wallpaperMode:responder:", v5, 0, v9);
  v28[0] = v10;
  v11 = [PBUIWallpaperUpdateAndPrewarmAction alloc];
  v12 = (void *)MEMORY[0x1E0D016A0];
  v24[0] = v7;
  v24[1] = 3221225472;
  v24[2] = __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke_3;
  v24[3] = &unk_1E6B95208;
  v13 = v8;
  v25 = v13;
  objc_msgSend(v12, "responderWithHandler:", v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PBUIWallpaperUpdateAndPrewarmAction initWithResponder:](v11, "initWithResponder:", v14);
  v28[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "count"))
  {
    v18 = 0;
    do
    {
      dispatch_group_enter(v13);
      ++v18;
    }
    while (v18 < objc_msgSend(v17, "count"));
  }
  PBUILogCommon();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B71C0000, v19, OS_LOG_TYPE_DEFAULT, "Acquiring foreground support scene mode assertion for wallpaper change", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_acquireSceneModeAssertionForReason:sceneMode:", CFSTR("DidChangeWallpaperConfiguration"), 2);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke_33;
  block[3] = &unk_1E6B94728;
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v22;
  dispatch_group_notify(v13, MEMORY[0x1E0C80D38], block);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "sendActions:", v17);

}

void __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __110__PBUIWallpaperRemoteViewController_wallpaperConfigurationManager_didChangeWallpaperConfigurationForVariants___block_invoke_33(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PBUILogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B71C0000, v2, OS_LOG_TYPE_DEFAULT, "Releasing foreground support scene mode assertion for wallpaper change", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_registerFakeBlurView:(id)a3
{
  uint64_t v4;
  int *v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "variant");
  if (!v4)
  {
    v5 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__lockscreenBlurViews;
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__homescreenBlurViews;
LABEL_5:
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v5), "addObject:", v6);
  }

}

- (void)_unregisterFakeBlurView:(id)a3
{
  NSHashTable *lockscreenBlurViews;
  id v5;

  lockscreenBlurViews = self->_lockscreenBlurViews;
  v5 = a3;
  -[NSHashTable removeObject:](lockscreenBlurViews, "removeObject:", v5);
  -[NSHashTable removeObject:](self->_homescreenBlurViews, "removeObject:", v5);

}

- (id)newImageProviderView
{
  return objc_alloc_init(PBUIImageSlotView);
}

- (BOOL)updateImageProviderView:(id)a3 withImage:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  BOOL v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  v8 = v5;
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

  v15 = 0;
  if (v10 && v14)
  {
    objc_msgSend(v10, "imageSlot");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v14 != v16;
    if (v14 != v16)
      objc_msgSend(v10, "setImageSlot:", v14);

  }
  return v15;
}

- (id)imageForWallpaperStyle:(int64_t *)a3 variant:(int64_t)a4 traitCollection:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id *v14;
  id v15;
  id v16;
  NSObject *v17;
  PBUIImageSlot *v18;
  PBUIImageSlot *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  PBUIWallpaperImageSlotRequestAction *v25;
  id v26;
  uint64_t v27;
  id v28;
  PBUIWallpaperImageSlotRequestAction *v29;
  PBUIDeferredImageSlot *v30;
  void *v31;
  id v32;
  PBUIWallpaperImageSlotRequestAction *v33;
  int64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  PBUIWallpaperRemoteViewController *v39;
  PBUIWallpaperImageSlotRequestAction *v40;
  PBUIImageSlot *v41;
  id v42;
  int64_t v43;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v35 = *a3;
  PBUILogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    PBUIWallpaperStyleDescription(*a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperVariant(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _UIUserInterfaceStyleDescription(objc_msgSend(v8, "userInterfaceStyle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v49 = v10;
    v50 = 2114;
    v51 = v11;
    v52 = 2114;
    v53 = v12;
    _os_log_impl(&dword_1B71C0000, v9, OS_LOG_TYPE_DEFAULT, "Fetching image for wallpaper style:%{public}@ variant:%{public}@ traitCollection.userInterfaceStyle:%{public}@", buf, 0x20u);

  }
  -[PBUIWallpaperRemoteViewController _cachedBlurAssetForVariant:requestedStyle:traitCollection:](self, "_cachedBlurAssetForVariant:requestedStyle:traitCollection:", a4, v35, v8);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (id *)v13;
  if (v13)
  {
    *a3 = *(_QWORD *)(v13 + 8);
    v15 = *(id *)(v13 + 16);
    v16 = v14[3];
    if (v16)
    {
      PBUILogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v49 = v16;
        _os_log_impl(&dword_1B71C0000, v17, OS_LOG_TYPE_DEFAULT, "Satisfied image request from cache with image %{public}@", buf, 0xCu);
      }

      v18 = -[PBUIImageSlot initWithImage:lifetimeToken:]([PBUIImageSlot alloc], "initWithImage:lifetimeToken:", v16, 0);
      goto LABEL_17;
    }
    if (v15)
    {
      v19 = [PBUIImageSlot alloc];
      -[PBUIWallpaperRemoteViewController _blurImageFromURL:](self, "_blurImageFromURL:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PBUIImageSlot initWithImage:lifetimeToken:](v19, "initWithImage:lifetimeToken:", v20, 0);

      PBUILogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v22)
        {
          *(_DWORD *)buf = 138543362;
          v49 = v15;
          _os_log_impl(&dword_1B71C0000, v21, OS_LOG_TYPE_DEFAULT, "Satisfied image request from cache with image URL %{public}@", buf, 0xCu);
        }

LABEL_17:
        if (v18)
          goto LABEL_20;
        goto LABEL_18;
      }
      if (v22)
      {
        *(_DWORD *)buf = 138543362;
        v49 = v15;
        _os_log_impl(&dword_1B71C0000, v21, OS_LOG_TYPE_DEFAULT, "Received cached image URL %{public}@ but could not load image.", buf, 0xCu);
      }

    }
    v18 = 0;
    goto LABEL_17;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", v35);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet addObject:](self->_pendingEffectViewImageSlots, "addObject:", v24);
  objc_initWeak((id *)buf, self);
  v25 = [PBUIWallpaperImageSlotRequestAction alloc];
  v26 = MEMORY[0x1E0C80D38];
  v27 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke;
  v45[3] = &unk_1E6B95230;
  objc_copyWeak(&v47, (id *)buf);
  v28 = v24;
  v46 = v28;
  v29 = -[PBUIWallpaperImageSlotRequestAction initWithVariant:desiredStyle:traitCollection:slotIdentifier:forResponseOnQueue:withHandler:](v25, "initWithVariant:desiredStyle:traitCollection:slotIdentifier:forResponseOnQueue:withHandler:", a4, v36, v8, v28, MEMORY[0x1E0C80D38], v45);

  v30 = -[PBUIDeferredImageSlot initWithLifetimeToken:]([PBUIDeferredImageSlot alloc], "initWithLifetimeToken:", v29);
  -[PBUIWallpaperRemoteViewController averageColorForVariant:](self, "averageColorForVariant:", a4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIDeferredImageSlot setFallbackColor:](v30, "setFallbackColor:", v31);

  v37[0] = v27;
  v37[1] = 3221225472;
  v37[2] = __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_43;
  v37[3] = &unk_1E6B952A8;
  v32 = v28;
  v38 = v32;
  v39 = self;
  v33 = v29;
  v40 = v33;
  v18 = v30;
  v41 = v18;
  v43 = a4;
  v44 = v36;
  v42 = v8;
  -[PBUIWallpaperRemoteViewController _performWithLiveScene:](self, "_performWithLiveScene:", v37);

  objc_destroyWeak(&v47);
  objc_destroyWeak((id *)buf);

  if (!v18)
    self->_missingEffectViewImages = 1;
LABEL_20:

  return v18;
}

void __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  const __CFString *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  PBUILogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = objc_msgSend(WeakRetained[143], "containsObject:", v4);
    v6 = CFSTR("fulfilled");
    if (v5)
      v6 = CFSTR("unfulfilled");
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1B71C0000, v3, OS_LOG_TYPE_DEFAULT, "Image slot invalidated: %{public}@ (%{public}@)", (uint8_t *)&v7, 0x16u);
  }

}

void __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_43(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PBUIWallpaperEffectImageRequestAction *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  PBUIWallpaperEffectImageRequestAction *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v27 = v3;
    _os_log_impl(&dword_1B71C0000, v2, OS_LOG_TYPE_DEFAULT, "Acquiring foreground scene mode assertion for image request %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_acquireSceneModeAssertionForReason:sceneMode:", CFSTR("ImageForWallpaperStyle"), 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PBUILogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v27 = v6;
    _os_log_impl(&dword_1B71C0000, v5, OS_LOG_TYPE_DEFAULT, "Sending image slot request action for image slot request %{public}@", buf, 0xCu);
  }

  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 968);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendActions:", v8);

  v9 = [PBUIWallpaperEffectImageRequestAction alloc];
  v10 = *(void **)(a1 + 32);
  dispatch_get_global_queue(25, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_47;
  v19[3] = &unk_1E6B95280;
  v20 = v10;
  v12 = v4;
  v13 = *(_QWORD *)(a1 + 40);
  v21 = v12;
  v22 = v13;
  v23 = *(id *)(a1 + 56);
  v25 = *(_OWORD *)(a1 + 72);
  v24 = *(id *)(a1 + 64);
  v14 = -[PBUIWallpaperEffectImageRequestAction initWithSlotIdentifier:forResponseOnQueue:withHandler:](v9, "initWithSlotIdentifier:forResponseOnQueue:withHandler:", v20, v11, v19);

  PBUILogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v27 = v16;
    _os_log_impl(&dword_1B71C0000, v15, OS_LOG_TYPE_DEFAULT, "Sending image request action for image slot request %{public}@", buf, 0xCu);
  }

  v17 = *(void **)(*(_QWORD *)(a1 + 40) + 968);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendActions:", v18);

}

void __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  double v21;
  double v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[6];
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  __int128 v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  _QWORD block[4];
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
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

  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_2;
  block[3] = &unk_1E6B94BC8;
  v9 = (uint64_t *)(a1 + 32);
  v39 = *(id *)(a1 + 32);
  v40 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  if (v7)
  {
    v36[0] = v8;
    v36[1] = 3221225472;
    v36[2] = __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_49;
    v36[3] = &unk_1E6B94BC8;
    v36[4] = *(_QWORD *)(a1 + 48);
    v37 = *(id *)(a1 + 32);
    v10 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], v36);

    v11 = objc_msgSend(v7, "actualStyle");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v7;
      -[NSObject imageURL](v12, "imageURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "_blurImageFromURL:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PBUILogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *v9;
        *(_DWORD *)buf = 138543874;
        v42 = v13;
        v43 = 2114;
        v44 = (uint64_t)v14;
        v45 = 2114;
        v46 = v16;
        _os_log_impl(&dword_1B71C0000, v15, OS_LOG_TYPE_DEFAULT, "Received image URL %{public}@ resulting in image %{public}@ for image request %{public}@", buf, 0x20u);
      }

      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 56), "updateWithImage:", v14);
        v30[0] = v8;
        v30[1] = 3221225472;
        v30[2] = __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_51;
        v30[3] = &unk_1E6B95258;
        v30[4] = *(_QWORD *)(a1 + 48);
        v34 = *(_OWORD *)(a1 + 72);
        v35 = v11;
        v31 = *(id *)(a1 + 64);
        v32 = v14;
        v33 = v13;
        v17 = (void *)MEMORY[0x1E0C80D38];
        dispatch_async(MEMORY[0x1E0C80D38], v30);

      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        PBUILogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *v9;
          *(_DWORD *)buf = 138543618;
          v42 = v7;
          v43 = 2114;
          v44 = v28;
          _os_log_impl(&dword_1B71C0000, v12, OS_LOG_TYPE_DEFAULT, "Unexpected response %{public}@ for image request %{public}@", buf, 0x16u);
        }
        goto LABEL_14;
      }
      v12 = v7;
      -[NSObject ioSurface](v12, "ioSurface");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject size](v12, "size");
      v22 = v21;
      PBUILogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject size](v12, "size");
        BSStringFromCGSize();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *v9;
        *(_DWORD *)buf = 138543874;
        v42 = v13;
        v43 = 2114;
        v44 = (uint64_t)v24;
        v45 = 2114;
        v46 = v25;
        _os_log_impl(&dword_1B71C0000, v23, OS_LOG_TYPE_DEFAULT, "Received IOSurface %{public}@ size %{public}@ for image request %{public}@", buf, 0x20u);

      }
      if ((BSFloatIsZero() & 1) == 0)
      {
        v26 = objc_msgSend(v13, "width");
        objc_msgSend(MEMORY[0x1E0CEA638], "pbui_imageWithIOSurface:scale:orientation:", v13, 0, (double)v26 / v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(*(id *)(a1 + 56), "updateWithImage:", v27);

      }
    }

LABEL_14:
    v29[0] = v8;
    v29[1] = 3221225472;
    v29[2] = __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_54;
    v29[3] = &unk_1E6B951E0;
    v18 = *(_QWORD *)(a1 + 72);
    v29[4] = *(_QWORD *)(a1 + 48);
    v29[5] = v18;
    v19 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], v29);

    goto LABEL_18;
  }
  PBUILogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_47_cold_1(v9, v20);

LABEL_18:
}

uint64_t __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_2(uint64_t a1)
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
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1B71C0000, v2, OS_LOG_TYPE_DEFAULT, "Releasing foreground scene mode assertion for image request %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

uint64_t __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_49(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_51(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cacheBlurImageForVariant:requestedStyle:actualStyle:traitCollection:image:imageURL:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_54(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_blurViewsForVariant:", *(_QWORD *)(a1 + 40), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setNeedsLayout");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (double)parallaxFactorForVariant:(int64_t)a3
{
  double v3;
  void *v4;
  double v5;

  if (!a3)
  {
    -[PBUIWallpaperRemoteViewController _sceneClientSettings](self, "_sceneClientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lockscreenParallaxFactor");
    goto LABEL_5;
  }
  v3 = 0.0;
  if (a3 == 1)
  {
    -[PBUIWallpaperRemoteViewController _sceneClientSettings](self, "_sceneClientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homescreenParallaxFactor");
LABEL_5:
    v3 = v5;

  }
  return v3;
}

- (BOOL)parallaxEnabledForVariant:(int64_t)a3
{
  void *v3;
  char v4;
  BOOL v5;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    -[PBUIWallpaperRemoteViewController _sceneClientSettings](self, "_sceneClientSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "homescreenParallaxEnabled");
  }
  else
  {
    -[PBUIWallpaperRemoteViewController _sceneClientSettings](self, "_sceneClientSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "lockscreenParallaxEnabled");
  }
  v5 = v4;

  return v5;
}

- (double)zoomFactorForVariant:(int64_t)a3
{
  double v3;
  void *v4;
  double v5;

  if (!a3)
  {
    -[PBUIWallpaperRemoteViewController _sceneClientSettings](self, "_sceneClientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lockscreenZoomFactor");
    goto LABEL_5;
  }
  v3 = 0.0;
  if (a3 == 1)
  {
    -[PBUIWallpaperRemoteViewController _sceneClientSettings](self, "_sceneClientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homescreenZoomFactor");
LABEL_5:
    v3 = v5;

  }
  return v3;
}

- (id)wallpaperView:(id)a3 wallpaperConfigurationIncludingValueTypes:(unint64_t)a4
{
  void *v5;
  void *v6;

  -[PBUIWallpaperRemoteViewController wallpaperConfigurationManager](self, "wallpaperConfigurationManager", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperConfigurationForVariant:includingValuesForTypes:", 1, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setActiveVariant:(int64_t)a3
{
  -[PBUIWallpaperRemoteViewController setActiveVariant:withOutAnimationFactory:inAnimationFactory:completion:](self, "setActiveVariant:withOutAnimationFactory:inAnimationFactory:completion:", a3, 0, 0, 0);
}

- (void)setActiveVariant:(int64_t)a3 withOutAnimationFactory:(id)a4 inAnimationFactory:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  PBUIWallpaperWindowSceneTwoCurveTransitionContext *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  int64_t activeVariant;
  NSObject *v27;
  int64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void (**v33)(_QWORD);
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  v13 = objc_alloc_init(PBUIWallpaperWindowSceneTwoCurveTransitionContext);
  if (-[FBScene isActive](self->_scene, "isActive"))
  {
    objc_msgSend(v11, "settings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperWindowSceneTwoCurveTransitionContext setInAnimationSettings:](v13, "setInAnimationSettings:", v14);

    objc_msgSend(v10, "settings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperWindowSceneTwoCurveTransitionContext setOutAnimationSettings:](v13, "setOutAnimationSettings:", v15);

    -[PBUIWallpaperRemoteViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "windowScene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "_synchronizeDrawing");
    objc_msgSend(v18, "_synchronizedDrawingFence");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperWindowSceneTwoCurveTransitionContext setAnimationFence:](v13, "setAnimationFence:", v19);

  }
  -[FBScene settings](self->_scene, "settings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");
  v22 = objc_opt_class();
  v23 = v21;
  if (v22)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
  }
  else
  {
    v24 = 0;
  }
  v25 = v24;

  activeVariant = self->_activeVariant;
  self->_activeVariant = a3;
  PBUILogCommon();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant(a3);
    v33 = v12;
    v28 = a3;
    v29 = v11;
    v30 = v10;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperVariant(activeVariant);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v31;
    v36 = 2114;
    v37 = v32;
    _os_log_impl(&dword_1B71C0000, v27, OS_LOG_TYPE_DEFAULT, "Setting wallpaper variant to %{public}@ from %{public}@", buf, 0x16u);

    v10 = v30;
    v11 = v29;
    a3 = v28;
    v12 = v33;
  }

  objc_msgSend(v25, "setWallpaperVariant:", a3);
  -[FBScene updateSettings:withTransitionContext:](self->_scene, "updateSettings:withTransitionContext:", v25, v13);
  -[PBUIWallpaperRemoteViewController _updateFallbackView](self, "_updateFallbackView");
  -[PBUIWallpaperRemoteViewController _updateWallpaperScaleWithAnimationFactory:](self, "_updateWallpaperScaleWithAnimationFactory:", 0);
  if (v12)
    v12[2](v12);

}

- (int64_t)variant
{
  return self->_activeVariant;
}

- (void)addObserver:(id)a3 forVariant:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[PBUIWallpaperRemoteViewController _observersForVariant:](self, "_observersForVariant:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

- (void)removeObserver:(id)a3 forVariant:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[PBUIWallpaperRemoteViewController _observersForVariant:](self, "_observersForVariant:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v6);

}

- (void)setAlpha:(double)a3 forWallpaperVariant:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  double v11;
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
    *(_DWORD *)buf = 134218242;
    v11 = a3;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_1B71C0000, v7, OS_LOG_TYPE_DEFAULT, "Setting alpha %f for variant %{public}@", buf, 0x16u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PBUIWallpaperRemoteViewController_setAlpha_forWallpaperVariant___block_invoke;
  v9[3] = &__block_descriptor_48_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
  v9[4] = a4;
  *(double *)&v9[5] = a3;
  -[PBUIWallpaperRemoteViewController _updateWallpaperSceneSettingsWithBlock:](self, "_updateWallpaperSceneSettingsWithBlock:", v9);
}

void __66__PBUIWallpaperRemoteViewController_setAlpha_forWallpaperVariant___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    v5 = v3;
    objc_msgSend(v3, "setLockscreenWallpaperAlpha:", *(double *)(a1 + 40));
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = v3;
    objc_msgSend(v3, "setHomescreenWallpaperAlpha:", *(double *)(a1 + 40));
LABEL_5:
    v3 = v5;
  }

}

- (void)setLockscreenWallpaperContentsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSObject *v8;
  void *v9;
  _QWORD v10[8];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BSStringFromCGRect();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v9;
    _os_log_impl(&dword_1B71C0000, v8, OS_LOG_TYPE_DEFAULT, "Setting lockscreen wallpaper contents rect %{public}@", buf, 0xCu);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__PBUIWallpaperRemoteViewController_setLockscreenWallpaperContentsRect___block_invoke;
  v10[3] = &__block_descriptor_64_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
  *(CGFloat *)&v10[4] = x;
  *(CGFloat *)&v10[5] = y;
  *(CGFloat *)&v10[6] = width;
  *(CGFloat *)&v10[7] = height;
  -[PBUIWallpaperRemoteViewController _updateWallpaperSceneSettingsWithBlock:](self, "_updateWallpaperSceneSettingsWithBlock:", v10);
}

uint64_t __72__PBUIWallpaperRemoteViewController_setLockscreenWallpaperContentsRect___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setLockscreenWallpaperContentsRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)setLockscreenOnlyWallpaperAlpha:(double)a3
{
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = a3;
    _os_log_impl(&dword_1B71C0000, v5, OS_LOG_TYPE_DEFAULT, "Setting lockscreen-only wallpaper alpha %f", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PBUIWallpaperRemoteViewController_setLockscreenOnlyWallpaperAlpha___block_invoke;
  v6[3] = &__block_descriptor_40_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
  *(double *)&v6[4] = a3;
  -[PBUIWallpaperRemoteViewController _updateWallpaperSceneSettingsWithBlock:](self, "_updateWallpaperSceneSettingsWithBlock:", v6);
}

uint64_t __69__PBUIWallpaperRemoteViewController_setLockscreenOnlyWallpaperAlpha___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLockscreenOnlyWallpaperAlpha:", *(double *)(a1 + 32));
}

- (double)homescreenWallpaperScale
{
  double result;

  -[PBUIWallpaperRemoteViewController _wallpaperScaleForVariant:](self, "_wallpaperScaleForVariant:", 1);
  return result;
}

- (id)setHomescreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[PBUIWallpaperRemoteViewController _wallpaperScaleAssertionForVariant:scale:](self, "_wallpaperScaleAssertionForVariant:scale:", 1, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperRemoteViewController _updateWallpaperScaleWithAnimationFactory:](self, "_updateWallpaperScaleWithAnimationFactory:", v6);

  return v7;
}

- (double)minimumHomescreenWallpaperScale
{
  void *v2;
  double v3;
  double v4;

  -[PBUIWallpaperRemoteViewController _sceneClientSettings](self, "_sceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homescreenMinimumWallpaperScale");
  v4 = v3;

  return v4;
}

- (double)lockscreenWallpaperScale
{
  double result;

  -[PBUIWallpaperRemoteViewController _wallpaperScaleForVariant:](self, "_wallpaperScaleForVariant:", 0);
  return result;
}

- (void)setLockscreenWallpaperScale:(double)a3
{
  id v3;

  v3 = -[PBUIWallpaperRemoteViewController setLockscreenWallpaperScale:withAnimationFactory:](self, "setLockscreenWallpaperScale:withAnimationFactory:", 0, a3);
}

- (id)setLockscreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[PBUIWallpaperRemoteViewController _wallpaperScaleAssertionForVariant:scale:](self, "_wallpaperScaleAssertionForVariant:scale:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperRemoteViewController _updateWallpaperScaleWithAnimationFactory:](self, "_updateWallpaperScaleWithAnimationFactory:", v6);

  return v7;
}

- (double)minimumLockscreenWallpaperScale
{
  void *v2;
  double v3;
  double v4;

  -[PBUIWallpaperRemoteViewController _sceneClientSettings](self, "_sceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockscreenMinimumWallpaperScale");
  v4 = v3;

  return v4;
}

- (id)_wallpaperScaleAssertionForVariant:(int64_t)a3 scale:(double)a4
{
  PBUIWallpaperScaleAssertion *v7;
  void *v8;
  double *v9;
  NSObject *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v7 = [PBUIWallpaperScaleAssertion alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wallpaper scale %f"), *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__PBUIWallpaperRemoteViewController__wallpaperScaleAssertionForVariant_scale___block_invoke;
  v13[3] = &unk_1E6B95310;
  objc_copyWeak(&v14, &location);
  v9 = -[PBUIWallpaperScaleAssertion initWithVariant:scale:forReason:invalidationBlock:](v7, a3, v8, v13, a4);

  PBUILogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v11;
    _os_log_impl(&dword_1B71C0000, v10, OS_LOG_TYPE_DEFAULT, "Acquiring wallpaper scale assertion %@", buf, 0xCu);

  }
  -[NSHashTable addObject:](self->_wallpaperScaleAssertions, "addObject:", v9);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v9;
}

void __78__PBUIWallpaperRemoteViewController__wallpaperScaleAssertionForVariant_scale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PBUILogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1B71C0000, v8, OS_LOG_TYPE_DEFAULT, "Removing wallpaper scale assertion %@", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(WeakRetained[136], "removeObject:", v5);
    objc_msgSend(WeakRetained, "_updateWallpaperScaleWithAnimationFactory:", v6);
  }

}

- (void)setDisallowsRasterization:(BOOL)a3 forVariant:(int64_t)a4 withReason:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  BOOL v16;
  uint8_t buf[4];
  _BOOL4 v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v6 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[PBUIWallpaperRemoteViewController _disallowRasterizationReasonsForVariant:](self, "_disallowRasterizationReasonsForVariant:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v6)
    objc_msgSend(v9, "addObject:", v8);
  else
    objc_msgSend(v9, "removeObject:", v8);
  v11 = objc_msgSend(v9, "count");
  v12 = v11 != 0;
  PBUILogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant(a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    v18 = v11 != 0;
    v19 = 2114;
    v20 = v14;
    v21 = 2114;
    v22 = v8;
    v23 = 1024;
    v24 = v10 != 0;
    _os_log_impl(&dword_1B71C0000, v13, OS_LOG_TYPE_DEFAULT, "Setting rasterization disabled:%{BOOL}u for variant %{public}@ with reason %{public}@ (was disabled: %{BOOL}u)", buf, 0x22u);

    v12 = v11 != 0;
  }

  if ((v10 != 0) != (v11 != 0))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __85__PBUIWallpaperRemoteViewController_setDisallowsRasterization_forVariant_withReason___block_invoke;
    v15[3] = &__block_descriptor_41_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
    v15[4] = a4;
    v16 = v12;
    -[PBUIWallpaperRemoteViewController _updateWallpaperSceneSettingsWithBlock:](self, "_updateWallpaperSceneSettingsWithBlock:", v15);
  }

}

void __85__PBUIWallpaperRemoteViewController_setDisallowsRasterization_forVariant_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    v5 = v3;
    objc_msgSend(v3, "setDisallowLockscreenRasterization:", *(unsigned __int8 *)(a1 + 40));
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = v3;
    objc_msgSend(v3, "setDisallowHomescreenRasterization:", *(unsigned __int8 *)(a1 + 40));
LABEL_5:
    v3 = v5;
  }

}

- (void)setWallpaperHidden:(BOOL)a3 variant:(int64_t)a4 reason:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  BOOL v16;
  uint8_t buf[4];
  _BOOL4 v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v6 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[PBUIWallpaperRemoteViewController _hideWallpaperReasonsForVariant:](self, "_hideWallpaperReasonsForVariant:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v6)
    objc_msgSend(v9, "addObject:", v8);
  else
    objc_msgSend(v9, "removeObject:", v8);
  v11 = objc_msgSend(v9, "count");
  v12 = v11 != 0;
  PBUILogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperVariant(a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    v18 = v11 != 0;
    v19 = 2114;
    v20 = v14;
    v21 = 2114;
    v22 = v8;
    v23 = 1024;
    v24 = v10 != 0;
    _os_log_impl(&dword_1B71C0000, v13, OS_LOG_TYPE_DEFAULT, "Setting wallpaper hidden:%{BOOL}u for variant %{public}@ with reason %{public}@ (was hidden: %{BOOL}u)", buf, 0x22u);

    v12 = v11 != 0;
  }

  if ((v10 != 0) != (v11 != 0))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__PBUIWallpaperRemoteViewController_setWallpaperHidden_variant_reason___block_invoke;
    v15[3] = &__block_descriptor_41_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
    v15[4] = a4;
    v16 = v12;
    -[PBUIWallpaperRemoteViewController _updateWallpaperSceneSettingsWithBlock:](self, "_updateWallpaperSceneSettingsWithBlock:", v15);
  }

}

void __71__PBUIWallpaperRemoteViewController_setWallpaperHidden_variant_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    v5 = v3;
    objc_msgSend(v3, "setLockscreenWallpaperHidden:", *(unsigned __int8 *)(a1 + 40));
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = v3;
    objc_msgSend(v3, "setHomescreenWallpaperHidden:", *(unsigned __int8 *)(a1 + 40));
LABEL_5:
    v3 = v5;
  }

}

- (id)suspendWallpaperAnimationForReason:(id)a3
{
  id v4;
  NSMutableSet *wallpaperAnimationSuspendedReasons;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[4];
  id v11;
  PBUIWallpaperRemoteViewController *v12;
  id v13;
  id location;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  wallpaperAnimationSuspendedReasons = self->_wallpaperAnimationSuspendedReasons;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__PBUIWallpaperRemoteViewController_suspendWallpaperAnimationForReason___block_invoke;
  v10[3] = &unk_1E6B95378;
  objc_copyWeak(&v13, &location);
  v6 = v4;
  v11 = v6;
  v12 = self;
  -[PBUIWallpaperRemoteViewController _simpleAssertionWithReasonsSet:identifier:reason:updater:](self, "_simpleAssertionWithReasonsSet:identifier:reason:updater:", wallpaperAnimationSuspendedReasons, CFSTR("WallpaperAnimationSuspended"), v6, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PBUILogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = v6;
    v17 = 2048;
    v18 = v7;
    _os_log_impl(&dword_1B71C0000, v8, OS_LOG_TYPE_DEFAULT, "Suspending animation for reason %{public}@ assertion %p", buf, 0x16u);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

void __72__PBUIWallpaperRemoteViewController_suspendWallpaperAnimationForReason___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[4];
  char v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    PBUILogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v10 = v6;
      v11 = 1024;
      v12 = a2 ^ 1;
      _os_log_impl(&dword_1B71C0000, v5, OS_LOG_TYPE_DEFAULT, "Animation suspension assertion for reason %{public}@ invalidated. Setting sampling suspended:%{BOOL}u", buf, 0x12u);
    }

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__PBUIWallpaperRemoteViewController_suspendWallpaperAnimationForReason___block_invoke_67;
    v7[3] = &__block_descriptor_33_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
    v8 = a2;
    objc_msgSend(WeakRetained, "_updateWallpaperSceneSettingsWithBlock:", v7);
    objc_msgSend(*(id *)(a1 + 40), "_reconfigureBlurViewsForVariant:", 1);
    objc_msgSend(*(id *)(a1 + 40), "_reconfigureBlurViewsForVariant:", 0);
  }

}

uint64_t __72__PBUIWallpaperRemoteViewController_suspendWallpaperAnimationForReason___block_invoke_67(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWallpaperAnimationSuspended:", *(_BYTE *)(a1 + 32) == 0);
}

- (id)irisWallpaperPlayer
{
  return self->_remoteIrisWallpaperPlayer;
}

- (void)updateIrisWallpaperForInteractiveMode
{
  NSObject *v3;
  uint8_t v4[16];

  PBUILogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B71C0000, v3, OS_LOG_TYPE_DEFAULT, "Updating iris wallpaper for interactive mode", v4, 2u);
  }

  -[PBUIWallpaperRemoteViewController _updateWallpaperSceneSettingsWithBlock:](self, "_updateWallpaperSceneSettingsWithBlock:", &__block_literal_global_9);
}

uint64_t __74__PBUIWallpaperRemoteViewController_updateIrisWallpaperForInteractiveMode__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLiveWallpaperInteractive:", 1);
}

- (BOOL)updateIrisWallpaperForStaticMode
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v7[16];

  PBUILogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B71C0000, v3, OS_LOG_TYPE_DEFAULT, "Updating iris wallpaper for static mode", v7, 2u);
  }

  -[PBUIWallpaperRemoteViewController irisWallpaperPlayer](self, "irisWallpaperPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "irisPlaybackState");

  if (!v5)
    -[PBUIWallpaperRemoteViewController _updateWallpaperSceneSettingsWithBlock:](self, "_updateWallpaperSceneSettingsWithBlock:", &__block_literal_global_70);
  return v5 == 0;
}

uint64_t __69__PBUIWallpaperRemoteViewController_updateIrisWallpaperForStaticMode__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLiveWallpaperInteractive:", 0);
}

- (void)cancelInProcessAnimations
{
  void *v2;
  id v3;

  -[PBUIWallpaperRemoteViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeAllRetargetableAnimations:", 1);

}

- ($1D129F7B4C980C50E70029647222EF17)currentHomescreenStyleTransitionState
{
  void *v4;
  void *v5;
  $1D129F7B4C980C50E70029647222EF17 *result;
  id v7;

  -[PBUIWallpaperRemoteViewController _sceneSettings](self, "_sceneSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homescreenStyleTransitionState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "highestPriorityStyleTransitionState");
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0.0;
  }

  return result;
}

- (BOOL)setWallpaperStyle:(int64_t)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6
{
  id v10;
  _BYTE v12[24];

  v10 = a6;
  PBUIWallpaperStyleTransitionStateMake(a3, a3, (uint64_t)v12, 0.0);
  LOBYTE(a5) = -[PBUIWallpaperRemoteViewController setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:](self, "setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:", v12, a4, a5, v10);

  return a5;
}

- (BOOL)setWallpaperStyleTransitionState:(id *)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PBUIWallpaperWindowSceneStyleTransitionState *v14;
  void *v15;
  int v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  PBUIWallpaperRemoteViewController *v25;
  int v26;
  _QWORD v27[4];
  id v28;
  id v29;
  PBUIWallpaperRemoteViewController *v30;
  int64_t v31;
  _BYTE buf[24];
  void *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  -[PBUIWallpaperRemoteViewController _sceneSettings](self, "_sceneSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!a5)
  {
    objc_msgSend(v11, "lockscreenStyleTransitionState");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = (PBUIWallpaperWindowSceneStyleTransitionState *)v13;
    if (v13)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (a5 == 1)
  {
    objc_msgSend(v11, "homescreenStyleTransitionState");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  v14 = objc_alloc_init(PBUIWallpaperWindowSceneStyleTransitionState);
LABEL_7:
  v15 = (void *)-[PBUIWallpaperWindowSceneStyleTransitionState copy](v14, "copy");
  *(_OWORD *)buf = *(_OWORD *)&a3->var0;
  *(double *)&buf[16] = a3->var2;
  objc_msgSend(v15, "setWallpaperStyleTransitionState:forPriority:", buf, a4);
  v16 = objc_msgSend(v15, "isEqual:", v14);
  v17 = v16;
  v26 = v16 ^ 1;
  PBUILogCommon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_OWORD *)buf = *(_OWORD *)&a3->var0;
    *(double *)&buf[16] = a3->var2;
    PBUIStringForStyleTransitionState((unint64_t *)buf);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperStylePriority(a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperVariant(a5);
    v25 = self;
    v21 = v12;
    v22 = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 2114;
    v33 = v23;
    v34 = 1024;
    v35 = v26;
    _os_log_impl(&dword_1B71C0000, v18, OS_LOG_TYPE_DEFAULT, "Setting wallpaper style transition state %{public}@ for priority %{public}@ variant %{public}@. Is different:%{BOOL}u", buf, 0x26u);

    v10 = v22;
    v12 = v21;
    self = v25;

  }
  if ((v17 & 1) == 0)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __114__PBUIWallpaperRemoteViewController_setWallpaperStyleTransitionState_forPriority_forVariant_withAnimationFactory___block_invoke;
    v27[3] = &unk_1E6B953E0;
    v31 = a5;
    v28 = v15;
    v29 = v10;
    v30 = self;
    -[PBUIWallpaperRemoteViewController _updateWallpaperSceneSettingsWithTransitionBlock:](self, "_updateWallpaperSceneSettingsWithTransitionBlock:", v27);

  }
  return v26;
}

id __114__PBUIWallpaperRemoteViewController_setWallpaperStyleTransitionState_forPriority_forVariant_withAnimationFactory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
  {
    if (v5 == 1)
      objc_msgSend(v3, "setHomescreenStyleTransitionState:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v3, "setLockscreenStyleTransitionState:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(MEMORY[0x1E0CEA350], "transitionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_synchronizeDrawing");
    objc_msgSend(v10, "_synchronizedDrawingFence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAnimationFence:", v11);

    objc_msgSend(v6, "setAnimationSettings:", v7);
  }

  return v6;
}

- (BOOL)removeWallpaperStyleForPriority:(int64_t)a3 forVariant:(int64_t)a4 withAnimationFactory:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PBUIWallpaperWindowSceneStyleTransitionState *v12;
  void *v13;
  int v14;
  char v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  PBUIWallpaperRemoteViewController *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  PBUIWallpaperRemoteViewController *v27;
  int64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[PBUIWallpaperRemoteViewController _sceneSettings](self, "_sceneSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!a4)
  {
    objc_msgSend(v9, "lockscreenStyleTransitionState");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = (PBUIWallpaperWindowSceneStyleTransitionState *)v11;
    if (v11)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (a4 == 1)
  {
    objc_msgSend(v9, "homescreenStyleTransitionState");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  v12 = objc_alloc_init(PBUIWallpaperWindowSceneStyleTransitionState);
LABEL_7:
  v13 = (void *)-[PBUIWallpaperWindowSceneStyleTransitionState copy](v12, "copy");
  objc_msgSend(v13, "removeWallpaperStyleTransitionStateForPriority:", a3);
  v14 = objc_msgSend(v13, "isEqual:", v12);
  v15 = v14;
  v16 = v14 ^ 1;
  PBUILogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperStylePriority(a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperVariant(a4);
    v23 = self;
    v19 = v10;
    v20 = v8;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v18;
    v31 = 2114;
    v32 = v21;
    v33 = 1024;
    v34 = v16;
    _os_log_impl(&dword_1B71C0000, v17, OS_LOG_TYPE_DEFAULT, "Removing wallpaper style transition state for priority %{public}@ variant %{public}@. Is different:%{BOOL}u", buf, 0x1Cu);

    v8 = v20;
    v10 = v19;
    self = v23;

  }
  if ((v15 & 1) == 0)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __101__PBUIWallpaperRemoteViewController_removeWallpaperStyleForPriority_forVariant_withAnimationFactory___block_invoke;
    v24[3] = &unk_1E6B953E0;
    v28 = a4;
    v25 = v13;
    v26 = v8;
    v27 = self;
    -[PBUIWallpaperRemoteViewController _updateWallpaperSceneSettingsWithTransitionBlock:](self, "_updateWallpaperSceneSettingsWithTransitionBlock:", v24);

  }
  return v16;
}

id __101__PBUIWallpaperRemoteViewController_removeWallpaperStyleForPriority_forVariant_withAnimationFactory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
  {
    if (v5 == 1)
      objc_msgSend(v3, "setHomescreenStyleTransitionState:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v3, "setLockscreenStyleTransitionState:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(MEMORY[0x1E0CEA350], "transitionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_synchronizeDrawing");
    objc_msgSend(v10, "_synchronizedDrawingFence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAnimationFence:", v11);

    objc_msgSend(v6, "setAnimationSettings:", v7);
  }

  return v6;
}

- (id)requireWallpaperWithReason:(id)a3
{
  id v4;
  NSMutableSet *wallpaperRequiredReasons;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  wallpaperRequiredReasons = self->_wallpaperRequiredReasons;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__PBUIWallpaperRemoteViewController_requireWallpaperWithReason___block_invoke;
  v10[3] = &unk_1E6B95408;
  objc_copyWeak(&v12, &location);
  v6 = v4;
  v11 = v6;
  -[PBUIWallpaperRemoteViewController _simpleAssertionWithReasonsSet:identifier:reason:updater:](self, "_simpleAssertionWithReasonsSet:identifier:reason:updater:", wallpaperRequiredReasons, CFSTR("WallpaperRequired"), v6, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PBUILogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2048;
    v17 = v7;
    _os_log_impl(&dword_1B71C0000, v8, OS_LOG_TYPE_DEFAULT, "Beginning wallpaper requiring for reason %{public}@ assertion %p", buf, 0x16u);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v7;
}

void __64__PBUIWallpaperRemoteViewController_requireWallpaperWithReason___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[4];
  char v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PBUILogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v10 = v6;
      v11 = 1024;
      v12 = a2 ^ 1;
      _os_log_impl(&dword_1B71C0000, v5, OS_LOG_TYPE_DEFAULT, "Ending wallpaper requiring with reason %{public}@. Setting wallpaper required:%{BOOL}u", buf, 0x12u);
    }

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__PBUIWallpaperRemoteViewController_requireWallpaperWithReason___block_invoke_76;
    v7[3] = &__block_descriptor_33_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
    v8 = a2;
    objc_msgSend(WeakRetained, "_updateWallpaperSceneSettingsWithBlock:", v7);
  }

}

uint64_t __64__PBUIWallpaperRemoteViewController_requireWallpaperWithReason___block_invoke_76(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWallpaperRequired:", *(_BYTE *)(a1 + 32) == 0);
}

- (void)preheatWallpaperForVariant:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  FBScene *scene;
  void *v8;
  PBUIWallpaperPreheatAction *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[FBScene isActive](self->_scene, "isActive"))
  {
    PBUILogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      PBUIStringForWallpaperVariant(a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1B71C0000, v5, OS_LOG_TYPE_DEFAULT, "Sending wallpaper preheat action for variant %{public}@", (uint8_t *)&v11, 0xCu);

    }
    scene = self->_scene;
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = -[PBUIWallpaperPreheatAction initWithVariant:]([PBUIWallpaperPreheatAction alloc], "initWithVariant:", a3);
    objc_msgSend(v8, "setWithObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBScene sendActions:](scene, "sendActions:", v10);

  }
}

- (void)beginDelayingHomescreenStyleChangesForReason:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableSet addObject:](self->_homescreenChangesDelayedReasons, "addObject:", v4);
  PBUILogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1B71C0000, v5, OS_LOG_TYPE_DEFAULT, "Beginning delaying homescreen style changes for reason %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[PBUIWallpaperRemoteViewController _updateWallpaperSceneSettingsWithBlock:](self, "_updateWallpaperSceneSettingsWithBlock:", &__block_literal_global_78);
}

uint64_t __82__PBUIWallpaperRemoteViewController_beginDelayingHomescreenStyleChangesForReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHomescreenStyleChangesDelayed:", 1);
}

- (void)endDelayingHomescreenStyleChangesForReason:(id)a3 animationFactory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  PBUIWallpaperRemoteViewController *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMutableSet removeObject:](self->_homescreenChangesDelayedReasons, "removeObject:", v6);
  PBUILogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[NSMutableSet count](self->_homescreenChangesDelayedReasons, "count");
    *(_DWORD *)buf = 138543618;
    v14 = v6;
    v15 = 2048;
    v16 = v9;
    _os_log_impl(&dword_1B71C0000, v8, OS_LOG_TYPE_DEFAULT, "Ending delaying homescreen style changes for reason %{public}@. Remaining reasons: %ld", buf, 0x16u);
  }

  if (!-[NSMutableSet count](self->_homescreenChangesDelayedReasons, "count"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __97__PBUIWallpaperRemoteViewController_endDelayingHomescreenStyleChangesForReason_animationFactory___block_invoke;
    v10[3] = &unk_1E6B95450;
    v11 = v7;
    v12 = self;
    -[PBUIWallpaperRemoteViewController _updateWallpaperSceneSettingsWithTransitionBlock:](self, "_updateWallpaperSceneSettingsWithTransitionBlock:", v10);

  }
}

id __97__PBUIWallpaperRemoteViewController_endDelayingHomescreenStyleChangesForReason_animationFactory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a2, "setHomescreenStyleChangesDelayed:", 0);
  objc_msgSend(MEMORY[0x1E0CEA350], "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_synchronizeDrawing");
    objc_msgSend(v7, "_synchronizedDrawingFence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAnimationFence:", v8);

    objc_msgSend(v3, "setAnimationSettings:", v4);
  }

  return v3;
}

- (id)newFakeBlurViewForVariant:(int64_t)a3 style:(int64_t)a4 transformOptions:(unint64_t)a5
{
  id WeakRetained;
  uint64_t v9;
  PBUIFakeBlurView *v10;
  PBUIFakeBlurView *v11;
  void *v12;
  _QWORD v14[4];
  PBUIFakeBlurView *v15;
  uint64_t v16;

  WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
  v9 = objc_msgSend(WeakRetained, "wallpaperPresenter:requestsOrientationWithRefresh:", self, 1);

  v10 = -[PBUIFakeBlurView initWithVariant:imageProvider:fakeBlurRegistry:wallpaperViewDelegate:transformOptions:reachabilityCoordinator:]([PBUIFakeBlurView alloc], "initWithVariant:imageProvider:fakeBlurRegistry:wallpaperViewDelegate:transformOptions:reachabilityCoordinator:", a3, self, self, self, a5, self->_reachabilityCoordinator);
  v11 = v10;
  if (v9)
  {
    v12 = (void *)MEMORY[0x1E0CEABB0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86__PBUIWallpaperRemoteViewController_newFakeBlurViewForVariant_style_transformOptions___block_invoke;
    v14[3] = &unk_1E6B951E0;
    v15 = v10;
    v16 = v9;
    objc_msgSend(v12, "performWithoutAnimation:", v14);

  }
  return v11;
}

uint64_t __86__PBUIWallpaperRemoteViewController_newFakeBlurViewForVariant_style_transformOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rotateToInterfaceOrientation:", *(_QWORD *)(a1 + 40));
}

- (void)updateWallpaperForLocations:(int64_t)a3 withCompletion:(id)a4
{
  -[PBUIWallpaperRemoteViewController updateWallpaperForLocations:wallpaperMode:withCompletion:](self, "updateWallpaperForLocations:wallpaperMode:withCompletion:", a3, 0, a4);
}

- (void)updateWallpaperForLocations:(int64_t)a3 wallpaperMode:(int64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;
  int64_t v13;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__PBUIWallpaperRemoteViewController_updateWallpaperForLocations_wallpaperMode_withCompletion___block_invoke;
  v10[3] = &unk_1E6B954A0;
  v10[4] = self;
  v11 = v8;
  v12 = a3;
  v13 = a4;
  v9 = v8;
  -[PBUIWallpaperRemoteViewController _performWithLiveScene:](self, "_performWithLiveScene:", v10);

}

void __94__PBUIWallpaperRemoteViewController_updateWallpaperForLocations_wallpaperMode_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  PBUIWallpaperUpdateLocationsAction *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B71C0000, v2, OS_LOG_TYPE_DEFAULT, "Acquiring foreground support scene mode assertion for wallpaper update", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_acquireSceneModeAssertionForReason:sceneMode:", CFSTR("UpdateWallpaperForLocations"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D016A0];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __94__PBUIWallpaperRemoteViewController_updateWallpaperForLocations_wallpaperMode_withCompletion___block_invoke_83;
  v17 = &unk_1E6B95478;
  v5 = *(id *)(a1 + 40);
  v18 = v3;
  v19 = v5;
  v6 = v3;
  objc_msgSend(v4, "responderWithHandler:", &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQueue:", MEMORY[0x1E0C80D38], v14, v15, v16, v17);
  objc_msgSend(v7, "setTimeout:", 15);
  PBUILogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    PBUIStringForWallpaperLocations(*(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBUIStringForWallpaperMode(*(_QWORD *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v9;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_1B71C0000, v8, OS_LOG_TYPE_DEFAULT, "Sending wallpaper update locations action for locations %{public}@ wallpaper mode %{public}@", buf, 0x16u);

  }
  v11 = -[PBUIWallpaperUpdateLocationsAction initWithLocations:wallpaperMode:responder:]([PBUIWallpaperUpdateLocationsAction alloc], "initWithLocations:wallpaperMode:responder:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v7);
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendActions:", v13);

}

void __94__PBUIWallpaperRemoteViewController_updateWallpaperForLocations_wallpaperMode_withCompletion___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  PBUILogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B71C0000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating foreground support scene mode assertion for wallpaper update", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)noteWillAnimateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSHashTable *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[7];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = self->_lockscreenBlurViews;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11++), "rotateToInterfaceOrientation:", a3);
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = self->_homescreenBlurViews;
  v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16++), "rotateToInterfaceOrientation:", a3);
      }
      while (v14 != v16);
      v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__PBUIWallpaperRemoteViewController_noteWillAnimateToInterfaceOrientation_duration___block_invoke;
  v17[3] = &unk_1E6B954C8;
  v17[4] = self;
  v17[5] = a3;
  *(double *)&v17[6] = a4;
  -[PBUIWallpaperRemoteViewController _updateWallpaperSceneSettingsWithTransitionBlock:](self, "_updateWallpaperSceneSettingsWithTransitionBlock:", v17);
}

id __84__PBUIWallpaperRemoteViewController_noteWillAnimateToInterfaceOrientation_duration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a2, "setInterfaceOrientation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CEA350], "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_synchronizeDrawing");
  objc_msgSend(v6, "_synchronizedDrawingFence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimationFence:", v7);

  objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", *(double *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimationSettings:", v8);

  return v3;
}

- (id)legibilitySettingsForVariant:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[PBUIWallpaperRemoteViewController _sceneClientSettings](self, "_sceneClientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
  {
    if (a3 != 1)
    {
LABEL_6:
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEADE8]), "initWithStyle:", 0);
      goto LABEL_7;
    }
    objc_msgSend(v4, "homescreenLegibilitySettings");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "lockscreenLegibilitySettings");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  if (!v6)
    goto LABEL_6;
LABEL_7:

  return v7;
}

- (id)averageColorForVariant:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[PBUIWallpaperRemoteViewController _sceneClientSettings](self, "_sceneClientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
  {
    if (a3 != 1)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v4, "homescreenAverageColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "lockscreenAverageColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  if (!v6)
    goto LABEL_6;
LABEL_7:

  return v7;
}

- (double)contrastForVariant:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[PBUIWallpaperRemoteViewController _sceneClientSettings](self, "_sceneClientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!a3)
  {
    objc_msgSend(v4, "lockscreenContrast");
    goto LABEL_5;
  }
  v6 = 0.0;
  if (a3 == 1)
  {
    objc_msgSend(v4, "homescreenContrast");
LABEL_5:
    v6 = v7;
  }

  return v6;
}

- (void)remoteIrisWallpaperPlayer:(id)a3 touchActiveChanged:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  _QWORD v7[4];
  BOOL v8;
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x1E0C80C00];
  PBUILogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v4;
    _os_log_impl(&dword_1B71C0000, v6, OS_LOG_TYPE_DEFAULT, "Setting live wallpaper touch active: %{BOOL}u", buf, 8u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__PBUIWallpaperRemoteViewController_remoteIrisWallpaperPlayer_touchActiveChanged___block_invoke;
  v7[3] = &__block_descriptor_33_e49_v16__0__PBUIMutableWallpaperWindowSceneSettings_8l;
  v8 = v4;
  -[PBUIWallpaperRemoteViewController _updateWallpaperSceneSettingsWithBlock:](self, "_updateWallpaperSceneSettingsWithBlock:", v7);
}

uint64_t __82__PBUIWallpaperRemoteViewController_remoteIrisWallpaperPlayer_touchActiveChanged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLiveWallpaperTouchActive:", *(unsigned __int8 *)(a1 + 32));
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t i;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = a4;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        PBUILogCommon();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v5;
          _os_log_impl(&dword_1B71C0000, v6, OS_LOG_TYPE_DEFAULT, "Received action %{public}@", buf, 0xCu);
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          WeakRetained = v5;
          v8 = objc_msgSend(WeakRetained, "variant");
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          -[PBUIWallpaperRemoteViewController _observersForVariant:](self, "_observersForVariant:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v31;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v31 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v14, "wallpaperWillChangeForVariant:", v8);
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
            }
            while (v11);
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            WeakRetained = v5;
            v15 = objc_msgSend(WeakRetained, "variant");
            v26 = 0u;
            v27 = 0u;
            v28 = 0u;
            v29 = 0u;
            -[PBUIWallpaperRemoteViewController _observersForVariant:](self, "_observersForVariant:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v27;
              do
              {
                for (k = 0; k != v18; ++k)
                {
                  if (*(_QWORD *)v27 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * k);
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    objc_msgSend(v21, "wallpaperDidChangeForVariant:", v15);
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
              }
              while (v18);
            }

            -[PBUIWallpaperRemoteViewController _reconfigureBlurViewsForVariant:](self, "_reconfigureBlurViewsForVariant:", v15);
            -[PBUIWallpaperRemoteViewController _updateBlurViewsForVariant:](self, "_updateBlurViewsForVariant:", v15);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
            objc_msgSend(WeakRetained, "wallpaperPresenterDidCompleteWallpaperChange:", self);
          }
        }

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v24);
  }

}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  NSObject *v7;
  int64_t v8;
  _BOOL4 v9;
  int v10;
  NSObject *v11;
  double v12;
  double v13;
  NSObject *v14;
  dispatch_time_t v15;
  _QWORD block[5];
  uint8_t buf[4];
  _BYTE v18[10];
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_scene == a3)
  {
    PBUILogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)v18 = self;
      *(_WORD *)&v18[8] = 2112;
      v19 = *(double *)&v6;
      _os_log_impl(&dword_1B71C0000, v7, OS_LOG_TYPE_DEFAULT, "Remote wallpaper controller %p scene did deactivate with error: %@", buf, 0x16u);
    }

    -[PBUISessionReconnectPolicy sessionDidDisconnect](self->_reconnectPolicy, "sessionDidDisconnect");
    v8 = -[PBUIWallpaperRemoteViewController _effectiveSceneMode](self, "_effectiveSceneMode");
    v9 = self->_missingEffectViewImages || -[NSMutableSet count](self->_pendingEffectViewImageSlots, "count") != 0;
    if (v8)
      v10 = 1;
    else
      v10 = v9;
    PBUILogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v18 = v8 != 0;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = v9;
      _os_log_impl(&dword_1B71C0000, v11, OS_LOG_TYPE_DEFAULT, "shouldReactivateForSceneMode: %{BOOL}u\nshouldReactivateForEffectImages: %{BOOL}u\n", buf, 0xEu);
    }

    if (v10)
    {
      -[PBUISessionReconnectPolicy sessionReconnectDelay](self->_reconnectPolicy, "sessionReconnectDelay");
      v13 = v12;
      PBUILogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v18 = self;
        *(_WORD *)&v18[8] = 2048;
        v19 = v13;
        _os_log_impl(&dword_1B71C0000, v14, OS_LOG_TYPE_DEFAULT, "Attempting reactivation of remote wallpaper controller %p scene in %0.3f seconds.", buf, 0x16u);
      }

      v15 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__PBUIWallpaperRemoteViewController_sceneDidDeactivate_withError___block_invoke;
      block[3] = &unk_1E6B94728;
      block[4] = self;
      dispatch_after(v15, MEMORY[0x1E0C80D38], block);
    }
  }

}

uint64_t __66__PBUIWallpaperRemoteViewController_sceneDidDeactivate_withError___block_invoke(uint64_t a1)
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
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1B71C0000, v2, OS_LOG_TYPE_DEFAULT, "Reactivating remote wallpaper controller scene %p.", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_setupScene");
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  PBUIWallpaperWindowSceneClientSettingsDiffInspector *v15;
  void *v16;
  void *v17;
  void *v18;
  NSHashTable *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  NSHashTable *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[3];
  char v55;
  _QWORD v56[5];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  _QWORD v61[5];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  char v85;
  uint8_t buf[4];
  void *v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v10 = a4;
  v33 = a5;
  v34 = a6;
  v82 = 0;
  v83 = &v82;
  v84 = 0x2020000000;
  v85 = 0;
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v11 = MEMORY[0x1E0C809B0];
  v65 = 0;
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
  v61[3] = &unk_1E6B954F0;
  v61[4] = &v62;
  v12 = (void *)MEMORY[0x1BCCA5978](v61);
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v56[0] = v11;
  v56[1] = 3221225472;
  v56[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2;
  v56[3] = &unk_1E6B954F0;
  v56[4] = &v57;
  v13 = (void *)MEMORY[0x1BCCA5978](v56);
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v55 = 0;
  v53[0] = v11;
  v53[1] = 3221225472;
  v53[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_3;
  v53[3] = &unk_1E6B954F0;
  v53[4] = v54;
  v14 = (void *)MEMORY[0x1BCCA5978](v53);
  v15 = objc_alloc_init(PBUIWallpaperWindowSceneClientSettingsDiffInspector);
  v52[0] = v11;
  v52[1] = 3221225472;
  v52[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_4;
  v52[3] = &unk_1E6B954F0;
  v52[4] = &v82;
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector observeHomescreenLegibilitySettingsWithBlock:](v15, "observeHomescreenLegibilitySettingsWithBlock:", v52);
  v51[0] = v11;
  v51[1] = 3221225472;
  v51[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_5;
  v51[3] = &unk_1E6B954F0;
  v51[4] = &v78;
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector observeLockscreenLegibilitySettingsWithBlock:](v15, "observeLockscreenLegibilitySettingsWithBlock:", v51);
  v50[0] = v11;
  v50[1] = 3221225472;
  v50[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_6;
  v50[3] = &unk_1E6B954F0;
  v50[4] = &v74;
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector observeHomescreenAverageColorWithBlock:](v15, "observeHomescreenAverageColorWithBlock:", v50);
  v49[0] = v11;
  v49[1] = 3221225472;
  v49[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_7;
  v49[3] = &unk_1E6B954F0;
  v49[4] = &v70;
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector observeLockscreenContrastWithBlock:](v15, "observeLockscreenContrastWithBlock:", v49);
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector observeHomescreenContentStaticWithBlock:](v15, "observeHomescreenContentStaticWithBlock:", v14);
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector observeLockscreenContentStaticWithBlock:](v15, "observeLockscreenContentStaticWithBlock:", v14);
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector observeLockscreenContentLiveWallpaperWithBlock:](v15, "observeLockscreenContentLiveWallpaperWithBlock:", v14);
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector observeHomescreenParallaxFactorWithBlock:](v15, "observeHomescreenParallaxFactorWithBlock:", v12);
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector observeHomescreenParallaxEnabledWithBlock:](v15, "observeHomescreenParallaxEnabledWithBlock:", v12);
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector observeHomescreenZoomFactorWithBlock:](v15, "observeHomescreenZoomFactorWithBlock:", v12);
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector observeLockscreenParallaxFactorWithBlock:](v15, "observeLockscreenParallaxFactorWithBlock:", v13);
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector observeLockscreenParallaxEnabledWithBlock:](v15, "observeLockscreenParallaxEnabledWithBlock:", v13);
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector observeLockscreenZoomFactorWithBlock:](v15, "observeLockscreenZoomFactorWithBlock:", v13);
  v48[0] = v11;
  v48[1] = 3221225472;
  v48[2] = __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_8;
  v48[3] = &unk_1E6B954F0;
  v48[4] = &v66;
  -[PBUIWallpaperWindowSceneClientSettingsDiffInspector observeLiveWallpaperPlaybackStateWithBlock:](v15, "observeLiveWallpaperPlaybackStateWithBlock:", v48);
  objc_msgSend(v10, "evaluateWithInspector:context:", v15, 0);
  -[PBUIWallpaperRemoteViewController _sceneClientSettings](self, "_sceneClientSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v38 = v12;
  v39 = v10;
  v36 = v14;
  v37 = v13;
  v35 = v16;
  if (*((_BYTE *)v83 + 24))
  {
    objc_msgSend(v16, "homescreenLegibilitySettings", v32, v33);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v19 = self->_homescreenObservers;
    v20 = -[NSHashTable countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v44, v89, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v45 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v23, "wallpaperLegibilitySettingsDidChange:forVariant:", v18, 1);
        }
        v20 = -[NSHashTable countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v44, v89, 16);
      }
      while (v20);
    }

    v12 = v38;
    v10 = v39;
    v14 = v36;
    v13 = v37;
    v17 = v35;
    -[PBUIWallpaperRemoteViewController _reconfigureBlurViewsForVariant:](self, "_reconfigureBlurViewsForVariant:", 1);

  }
  if (*((_BYTE *)v79 + 24))
  {
    objc_msgSend(v17, "lockscreenLegibilitySettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v25 = self->_lockscreenObservers;
    v26 = -[NSHashTable countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v40, v88, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v41 != v27)
            objc_enumerationMutation(v25);
          v29 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v29, "wallpaperLegibilitySettingsDidChange:forVariant:", v24, 0);
        }
        v26 = -[NSHashTable countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v40, v88, 16);
      }
      while (v26);
    }

    v12 = v38;
    v10 = v39;
    v14 = v36;
    v13 = v37;
    v17 = v35;
    -[PBUIWallpaperRemoteViewController _reconfigureBlurViewsForVariant:](self, "_reconfigureBlurViewsForVariant:", 0);

  }
  if (*((_BYTE *)v75 + 24) || *((_BYTE *)v71 + 24))
    -[PBUIWallpaperRemoteViewController _updateFallbackView](self, "_updateFallbackView", v32);
  if (*((_BYTE *)v63 + 24))
    -[PBUIWallpaperRemoteViewController _reconfigureBlurViewsForVariant:](self, "_reconfigureBlurViewsForVariant:", 1);
  if (*((_BYTE *)v58 + 24))
    -[PBUIWallpaperRemoteViewController _reconfigureBlurViewsForVariant:](self, "_reconfigureBlurViewsForVariant:", 0);
  if (*((_BYTE *)v67 + 24))
  {
    PBUILogCommon();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      PBUIIrisWallpaperPlaybackStateDescription(objc_msgSend(v17, "liveWallpaperPlaybackState"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v87 = v31;
      _os_log_impl(&dword_1B71C0000, v30, OS_LOG_TYPE_DEFAULT, "Live wallpaper playback state changed. Playback state: %{public}@", buf, 0xCu);

    }
    -[PBUIRemoteIrisWallpaperPlayer _setIrisPlaybackState:](self->_remoteIrisWallpaperPlayer, "_setIrisPlaybackState:", objc_msgSend(v17, "liveWallpaperPlaybackState"));
  }

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v82, 8);

}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_5(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_6(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_7(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __111__PBUIWallpaperRemoteViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_8(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (NSString)description
{
  return (NSString *)-[PBUIWallpaperRemoteViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperRemoteViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  PBUIWallpaperRemoteViewController *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__PBUIWallpaperRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6B94BC8;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

id __75__PBUIWallpaperRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id WeakRetained;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 976), CFSTR("scenePresenter"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 984), CFSTR("reconnectPolicy"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 992), "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:objectTransformer:", v5, CFSTR("lockscreenObservers"), 1, &__block_literal_global_106);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1000), "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendArraySection:withName:skipIfEmpty:objectTransformer:", v7, CFSTR("homescreenObservers"), 1, &__block_literal_global_109);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1008), "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendArraySection:withName:skipIfEmpty:", v9, CFSTR("lockscreenBlurViews"), 1);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1016), "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendArraySection:withName:skipIfEmpty:", v11, CFSTR("homescreenBlurViews"), 1);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1040), "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendArraySection:withName:skipIfEmpty:", v13, CFSTR("disallowRasterizationReasonsLockVariant"), 1);

  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendArraySection:withName:skipIfEmpty:", v15, CFSTR("disallowRasterizationReasonsHomeVariant"), 1);

  v16 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1056), "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendArraySection:withName:skipIfEmpty:", v17, CFSTR("hideWallpaperReasonsLockVariant"), 1);

  v18 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1048), "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendArraySection:withName:skipIfEmpty:", v19, CFSTR("hideWallpaperReasonsHomeVariant"), 1);

  v20 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1064), "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendArraySection:withName:skipIfEmpty:", v21, CFSTR("wallpaperAnimationSuspendedReasons"), 1);

  v22 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1072), "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendArraySection:withName:skipIfEmpty:", v23, CFSTR("wallpaperRequiredReasons"), 1);

  v24 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1080), "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "appendArraySection:withName:skipIfEmpty:", v25, CFSTR("homescreenChangesDelayedReasons"), 1);

  v26 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1088), "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "appendArraySection:withName:skipIfEmpty:", v27, CFSTR("scaleAssertions"), 1);

  v28 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1096), "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "appendArraySection:withName:skipIfEmpty:", v29, CFSTR("sceneModeAssertions"), 1);

  v30 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1104), "allObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendArraySection:withName:skipIfEmpty:", v31, CFSTR("externalSceneModeAssertionActions"), 1);

  v32 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1112), CFSTR("sceneModeAssertionForViewMode"));
  v33 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1128), CFSTR("scenePresentationView"));
  v34 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1136), CFSTR("missingEffectViewImages"), 1);
  v35 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1144), "allObjects");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "appendArraySection:withName:skipIfEmpty:", v36, CFSTR("pendingEffectViewImageSlots"), 1);

  v37 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1152), CFSTR("eventQueue"));
  v38 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1160), CFSTR("remoteIrisWallpaperPlayer"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1176), CFSTR("cachingIdentifier"));
  v39 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D01748], "succinctDescriptionForObject:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1184));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (id)objc_msgSend(v39, "appendObject:withName:", v40, CFSTR("wallpaperConfigurationManager"));

  v42 = (void *)MEMORY[0x1E0D01748];
  v43 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1192));
  objc_msgSend(v42, "succinctDescriptionForObject:", WeakRetained);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (id)objc_msgSend(v43, "appendObject:withName:", v45, CFSTR("wallpaperPresentingDelegate"));

  v47 = *(void **)(a1 + 32);
  PBUIStringForWallpaperVariant(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1200));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "appendString:withName:", v48, CFSTR("activeVariant"));

  v49 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1120), CFSTR("sceneDeactivationTimer"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 968), CFSTR("scene"));
}

uint64_t __75__PBUIWallpaperRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D01748], "succinctDescriptionForObject:", a2);
}

uint64_t __75__PBUIWallpaperRemoteViewController_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D01748], "succinctDescriptionForObject:", a2);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIWallpaperRemoteViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (void)_performWithLiveScene:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  PBUIWallpaperRemoteViewController *v12;
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D01778];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __59__PBUIWallpaperRemoteViewController__performWithLiveScene___block_invoke;
  v11 = &unk_1E6B94D08;
  v12 = self;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "eventWithName:handler:", CFSTR("Perform with live scene"), &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSEventQueue executeOrInsertEvent:atPosition:](self->_eventQueue, "executeOrInsertEvent:atPosition:", v7, 1, v8, v9, v10, v11, v12);

}

void __59__PBUIWallpaperRemoteViewController__performWithLiveScene___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "isActive"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __59__PBUIWallpaperRemoteViewController__performWithLiveScene___block_invoke_2;
    v4[3] = &unk_1E6B95578;
    v2 = *(void **)(a1 + 32);
    v3 = *(id *)(a1 + 40);
    v4[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    objc_msgSend(v2, "_setupSceneWithCompletion:", v4);

  }
}

uint64_t __59__PBUIWallpaperRemoteViewController__performWithLiveScene___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_performWithLiveScene:", *(_QWORD *)(a1 + 40));
}

- (void)_updateWallpaperSceneSettingsWithTransitionBlock:(id)a3
{
  id v4;
  FBScene *scene;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  scene = self->_scene;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__PBUIWallpaperRemoteViewController__updateWallpaperSceneSettingsWithTransitionBlock___block_invoke;
  v7[3] = &unk_1E6B955A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[FBScene updateSettingsWithTransitionBlock:](scene, "updateSettingsWithTransitionBlock:", v7);

}

id __86__PBUIWallpaperRemoteViewController__updateWallpaperSceneSettingsWithTransitionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
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

  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "isActive"))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

- (void)_updateWallpaperSceneSettingsWithBlock:(id)a3
{
  -[PBUIWallpaperRemoteViewController _updateWallpaperSceneSettingsWithBlock:postUpdateBlock:](self, "_updateWallpaperSceneSettingsWithBlock:postUpdateBlock:", a3, 0);
}

- (void)_updateWallpaperSceneSettingsWithBlock:(id)a3 postUpdateBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D01778];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__PBUIWallpaperRemoteViewController__updateWallpaperSceneSettingsWithBlock_postUpdateBlock___block_invoke;
  v12[3] = &unk_1E6B955C8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "eventWithName:handler:", CFSTR("Update scene settings"), v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSEventQueue executeOrInsertEvent:atPosition:](self->_eventQueue, "executeOrInsertEvent:atPosition:", v11, 1);

}

void __92__PBUIWallpaperRemoteViewController__updateWallpaperSceneSettingsWithBlock_postUpdateBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 968);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __92__PBUIWallpaperRemoteViewController__updateWallpaperSceneSettingsWithBlock_postUpdateBlock___block_invoke_2;
  v5[3] = &unk_1E6B95168;
  v5[1] = 3221225472;
  v6 = v2;
  objc_msgSend(v3, "updateSettingsWithBlock:", v5);
  v4 = a1[6];
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

void __92__PBUIWallpaperRemoteViewController__updateWallpaperSceneSettingsWithBlock_postUpdateBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v7 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_setupScene
{
  -[PBUIWallpaperRemoteViewController _setupSceneWithCompletion:](self, "_setupSceneWithCompletion:", 0);
}

- (void)_setupSceneWithCompletion:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  BOOL v16;

  v4 = a3;
  v5 = self->_scene != 0;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke;
  v14[3] = &unk_1E6B955F0;
  v16 = v5;
  v14[4] = self;
  v15 = v4;
  v7 = v4;
  v8 = (void *)MEMORY[0x1BCCA5978](v14);
  v9 = (void *)MEMORY[0x1E0D01778];
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_168;
  v12[3] = &unk_1E6B94D08;
  v12[4] = self;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "eventWithName:handler:", CFSTR("Setup scene"), v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSEventQueue executeOrInsertEvent:atPosition:](self->_eventQueue, "executeOrInsertEvent:atPosition:", v11, 1);

}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PBUILogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1B71C0000, v6, OS_LOG_TYPE_DEFAULT, "Scene setup completed. Success: %{BOOL}u Error: %{public}@", (uint8_t *)v9, 0x12u);
  }

  if ((_DWORD)a2)
  {
    if (!*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "_notifyAllObserversOfNewWallpaperScene");
      objc_msgSend(*(id *)(a1 + 32), "_updateFallbackView");
    }
    v7 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v7 + 1136))
    {
      if (!objc_msgSend(*(id *)(v7 + 1144), "count"))
        goto LABEL_10;
      v7 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v7 + 1136) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 32), "_reconfigureBlurViewsForVariant:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_reconfigureBlurViewsForVariant:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_updateBlurViewsForVariant:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_updateBlurViewsForVariant:", 0);
  }
LABEL_10:
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);

}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_168(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 968))
  {
    PBUILogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968);
      *(_DWORD *)buf = 138543362;
      v31 = v3;
      _os_log_impl(&dword_1B71C0000, v2, OS_LOG_TYPE_DEFAULT, "Activating existing wallpaper scene %{public}@", buf, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 968);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_169;
    v29[3] = &unk_1E6B95618;
    v29[4] = v5;
    objc_msgSend(v6, "performUpdate:withCompletion:", v29, v4);
  }
  else
  {
    if (_PBUIWallpaperRemoteViewControllerSceneWorkspace_onceToken != -1)
      dispatch_once(&_PBUIWallpaperRemoteViewControllerSceneWorkspace_onceToken, &__block_literal_global_668);
    v7 = (id)_PBUIWallpaperRemoteViewControllerSceneWorkspace_workspace;
    objc_msgSend(v7, "createScene:", &__block_literal_global_172);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 968);
    *(_QWORD *)(v9 + 968) = v8;

    PBUILogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968);
      *(_DWORD *)buf = 138543362;
      v31 = v12;
      _os_log_impl(&dword_1B71C0000, v11, OS_LOG_TYPE_DEFAULT, "Created new wallpaper scene %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "layerManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:", *(_QWORD *)(a1 + 32));

    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 968);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_180;
    v28[3] = &unk_1E6B956E8;
    v28[4] = v14;
    objc_msgSend(v15, "configureParameters:", v28);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "uiPresentationManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = PBUIWallpaperWorkspaceIdentifier_block_invoke_sequenceNumber++;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PBUIWallpaperRemoteViewController-%ld"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "createPresenterWithIdentifier:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v20 + 976);
    *(_QWORD *)(v20 + 976) = v19;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "modifyPresentationContext:", &__block_literal_global_190);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "activate");
    PBUILogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B71C0000, v22, OS_LOG_TYPE_DEFAULT, "Installing live scene view on scene setup", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "presentationView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    objc_msgSend(v23, "setFrame:");
    objc_msgSend(v23, "setAutoresizingMask:", 18);
    objc_msgSend(v24, "setClipsToBounds:", 1);
    objc_msgSend(v24, "addSubview:", v23);
    objc_msgSend(v24, "sendSubviewToBack:", v23);
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(void **)(v25 + 1128);
    *(_QWORD *)(v25 + 1128) = v23;
    v27 = v23;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "performUpdate:withCompletion:", &__block_literal_global_192, *(_QWORD *)(a1 + 40));
  }
}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_169(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_modifySceneSettings:forSceneMode:", v3, objc_msgSend(v2, "_effectiveSceneMode"));

}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0D87D80];
  v3 = a2;
  objc_msgSend(v2, "identityForAngelJobLabel:", CFSTR("com.apple.PaperBoard"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", CFSTR("sceneID:com.apple.PaperBoard-wallpaper"));
  +[FBSSceneSpecification specification](PBUIWallpaperWindowSceneSpecification, "specification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSpecification:", v4);

  objc_msgSend(MEMORY[0x1E0D22948], "identityForProcessIdentity:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientIdentity:", v5);

}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_180(uint64_t a1, void *a2)
{
  id v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_2_181;
  v3[3] = &unk_1E6B95680;
  v3[4] = *(_QWORD *)(a1 + 32);
  v2 = a2;
  objc_msgSend(v2, "updateSettingsWithBlock:", v3);
  objc_msgSend(v2, "updateClientSettingsWithBlock:", &__block_literal_global_184);

}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_2_181(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = objc_opt_class();
  v14 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v14;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1192));
  v9 = WeakRetained;
  if (WeakRetained)
    v7 = objc_msgSend(WeakRetained, "wallpaperPresenter:requestsOrientationWithRefresh:", *(_QWORD *)(a1 + 32), 1);
  objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(v6, "setInterfaceOrientation:", v7);
  objc_msgSend(v6, "setDisplayConfiguration:", v10);
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInterfaceStyle:", objc_msgSend(v11, "userInterfaceStyle"));

  objc_msgSend(*(id *)(a1 + 32), "_modifySceneSettings:forSceneMode:", v6, 3);
  objc_msgSend(v6, "setWallpaperVariant:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1200));
  objc_msgSend(v6, "setHomescreenWallpaperAlpha:", 1.0);
  objc_msgSend(v6, "setLockscreenWallpaperAlpha:", 1.0);
  objc_msgSend(v6, "setLockscreenOnlyWallpaperAlpha:", 1.0);
  objc_msgSend(v6, "setLockscreenWallpaperContentsRect:", 0.0, 0.0, 1.0, 1.0);
  objc_msgSend(v6, "setCachingIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176));
  v12 = (void *)objc_opt_new();
  objc_msgSend(v6, "setHomescreenStyleTransitionState:", v12);

  v13 = (void *)objc_opt_new();
  objc_msgSend(v6, "setLockscreenStyleTransitionState:", v13);

}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v6 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v6;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "setHomescreenMinimumWallpaperScale:", 1.0);
  objc_msgSend(v5, "setLockscreenMinimumWallpaperScale:", 1.0);

}

void __63__PBUIWallpaperRemoteViewController__setupSceneWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setClippingDisabled:", 1);
  objc_msgSend(v2, "setPresentedLayerTypes:", 26);
  objc_msgSend(v2, "setAppearanceStyle:", 2);

}

- (id)_sceneSettings
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[FBScene settings](self->_scene, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (id)_sceneClientSettings
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[FBScene clientSettings](self->_scene, "clientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)_updateFallbackView
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = -[PBUIWallpaperRemoteViewController activeVariant](self, "activeVariant");
  if (v3 >= 2)
  {
    if (v3 != -1)
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CEA478], "systemTealColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PBUIWallpaperRemoteViewController averageColorForVariant:](self, "averageColorForVariant:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (id)v4;
LABEL_7:
  -[PBUIWallpaperRemoteViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)_notifyAllObserversOfNewWallpaperScene
{
  void *v3;
  void *v4;
  void *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSHashTable *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  PBUIWallpaperRemoteViewController *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[PBUIWallpaperRemoteViewController _sceneClientSettings](self, "_sceneClientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homescreenLegibilitySettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v3;
  objc_msgSend(v3, "lockscreenLegibilitySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = self;
  v6 = self->_homescreenObservers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "wallpaperWillChangeForVariant:", 1);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "wallpaperDidChangeForVariant:", 1);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "wallpaperLegibilitySettingsDidChange:forVariant:", v4, 1);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v19->_lockscreenObservers;
  v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v17, "wallpaperWillChangeForVariant:", 0);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v17, "wallpaperDidChangeForVariant:", 0);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v17, "wallpaperLegibilitySettingsDidChange:forVariant:", v5, 0);
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v14);
  }

  -[PBUIWallpaperRemoteViewController _reconfigureBlurViewsForVariant:](v19, "_reconfigureBlurViewsForVariant:", 1);
  -[PBUIWallpaperRemoteViewController _reconfigureBlurViewsForVariant:](v19, "_reconfigureBlurViewsForVariant:", 0);
  -[PBUIWallpaperRemoteViewController _updateBlurViewsForVariant:](v19, "_updateBlurViewsForVariant:", 1);
  -[PBUIWallpaperRemoteViewController _updateBlurViewsForVariant:](v19, "_updateBlurViewsForVariant:", 0);

}

- (id)_observersForVariant:(int64_t)a3
{
  int *v3;

  if (a3 == 1)
  {
    v3 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__homescreenObservers;
  }
  else
  {
    if (a3)
      return 0;
    v3 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__lockscreenObservers;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (id)_disallowRasterizationReasonsForVariant:(int64_t)a3
{
  int *v3;

  if (a3 == 1)
  {
    v3 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__disallowRasterizationReasonsHomeVariant;
  }
  else
  {
    if (a3)
      return 0;
    v3 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__disallowRasterizationReasonsLockVariant;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (id)_hideWallpaperReasonsForVariant:(int64_t)a3
{
  int *v3;

  if (a3 == 1)
  {
    v3 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__hideWallpaperReasonsHomeVariant;
  }
  else
  {
    if (a3)
      return 0;
    v3 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__hideWallpaperReasonsLockVariant;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (id)requireWallpaperRasterizationWithReason:(id)a3
{
  return 0;
}

- (id)_simpleAssertionWithReasonsSet:(id)a3 identifier:(id)a4 reason:(id)a5 updater:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id location;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v11)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperRemoteViewController.m"), 1630, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reasonsSet"));

    if (v15)
    {
LABEL_3:
      if (v12)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperRemoteViewController.m"), 1632, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

      if (v13)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperRemoteViewController.m"), 1633, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperRemoteViewController.m"), 1631, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updater"));

  if (!v12)
    goto LABEL_8;
LABEL_4:
  if (!v13)
    goto LABEL_9;
LABEL_5:
  objc_initWeak(&location, v11);
  v16 = objc_alloc(MEMORY[0x1E0D01868]);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __94__PBUIWallpaperRemoteViewController__simpleAssertionWithReasonsSet_identifier_reason_updater___block_invoke;
  v25[3] = &unk_1E6B95770;
  objc_copyWeak(&v28, &location);
  v17 = v13;
  v26 = v17;
  v18 = v15;
  v27 = v18;
  v19 = (void *)objc_msgSend(v16, "initWithIdentifier:forReason:invalidationBlock:", v12, v17, v25);
  objc_msgSend(v11, "addObject:", v17);
  (*((void (**)(id, _QWORD))v18 + 2))(v18, 0);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v19;
}

void __94__PBUIWallpaperRemoteViewController__simpleAssertionWithReasonsSet_identifier_reason_updater___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "removeObject:", *(_QWORD *)(a1 + 32));
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(WeakRetained, "count") == 0);

}

- (double)_wallpaperScaleForVariant:(int64_t)a3
{
  double v5;
  NSHashTable *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = 1.0;
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_wallpaperScaleAssertions;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    v8 = 1.0;
    v9 = 1.0;
    if (v7)
    {
      v10 = v7;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v6);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (-[PBUIWallpaperScaleAssertion variant](v13) == a3)
          {
            v14 = -[PBUIWallpaperScaleAssertion scale](v13);
            if (v14 < v9)
              v9 = v14;
            if (v14 >= v8)
              v8 = v14;
          }
        }
        v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    if (v8 <= 1.0)
      return v9;
    else
      return v8;
  }
  return v5;
}

- (void)_updateWallpaperScaleWithAnimationFactory:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  UIScenePresentation *scenePresentationView;
  CGAffineTransform v9;
  _QWORD v10[4];
  id v11[2];
  id location;

  v4 = a3;
  -[PBUIWallpaperRemoteViewController _wallpaperScaleForVariant:](self, "_wallpaperScaleForVariant:", -[PBUIWallpaperRemoteViewController activeVariant](self, "activeVariant"));
  v6 = v5;
  if (v4)
  {
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0D01908];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __79__PBUIWallpaperRemoteViewController__updateWallpaperScaleWithAnimationFactory___block_invoke;
    v10[3] = &unk_1E6B95798;
    objc_copyWeak(v11, &location);
    v11[1] = *(id *)&v6;
    objc_msgSend(v7, "animateWithFactory:actions:completion:", v4, v10, &__block_literal_global_211);
    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
  else
  {
    scenePresentationView = self->_scenePresentationView;
    CGAffineTransformMakeScale(&v9, v5, v5);
    -[UIScenePresentation setTransform:](scenePresentationView, "setTransform:", &v9);
  }

}

void __79__PBUIWallpaperRemoteViewController__updateWallpaperScaleWithAnimationFactory___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  CGAffineTransform v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 141);
    CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
    objc_msgSend(v4, "setTransform:", &v5);
  }

}

- (id)_blurViewsForVariant:(int64_t)a3
{
  int *v3;

  if (a3 == 1)
  {
    v3 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__homescreenBlurViews;
  }
  else
  {
    if (a3)
      return 0;
    v3 = &OBJC_IVAR___PBUIWallpaperRemoteViewController__lockscreenBlurViews;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (void)_reconfigureBlurViewsForVariant:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PBUIWallpaperRemoteViewController _blurViewsForVariant:](self, "_blurViewsForVariant:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "reconfigureFromProvider");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_updateBlurViewsForVariant:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PBUIWallpaperRemoteViewController _invalidateBlurCacheForVariant:](self, "_invalidateBlurCacheForVariant:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PBUIWallpaperRemoteViewController _blurViewsForVariant:](self, "_blurViewsForVariant:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "updateImageFromProviderForWallpaperMode:", 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_cacheBlurImageForVariant:(int64_t)a3 requestedStyle:(int64_t)a4 actualStyle:(int64_t)a5 traitCollection:(id)a6 image:(id)a7 imageURL:(id)a8
{
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  id *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *fakeBlurCache;
  NSObject *v21;
  int v22;
  id *v23;
  __int16 v24;
  _QWORD *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = -[PBUIFakeBlurConfiguration initWithVariant:style:traitCollection:]([PBUIFakeBlurConfiguration alloc], a3, a4, v16);

  v18 = -[PBUIFakeBlurAsset initWithActualStyle:imageURL:image:]((id *)[PBUIFakeBlurAsset alloc], (void *)a5, v14, v15);
  if (!self->_fakeBlurCache)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    fakeBlurCache = self->_fakeBlurCache;
    self->_fakeBlurCache = v19;

  }
  PBUILogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138543618;
    v23 = v18;
    v24 = 2114;
    v25 = v17;
    _os_log_impl(&dword_1B71C0000, v21, OS_LOG_TYPE_DEFAULT, "Caching asset %{public}@ for configuration %{public}@", (uint8_t *)&v22, 0x16u);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fakeBlurCache, "setObject:forKeyedSubscript:", v18, v17);
}

- (id)_cachedBlurAssetForVariant:(int64_t)a3 requestedStyle:(int64_t)a4 traitCollection:(id)a5
{
  id v8;
  _QWORD *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  __int16 v15;
  _QWORD *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = -[PBUIFakeBlurConfiguration initWithVariant:style:traitCollection:]([PBUIFakeBlurConfiguration alloc], a3, a4, v8);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_fakeBlurCache, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PBUILogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543618;
    v14 = v10;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_1B71C0000, v11, OS_LOG_TYPE_DEFAULT, "Retrieved cached asset %{public}@ for configuration %{public}@", (uint8_t *)&v13, 0x16u);
  }

  return v10;
}

- (void)_invalidateBlurCacheForVariant:(int64_t)a3
{
  NSMutableDictionary *fakeBlurCache;
  void *v5;
  NSObject *v6;
  NSMutableDictionary *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  fakeBlurCache = self->_fakeBlurCache;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__PBUIWallpaperRemoteViewController__invalidateBlurCacheForVariant___block_invoke;
  v9[3] = &__block_descriptor_40_e61_B32__0__PBUIFakeBlurConfiguration_8__PBUIFakeBlurAsset_16_B24l;
  v9[4] = a3;
  -[NSMutableDictionary keysOfEntriesPassingTest:](fakeBlurCache, "keysOfEntriesPassingTest:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBUILogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1B71C0000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating cached assets for configurations %{public}@", buf, 0xCu);
  }

  if (v5)
  {
    v7 = self->_fakeBlurCache;
    objc_msgSend(v5, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectsForKeys:](v7, "removeObjectsForKeys:", v8);

  }
}

BOOL __68__PBUIWallpaperRemoteViewController__invalidateBlurCacheForVariant___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = *(_QWORD *)(a2 + 8);
  else
    v2 = 0;
  return v2 == *(_QWORD *)(a1 + 32);
}

- (id)_blurImageFromURL:(id)a3
{
  id v3;
  void *v4;
  const __CFArray *ImagesFromData;
  const __CFArray *v6;
  const void *ValueAtIndex;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  PBUIWallpaperImage *v14;
  CFTypeRef cf;
  CFTypeRef v17;

  v3 = a3;
  PBUIWallpaperDataForFileURL(v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    cf = 0;
    v17 = 0;
    ImagesFromData = (const __CFArray *)CPBitmapCreateImagesFromData();
    if (ImagesFromData)
    {
      v6 = ImagesFromData;
      ValueAtIndex = CFArrayGetValueAtIndex(ImagesFromData, 0);
      objc_opt_class();
      objc_opt_isKindOfClass();
      v9 = (void *)MEMORY[0x1E0CEA950];
      v10 = 0;
      objc_msgSend(v9, "mainScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scale");
      v13 = v12;

      v14 = -[PBUIWallpaperImage initWithCGImage:scale:orientation:wallpaperFileURL:]([PBUIWallpaperImage alloc], "initWithCGImage:scale:orientation:wallpaperFileURL:", ValueAtIndex, 0, v3, v13);
      CFRelease(v6);
    }
    else
    {
      PBUILogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[PBUIWallpaperRemoteViewController _blurImageFromURL:].cold.1((uint64_t)v3, (uint64_t *)&cf, v8);

      v14 = 0;
    }
    if (cf)
      CFRelease(cf);
    if (v17)
      CFRelease(v17);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (int64_t)_effectiveSceneMode
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
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
  v2 = self->_sceneModeAssertions;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "sceneMode", (_QWORD)v10);
        if (v5 <= v8)
          v5 = v8;
      }
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_modifySceneSettings:(id)a3 forSceneMode:(int64_t)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PBUILogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 > 3)
      v7 = 0;
    else
      v7 = (uint64_t)*(&off_1E6B959A8 + a4);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1B71C0000, v6, OS_LOG_TYPE_DEFAULT, "Modifying scene settings for scene mode %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if ((unint64_t)a4 <= 3)
  {
    objc_msgSend(v5, "setActivityMode:", (char)(0xFFFF00u >> (8 * a4)));
    objc_msgSend(v5, "setForeground:", (0xCu >> (a4 & 0xF)) & 1);
  }

}

- (void)_scheduleSceneDeactivation
{
  void *v3;
  NSTimer *v4;
  NSTimer *sceneDeactivationTimer;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__PBUIWallpaperRemoteViewController__scheduleSceneDeactivation__block_invoke;
  v6[3] = &unk_1E6B95820;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, 5.0);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  sceneDeactivationTimer = self->_sceneDeactivationTimer;
  self->_sceneDeactivationTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __63__PBUIWallpaperRemoteViewController__scheduleSceneDeactivation__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;
  id v4;
  __int16 v5[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (!objc_msgSend(WeakRetained, "_effectiveSceneMode"))
    {
      PBUILogCommon();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v5[0] = 0;
        _os_log_impl(&dword_1B71C0000, v3, OS_LOG_TYPE_DEFAULT, "Deactivating idle wallpaper scene due to inactivity.", (uint8_t *)v5, 2u);
      }

      objc_msgSend(v2[121], "deactivateWithTransitionContext:", 0);
    }
    v4 = v2[140];
    v2[140] = 0;

  }
}

- (void)_cancelSceneDeactivation
{
  NSTimer *sceneDeactivationTimer;

  -[NSTimer invalidate](self->_sceneDeactivationTimer, "invalidate");
  sceneDeactivationTimer = self->_sceneDeactivationTimer;
  self->_sceneDeactivationTimer = 0;

}

- (void)_updateSceneMode
{
  -[PBUIWallpaperRemoteViewController _updateSceneModeWithCompletion:](self, "_updateSceneModeWithCompletion:", 0);
}

- (void)_updateSceneModeWithCompletion:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  void *v7;
  BSEventQueue *eventQueue;
  void *v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v4 = a3;
  v5 = -[PBUIWallpaperRemoteViewController _effectiveSceneMode](self, "_effectiveSceneMode");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__PBUIWallpaperRemoteViewController__updateSceneModeWithCompletion___block_invoke;
  v10[3] = &unk_1E6B95870;
  v10[4] = self;
  v12 = v5;
  v6 = v4;
  v11 = v6;
  v7 = (void *)MEMORY[0x1BCCA5978](v10);
  if ((unint64_t)(v5 - 1) >= 3)
  {
    if (!v5)
    {
      eventQueue = self->_eventQueue;
      objc_msgSend(MEMORY[0x1E0D01778], "eventWithName:handler:", CFSTR("Update scene mode to idle"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSEventQueue executeOrInsertEvent:atPosition:](eventQueue, "executeOrInsertEvent:atPosition:", v9, 1);

    }
  }
  else
  {
    -[PBUIWallpaperRemoteViewController _performWithLiveScene:](self, "_performWithLiveScene:", v7);
  }

}

void __68__PBUIWallpaperRemoteViewController__updateSceneModeWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
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

  objc_msgSend(*(id *)(a1 + 32), "_modifySceneSettings:forSceneMode:", v7, *(_QWORD *)(a1 + 48));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v10 = *(void **)(v8 + 968);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __68__PBUIWallpaperRemoteViewController__updateSceneModeWithCompletion___block_invoke_2;
  v11[3] = &unk_1E6B95848;
  v11[1] = 3221225472;
  v13 = *(_QWORD *)(a1 + 48);
  v11[4] = v8;
  v12 = v9;
  objc_msgSend(v10, "updateSettings:withTransitionContext:completion:", v7, 0, v11);

}

uint64_t __68__PBUIWallpaperRemoteViewController__updateSceneModeWithCompletion___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t result;

  v4 = a1[6];
  v5 = (void *)a1[4];
  if (v4)
    objc_msgSend(v5, "_cancelSceneDeactivation");
  else
    objc_msgSend(v5, "_scheduleSceneDeactivation");
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (id)_acquireSceneModeAssertionForReason:(id)a3 sceneMode:(int64_t)a4
{
  return -[PBUIWallpaperRemoteViewController _acquireSceneModeAssertionForReason:sceneMode:completion:](self, "_acquireSceneModeAssertionForReason:sceneMode:completion:", a3, a4, 0);
}

- (id)_acquireSceneModeAssertionForReason:(id)a3 sceneMode:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  _PBUIWallpaperRemoteViewControllerSceneModeAssertion *v10;
  _PBUIWallpaperRemoteViewControllerSceneModeAssertion *v11;
  NSHashTable *sceneModeAssertions;
  NSHashTable *v13;
  NSHashTable *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = [_PBUIWallpaperRemoteViewControllerSceneModeAssertion alloc];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __94__PBUIWallpaperRemoteViewController__acquireSceneModeAssertionForReason_sceneMode_completion___block_invoke;
  v19 = &unk_1E6B95898;
  objc_copyWeak(&v20, &location);
  v11 = -[_PBUIWallpaperRemoteViewControllerSceneModeAssertion initWithIdentifier:forReason:sceneMode:invalidationBlock:](v10, "initWithIdentifier:forReason:sceneMode:invalidationBlock:", CFSTR("PBUIWallpaperRemoteViewController.sceneMode"), v8, a4, &v16);
  sceneModeAssertions = self->_sceneModeAssertions;
  if (!sceneModeAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable", v16, v17, v18, v19);
    v13 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v14 = self->_sceneModeAssertions;
    self->_sceneModeAssertions = v13;

    sceneModeAssertions = self->_sceneModeAssertions;
  }
  -[NSHashTable addObject:](sceneModeAssertions, "addObject:", v11, v16, v17, v18, v19);
  -[PBUIWallpaperRemoteViewController _updateSceneModeWithCompletion:](self, "_updateSceneModeWithCompletion:", v9);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v11;
}

void __94__PBUIWallpaperRemoteViewController__acquireSceneModeAssertionForReason_sceneMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[137], "removeObject:", v5);
    objc_msgSend(v4, "_updateSceneMode");
  }

}

- (void)_addStateCaptureHandlers
{
  id v3;
  NSMutableSet *stateCaptureHandles;
  void *v5;
  void *v6;
  void *v7;
  NSMutableSet *v8;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  void *v12;
  void *v13;
  NSMutableSet *v14;
  void *v15;
  void *v16;
  id v17[5];
  id v18[5];
  id v19[5];
  id v20;
  id location[2];

  v3 = MEMORY[0x1E0C80D38];
  objc_initWeak(location, self);
  stateCaptureHandles = self->_stateCaptureHandles;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PBUIWallpaperRemoteViewController - %p"), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C809B0];
  v19[1] = (id)MEMORY[0x1E0C809B0];
  v19[2] = (id)3221225472;
  v19[3] = __61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke;
  v19[4] = &unk_1E6B958C0;
  objc_copyWeak(&v20, location);
  BSLogAddStateCaptureBlockWithTitle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](stateCaptureHandles, "addObject:", v7);

  v8 = self->_stateCaptureHandles;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PBUIWallpaperRemoteViewController - %p - Scene"), self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v6;
  v18[2] = (id)3221225472;
  v18[3] = __61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke_2;
  v18[4] = &unk_1E6B958C0;
  objc_copyWeak(v19, location);
  BSLogAddStateCaptureBlockWithTitle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](v8, "addObject:", v10);

  v11 = self->_stateCaptureHandles;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PBUIWallpaperRemoteViewController - %p - SceneMode"), self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  v17[2] = (id)3221225472;
  v17[3] = __61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke_3;
  v17[4] = &unk_1E6B958C0;
  objc_copyWeak(v18, location);
  BSLogAddStateCaptureBlockWithTitle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](v11, "addObject:", v13);

  v14 = self->_stateCaptureHandles;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PBUIWallpaperRemoteViewController - %p - WallpaperConfigurationManager"), self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(v17, location);
  BSLogAddStateCaptureBlockWithTitle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](v14, "addObject:", v16);

  objc_destroyWeak(v17);
  objc_destroyWeak(v18);
  objc_destroyWeak(v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(location);

}

__CFString *__61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "descriptionWithMultilinePrefix:", 0);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E6B97EB0;
  v4 = v2;

  return v4;
}

__CFString *__61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  __CFString *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[121], "debugDescription");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E6B97EB0;
  }

  return v3;
}

__CFString *__61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  v3 = &stru_1E6B97EB0;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[137], "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_map:", &__block_literal_global_237);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (__CFString *)v5;
    else
      v7 = &stru_1E6B97EB0;
    v3 = v7;

  }
  return v3;
}

uint64_t __61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

__CFString *__61__PBUIWallpaperRemoteViewController__addStateCaptureHandlers__block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  __CFString *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[148], "description");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E6B97EB0;
  }

  return v3;
}

- (NSString)cachingIdentifier
{
  return self->_cachingIdentifier;
}

- (PBUIWallpaperConfigurationManager)wallpaperConfigurationManager
{
  return self->_wallpaperConfigurationManager;
}

- (PBUIWallpaperPresentingDelegate)wallpaperPresentingDelegate
{
  return (PBUIWallpaperPresentingDelegate *)objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
}

- (void)setWallpaperPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_wallpaperPresentingDelegate, a3);
}

- (int64_t)activeVariant
{
  return self->_activeVariant;
}

- (PBUIWallpaperReachabilityCoordinating)reachabilityCoordinator
{
  return self->_reachabilityCoordinator;
}

- (void)setReachabilityCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityCoordinator, 0);
  objc_destroyWeak((id *)&self->_wallpaperPresentingDelegate);
  objc_storeStrong((id *)&self->_wallpaperConfigurationManager, 0);
  objc_storeStrong((id *)&self->_cachingIdentifier, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandles, 0);
  objc_storeStrong((id *)&self->_remoteIrisWallpaperPlayer, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_pendingEffectViewImageSlots, 0);
  objc_storeStrong((id *)&self->_scenePresentationView, 0);
  objc_storeStrong((id *)&self->_sceneDeactivationTimer, 0);
  objc_storeStrong((id *)&self->_sceneModeAssertionForViewAppeared, 0);
  objc_storeStrong((id *)&self->_externalSceneModeAssertionActions, 0);
  objc_storeStrong((id *)&self->_sceneModeAssertions, 0);
  objc_storeStrong((id *)&self->_wallpaperScaleAssertions, 0);
  objc_storeStrong((id *)&self->_homescreenChangesDelayedReasons, 0);
  objc_storeStrong((id *)&self->_wallpaperRequiredReasons, 0);
  objc_storeStrong((id *)&self->_wallpaperAnimationSuspendedReasons, 0);
  objc_storeStrong((id *)&self->_hideWallpaperReasonsLockVariant, 0);
  objc_storeStrong((id *)&self->_hideWallpaperReasonsHomeVariant, 0);
  objc_storeStrong((id *)&self->_disallowRasterizationReasonsLockVariant, 0);
  objc_storeStrong((id *)&self->_disallowRasterizationReasonsHomeVariant, 0);
  objc_storeStrong((id *)&self->_fakeBlurCache, 0);
  objc_storeStrong((id *)&self->_homescreenBlurViews, 0);
  objc_storeStrong((id *)&self->_lockscreenBlurViews, 0);
  objc_storeStrong((id *)&self->_homescreenObservers, 0);
  objc_storeStrong((id *)&self->_lockscreenObservers, 0);
  objc_storeStrong((id *)&self->_reconnectPolicy, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

void __84__PBUIWallpaperRemoteViewController_imageForWallpaperStyle_variant_traitCollection___block_invoke_47_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1B71C0000, a2, OS_LOG_TYPE_ERROR, "Did not receive response for image request %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)_blurImageFromURL:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_1B71C0000, log, OS_LOG_TYPE_ERROR, "Error deserializing wallpaper image from URL %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
