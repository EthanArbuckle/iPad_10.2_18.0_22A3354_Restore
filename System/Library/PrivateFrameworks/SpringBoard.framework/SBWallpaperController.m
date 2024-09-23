@implementation SBWallpaperController

- (id)requireWallpaperWithReason:(id)a3
{
  return (id)-[PBUIWallpaperPresenting_Staged requireWallpaperWithReason:](self->_wallpaperPresenter, "requireWallpaperWithReason:", a3);
}

- (double)effectiveReachabilityYOffset
{
  void *v2;
  double v3;
  double v4;

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveReachabilityYOffset");
  v4 = v3;

  return v4;
}

- (BOOL)isWindowIgnoredForReachability:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ignoredWindows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  return v6;
}

void __114__SBWallpaperController_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;

  v5 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v6 = v5;
  if ((objc_msgSend(v5, "isTranslucent") & 1) != 0 || objc_msgSend(v6, "wantsEnhancedWindowingEnabled"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }

}

- (void)deactivateOrientationSource:(int64_t)a3
{
  uint64_t v5;
  NSMutableSet *activeOrientationSources;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  int v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = -[NSMutableSet count](self->_activeOrientationSources, "count");
  activeOrientationSources = self->_activeOrientationSources;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](activeOrientationSources, "removeObject:", v7);

  BKLogOrientationGlobal();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 3)
      v9 = 0;
    else
      v9 = off_1E8EAD398[a3];
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Deactivating wallpaper orientation source %{public}@", (uint8_t *)&v10, 0xCu);
  }

  if (v5 != -[NSMutableSet count](self->_activeOrientationSources, "count"))
    -[SBWallpaperController updateOrientationAfterSourceChange](self, "updateOrientationAfterSourceChange");
}

- (int64_t)wallpaperPresenter:(id)a3 requestsOrientationWithRefresh:(BOOL)a4
{
  if (a4)
    -[SBWallpaperController updateOrientationAfterSourceChange](self, "updateOrientationAfterSourceChange", a3);
  return self->_orientation;
}

- (BOOL)setWallpaperStyle:(int64_t)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6
{
  return -[PBUIWallpaperPresenting_Staged setWallpaperStyle:forPriority:forVariant:withAnimationFactory:](self->_wallpaperPresenter, "setWallpaperStyle:forPriority:forVariant:withAnimationFactory:", a3, a4, a5, a6);
}

- (void)cancelInProcessAnimations
{
  -[PBUIWallpaperPresenting_Staged cancelInProcessAnimations](self->_wallpaperPresenter, "cancelInProcessAnimations");
}

- (id)requireWallpaperRasterizationWithReason:(id)a3
{
  return (id)-[PBUIWallpaperPresenting_Staged requireWallpaperRasterizationWithReason:](self->_wallpaperPresenter, "requireWallpaperRasterizationWithReason:", a3);
}

- (void)activateOrientationSource:(int64_t)a3
{
  uint64_t v5;
  NSMutableSet *activeOrientationSources;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  int v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = -[NSMutableSet count](self->_activeOrientationSources, "count");
  activeOrientationSources = self->_activeOrientationSources;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](activeOrientationSources, "addObject:", v7);

  BKLogOrientationGlobal();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 3)
      v9 = 0;
    else
      v9 = off_1E8EAD398[a3];
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Activating wallpaper orientation source %{public}@", (uint8_t *)&v10, 0xCu);
  }

  if (v5 != -[NSMutableSet count](self->_activeOrientationSources, "count"))
    -[SBWallpaperController updateOrientationAfterSourceChange](self, "updateOrientationAfterSourceChange");
}

+ (SBWallpaperController)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SBWallpaperController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___once_3 != -1)
    dispatch_once(&sharedInstance___once_3, block);
  return (SBWallpaperController *)(id)sharedInstance___controller;
}

- (id)setHomescreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  return (id)-[PBUIWallpaperPresenting_Staged setHomescreenWallpaperScale:withAnimationFactory:](self->_wallpaperPresenter, "setHomescreenWallpaperScale:withAnimationFactory:", a4, a3);
}

- (id)suspendWallpaperAnimationForReason:(id)a3
{
  return (id)-[PBUIWallpaperPresenting_Staged suspendWallpaperAnimationForReason:](self->_wallpaperPresenter, "suspendWallpaperAnimationForReason:", a3);
}

- (void)updateOrientationAfterSourceChange
{
  int64_t v3;
  int64_t v4;

  v3 = -[SBWallpaperController activeOrientationSource](self, "activeOrientationSource");
  if (-[SBWallpaperController _isAcceptingOrientationChangesFromSource:](self, "_isAcceptingOrientationChangesFromSource:", v3))
  {
    v4 = -[SBWallpaperController defaultInterfaceOrientationForSource:](self, "defaultInterfaceOrientationForSource:", v3);
    if (v4)
      -[SBWallpaperController willAnimateRotationToInterfaceOrientation:duration:](self, "willAnimateRotationToInterfaceOrientation:duration:", v4, 0.0);
  }
}

- (int64_t)activeOrientationSource
{
  NSMutableSet *v2;
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
  v2 = self->_activeOrientationSources;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "integerValue", (_QWORD)v10);
        if (v8 > v5)
          v5 = v8;
      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)defaultInterfaceOrientationForSource:(int64_t)a3
{
  NSMapTable *orientationProviders;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  orientationProviders = self->_orientationProviders;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](orientationProviders, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "interfaceOrientationForWallpaperController:", self);
  }
  else
  {
    if (a3 != 1)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (BOOL)_isAcceptingOrientationChangesFromSource:(int64_t)a3
{
  return -[SBWallpaperController activeOrientationSource](self, "activeOrientationSource") == a3;
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  int64_t orientation;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  double v12;
  UIView *v13;
  double v14;
  UIView *wallpaperContainerView;
  UIView *v16;
  void *v17;
  UIView *v18;
  double MidX;
  UIView *v20;
  CGAffineTransform v21;
  _BYTE v22[48];
  CGAffineTransform v23;
  _BYTE v24[48];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  double v28;
  uint64_t v29;
  CGRect v30;
  CGRect v31;

  v29 = *MEMORY[0x1E0C80C00];
  orientation = self->_orientation;
  BKLogOrientationGlobal();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (orientation == a3)
  {
    if (v9)
    {
      BSInterfaceOrientationDescription();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v10;
      v27 = 2048;
      v28 = a4;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Not animating wallpaper orientation to %{public}@ in %1.2f because it's already in that orientation", buf, 0x16u);

    }
  }
  else
  {
    if (v9)
    {
      BSInterfaceOrientationDescription();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v11;
      v27 = 2048;
      v28 = a4;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Animating wallpaper orientation to %{public}@ in %1.2f", buf, 0x16u);

    }
    self->_orientation = a3;
    -[SBWallpaperController cancelInProcessAnimations](self, "cancelInProcessAnimations");
    if (!-[SBWallpaperController _isTraitsArbiterWallpaperActive](self, "_isTraitsArbiterWallpaperActive")
      && objc_msgSend(MEMORY[0x1E0D65270], "supportsLandscapeWallpaperContents"))
    {
      if (-[SBWallpaperController _isMaglevActive](self, "_isMaglevActive"))
      {
        switch(a3)
        {
          case 1:
            v12 = 0.0;
            break;
          case 3:
            v12 = 1.57079633;
            break;
          case 4:
            v12 = -1.57079633;
            break;
          case 2:
            v12 = v12 + -3.14159265;
            break;
          default:
            v12 = 3.14159265;
            if (a3 != 2)
              v12 = 0.0;
            break;
        }
        wallpaperContainerView = self->_wallpaperContainerView;
        CGAffineTransformMakeRotation(&v23, v12);
        UIIntegralTransform();
        -[UIView setTransform:](wallpaperContainerView, "setTransform:", v24);
        v16 = self->_wallpaperContainerView;
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_referenceBounds");
        -[UIView setBounds:](v16, "setBounds:");

        v18 = self->_wallpaperContainerView;
        -[UIView bounds](v18, "bounds");
        MidX = CGRectGetMidX(v30);
        -[UIView bounds](self->_wallpaperContainerView, "bounds");
        -[UIView setCenter:](v18, "setCenter:", MidX, CGRectGetMidY(v31));
      }
      else
      {
        v13 = self->_wallpaperContainerView;
        switch(a3)
        {
          case 1:
            v14 = 0.0;
            break;
          case 3:
            v14 = 1.57079633;
            break;
          case 4:
            v14 = -1.57079633;
            break;
          default:
            v14 = 3.14159265;
            if (a3 != 2)
              v14 = 0.0;
            break;
        }
        CGAffineTransformMakeRotation(&v21, v14);
        UIIntegralTransform();
        -[UIView setTransform:](v13, "setTransform:", v22);
        v20 = self->_wallpaperContainerView;
        -[UIWindow bounds](self->_wallpaperWindow, "bounds");
        -[UIView setFrame:](v20, "setFrame:");
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PBUIWallpaperPresenting_Staged noteWillAnimateToInterfaceOrientation:duration:](self->_wallpaperPresenter, "noteWillAnimateToInterfaceOrientation:duration:", a3, a4);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PBUIWallpaperPresenting_Staged noteWillAnimateToInterfaceOrientation:](self->_wallpaperPresenter, "noteWillAnimateToInterfaceOrientation:", a3);
    }
  }
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  void *v9;
  uint64_t v10;
  _QWORD v11[6];
  _QWORD v12[7];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __114__SBWallpaperController_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke;
  v13[3] = &unk_1E8EAD158;
  v13[4] = &v18;
  v13[5] = &v14;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

  if (*((_BYTE *)v19 + 24))
  {
    if (!*((_BYTE *)v15 + 24))
      goto LABEL_7;
  }
  else if (self->_orientation == a3)
  {
    goto LABEL_7;
  }
  if (-[SBWallpaperController _isAcceptingOrientationChangesFromSource:](self, "_isAcceptingOrientationChangesFromSource:", 1))
  {
    -[SBWallpaperController orientationSource:willRotateToInterfaceOrientation:duration:](self, "orientationSource:willRotateToInterfaceOrientation:duration:", 1, a3, a4);
    v11[5] = a5;
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __114__SBWallpaperController_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_2;
    v12[3] = &unk_1E8E9DF00;
    v12[4] = self;
    v12[5] = a3;
    *(double *)&v12[6] = a4;
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __114__SBWallpaperController_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_3;
    v11[3] = &unk_1E8EAAB58;
    v11[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v12, v11, a4);
  }
LABEL_7:
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

- (id)legibilitySettingsForVariant:(int64_t)a3
{
  return (id)-[PBUIWallpaperLegibilityProviding legibilitySettingsForVariant:](self->_wallpaperLegibilityProvider, "legibilitySettingsForVariant:", a3);
}

- (void)addObserver:(id)a3 forVariant:(int64_t)a4
{
  -[PBUIWallpaperPresenting_Staged addObserver:forVariant:](self->_wallpaperPresenter, "addObserver:forVariant:", a3, a4);
}

- (void)addReachabilityObserver:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", v3);

}

- (id)newFakeBlurViewForVariant:(int64_t)a3 style:(int64_t)a4 transformOptions:(unint64_t)a5
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[PBUIWallpaperPresenting_Staged newFakeBlurViewForVariant:style:transformOptions:](self->_wallpaperPresenter, "newFakeBlurViewForVariant:style:transformOptions:", a3, a4, a5);
  else
    return 0;
}

void __39__SBWallpaperController_sharedInstance__block_invoke(uint64_t a1)
{
  SBWallpaperController *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_alloc_init(SBWallpaperController);
  v3 = (void *)sharedInstance___controller;
  sharedInstance___controller = (uint64_t)v2;

  +[SBWallpaperServer sharedInstance](SBWallpaperServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", sharedInstance___controller);

  +[SBWallpaperServer sharedInstance](SBWallpaperServer, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessAuthenticator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessAuthenticator:", v5);

}

+ (FBServiceClientAuthenticator)accessAuthenticator
{
  if (accessAuthenticator_onceToken != -1)
    dispatch_once(&accessAuthenticator_onceToken, &__block_literal_global_145);
  return (FBServiceClientAuthenticator *)(id)accessAuthenticator___WallpaperAuthenticator;
}

void __44__SBWallpaperController_accessAuthenticator__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:additionalCredentials:", CFSTR("com.apple.springboard.wallpaper-access"), 3);
  v1 = (void *)accessAuthenticator___WallpaperAuthenticator;
  accessAuthenticator___WallpaperAuthenticator = v0;

}

- (SBWallpaperController)initWithWindowScene:(id)a3 orientation:(int64_t)a4 variant:(int64_t)a5 wallpaperConfigurationManager:(id)a6 cachingIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  SBWallpaperController *v15;
  SBWallpaperController *v16;
  uint64_t v17;
  NSString *cachingIdentifier;
  _SBWallpaperSecureWindow *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  UIViewController *v23;
  UIViewController *rootWallpaperViewController;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  UIView *wallpaperContainerView;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  UIView *wallpaperOverlayContainerView;
  UIView *v38;
  void *v39;
  NSMutableSet *v40;
  NSMutableSet *activeOrientationSources;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  SBBootDefaultsPosterCacheProvider *v46;
  void *v47;
  int v48;
  uint64_t v49;
  PRSPosterConfigurationCacheProviding *posterCacheProvider;
  void *v51;
  SBWallpaperController *v52;
  void *v53;
  id v54;
  objc_class *v55;
  void *v56;
  uint64_t v57;
  PRSWallpaperObserver *posterBoardStateObserver;
  PRSService *v59;
  PRSService *posterBoardService;
  id v61;
  SBPosterBoardModalEditingManager *v62;
  SBPosterBoardModalEditingManager *posterBoardModalEditingManager;
  uint64_t v64;
  FCActivityManager *activityManager;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  uint64_t v70;
  PTSingleTestRecipe *migrationTestRecipe;
  void *v72;
  uint64_t v73;
  PTSingleTestRecipe *reloadTestRecipe;
  void *v75;
  SBBootDefaultsPosterCacheProvider *v77;
  void *v78;
  id v79;
  id v80;
  int64_t v81;
  id v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[4];
  id v86;
  id location;
  _QWORD v88[4];
  SBWallpaperController *v89;
  objc_super v90;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v90.receiver = self;
  v90.super_class = (Class)SBWallpaperController;
  v15 = -[SBWallpaperController init](&v90, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_23;
  v79 = v13;
  objc_storeWeak((id *)&v15->_windowScene, v12);
  v81 = a4;
  v82 = v14;
  v16->_orientation = a4;
  v16->_displayedVariant = -1;
  v17 = objc_msgSend(v14, "copy");
  cachingIdentifier = v16->_cachingIdentifier;
  v16->_cachingIdentifier = (NSString *)v17;

  objc_storeStrong((id *)&v16->_wallpaperConfigurationManager, a6);
  objc_msgSend(MEMORY[0x1E0D652B8], "rootSettings");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addKeyObserver:", v16);
  v80 = v12;
  v19 = -[_SBWallpaperSecureWindow initWithWindowScene:]([_SBWallpaperSecureWindow alloc], "initWithWindowScene:", v12);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceIdiom");

  if ((v21 & 0xFFFFFFFFFFFFFFFBLL) == 1 && _os_feature_enabled_impl())
    -[_SBWallpaperSecureWindow _setRoleHint:](v19, "_setRoleHint:", CFSTR("SBTraitsParticipantRoleWallpaper"));
  -[_SBWallpaperSecureWindow setWindowLevel:](v19, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + -3.0);
  -[SBFWindow setHidden:](v19, "setHidden:", 0);
  -[_SBWallpaperSecureWindow setUserInteractionEnabled:](v19, "setUserInteractionEnabled:", 0);
  objc_storeStrong((id *)&v16->_wallpaperWindow, v19);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBWallpaperSecureWindow setBackgroundColor:](v19, "setBackgroundColor:", v22);

  if (CSAutobahnEnabledForPlatform())
  {
    v23 = (UIViewController *)objc_alloc_init(MEMORY[0x1E0D65270]);
    -[UIViewController setWallpaperConfigurationManager:](v23, "setWallpaperConfigurationManager:", v16->_wallpaperConfigurationManager);
LABEL_9:
    -[UIViewController setReachabilityCoordinator:](v23, "setReachabilityCoordinator:", v16);
    -[UIViewController setWallpaperPresentingDelegate:](v23, "setWallpaperPresentingDelegate:", v16);
    goto LABEL_13;
  }
  if (_os_feature_enabled_impl())
  {
    v23 = (UIViewController *)objc_alloc_init(MEMORY[0x1E0D652D8]);
    -[UIViewController setWallpaperConfigurationManager:](v23, "setWallpaperConfigurationManager:", v16->_wallpaperConfigurationManager);
    -[UIViewController setCachingIdentifier:](v23, "setCachingIdentifier:", v16->_cachingIdentifier);
    goto LABEL_9;
  }
  v23 = (UIViewController *)objc_alloc_init(MEMORY[0x1E0D652F0]);
  -[UIViewController setWallpaperConfigurationManager:](v23, "setWallpaperConfigurationManager:", v16->_wallpaperConfigurationManager);
  -[UIViewController setCachingIdentifier:](v23, "setCachingIdentifier:", v14);
  -[UIViewController setReachabilityCoordinator:](v23, "setReachabilityCoordinator:", v16);
  if (!-[SBWallpaperController _isTraitsArbiterWallpaperActive](v16, "_isTraitsArbiterWallpaperActive"))
    -[UIViewController setFixedOrientation:](v23, "setFixedOrientation:", 1);
  -[UIViewController setWallpaperPresentingDelegate:](v23, "setWallpaperPresentingDelegate:", v16);
  objc_storeStrong((id *)&v16->_wallpaperViewController, v23);
LABEL_13:
  objc_storeStrong((id *)&v16->_wallpaperPresenter, v23);
  objc_storeStrong((id *)&v16->_wallpaperLegibilityProvider, v23);
  rootWallpaperViewController = v16->_rootWallpaperViewController;
  v16->_rootWallpaperViewController = v23;

  -[UIWindow setRootViewController:](v16->_wallpaperWindow, "setRootViewController:", v16->_rootWallpaperViewController);
  -[UIWindow traitCollection](v16->_wallpaperWindow, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "userInterfaceStyle");

  if (v26 == 1)
  {
    v27 = 1;
LABEL_17:
    -[PBUIWallpaperConfigurationManager setWallpaperMode:](v16->_wallpaperConfigurationManager, "setWallpaperMode:", v27);
    goto LABEL_18;
  }
  -[UIWindow traitCollection](v16->_wallpaperWindow, "traitCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "userInterfaceStyle");

  if (v29 == 2)
  {
    v27 = 2;
    goto LABEL_17;
  }
LABEL_18:
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "ignoreWindowForReachability:", v16->_wallpaperWindow);

  -[UIViewController view](v16->_rootWallpaperViewController, "view");
  v31 = objc_claimAutoreleasedReturnValue();
  wallpaperContainerView = v16->_wallpaperContainerView;
  v16->_wallpaperContainerView = (UIView *)v31;

  -[UIView layer](v16->_wallpaperContainerView, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "scale");
  objc_msgSend(v33, "setRasterizationScale:");

  -[UIView setClipsToBounds:](v16->_wallpaperContainerView, "setClipsToBounds:", 1);
  v35 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[UIWindow bounds](v16->_wallpaperWindow, "bounds");
  v36 = objc_msgSend(v35, "initWithFrame:");
  wallpaperOverlayContainerView = v16->_wallpaperOverlayContainerView;
  v16->_wallpaperOverlayContainerView = (UIView *)v36;

  v38 = v16->_wallpaperOverlayContainerView;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v38, "setBackgroundColor:", v39);

  -[UIWindow addSubview:](v16->_wallpaperWindow, "addSubview:", v16->_wallpaperOverlayContainerView);
  v40 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  activeOrientationSources = v16->_activeOrientationSources;
  v16->_activeOrientationSources = v40;

  -[SBWallpaperController setActiveVariant:](v16, "setActiveVariant:", a5);
  objc_msgSend((id)SBApp, "addActiveOrientationObserver:", v16);
  objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "registerBacklightEnvironmentSceneProvider:", v16);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObserver:selector:name:object:", v16, sel__updateScreenBlanked, CFSTR("SBBlankScreenStateChangeNotification"), 0);
  objc_msgSend(v43, "addObserver:selector:name:object:", v16, sel__motionEffectsChanged, *MEMORY[0x1E0CEC0F0], 0);
  objc_msgSend(v43, "addObserver:selector:name:object:", v16, sel__batterySaverModeChanged_, CFSTR("SBBatterySaverModeDidChangeNotification"), SBApp);
  objc_msgSend(v43, "addObserver:selector:name:object:", v16, sel__noteSignificantTimeChanged_, CFSTR("SBSignificantTimeChangedNotification"), 0);
  objc_msgSend(v43, "addObserver:selector:name:object:", v16, sel__applicationDidFinishLaunching_, *MEMORY[0x1E0CEB290], 0);
  v44 = _os_feature_enabled_impl();
  v45 = MEMORY[0x1E0C809B0];
  if (v44)
  {
    v46 = objc_alloc_init(SBBootDefaultsPosterCacheProvider);
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isSharedIPad");

    if (v48)
    {
      v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7F678]), "initWithCachingReason:", CFSTR("SharediPad"));

      v46 = (SBBootDefaultsPosterCacheProvider *)v49;
    }
    posterCacheProvider = v16->_posterCacheProvider;
    v16->_posterCacheProvider = (PRSPosterConfigurationCacheProviding *)v46;
    v77 = v46;

    v51 = (void *)objc_opt_new();
    objc_msgSend(v51, "setLocations:", 12);
    objc_msgSend(v51, "setNeedsSandboxExtensions:", 0);
    v88[0] = v45;
    v88[1] = 3221225472;
    v88[2] = __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke;
    v88[3] = &unk_1E8EAD0D0;
    v52 = v16;
    v89 = v52;
    objc_msgSend(v51, "setHandler:", v88);
    v53 = (void *)objc_opt_new();
    objc_msgSend(v53, "setLocationStateObserver:", v51);
    objc_msgSend(v53, "setQueue:", MEMORY[0x1E0C80D38]);
    v54 = objc_alloc(MEMORY[0x1E0D7F720]);
    v55 = (objc_class *)objc_opt_class();
    NSStringFromClass(v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v54, "initWithExplanation:", v56);
    posterBoardStateObserver = v52->_posterBoardStateObserver;
    v52->_posterBoardStateObserver = (PRSWallpaperObserver *)v57;

    -[PRSWallpaperObserver activateWithConfiguration:](v52->_posterBoardStateObserver, "activateWithConfiguration:", v53);
    -[SBWallpaperController _loadLastActiveConfigurations](v52, "_loadLastActiveConfigurations");
    v59 = (PRSService *)objc_alloc_init(MEMORY[0x1E0D7F710]);
    posterBoardService = v52->_posterBoardService;
    v52->_posterBoardService = v59;

    v61 = +[SBPosterBoardUpdateManager sharedInstance](SBPosterBoardUpdateManager, "sharedInstance");
  }
  v62 = objc_alloc_init(SBPosterBoardModalEditingManager);
  posterBoardModalEditingManager = v16->_posterBoardModalEditingManager;
  v16->_posterBoardModalEditingManager = v62;

  objc_msgSend(MEMORY[0x1E0D22368], "sharedActivityManager");
  v64 = objc_claimAutoreleasedReturnValue();
  activityManager = v16->_activityManager;
  v16->_activityManager = (FCActivityManager *)v64;

  -[FCActivityManager addObserver:](v16->_activityManager, "addObserver:", v16);
  objc_msgSend(MEMORY[0x1E0D652B8], "rootSettings");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "resetWallpaperOutlet");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (id)objc_msgSend(v67, "addAction:", &__block_literal_global_105_1);

  objc_initWeak(&location, v16);
  v69 = (void *)MEMORY[0x1E0D830E8];
  v85[0] = v45;
  v85[1] = 3221225472;
  v85[2] = __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke_3;
  v85[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v86, &location);
  objc_msgSend(v69, "recipeWithTitle:prepareBlock:action:cleanupBlock:", CFSTR("Run Wallpaper Migration"), 0, v85, 0);
  v70 = objc_claimAutoreleasedReturnValue();
  migrationTestRecipe = v16->_migrationTestRecipe;
  v16->_migrationTestRecipe = (PTSingleTestRecipe *)v70;

  objc_msgSend(MEMORY[0x1E0D652B8], "registerTestRecipe:", v16->_migrationTestRecipe);
  v72 = (void *)MEMORY[0x1E0D830E8];
  v83[0] = v45;
  v83[1] = 3221225472;
  v83[2] = __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke_5;
  v83[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v84, &location);
  objc_msgSend(v72, "recipeWithTitle:prepareBlock:action:cleanupBlock:", CFSTR("Reload Wallpaper"), 0, v83, 0);
  v73 = objc_claimAutoreleasedReturnValue();
  reloadTestRecipe = v16->_reloadTestRecipe;
  v16->_reloadTestRecipe = (PTSingleTestRecipe *)v73;

  objc_msgSend(MEMORY[0x1E0D652B8], "registerTestRecipe:", v16->_reloadTestRecipe);
  v16->_orientation = 0;
  -[SBWallpaperController willAnimateRotationToInterfaceOrientation:duration:](v16, "willAnimateRotationToInterfaceOrientation:duration:", v81, 0.0);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "registerObserver:", v16);
  -[SBWallpaperController profileConnectionDidReceiveEffectiveSettingsChangedNotification:userInfo:](v16, "profileConnectionDidReceiveEffectiveSettingsChangedNotification:userInfo:", v75, 0);

  objc_destroyWeak(&v84);
  objc_destroyWeak(&v86);
  objc_destroyWeak(&location);

  v13 = v79;
  v12 = v80;
  v14 = v82;
LABEL_23:

  return v16;
}

void __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "activeLock");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeHome");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:");
}

void __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke_2()
{
  void *v0;
  id v1;

  v1 = objc_alloc_init(MEMORY[0x1E0D652A0]);
  objc_msgSend(v1, "restoreDefaultWallpaperForAllVariantsAndNotify:", 0);
  +[SBPrototypeController sharedInstance](SBPrototypeController, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "restartSpringBoard");

}

void __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "wallpaperConfigurationManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performMigrationWithFailureHandler:", &__block_literal_global_111);

  objc_msgSend(WeakRetained, "_updateWallpaperForLocations:options:withCompletion:", 3, 0, 0);
}

void __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke_4()
{
  NSLog(CFSTR("Failed!"));
}

void __113__SBWallpaperController_initWithWindowScene_orientation_variant_wallpaperConfigurationManager_cachingIdentifier___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadWallpaperAndFlushCaches:completionHandler:", 1, 0);

}

- (void)_loadLastActiveConfigurations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SBWallpaperController__loadLastActiveConfigurations__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __54__SBWallpaperController__loadLastActiveConfigurations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "lastActiveLockPoster");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0D7F670], "decodeFromPersistableRepresentation:error:", v2, &v18);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v18;
    if (v3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "lastActiveHomePoster");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v17 = 0;
        objc_msgSend(MEMORY[0x1E0D7F670], "decodeFromPersistableRepresentation:error:", v5, &v17);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v17;
        SBLogWallpaper();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v6)
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v20 = v3;
            v21 = 2112;
            v22 = v6;
            _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "loaded last active lock/home posters :\nlock=%@\nhome=%@", buf, 0x16u);
          }

          v10 = v3;
          v11 = v6;
        }
        else
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
            __54__SBWallpaperController__loadLastActiveConfigurations__block_invoke_cold_2();

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setLastActiveLockPoster:", 0);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setLastActiveHomePoster:", 0);
          v10 = 0;
        }

      }
      else
      {
        SBLogWallpaper();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v3;
          _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "loaded last active lock poster : lock=%@", buf, 0xCu);
        }

        v10 = v3;
        v6 = 0;
      }

    }
    else
    {
      SBLogWallpaper();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        __54__SBWallpaperController__loadLastActiveConfigurations__block_invoke_cold_1();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setLastActiveLockPoster:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setLastActiveHomePoster:", 0);
      v6 = 0;
      v10 = 0;
    }

  }
  else
  {
    SBLogWallpaper();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "no last active lock poster found", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setLastActiveHomePoster:", 0);
    v6 = 0;
    v10 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 152), v10);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), v6);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 185) = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 186))
  {
    SBLogWallpaper();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "ignoring last active as we've already received a posters update", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_persistLastActiveLockScreenPosterConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
    objc_msgSend(*(id *)(a1 + 32), "_persistLastActiveHomeScreenPosterConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
  }
  else if (v10)
  {
    SBLogWallpaper();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "initializing to last active posters cache", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:", v10, v6);
  }

}

- (void)_persistLastActiveLockScreenPosterConfiguration:(id)a3
{
  id v5;
  void *v6;
  PRSPosterConfiguration *lastActiveLockScreenPosterConfiguration;
  PRSPosterConfiguration **p_lastActiveLockScreenPosterConfiguration;
  NSObject *v9;
  NSObject *v10;
  PRSPosterConfiguration *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  PRSPosterConfiguration *v16;
  PRSPosterConfiguration *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (self->_loadedLastActiveConfigurations)
  {
    p_lastActiveLockScreenPosterConfiguration = &self->_lastActiveLockScreenPosterConfiguration;
    lastActiveLockScreenPosterConfiguration = self->_lastActiveLockScreenPosterConfiguration;
    if (v5)
    {
      if (objc_msgSend(v5, "isEqualToPersistable:", lastActiveLockScreenPosterConfiguration))
      {
        objc_storeStrong((id *)&self->_lastActiveLockScreenPosterConfiguration, a3);
      }
      else
      {
        v18 = 0;
        objc_msgSend(v6, "persistableRepresentationWithError:", &v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v18;
        SBLogWallpaper();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v12)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v6;
            _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "cached last active lock poster : config=%@", buf, 0xCu);
          }

          -[PRSPosterConfigurationCacheProviding setLastActiveLockPoster:](self->_posterCacheProvider, "setLastActiveLockPoster:", v12);
          v16 = v6;
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[SBWallpaperController _persistLastActiveLockScreenPosterConfiguration:].cold.1();

          -[PRSPosterConfigurationCacheProviding setLastActiveLockPoster:](self->_posterCacheProvider, "setLastActiveLockPoster:", 0);
          v16 = 0;
        }
        v17 = *p_lastActiveLockScreenPosterConfiguration;
        *p_lastActiveLockScreenPosterConfiguration = v16;

      }
    }
    else if (lastActiveLockScreenPosterConfiguration)
    {
      SBLogWallpaper();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "erased last active lock poster cache", buf, 2u);
      }

      -[PRSPosterConfigurationCacheProviding setLastActiveLockPoster:](self->_posterCacheProvider, "setLastActiveLockPoster:", 0);
      v11 = self->_lastActiveLockScreenPosterConfiguration;
      self->_lastActiveLockScreenPosterConfiguration = 0;

    }
  }
  else
  {
    SBLogWallpaper();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "ignoring update to last active lock poster cache because we're not yet fully loaded", buf, 2u);
    }

  }
}

- (void)_persistLastActiveHomeScreenPosterConfiguration:(id)a3
{
  id v5;
  void *v6;
  PRSPosterConfiguration *lastActiveHomeScreenPosterConfiguration;
  PRSPosterConfiguration **p_lastActiveHomeScreenPosterConfiguration;
  NSObject *v9;
  NSObject *v10;
  PRSPosterConfiguration *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  PRSPosterConfiguration *v16;
  PRSPosterConfiguration *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (self->_loadedLastActiveConfigurations)
  {
    p_lastActiveHomeScreenPosterConfiguration = &self->_lastActiveHomeScreenPosterConfiguration;
    lastActiveHomeScreenPosterConfiguration = self->_lastActiveHomeScreenPosterConfiguration;
    if (v5)
    {
      if (objc_msgSend(v5, "isEqualToPersistable:", lastActiveHomeScreenPosterConfiguration))
      {
        objc_storeStrong((id *)&self->_lastActiveHomeScreenPosterConfiguration, a3);
      }
      else
      {
        v18 = 0;
        objc_msgSend(v6, "persistableRepresentationWithError:", &v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v18;
        SBLogWallpaper();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v12)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v6;
            _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "cached last active home poster : config=%@", buf, 0xCu);
          }

          -[PRSPosterConfigurationCacheProviding setLastActiveHomePoster:](self->_posterCacheProvider, "setLastActiveHomePoster:", v12);
          v16 = v6;
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[SBWallpaperController _persistLastActiveHomeScreenPosterConfiguration:].cold.1();

          -[PRSPosterConfigurationCacheProviding setLastActiveHomePoster:](self->_posterCacheProvider, "setLastActiveHomePoster:", 0);
          v16 = 0;
        }
        v17 = *p_lastActiveHomeScreenPosterConfiguration;
        *p_lastActiveHomeScreenPosterConfiguration = v16;

      }
    }
    else if (lastActiveHomeScreenPosterConfiguration)
    {
      SBLogWallpaper();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "erased last active home poster cache", buf, 2u);
      }

      -[PRSPosterConfigurationCacheProviding setLastActiveHomePoster:](self->_posterCacheProvider, "setLastActiveHomePoster:", 0);
      v11 = self->_lastActiveHomeScreenPosterConfiguration;
      self->_lastActiveHomeScreenPosterConfiguration = 0;

    }
  }
  else
  {
    SBLogWallpaper();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "ignoring update to last active home poster cache because we're not yet fully loaded", buf, 2u);
    }

  }
}

- (SBWallpaperController)initWithWallpaperConfigurationManager:(id)a3
{
  id v4;
  void *v5;
  SBWallpaperController *v6;

  v4 = a3;
  -[SBWallpaperController embeddedWindowScene](self, "embeddedWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBWallpaperController initWithWindowScene:orientation:variant:wallpaperConfigurationManager:cachingIdentifier:](self, "initWithWindowScene:orientation:variant:wallpaperConfigurationManager:cachingIdentifier:", v5, 1, 1, v4, CFSTR("wallpaperController"));

  return v6;
}

- (SBWallpaperController)initWithWallpaperConfigurationManager:(id)a3 cachingIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SBWallpaperController *v9;

  v6 = a4;
  v7 = a3;
  -[SBWallpaperController embeddedWindowScene](self, "embeddedWindowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBWallpaperController initWithWindowScene:orientation:variant:wallpaperConfigurationManager:cachingIdentifier:](self, "initWithWindowScene:orientation:variant:wallpaperConfigurationManager:cachingIdentifier:", v8, 1, 1, v7, v6);

  return v9;
}

- (SBWallpaperController)init
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  SBWallpaperController *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0D652A0]);
  -[SBWallpaperController embeddedWindowScene](self, "embeddedWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWallpaperController embeddedWindowScene](self, "embeddedWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBWallpaperController embeddedWindowScene](self, "embeddedWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBWallpaperController initWithWindowScene:orientation:variant:wallpaperConfigurationManager:cachingIdentifier:](self, "initWithWindowScene:orientation:variant:wallpaperConfigurationManager:cachingIdentifier:", v4, objc_msgSend(v6, "interfaceOrientation"), 1, v3, CFSTR("wallpaperController"));

  }
  else
  {
    v7 = -[SBWallpaperController initWithWindowScene:orientation:variant:wallpaperConfigurationManager:cachingIdentifier:](self, "initWithWindowScene:orientation:variant:wallpaperConfigurationManager:cachingIdentifier:", v4, 1, 1, v3, CFSTR("wallpaperController"));
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterObserver:", self);

  objc_msgSend((id)SBApp, "removeActiveOrientationObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)SBWallpaperController;
  -[SBWallpaperController dealloc](&v5, sel_dealloc);
}

- (int64_t)activeVariant
{
  return -[PBUIWallpaperPresenting_Staged activeVariant](self->_wallpaperPresenter, "activeVariant");
}

- (void)setActiveVariant:(int64_t)a3
{
  -[PBUIWallpaperPresenting_Staged setActiveVariant:](self->_wallpaperPresenter, "setActiveVariant:", a3);
}

- (void)setActiveVariant:(int64_t)a3 withOutAnimationFactory:(id)a4 inAnimationFactory:(id)a5 completion:(id)a6
{
  -[PBUIWallpaperPresenting_Staged setActiveVariant:withOutAnimationFactory:inAnimationFactory:completion:](self->_wallpaperPresenter, "setActiveVariant:withOutAnimationFactory:inAnimationFactory:completion:", a3, a4, a5, a6);
}

- (void)fetchWallpaperProminentColor:(id)a3
{
  -[PBUIWallpaperPresenting_Staged fetchWallpaperProminentColor:](self->_wallpaperPresenter, "fetchWallpaperProminentColor:", a3);
}

- (id)embeddedWindowScene
{
  void *v2;
  void *v3;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "embeddedDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateForLockScreenPosterConfiguration:(id)a3 homeScreenPosterConfiguration:(id)a4
{
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  int v39;
  id v40;
  id v41;
  id v42;

  v7 = a3;
  v8 = a4;
  self->_updatedActiveConfigurations = 1;
  v9 = BSEqualObjects();
  if ((v9 & 1) != 0)
    goto LABEL_26;
  SBLogWallpaper();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[SBWallpaperController _updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:].cold.7();
  v40 = v8;

  objc_storeStrong((id *)&self->_activeLockScreenPosterConfiguration, a3);
  -[SBWallpaperController _persistLastActiveLockScreenPosterConfiguration:](self, "_persistLastActiveLockScreenPosterConfiguration:", self->_activeLockScreenPosterConfiguration);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged setConfiguration:withAnimationSettings:](self->_wallpaperPresenter, "setConfiguration:withAnimationSettings:", v7, 0);
  objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidateBacklightScenesForProvider:", self);

  v42 = 0;
  objc_msgSend(v7, "pr_loadTitleStyleConfigurationWithError:", &v42);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v42;
  if (!v12)
  {
    SBLogWallpaper();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SBWallpaperController _updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:].cold.6();

    v12 = objc_alloc_init(MEMORY[0x1E0D7FB88]);
  }
  objc_msgSend(v7, "pr_posterProvider");
  v15 = objc_claimAutoreleasedReturnValue();
  v39 = v9;
  v37 = (void *)v15;
  v38 = a4;
  if (!v15)
  {
    SBLogWallpaper();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SBWallpaperController _updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:].cold.5();

    goto LABEL_16;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v15, 0);
  objc_msgSend(v16, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_16:
    SBLogWallpaper();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SBWallpaperController _updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:].cold.4();

    objc_msgSend(MEMORY[0x1E0D7FB88], "defaultTimeFont");
    v18 = objc_claimAutoreleasedReturnValue();
    SBLogWallpaper();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[SBWallpaperController _updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:].cold.3();

    objc_msgSend(v12, "vibrancyConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  objc_msgSend(v12, "effectiveTimeFontWithExtensionBundleURL:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "vibrancyConfigurationWithExtensionBundleURL:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
  objc_msgSend(v12, "timeNumberingSystem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "coverSheetViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "titleContentStyle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v18;
  objc_msgSend(v25, "updateFont:vibrancyConfiguration:numberingSystem:contentStyle:", v18, v19, v23, v26);

  objc_msgSend(v25, "updateFloatingLayerOrdering");
  objc_msgSend(v25, "setAlternateDateEnabled:", objc_msgSend(v12, "isAlternateDateEnabled"));
  v41 = 0;
  objc_msgSend(v7, "pr_loadConfiguredPropertiesWithError:", &v41);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v41;

  if (v27)
  {
    objc_msgSend(v27, "renderingConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDepthEffectDisabled:", objc_msgSend(v29, "isDepthEffectDisabled"));

    v30 = objc_alloc(MEMORY[0x1E0D1BC30]);
    objc_msgSend(v27, "quickActionsConfiguration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "initWithPosterActionsConfiguration:", v31);

    objc_msgSend(v25, "setQuickActionsConfiguration:", v32);
  }
  else
  {
    SBLogWallpaper();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[SBWallpaperController _updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:].cold.2();
  }

  objc_msgSend(v7, "providerBundleIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp.AegirPoster"));

  objc_msgSend(v25, "setFloatingLayerFullscreen:", v34 ^ 1u);
  v8 = v40;
  v9 = v39;
  a4 = v38;
LABEL_26:
  if ((BSEqualObjects() & 1) != 0)
    goto LABEL_32;
  SBLogWallpaper();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    -[SBWallpaperController _updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:].cold.1();

  objc_storeStrong((id *)&self->_activeHomeScreenPosterConfiguration, a4);
  -[SBWallpaperController _persistLastActiveHomeScreenPosterConfiguration:](self, "_persistLastActiveHomeScreenPosterConfiguration:", self->_activeHomeScreenPosterConfiguration);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged setAssociatedPosterConfiguration:withAnimationSettings:](self->_wallpaperPresenter, "setAssociatedPosterConfiguration:withAnimationSettings:", v8, 0);
  if (v9)
  {
LABEL_32:
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PBUIWallpaperPresenting_Staged triggerSceneUpdate](self->_wallpaperPresenter, "triggerSceneUpdate");
  }

}

- (id)acquireDuckHomeScreenWallpaperDimAssertionWithReason:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  BSDispatchQueueAssertMain();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PBUIWallpaperPresenting_Staged acquireDuckHomeScreenWallpaperDimAssertionWithReason:](self->_wallpaperPresenter, "acquireDuckHomeScreenWallpaperDimAssertionWithReason:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)noteHomeVariantStyleStateMayHaveUpdated
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged noteHomeVariantStyleStateMayHaveUpdated](self->_wallpaperPresenter, "noteHomeVariantStyleStateMayHaveUpdated");
}

- (BOOL)updateCurrentPosterWithUpdates:(id)a3 error:(id *)a4
{
  id v6;
  char v7;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = -[PBUIWallpaperPresenting_Staged updateCurrentPosterWithUpdates:error:](self->_wallpaperPresenter, "updateCurrentPosterWithUpdates:error:", v6, a4);
  else
    v7 = 0;

  return v7;
}

- (void)setHomeScreenWallpaperDimmed:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged setHomeScreenWallpaperDimmed:](self->_wallpaperPresenter, "setHomeScreenWallpaperDimmed:", v3);
}

- (BOOL)homeScreenWallpaperDimming
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[PBUIWallpaperPresenting_Staged isHomeScreenWallpaperDimmed](self->_wallpaperPresenter, "isHomeScreenWallpaperDimmed");
  else
    return 0;
}

- (PBUIHomeVariantStyleState)currentHomeVariantStyleState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  -[PBUIWallpaperPresenting_Staged currentHomeVariantStyleState](self->_wallpaperPresenter, "currentHomeVariantStyleState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PRSPosterConfigurationCacheProviding lastActiveLockPoster](self->_posterCacheProvider, "lastActiveLockPoster");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v9 = 0;
      objc_msgSend(MEMORY[0x1E0D7F670], "decodeFromPersistableRepresentation:error:", v4, &v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "pr_loadHomeScreenConfigurationWithError:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          PBUIHomeVariantStyleStateFromPRPosterHomeScreenConfiguration();
          v3 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v3 = 0;
        }

      }
      else
      {
        v3 = 0;
      }

    }
    else
    {
      v3 = 0;
    }

  }
  return (PBUIHomeVariantStyleState *)v3;
}

- (BOOL)updateIrisWallpaperForStaticMode
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[PBUIWallpaperPresenting_Staged updateIrisWallpaperForStaticMode](self->_wallpaperPresenter, "updateIrisWallpaperForStaticMode");
  else
    return 0;
}

- (void)updateIrisWallpaperForInteractiveMode
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged updateIrisWallpaperForInteractiveMode](self->_wallpaperPresenter, "updateIrisWallpaperForInteractiveMode");
}

- (void)setWindowLevel:(double)a3
{
  -[UIWindow setWindowLevel:](self->_wallpaperWindow, "setWindowLevel:", a3);
}

- (double)windowLevel
{
  double result;

  -[UIWindow windowLevel](self->_wallpaperWindow, "windowLevel");
  return result;
}

- (double)homescreenWallpaperScale
{
  double result;

  -[PBUIWallpaperPresenting_Staged homescreenWallpaperScale](self->_wallpaperPresenter, "homescreenWallpaperScale");
  return result;
}

- (double)minimumHomescreenWallpaperScale
{
  double result;

  -[PBUIWallpaperPresenting_Staged minimumHomescreenWallpaperScale](self->_wallpaperPresenter, "minimumHomescreenWallpaperScale");
  return result;
}

- (double)lockscreenWallpaperScale
{
  double result;

  -[PBUIWallpaperPresenting_Staged lockscreenWallpaperScale](self->_wallpaperPresenter, "lockscreenWallpaperScale");
  return result;
}

- (id)setLockscreenWallpaperScale:(double)a3 withAnimationFactory:(id)a4
{
  return (id)-[PBUIWallpaperPresenting_Staged setLockscreenWallpaperScale:withAnimationFactory:](self->_wallpaperPresenter, "setLockscreenWallpaperScale:withAnimationFactory:", a4, a3);
}

- (double)minimumLockscreenWallpaperScale
{
  double result;

  -[PBUIWallpaperPresenting_Staged minimumLockscreenWallpaperScale](self->_wallpaperPresenter, "minimumLockscreenWallpaperScale");
  return result;
}

- (void)setLockscreenOnlyWallpaperAlpha:(double)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged setLockscreenOnlyWallpaperAlpha:](self->_wallpaperPresenter, "setLockscreenOnlyWallpaperAlpha:", a3);
}

- ($1D129F7B4C980C50E70029647222EF17)currentHomescreenStyleTransitionState
{
  $1D129F7B4C980C50E70029647222EF17 *result;

  result = ($1D129F7B4C980C50E70029647222EF17 *)self->_wallpaperPresenter;
  if (result)
    return ($1D129F7B4C980C50E70029647222EF17 *)-[$1D129F7B4C980C50E70029647222EF17 currentHomescreenStyleTransitionState](result, "currentHomescreenStyleTransitionState");
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0.0;
  return result;
}

- (void)triggerPosterSignificantEvent
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged triggerPosterSignificantEvent](self->_wallpaperPresenter, "triggerPosterSignificantEvent");
}

- (void)triggerPosterTapEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged triggerPosterSignificantEvent](self->_wallpaperPresenter, "triggerPosterSignificantEvent");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged triggerPosterTapEvent:](self->_wallpaperPresenter, "triggerPosterTapEvent:", v4);
  -[SBWallpaperController _fetchUserTapEventsRequestedWithCompletionHandler:](self, "_fetchUserTapEventsRequestedWithCompletionHandler:", &__block_literal_global_153);

}

void __47__SBWallpaperController_triggerPosterTapEvent___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "coverSheetViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "requestIdleTimerResetForPoster");
  }
}

- (void)_fetchUserTapEventsRequestedWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  uint64_t v5;
  void (**v6)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    v6 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = -[PBUIWallpaperPresenting_Staged userTapEventsRequested](self->_wallpaperPresenter, "userTapEventsRequested");
    else
      v5 = 0;
    v6[2](v6, v5);
    v4 = v6;
  }

}

- (id)setWallpaperFloatingLayerContainerView:(id)a3 forReason:(id)a4 withAnimationFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PBUIWallpaperPresenting_Staged setWallpaperFloatingLayerContainerView:forReason:withAnimationFactory:](self->_wallpaperPresenter, "setWallpaperFloatingLayerContainerView:forReason:withAnimationFactory:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)createWallpaperFloatingViewForReason:(id)a3 ignoreReplica:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PBUIWallpaperPresenting_Staged createWallpaperFloatingViewForReason:ignoreReplica:](self->_wallpaperPresenter, "createWallpaperFloatingViewForReason:ignoreReplica:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)setWallpaperStyleTransitionState:(id *)a3 forPriority:(int64_t)a4 forVariant:(int64_t)a5 withAnimationFactory:(id)a6
{
  PBUIWallpaperPresenting_Staged *wallpaperPresenter;
  $1D129F7B4C980C50E70029647222EF17 v8;

  wallpaperPresenter = self->_wallpaperPresenter;
  v8 = *a3;
  return -[PBUIWallpaperPresenting_Staged setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:](wallpaperPresenter, "setWallpaperStyleTransitionState:forPriority:forVariant:withAnimationFactory:", &v8, a4, a5, a6);
}

- (BOOL)removeWallpaperStyleForPriority:(int64_t)a3 forVariant:(int64_t)a4 withAnimationFactory:(id)a5
{
  return -[PBUIWallpaperPresenting_Staged removeWallpaperStyleForPriority:forVariant:withAnimationFactory:](self->_wallpaperPresenter, "removeWallpaperStyleForPriority:forVariant:withAnimationFactory:", a3, a4, a5);
}

- (void)removeObserver:(id)a3 forVariant:(int64_t)a4
{
  -[PBUIWallpaperPresenting_Staged removeObserver:forVariant:](self->_wallpaperPresenter, "removeObserver:forVariant:", a3, a4);
}

- (void)updateWallpaperAnimationWithProgress:(double)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged updateWallpaperAnimationWithProgress:](self->_wallpaperPresenter, "updateWallpaperAnimationWithProgress:", a3);
}

- (void)updateWallpaperAnimationWithIconFlyInTension:(double)a3 friction:(double)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged updateWallpaperAnimationWithIconFlyInTension:friction:](self->_wallpaperPresenter, "updateWallpaperAnimationWithIconFlyInTension:friction:", a3, a4);
}

- (void)updateWallpaperAnimationWithWakeSourceIsSwipeToUnlock:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged updateWallpaperAnimationWithWakeSourceIsSwipeToUnlock:](self->_wallpaperPresenter, "updateWallpaperAnimationWithWakeSourceIsSwipeToUnlock:", v3);
}

- (BOOL)homeScreenPosterMirrorsLock
{
  PRSPosterConfiguration *activeLockScreenPosterConfiguration;
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  id v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[PBUIWallpaperPresenting_Staged homeScreenPosterMirrorsLock](self->_wallpaperPresenter, "homeScreenPosterMirrorsLock");
  activeLockScreenPosterConfiguration = self->_activeLockScreenPosterConfiguration;
  v10 = 0;
  -[PRSPosterConfiguration pr_loadHomeScreenConfigurationWithError:](activeLockScreenPosterConfiguration, "pr_loadHomeScreenConfigurationWithError:", &v10);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (!v5)
  {
    SBLogWallpaper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBWallpaperController homeScreenPosterMirrorsLock].cold.1();

    v5 = objc_alloc_init(MEMORY[0x1E0D7FB20]);
  }
  if (objc_msgSend(v5, "selectedAppearanceType"))
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    objc_msgSend(v5, "lockPosterAppearance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isLegibilityBlurEnabled") ^ 1;

  }
  return v8;
}

- (BOOL)posterHandlesWakeAnimation
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[PBUIWallpaperPresenting_Staged posterHandlesWakeAnimation](self->_wallpaperPresenter, "posterHandlesWakeAnimation");
  else
    return 0;
}

- (BOOL)posterHidesDimmingLayer
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[PBUIWallpaperPresenting_Staged posterHidesDimmingLayer](self->_wallpaperPresenter, "posterHidesDimmingLayer");
  else
    return 0;
}

- (PBUIIrisWallpaperPlaying)irisWallpaperPlayer
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PBUIWallpaperPresenting_Staged irisWallpaperPlayer](self->_wallpaperPresenter, "irisWallpaperPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (PBUIIrisWallpaperPlaying *)v3;
}

- (UIGestureRecognizer)wallpaperGestureRecognizer
{
  void *v3;
  void *v4;

  if (_os_feature_enabled_impl())
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_triggerPosterTapEvent_);
    objc_msgSend(v3, "setName:", CFSTR("WallpaperTap"));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PBUIWallpaperPresenting_Staged irisWallpaperPlayer](self->_wallpaperPresenter, "irisWallpaperPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "irisGestureRecognizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (UIGestureRecognizer *)v3;
}

- (void)setWallpaperObscured:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_wallpaperObscured != a3)
  {
    v3 = a3;
    self->_wallpaperObscured = a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PBUIWallpaperPresenting_Staged setWallpaperObscured:](self->_wallpaperPresenter, "setWallpaperObscured:", v3);
  }
}

- (id)averageColorForVariant:(int64_t)a3
{
  return (id)-[PBUIWallpaperLegibilityProviding averageColorForVariant:](self->_wallpaperLegibilityProvider, "averageColorForVariant:", a3);
}

- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4
{
  return (id)-[PBUIWallpaperLegibilityProviding averageColorInRect:forVariant:](self->_wallpaperLegibilityProvider, "averageColorInRect:forVariant:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)averageColorInRect:(CGRect)a3 forVariant:(int64_t)a4 withSmudgeRadius:(double)a5
{
  return (id)-[PBUIWallpaperLegibilityProviding averageColorInRect:forVariant:withSmudgeRadius:](self->_wallpaperLegibilityProvider, "averageColorInRect:forVariant:withSmudgeRadius:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
}

- (double)contrastInRect:(CGRect)a3 forVariant:(int64_t)a4
{
  double result;

  -[PBUIWallpaperLegibilityProviding contrastInRect:forVariant:](self->_wallpaperLegibilityProvider, "contrastInRect:forVariant:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (double)contrastForVariant:(int64_t)a3
{
  double result;

  -[PBUIWallpaperLegibilityProviding contrastForVariant:](self->_wallpaperLegibilityProvider, "contrastForVariant:", a3);
  return result;
}

- (void)setWallpaperHidden:(BOOL)a3 variant:(int64_t)a4 reason:(id)a5
{
  _BOOL8 v6;
  id v8;

  v6 = a3;
  v8 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged setWallpaperHidden:variant:reason:](self->_wallpaperPresenter, "setWallpaperHidden:variant:reason:", v6, a4, v8);

}

- (void)setExternalDisplayConfiguration:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged setExternalDisplayConfiguration:](self->_wallpaperPresenter, "setExternalDisplayConfiguration:", v4);

}

- (void)updateWallpaperForLocations:(int64_t)a3 withCompletion:(id)a4
{
  void (**v6)(void);

  v6 = (void (**)(void))a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PBUIWallpaperPresenting_Staged updateWallpaperForLocations:withCompletion:](self->_wallpaperPresenter, "updateWallpaperForLocations:withCompletion:", a3, v6);
  }
  else if (v6)
  {
    v6[2]();
  }

}

- (void)updateWallpaperForLocations:(int64_t)a3 wallpaperMode:(int64_t)a4 withCompletion:(id)a5
{
  void (**v8)(void);

  v8 = (void (**)(void))a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PBUIWallpaperPresenting_Staged updateWallpaperForLocations:wallpaperMode:withCompletion:](self->_wallpaperPresenter, "updateWallpaperForLocations:wallpaperMode:withCompletion:", a3, a4, v8);
  }
  else if (v8)
  {
    v8[2]();
  }

}

- (void)_updateWallpaperForLocations:(int64_t)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  -[SBWallpaperController updateWallpaperForLocations:withCompletion:](self, "updateWallpaperForLocations:withCompletion:", a3, a5);
}

- (void)_updateWallpaperForLocations:(int64_t)a3 options:(unint64_t)a4 wallpaperMode:(int64_t)a5 withCompletion:(id)a6
{
  -[SBWallpaperController updateWallpaperForLocations:wallpaperMode:withCompletion:](self, "updateWallpaperForLocations:wallpaperMode:withCompletion:", a3, a5, a6);
}

- (id)scenesForBacklightSession
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PBUIWallpaperPresenting_Staged scenesForBacklightSession](self->_wallpaperPresenter, "scenesForBacklightSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_window
{
  return self->_wallpaperWindow;
}

- (void)_batterySaverModeChanged:(id)a3
{
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = objc_msgSend((id)SBApp, "isBatterySaverModeActive", a3);
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Disabling dynamic wallpapers and parallax for battery saver mode", buf, 2u);
    }

    -[SBWallpaperController batterySaverAnimationAssertion](self, "batterySaverAnimationAssertion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    -[SBWallpaperController suspendWallpaperAnimationForReason:](self, "suspendWallpaperAnimationForReason:", CFSTR("SBWallpaperViewBatterySaverReason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWallpaperController setBatterySaverAnimationAssertion:](self, "setBatterySaverAnimationAssertion:", v8);

    objc_msgSend(MEMORY[0x1E0CEABB0], "_beginSuspendingMotionEffectsForReason:", CFSTR("SBWallpaperViewBatterySaverReason"));
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Re-enabling dynamic wallpapers and parallax for battery saver mode", v10, 2u);
    }

    -[SBWallpaperController batterySaverAnimationAssertion](self, "batterySaverAnimationAssertion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    -[SBWallpaperController setBatterySaverAnimationAssertion:](self, "setBatterySaverAnimationAssertion:", 0);
    objc_msgSend(MEMORY[0x1E0CEABB0], "_endSuspendingMotionEffectsForReason:", CFSTR("SBWallpaperViewBatterySaverReason"));
  }
}

- (void)_motionEffectsChanged
{
  id v2;

  -[SBWallpaperController wallpaperConfigurationManager](self, "wallpaperConfigurationManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regenerateStaticWallpaperThumbnailImages");

}

- (void)_updateScreenBlanked
{
  _BOOL8 IsBlanked;

  IsBlanked = SBScreenIsBlanked();
  -[SBWallpaperController setWallpaperHidden:variant:reason:](self, "setWallpaperHidden:variant:reason:", IsBlanked, 0, CFSTR("ScreenIsBlanked"));
  -[SBWallpaperController setWallpaperHidden:variant:reason:](self, "setWallpaperHidden:variant:reason:", IsBlanked, 1, CFSTR("ScreenIsBlanked"));
}

- (id)_wallpaperViewForVariant:(int64_t)a3
{
  return (id)-[PBUIWallpaperViewController wallpaperViewForVariant:](self->_wallpaperViewController, "wallpaperViewForVariant:", a3);
}

- (void)preheatWallpaperForVariant:(int64_t)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged preheatWallpaperForVariant:](self->_wallpaperPresenter, "preheatWallpaperForVariant:", a3);
}

- (void)_reloadWallpaperAndFlushCaches:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v6 = a4;
  SBLogWallpaper();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v8)
      -[SBWallpaperController _reloadWallpaperAndFlushCaches:completionHandler:].cold.1(v7, v9, v10, v11, v12, v13, v14, v15);

    objc_msgSend(MEMORY[0x1E0D65290], "wallpaperCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__SBWallpaperController__reloadWallpaperAndFlushCaches_completionHandler___block_invoke;
    v17[3] = &unk_1E8EA02D8;
    v17[4] = self;
    v18 = v6;
    objc_msgSend(v16, "removeEverythingWithCompletion:", v17);

  }
  else
  {
    if (v8)
      -[SBWallpaperController _reloadWallpaperAndFlushCaches:completionHandler:].cold.2(v7, v9, v10, v11, v12, v13, v14, v15);

    -[SBWallpaperController _updateWallpaperForLocations:options:withCompletion:](self, "_updateWallpaperForLocations:options:withCompletion:", 3, 0, v6);
  }

}

void __74__SBWallpaperController__reloadWallpaperAndFlushCaches_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __74__SBWallpaperController__reloadWallpaperAndFlushCaches_completionHandler___block_invoke_2;
  v2[3] = &unk_1E8EA02D8;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __74__SBWallpaperController__reloadWallpaperAndFlushCaches_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "clearCacheForVariants:", 3);
  return objc_msgSend(*(id *)(a1 + 32), "_updateWallpaperForLocations:options:withCompletion:", 3, 0, *(_QWORD *)(a1 + 40));
}

- (NSString)description
{
  return (NSString *)-[SBWallpaperController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBWallpaperController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  __CFString *v8;
  id v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BSInterfaceOrientationDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("interfaceOrientation"));

  v7 = -[SBWallpaperController activeOrientationSource](self, "activeOrientationSource");
  if (v7 > 3)
    v8 = 0;
  else
    v8 = off_1E8EAD398[v7];
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", v8, CFSTR("activeOrientationSource"));
  -[SBWallpaperController activeInterfaceOrientationSourcesDescriptions](self, "activeInterfaceOrientationSourcesDescriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v10, CFSTR("ActiveInterfaceOrientationSources"), 0);

  v11 = (id)objc_msgSend(v4, "appendObject:withName:", self->_wallpaperConfigurationManager, CFSTR("wallpaperConfigurationManager"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBWallpaperController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)activeInterfaceOrientationSourcesDescriptions
{
  id v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __CFString *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_activeOrientationSources;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "integerValue", (_QWORD)v12);
        if (v9 > 3)
          v10 = 0;
        else
          v10 = off_1E8EAD398[v9];
        objc_msgSend(v3, "addObject:", v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)wallpaperPresenter:(id)a3 didChangeWallpaperForLocations:(int64_t)a4 withConfiguration:(id)a5
{
  id v7;
  id WeakRetained;

  v7 = a5;
  -[SBWallpaperController _saveWallpaperAggdKeysForLocations:withConfiguration:](self, "_saveWallpaperAggdKeysForLocations:withConfiguration:", a4, v7);
  -[SBWallpaperController _saveWallpaperCoreAnalyticsForLocations:withConfiguration:](self, "_saveWallpaperCoreAnalyticsForLocations:withConfiguration:", a4, v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
  objc_msgSend(WeakRetained, "wallpaperPresenter:didChangeWallpaperForLocations:withConfiguration:", self, a4, v7);

}

- (void)wallpaperPresenterDidCompleteWallpaperChange:(id)a3
{
  id WeakRetained;

  PBUIPostExternalWallpaperChangeNotificationAsSystemShell();
  WeakRetained = objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
  objc_msgSend(WeakRetained, "wallpaperPresenterDidCompleteWallpaperChange:", self);

}

- (SBFWallpaperCoreAnalyticsLogger)wallpaperCoreAnalyticsLogger
{
  SBFWallpaperCoreAnalyticsLogger *wallpaperCoreAnalyticsLogger;
  SBFWallpaperCoreAnalyticsLogger *v4;
  SBFWallpaperCoreAnalyticsLogger *v5;

  wallpaperCoreAnalyticsLogger = self->_wallpaperCoreAnalyticsLogger;
  if (!wallpaperCoreAnalyticsLogger)
  {
    v4 = (SBFWallpaperCoreAnalyticsLogger *)objc_alloc_init(MEMORY[0x1E0DA9F70]);
    v5 = self->_wallpaperCoreAnalyticsLogger;
    self->_wallpaperCoreAnalyticsLogger = v4;

    wallpaperCoreAnalyticsLogger = self->_wallpaperCoreAnalyticsLogger;
  }
  return wallpaperCoreAnalyticsLogger;
}

- (void)_saveWallpaperCoreAnalyticsForLocations:(int64_t)a3 withConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(v6, "wallpaperOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "videoURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBWallpaperController wallpaperCoreAnalyticsLogger](self, "wallpaperCoreAnalyticsLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveStateOfWallpaperToCoreAnalytics:withHasVideo:hasProcedural:name:", a3, v8 != 0, 0, v10);

}

- (SBFWallpaperAggdLogger)wallpaperAggdLogger
{
  SBFWallpaperAggdLogger *wallpaperAggdLogger;
  SBFWallpaperAggdLogger *v4;
  SBFWallpaperAggdLogger *v5;

  wallpaperAggdLogger = self->_wallpaperAggdLogger;
  if (!wallpaperAggdLogger)
  {
    v4 = (SBFWallpaperAggdLogger *)objc_alloc_init(MEMORY[0x1E0DA9F68]);
    v5 = self->_wallpaperAggdLogger;
    self->_wallpaperAggdLogger = v4;

    wallpaperAggdLogger = self->_wallpaperAggdLogger;
  }
  return wallpaperAggdLogger;
}

- (void)_saveWallpaperAggdKeysForLocations:(int64_t)a3 withConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(v6, "wallpaperOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "videoURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBWallpaperController wallpaperAggdLogger](self, "wallpaperAggdLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWallpaperAggdKeysForLocations:withHasVideo:hasProcedural:name:", a3, v8 != 0, 0, v10);
  objc_msgSend(v9, "saveWallpaperAggdCurrentValues");

}

- (void)_noteSignificantTimeChanged:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBSignificantTimeChangeWasMidnight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    -[SBWallpaperController wallpaperAggdLogger](self, "wallpaperAggdLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "saveWallpaperAggdCurrentValues");

    -[SBWallpaperController wallpaperCoreAnalyticsLogger](self, "wallpaperCoreAnalyticsLogger");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendStateOfWallpaperToCoreAnalytics");

  }
}

- (void)setOrientationProvider:(id)a3 forSource:(int64_t)a4
{
  NSMapTable *orientationProviders;
  NSMapTable *v7;
  NSMapTable *v8;
  void *v9;
  id v10;

  v10 = a3;
  orientationProviders = self->_orientationProviders;
  if (!orientationProviders)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_orientationProviders;
    self->_orientationProviders = v7;

    orientationProviders = self->_orientationProviders;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](orientationProviders, "setObject:forKey:", v10, v9);

}

- (void)orientationSource:(int64_t)a3 willAnimateRotationToInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  NSObject *v9;
  __CFString *v10;
  int v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[SBWallpaperController _isAcceptingOrientationChangesFromSource:](self, "_isAcceptingOrientationChangesFromSource:"))
  {
    -[SBWallpaperController willAnimateRotationToInterfaceOrientation:duration:](self, "willAnimateRotationToInterfaceOrientation:duration:", a4, a5);
  }
  else
  {
    BKLogOrientationGlobal();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 3)
        v10 = 0;
      else
        v10 = off_1E8EAD398[a3];
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Not accepting changes from alternate orientation source: %{public}@", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)orientationSource:(int64_t)a3 didRotateFromInterfaceOrientation:(int64_t)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PBUIWallpaperPresenting_Staged noteDidRotateFromInterfaceOrientation:](self->_wallpaperPresenter, "noteDidRotateFromInterfaceOrientation:", a4);
}

- (BOOL)_isMaglevActive
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return _os_feature_enabled_impl();
  else
    return 0;
}

- (BOOL)_isTraitsArbiterWallpaperActive
{
  int v3;
  void *v4;
  uint64_t v5;

  v3 = _os_feature_enabled_impl();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      LOBYTE(v3) = !-[SBWallpaperController _isMaglevActive](self, "_isMaglevActive");
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

uint64_t __114__SBWallpaperController_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "orientationSource:willAnimateRotationToInterfaceOrientation:duration:", 1, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __114__SBWallpaperController_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "orientationSource:didRotateFromInterfaceOrientation:", 1, *(_QWORD *)(a1 + 40));
}

- (id)wallpaperView:(id)a3 wallpaperConfigurationIncludingValueTypes:(unint64_t)a4
{
  void *v5;
  void *v6;

  -[SBWallpaperController wallpaperConfigurationManager](self, "wallpaperConfigurationManager", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperConfigurationForVariant:includingValuesForTypes:", 1, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)wallpaperServer:(id)a3 fetchThumbnailDataForVariant:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v7 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__SBWallpaperController_wallpaperServer_fetchThumbnailDataForVariant_completionHandler___block_invoke;
  block[3] = &unk_1E8EA1310;
  v10 = v7;
  v11 = a4;
  block[4] = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __88__SBWallpaperController_wallpaperServer_fetchThumbnailDataForVariant_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "wallpaperConfigurationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperConfigurationForVariant:includingValuesForTypes:", *(_QWORD *)(a1 + 48), 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperThumbnailImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

}

- (void)wallpaperServer:(id)a3 fetchOriginalImageDataForVariant:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v7 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__SBWallpaperController_wallpaperServer_fetchOriginalImageDataForVariant_completionHandler___block_invoke;
  block[3] = &unk_1E8EA1310;
  v10 = v7;
  v11 = a4;
  block[4] = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __92__SBWallpaperController_wallpaperServer_fetchOriginalImageDataForVariant_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  UIImage *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "wallpaperConfigurationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wallpaperConfigurationForVariant:includingValuesForTypes:", *(_QWORD *)(a1 + 48), 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperOriginalImage");
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);

}

- (void)wallpaperServer:(id)a3 fetchOriginalVideoURLDataForVariant:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v7 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__SBWallpaperController_wallpaperServer_fetchOriginalVideoURLDataForVariant_completionHandler___block_invoke;
  block[3] = &unk_1E8EA1310;
  v10 = v7;
  v11 = a4;
  block[4] = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __95__SBWallpaperController_wallpaperServer_fetchOriginalVideoURLDataForVariant_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "wallpaperConfigurationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wallpaperConfigurationForVariant:includingValuesForTypes:", *(_QWORD *)(a1 + 48), 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalVideoURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);

}

- (void)wallpaperServer:(id)a3 fetchContentCutoutBoundsForVariant:(int64_t)a4 orientation:(int64_t)a5 completionHandler:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v7 = a6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __106__SBWallpaperController_wallpaperServer_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke;
  v9[3] = &unk_1E8EA9A80;
  v10 = v7;
  v11 = a5;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __106__SBWallpaperController_wallpaperServer_fetchContentCutoutBoundsForVariant_orientation_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0D1BB98], "normalizedContentCutoutBoundsForOrientation:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)wallpaperServer:(id)a3 fetchLockScreenContentCutoutBoundsForOrientation:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  PRSService *posterBoardService;
  _QWORD v11[4];
  id v12;

  v8 = a3;
  v9 = a5;
  if (v9 && _os_feature_enabled_impl())
  {
    posterBoardService = self->_posterBoardService;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __108__SBWallpaperController_wallpaperServer_fetchLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke;
    v11[3] = &unk_1E8EAD180;
    v12 = v9;
    -[PRSService fetchContentCutoutBoundsForActivePosterWithOrientation:completionHandler:](posterBoardService, "fetchContentCutoutBoundsForActivePosterWithOrientation:completionHandler:", a4, v11);

  }
}

uint64_t __108__SBWallpaperController_wallpaperServer_fetchLockScreenContentCutoutBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7)
{
  a4.n128_u64[0] = *MEMORY[0x1E0C9D628];
  a5.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
  a6.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
  a7.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
  if (a2 && !a3)
    objc_msgSend(a2, "bs_CGRectValue", a4.n128_f64[0], a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0]);
  return (*(uint64_t (**)(__n128, __n128, __n128, __n128))(*(_QWORD *)(a1 + 32) + 16))(a4, a5, a6, a7);
}

- (void)wallpaperServer:(id)a3 fetchLockScreenMaximalContentCutoutBoundsForOrientation:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  PRSService *posterBoardService;
  _QWORD v11[4];
  void (**v12)(_QWORD);

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      posterBoardService = self->_posterBoardService;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __115__SBWallpaperController_wallpaperServer_fetchLockScreenMaximalContentCutoutBoundsForOrientation_completionHandler___block_invoke;
      v11[3] = &unk_1E8EAD180;
      v12 = v9;
      -[PRSService fetchMaximalContentCutoutBoundsForOrientation:completionHandler:](posterBoardService, "fetchMaximalContentCutoutBoundsForOrientation:completionHandler:", a4, v11);

    }
    else
    {
      -[SBWallpaperController _screenBoundsForOrientation:](self, "_screenBoundsForOrientation:", a4);
      v9[2](v9);
    }
  }

}

uint64_t __115__SBWallpaperController_wallpaperServer_fetchLockScreenMaximalContentCutoutBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7)
{
  a4.n128_u64[0] = *MEMORY[0x1E0C9D628];
  a5.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
  a6.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
  a7.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
  if (a2 && !a3)
    objc_msgSend(a2, "bs_CGRectValue", a4.n128_f64[0], a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0]);
  return (*(uint64_t (**)(__n128, __n128, __n128, __n128))(*(_QWORD *)(a1 + 32) + 16))(a4, a5, a6, a7);
}

- (void)wallpaperServer:(id)a3 fetchObscurableBoundsForOrientation:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD, double, double, double, double);
  PRSService *posterBoardService;
  _QWORD v11[5];
  void (**v12)(_QWORD, double, double, double, double);
  int64_t v13;

  v8 = a3;
  v9 = (void (**)(_QWORD, double, double, double, double))a5;
  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      posterBoardService = self->_posterBoardService;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __95__SBWallpaperController_wallpaperServer_fetchObscurableBoundsForOrientation_completionHandler___block_invoke;
      v11[3] = &unk_1E8EAD1A8;
      v11[4] = self;
      v13 = a4;
      v12 = v9;
      -[PRSService fetchActivePosterConfiguration:](posterBoardService, "fetchActivePosterConfiguration:", v11);

    }
    else
    {
      v9[2](v9, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    }
  }

}

void __95__SBWallpaperController_wallpaperServer_fetchObscurableBoundsForOrientation_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  if (a2)
  {
    objc_msgSend(a2, "lockScreenPosterConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)a1[5];
    v5 = *(void **)(a1[4] + 128);
    v6 = a1[6];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __95__SBWallpaperController_wallpaperServer_fetchObscurableBoundsForOrientation_completionHandler___block_invoke_2;
    v7[3] = &unk_1E8EAD180;
    v8 = v4;
    objc_msgSend(v5, "fetchObscurableBoundsForPosterConfiguration:orientation:completionHandler:", v3, v6, v7);

  }
  else
  {
    (*(void (**)(double, double, double, double))(a1[5] + 16))(*MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  }
}

uint64_t __95__SBWallpaperController_wallpaperServer_fetchObscurableBoundsForOrientation_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7)
{
  a4.n128_u64[0] = *MEMORY[0x1E0C9D628];
  a5.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
  a6.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
  a7.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
  if (a2 && !a3)
    objc_msgSend(a2, "bs_CGRectValue", a4.n128_f64[0], a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0]);
  return (*(uint64_t (**)(__n128, __n128, __n128, __n128))(*(_QWORD *)(a1 + 32) + 16))(a4, a5, a6, a7);
}

- (void)wallpaperServer:(id)a3 fetchLimitedOcclusionBoundsForOrientation:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  PRSService *posterBoardService;
  _QWORD v11[5];
  id v12;
  int64_t v13;

  v8 = a3;
  v9 = a5;
  if (v9 && _os_feature_enabled_impl())
  {
    posterBoardService = self->_posterBoardService;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __101__SBWallpaperController_wallpaperServer_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke;
    v11[3] = &unk_1E8EAD1A8;
    v11[4] = self;
    v13 = a4;
    v12 = v9;
    -[PRSService fetchActivePosterConfiguration:](posterBoardService, "fetchActivePosterConfiguration:", v11);

  }
}

void __101__SBWallpaperController_wallpaperServer_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  if (a2)
  {
    objc_msgSend(a2, "lockScreenPosterConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)a1[5];
    v5 = *(void **)(a1[4] + 128);
    v6 = a1[6];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __101__SBWallpaperController_wallpaperServer_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke_2;
    v7[3] = &unk_1E8EAD180;
    v8 = v4;
    objc_msgSend(v5, "fetchLimitedOcclusionBoundsForPosterConfiguration:orientation:completionHandler:", v3, v6, v7);

  }
  else
  {
    (*(void (**)(double, double, double, double))(a1[5] + 16))(*MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  }
}

uint64_t __101__SBWallpaperController_wallpaperServer_fetchLimitedOcclusionBoundsForOrientation_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7)
{
  a4.n128_u64[0] = *MEMORY[0x1E0C9D628];
  a5.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
  a6.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
  a7.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
  if (a2 && !a3)
    objc_msgSend(a2, "bs_CGRectValue", a4.n128_f64[0], a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0]);
  return (*(uint64_t (**)(__n128, __n128, __n128, __n128))(*(_QWORD *)(a1 + 32) + 16))(a4, a5, a6, a7);
}

- (void)wallpaperServer:(id)a3 fetchLockScreenTimeBoundsForOrientation:(int64_t)a4 completionHandler:(id)a5
{
  void (**v7)(_QWORD, __n128, __n128, __n128, __n128);
  __n128 v8;
  __n128 v9;
  __n128 v10;
  __n128 v11;
  id v12;

  v12 = a3;
  v7 = (void (**)(_QWORD, __n128, __n128, __n128, __n128))a5;
  if (v7 && _os_feature_enabled_impl())
  {
    if ((unint64_t)(a4 - 1) > 1)
    {
      v8.n128_u64[0] = *MEMORY[0x1E0C9D628];
      v9.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
      v10.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
      v11.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1BCB0], "tightFrameForElements:", 1);
    }
    v7[2](v7, v8, v9, v10, v11);
  }

}

- (CGRect)_screenBoundsForOrientation:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double Height;
  double Width;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  v3 = a3 - 1;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  Height = CGRectGetHeight(v22);
  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  Width = CGRectGetWidth(v23);
  if (Height >= Width)
    v15 = Height;
  else
    v15 = Width;
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  v16 = CGRectGetHeight(v24);
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  v17 = CGRectGetWidth(v25);
  if (v16 < v17)
    v17 = v16;
  if (v3 >= 2)
    v18 = v15;
  else
    v18 = v17;
  if (v3 >= 2)
    v19 = v17;
  else
    v19 = v15;
  v20 = 0.0;
  v21 = 0.0;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)wallpaperServer:(id)a3 setWallpaperVideoWithWallpaperMode:(id)a4 cropRect:(CGRect)a5 wallpaperMode:(int64_t)a6 completionHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  SBWallpaperController *v20;
  id v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  int64_t v26;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a4;
  v15 = a7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __117__SBWallpaperController_wallpaperServer_setWallpaperVideoWithWallpaperMode_cropRect_wallpaperMode_completionHandler___block_invoke;
  v18[3] = &unk_1E8EAD1D0;
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  v19 = v14;
  v20 = self;
  v26 = a6;
  v21 = v15;
  v16 = v15;
  v17 = v14;
  dispatch_async(MEMORY[0x1E0C80D38], v18);

}

void __117__SBWallpaperController_wallpaperServer_setWallpaperVideoWithWallpaperMode_cropRect_wallpaperMode_completionHandler___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = !CGRectIsNull(*(CGRect *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "wallpaperConfigurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVideoURL:forVariant:shoudCrop:relativeCropRect:wallpaperMode:", v4, 0, v2, *(_QWORD *)(a1 + 88), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)wallpaperServer:(id)a3 setWallpaperColorName:(id)a4 forVariants:(int64_t)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v9 = a4;
  v10 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__SBWallpaperController_wallpaperServer_setWallpaperColorName_forVariants_completionHandler___block_invoke;
  v13[3] = &unk_1E8EA10F0;
  v13[4] = self;
  v14 = v9;
  v15 = v10;
  v16 = a5;
  v11 = v10;
  v12 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

uint64_t __93__SBWallpaperController_wallpaperServer_setWallpaperColorName_forVariants_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "wallpaperConfigurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWallpaperColorName:forVariants:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)wallpaperServer:(id)a3 setWallpaperColor:(id)a4 darkColor:(id)a5 forVariants:(int64_t)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  SBWallpaperController *v20;
  id v21;
  int64_t v22;

  v11 = a4;
  v12 = a5;
  v13 = a7;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__SBWallpaperController_wallpaperServer_setWallpaperColor_darkColor_forVariants_completionHandler___block_invoke;
  block[3] = &unk_1E8E9FBF0;
  v18 = v11;
  v19 = v12;
  v21 = v13;
  v22 = a6;
  v20 = self;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __99__SBWallpaperController_wallpaperServer_setWallpaperColor_darkColor_forVariants_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id v12;

  v2 = *(id *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CEA478];
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __99__SBWallpaperController_wallpaperServer_setWallpaperColor_darkColor_forVariants_completionHandler___block_invoke_2;
    v10 = &unk_1E8EAD1F8;
    v11 = v3;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v4, "colorWithDynamicProvider:", &v7);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v5;
  }
  objc_msgSend(*(id *)(a1 + 48), "wallpaperConfigurationManager", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWallpaperColor:forVariants:", v2, *(_QWORD *)(a1 + 64));

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

id __99__SBWallpaperController_wallpaperServer_setWallpaperColor_darkColor_forVariants_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "userInterfaceStyle");
  v4 = 40;
  if (v3 == 2)
    v4 = 32;
  return *(id *)(a1 + v4);
}

- (void)wallpaperServer:(id)a3 setWallpaperGradient:(id)a4 forVariants:(int64_t)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v9 = a4;
  v10 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__SBWallpaperController_wallpaperServer_setWallpaperGradient_forVariants_completionHandler___block_invoke;
  v13[3] = &unk_1E8EA10F0;
  v13[4] = self;
  v14 = v9;
  v15 = v10;
  v16 = a5;
  v11 = v10;
  v12 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

uint64_t __92__SBWallpaperController_wallpaperServer_setWallpaperGradient_forVariants_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "wallpaperConfigurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWallpaperGradient:forVariants:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)wallpaperServer:(id)a3 restoreDefaultWallpaperWithCompletionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__SBWallpaperController_wallpaperServer_restoreDefaultWallpaperWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E8EA02D8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __86__SBWallpaperController_wallpaperServer_restoreDefaultWallpaperWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "wallpaperConfigurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restoreDefaultWallpaperForAllVariantsAndNotify:", 1);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)wallpaperServer:(id)a3 triggerPosterSignificantEventCompletionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__SBWallpaperController_wallpaperServer_triggerPosterSignificantEventCompletionHandler___block_invoke;
  v7[3] = &unk_1E8EA02D8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __88__SBWallpaperController_wallpaperServer_triggerPosterSignificantEventCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "triggerPosterSignificantEvent");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)wallpaperServer:(id)a3 fetchSignificantEventsCounterForPosterWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SBWallpaperController *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__SBWallpaperController_wallpaperServer_fetchSignificantEventsCounterForPosterWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E8E9F7B8;
  v12 = v7;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __112__SBWallpaperController_wallpaperServer_fetchSignificantEventsCounterForPosterWithIdentifier_completionHandler___block_invoke(_QWORD *a1)
{
  if (a1[4] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[5] + 96), "significantEventsCounterForPosterWithIdentifier:", a1[4]);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[5] + 96), "posterSignificantEventsCounter");
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)wallpaperServer:(id)a3 handleQuickActionConfigurationRequest:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__SBWallpaperController_wallpaperServer_handleQuickActionConfigurationRequest_completionHandler___block_invoke;
  block[3] = &unk_1E8E9F7B8;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __97__SBWallpaperController_wallpaperServer_handleQuickActionConfigurationRequest_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x1E0D1BC30]);
  objc_msgSend(*(id *)(a1 + 32), "_posterQuickActionsConfigurationFromConfigurationRequest:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "initWithPosterActionsConfiguration:", v3);

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coverSheetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQuickActionsConfiguration:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)_posterQuickActionsConfigurationFromConfigurationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;

  v4 = a3;
  objc_msgSend(v4, "leadingQuickActionControlRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingQuickActionControlRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "quickActionCategory") == 3)
  {
    objc_msgSend(v5, "extensionBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "kind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWallpaperController _controlIdentityForExtensionBundleIdentifier:containerBundleIdentifier:kind:](self, "_controlIdentityForExtensionBundleIdentifier:containerBundleIdentifier:kind:", v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0D7FBA0]);
    v12 = v11;
    if (v10)
    {
      v13 = objc_msgSend(v5, "type");
      if ((unint64_t)(v13 - 1) >= 3)
        v14 = 0;
      else
        v14 = v13;
      v15 = objc_msgSend(v12, "initWithControlIdentity:type:", v10, v14);
    }
    else
    {
      v15 = objc_msgSend(v11, "initWithCategory:", 0);
    }
    v19 = (void *)v15;

  }
  else
  {
    v16 = objc_alloc(MEMORY[0x1E0D7FBA0]);
    v17 = objc_msgSend(v5, "quickActionCategory");
    if ((unint64_t)(v17 - 1) >= 3)
      v18 = 0;
    else
      v18 = v17;
    v19 = (void *)objc_msgSend(v16, "initWithCategory:", v18);
  }
  if (objc_msgSend(v6, "quickActionCategory") == 3)
  {
    objc_msgSend(v6, "extensionBundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "kind");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWallpaperController _controlIdentityForExtensionBundleIdentifier:containerBundleIdentifier:kind:](self, "_controlIdentityForExtensionBundleIdentifier:containerBundleIdentifier:kind:", v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_alloc(MEMORY[0x1E0D7FBA0]);
    v25 = v24;
    if (v23)
    {
      v26 = objc_msgSend(v6, "type");
      if ((unint64_t)(v26 - 1) >= 3)
        v27 = 0;
      else
        v27 = v26;
      v28 = objc_msgSend(v25, "initWithControlIdentity:type:", v23, v27);
    }
    else
    {
      v28 = objc_msgSend(v24, "initWithCategory:", 0);
    }
    v32 = (void *)v28;

  }
  else
  {
    v29 = objc_alloc(MEMORY[0x1E0D7FBA0]);
    v30 = objc_msgSend(v6, "quickActionCategory");
    if ((unint64_t)(v30 - 1) >= 3)
      v31 = 0;
    else
      v31 = v30;
    v32 = (void *)objc_msgSend(v29, "initWithCategory:", v31);
  }
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FB58]), "initWithLeadingControl:trailingControl:", v19, v32);

  return v33;
}

- (id)_controlIdentityForExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v29 = v7;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v7, v8, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0FFE8]), "initIncludingVisible:hidden:", 1, 1);
  v12 = objc_alloc(MEMORY[0x1E0D101C0]);
  v13 = objc_alloc_init(MEMORY[0x1E0D10180]);
  v14 = (void *)objc_msgSend(v12, "initWithWidgetsPredicate:controlsPredicate:includeIntents:", v13, v11, 1);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D101B0]), "initWithOptions:", v14);
  objc_msgSend(v15, "extensions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __101__SBWallpaperController__controlIdentityForExtensionBundleIdentifier_containerBundleIdentifier_kind___block_invoke;
  v32[3] = &unk_1E8EAD220;
  v18 = v10;
  v33 = v18;
  objc_msgSend(v16, "bs_firstObjectPassingTest:", v32);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "orderedControlDescriptors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v17;
  v30[1] = 3221225472;
  v30[2] = __101__SBWallpaperController__controlIdentityForExtensionBundleIdentifier_containerBundleIdentifier_kind___block_invoke_2;
  v30[3] = &unk_1E8EAD248;
  v21 = v9;
  v31 = v21;
  objc_msgSend(v20, "bs_firstObjectPassingTest:", v30);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_alloc(MEMORY[0x1E0D10000]);
    objc_msgSend(v22, "defaultIntentReference");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithExtensionIdentity:kind:intentReference:", v18, v21, v24);

    v26 = v29;
  }
  else
  {
    SBLogWallpaper();
    v27 = objc_claimAutoreleasedReturnValue();
    v26 = v29;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v35 = v29;
      v36 = 2112;
      v37 = v8;
      v38 = 2112;
      v39 = v21;
      _os_log_error_impl(&dword_1D0540000, v27, OS_LOG_TYPE_ERROR, "Could not find CHSControlIdentity for extensionBundleIdentifier:%@ containerBundleIdentifier:%@ kind:%@", buf, 0x20u);
    }

    v25 = 0;
  }

  return v25;
}

uint64_t __101__SBWallpaperController__controlIdentityForExtensionBundleIdentifier_containerBundleIdentifier_kind___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __101__SBWallpaperController__controlIdentityForExtensionBundleIdentifier_containerBundleIdentifier_kind___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)activeActivityDidChangeForManager:(id)a3
{
  PRSService *posterBoardService;
  void *v4;
  id v5;

  if (self->_activityManager == a3)
  {
    posterBoardService = self->_posterBoardService;
    objc_msgSend(a3, "activeActivity");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityUniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSService notifyFocusModeDidChange:completion:](posterBoardService, "notifyFocusModeDidChange:completion:", v4, &__block_literal_global_242);

  }
}

void __59__SBWallpaperController_activeActivityDidChangeForManager___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59__SBWallpaperController_activeActivityDidChangeForManager___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Successfully notified PRS of new focus mode.", v5, 2u);
  }

}

- (void)availableActivitiesDidChangeForManager:(id)a3
{
  void *v4;
  id v5;

  if (self->_activityManager == a3)
  {
    objc_msgSend(a3, "availableActivities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_map:", &__block_literal_global_244);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[PRSService notifyAvailableFocusModesDidChange:completion:](self->_posterBoardService, "notifyAvailableFocusModesDidChange:completion:", v5, &__block_literal_global_245);
  }
}

uint64_t __64__SBWallpaperController_availableActivitiesDidChangeForManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activityUniqueIdentifier");
}

void __64__SBWallpaperController_availableActivitiesDidChangeForManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __64__SBWallpaperController_availableActivitiesDidChangeForManager___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Successfully notified PRS that available focus modes changed.", v5, 2u);
  }

}

- (void)removeReachabilityObserver:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", v3);

}

- (void)addWallpaperOverlay:(id)a3
{
  -[UIView addSubview:](self->_wallpaperOverlayContainerView, "addSubview:", a3);
}

- (void)removeWallpaperOverlay:(id)a3
{
  objc_msgSend(a3, "removeFromSuperview");
}

- (void)updatePosterSwitcherSnapshots
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  SBWallpaperController *v20;
  double v21;

  -[SBWallpaperController scenesForBacklightSession](self, "scenesForBacklightSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshotContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;
  if (v12 == 0.0)
  {
    objc_msgSend(v9, "scale");
    v13 = v14;
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke;
  v17[3] = &unk_1E8EAD378;
  v18 = v4;
  v19 = v10;
  v20 = self;
  v21 = v13;
  v15 = v10;
  v16 = v4;
  objc_msgSend(v16, "prui_snapshotSceneWithOptions:traitCollection:completion:", 24, v15, v17);

}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_249;
    v9[3] = &unk_1E8EAD350;
    v6 = v4;
    v7 = *(_QWORD *)(a1 + 48);
    v10 = v6;
    v11 = v7;
    v12 = v3;
    v14 = *(_QWORD *)(a1 + 56);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v6, "prui_snapshotSceneWithOptions:traitCollection:completion:", 32, v5, v9);

  }
  else
  {
    SBLogDashBoard();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_cold_1(v8);

    objc_msgSend(*(id *)(a1 + 32), "prui_restoreSceneAfterSnapshottingWithCompletion:", &__block_literal_global_248);
  }

}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_246(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    SBLogDashBoard();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_246_cold_1();

  }
}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_249(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = a2;
  if (!v3)
  {
    SBLogDashBoard();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Scene did not provide floating layer snapshot for poster switcher.", v8, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "prui_restoreSceneAfterSnapshottingWithCompletion:", &__block_literal_global_251);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "IOSurface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "IOSurface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ingestPrimaryWallpaperLayersSnapshotIOSurface:floatingWallpaperLayerSnapshotIOSurface:snapshotScale:traitCollection:withCompletion:", v6, v7, *(_QWORD *)(a1 + 56), &__block_literal_global_253, *(double *)(a1 + 64));

}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_250(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    SBLogDashBoard();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_250_cold_1();

  }
}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_252(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    SBLogDashBoard();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_252_cold_1();

  }
}

- (void)_ingestPrimaryWallpaperLayersSnapshotIOSurface:(id)a3 floatingWallpaperLayerSnapshotIOSurface:(id)a4 snapshotScale:(double)a5 traitCollection:(id)a6 withCompletion:(id)a7
{
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  PRSService *posterBoardService;
  PRSPosterConfiguration *activeLockScreenPosterConfiguration;
  id v25;
  _QWORD v26[4];
  id v27;

  v12 = a7;
  v13 = (objc_class *)MEMORY[0x1E0D7F6A0];
  v14 = a6;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend([v13 alloc], "initWithIOSurface:", v16);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F6A0]), "initWithIOSurface:", v15);
  v19 = objc_alloc(MEMORY[0x1E0D7F6A8]);
  v20 = objc_msgSend(v14, "prs_interfaceStyle");
  v21 = objc_msgSend(v14, "prs_accessibilityContrast");

  v22 = (void *)objc_msgSend(v19, "initWithPrimaryLayersSnapshot:floatingLayerSnapshot:snapshotScale:interfaceStyle:accessibilityContrast:", v17, v18, v20, v21, a5);
  posterBoardService = self->_posterBoardService;
  activeLockScreenPosterConfiguration = self->_activeLockScreenPosterConfiguration;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __157__SBWallpaperController__ingestPrimaryWallpaperLayersSnapshotIOSurface_floatingWallpaperLayerSnapshotIOSurface_snapshotScale_traitCollection_withCompletion___block_invoke;
  v26[3] = &unk_1E8E9F598;
  v27 = v12;
  v25 = v12;
  -[PRSService ingestSnapshotCollection:forPosterConfiguration:completion:](posterBoardService, "ingestSnapshotCollection:forPosterConfiguration:completion:", v22, activeLockScreenPosterConfiguration, v26);

}

uint64_t __157__SBWallpaperController__ingestPrimaryWallpaperLayersSnapshotIOSurface_floatingWallpaperLayerSnapshotIOSurface_snapshotScale_traitCollection_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  PBUIWallpaperPresenting_Staged *wallpaperPresenter;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogWallpaper();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = objc_msgSend(v5, "isWallpaperAllowed");
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Profile connection settings changed, isWallpaperAllowed: %{BOOL}u", (uint8_t *)v9, 8u);
  }

  v7 = objc_msgSend(v5, "isWallpaperAllowed");
  wallpaperPresenter = self->_wallpaperPresenter;
  if (v7)
  {
    -[PBUIWallpaperPresenting_Staged removeWallpaperStyleForPriority:forVariant:withAnimationFactory:](wallpaperPresenter, "removeWallpaperStyleForPriority:forVariant:withAnimationFactory:", 2, 1, 0);
    -[PBUIWallpaperPresenting_Staged removeWallpaperStyleForPriority:forVariant:withAnimationFactory:](self->_wallpaperPresenter, "removeWallpaperStyleForPriority:forVariant:withAnimationFactory:", 2, 0, 0);
  }
  else
  {
    -[PBUIWallpaperPresenting_Staged setWallpaperStyle:forPriority:forVariant:withAnimationFactory:](wallpaperPresenter, "setWallpaperStyle:forPriority:forVariant:withAnimationFactory:", 2, 2, 1, 0);
    -[PBUIWallpaperPresenting_Staged setWallpaperStyle:forPriority:forVariant:withAnimationFactory:](self->_wallpaperPresenter, "setWallpaperStyle:forPriority:forVariant:withAnimationFactory:", 2, 2, 0, 0);
  }

}

- (PBUIWallpaperPresenting)presenter
{
  return self->_wallpaperPresenter;
}

- (PBUIWallpaperLegibilityProviding)legibilityProvider
{
  return self->_wallpaperLegibilityProvider;
}

- (PBUIWallpaperPresentingDelegate)wallpaperPresentingDelegate
{
  return (PBUIWallpaperPresentingDelegate *)objc_loadWeakRetained((id *)&self->_wallpaperPresentingDelegate);
}

- (void)setWallpaperPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_wallpaperPresentingDelegate, a3);
}

- (int64_t)_WallpaperOrientationNotForYou
{
  return self->_orientation;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (NSString)cachingIdentifier
{
  return self->_cachingIdentifier;
}

- (PBUIWallpaperConfigurationManager)wallpaperConfigurationManager
{
  return self->_wallpaperConfigurationManager;
}

- (void)setWallpaperAggdLogger:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperAggdLogger, a3);
}

- (void)setWallpaperCoreAnalyticsLogger:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperCoreAnalyticsLogger, a3);
}

- (UITraitCollection)fakeBlurViewOverrideTraitCollection
{
  return self->_fakeBlurViewOverrideTraitCollection;
}

- (void)setFakeBlurViewOverrideTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_fakeBlurViewOverrideTraitCollection, a3);
}

- (BSInvalidatable)batterySaverAnimationAssertion
{
  return self->_batterySaverAnimationAssertion;
}

- (void)setBatterySaverAnimationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_batterySaverAnimationAssertion, a3);
}

- (BSInvalidatable)wallpaperStyleAnimationAssertion
{
  return self->_wallpaperStyleAnimationAssertion;
}

- (void)setWallpaperStyleAnimationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperStyleAnimationAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperStyleAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_batterySaverAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_fakeBlurViewOverrideTraitCollection, 0);
  objc_storeStrong((id *)&self->_wallpaperCoreAnalyticsLogger, 0);
  objc_storeStrong((id *)&self->_wallpaperAggdLogger, 0);
  objc_storeStrong((id *)&self->_wallpaperConfigurationManager, 0);
  objc_storeStrong((id *)&self->_cachingIdentifier, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_wallpaperPresentingDelegate);
  objc_storeStrong((id *)&self->_posterBoardModalEditingManager, 0);
  objc_storeStrong((id *)&self->_lastActiveHomeScreenPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_activeHomeScreenPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_lastActiveLockScreenPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_activeLockScreenPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_posterBoardStateObserver, 0);
  objc_storeStrong((id *)&self->_posterBoardService, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_posterCacheProvider, 0);
  objc_storeStrong((id *)&self->_wallpaperLegibilityProvider, 0);
  objc_storeStrong((id *)&self->_wallpaperPresenter, 0);
  objc_storeStrong((id *)&self->_wallpaperViewController, 0);
  objc_storeStrong((id *)&self->_reloadTestRecipe, 0);
  objc_storeStrong((id *)&self->_migrationTestRecipe, 0);
  objc_storeStrong((id *)&self->_orientationProviders, 0);
  objc_storeStrong((id *)&self->_activeOrientationSources, 0);
  objc_storeStrong((id *)&self->_wallpaperOverlayContainerView, 0);
  objc_storeStrong((id *)&self->_wallpaperContainerView, 0);
  objc_storeStrong((id *)&self->_rootWallpaperViewController, 0);
  objc_storeStrong((id *)&self->_wallpaperWindow, 0);
}

void __54__SBWallpaperController__loadLastActiveConfigurations__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_6(&dword_1D0540000, v0, v1, "failed to decode last active lock poster : error=%{public}@ data=%@");
  OUTLINED_FUNCTION_2_0();
}

void __54__SBWallpaperController__loadLastActiveConfigurations__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_6(&dword_1D0540000, v0, v1, "failed to decode last active home poster : error=%{public}@ data=%@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_persistLastActiveLockScreenPosterConfiguration:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v0, v1, "erasing last active lock poster cache due to failed encoding of new active lock poster : error=%{public}@ config=%@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_persistLastActiveHomeScreenPosterConfiguration:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v0, v1, "erasing last active home poster cache due to failed encoding of new active home poster : error=%{public}@ config=%@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "updating home poster : home=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error loading poster configured properties: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1D0540000, v0, OS_LOG_TYPE_FAULT, "Unable to find extension bundle URL for config %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Missing extension bundle URL for poster configuration %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Missing poster provider from the poster configuration %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error loading poster title style configuration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_updateForLockScreenPosterConfiguration:homeScreenPosterConfiguration:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "updating lock poster : lock=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)homeScreenPosterMirrorsLock
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error loading poster homescreen configuration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_reloadWallpaperAndFlushCaches:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "Flushing all wallpaper caches and rebuilding everything", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_reloadWallpaperAndFlushCaches:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "Reloading wallpaper without flushing caches", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __59__SBWallpaperController_activeActivityDidChangeForManager___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error updated PRS notion of active focus mode: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __64__SBWallpaperController_availableActivitiesDidChangeForManager___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Error notifying PRS that available focus modes changed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Failed to create primary layers snapshot for poster switcher.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_246_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Failed to restore scene settings after snapshotting primary layers: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_250_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Failed to restore scene settings after snapshotting floating layer: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __54__SBWallpaperController_updatePosterSwitcherSnapshots__block_invoke_252_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Failed to hand off updated snapshot for poster switcher: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
