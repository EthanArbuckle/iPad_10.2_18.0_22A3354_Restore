@implementation SBWallpaperIconStyleCoordinator

- (SBWallpaperIconStyleCoordinator)initWithWallpaperController:(id)a3 homeScreenDefaults:(id)a4
{
  id v8;
  id v9;
  void *v10;
  SBWallpaperIconStyleCoordinator *v11;
  SBWallpaperIconStyleCoordinator *v12;
  NSObject *v13;
  NSObject *v14;
  void *v16;
  void *v17;
  uint8_t buf[16];
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWallpaperIconStyleCoordinator.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("wallpaperController"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWallpaperIconStyleCoordinator.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeScreenDefaults"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)SBWallpaperIconStyleCoordinator;
  v11 = -[SBWallpaperIconStyleCoordinator init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_wallpaperController, a3);
    objc_storeStrong((id *)&v12->_homeScreenDefaults, a4);
    -[SBWallpaperIconStyleCoordinator _setupObservers](v12, "_setupObservers");
    SBLogIconStyle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[SBWallpaperIconStyleCoordinator init] setting up state updater...", buf, 2u);
    }

    -[SBWallpaperIconStyleCoordinator _postersStyleStateDidChange](v12, "_postersStyleStateDidChange");
    SBLogIconStyle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[SBWallpaperIconStyleCoordinator init] state updater is running", buf, 2u);
    }

    -[SBWallpaperIconStyleCoordinator _setupStateCapture](v12, "_setupStateCapture");
  }

  return v12;
}

- (void)dealloc
{
  BSInvalidatable *stateCapturer;
  objc_super v4;

  -[BSInvalidatable invalidate](self->_stateCapturer, "invalidate");
  stateCapturer = self->_stateCapturer;
  self->_stateCapturer = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBWallpaperIconStyleCoordinator;
  -[SBWallpaperIconStyleCoordinator dealloc](&v4, sel_dealloc);
}

- (id)posterStyleState
{
  PBUIHomeVariantStyleState *posterStyleState;
  PBUIHomeVariantStyleState *v4;
  PBUIHomeVariantStyleState *v5;

  posterStyleState = self->_posterStyleState;
  if (!posterStyleState)
  {
    -[SBWallpaperIconStyleCoordinator _fetchPosterStyleState](self, "_fetchPosterStyleState");
    v4 = (PBUIHomeVariantStyleState *)objc_claimAutoreleasedReturnValue();
    v5 = self->_posterStyleState;
    self->_posterStyleState = v4;

    posterStyleState = self->_posterStyleState;
  }
  return posterStyleState;
}

- (void)fetchWallpaperProminentColor:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  SBWallpaperController *wallpaperController;
  _QWORD v10[5];
  void (**v11)(id, void *);
  uint8_t buf[16];

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    -[SBWallpaperIconStyleCoordinator currentStyleConfiguration](self, "currentStyleConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestedAccentColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      SBLogIconStyle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[fetchWallpaperProminentColor] returning suggestedAccentColor w/o PaperBoardUI fetch...", buf, 2u);
      }

      objc_msgSend(v5, "suggestedAccentColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v8);
    }
    else
    {
      wallpaperController = self->_wallpaperController;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __64__SBWallpaperIconStyleCoordinator_fetchWallpaperProminentColor___block_invoke;
      v10[3] = &unk_1E8EB5B70;
      v10[4] = self;
      v11 = v4;
      -[SBWallpaperController fetchWallpaperProminentColor:](wallpaperController, "fetchWallpaperProminentColor:", v10);
      v8 = v11;
    }

  }
}

void __64__SBWallpaperIconStyleCoordinator_fetchWallpaperProminentColor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogIconStyle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[fetchWallpaperProminentColor] fetched from PaperBoardUI a suggestedAccentColor", v11, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  SBLogIconStyle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[fetchWallpaperProminentColor] updating suggested tint color from paperboard UI...", v11, 2u);
  }

  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x1E0D7F6B8];
  objc_msgSend(v3, "BSColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "posterUpdateHomeScreenSuggestedTintColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_issueUpdates:", v10);

}

- (BSColor)currentTintColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBWallpaperIconStyleCoordinator currentStyleConfiguration](self, "currentStyleConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accentStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "luminanceAppliedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "BSColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSColor *)v5;
}

- (void)setCurrentTintColor:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogIconStyle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[setCurrentTintColor] updating to tint color %{public}@", (uint8_t *)&v9, 0xCu);
  }

  -[SBWallpaperIconStyleCoordinator currentStyleConfiguration](self, "currentStyleConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v4, "UIColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccentColor:", v8);

  -[SBWallpaperIconStyleCoordinator setCurrentStyleConfiguration:](self, "setCurrentStyleConfiguration:", v7);
}

- (BOOL)isWallpaperDimmed
{
  void *v2;
  char v3;

  -[SBWallpaperIconStyleCoordinator posterStyleState](self, "posterStyleState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHomeScreenDimmed");

  return v3;
}

- (void)setWallpaperDimmed:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (-[SBWallpaperIconStyleCoordinator isWallpaperDimmed](self, "isWallpaperDimmed") != a3)
  {
    SBLogIconStyle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v10 = v3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[setWallpaperDimmed] updating wallpaper dim to %{BOOL}u", buf, 8u);
    }

    objc_msgSend(MEMORY[0x1E0D7F6B8], "posterUpdateHomeScreenAppearanceDimWithValue:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWallpaperIconStyleCoordinator _issueUpdates:](self, "_issueUpdates:", v7);

  }
}

- (BOOL)shouldUseLargeHomeScreenIcons
{
  void *v2;
  void *v3;
  _QWORD *v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[SBWallpaperIconStyleCoordinator posterStyleState](self, "posterStyleState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (_QWORD *)getPRIconUserInterfaceSizeLargeSymbolLoc_ptr;
  v11 = getPRIconUserInterfaceSizeLargeSymbolLoc_ptr;
  if (!getPRIconUserInterfaceSizeLargeSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getPRIconUserInterfaceSizeLargeSymbolLoc_block_invoke;
    v7[3] = &unk_1E8E9ED40;
    v7[4] = &v8;
    __getPRIconUserInterfaceSizeLargeSymbolLoc_block_invoke((uint64_t)v7);
    v4 = (_QWORD *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
    -[SBWallpaperIconStyleCoordinator shouldUseLargeHomeScreenIcons].cold.1();
  v5 = objc_msgSend(v3, "isEqualToString:", *v4);

  return v5;
}

- (void)setShouldUseLargeHomeScreenIcons:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (-[SBWallpaperIconStyleCoordinator shouldUseLargeHomeScreenIcons](self, "shouldUseLargeHomeScreenIcons") != a3)
  {
    SBLogIconStyle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v12 = v3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[setshouldUseLargeHomeScreenIcons] updating shouldUseLargeHomeScreenIcons to %{BOOL}u", buf, 8u);
    }

    v6 = (void *)MEMORY[0x1E0D7F6B8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "posterUpdateShouldUseLargeHomeScreenIcons:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWallpaperIconStyleCoordinator _issueUpdates:](self, "_issueUpdates:", v9);

  }
}

- (PUIStylePickerHomeScreenConfiguration)currentStyleConfiguration
{
  PUIStylePickerHomeScreenConfiguration *currentStyleConfiguration;
  PUIStylePickerHomeScreenConfiguration *v4;
  PUIStylePickerHomeScreenConfiguration *v5;
  PUIStylePickerHomeScreenConfiguration *v6;

  currentStyleConfiguration = self->_currentStyleConfiguration;
  if (!currentStyleConfiguration)
  {
    if (!self->_posterStyleState)
    {
      -[SBWallpaperIconStyleCoordinator _postersStyleStateDidChange](self, "_postersStyleStateDidChange");
      if (!self->_posterStyleState)
      {
        v6 = 0;
        return v6;
      }
    }
    -[SBWallpaperIconStyleCoordinator _fetchStyleConfiguration](self, "_fetchStyleConfiguration");
    v4 = (PUIStylePickerHomeScreenConfiguration *)objc_claimAutoreleasedReturnValue();
    v5 = self->_currentStyleConfiguration;
    self->_currentStyleConfiguration = v4;

    currentStyleConfiguration = self->_currentStyleConfiguration;
  }
  v6 = currentStyleConfiguration;
  return v6;
}

- (void)setCurrentStyleConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    SBLogIconStyle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138543362;
      v27 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[setCurrentStyleConfiguration] updating to style configuration %{public}@", (uint8_t *)&v26, 0xCu);
    }

    v6 = -[PUIStylePickerHomeScreenConfiguration styleType](self->_currentStyleConfiguration, "styleType");
    v7 = objc_msgSend(v4, "styleType");
    -[PUIStylePickerHomeScreenConfiguration accentStyle](self->_currentStyleConfiguration, "accentStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == 3)
    {
      SBLogIconStyle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[setCurrentStyleConfiguration] updating to a style type of accent", (uint8_t *)&v26, 2u);
      }

      objc_msgSend(v4, "accentStyle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v6 == 3)
      {
        SBLogIconStyle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[setCurrentStyleConfiguration] updating AWAY a style type of accent; clearing out target style",
            (uint8_t *)&v26,
            2u);
        }

      }
      v10 = 0;
    }
    v12 = (void *)objc_opt_new();
    if (v6 != v7)
    {
      v13 = (void *)MEMORY[0x1E0D7F6B8];
      __SBIconUserInterfaceStyleTypeFromPUIHomeScreenStyleType(v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "posterUpdateHomeScreenIconUserInterfaceStyle:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v15);

    }
    if ((BSEqualObjects() & 1) == 0)
    {
      SBLogIconStyle();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v17)
        {
          v26 = 138543362;
          v27 = v10;
          _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "[setCurrentStyleConfiguration] updating poster style to %{public}@ ON POSTER", (uint8_t *)&v26, 0xCu);
        }

        v18 = (void *)MEMORY[0x1E0D7F6B8];
        v19 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v10, "variation");
        objc_msgSend(v19, "numberWithDouble:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v10, "saturation");
        objc_msgSend(v21, "numberWithDouble:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v10, "luminance");
        objc_msgSend(v23, "numberWithDouble:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "posterUpdateHomeScreenTintWithVariation:saturation:luminance:", v20, v22, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v25);

      }
      else
      {
        if (v17)
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "[setCurrentStyleConfiguration] unsetting poster style on POSTER", (uint8_t *)&v26, 2u);
        }

        objc_msgSend(MEMORY[0x1E0D7F6B8], "posterUpdateHomeScreenTintWithVariation:saturation:luminance:", 0, 0, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v20);
      }

    }
    -[SBWallpaperIconStyleCoordinator _issueUpdates:](self, "_issueUpdates:", v12);

  }
}

- (void)addIconStyleObserver:(id)a3
{
  NSHashTable *observers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  BSDispatchQueueAssertMain();
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v7);

}

- (void)removeIconStyleObserver:(id)a3
{
  id v4;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

}

- (void)_postersStyleStateDidChange
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "[_postersStyleStateDidChange] still nil; bailing",
    v1,
    2u);
}

- (BOOL)_issueUpdates:(id)a3
{
  SBWallpaperController *wallpaperController;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[8];
  id v11;

  wallpaperController = self->_wallpaperController;
  v11 = 0;
  v5 = -[SBWallpaperController updateCurrentPosterWithUpdates:error:](wallpaperController, "updateCurrentPosterWithUpdates:error:", a3, &v11);
  v6 = v11;
  SBLogIconStyle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBWallpaperIconStyleCoordinator _issueUpdates:].cold.1((uint64_t)v6, v8);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[_issueUpdates] Updated current poster", v10, 2u);
    }

    -[SBWallpaperIconStyleCoordinator _resetStateExpectingUpdates](self, "_resetStateExpectingUpdates");
    -[SBWallpaperIconStyleCoordinator _notifyObserversOfUpdatedPostersStyleState](self, "_notifyObserversOfUpdatedPostersStyleState");
  }

  return v5;
}

- (void)_resetStateExpectingUpdates
{
  PBUIHomeVariantStyleState **p_posterStyleState;
  PBUIHomeVariantStyleState *v4;
  void *v5;
  int v6;
  PUIStylePickerHomeScreenConfiguration **p_currentStyleConfiguration;
  PUIStylePickerHomeScreenConfiguration *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  _DWORD v15[7];

  *(_QWORD *)&v15[5] = *MEMORY[0x1E0C80C00];
  p_posterStyleState = &self->_posterStyleState;
  v4 = self->_posterStyleState;
  -[SBWallpaperIconStyleCoordinator _fetchPosterStyleState](self, "_fetchPosterStyleState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BSEqualObjects();
  if ((v6 & 1) == 0)
    objc_storeStrong((id *)p_posterStyleState, v5);
  p_currentStyleConfiguration = &self->_currentStyleConfiguration;
  v8 = self->_currentStyleConfiguration;
  -[SBWallpaperIconStyleCoordinator _fetchStyleConfiguration](self, "_fetchStyleConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = BSEqualObjects();
  if ((v10 & 1) == 0)
    objc_storeStrong((id *)p_currentStyleConfiguration, v9);
  SBLogIconStyle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 67109376;
    v15[0] = v6 ^ 1;
    LOWORD(v15[1]) = 1024;
    *(_DWORD *)((char *)&v15[1] + 2) = v10 ^ 1;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[_resetStateExpectingUpdates] didUpdatePosterStyleState: %{BOOL}u didUpdateStyleConfiguration: %{BOOL}u", (uint8_t *)&v14, 0xEu);
  }

  if ((v10 & 1) == 0)
  {
    SBLogIconStyle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138543362;
      *(_QWORD *)v15 = v9;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "[_resetStateExpectingUpdates] updatedStyleConfiguration: %{public}@", (uint8_t *)&v14, 0xCu);
    }

  }
  if ((v6 & 1) == 0)
  {
    SBLogIconStyle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 138543362;
      *(_QWORD *)v15 = v5;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_INFO, "[_resetStateExpectingUpdates] updatedPosterStyleState: %{public}@", (uint8_t *)&v14, 0xCu);
    }

  }
}

- (id)_fetchPosterStyleState
{
  void *v2;
  NSObject *v3;

  -[SBWallpaperController currentHomeVariantStyleState](self->_wallpaperController, "currentHomeVariantStyleState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIconStyle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[SBWallpaperIconStyleCoordinator _fetchPosterStyleState].cold.1((uint64_t)v2, v3);

  return v2;
}

- (id)_fetchStyleConfiguration
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v3 = (void *)getPUIMutableStylePickerHomeScreenConfigurationClass_softClass;
  v28 = getPUIMutableStylePickerHomeScreenConfigurationClass_softClass;
  if (!getPUIMutableStylePickerHomeScreenConfigurationClass_softClass)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke;
    v24[3] = &unk_1E8E9ED40;
    v24[4] = &v25;
    __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke((uint64_t)v24);
    v3 = (void *)v26[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v25, 8);
  v5 = objc_alloc_init(v4);
  -[SBWallpaperIconStyleCoordinator posterStyleState](self, "posterStyleState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconStyle");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)*MEMORY[0x1E0DAA260];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  objc_msgSend(v5, "setStyleType:", __PUIHomeScreenStyleTypeFromSBIconUserInterfaceStyleType(v10));
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DAA268]);

  if (v11)
  {
    objc_msgSend(v6, "tintColorStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "tintColorStyle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAccentStyle:", v13);
    }
    else
    {
      -[SBHomeScreenDefaults iconTintColor](self->_homeScreenDefaults, "iconTintColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeScreenDefaults iconUserInterfaceStyleVariation](self->_homeScreenDefaults, "iconUserInterfaceStyleVariation");
      v15 = v14;
      -[SBHomeScreenDefaults iconUserInterfaceStyleLuminance](self->_homeScreenDefaults, "iconUserInterfaceStyleLuminance");
      v17 = v16;
      -[SBHomeScreenDefaults iconUserInterfaceStyleSaturation](self->_homeScreenDefaults, "iconUserInterfaceStyleSaturation");
      v19 = v18;
      objc_msgSend(v5, "setVariation:", v15);
      objc_msgSend(v5, "setLuminance:", v17);
      objc_msgSend(v5, "setSaturation:", v19);
      objc_msgSend(v5, "setAccentColor:", v13);
    }

  }
  objc_msgSend(v6, "suggestedTintColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v6, "suggestedTintColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSuggestedAccentColor:", v21);

  }
  v22 = (void *)objc_msgSend(v5, "copy");

  return v22;
}

- (void)_setupStateCapture
{
  id v3;
  BSInvalidatable *v4;
  BSInvalidatable *stateCapturer;
  id v6;
  id location;

  if (!self->_stateCapturer)
  {
    objc_initWeak(&location, self);
    v3 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v6, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    stateCapturer = self->_stateCapturer;
    self->_stateCapturer = v4;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

__CFString *__53__SBWallpaperIconStyleCoordinator__setupStateCapture__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  __CFString *v19;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    objc_msgSend(v2, "_fetchPosterStyleState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v2[6];
    objc_msgSend(v2, "_fetchStyleConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = CFSTR("posterStyleState");
    objc_msgSend(v3, "description");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("(null posterStyleState)");
    if (v7)
      v9 = (const __CFString *)v7;
    v22[0] = v9;
    v21[1] = CFSTR("fetchedPostersStyleState");
    objc_msgSend(v4, "description");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("(null fetchedPostersStyleState)");
    if (v10)
      v12 = (const __CFString *)v10;
    v22[1] = v12;
    v21[2] = CFSTR("currentStyleConfiguration");
    objc_msgSend(v5, "description");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("(null currentStyleConfiguration)");
    if (v13)
      v15 = (const __CFString *)v13;
    v22[2] = v15;
    v21[3] = CFSTR("fetchedStyleConfiguration");
    objc_msgSend(v6, "description");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = CFSTR("(null fetchedStyleConfiguration)");
    if (v16)
      v18 = (const __CFString *)v16;
    v22[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = &stru_1E8EC7EC0;
  }

  return v19;
}

- (void)_setupObservers
{
  -[SBWallpaperController addObserver:forVariant:](self->_wallpaperController, "addObserver:forVariant:", self, 0);
}

- (void)_notifyObserversOfUpdatedPostersStyleState
{
  PBUIHomeVariantStyleState *v3;
  PBUIHomeVariantStyleState *posterStyleState;
  PUIStylePickerHomeScreenConfiguration *v5;
  PUIStylePickerHomeScreenConfiguration *currentStyleConfiguration;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (!self->_posterStyleState)
  {
    -[SBWallpaperIconStyleCoordinator _fetchPosterStyleState](self, "_fetchPosterStyleState");
    v3 = (PBUIHomeVariantStyleState *)objc_claimAutoreleasedReturnValue();
    posterStyleState = self->_posterStyleState;
    self->_posterStyleState = v3;

  }
  if (!self->_currentStyleConfiguration)
  {
    -[SBWallpaperIconStyleCoordinator _fetchStyleConfiguration](self, "_fetchStyleConfiguration");
    v5 = (PUIStylePickerHomeScreenConfiguration *)objc_claimAutoreleasedReturnValue();
    currentStyleConfiguration = self->_currentStyleConfiguration;
    self->_currentStyleConfiguration = v5;

  }
  if (BSEqualObjects() && BSEqualObjects())
  {
    SBLogIconStyle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[_notifyObserversOfUpdatedPostersStyleState] posters style state is same; bailing",
        buf,
        2u);
    }
  }
  else
  {
    SBLogIconStyle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[_notifyObserversOfUpdatedPostersStyleState] updating last notified posters style state", buf, 2u);
    }

    objc_storeStrong((id *)&self->_lastNotifiedStyleConfiguration, self->_currentStyleConfiguration);
    objc_storeStrong((id *)&self->_lastNotifiedPosterStyleState, self->_posterStyleState);
    -[SBWallpaperController noteHomeVariantStyleStateMayHaveUpdated](self->_wallpaperController, "noteHomeVariantStyleStateMayHaveUpdated");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    objc_msgSend(v9, "allObjects");
    v7 = objc_claimAutoreleasedReturnValue();

    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "iconStyleCoordinatorDidUpdate:", self);
        }
        while (v11 != v13);
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v11);
    }
  }

}

- (void)wallpaperWillChangeForVariant:(int64_t)a3
{
  NSObject *v4;
  PBUIHomeVariantStyleState *posterStyleState;
  PUIStylePickerHomeScreenConfiguration *currentStyleConfiguration;
  uint8_t v7[16];

  SBLogIconStyle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "wallpaperWillChangeForVariant", v7, 2u);
  }

  posterStyleState = self->_posterStyleState;
  self->_posterStyleState = 0;

  currentStyleConfiguration = self->_currentStyleConfiguration;
  self->_currentStyleConfiguration = 0;

}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  NSObject *v4;
  uint8_t v5[16];

  SBLogIconStyle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "wallpaperDidChangeForVariant", v5, 2u);
  }

  -[SBWallpaperIconStyleCoordinator _postersStyleStateDidChange](self, "_postersStyleStateDidChange");
}

- (SBWallpaperController)wallpaperController
{
  return self->_wallpaperController;
}

- (SBHomeScreenDefaults)homeScreenDefaults
{
  return self->_homeScreenDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenDefaults, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_storeStrong((id *)&self->_currentStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_lastNotifiedStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_lastNotifiedPosterStyleState, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stateCapturer, 0);
  objc_storeStrong((id *)&self->_posterStyleState, 0);
}

- (void)shouldUseLargeHomeScreenIcons
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getPRIconUserInterfaceSizeLarge(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBWallpaperIconStyleCoordinator.m"), 29, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)_issueUpdates:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "[_issueUpdates] Failed to update current poster: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_fetchPosterStyleState
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "[_fetchPosterStyleState] %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
