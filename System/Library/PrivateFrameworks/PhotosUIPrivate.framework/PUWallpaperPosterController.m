@implementation PUWallpaperPosterController

- (PUWallpaperPosterController)initWithRenderer:(id)a3 photoLibrary:(id)a4
{
  id v7;
  id v8;
  PUWallpaperPosterController *v9;
  PUWallpaperPosterController *v10;
  NSObject *v11;
  UIActivityIndicatorView *v12;
  void *v13;
  UIActivityIndicatorView *progressIndicator;
  UIActivityIndicatorView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  id v27;
  objc_super v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PUWallpaperPosterController;
  v9 = -[PUWallpaperPosterController init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_renderer, a3);
    objc_storeStrong((id *)&v10->_photoLibrary, a4);
    PLWallpaperGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v10->_signpost = os_signpost_id_make_with_pointer(v11, v10);

    v10->_backlightLuminance = -1;
    v12 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x1E0DC3438]);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](v12, "setColor:", v13);

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v27 = v8;
    progressIndicator = v10->_progressIndicator;
    v10->_progressIndicator = v12;
    v15 = v12;

    objc_msgSend(v7, "floatingView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v15);
    v25 = (void *)MEMORY[0x1E0CB3718];
    -[UIActivityIndicatorView centerYAnchor](v15, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v18;
    -[UIActivityIndicatorView centerXAnchor](v15, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v22);

    -[PUWallpaperPosterController _invalidateDebugHUD](v10, "_invalidateDebugHUD");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v10, sel__lowPowerModeChanged_, *MEMORY[0x1E0CB3048], 0);

    v8 = v27;
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PUWallpaperPosterController observedPlayerItem](self, "observedPlayerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("status"), &PlayerItemObservationContext_49759);

  -[PUWallpaperPosterController _endExtendedRenderSession](self, "_endExtendedRenderSession");
  v4.receiver = self;
  v4.super_class = (Class)PUWallpaperPosterController;
  -[PUWallpaperPosterController dealloc](&v4, sel_dealloc);
}

- (BOOL)wantsLowLuminanceContent
{
  void *v3;
  int v4;

  if (PFPosterWantsLowLuminanceContent())
  {
    -[PUWallpaperPosterController environment](self, "environment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "px_isCallServices") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)setEnvironment:(id)a3
{
  id v5;
  PXPosterRenderingEnvironment *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  double v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->_environment;
  objc_storeStrong((id *)&self->_environment, a3);
  if (v5)
  {
    if (objc_msgSend(v5, "px_isCallServices"))
    {
      objc_msgSend(MEMORY[0x1E0D751B8], "standardAlphabeticTextParameters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D751B8], "setSystemParameters:", v7);

    }
    v8 = -[PXPosterRenderingEnvironment px_significantEventsCounter](v6, "px_significantEventsCounter");
    if (v8 != objc_msgSend(v5, "px_significantEventsCounter"))
      -[PUWallpaperPosterController setSignificantEventsCounter:](self, "setSignificantEventsCounter:", objc_msgSend(v5, "px_significantEventsCounter"));
    -[PXPosterRenderingEnvironment px_assetDirectory](v6, "px_assetDirectory");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_assetDirectory");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if ((v12 & 1) == 0)
        -[PUWallpaperPosterController _loadContentsFromEnvironment](self, "_loadContentsFromEnvironment");
    }
    v13 = -[PXPosterRenderingEnvironment px_backlightLuminance](v6, "px_backlightLuminance");
    if (v13 != objc_msgSend(v5, "px_backlightLuminance"))
    {
      -[PUWallpaperPosterController viewModel](self, "viewModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __46__PUWallpaperPosterController_setEnvironment___block_invoke;
      v31[3] = &unk_1E58AB148;
      v32 = v5;
      objc_msgSend(v14, "performChanges:", v31);

    }
    v15 = -[PXPosterRenderingEnvironment px_deviceOrientation](v6, "px_deviceOrientation");
    if (v15 != objc_msgSend(v5, "px_deviceOrientation"))
      -[PUWallpaperPosterController _updateDeviceOrientation](self, "_updateDeviceOrientation");
    -[PUWallpaperPosterController viewModel](self, "viewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "viewManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "videoLayerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "player");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "rate");
    v21 = v20;

    if (objc_msgSend(v5, "px_isSnapshot") && v21 == 1.0)
      -[PUWallpaperPosterController _transitionToBacklightLuminance:previousBacklightLuminance:animated:interruptSettlingEffectPlayback:](self, "_transitionToBacklightLuminance:previousBacklightLuminance:animated:interruptSettlingEffectPlayback:", 2, -1, 0, 1);
    if ((objc_msgSend(v5, "px_isSnapshot") & 1) == 0
      && objc_msgSend(v5, "px_isPreview")
      && objc_msgSend(v16, "settlingEffectEnabled")
      && !UIAccessibilityIsReduceMotionEnabled())
    {
      PLWallpaperGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_DEFAULT, "Settling effect is requested to playback live in the gallery", buf, 2u);
      }

      -[PUWallpaperPosterController viewModel](self, "viewModel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "performChanges:", &__block_literal_global_45);

    }
    if (-[PUWallpaperPosterController needsUpgrade](self, "needsUpgrade"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUWallpaperPosterController lastUpgradeCheckTime](self, "lastUpgradeCheckTime");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timeIntervalSinceDate:", v25);
      v27 = v26;

      -[PUWallpaperPosterController nextUpgradeCheckDelay](self, "nextUpgradeCheckDelay");
      if (v27 >= v28)
      {
        PLWallpaperGetLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v34 = v27 / 60.0;
          _os_log_impl(&dword_1AAB61000, v29, OS_LOG_TYPE_DEFAULT, "Still needs upgrade after %0.0f minutes, checking again...", buf, 0xCu);
        }

        -[PUWallpaperPosterController setNeedsUpgrade:](self, "setNeedsUpgrade:", -[PUWallpaperPosterController triggerPosterUpgradeIfNecessary](self, "triggerPosterUpgradeIfNecessary"));
        -[PUWallpaperPosterController setLastUpgradeCheckTime:](self, "setLastUpgradeCheckTime:", v24);
        -[PUWallpaperPosterController nextUpgradeCheckDelay](self, "nextUpgradeCheckDelay");
        -[PUWallpaperPosterController setNextUpgradeCheckDelay:](self, "setNextUpgradeCheckDelay:", v30 + v30);
      }

    }
  }
  else
  {
    -[PUWallpaperPosterController _invalidateCurrentPosterMedia](self, "_invalidateCurrentPosterMedia");
  }

}

- (void)setViewModel:(id)a3
{
  PUParallaxLayerStackViewModel *v5;
  PUParallaxLayerStackViewModel *v6;
  char v7;
  PUParallaxLayerStackViewModel *v8;

  v8 = (PUParallaxLayerStackViewModel *)a3;
  v5 = self->_viewModel;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PUParallaxLayerStackViewModel isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      -[PUWallpaperPosterController _removeExistingViews](self, "_removeExistingViews");
      -[PUParallaxLayerStackViewModel unregisterChangeObserver:context:](self->_viewModel, "unregisterChangeObserver:context:", self, "ViewModelObservationContext");
      objc_storeStrong((id *)&self->_viewModel, a3);
      -[PUParallaxLayerStackViewModel registerChangeObserver:context:](v8, "registerChangeObserver:context:", self, "ViewModelObservationContext");
      if (v8)
      {
        -[PUWallpaperPosterController _updateDeviceOrientation](self, "_updateDeviceOrientation");
        -[PUWallpaperPosterController _updateContainerFrame](self, "_updateContainerFrame");
        -[PUWallpaperPosterController _updatePreferences](self, "_updatePreferences");
        -[PUWallpaperPosterController _updateViewHierarchy](self, "_updateViewHierarchy");
        -[PUWallpaperPosterController _observeCurrentPlayerItem](self, "_observeCurrentPlayerItem");
      }
    }
  }

}

- (void)_updateContainerFrame
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  -[PUWallpaperPosterController renderer](self, "renderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  -[PUWallpaperPosterController viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__PUWallpaperPosterController__updateContainerFrame__block_invoke;
  v10[3] = &__block_descriptor_48_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
  v10[4] = v6;
  v10[5] = v8;
  objc_msgSend(v9, "performChanges:", v10);

  -[PUWallpaperPosterController _invalidateDebugHUD](self, "_invalidateDebugHUD");
}

- (void)_updateDeviceOrientation
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
  {
    -[PUWallpaperPosterController environment](self, "environment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "px_deviceOrientation");

    -[PUWallpaperPosterController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__PUWallpaperPosterController__updateDeviceOrientation__block_invoke;
    v6[3] = &__block_descriptor_40_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
    v6[4] = v4;
    objc_msgSend(v5, "performChanges:", v6);

    -[PUWallpaperPosterController _invalidateDebugHUD](self, "_invalidateDebugHUD");
  }
}

- (void)_removeExistingViews
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v3, "createdLayerViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "removeFromSuperview");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_updateViewHierarchy
{
  void *v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  -[PUWallpaperPosterController _transitionToBacklightLuminance:previousBacklightLuminance:animated:interruptSettlingEffectPlayback:](self, "_transitionToBacklightLuminance:previousBacklightLuminance:animated:interruptSettlingEffectPlayback:", -[PUWallpaperPosterController backlightLuminance](self, "backlightLuminance"), -1, 0, 0);
  -[PUWallpaperPosterController viewModel](self, "viewModel");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "viewManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "currentLayerStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settlingEffectLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForLayer:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "inactiveBackgroundLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForLayer:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "backgroundLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForLayer:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "inactiveForegroundLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForLayer:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "foregroundLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForLayer:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterController renderer](self, "renderer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "foregroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatingView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v8);
  if (v6)
    objc_msgSend(v14, "addSubview:", v6);
  v20 = (void *)v6;
  objc_msgSend(v14, "addSubview:", v19);
  if (objc_msgSend(v22, "clockAppearsAboveForeground"))
    v17 = v15;
  else
    v17 = v16;
  objc_msgSend(v17, "addSubview:", v21);
  objc_msgSend(v17, "addSubview:", v12);
  if (objc_msgSend(v22, "showsDebugHUD"))
  {
    objc_msgSend(v3, "debugInfoView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v18);

  }
  -[PUWallpaperPosterController _invalidateDebugHUD](self, "_invalidateDebugHUD");

}

- (void)_showProgressIndicator
{
  id v2;

  -[PUWallpaperPosterController progressIndicator](self, "progressIndicator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAnimating");

}

- (void)_hideProgressIndicator
{
  id v2;

  -[PUWallpaperPosterController progressIndicator](self, "progressIndicator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimating");

}

- (void)_updateBacklightLuminance
{
  id v3;

  -[PUWallpaperPosterController viewModel](self, "viewModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterController setBacklightLuminance:](self, "setBacklightLuminance:", objc_msgSend(v3, "backlightLuminance"));

}

- (void)setBacklightLuminance:(int64_t)a3
{
  int64_t backlightLuminance;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  BOOL v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  backlightLuminance = self->_backlightLuminance;
  if (backlightLuminance != a3)
  {
    self->_backlightLuminance = a3;
    -[PUWallpaperPosterController posterConfiguration](self, "posterConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shuffleConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shuffleFrequency");

    if (a3 == 1)
    {
      v9 = -[PUWallpaperPosterController wantsLowLuminanceContent](self, "wantsLowLuminanceContent");
      v10 = backlightLuminance != 2;
      if (backlightLuminance == 2 && v8 == 2 && v9)
      {
        if (!-[PUWallpaperPosterController significantEventsCounter](self, "significantEventsCounter"))
          -[PUWallpaperPosterController setNeedsFirstLockSignificantEvent:](self, "setNeedsFirstLockSignificantEvent:", 1);
        v10 = 0;
      }
    }
    else
    {
      v10 = backlightLuminance != 2;
    }
    v11 = -[PUWallpaperPosterController _shouldAnimateShuffleTransitionToSleep](self, "_shouldAnimateShuffleTransitionToSleep");
    if (v10 || !v11)
      goto LABEL_15;
    PLWallpaperGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[PUWallpaperPosterController _nameForBacklightLuminance:](self, "_nameForBacklightLuminance:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_INFO, "setBacklightLuminance:%@ delegating transition to _animateShuffleTransitionToSleep", (uint8_t *)&v14, 0xCu);

    }
    if (!-[PUWallpaperPosterController _animateShuffleTransitionToSleep](self, "_animateShuffleTransitionToSleep"))
LABEL_15:
      -[PUWallpaperPosterController _transitionToBacklightLuminance:previousBacklightLuminance:animated:interruptSettlingEffectPlayback:](self, "_transitionToBacklightLuminance:previousBacklightLuminance:animated:interruptSettlingEffectPlayback:", a3, backlightLuminance, 1, 1);
  }
}

- (void)_transitionToBacklightLuminance:(int64_t)a3 previousBacklightLuminance:(int64_t)a4 animated:(BOOL)a5 interruptSettlingEffectPlayback:(BOOL)a6
{
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
  BOOL v20;
  NSObject *v21;
  BOOL v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  int64_t v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  PUWallpaperPosterController *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  _BOOL4 v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _OWORD *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  __int128 v55;
  __int128 v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  PUWallpaperPosterController *v67;
  char v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  double v78;
  void *v79;
  void *v80;
  uint64_t v81;
  BOOL v82;
  char v83;
  char v84;
  void *v85;
  double v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  float v91;
  NSObject *v92;
  const __CFString *v93;
  PUWallpaperPosterController *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  PUWallpaperPosterController *v99;
  id v100;
  void *v101;
  __int128 v102;
  void *v103;
  void *v104;
  uint64_t v105;
  id v106;
  id v107;
  id v108;
  void (**v109)(_QWORD);
  id v110;
  void (**v111)(_QWORD);
  double v112;
  double v113;
  id v114;
  void (**v115)(_QWORD);
  void *v116;
  void *v117;
  int v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  void *v124;
  __int128 v125;
  void *v126;
  void *v127;
  BOOL v128;
  __int128 v129;
  int64_t v130;
  _BOOL4 v131;
  void *v132;
  const __CFString *v133;
  void *v134;
  _BOOL4 IsReduceMotionEnabled;
  __int128 v136;
  int v137;
  void (**v138)(void);
  void *v139;
  void *v140;
  void *v141;
  _BOOL4 v142;
  int v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  PUWallpaperPosterController *v148;
  _QWORD v150[4];
  id v151;
  void (**v152)(_QWORD);
  _QWORD v153[4];
  id v154;
  id v155;
  id v156;
  double v157;
  double v158;
  _QWORD v159[4];
  id v160;
  _QWORD v161[5];
  id v162;
  id v163;
  id v164;
  id v165;
  char v166;
  BOOL v167;
  _OWORD v168[6];
  _OWORD v169[6];
  CGAffineTransform v170;
  CGAffineTransform v171;
  CGAffineTransform v172;
  CGAffineTransform v173;
  CGAffineTransform t2;
  CGAffineTransform v175;
  _QWORD aBlock[5];
  id v177;
  id v178;
  id v179;
  id v180;
  BOOL v181;
  BOOL v182;
  _QWORD v183[4];
  id v184;
  id v185;
  id v186;
  _QWORD v187[4];
  id v188;
  id v189;
  _QWORD v190[4];
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  double v196;
  _QWORD v197[5];
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  void *v203;
  _QWORD v204[2];
  uint8_t buf[32];
  _BYTE v206[32];
  _BYTE v207[18];
  uint64_t v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;

  v131 = a6;
  v142 = a5;
  v208 = *MEMORY[0x1E0C80C00];
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = objc_msgSend(v8, "isLowPowerModeEnabled");

  -[PUWallpaperPosterController renderer](self, "renderer");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterController viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = v9;
  objc_msgSend(v9, "currentLayerStack");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backgroundLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewForLayer:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "foregroundLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewForLayer:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "inactiveForegroundLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewForLayer:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "inactiveBackgroundLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewForLayer:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v134 = v10;
  objc_msgSend(v10, "videoLayerView");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "player");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = self;
  v20 = -[PUWallpaperPosterController wantsLowLuminanceContent](self, "wantsLowLuminanceContent");
  PLWallpaperGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v139 = v13;
  v140 = v15;
  v145 = v19;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    if (v9)
      v22 = v20;
    else
      v22 = 0;
    if (v9)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    v133 = v23;
    if (v17)
      v22 = 0;
    v128 = v22;
    -[PUWallpaperPosterController _nameForBacklightLuminance:](v148, "_nameForBacklightLuminance:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterController _nameForBacklightLuminance:](v148, "_nameForBacklightLuminance:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = a4;
    if (v142)
      v27 = CFSTR("YES");
    else
      v27 = CFSTR("NO");
    *(_DWORD *)buf = 138414082;
    if (objc_msgSend(v11, "settlingEffectEnabled"))
      v28 = CFSTR("YES");
    else
      v28 = CFSTR("NO");
    *(_QWORD *)&buf[4] = v24;
    if (v128 && v19 == 0)
      v29 = CFSTR("YES");
    else
      v29 = CFSTR("NO");
    if (IsReduceMotionEnabled)
      v30 = CFSTR("YES");
    else
      v30 = CFSTR("NO");
    if (v137)
      v31 = CFSTR("YES");
    else
      v31 = CFSTR("NO");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v25;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v27;
    a4 = v26;
    *(_WORD *)v206 = 2112;
    *(_QWORD *)&v206[2] = v28;
    *(_WORD *)&v206[10] = 2112;
    *(_QWORD *)&v206[12] = v29;
    *(_WORD *)&v206[20] = 2112;
    *(_QWORD *)&v206[22] = v30;
    *(_WORD *)&v206[30] = 2112;
    *(_QWORD *)v207 = v31;
    *(_WORD *)&v207[8] = 2112;
    *(_QWORD *)&v207[10] = v133;
    _os_log_impl(&dword_1AAB61000, v21, OS_LOG_TYPE_INFO, "_transitionToBacklightLuminance:%@ previousBacklightLuminance:%@ animated:%@ isSettlingEffectEnabled:%@ missingInactiveViews:%@ isReduceMotionEnabled:%@ isLowPowerModeEnabled:%@ viewModelNonNil: %@", buf, 0x52u);

    v15 = v140;
  }

  if (!v13)
  {
    PLWallpaperGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v33, OS_LOG_TYPE_ERROR, "backgroundLayerView is nil", buf, 2u);
    }
    v32 = v148;
    goto LABEL_33;
  }
  objc_msgSend(v13, "frame");
  v32 = v148;
  if (CGRectIsEmpty(v209))
  {
    PLWallpaperGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v33, OS_LOG_TYPE_ERROR, "backgroundLayerView has zero size", buf, 2u);
    }
LABEL_33:

  }
  if (v15)
  {
    objc_msgSend(v15, "frame");
    if (CGRectIsEmpty(v210))
    {
      PLWallpaperGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v34, OS_LOG_TYPE_ERROR, "foregroundLayerView has zero size", buf, 2u);
      }

    }
  }
  if (v17)
  {
    objc_msgSend(v17, "frame");
    if (CGRectIsEmpty(v211))
    {
      PLWallpaperGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v35, OS_LOG_TYPE_ERROR, "inactiveForegroundLayerView has zero size", buf, 2u);
      }

    }
  }
  if (v19)
  {
    objc_msgSend(v19, "frame");
    if (CGRectIsEmpty(v212))
    {
      PLWallpaperGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v36, OS_LOG_TYPE_ERROR, "inactiveBackgroundLayerView has zero size", buf, 2u);
      }

    }
  }
  v38 = a3 == 2 || a3 == -1;
  if (objc_msgSend(v11, "settlingEffectEnabled"))
  {
    objc_msgSend(v17, "setAlpha:", 0.0);
    if (-[PUWallpaperPosterController blurredSettlingEffect](v32, "blurredSettlingEffect") && (a3 == 1 || a4 == 1))
    {
      v126 = v17;
      objc_msgSend(v13, "layer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "filters");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

      v42 = (_OWORD *)MEMORY[0x1E0CD2338];
      if (!v41)
      {
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setName:", CFSTR("gaussianBlur"));
        objc_msgSend(v43, "setValue:forKey:", CFSTR("default"), *MEMORY[0x1E0CD2D88]);
        objc_msgSend(v43, "setValue:forKey:", &unk_1E59BB7A8, *MEMORY[0x1E0CD2D90]);
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setName:", CFSTR("colorMatrix"));
        v45 = v42[3];
        *(_OWORD *)v206 = v42[2];
        *(_OWORD *)&v206[16] = v45;
        *(_OWORD *)v207 = v42[4];
        v46 = v42[1];
        *(_OWORD *)buf = *v42;
        *(_OWORD *)&buf[16] = v46;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", buf);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setValue:forKey:", v47, *MEMORY[0x1E0CD2D20]);

        v204[0] = v43;
        v204[1] = v44;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v204, 2);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v203 = v43;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v203, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "layer");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setFilters:", v49);

        v13 = v139;
        objc_msgSend(v146, "layer");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setFilters:", v48);

        objc_msgSend(v139, "layer");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setFilters:", v48);

        objc_msgSend(v140, "layer");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setFilters:", v48);

        v15 = v140;
      }
      *(_OWORD *)&v206[16] = 0u;
      *(_OWORD *)v207 = 0u;
      if (v38)
        v54 = 0.0;
      else
        v54 = 10.0;
      *(_OWORD *)v206 = 0uLL;
      memset(buf, 0, sizeof(buf));
      if (a3 == 2 || a3 == -1)
      {
        v55 = v42[3];
        *(_OWORD *)v206 = v42[2];
        *(_OWORD *)&v206[16] = v55;
        *(_OWORD *)v207 = v42[4];
        v56 = v42[1];
        *(_OWORD *)buf = *v42;
        *(_OWORD *)&buf[16] = v56;
      }
      else
      {
        PUColorMatrixMakeInactive(buf);
      }
      v199 = *(_OWORD *)&buf[16];
      v200 = *(_OWORD *)v206;
      v71 = MEMORY[0x1E0C809B0];
      v197[0] = MEMORY[0x1E0C809B0];
      v201 = *(_OWORD *)&v206[16];
      v202 = *(_OWORD *)v207;
      v197[1] = 3221225472;
      v197[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke;
      v197[3] = &__block_descriptor_120_e16_v16__0__UIView_8l;
      *(double *)&v197[4] = v54;
      v198 = *(_OWORD *)buf;
      v72 = _Block_copy(v197);
      v190[0] = v71;
      v190[1] = 3221225472;
      v190[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_2;
      v190[3] = &unk_1E58A9A90;
      v191 = v145;
      v196 = v54;
      v73 = v72;
      v195 = v73;
      v192 = v146;
      v193 = v13;
      v194 = v15;
      v74 = _Block_copy(v190);
      v75 = v74;
      if (v142)
      {
        v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithAnimationCurve:", 0);
        v77 = objc_alloc(MEMORY[0x1E0DC3F38]);
        v78 = 0.3;
        if (!v38)
          v78 = 0.5;
        v79 = (void *)objc_msgSend(v77, "initWithDuration:timingParameters:", v76, v78);
        objc_msgSend(v79, "addAnimations:", v75);
        objc_msgSend(v79, "startAnimation");

        v15 = v140;
      }
      else
      {
        (*((void (**)(void *))v74 + 2))(v74);
      }
      v17 = v126;
      v32 = v148;

    }
    objc_msgSend(v147, "currentItem");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "status");

    if (v146)
      v82 = v81 == 2;
    else
      v82 = 1;
    v83 = v137 ^ 1;
    if (v82)
      v83 = 0;
    if (a3 == 2)
    {
      if (v142)
      {
        v84 = v83 ^ 1;
        if (a4 == -1)
          v84 = 1;
        v19 = v145;
        v85 = v146;
        if ((v84 & 1) != 0)
        {
          if ((v83 & 1) == 0)
          {
            objc_msgSend(v146, "setAlpha:", 0.0);
            v187[0] = MEMORY[0x1E0C809B0];
            v187[1] = 3221225472;
            v187[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_77;
            v187[3] = &unk_1E58ABCA8;
            v188 = v13;
            v189 = v15;
            v95 = _Block_copy(v187);
            v96 = v95;
            if (a4 == 1)
            {
              -[PUWallpaperPosterController alphaAnimator](v32, "alphaAnimator");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "stopAnimation:", 1);

              v98 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithAnimationCurve:", 0);
              v99 = v32;
              v100 = objc_alloc(MEMORY[0x1E0DC3F38]);
              objc_msgSend(v141, "px_lowLuminanceAlphaAnimationDuration");
              v101 = (void *)objc_msgSend(v100, "initWithDuration:timingParameters:", v98);
              objc_msgSend(v101, "addAnimations:", v96);
              objc_msgSend(v101, "startAnimation");
              -[PUWallpaperPosterController setAlphaAnimator:](v99, "setAlphaAnimator:", v101);

              v85 = v146;
            }
            else
            {
              (*((void (**)(void *))v95 + 2))(v95);
            }

            v19 = v145;
          }
        }
        else
        {
          -[PUWallpaperPosterController _playSettlingEffect](v32, "_playSettlingEffect");
        }
        goto LABEL_139;
      }
      objc_msgSend(v147, "rate");
      v85 = v146;
      if (v91 != 0.0)
      {
        PLWallpaperGetLog();
        v92 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
        {
          v93 = CFSTR("Ignoring");
          if (v131)
            v93 = CFSTR("Honoring");
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v93;
          _os_log_impl(&dword_1AAB61000, v92, OS_LOG_TYPE_INFO, "%@ request to end settling effect to accommodate unanimated transition to full luminance", buf, 0xCu);
        }

      }
      v19 = v145;
      if (v131)
      {
        *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
        *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        objc_msgSend(v147, "seekToTime:", buf);
        objc_msgSend(v147, "pause");
        objc_msgSend(v13, "setAlpha:", 1.0);
        objc_msgSend(v15, "setAlpha:", 1.0);
        v94 = v32;
LABEL_116:
        -[PUWallpaperPosterController _endExtendedRenderSession](v94, "_endExtendedRenderSession");
      }
    }
    else
    {
      v19 = v145;
      if (!a3)
      {
        objc_msgSend(v13, "setAlpha:", 0.0);
        objc_msgSend(v15, "setAlpha:", 0.0);
        v85 = v146;
        objc_msgSend(v146, "setAlpha:", 1.0);
        *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
        *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        objc_msgSend(v147, "seekToTime:", buf);
        objc_msgSend(v147, "pause");
        goto LABEL_139;
      }
      v85 = v146;
      if (a3 == 1)
      {
        objc_msgSend(v147, "pause");
        if (v142)
        {
          objc_msgSend(v13, "alpha");
          if (v86 == 1.0)
            objc_msgSend(v146, "setAlpha:", 0.0);
          -[PUWallpaperPosterController alphaAnimator](v32, "alphaAnimator");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "stopAnimation:", 1);

          v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithAnimationCurve:", 0);
          v89 = objc_alloc(MEMORY[0x1E0DC3F38]);
          objc_msgSend(v141, "px_lowLuminanceAlphaAnimationDuration");
          v90 = (void *)objc_msgSend(v89, "initWithDuration:timingParameters:", v88);
          v183[0] = MEMORY[0x1E0C809B0];
          v183[1] = 3221225472;
          v183[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_2_78;
          v183[3] = &unk_1E58AB790;
          v184 = v13;
          v185 = v15;
          v186 = v146;
          objc_msgSend(v90, "addAnimations:", v183);
          objc_msgSend(v90, "startAnimation");
          -[PUWallpaperPosterController setAlphaAnimator:](v32, "setAlphaAnimator:", v90);

          v85 = v146;
          v19 = v145;
        }
        else
        {
          objc_msgSend(v13, "setAlpha:", 0.0);
          objc_msgSend(v15, "setAlpha:", 0.0);
          objc_msgSend(v146, "setAlpha:", 0.0);
        }
        v94 = v32;
        goto LABEL_116;
      }
    }
  }
  else
  {
    v130 = a4;
    v132 = v11;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_3;
    aBlock[3] = &unk_1E58A2940;
    v181 = v38;
    v182 = IsReduceMotionEnabled;
    aBlock[4] = v32;
    v57 = v13;
    v177 = v57;
    v58 = v15;
    v178 = v58;
    v59 = v17;
    v179 = v59;
    v60 = v19;
    v180 = v60;
    v138 = (void (**)(void))_Block_copy(aBlock);
    -[PUWallpaperPosterController transformAnimator](v32, "transformAnimator");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "stopAnimation:", 1);

    v62 = !v142;
    v143 = !v142;
    if (!a3 || IsReduceMotionEnabled || v62)
    {
      v138[2]();
      v67 = v148;
    }
    else
    {
      v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithAnimationCurve:", 0);
      v64 = v17;
      v65 = objc_alloc(MEMORY[0x1E0DC3F38]);
      objc_msgSend(v141, "px_backlightTransformAnimationDuration");
      v66 = (void *)objc_msgSend(v65, "initWithDuration:timingParameters:", v63);
      objc_msgSend(v66, "addAnimations:", v138);
      objc_msgSend(v66, "startAnimation");
      v67 = v148;
      -[PUWallpaperPosterController setTransformAnimator:](v148, "setTransformAnimator:", v66);

      v17 = v64;
      v19 = v145;

    }
    if (-[PUWallpaperPosterController wantsLowLuminanceContent](v67, "wantsLowLuminanceContent"))
    {
      v127 = v17;
      v68 = 0;
      if (IsReduceMotionEnabled && (unint64_t)(a3 + 1) <= 3 && a3)
      {
        objc_msgSend(v57, "currentLayoutInfo");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v69;
        if (v69)
          objc_msgSend(v69, "additionalTransform");
        else
          memset(&t2, 0, sizeof(t2));
        v102 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v136 = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)buf = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&buf[16] = v102;
        v129 = v102;
        v125 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        *(_OWORD *)v206 = v125;
        CGAffineTransformConcat(&v175, (CGAffineTransform *)buf, &t2);
        v173 = v175;
        objc_msgSend(v57, "setTransform:", &v173);

        objc_msgSend(v58, "currentLayoutInfo");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = v103;
        if (v103)
          objc_msgSend(v103, "additionalTransform");
        else
          memset(&v171, 0, sizeof(v171));
        *(_OWORD *)buf = v136;
        *(_OWORD *)&buf[16] = v129;
        *(_OWORD *)v206 = v125;
        CGAffineTransformConcat(&v172, (CGAffineTransform *)buf, &v171);
        v170 = v172;
        objc_msgSend(v58, "setTransform:", &v170);

        -[PUWallpaperPosterController _inactiveTransform](v67, "_inactiveTransform");
        v169[0] = v169[3];
        v169[1] = v169[4];
        v169[2] = v169[5];
        objc_msgSend(v60, "setTransform:", v169);
        -[PUWallpaperPosterController _inactiveTransform](v67, "_inactiveTransform");
        v168[0] = v168[3];
        v168[1] = v168[4];
        v168[2] = v168[5];
        objc_msgSend(v59, "setTransform:", v168);
        v68 = 1;
      }
      v105 = MEMORY[0x1E0C809B0];
      v161[0] = MEMORY[0x1E0C809B0];
      v161[1] = 3221225472;
      v161[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_4;
      v161[3] = &unk_1E58A2940;
      v166 = v68;
      v167 = v38;
      v161[4] = v67;
      v106 = v57;
      v162 = v106;
      v107 = v58;
      v163 = v107;
      v164 = v60;
      v108 = v59;
      v165 = v108;
      v109 = (void (**)(_QWORD))_Block_copy(v161);
      v159[0] = v105;
      v159[1] = 3221225472;
      v159[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_5;
      v159[3] = &unk_1E58ABD10;
      v110 = v107;
      v160 = v110;
      v111 = (void (**)(_QWORD))_Block_copy(v159);
      if (v38)
        v112 = 1.0;
      else
        v112 = 0.0;
      if (v38)
        v113 = 0.0;
      else
        v113 = 1.0;
      v153[0] = v105;
      v153[1] = 3221225472;
      v153[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_6;
      v153[3] = &unk_1E58A2968;
      v154 = v106;
      v157 = v112;
      v114 = v110;
      v155 = v114;
      v156 = v108;
      v158 = v113;
      v115 = (void (**)(_QWORD))_Block_copy(v153);
      -[PUWallpaperPosterController alphaAnimator](v67, "alphaAnimator");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = v116;
      if (v130)
        v118 = v143;
      else
        v118 = 1;
      if (!a3 || v118)
      {
        if (objc_msgSend(v116, "isRunning", v125))
        {
          objc_msgSend(v117, "stopAnimation:", 1);
          v111[2](v111);
        }
        v115[2](v115);
        v109[2](v109);
      }
      else
      {
        objc_msgSend(v116, "stopAnimation:", 1);
        v119 = *MEMORY[0x1E0CD2EA0];
        objc_msgSend(v114, "layer");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "setCompositingFilter:", v119);

        v121 = v111;
        v122 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithAnimationCurve:", 0);
        v123 = objc_alloc(MEMORY[0x1E0DC3F38]);
        objc_msgSend(v141, "px_lowLuminanceAlphaAnimationDuration");
        v124 = (void *)objc_msgSend(v123, "initWithDuration:timingParameters:", v122);
        objc_msgSend(v124, "addAnimations:", v115);
        v150[0] = MEMORY[0x1E0C809B0];
        v150[1] = 3221225472;
        v150[2] = __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_7;
        v150[3] = &unk_1E58A38D8;
        v151 = v121;
        v152 = v109;
        objc_msgSend(v124, "addCompletion:", v150);
        objc_msgSend(v124, "startAnimation");
        -[PUWallpaperPosterController setAlphaAnimator:](v148, "setAlphaAnimator:", v124);

        v111 = (void (**)(_QWORD))v121;
      }
      v17 = v127;

      v19 = v145;
    }

    v11 = v132;
    v13 = v139;
    v15 = v140;
    v85 = v146;
  }
LABEL_139:

}

- (BOOL)_animateShuffleTransitionToSleep
{
  id v3;
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  BOOL v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  BOOL IsReduceMotionEnabled;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[16];
  __int128 buf;
  __int128 v83;
  __int128 v84;

  -[PUWallpaperPosterController _nextPosterMedia](self, "_nextPosterMedia");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUWallpaperPosterController currentPosterMedia](self, "currentPosterMedia");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 == v3)
    {

    }
    else
    {
      v5 = v4;
      v6 = objc_msgSend(v4, "isEqual:", v3);

      if ((v6 & 1) == 0)
      {
        -[PUWallpaperPosterController viewModel](self, "viewModel");
        v7 = objc_claimAutoreleasedReturnValue();
        -[NSObject viewManager](v7, "viewManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject currentLayerStack](v7, "currentLayerStack");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "backgroundLayer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "viewForLayer:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "foregroundLayer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "viewForLayer:", v12);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "inactiveForegroundLayer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "viewForLayer:", v13);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = v9;
        objc_msgSend(v9, "inactiveBackgroundLayer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "viewForLayer:", v14);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = -[NSObject clockAppearsAboveForeground](v7, "clockAppearsAboveForeground");
        v83 = 0u;
        v84 = 0u;
        buf = 0u;
        -[PUWallpaperPosterController _inactiveTransform](self, "_inactiveTransform");
        -[PUWallpaperPosterController _updateCurrentPosterMedia](self, "_updateCurrentPosterMedia");
        -[PUWallpaperPosterController viewModel](self, "viewModel");
        v16 = objc_claimAutoreleasedReturnValue();
        -[NSObject viewManager](v16, "viewManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject currentLayerStack](v16, "currentLayerStack");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "inactiveForegroundLayer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v17;
        objc_msgSend(v17, "viewForLayer:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v57 = v16;
        v20 = v7 == v16;
        v21 = v7 != v16;
        if (v20)
        {
          v45 = v58;
          v44 = v59;
          v43 = v60;
          -[PUWallpaperPosterController _transitionToBacklightLuminance:previousBacklightLuminance:animated:interruptSettlingEffectPlayback:](self, "_transitionToBacklightLuminance:previousBacklightLuminance:animated:interruptSettlingEffectPlayback:", 2, -1, 0, 1);
          PLWallpaperGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v81 = 0;
            _os_log_impl(&dword_1AAB61000, v24, OS_LOG_TYPE_INFO, "_animateShuffleTransitionToSleep new views are not new", v81, 2u);
          }
        }
        else
        {
          v53 = v8;
          objc_msgSend(v60, "layer");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setCompositingFilter:", 0);

          objc_msgSend(v11, "layer");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setCompositingFilter:", 0);

          v52 = v19;
          objc_msgSend(v19, "setAlpha:", 0.0);
          -[PUWallpaperPosterController renderer](self, "renderer");
          v24 = objc_claimAutoreleasedReturnValue();
          -[NSObject backgroundView](v24, "backgroundView");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject foregroundView](v24, "foregroundView");
          v26 = objc_claimAutoreleasedReturnValue();
          -[NSObject floatingView](v24, "floatingView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addSubview:", v59);
          v51 = v25;
          objc_msgSend(v25, "addSubview:", v11);
          v49 = v27;
          v50 = (void *)v26;
          if (v15)
            v27 = (void *)v26;
          objc_msgSend(v27, "addSubview:", v58);
          objc_msgSend(v27, "addSubview:", v60);
          IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
          v29 = MEMORY[0x1E0C809B0];
          if (!IsReduceMotionEnabled)
          {
            v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithAnimationCurve:", 0);
            v31 = objc_alloc(MEMORY[0x1E0DC3F38]);
            -[NSObject px_shuffleSleepTransformOutAnimationDuration](v24, "px_shuffleSleepTransformOutAnimationDuration");
            v32 = (void *)objc_msgSend(v31, "initWithDuration:timingParameters:", v30);
            v73[0] = v29;
            v73[1] = 3221225472;
            v73[2] = __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke;
            v73[3] = &unk_1E58A2990;
            v74 = v11;
            v78 = buf;
            v79 = v83;
            v80 = v84;
            v75 = v60;
            v76 = v58;
            v77 = v59;
            objc_msgSend(v32, "addAnimations:", v73);
            objc_msgSend(v32, "startAnimation");

          }
          v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithAnimationCurve:", 0);
          v33 = objc_alloc(MEMORY[0x1E0DC3F38]);
          -[NSObject px_shuffleSleepFadeOutAnimationDuration](v24, "px_shuffleSleepFadeOutAnimationDuration");
          v34 = (void *)objc_msgSend(v33, "initWithDuration:timingParameters:", v48);
          v35 = v29;
          v68[0] = v29;
          v68[1] = 3221225472;
          v68[2] = __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke_2;
          v68[3] = &unk_1E58A9AE0;
          v36 = v11;
          v69 = v36;
          v37 = v60;
          v70 = v37;
          v47 = v11;
          v38 = v58;
          v71 = v38;
          v39 = v59;
          v72 = v39;
          objc_msgSend(v34, "addAnimations:", v68);
          v63[0] = v35;
          v63[1] = 3221225472;
          v63[2] = __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke_3;
          v63[3] = &unk_1E58A29B8;
          v64 = v36;
          v65 = v37;
          v66 = v38;
          v67 = v39;
          objc_msgSend(v34, "addCompletion:", v63);
          objc_msgSend(v34, "startAnimation");
          v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA0]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 21.4208, 9.2565, 0.0, 0.0);
          v41 = objc_alloc(MEMORY[0x1E0DC3F38]);
          -[NSObject px_shuffleSleepFadeInAnimationDuration](v24, "px_shuffleSleepFadeInAnimationDuration");
          v42 = (void *)objc_msgSend(v41, "initWithDuration:timingParameters:", v40);
          v61[0] = v35;
          v61[1] = 3221225472;
          v61[2] = __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke_4;
          v61[3] = &unk_1E58ABD10;
          v19 = v52;
          v62 = v52;
          objc_msgSend(v42, "addAnimations:", v61);
          objc_msgSend(v42, "startAnimation");

          v8 = v53;
          v11 = v47;
          v44 = v59;
          v43 = v60;
          v45 = v58;
        }

        goto LABEL_14;
      }
    }
  }
  PLWallpaperGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_INFO, "_animateShuffleTransitionToSleep called when next media wasn't available", (uint8_t *)&buf, 2u);
  }
  v21 = 0;
LABEL_14:

  return v21;
}

- (BOOL)_shouldAnimateShuffleTransitionToSleep
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  BOOL v12;

  -[PUWallpaperPosterController posterConfiguration](self, "posterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shuffleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shuffleFrequency");

  v6 = -[PUWallpaperPosterController backlightLuminance](self, "backlightLuminance") == 1
    && -[PUWallpaperPosterController wantsLowLuminanceContent](self, "wantsLowLuminanceContent");
  -[PUWallpaperPosterController _nextPosterMedia](self, "_nextPosterMedia");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PUWallpaperPosterController currentPosterMedia](self, "currentPosterMedia");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 == v7)
      LOBYTE(v10) = 0;
    else
      v10 = objc_msgSend(v8, "isEqual:", v7) ^ 1;

  }
  else
  {
    LOBYTE(v10) = 0;
  }
  v11 = v5 == 2 && v6;
  v12 = v11 & v10;

  return v12;
}

- (CGAffineTransform)_inactiveTransform
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v12;
  CGAffineTransform *result;
  CGFloat dx;
  uint8_t buf[16];
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  -[PUWallpaperPosterController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inactiveFrame");
  if (CGRectIsEmpty(v16))
  {
    PLWallpaperGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "inactiveFrame is empty, falling back to the identity transform", buf, 2u);
    }

    v6 = MEMORY[0x1E0C9BAA8];
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  }
  else
  {
    objc_msgSend(v4, "containerFrame");
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
    dx = -CGRectGetMidX(v17);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v12 = -CGRectGetMidY(v18);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    CGRectOffset(v19, dx, v12);
    objc_msgSend(v4, "visibleFrame");
    PXRectNormalize();
    PXRectDenormalize();
    PXAffineTransformMakeFromRects();
  }

  return result;
}

- (void)_loadContentsFromEnvironment
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t signpost;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  const char *v30;
  NSObject *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterController environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_assetDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterController environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "px_contentsType");

  switch(v7)
  {
    case 1:
      PLWallpaperGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      signpost = self->_signpost;
      if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AAB61000, v10, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "PUWallpaperPoster.LoadPosterDescriptor", ", buf, 2u);
      }

      PLWallpaperGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v5;
        _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_INFO, "Loading poster descriptor from url %{public}@", buf, 0xCu);
      }

      v33 = 0;
      objc_msgSend(MEMORY[0x1E0D751F8], "loadFromURL:error:", v5, &v33);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v33;
      if (v13)
      {
        -[PUWallpaperPosterController setPosterDescriptor:](self, "setPosterDescriptor:", v13);
        PLWallpaperGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          goto LABEL_24;
        *(_DWORD *)buf = 138543362;
        v35 = v5;
        v16 = "Loading of poster descriptor from url %{public}@ finished successfully";
        v17 = v15;
        v18 = 12;
      }
      else
      {
        PLWallpaperGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          goto LABEL_24;
        *(_DWORD *)buf = 138543618;
        v35 = v5;
        v36 = 2114;
        v37 = v14;
        v16 = "Loading of poster descriptor from url %{public}@ failed with error %{public}@";
        v17 = v15;
        v18 = 22;
      }
      _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
LABEL_24:

      PLWallpaperGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29 = self->_signpost;
      if (v29 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v27))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v30 = "PUWallpaperPoster.LoadPosterDescriptor";
      goto LABEL_33;
    case 2:
      PLWallpaperGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = self->_signpost;
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AAB61000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PUWallpaperPoster.LoadPosterConfiguration", ", buf, 2u);
      }

      PLWallpaperGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v5;
        _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_INFO, "Loading poster configuration from url %{public}@", buf, 0xCu);
      }

      v32 = 0;
      objc_msgSend(MEMORY[0x1E0D751F0], "loadFromURL:error:", v5, &v32);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v32;
      if (v13)
      {
        -[PUWallpaperPosterController setPosterConfiguration:](self, "setPosterConfiguration:", v13);
        PLWallpaperGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          goto LABEL_30;
        *(_DWORD *)buf = 138543362;
        v35 = v5;
        v24 = "Loading of poster configuration from url %{public}@ finished successfully";
        v25 = v23;
        v26 = 12;
      }
      else
      {
        PLWallpaperGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          goto LABEL_30;
        *(_DWORD *)buf = 138543618;
        v35 = v5;
        v36 = 2114;
        v37 = v14;
        v24 = "Loading of poster configuration from url %{public}@ failed with error %{public}@";
        v25 = v23;
        v26 = 22;
      }
      _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_INFO, v24, buf, v26);
LABEL_30:

      PLWallpaperGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      v28 = v31;
      v29 = self->_signpost;
      if (v29 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v31))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v30 = "PUWallpaperPoster.LoadPosterConfiguration";
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v29, v30, "", buf, 2u);
LABEL_34:

      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterController.m"), 921, CFSTR("Unknown contents type for environment contents: %@"), v5);

      abort();
  }

}

- (void)setPosterDescriptor:(id)a3
{
  PFPosterDescriptor *v5;
  PFPosterDescriptor *v6;
  char v7;
  PFPosterDescriptor *v8;

  v8 = (PFPosterDescriptor *)a3;
  v5 = self->_posterDescriptor;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PFPosterDescriptor isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_posterDescriptor, a3);
      -[PUWallpaperPosterController _invalidateCurrentPosterMedia](self, "_invalidateCurrentPosterMedia");
      -[PUWallpaperPosterController _updateCurrentPosterMedia](self, "_updateCurrentPosterMedia");
    }
  }

}

- (void)setPosterConfiguration:(id)a3
{
  PFPosterConfiguration *v5;
  PFPosterConfiguration *v6;
  char v7;
  void *v8;
  PFPosterConfiguration *v9;

  v9 = (PFPosterConfiguration *)a3;
  v5 = self->_posterConfiguration;
  if (v5 == v9)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PFPosterConfiguration isEqual:](v5, "isEqual:", v9);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_posterConfiguration, a3);
      -[PUWallpaperPosterController _invalidateCurrentPosterMedia](self, "_invalidateCurrentPosterMedia");
      -[PUWallpaperPosterController _updateCurrentPosterMedia](self, "_updateCurrentPosterMedia");
      -[PUWallpaperPosterController _updateSignificantEvents](self, "_updateSignificantEvents");
      -[PUWallpaperPosterController setNeedsUpgrade:](self, "setNeedsUpgrade:", -[PUWallpaperPosterController triggerPosterUpgradeIfNecessary](self, "triggerPosterUpgradeIfNecessary"));
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUWallpaperPosterController setLastUpgradeCheckTime:](self, "setLastUpgradeCheckTime:", v8);

      -[PUWallpaperPosterController setNextUpgradeCheckDelay:](self, "setNextUpgradeCheckDelay:", 900.0);
    }
  }

}

- (BOOL)triggerPosterUpgradeIfNecessary
{
  NSObject *v3;
  BOOL v4;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  char v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  uint32_t v26;
  NSObject *v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  int out_token;
  uint8_t v32[4];
  uint32_t v33;
  uint8_t buf[4];
  NSObject *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if ((-[PXPosterRenderingEnvironment px_isSnapshot](self->_environment, "px_isSnapshot") & 1) == 0
    && (-[PXPosterRenderingEnvironment px_isPlayground](self->_environment, "px_isPlayground") & 1) == 0
    && !-[PXPosterRenderingEnvironment px_isCallServices](self->_environment, "px_isCallServices"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("PI_PARALLAX_ENABLE_MIGRATION"));
    v3 = objc_claimAutoreleasedReturnValue();

    if (v3 && (-[NSObject BOOLValue](v3, "BOOLValue") & 1) == 0)
    {
      PLWallpaperGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "Not triggering poster upgrade: disabled", buf, 2u);
      }
      v4 = 0;
      goto LABEL_51;
    }
    -[PFPosterConfiguration layoutConfiguration](self->_posterConfiguration, "layoutConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D75340], "deviceConfiguration");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject landscapeConfiguration](v8, "landscapeConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if ((-[NSObject isEqualToLayoutConfiguration:](v7, "isEqualToLayoutConfiguration:", v8) & 1) != 0)
      {
LABEL_12:
        v10 = 0;
        goto LABEL_24;
      }
    }
    else
    {
      -[NSObject portraitConfiguration](v7, "portraitConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject portraitConfiguration](v8, "portraitConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToLayoutConfiguration:", v12);

      if ((v13 & 1) != 0)
        goto LABEL_12;
    }
    PLWallpaperGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "Poster layout config mismatch, needs upgrade", buf, 2u);
    }

    PLWallpaperGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v7;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEFAULT, "layoutConfig: %{public}@", buf, 0xCu);
    }

    PLWallpaperGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v8;
      _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEFAULT, "deviceConfig: %{public}@", buf, 0xCu);
    }

    v10 = 1;
LABEL_24:
    if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
    {
      -[NSObject landscapeConfiguration](v7, "landscapeConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 == 0;

    }
    else
    {
      v18 = 0;
    }
    v19 = v10 | v18;
    if (-[PUWallpaperPosterController wantsLowLuminanceContent](self, "wantsLowLuminanceContent")
      && (-[PFPosterConfiguration options](self->_posterConfiguration, "options") & 4) == 0)
    {
      PLWallpaperGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_DEFAULT, "Poster inactive contents mismatch, needs upgrade", buf, 2u);
      }

      v19 = 1;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLForKey:", CFSTR("PI_PARALLAX_FORCE_MIGRATION"));

    if (v22)
    {
      PLWallpaperGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v23, OS_LOG_TYPE_DEFAULT, "Triggering poster upgrade: forced", buf, 2u);
      }

    }
    else if ((v19 & 1) == 0)
    {
      PLWallpaperGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v28, OS_LOG_TYPE_DEFAULT, "Not triggering poster upgrade: not needed", buf, 2u);
      }

      v4 = 0;
      goto LABEL_50;
    }
    if ((objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibraryIsObtainable") & 1) != 0)
    {
      -[PUWallpaperPosterController triggerPosterUpgrade](self, "triggerPosterUpgrade");
    }
    else
    {
      PLWallpaperGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v24, OS_LOG_TYPE_DEFAULT, "Device has not been unlocked since boot, delaying poster upgrade", buf, 2u);
      }

      out_token = -1;
      objc_initWeak((id *)buf, self);
      v25 = MEMORY[0x1E0C80D38];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __62__PUWallpaperPosterController_triggerPosterUpgradeIfNecessary__block_invoke;
      v29[3] = &unk_1E58A7588;
      objc_copyWeak(&v30, (id *)buf);
      v26 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, MEMORY[0x1E0C80D38], v29);

      if (v26)
      {
        PLWallpaperGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v32 = 67109120;
          v33 = v26;
          _os_log_impl(&dword_1AAB61000, v27, OS_LOG_TYPE_ERROR, "Could not register for first unlock notification. Status = %d", v32, 8u);
        }

      }
      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
    v4 = 1;
LABEL_50:

LABEL_51:
    goto LABEL_7;
  }
  PLWallpaperGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "Not triggering poster upgrade: not on lockscreen", buf, 2u);
  }
  v4 = 0;
LABEL_7:

  return v4;
}

- (void)triggerPosterUpgrade
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_assetDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Triggering update of current poster configuration with asset directory: %{public}@", buf, 0xCu);

  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0D75340], "deviceConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D71400]);

  if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
    v10 = 35;
  else
    v10 = 1;
  -[PUWallpaperPosterController posterConfiguration](self, "posterConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "editConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isSettlingEffectEnabled");

  if (v13)
    v14 = v10 | 0x40;
  else
    v14 = v10;
  if (-[PUWallpaperPosterController wantsLowLuminanceContent](self, "wantsLowLuminanceContent"))
    v15 = v14 | 4;
  else
    v15 = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D713F8]);

  -[PUWallpaperPosterController posterUpgradeService](self, "posterUpgradeService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__PUWallpaperPosterController_triggerPosterUpgrade__block_invoke;
  v19[3] = &unk_1E58AB060;
  v20 = v4;
  v18 = v4;
  objc_msgSend(v17, "upgradePosterConfigurationWithAssetDirectory:options:reply:", v18, v7, v19);

}

- (id)posterUpgradeService
{
  PLPhotoAnalysisWallpaperService *wallpaperService;
  id v4;
  void *v5;
  void *v6;
  PLPhotoAnalysisWallpaperService *v7;
  PLPhotoAnalysisWallpaperService *v8;
  NSObject *v9;
  uint8_t v11[16];

  wallpaperService = self->_wallpaperService;
  if (!wallpaperService)
  {
    v4 = objc_alloc(MEMORY[0x1E0D71968]);
    -[PUWallpaperPosterController photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoAnalysisClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PLPhotoAnalysisWallpaperService *)objc_msgSend(v4, "initWithServiceProvider:", v6);
    v8 = self->_wallpaperService;
    self->_wallpaperService = v7;

    wallpaperService = self->_wallpaperService;
    if (!wallpaperService)
    {
      PLWallpaperGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Failed to obtain PAD migration service client!", v11, 2u);
      }

      wallpaperService = self->_wallpaperService;
    }
  }
  return wallpaperService;
}

- (void)setSignificantEventsCounter:(unint64_t)a3
{
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  const __CFString *v8;
  const __CFString *v9;
  _BYTE v10[24];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_significantEventsCounter != a3)
  {
    self->_significantEventsCounter = a3;
    -[PUWallpaperPosterController _updateSignificantEvents](self, "_updateSignificantEvents");
    v5 = -[PUWallpaperPosterController _shouldAnimateShuffleTransitionToSleep](self, "_shouldAnimateShuffleTransitionToSleep");
    PLWallpaperGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = -[PUWallpaperPosterController needsFirstLockSignificantEvent](self, "needsFirstLockSignificantEvent");
      v8 = CFSTR("NO");
      if (v7)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      *(_DWORD *)v10 = 134218498;
      *(_QWORD *)&v10[4] = a3;
      *(_WORD *)&v10[12] = 2112;
      *(_QWORD *)&v10[14] = v9;
      if (!v5)
        v8 = CFSTR("YES");
      *(_WORD *)&v10[22] = 2112;
      v11 = v8;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_INFO, "setSignificantEventsCounter:%ld simulatingFirstLockEvent:%@ updateCurrentPosterMedia:%@", v10, 0x20u);
    }

    if (!v5)
      -[PUWallpaperPosterController _updateCurrentPosterMedia](self, "_updateCurrentPosterMedia");
    -[PUWallpaperPosterController _invalidateDebugHUD](self, "_invalidateDebugHUD", *(_OWORD *)v10, *(_QWORD *)&v10[16]);
  }
}

- (unint64_t)significantEventsCounter
{
  return self->_significantEventsCounter
       + -[PUWallpaperPosterController needsFirstLockSignificantEvent](self, "needsFirstLockSignificantEvent");
}

- (void)_updateSignificantEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  double v11;
  dispatch_time_t v12;
  void *v13;
  id v14;
  _QWORD v15[6];

  -[PUWallpaperPosterController posterConfiguration](self, "posterConfiguration");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "configurationType") == 1)
  {
    objc_msgSend(v14, "shuffleConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shuffleFrequency");

    if ((unint64_t)(v5 - 3) < 2)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PUPosterShuffleNextSignificantEventDateForDate(v9, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "timeIntervalSinceDate:", v3);
      v8 = (uint64_t)(v11 * 1000000000.0);

      v7 = 1;
    }
    else
    {
      v6 = 2;
      if (v5 != 1)
        v6 = 0;
      if (v5 == 2)
        v7 = 4;
      else
        v7 = v6;
      v8 = 0;
    }
    v12 = dispatch_time(0xFFFFFFFFFFFFFFFELL, v8);
    -[PUWallpaperPosterController renderer](self, "renderer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__PUWallpaperPosterController__updateSignificantEvents__block_invoke;
    v15[3] = &__block_descriptor_48_e63_v24__0___PXPosterMutablePreferences__8___PXPosterTransition__16l;
    v15[4] = v12;
    v15[5] = v7;
    objc_msgSend(v13, "px_updatePreferences:", v15);

  }
}

- (id)_timelinesForDateInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  id BLSAlwaysOnTimelineClass;
  void *v14;
  uint64_t v15;
  _QWORD v17[5];
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(getBLSAlwaysOnTimelineClass(), "emptyTimelineWithIdentifier:", CFSTR("no-shuffle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterController posterConfiguration](self, "posterConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "configurationType") == 1)
  {
    objc_msgSend(v7, "shuffleConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shuffleFrequency");

    if ((unint64_t)(v9 - 3) <= 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PUPosterShuffleNextSignificantEventDateForDate(v10, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v4, "containsDate:", v11))
      {
        v12 = dbl_1AB0EF340[v9 == 3];
        BLSAlwaysOnTimelineClass = getBLSAlwaysOnTimelineClass();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __57__PUWallpaperPosterController__timelinesForDateInterval___block_invoke;
        v17[3] = &unk_1E58A2A00;
        v17[4] = self;
        objc_msgSend(BLSAlwaysOnTimelineClass, "timelineWithUpdateInterval:startDate:identifier:configure:", v11, CFSTR("shuffle-update"), v17, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
        v15 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v15;
      }

    }
  }

  return v6;
}

- (void)_updateWithFrameSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "entrySpecifierForTimelineIdentifier:", CFSTR("shuffle-update"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousTimelineEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "userObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterController setSignificantEventsCounter:](self, "setSignificantEventsCounter:", objc_msgSend(v6, "integerValue") + 1);

  }
}

- (id)_nextPosterMedia
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  unint64_t v13;
  NSObject *v14;
  uint8_t v15[16];

  -[PUWallpaperPosterController posterConfiguration](self, "posterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterController posterDescriptor](self, "posterDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "media");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    -[PUWallpaperPosterController posterDescriptor](self, "posterDescriptor");
  else
    -[PUWallpaperPosterController posterConfiguration](self, "posterConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "media");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "configurationType") != 1
    || (-[PUWallpaperPosterController environment](self, "environment"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "px_isPreview"),
        v8,
        (v9 & 1) != 0))
  {
    objc_msgSend(v7, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = (void *)v10;
    goto LABEL_8;
  }
  v13 = +[PUPosterUtilities mediaIndexWithSeed:mediaCount:](PUPosterUtilities, "mediaIndexWithSeed:mediaCount:", -[PUWallpaperPosterController significantEventsCounter](self, "significantEventsCounter"), objc_msgSend(v7, "count"));
  if (v13 < objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  PLWallpaperGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "Failed to get a next index that is in bounds of available media", v15, 2u);
  }

  v11 = 0;
LABEL_8:

  return v11;
}

- (void)_updateCurrentPosterMedia
{
  id v3;

  -[PUWallpaperPosterController _nextPosterMedia](self, "_nextPosterMedia");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterController setCurrentPosterMedia:](self, "setCurrentPosterMedia:", v3);

}

- (void)_invalidateCurrentPosterMedia
{
  -[PUWallpaperPosterController setCurrentPosterMedia:](self, "setCurrentPosterMedia:", 0);
  -[PUWallpaperPosterController setViewModel:](self, "setViewModel:", 0);
  -[PUWallpaperPosterController setNeedsFirstLockSignificantEvent:](self, "setNeedsFirstLockSignificantEvent:", 0);
}

- (void)setCurrentPosterMedia:(id)a3
{
  PFPosterMedia *v5;
  PFPosterMedia *v6;
  char v7;
  PFPosterMedia *currentPosterMedia;
  PFPosterMedia *v9;

  v9 = (PFPosterMedia *)a3;
  v5 = self->_currentPosterMedia;
  if (v5 == v9)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PFPosterMedia isEqual:](v5, "isEqual:", v9);

    if ((v7 & 1) == 0)
    {
      currentPosterMedia = self->_currentPosterMedia;
      objc_storeStrong((id *)&self->_currentPosterMedia, a3);
      -[PUWallpaperPosterController _loadContentForCurrentPosterMedia:](self, "_loadContentForCurrentPosterMedia:", currentPosterMedia != 0);
    }
  }

}

- (void)_loadContentForCurrentPosterMedia:(BOOL)a3
{
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  void (**v32)(_QWORD);
  id v33;
  BOOL v34;
  _QWORD aBlock[4];
  id v36;
  BOOL v37;
  id location;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PUWallpaperPosterController__loadContentForCurrentPosterMedia___block_invoke;
  aBlock[3] = &unk_1E58AA4A0;
  objc_copyWeak(&v36, &location);
  v37 = a3;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PUWallpaperPosterController currentPosterMedia](self, "currentPosterMedia");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PUWallpaperPosterController environment](self, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "px_isPlayground"))
      -[PUWallpaperPosterController _showProgressIndicator](self, "_showProgressIndicator");
    if (objc_msgSend(v8, "mediaType") == 3)
    {
      v10 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "px_descriptionForAssertionMessage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterController.m"), 1260, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("currentPosterMedia"), v24, v25);

      }
      -[PUWallpaperPosterController _showPosterMediaImage:](self, "_showPosterMediaImage:", v10);
LABEL_27:

      goto LABEL_28;
    }
    -[PUWallpaperPosterController _hidePosterMediaImage](self, "_hidePosterMediaImage");
    objc_msgSend(v9, "px_assetDirectory");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subpath");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterController renderer](self, "renderer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = objc_msgSend(v27, "px_blockingLoadPolicy");
      if (!v10)
      {
LABEL_14:
        if (v11 != 2)
        {
          -[PUWallpaperPosterController viewModel](self, "viewModel");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == 0;

          if (v15)
          {
            objc_msgSend(v8, "assetUUID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUWallpaperPosterController environment](self, "environment");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "px_isCallServices"))
            {
              -[PUWallpaperPosterController environment](self, "environment");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "px_isSnapshot");

            }
            else
            {
              v18 = 0;
            }

            -[PUWallpaperPosterController environment](self, "environment");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "px_isPlayground");

            if (v26 && v20 | v18)
            {
              -[PUWallpaperPosterController _loadAssetWithUUID:usePreviewLayers:](self, "_loadAssetWithUUID:usePreviewLayers:", v26, v18);
            }
            else
            {
              PLWallpaperGetLog();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v40 = v26;
                _os_log_impl(&dword_1AAB61000, v21, OS_LOG_TYPE_ERROR, "Invalid wallpaper directory for asset: %{public}@", buf, 0xCu);
              }

            }
            v7[2](v7);

          }
        }

        goto LABEL_27;
      }
    }
    else
    {
      v11 = 0;
      if (!v10)
        goto LABEL_14;
    }
    if (v28)
    {
      objc_msgSend(v10, "URLByAppendingPathComponent:", v28);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v6;
      v29[1] = 3221225472;
      v29[2] = __65__PUWallpaperPosterController__loadContentForCurrentPosterMedia___block_invoke_2;
      v29[3] = &unk_1E58A2A50;
      objc_copyWeak(&v33, &location);
      v32 = v7;
      v30 = v9;
      v13 = v12;
      v31 = v13;
      v34 = v11 == 2;
      -[PUWallpaperPosterController _loadAssetFromWallpaperURL:async:completion:](self, "_loadAssetFromWallpaperURL:async:completion:", v13, v11 == 2, v29);

      objc_destroyWeak(&v33);
    }
    goto LABEL_14;
  }
LABEL_28:

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

- (void)_renderPreviewLayerStackFromWallpaperURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint32_t v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  NSObject *v33;
  id v34;
  _QWORD v35[4];
  NSObject *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  NSObject *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__49814;
  v63 = __Block_byref_object_dispose__49815;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__49814;
  v57 = __Block_byref_object_dispose__49815;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__49814;
  v51 = __Block_byref_object_dispose__49815;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__49814;
  v45 = __Block_byref_object_dispose__49815;
  v46 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v7 = (void *)MEMORY[0x1E0D71298];
  -[PUWallpaperPosterController posterDescriptor](self, "posterDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "styleCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __72__PUWallpaperPosterController__renderPreviewLayerStackFromWallpaperURL___block_invoke;
  v35[3] = &unk_1E58A2A78;
  v37 = &v41;
  v38 = &v53;
  v39 = &v59;
  v40 = &v47;
  v10 = v6;
  v36 = v10;
  objc_msgSend(v7, "renderPreviewLayerStackFromWallpaperURL:styleCategory:completion:", v4, v9, v35);

  v11 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v10, v11);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v60[5])
  {
    if (v42[5])
    {
      PLWallpaperGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      v29 = v42[5];
      *(_DWORD *)buf = 138543618;
      v66 = v4;
      v67 = 2112;
      v68 = v29;
      v30 = "Failed to render layer stack from wallpaper url: %{public}@, error: %@";
    }
    else
    {
      PLWallpaperGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      objc_msgSend(v12, "timeIntervalSinceDate:", v5);
      *(_DWORD *)buf = 138543618;
      v66 = v4;
      v67 = 2048;
      v68 = v33;
      v30 = "Timed out waiting for layer stack to render from wallpaper url: %{public}@ after %0.1fs";
    }
    v31 = v23;
    v32 = 22;
    goto LABEL_20;
  }
  PLWallpaperGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v12, "timeIntervalSinceDate:", v5);
    *(_DWORD *)buf = 138543618;
    v66 = v4;
    v67 = 2048;
    v68 = v14;
    _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_INFO, "Generated cold start preview layer stack from wallpaper url: %{public}@ in %0.1fs", buf, 0x16u);
  }

  -[PUWallpaperPosterController _createViewModelWithLayerStack:style:](self, "_createViewModelWithLayerStack:style:", v60[5], v54[5]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterController setViewModel:](self, "setViewModel:", v15);

  if (v48[5])
  {
    PUWallpaperCacheDirectoryURL();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeItemAtURL:error:", v18, 0);

    v20 = v48[5];
    v21 = v60[5];
    v22 = v54[5];
    v34 = 0;
    LODWORD(v17) = objc_msgSend(MEMORY[0x1E0D71298], "saveSegmentationItem:compoundLayerStack:style:toWallpaperURL:error:", v20, v21, v22, v18, &v34);
    v23 = v34;
    if ((_DWORD)v17)
    {
      PLWallpaperGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v66 = v18;
        v25 = "Successfully cached cold start wallpaper to url: %{public}@";
        v26 = v24;
        v27 = OS_LOG_TYPE_INFO;
        v28 = 12;
LABEL_15:
        _os_log_impl(&dword_1AAB61000, v26, v27, v25, buf, v28);
      }
    }
    else
    {
      PLWallpaperGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v66 = v18;
        v67 = 2114;
        v68 = v23;
        v25 = "Failed to cache cold start wallpaper to url: %{public}@, error: %{public}@";
        v26 = v24;
        v27 = OS_LOG_TYPE_ERROR;
        v28 = 22;
        goto LABEL_15;
      }
    }

    goto LABEL_21;
  }
  PLWallpaperGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v66 = v4;
    v30 = "Failed to reload segmentation item from wallpaper url: %{public}@";
    v31 = v23;
    v32 = 12;
LABEL_20:
    _os_log_impl(&dword_1AAB61000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
  }
LABEL_21:

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

}

- (void)_loadAssetFromWallpaperURL:(id)a3 async:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD aBlock[4];
  id v23;
  id v24;
  id v25[2];
  BOOL v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  PLWallpaperGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v8;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_INFO, "Attempt to load wallpaper from poster url: %{public}@", buf, 0xCu);
  }

  if (-[PXPosterRenderingEnvironment px_isPreview](self->_environment, "px_isPreview"))
  {
    if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
      v11 = 136;
    else
      v11 = 8;
    if (!-[PXPosterRenderingEnvironment px_isSnapshot](self->_environment, "px_isSnapshot"))
      v11 |= 0x40uLL;
  }
  else
  {
    if (-[PUWallpaperPosterController wantsLowLuminanceContent](self, "wantsLowLuminanceContent"))
      v12 = 5;
    else
      v12 = 1;
    if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
      v13 = v12 | 0x22;
    else
      v13 = v12;
    -[PUWallpaperPosterController posterConfiguration](self, "posterConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "editConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isSettlingEffectEnabled");

    if (v16)
      v11 = v13 | 0x40;
    else
      v11 = v13;
  }
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PUWallpaperPosterController__loadAssetFromWallpaperURL_async_completion___block_invoke;
  aBlock[3] = &unk_1E58A2AC8;
  v17 = v8;
  v23 = v17;
  v25[1] = (id)v11;
  objc_copyWeak(v25, (id *)buf);
  v18 = v9;
  v24 = v18;
  v26 = v6;
  v19 = _Block_copy(aBlock);
  v20 = v19;
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "_nonBlockingLoadQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v21, v20);

  }
  else
  {
    (*((void (**)(void *))v19 + 2))(v19);
  }

  objc_destroyWeak(v25);
  objc_destroyWeak((id *)buf);

}

- (void)_loadAssetWithUUID:(id)a3 usePreviewLayers:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  dispatch_time_t v23;
  _QWORD v24[4];
  NSObject *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[2];

  v4 = a4;
  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PUWallpaperPosterController wantsLowLuminanceContent](self, "wantsLowLuminanceContent");
  v8 = 8;
  if (v4)
    v9 = 8;
  else
    v9 = 65;
  if (v4)
  {
    v10 = 128;
  }
  else
  {
    v8 = 69;
    v10 = 32;
  }
  if (v7)
    v11 = v8;
  else
    v11 = v9;
  if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
    v12 = v10;
  else
    v12 = 0;
  v13 = (void *)MEMORY[0x1E0CD1390];
  v34[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterController photoLibrary](self, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "librarySpecificFetchOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchAssetsWithUUIDs:options:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1818]), "initWithPhotoAsset:", v18);
    v20 = dispatch_group_create();
    dispatch_group_enter(v20);
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__49814;
    v32 = __Block_byref_object_dispose__49815;
    v33 = 0;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71298]), "initWithParallaxAsset:", v19);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __67__PUWallpaperPosterController__loadAssetWithUUID_usePreviewLayers___block_invoke;
    v24[3] = &unk_1E58A2AF0;
    v26 = &v28;
    v27 = v12 | v11;
    v22 = v20;
    v25 = v22;
    objc_msgSend(v21, "loadSegmentationItemWithCompletion:", v24);
    v23 = dispatch_time(0, 15000000000);
    dispatch_group_wait(v22, v23);
    -[PUWallpaperPosterController _handleSegmentationResponse:](self, "_handleSegmentationResponse:", v29[5]);

    _Block_object_dispose(&v28, 8);
  }

}

- (void)_handleSegmentationResponse:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  objc_msgSend(a3, "result:", &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (!v4)
  {
    PLWallpaperGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Failed to obtain segmentation result, error: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
  objc_msgSend(v4, "compoundLayerStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterController _createViewModelWithLayerStack:style:](self, "_createViewModelWithLayerStack:style:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterController setViewModel:](self, "setViewModel:", v7);

  -[PUWallpaperPosterController viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "settlingEffectEnabled");

  if ((_DWORD)v7)
  {
    -[PUWallpaperPosterController environment](self, "environment");
    v9 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject px_isPlayground](v9, "px_isPlayground") & 1) == 0)
    {
LABEL_8:

      goto LABEL_9;
    }
    -[PUWallpaperPosterController environment](self, "environment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "px_isSnapshot"))
    {

      goto LABEL_8;
    }
    -[PUWallpaperPosterController environment](self, "environment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "px_isPreview");

    if ((v12 & 1) == 0)
      -[PUWallpaperPosterController _playInitialSettlingEffect](self, "_playInitialSettlingEffect");
  }
LABEL_9:
  -[PUWallpaperPosterController _hideProgressIndicator](self, "_hideProgressIndicator");

}

- (id)_createViewModelWithLayerStack:(id)a3 style:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  PUParallaxLayerStackViewModel *v55;
  void *v56;
  PUParallaxLayerStackViewModel *v57;
  void *v59;
  void *v60;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[PUWallpaperPosterController posterConfiguration](self, "posterConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "configurationType") == 1)
  {
    objc_msgSend(v8, "shuffleConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shuffleType");

    if (v10 != 1)
    {
      objc_msgSend(v8, "editConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "compoundLayerStackByUpdatingPortraitDepthEnabled:landscapeDepthEnabled:", objc_msgSend(v11, "isDepthEnabled"), objc_msgSend(v11, "isLandscapeDepthEnabled"));
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v12;
    }
  }
  v13 = -[PXPosterRenderingEnvironment px_boundingShape](self->_environment, "px_boundingShape");
  if (-[PXPosterRenderingEnvironment px_isCallServices](self->_environment, "px_isCallServices")
    && v13 == 2)
  {
    objc_msgSend(v6, "layout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "portraitLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "visibleFrame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v15, "imageSize");
    v26 = v25;
    objc_msgSend(v15, "imageSize");
    -[PUWallpaperPosterController _getVisibleFrameForShape:visibleFrame:layerStack:userInfo:originalImage:](self, "_getVisibleFrameForShape:visibleFrame:layerStack:userInfo:originalImage:", 2, v6, v16, v18, v20, v22, v24, 0.0, 0.0, v26, v27);
    objc_msgSend(v15, "layoutByUpdatingVisibleFrame:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "layoutByUpdatingClockLayerOrder:", *MEMORY[0x1E0D75680]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "portraitLayerStack");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layerStackByUpdatingLayout:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75348]), "initWithPortraitLayerStack:landscapeLayerStack:", v31, 0);
    v6 = (id)v32;
  }
  else
  {
    if (-[PXPosterRenderingEnvironment px_isCallServices](self->_environment, "px_isCallServices"))
    {
      -[PXPosterRenderingEnvironment px_titleBoundsForLayout:](self->_environment, "px_titleBoundsForLayout:", 0);
      objc_msgSend(MEMORY[0x1E0D75340], "deviceCallServicesConfigurationWithTitleBounds:");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "portraitConfiguration");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "layout");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "portraitLayout");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "configuration");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v37, "isEqualToLayoutConfiguration:", v34) & 1) == 0)
      {
        objc_msgSend(v36, "layoutByConformingGenericConfigurationToDevice:", v34);
        v38 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "portraitLayerStack");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "layerStackByUpdatingLayout:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75348]), "initWithPortraitLayerStack:landscapeLayerStack:", v40, 0);
        v36 = (void *)v38;
        v6 = (id)v41;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D751A8], "deviceConfigurationForOrientation:", 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layout");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "portraitLayout");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v43, "configuration");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v44, "isEqualToLayoutConfiguration:", v34) & 1) == 0)
      {
        v60 = v44;
        PLWallpaperGetLog();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AAB61000, v45, OS_LOG_TYPE_DEFAULT, "Layout configuration mismatch detected, updating layout for current device", buf, 2u);
        }

        objc_msgSend(v43, "layoutByUpdatingConfiguration:", v34);
        v46 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D751A8], "deviceConfigurationForOrientation:", 2);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "layout");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "landscapeLayout");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "layoutByUpdatingConfiguration:", v59);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "portraitLayerStack");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "layerStackByUpdatingLayout:", v46);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "landscapeLayerStack");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "layerStackByUpdatingLayout:", v49);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        v54 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75348]), "initWithPortraitLayerStack:landscapeLayerStack:", v51, v53);
        v43 = (void *)v46;
        v6 = (id)v54;
        v44 = v60;
      }

    }
  }
  v55 = [PUParallaxLayerStackViewModel alloc];
  -[PUWallpaperPosterController environment](self, "environment");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = -[PUParallaxLayerStackViewModel initWithCompoundLayerStack:style:deviceOrientation:](v55, "initWithCompoundLayerStack:style:deviceOrientation:", v6, v7, objc_msgSend(v56, "px_deviceOrientation"));

  return v57;
}

- (void)_showPosterMediaImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PUWallpaperPosterController posterMediaImageView](self, "posterMediaImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(v4, "setContentMode:", 2);
    -[PUWallpaperPosterController renderer](self, "renderer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "bounds");
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v4, "setAutoresizingMask:", 18);
    objc_msgSend(v6, "addSubview:", v4);
    -[PUWallpaperPosterController setPosterMediaImageView:](self, "setPosterMediaImageView:", v4);

  }
  v7 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v10, "imageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setImage:", v9);
}

- (void)_hidePosterMediaImage
{
  void *v3;
  id v4;

  -[PUWallpaperPosterController posterMediaImageView](self, "posterMediaImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterController setPosterMediaImageView:](self, "setPosterMediaImageView:", 0);
  v3 = v4;
  if (v4)
  {
    objc_msgSend(v4, "removeFromSuperview");
    v3 = v4;
  }

}

- (id)_nameForBacklightLuminance:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 3)
    return CFSTR("Full");
  else
    return off_1E58A2B68[a3 + 1];
}

- (void)_updatePreferences
{
  void *v3;
  _QWORD v4[5];

  -[PUWallpaperPosterController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__PUWallpaperPosterController__updatePreferences__block_invoke;
  v4[3] = &unk_1E58AB148;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (CGRect)_getVisibleFrameForShape:(int64_t)a3 visibleFrame:(CGRect)a4 layerStack:(id)a5 userInfo:(id)a6 originalImage:(CGRect)a7
{
  CGFloat height;
  CGFloat width;
  double v10;
  double v11;
  double v12;
  double v13;
  id v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  const __CFDictionary *v39;
  BOOL v40;
  CGSize v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  const __CFDictionary *v53;
  BOOL v54;
  CGSize v55;
  NSObject *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  double v74;
  double x;
  double y;
  CGRect rect;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t v82[4];
  const __CFDictionary *v83;
  CGRect buf;
  _BYTE v85[128];
  uint64_t v86;
  CGRect v87;
  CGRect v88;
  CGRect result;
  CGRect v90;

  height = a7.size.height;
  width = a7.size.width;
  x = a7.origin.x;
  y = a7.origin.y;
  v10 = a4.size.height;
  v11 = a4.size.width;
  v12 = a4.origin.y;
  v13 = a4.origin.x;
  v86 = *MEMORY[0x1E0C80C00];
  v16 = a6;
  if (a3 == 2)
  {
    v73 = width;
    v74 = height;
    -[PUWallpaperPosterController _getFaceRects:userInfo:](self, "_getFaceRects:userInfo:", a5, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C9D628];
    v20 = *MEMORY[0x1E0C9D628];
    v19 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v22 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v23 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v79 != v25)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "CGRectValue");
          v90.origin.x = v27;
          v90.origin.y = v28;
          v90.size.width = v29;
          v90.size.height = v30;
          v87.origin.x = v20;
          v87.origin.y = v19;
          v87.size.width = v22;
          v87.size.height = v21;
          v88 = CGRectUnion(v87, v90);
          v20 = v88.origin.x;
          v19 = v88.origin.y;
          v22 = v88.size.width;
          v21 = v88.size.height;
        }
        v24 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
      }
      while (v24);
    }
    -[PUWallpaperPosterController _getNormalizedRectForSaliencyRect:originalImage:visibleFrame:](self, "_getNormalizedRectForSaliencyRect:originalImage:visibleFrame:", v20, v19, v22, v21, x, y, v73, v74, *(_QWORD *)&v13, *(_QWORD *)&v12, *(_QWORD *)&v11, *(_QWORD *)&v10);
    v71 = v32;
    v72 = v31;
    v33 = *(double *)(MEMORY[0x1E0D71110] + 8) + *(double *)(MEMORY[0x1E0D71110] + 24);
    v70 = v34;
    v36 = v35 + v34;
    memset(&rect, 0, sizeof(rect));
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("regions"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("acceptable"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = v38;
    if (v39 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v40 = CGRectMakeWithDictionaryRepresentation(v39, &rect);

      if (v40)
        goto LABEL_17;
    }
    else
    {

    }
    v41 = *(CGSize *)(v18 + 16);
    rect.origin = *(CGPoint *)v18;
    rect.size = v41;
    PLWallpaperGetLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.origin.x) = 138412290;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v39;
      _os_log_impl(&dword_1AAB61000, v42, OS_LOG_TYPE_ERROR, "Expected a rect value: %@", (uint8_t *)&buf, 0xCu);
    }

LABEL_17:
    v69 = v33 - v36;
    -[PUWallpaperPosterController _getNormalizedRectForSaliencyRect:originalImage:visibleFrame:](self, "_getNormalizedRectForSaliencyRect:originalImage:visibleFrame:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, x, y, v73, v74, *(_QWORD *)&v13, *(_QWORD *)&v12, *(_QWORD *)&v11, *(_QWORD *)&v10);
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v50 = v49;
    memset(&buf, 0, sizeof(buf));
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("regions"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("preferred"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = v52;
    if (v53 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v54 = CGRectMakeWithDictionaryRepresentation(v53, &buf);

      if (v54)
      {
LABEL_25:
        -[PUWallpaperPosterController _getNormalizedRectForSaliencyRect:originalImage:visibleFrame:](self, "_getNormalizedRectForSaliencyRect:originalImage:visibleFrame:", buf.origin.x, buf.origin.y, *(_OWORD *)&buf.size, x, y, v73, v74, *(_QWORD *)&v13, *(_QWORD *)&v12, *(_QWORD *)&v11, *(_QWORD *)&v10);
        -[PUWallpaperPosterController _getSquareCropForVisibleFrame:preferredCropCrect:acceptableCropRect:faceRect:](self, "_getSquareCropForVisibleFrame:preferredCropCrect:acceptableCropRect:faceRect:", v13, v12, v11, v10, v57, v58, v59, v60, v44, v46, v48, v50, v72, *(_QWORD *)&v69, v71, *(_QWORD *)&v70);
        v13 = v61;
        v12 = v62;
        v11 = v63;
        v10 = v64;

        goto LABEL_26;
      }
    }
    else
    {

    }
    v55 = *(CGSize *)(v18 + 16);
    buf.origin = *(CGPoint *)v18;
    buf.size = v55;
    PLWallpaperGetLog();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v82 = 138412290;
      v83 = v53;
      _os_log_impl(&dword_1AAB61000, v56, OS_LOG_TYPE_ERROR, "Expected a rect value: %@", v82, 0xCu);
    }

    goto LABEL_25;
  }
LABEL_26:

  v65 = v13;
  v66 = v12;
  v67 = v11;
  v68 = v10;
  result.size.height = v68;
  result.size.width = v67;
  result.origin.y = v66;
  result.origin.x = v65;
  return result;
}

- (double)_getNormalizedRectForSaliencyRect:(double)a3 originalImage:(double)a4 visibleFrame:(double)a5
{
  double v16;
  double v17;
  CGRect v19;
  CGRect v20;

  v16 = *MEMORY[0x1E0C9D628];
  if (!CGRectEqualToRect(*(CGRect *)&a1, *MEMORY[0x1E0C9D628]))
  {
    PXRectDenormalize();
    v20.origin.x = a9;
    v20.origin.y = a10;
    v20.size.width = a11;
    v20.size.height = a12;
    CGRectIntersection(v19, v20);
    PXRectNormalize();
    return v17;
  }
  return v16;
}

- (uint64_t)_getSquareCropForVisibleFrame:(double)a3 preferredCropCrect:(double)a4 acceptableCropRect:(double)a5 faceRect:(double)a6
{
  objc_msgSend(MEMORY[0x1E0D750F0], "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", (unint64_t)a3, (unint64_t)a4, 0, 1.0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, a17, a18, a19, a20,
    a21,
    a22);
  return PXRectDenormalize();
}

- (id)_getFaceRects:(id)a3 userInfo:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  void *v13;
  CGRect v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("regions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faces"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(const __CFDictionary **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        memset(&v15, 0, sizeof(v15));
        if (CGRectMakeWithDictionaryRepresentation(v12, &v15))
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", *(_OWORD *)&v15.origin, *(_OWORD *)&v15.size);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (BOOL)blurredSettlingEffect
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PU_UNBLURRED_SETTLING_EFFECT"));

  return v3 ^ 1;
}

- (void)_playSettlingEffect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _BYTE buf[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLayerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForLayer:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "foregroundLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForLayer:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "videoLayerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PUWallpaperPosterController _observeCurrentPlayerItem](self, "_observeCurrentPlayerItem");
    -[PUWallpaperPosterController _beginExtendedRenderSession](self, "_beginExtendedRenderSession");
    PLWallpaperGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[PUWallpaperPosterController _nameForBacklightLuminance:](self, "_nameForBacklightLuminance:", -[PUWallpaperPosterController backlightLuminance](self, "backlightLuminance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_INFO, "Beginning settling effect with backlight luminance: %@", buf, 0xCu);

    }
    objc_msgSend(v7, "setAlpha:", 0.0);
    objc_msgSend(v9, "setAlpha:", 0.0);
    if (-[PUWallpaperPosterController blurredSettlingEffect](self, "blurredSettlingEffect"))
    {
      objc_msgSend(v10, "setAlpha:", 1.0);
      objc_msgSend(v10, "player");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
      *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      objc_msgSend(v13, "seekToTime:", buf);

      objc_msgSend(v10, "player");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject play](v14, "play");
    }
    else
    {
      objc_msgSend(v10, "player");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pause");

      objc_msgSend(v10, "player");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
      *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      objc_msgSend(v16, "seekToTime:", buf);

      -[PUWallpaperPosterController alphaAnimator](self, "alphaAnimator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stopAnimation:", 1);

      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithAnimationCurve:", 0);
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:timingParameters:", v14, 0.2);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __50__PUWallpaperPosterController__playSettlingEffect__block_invoke;
      v25[3] = &unk_1E58ABD10;
      v19 = v10;
      v26 = v19;
      objc_msgSend(v18, "addAnimations:", v25);
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __50__PUWallpaperPosterController__playSettlingEffect__block_invoke_2;
      v23 = &unk_1E58A2B20;
      v24 = v19;
      objc_msgSend(v18, "addCompletion:", &v20);
      objc_msgSend(v18, "startAnimation", v20, v21, v22, v23);
      -[PUWallpaperPosterController setAlphaAnimator:](self, "setAlphaAnimator:", v18);

    }
  }
  else
  {
    PLWallpaperGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = 0;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "Unable to play settling effect: video layer: %@, layer stack: %@", buf, 0x16u);
    }
  }

}

- (void)_playInitialSettlingEffect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  -[PUWallpaperPosterController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoLayerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterController renderer](self, "renderer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bringSubviewToFront:", v5);
  objc_msgSend(v5, "setAlpha:", 0.0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithAnimationCurve:", 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:timingParameters:", v8, 0.2);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__PUWallpaperPosterController__playInitialSettlingEffect__block_invoke;
  v12[3] = &unk_1E58ABD10;
  v13 = v5;
  v10 = v5;
  objc_msgSend(v9, "addAnimations:", v12);
  objc_msgSend(v9, "startAnimation");
  -[PUWallpaperPosterController _observeCurrentPlayerItem](self, "_observeCurrentPlayerItem");
  -[PUWallpaperPosterController _beginExtendedRenderSession](self, "_beginExtendedRenderSession");
  objc_msgSend(v10, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "play");

}

- (void)_startLoopingSettlingEffectForGallery
{
  void *v3;
  int v4;
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
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _BYTE buf[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldLoopSettlingEffectForGallery");

  if (v4)
  {
    -[PUWallpaperPosterController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentLayerStack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "foregroundLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewForLayer:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "backgroundLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewForLayer:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "videoLayerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoLayerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "player");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[PUWallpaperPosterController _observeCurrentPlayerItem](self, "_observeCurrentPlayerItem");
      v15 = objc_msgSend(v14, "status");
      if (v15 == 1
        && !-[PUWallpaperPosterController loopingSettlingEffectForGallery](self, "loopingSettlingEffectForGallery"))
      {
        v26 = v9;
        PLWallpaperGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AAB61000, v21, OS_LOG_TYPE_INFO, "Started looping settling effect in gallery", buf, 2u);
        }

        -[PUWallpaperPosterController setLoopingSettlingEffectForGallery:](self, "setLoopingSettlingEffectForGallery:", 1);
        -[PUWallpaperPosterController _updateViewHierarchy](self, "_updateViewHierarchy");
        objc_msgSend(v14, "pause");
        *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
        *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        objc_msgSend(v14, "seekToTime:", buf);
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithAnimationCurve:", 0);
        v22 = objc_alloc(MEMORY[0x1E0DC3F38]);
        -[PUWallpaperPosterController renderer](self, "renderer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "px_lowLuminanceAlphaAnimationDuration");
        v24 = (void *)objc_msgSend(v22, "initWithDuration:timingParameters:", v16);

        v25 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __68__PUWallpaperPosterController__startLoopingSettlingEffectForGallery__block_invoke;
        v29[3] = &unk_1E58ABCA8;
        v30 = v11;
        v31 = v26;
        objc_msgSend(v24, "addAnimations:", v29);
        v27[0] = v25;
        v9 = v26;
        v27[1] = 3221225472;
        v27[2] = __68__PUWallpaperPosterController__startLoopingSettlingEffectForGallery__block_invoke_2;
        v27[3] = &unk_1E58A2B20;
        v28 = v14;
        objc_msgSend(v24, "addCompletion:", v27);
        objc_msgSend(v24, "startAnimation");

        goto LABEL_13;
      }
      PLWallpaperGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v15;
        v17 = "Looping settling effect in gallery failed with invalid player status: %ld";
        v18 = v16;
        v19 = OS_LOG_TYPE_INFO;
        v20 = 12;
LABEL_9:
        _os_log_impl(&dword_1AAB61000, v18, v19, v17, buf, v20);
      }
    }
    else
    {
      PLWallpaperGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = 0;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v7;
        v17 = "Failed to start looping settling effect in gallery: video layer: %@, layer stack: %@";
        v18 = v16;
        v19 = OS_LOG_TYPE_ERROR;
        v20 = 22;
        goto LABEL_9;
      }
    }
LABEL_13:

  }
}

- (void)_lowPowerModeChanged:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__PUWallpaperPosterController__lowPowerModeChanged___block_invoke;
  v3[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_handleLowPowerModeChanged
{
  void *v3;
  id v4;

  -[PUWallpaperPosterController viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "settlingEffectEnabled"))
  {
    if (objc_msgSend(v4, "canCreateSettlingEffectLayerView"))
    {
      -[PUWallpaperPosterController _updateViewHierarchy](self, "_updateViewHierarchy");
    }
    else
    {
      objc_msgSend(v4, "viewManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "releaseVideoLayerView");

      -[PUWallpaperPosterController _observeCurrentPlayerItem](self, "_observeCurrentPlayerItem");
    }
  }

}

- (void)_playerItemDidFinish:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__PUWallpaperPosterController__playerItemDidFinish___block_invoke;
  v3[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_handlePlayerItemDidFinish
{
  NSObject *v3;
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
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  dispatch_time_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  PUWallpaperPosterController *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD block[4];
  void *v38;
  id v39;
  _OWORD v40[3];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  PLWallpaperGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[PUWallpaperPosterController _nameForBacklightLuminance:](self, "_nameForBacklightLuminance:", -[PUWallpaperPosterController backlightLuminance](self, "backlightLuminance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v45 = v4;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_INFO, "Finished playing settling effect with backlight luminance: %@", buf, 0xCu);

  }
  if (-[PUWallpaperPosterController backlightLuminance](self, "backlightLuminance") == 2)
  {
    -[PUWallpaperPosterController renderer](self, "renderer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterController viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v7;
    objc_msgSend(v7, "currentLayerStack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backgroundLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewForLayer:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v9;
    objc_msgSend(v9, "foregroundLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewForLayer:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "videoLayerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "player");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PUWallpaperPosterController loopingSettlingEffectForGallery](self, "loopingSettlingEffectForGallery"))
    {
      objc_msgSend(v15, "pause");
      objc_msgSend(v14, "snapshotViewAfterScreenUpdates:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      objc_msgSend(v16, "setBounds:");
      objc_msgSend(v14, "center");
      objc_msgSend(v16, "setCenter:");
      if (v14)
      {
        objc_msgSend(v14, "transform");
      }
      else
      {
        v42 = 0u;
        v43 = 0u;
        v41 = 0u;
      }
      v40[0] = v41;
      v40[1] = v42;
      v40[2] = v43;
      objc_msgSend(v16, "setTransform:", v40);
      objc_msgSend(v6, "addSubview:", v16);
      v24 = v6;
      v26 = dispatch_time(0, 50000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke;
      block[3] = &unk_1E58ABCA8;
      v38 = v15;
      v39 = v16;
      v19 = v15;
      v18 = v16;
      dispatch_after(v26, MEMORY[0x1E0C80D38], block);

      v22 = v38;
    }
    else
    {
      -[PUWallpaperPosterController renderer](self, "renderer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "backgroundView");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "insertSubview:belowSubview:", v14, v11);
      v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithAnimationCurve:", 0);
      v27 = v6;
      v20 = objc_alloc(MEMORY[0x1E0DC3F38]);
      -[PUWallpaperPosterController renderer](self, "renderer");
      v28 = v5;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "px_lowLuminanceAlphaAnimationDuration");
      v22 = (void *)objc_msgSend(v20, "initWithDuration:timingParameters:", v19);

      v23 = MEMORY[0x1E0C809B0];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_4;
      v34[3] = &unk_1E58ABCA8;
      v35 = v11;
      v36 = v13;
      objc_msgSend(v22, "addAnimations:", v34);
      v31[0] = v23;
      v31[1] = 3221225472;
      v31[2] = __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_5;
      v31[3] = &unk_1E58A2B48;
      v32 = v15;
      v33 = self;
      v24 = v27;
      v25 = v15;
      objc_msgSend(v22, "addCompletion:", v31);
      objc_msgSend(v22, "startAnimation");

      v5 = v28;
    }

  }
}

- (void)_observeCurrentPlayerItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;

  -[PUWallpaperPosterController observedPlayerItem](self, "observedPlayerItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoLayerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 != v7)
  {
    v8 = (_QWORD *)MEMORY[0x1E0C8AC48];
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObserver:name:object:", self, *v8, v11);

      objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("status"), &PlayerItemObservationContext_49759);
    }
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__playerItemDidFinish_, *v8, v7);

      objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 0, &PlayerItemObservationContext_49759);
    }
    -[PUWallpaperPosterController setObservedPlayerItem:](self, "setObservedPlayerItem:", v7);
  }

}

- (void)_beginExtendedRenderSession
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  -[PUWallpaperPosterController _endExtendedRenderSession](self, "_endExtendedRenderSession");
  PLWallpaperGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_INFO, "Beginning extended render session", v6, 2u);
  }

  -[PUWallpaperPosterController renderer](self, "renderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_extendRenderSessionForReason:", CFSTR("PhotosSettlingEffect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterController setRenderSessionExtension:](self, "setRenderSessionExtension:", v5);

}

- (void)_endExtendedRenderSession
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[PUWallpaperPosterController renderSessionExtension](self, "renderSessionExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    PLWallpaperGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_INFO, "Ending extended render session", v6, 2u);
    }

  }
  -[PUWallpaperPosterController renderSessionExtension](self, "renderSessionExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_invalidate");

  -[PUWallpaperPosterController setRenderSessionExtension:](self, "setRenderSessionExtension:", 0);
}

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint8_t v11[16];

  v6 = a4;
  v7 = a3;
  PLWallpaperGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_INFO, "renderer initialize", v11, 2u);
  }

  -[PUWallpaperPosterController _registerForNotificationsFromRenderer:](self, "_registerForNotificationsFromRenderer:", v7);
  -[PUWallpaperPosterController setEnvironment:](self, "setEnvironment:", v6);
  -[PUWallpaperPosterController viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "settlingEffectEnabled");

  if (v10 && (objc_msgSend(v6, "px_isSnapshot") & 1) == 0 && (objc_msgSend(v6, "px_isPreview") & 1) == 0)
    -[PUWallpaperPosterController _playInitialSettlingEffect](self, "_playInitialSettlingEffect");

}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  -[PUWallpaperPosterController setEnvironment:](self, "setEnvironment:", a4);
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "renderer invalidate", v6, 2u);
  }

  -[PUWallpaperPosterController _unregisterForNotificationsFromRenderer:](self, "_unregisterForNotificationsFromRenderer:", v4);
  PFSharedFigDecodeSessionDiscardCachedBuffers();
  -[PUWallpaperPosterController setEnvironment:](self, "setEnvironment:", 0);
}

- (void)_registerForNotificationsFromRenderer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("layer.bounds"), 0, &BackgroundViewObservationContext_49758);

  objc_msgSend(v4, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_alwaysOnEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__updateSignificantEvents, *MEMORY[0x1E0DC4838], 0);

}

- (void)_unregisterForNotificationsFromRenderer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("layer.bounds"), &BackgroundViewObservationContext_49758);

  objc_msgSend(v4, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_alwaysOnEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4838], 0);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  id v9;
  id v10;
  char v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;

  v6 = a4;
  v9 = a3;
  if (a5 == "ViewModelObservationContext")
  {
    v17 = v9;
    v10 = v9;
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "px_descriptionForAssertionMessage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterController.m"), 2013, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("observable"), v14, v16);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterController.m"), 2013, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("observable"), v14);
    }

LABEL_4:
    v11 = objc_msgSend(v10, "currentLayerStackPropertiesChange");
    if ((*(_QWORD *)&v6 & 0x80002) != 0)
    {
      -[PUWallpaperPosterController _removeExistingViews](self, "_removeExistingViews");
      -[PUWallpaperPosterController _updateViewHierarchy](self, "_updateViewHierarchy");
    }
    if (v6 & 0x1000 | (unint64_t)(v11 & 5))
    {
      -[PUWallpaperPosterController _updateViewHierarchy](self, "_updateViewHierarchy");
      if ((v6 & 0x80) == 0)
      {
LABEL_8:
        if ((v6 & 0x200000) == 0)
        {
LABEL_10:

          v9 = v17;
          goto LABEL_11;
        }
LABEL_9:
        -[PUWallpaperPosterController _startLoopingSettlingEffectForGallery](self, "_startLoopingSettlingEffectForGallery");
        goto LABEL_10;
      }
    }
    else if ((v6 & 0x80) == 0)
    {
      goto LABEL_8;
    }
    -[PUWallpaperPosterController _updateBacklightLuminance](self, "_updateBacklightLuminance");
    if ((v6 & 0x200000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_11:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  objc_super v20;
  CMTime v21;
  CMTime time;
  CMTime v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[PUWallpaperPosterController observedPlayerItem](self, "observedPlayerItem");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if ((void *)BackgroundViewObservationContext_49758 == a6)
  {
    -[PUWallpaperPosterController _updateContainerFrame](self, "_updateContainerFrame");
  }
  else if ((void *)PlayerItemObservationContext_49759 == a6)
  {
    if ((id)v13 == v11)
    {
      v15 = objc_msgSend(v11, "status");
      if (v15 == 1)
      {
        objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "disableMADForSettlingEffect");

        if (v19)
        {
          if (v11)
            objc_msgSend(v11, "duration");
          else
            memset(&time, 0, sizeof(time));
          CMTimeMultiplyByFloat64(&v23, &time, 0.5);
          v21 = v23;
          objc_msgSend(v11, "setForwardPlaybackEndTime:", &v21);
        }
        -[PUWallpaperPosterController _startLoopingSettlingEffectForGallery](self, "_startLoopingSettlingEffectForGallery");
      }
      else if (v15 == 2)
      {
        PLWallpaperGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v11, "error");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v25 = v17;
          _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, "Settling effect video failed to load: %@", buf, 0xCu);

        }
      }
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)PUWallpaperPosterController;
    -[PUWallpaperPosterController observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_updateDebugHUD
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterController posterConfiguration](self, "posterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "posterType");

  if (v4 == 2)
  {
    -[PUWallpaperPosterController posterConfiguration](self, "posterConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "media");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = -[PUWallpaperPosterController significantEventsCounter](self, "significantEventsCounter");
    if (v8 < -[PUWallpaperPosterController significantEventsCounter](self, "significantEventsCounter") + 30)
    {
      v9 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld, "), +[PUPosterUtilities mediaIndexWithSeed:mediaCount:](PUPosterUtilities, "mediaIndexWithSeed:mediaCount:", v8, objc_msgSend(v6, "count")));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v10);

        if (v9 == objc_msgSend(v6, "count"))
        {
          objc_msgSend(v7, "addObject:", CFSTR("\n"));
          v9 = 0;
        }
        ++v9;
        ++v8;
      }
      while (v8 < -[PUWallpaperPosterController significantEventsCounter](self, "significantEventsCounter") + 30);
    }
    v11 = +[PUPosterUtilities mediaIndexWithSeed:mediaCount:](PUPosterUtilities, "mediaIndexWithSeed:mediaCount:", -[PUWallpaperPosterController significantEventsCounter](self, "significantEventsCounter"), objc_msgSend(v6, "count"));
    -[PUWallpaperPosterController viewModel](self, "viewModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "viewManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "debugInfoView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = CFSTR("Signif. event counter");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PUWallpaperPosterController significantEventsCounter](self, "significantEventsCounter"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v21[1] = CFSTR("Media index");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v17;
    v21[2] = CFSTR("Media queue");
    objc_msgSend(v7, "componentsJoinedByString:", &stru_1E58AD278);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayAdditionalDebugInfo:", v19);

  }
}

- (PUParallaxLayerStackViewModel)viewModel
{
  return self->_viewModel;
}

- (PXPosterRenderer)renderer
{
  return self->_renderer;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXPosterRenderingEnvironment)environment
{
  return self->_environment;
}

- (PFPosterDescriptor)posterDescriptor
{
  return self->_posterDescriptor;
}

- (PFPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (PFPosterMedia)currentPosterMedia
{
  return self->_currentPosterMedia;
}

- (BOOL)needsFirstLockSignificantEvent
{
  return self->_needsFirstLockSignificantEvent;
}

- (void)setNeedsFirstLockSignificantEvent:(BOOL)a3
{
  self->_needsFirstLockSignificantEvent = a3;
}

- (UIActivityIndicatorView)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setProgressIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicator, a3);
}

- (UIImageView)posterMediaImageView
{
  return self->_posterMediaImageView;
}

- (void)setPosterMediaImageView:(id)a3
{
  objc_storeStrong((id *)&self->_posterMediaImageView, a3);
}

- (int64_t)backlightLuminance
{
  return self->_backlightLuminance;
}

- (UIViewPropertyAnimator)transformAnimator
{
  return self->_transformAnimator;
}

- (void)setTransformAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_transformAnimator, a3);
}

- (UIViewPropertyAnimator)alphaAnimator
{
  return self->_alphaAnimator;
}

- (void)setAlphaAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_alphaAnimator, a3);
}

- (BOOL)needsUpgrade
{
  return self->_needsUpgrade;
}

- (void)setNeedsUpgrade:(BOOL)a3
{
  self->_needsUpgrade = a3;
}

- (NSDate)lastUpgradeCheckTime
{
  return self->_lastUpgradeCheckTime;
}

- (void)setLastUpgradeCheckTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpgradeCheckTime, a3);
}

- (double)nextUpgradeCheckDelay
{
  return self->_nextUpgradeCheckDelay;
}

- (void)setNextUpgradeCheckDelay:(double)a3
{
  self->_nextUpgradeCheckDelay = a3;
}

- (UILabel)debugHUDLabel
{
  return self->_debugHUDLabel;
}

- (void)setDebugHUDLabel:(id)a3
{
  objc_storeStrong((id *)&self->_debugHUDLabel, a3);
}

- (AVPlayerItem)observedPlayerItem
{
  return self->_observedPlayerItem;
}

- (void)setObservedPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_observedPlayerItem, a3);
}

- (PXInvalidatable)renderSessionExtension
{
  return self->_renderSessionExtension;
}

- (void)setRenderSessionExtension:(id)a3
{
  objc_storeStrong((id *)&self->_renderSessionExtension, a3);
}

- (BOOL)loopingSettlingEffectForGallery
{
  return self->_loopingSettlingEffectForGallery;
}

- (void)setLoopingSettlingEffectForGallery:(BOOL)a3
{
  self->_loopingSettlingEffectForGallery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderSessionExtension, 0);
  objc_storeStrong((id *)&self->_observedPlayerItem, 0);
  objc_storeStrong((id *)&self->_debugHUDLabel, 0);
  objc_storeStrong((id *)&self->_lastUpgradeCheckTime, 0);
  objc_storeStrong((id *)&self->_alphaAnimator, 0);
  objc_storeStrong((id *)&self->_transformAnimator, 0);
  objc_storeStrong((id *)&self->_posterMediaImageView, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_currentPosterMedia, 0);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
  objc_storeStrong((id *)&self->_posterDescriptor, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_wallpaperService, 0);
}

void __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  uint64_t v11;

  v2 = *(void **)(a1 + 32);
  v10 = *MEMORY[0x1E0CA2E68];
  v11 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v2, "seekToTime:", &v10);
  v3 = MEMORY[0x1E0C809B0];
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_2;
  v8[3] = &unk_1E58ABD10;
  v9 = *(id *)(a1 + 40);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_3;
  v5[3] = &unk_1E58AAE08;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "animateWithDuration:animations:completion:", v8, v5, 0.3);

}

uint64_t __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  __int128 v5;
  uint64_t v6;

  if (!a2)
  {
    v3 = *(void **)(a1 + 32);
    v5 = *MEMORY[0x1E0CA2E68];
    v6 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    objc_msgSend(v3, "seekToTime:", &v5);
    objc_msgSend(*(id *)(a1 + 32), "pause");
  }
  return objc_msgSend(*(id *)(a1 + 40), "_endExtendedRenderSession");
}

uint64_t __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __57__PUWallpaperPosterController__handlePlayerItemDidFinish__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "play");
}

void __52__PUWallpaperPosterController__playerItemDidFinish___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePlayerItemDidFinish");

}

void __52__PUWallpaperPosterController__lowPowerModeChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleLowPowerModeChanged");

}

uint64_t __68__PUWallpaperPosterController__startLoopingSettlingEffectForGallery__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __68__PUWallpaperPosterController__startLoopingSettlingEffectForGallery__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "play");
}

uint64_t __57__PUWallpaperPosterController__playInitialSettlingEffect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __50__PUWallpaperPosterController__playSettlingEffect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __50__PUWallpaperPosterController__playSettlingEffect__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "player");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "play");

}

void __49__PUWallpaperPosterController__updatePreferences__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t Bool;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "px_isSnapshot") & 1) != 0)
    Bool = 0;
  else
    Bool = PXPreferencesGetBool();
  objc_msgSend(v5, "setShowsDebugHUD:", Bool);

}

void __67__PUWallpaperPosterController__loadAssetWithUUID_usePreviewLayers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  __int128 v10;
  _QWORD v11[4];
  __int128 v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71220]), "initWithSegmentationItem:", v5);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", 0);
    -[NSObject setPriority:](v7, "setPriority:", v8);

    -[NSObject setLayerStackOptions:](v7, "setLayerStackOptions:", *(_QWORD *)(a1 + 48));
    -[NSObject setSettlingEffectEnabled:](v7, "setSettlingEffectEnabled:", objc_msgSend(v5, "isSettlingEffectAvailable"));
    if (-[NSObject isSettlingEffectEnabled](v7, "isSettlingEffectEnabled"))
      -[NSObject setLayerStackOptions:](v7, "setLayerStackOptions:", -[NSObject layerStackOptions](v7, "layerStackOptions") | 0x40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__PUWallpaperPosterController__loadAssetWithUUID_usePreviewLayers___block_invoke_2;
    v11[3] = &unk_1E58A7030;
    v10 = *(_OWORD *)(a1 + 32);
    v9 = (id)v10;
    v12 = v10;
    -[NSObject submit:](v7, "submit:", v11);

  }
  else
  {
    PLWallpaperGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Failed to load PHAsset, error: %@", buf, 0xCu);
    }
  }

}

void __67__PUWallpaperPosterController__loadAssetWithUUID_usePreviewLayers___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __75__PUWallpaperPosterController__loadAssetFromWallpaperURL_async_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 56);
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0D71298], "loadCompoundLayerStackFromWallpaperURL:options:error:", v2, v3, &v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v18;
  objc_msgSend(MEMORY[0x1E0D71298], "loadStyleFromWallpaperURL:error:", *(_QWORD *)(a1 + 32), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__PUWallpaperPosterController__loadAssetFromWallpaperURL_async_completion___block_invoke_2;
  v12[3] = &unk_1E58A2AA0;
  v7 = v4;
  v13 = v7;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v8 = v6;
  v14 = v8;
  v16 = *(id *)(a1 + 40);
  v9 = v5;
  v15 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(v12);
  v11 = v10;
  if (*(_BYTE *)(a1 + 64))
    dispatch_async(MEMORY[0x1E0C80D38], v10);
  else
    v10[2](v10);

  objc_destroyWeak(&v17);
}

void __75__PUWallpaperPosterController__loadAssetFromWallpaperURL_async_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_createViewModelWithLayerStack:style:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v3 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __72__PUWallpaperPosterController__renderPreviewLayerStackFromWallpaperURL___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a5);
  v21 = a5;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v10;
  v14 = v10;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;
  v17 = v9;

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v11;
  v20 = v11;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __65__PUWallpaperPosterController__loadContentForCurrentPosterMedia___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hideProgressIndicator");

  if (*(_BYTE *)(a1 + 40))
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "renderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_noteContentSignificantlyChanged");

  }
}

void __65__PUWallpaperPosterController__loadContentForCurrentPosterMedia___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  int v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  id v16;
  _BOOL8 v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "setViewModel:", v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "px_isPreview");
    PLWallpaperGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v26 = v11;
        v27 = 2114;
        v28 = v6;
        _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_INFO, "Failed to load cold-start wallpaper from poster url (will try cache): %{public}@, error: %{public}@", buf, 0x16u);
      }

      PUWallpaperCacheDirectoryURL();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLByAppendingPathComponent:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_loadWeakRetained((id *)(a1 + 56));
      v17 = *(_BYTE *)(a1 + 64) != 0;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __65__PUWallpaperPosterController__loadContentForCurrentPosterMedia___block_invoke_111;
      v20[3] = &unk_1E58A2A28;
      objc_copyWeak(&v24, (id *)(a1 + 56));
      v23 = *(id *)(a1 + 48);
      v18 = v15;
      v21 = v18;
      v22 = *v13;
      objc_msgSend(v16, "_loadAssetFromWallpaperURL:async:completion:", v18, v17, v20);

      objc_destroyWeak(&v24);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v26 = v19;
        v27 = 2114;
        v28 = v6;
        _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "Failed to load wallpaper from url: %{public}@, error: %{public}@", buf, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

void __65__PUWallpaperPosterController__loadContentForCurrentPosterMedia___block_invoke_111(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "setViewModel:", v5);
  }
  else
  {
    PLWallpaperGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_INFO, "Failed to load cold-start wallpaper from cache url (will regenerate): %{public}@, error: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_renderPreviewLayerStackFromWallpaperURL:", *(_QWORD *)(a1 + 40));
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __57__PUWallpaperPosterController__timelinesForDateInterval___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "significantEventsCounter"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserObject:", v5);

}

void __55__PUWallpaperPosterController__updateSignificantEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setSignificantEventTime:", v3);
  objc_msgSend(v4, "setSignificantEventOptions:", *(_QWORD *)(a1 + 40));

}

void __51__PUWallpaperPosterController_triggerPosterUpgrade__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLWallpaperGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v8;
      v9 = "Successfully upgraded poster configuration with asset directory: %{public}@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1AAB61000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2114;
    v16 = v5;
    v9 = "Failed to upgrade poster configuration with asset directory: %{public}@, error: %{public}@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

}

void __62__PUWallpaperPosterController_triggerPosterUpgradeIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  PLWallpaperGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 134217984;
    v4 = WeakRetained;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "Received first unlock notification; attempting to update poster (%p)",
      (uint8_t *)&v3,
      0xCu);
  }

  objc_msgSend(WeakRetained, "triggerPosterUpgrade");
}

uint64_t __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[3];
  _OWORD v8[3];
  _OWORD v9[3];
  _OWORD v10[3];

  v2 = *(_OWORD *)(a1 + 80);
  v10[0] = *(_OWORD *)(a1 + 64);
  v10[1] = v2;
  v10[2] = *(_OWORD *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 32), "setTransform:", v10);
  v3 = *(_OWORD *)(a1 + 80);
  v9[0] = *(_OWORD *)(a1 + 64);
  v9[1] = v3;
  v9[2] = *(_OWORD *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 40), "setTransform:", v9);
  v4 = *(_OWORD *)(a1 + 80);
  v8[0] = *(_OWORD *)(a1 + 64);
  v8[1] = v4;
  v8[2] = *(_OWORD *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 48), "setTransform:", v8);
  v5 = *(_OWORD *)(a1 + 80);
  v7[0] = *(_OWORD *)(a1 + 64);
  v7[1] = v5;
  v7[2] = *(_OWORD *)(a1 + 96);
  return objc_msgSend(*(id *)(a1 + 56), "setTransform:", v7);
}

uint64_t __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke_2(id *a1)
{
  objc_msgSend(a1[4], "setAlpha:", 0.0);
  objc_msgSend(a1[5], "setAlpha:", 0.0);
  objc_msgSend(a1[6], "setAlpha:", 0.0);
  return objc_msgSend(a1[7], "setAlpha:", 0.0);
}

uint64_t __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke_3(uint64_t result, uint64_t a2)
{
  id *v2;

  if (!a2)
  {
    v2 = (id *)result;
    objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
    objc_msgSend(v2[5], "removeFromSuperview");
    objc_msgSend(v2[6], "removeFromSuperview");
    return objc_msgSend(v2[7], "removeFromSuperview");
  }
  return result;
}

uint64_t __63__PUWallpaperPosterController__animateShuffleTransitionToSleep__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  _OWORD v10[5];

  v3 = a2;
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", v5, CFSTR("filters.gaussianBlur.inputRadius"));

  objc_msgSend(v3, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_OWORD *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 88);
  v10[2] = *(_OWORD *)(a1 + 72);
  v10[3] = v8;
  v10[4] = *(_OWORD *)(a1 + 104);
  v10[0] = *(_OWORD *)(a1 + 40);
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKeyPath:", v9, CFSTR("filters.colorMatrix.inputColorMatrix"));

}

uint64_t __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKeyPath:", v3, CFSTR("filters.gaussianBlur.inputRadius"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

uint64_t __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_77(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_2_78(id *a1)
{
  objc_msgSend(a1[4], "setAlpha:", 0.0);
  objc_msgSend(a1[5], "setAlpha:", 0.0);
  return objc_msgSend(a1[6], "setAlpha:", 0.0);
}

void __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_3(uint64_t a1)
{
  int v2;
  __int128 v3;
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
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v29;
  CGAffineTransform v30;

  if (*(_BYTE *)(a1 + 72) || (v2 = *(unsigned __int8 *)(a1 + 73), memset(&v30, 0, sizeof(v30)), v2))
  {
    v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v30.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v30.c = v3;
    *(_OWORD *)&v30.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    v16 = *(void **)(a1 + 32);
    if (v16)
      objc_msgSend(v16, "_inactiveTransform");
  }
  objc_msgSend(*(id *)(a1 + 40), "currentLayoutInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "additionalTransform");
  else
    memset(&t2, 0, sizeof(t2));
  t1 = v30;
  CGAffineTransformConcat(&v29, &t1, &t2);
  v6 = *(void **)(a1 + 40);
  v26 = v29;
  objc_msgSend(v6, "setTransform:", &v26);

  objc_msgSend(*(id *)(a1 + 48), "currentLayoutInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "additionalTransform");
  else
    memset(&v24, 0, sizeof(v24));
  t1 = v30;
  CGAffineTransformConcat(&v25, &t1, &v24);
  v9 = *(void **)(a1 + 48);
  v23 = v25;
  objc_msgSend(v9, "setTransform:", &v23);

  objc_msgSend(*(id *)(a1 + 56), "currentLayoutInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "additionalTransform");
  else
    memset(&v21, 0, sizeof(v21));
  t1 = v30;
  CGAffineTransformConcat(&v22, &t1, &v21);
  v12 = *(void **)(a1 + 56);
  v20 = v22;
  objc_msgSend(v12, "setTransform:", &v20);

  objc_msgSend(*(id *)(a1 + 64), "currentLayoutInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "additionalTransform");
  else
    memset(&v18, 0, sizeof(v18));
  t1 = v30;
  CGAffineTransformConcat(&v19, &t1, &v18);
  v15 = *(void **)(a1 + 64);
  v17 = v19;
  objc_msgSend(v15, "setTransform:", &v17);

}

void __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_4(uint64_t a1)
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v30;

  if (*(_BYTE *)(a1 + 72) && *(_BYTE *)(a1 + 73))
  {
    objc_msgSend(*(id *)(a1 + 32), "transformAnimator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stopAnimation:", 1);

    objc_msgSend(*(id *)(a1 + 40), "currentLayoutInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "additionalTransform");
    else
      memset(&t2, 0, sizeof(t2));
    v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v17 = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&t1.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&t1.c = v16;
    v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&t1.tx = v15;
    CGAffineTransformConcat(&v30, &t1, &t2);
    v5 = *(void **)(a1 + 40);
    v27 = v30;
    objc_msgSend(v5, "setTransform:", &v27);

    objc_msgSend(*(id *)(a1 + 48), "currentLayoutInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "additionalTransform");
    else
      memset(&v25, 0, sizeof(v25));
    *(_OWORD *)&t1.a = v17;
    *(_OWORD *)&t1.c = v16;
    *(_OWORD *)&t1.tx = v15;
    CGAffineTransformConcat(&v26, &t1, &v25);
    v8 = *(void **)(a1 + 48);
    v24 = v26;
    objc_msgSend(v8, "setTransform:", &v24);

    objc_msgSend(*(id *)(a1 + 56), "currentLayoutInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "additionalTransform");
    else
      memset(&v22, 0, sizeof(v22));
    *(_OWORD *)&t1.a = v17;
    *(_OWORD *)&t1.c = v16;
    *(_OWORD *)&t1.tx = v15;
    CGAffineTransformConcat(&v23, &t1, &v22);
    v11 = *(void **)(a1 + 56);
    v21 = v23;
    objc_msgSend(v11, "setTransform:", &v21);

    objc_msgSend(*(id *)(a1 + 40), "currentLayoutInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "additionalTransform");
    else
      memset(&v19, 0, sizeof(v19));
    *(_OWORD *)&t1.a = v17;
    *(_OWORD *)&t1.c = v16;
    *(_OWORD *)&t1.tx = v15;
    CGAffineTransformConcat(&v20, &t1, &v19);
    v14 = *(void **)(a1 + 64);
    v18 = v20;
    objc_msgSend(v14, "setTransform:", &v18);

  }
}

void __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCompositingFilter:", 0);

}

uint64_t __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", *(double *)(a1 + 64));
}

uint64_t __131__PUWallpaperPosterController__transitionToBacklightLuminance_previousBacklightLuminance_animated_interruptSettlingEffectPlayback___block_invoke_7(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (!a2)
  {
    v2 = result;
    (*(void (**)(void))(*(_QWORD *)(result + 32) + 16))();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
  }
  return result;
}

uint64_t __55__PUWallpaperPosterController__updateDeviceOrientation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDeviceOrientation:", *(_QWORD *)(a1 + 32));
}

void __52__PUWallpaperPosterController__updateContainerFrame__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  PXRectWithOriginAndSize();
  objc_msgSend(v2, "setContainerFrame:");

}

void __46__PUWallpaperPosterController_setEnvironment___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setBacklightLuminance:", objc_msgSend(v2, "px_backlightLuminance"));

}

uint64_t __46__PUWallpaperPosterController_setEnvironment___block_invoke_44(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShouldLoopSettlingEffectForGallery:", 1);
}

+ (id)_nonBlockingLoadQueue
{
  if (_nonBlockingLoadQueue_onceToken != -1)
    dispatch_once(&_nonBlockingLoadQueue_onceToken, &__block_literal_global_49944);
  return (id)_nonBlockingLoadQueue_nonBlockingLoadQueue;
}

void __52__PUWallpaperPosterController__nonBlockingLoadQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.photos.wallpaperpostercontroller.nonblockingload", attr);
  v2 = (void *)_nonBlockingLoadQueue_nonBlockingLoadQueue;
  _nonBlockingLoadQueue_nonBlockingLoadQueue = (uint64_t)v1;

}

@end
