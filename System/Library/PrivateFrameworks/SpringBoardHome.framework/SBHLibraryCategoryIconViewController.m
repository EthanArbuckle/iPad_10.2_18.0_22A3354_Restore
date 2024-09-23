@implementation SBHLibraryCategoryIconViewController

uint64_t __78__SBHLibraryCategoryIconViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v6;

  v6 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v6)
    *a4 = 1;
  return result;
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4;
  SBIconListView *iconListView;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  iconListView = self->_iconListView;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__SBHLibraryCategoryIconViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
  v7[3] = &unk_1E8D852B8;
  v8 = v4;
  v6 = v4;
  -[SBIconListView enumerateIconViewsUsingBlock:](iconListView, "enumerateIconViewsUsingBlock:", v7);

}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  SBIconListView *iconListView;
  id v8;
  void *v9;
  int v10;
  BOOL v11;

  v6 = a3;
  iconListView = self->_iconListView;
  v8 = a4;
  -[SBIconListView iconLocation](iconListView, "iconLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v8);

  if (v10)
    v11 = -[SBHLibraryCategoryIconViewController isDisplayingIcon:](self, "isDisplayingIcon:", v6);
  else
    v11 = 0;

  return v11;
}

- (id)presentedIconLocations
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_location);
}

- (BOOL)isDisplayingIcon:(id)a3
{
  return -[SBIconListView isDisplayingIcon:](self->_iconListView, "isDisplayingIcon:", a3);
}

- (void)viewDidLoad
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
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  SBIconListView *iconListView;
  SBHLibraryCategoryPodIconListView *v18;
  void *v19;
  void *v20;
  void *v21;
  SBIconListView *v22;
  SBIconListView *v23;
  SBIconListView *v24;
  void *v25;
  SBIconListView *v26;
  void *v27;
  SBIconListView *v28;
  void *v29;
  void *v30;
  SBHLibraryCategoryPodBackgroundView *backgroundView;
  SBHLibraryCategoryPodBackgroundView *v32;
  SBHLibraryCategoryPodBackgroundView *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)SBHLibraryCategoryIconViewController;
  -[SBHLibraryCategoryIconViewController viewDidLoad](&v35, sel_viewDidLoad);
  -[SBHLibraryCategoryIconViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBHLibraryCategoryIconViewController folder](self, "folder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryCategoryIconViewController location](self, "location");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = CFSTR("SBIconLocationAppLibraryCategoryPod");
  if (v13)
    v15 = (__CFString *)v13;
  v16 = v15;

  iconListView = self->_iconListView;
  if (!iconListView)
  {
    v18 = [SBHLibraryCategoryPodIconListView alloc];
    objc_msgSend(v12, "listAtIndex:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryCategoryIconViewController listLayoutProvider](self, "listLayoutProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryCategoryIconViewController iconViewProvider](self, "iconViewProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SBIconListView initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:](v18, "initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:", v19, v20, v16, 1, v21);
    v23 = self->_iconListView;
    self->_iconListView = v22;

    v24 = self->_iconListView;
    -[SBHLibraryCategoryIconViewController iconImageCache](self, "iconImageCache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView setIconImageCache:](v24, "setIconImageCache:", v25);

    v26 = self->_iconListView;
    -[SBHLibraryCategoryIconViewController folderIconImageCache](self, "folderIconImageCache");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView setFolderIconImageCache:](v26, "setFolderIconImageCache:", v27);

    v28 = self->_iconListView;
    -[SBHLibraryCategoryIconViewController overrideIconImageAppearance](self, "overrideIconImageAppearance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView setOverrideIconImageAppearance:](v28, "setOverrideIconImageAppearance:", v29);

    -[SBIconListView setIconViewConfigurationOptions:](self->_iconListView, "setIconViewConfigurationOptions:", 2);
    -[SBIconListView setEditing:](self->_iconListView, "setEditing:", -[SBHLibraryCategoryIconViewController isEditing](self, "isEditing"));
    -[SBIconListView setAutoresizingMask:](self->_iconListView, "setAutoresizingMask:", 18);
    -[SBHLibraryCategoryIconViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", self->_iconListView);

    iconListView = self->_iconListView;
  }
  -[SBIconListView setFrame:](iconListView, "setFrame:", v5, v7, v9, v11);
  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    v32 = objc_alloc_init(SBHLibraryCategoryPodBackgroundView);
    v33 = self->_backgroundView;
    self->_backgroundView = v32;

    -[SBHLibraryCategoryPodBackgroundView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
    -[SBHLibraryCategoryIconViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "insertSubview:belowSubview:", self->_backgroundView, self->_iconListView);

    backgroundView = self->_backgroundView;
  }
  -[SBHLibraryCategoryPodBackgroundView setFrame:](backgroundView, "setFrame:", v5, v7, v9, v11);
  -[SBHLibraryCategoryIconViewController _setLockedIfPossible:animated:](self, "_setLockedIfPossible:animated:", 1, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHLibraryCategoryIconViewController;
  -[SBHLibraryCategoryIconViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBHLibraryCategoryIconViewController _setLockedIfPossible:animated:](self, "_setLockedIfPossible:animated:", 1, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHLibraryCategoryIconViewController;
  -[SBHLibraryCategoryIconViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SBHLibraryCategoryIconViewController _setLockedIfPossible:animated:](self, "_setLockedIfPossible:animated:", 1, 0);
}

- (void)_updateBackgroundBlurIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  MTMaterialView *backgroundBlurView;
  void *v8;
  MTMaterialView *v9;
  id v10;

  if (self->_backgroundBlurView)
    goto LABEL_2;
  if (-[SBHLibraryCategoryIconViewController needsBackgroundBlur](self, "needsBackgroundBlur"))
  {
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 19);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setGroupNameBase:", CFSTR("SBHLibraryCategoryIconBackdropView"));
    objc_msgSend(v3, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:", 1);
    SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackdropScaleAdjustment:", v4);

    objc_msgSend(v3, "setAutoresizingMask:", 18);
    -[SBHLibraryCategoryIconViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v3, "setFrame:");

    -[SBHLibraryCategoryIconViewController iconImageInfo](self, "iconImageInfo");
    objc_msgSend(v3, "_setContinuousCornerRadius:", v6);
    backgroundBlurView = self->_backgroundBlurView;
    self->_backgroundBlurView = (MTMaterialView *)v3;
    v10 = v3;

    -[SBHLibraryCategoryIconViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertSubview:atIndex:", self->_backgroundBlurView, 0);

    -[SBHLibraryCategoryPodBackgroundView setHidden:](self->_backgroundView, "setHidden:", 1);
    return;
  }
  if (self->_backgroundBlurView)
  {
LABEL_2:
    if (!-[SBHLibraryCategoryIconViewController needsBackgroundBlur](self, "needsBackgroundBlur"))
    {
      -[MTMaterialView removeFromSuperview](self->_backgroundBlurView, "removeFromSuperview");
      v9 = self->_backgroundBlurView;
      self->_backgroundBlurView = 0;

      -[SBHLibraryCategoryPodBackgroundView setHidden:](self->_backgroundView, "setHidden:", 0);
    }
  }
}

- (void)updateCategory:(id)a3 location:(id)a4
{
  SBHLibraryCategory *v6;
  BSInvalidatable *preventFolderUpdateAssertion;
  id v8;
  BSInvalidatable *v9;
  SBHLibraryCategory *category;
  void *v11;
  SBHLibraryCategory *v12;

  v6 = (SBHLibraryCategory *)a3;
  preventFolderUpdateAssertion = self->_preventFolderUpdateAssertion;
  v8 = a4;
  -[BSInvalidatable invalidate](preventFolderUpdateAssertion, "invalidate");
  v9 = self->_preventFolderUpdateAssertion;
  self->_preventFolderUpdateAssertion = 0;

  -[SBHLibraryCategory removeObserver:](self->_category, "removeObserver:", self);
  category = self->_category;
  self->_category = v6;
  v12 = v6;

  -[SBHLibraryCategory compactPodFolder](v12, "compactPodFolder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryCategoryIconViewController updateFolder:location:](self, "updateFolder:location:", v11, v8);

  -[SBHLibraryCategoryIconViewController _setLockedIfPossible:animated:](self, "_setLockedIfPossible:animated:", 1, 0);
  -[SBHLibraryCategory addObserver:](v12, "addObserver:", self);

}

- (void)updateFolder:(id)a3 location:(id)a4
{
  id v7;
  SBIconListView *iconListView;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!objc_msgSend(v10, "isEqual:", self->_folder)
    || !-[NSString isEqualToString:](self->_location, "isEqualToString:", v7))
  {
    -[SBFolder removeFolderObserver:](self->_folder, "removeFolderObserver:", self);
    objc_storeStrong((id *)&self->_location, a4);
    objc_storeStrong((id *)&self->_folder, a3);
    iconListView = self->_iconListView;
    objc_msgSend(v10, "listAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView setModel:](iconListView, "setModel:", v9);

    -[SBIconListView setIconLocation:](self->_iconListView, "setIconLocation:", v7);
    objc_msgSend(v10, "addFolderObserver:", self);
  }

}

- (SBIconListView)iconListView
{
  id v3;

  v3 = (id)-[SBHLibraryCategoryIconViewController view](self, "view");
  return self->_iconListView;
}

- (UIView)backgroundView
{
  id v3;

  v3 = (id)-[SBHLibraryCategoryIconViewController view](self, "view");
  return (UIView *)self->_backgroundView;
}

- (void)setLegibilitySettings:(id)a3
{
  -[SBIconListView setLegibilitySettings:](self->_iconListView, "setLegibilitySettings:", a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return -[SBIconListView legibilitySettings](self->_iconListView, "legibilitySettings");
}

- (void)setNeedsBackgroundBlur:(BOOL)a3
{
  if (self->_needsBackgroundBlur != a3)
  {
    self->_needsBackgroundBlur = a3;
    -[SBHLibraryCategoryIconViewController _updateBackgroundBlurIfNeeded](self, "_updateBackgroundBlurIfNeeded");
  }
}

- (void)_setLockedIfPossible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  UIView *lockedView;
  UIView *v8;

  v4 = a4;
  v5 = a3;
  if (_os_feature_enabled_impl())
  {
    if (-[SBHLibraryCategoryIconViewController isLocked](self, "isLocked") == v5
      || !-[SBHLibraryCategoryIconViewController _canBeLocked](self, "_canBeLocked"))
    {
      if (!-[SBHLibraryCategoryIconViewController _canBeLocked](self, "_canBeLocked"))
      {
        self->_locked = 0;
        lockedView = self->_lockedView;
        if (lockedView)
        {
          -[UIView removeFromSuperview](lockedView, "removeFromSuperview");
          v8 = self->_lockedView;
          self->_lockedView = 0;

        }
      }
    }
    else
    {
      self->_locked = v5;
      -[SBHLibraryCategoryIconViewController _updateLockedViewForLocked:animated:](self, "_updateLockedViewForLocked:animated:", v5, v4);
    }
  }
}

- (BOOL)_canBeLocked
{
  void *v2;
  uint64_t v3;

  -[SBHLibraryCategory categoryIdentifier](self->_category, "categoryIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "predictionCategoryID");

  return v3 == 7;
}

- (id)_createLockedView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[SBHLibraryCategoryIconViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:");

  objc_msgSend(v5, "setAutoresizingMask:", 18);
  -[SBHLibraryCategoryIconViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setFrame:");

  -[SBHLibraryCategoryIconViewController iconImageInfo](self, "iconImageInfo");
  objc_msgSend(v5, "_setContinuousCornerRadius:", v7);
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleTapOnLockedView_);
  objc_msgSend(v28, "setMinimumPressDuration:", 0.0);
  v30[0] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGestureRecognizers:", v8);

  objc_msgSend(v5, "setAlpha:", 0.0);
  -[SBHLibraryCategoryIconViewController iconListView](self, "iconListView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutMetrics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHLibraryCategoryIconViewController listLayoutProvider](self, "listLayoutProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBHCreateAppLibraryGhostPodView(v27, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addSubview:", v11);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v11, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v24;
  objc_msgSend(v11, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v12;
  objc_msgSend(v11, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v15;
  objc_msgSend(v11, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v19);

  return v5;
}

- (void)_updateLockedViewForLocked:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  UIView **p_lockedView;
  UIView *v8;
  void *v9;
  SBIconListView *v10;
  double v11;
  double v12;
  UIView *v13;
  SBIconListView *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  UIView *v21;
  SBIconListView *v22;
  double v23;
  double v24;

  v4 = a4;
  v5 = a3;
  p_lockedView = &self->_lockedView;
  v8 = self->_lockedView;
  -[SBHLibraryCategoryIconViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_iconListView;
  if (v5 && !v8)
  {
    -[SBHLibraryCategoryIconViewController _createLockedView](self, "_createLockedView");
    v8 = (UIView *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);
    objc_storeStrong((id *)p_lockedView, v8);
  }
  if (v5)
    v11 = 1.0;
  else
    v11 = 0.0;
  if (v5)
    v12 = 0.0;
  else
    v12 = 1.0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __76__SBHLibraryCategoryIconViewController__updateLockedViewForLocked_animated___block_invoke;
  v20 = &unk_1E8D86930;
  v13 = v8;
  v21 = v13;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v14 = v10;
  v15 = _Block_copy(&v17);
  v16 = v15;
  if (v4)
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v15, 0, 0.3, 0.0, v17, v18, v19, v20, v21, v22, *(_QWORD *)&v23, *(_QWORD *)&v24);
  else
    (*((void (**)(void *))v15 + 2))(v15);

}

uint64_t __76__SBHLibraryCategoryIconViewController__updateLockedViewForLocked_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 56));
}

- (void)_handleTapOnLockedView:(id)a3
{
  id v4;
  UIView *v5;
  uint64_t v6;
  UIView *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD aBlock[4];
  UIView *v12;

  v4 = a3;
  v5 = self->_lockedView;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__SBHLibraryCategoryIconViewController__handleTapOnLockedView___block_invoke;
  aBlock[3] = &unk_1E8D84C50;
  v7 = v5;
  v12 = v7;
  v8 = _Block_copy(aBlock);
  if (objc_msgSend(v4, "state") == 1)
  {
    -[UIView setAlpha:](v7, "setAlpha:", 0.5);
  }
  else if (objc_msgSend(v4, "state") == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327684, v8, 0, 0.2, 0.0);
    if (tapInsideView(v4, v7))
    {
      objc_msgSend(MEMORY[0x1E0CF9690], "sharedGuard");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __63__SBHLibraryCategoryIconViewController__handleTapOnLockedView___block_invoke_2;
      v10[3] = &unk_1E8D8AC00;
      v10[4] = self;
      objc_msgSend(v9, "authenticateUnconditionallyWithCompletion:", v10);

    }
  }
  else if (objc_msgSend(v4, "state") == 2 && !tapInsideView(v4, v7)
         || objc_msgSend(v4, "state") == 4
         || objc_msgSend(v4, "state") == 5)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327684, v8, 0, 0.2, 0.0);
  }

}

uint64_t __63__SBHLibraryCategoryIconViewController__handleTapOnLockedView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __63__SBHLibraryCategoryIconViewController__handleTapOnLockedView___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SBHLibraryCategoryIconViewController__handleTapOnLockedView___block_invoke_3;
  block[3] = &unk_1E8D89918;
  v9 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __63__SBHLibraryCategoryIconViewController__handleTapOnLockedView___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setLockedIfPossible:animated:", 0, 1);
  }
  else
  {
    SBLogProtectedApps();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_1CFEF3000, v2, OS_LOG_TYPE_DEFAULT, "Failed to unlock hidden library pod with error:%@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)categoryWillUpdate:(id)a3
{
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
  BSInvalidatable *v15;
  BSInvalidatable *preventFolderUpdateAssertion;
  id v17;

  objc_msgSend(a3, "compactPodFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_firstObjectOfClass:", v8);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[SBHLibraryCategoryIconViewController iconListView](self, "iconListView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedIconViewForIcon:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_iconImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v11;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v14, "disableImageUpdatesForReason:", CFSTR("Updating Category"));
  v15 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();

  preventFolderUpdateAssertion = self->_preventFolderUpdateAssertion;
  self->_preventFolderUpdateAssertion = v15;

}

- (void)categoryDidUpdate:(id)a3
{
  BSInvalidatable *preventFolderUpdateAssertion;

  -[BSInvalidatable invalidate](self->_preventFolderUpdateAssertion, "invalidate", a3);
  preventFolderUpdateAssertion = self->_preventFolderUpdateAssertion;
  self->_preventFolderUpdateAssertion = 0;

}

- (void)folder:(id)a3 didAddList:(id)a4
{
  unsigned int v5;
  void *v6;
  SBIconListView *iconListView;
  void *v8;
  id v9;

  v9 = a3;
  v5 = -[SBHLibraryCategoryIconViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
  -[SBIconListView model](self->_iconListView, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    iconListView = self->_iconListView;
    objc_msgSend(v9, "listAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView setModel:](iconListView, "setModel:", v8);

    -[SBIconListView layoutIconsIfNeededWithAnimationType:options:](self->_iconListView, "layoutIconsIfNeededWithAnimationType:options:", v5 - 1, 0);
  }

}

- (void)folder:(id)a3 didRemoveLists:(id)a4 atIndexes:(id)a5
{
  id v6;
  unsigned int v7;
  void *v8;
  int v9;

  v6 = a4;
  v7 = -[SBHLibraryCategoryIconViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
  -[SBIconListView model](self->_iconListView, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "containsObject:", v8);

  if (v9)
  {
    -[SBIconListView setModel:](self->_iconListView, "setModel:", 0);
    -[SBIconListView layoutIconsIfNeededWithAnimationType:options:](self->_iconListView, "layoutIconsIfNeededWithAnimationType:options:", v7 - 1, 0);
  }
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  return objc_msgSend(a3, "isEqual:", self->_location);
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6;
  SBIconListView *iconListView;
  id v8;
  void *v9;
  int v10;
  void *v11;

  v6 = a3;
  iconListView = self->_iconListView;
  v8 = a4;
  -[SBIconListView iconLocation](iconListView, "iconLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v8);

  if (v10)
  {
    -[SBIconListView iconViewForIcon:](self->_iconListView, "iconViewForIcon:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  SBIconListView *iconListView;
  id v8;
  void *v9;
  int v10;
  void *v11;

  v6 = a3;
  iconListView = self->_iconListView;
  v8 = a4;
  -[SBIconListView iconLocation](iconListView, "iconLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if (v10)
  {
    -[SBIconListView iconViewForIcon:](self->_iconListView, "iconViewForIcon:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)firstIconViewForIcon:(id)a3
{
  return -[SBIconListView iconViewForIcon:](self->_iconListView, "iconViewForIcon:", a3);
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  void *v6;
  SBIconListView *iconListView;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x1E0C99E20];
  iconListView = self->_iconListView;
  v8 = a4;
  v9 = a3;
  -[SBIconListView iconLocation](iconListView, "iconLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "minusSet:", v8);
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryCategoryIconViewController firstIconViewForIcon:inLocations:](self, "firstIconViewForIcon:inLocations:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  SBIconListView *iconListView;
  id v8;
  void *v9;
  int v10;
  BOOL v11;

  v6 = a3;
  iconListView = self->_iconListView;
  v8 = a4;
  -[SBIconListView iconLocation](iconListView, "iconLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if (v10)
    v11 = -[SBHLibraryCategoryIconViewController isDisplayingIcon:](self, "isDisplayingIcon:", v6);
  else
    v11 = 0;

  return v11;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  return -[SBIconListView isDisplayingIconView:](self->_iconListView, "isDisplayingIconView:", a3);
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6;
  SBIconListView *iconListView;
  id v8;
  void *v9;
  int v10;
  BOOL v11;

  v6 = a3;
  iconListView = self->_iconListView;
  v8 = a4;
  -[SBIconListView iconLocation](iconListView, "iconLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v8);

  if (v10)
    v11 = -[SBIconListView isDisplayingIconView:](self->_iconListView, "isDisplayingIconView:", v6);
  else
    v11 = 0;

  return v11;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  SBIconListView *iconListView;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  iconListView = self->_iconListView;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__SBHLibraryCategoryIconViewController_enumerateDisplayedIconViewsForIcon_usingBlock___block_invoke;
  v11[3] = &unk_1E8D8AC28;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[SBIconListView enumerateIconViewsUsingBlock:](iconListView, "enumerateIconViewsUsingBlock:", v11);

}

void __86__SBHLibraryCategoryIconViewController_enumerateDisplayedIconViewsForIcon_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v4)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBIconImageInfo *p_iconImageInfo;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    -[SBHLibraryCategoryPodBackgroundView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", v7);
    -[MTMaterialView _setContinuousCornerRadius:](self->_backgroundBlurView, "_setContinuousCornerRadius:", v7);
  }
}

- (void)setEditing:(BOOL)a3
{
  -[SBHLibraryCategoryIconViewController setEditing:animated:](self, "setEditing:animated:", a3, 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_editing != a3)
  {
    v4 = a4;
    self->_editing = a3;
    -[SBIconListView setEditing:](self->_iconListView, "setEditing:");
    -[SBIconListView updateEditingStateAnimated:](self->_iconListView, "updateEditingStateAnimated:", v4);
  }
}

- (void)setContentVisibility:(unint64_t)a3
{
  if (self->_contentVisibility != a3)
  {
    self->_contentVisibility = a3;
    if (a3)
      -[SBHLibraryCategoryIconViewController _setLockedIfPossible:animated:](self, "_setLockedIfPossible:animated:", 1, 1);
    -[SBIconListView setContentVisibility:](self->_iconListView, "setContentVisibility:", a3);
  }
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  SBHIconImageAppearance *v4;
  SBHIconImageAppearance *overrideIconImageAppearance;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconImageAppearance *)objc_msgSend(v6, "copy");
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v4;

    -[SBIconListView setOverrideIconImageAppearance:](self->_iconListView, "setOverrideIconImageAppearance:", v6);
  }

}

- (CGRect)visibleBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SBHLibraryCategoryIconViewController iconImageInfo](self, "iconImageInfo");
  v3 = v2;
  v5 = v4;
  v6 = 0.0;
  v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)continuousCornerRadius
{
  double v2;

  -[SBHLibraryCategoryIconViewController iconImageInfo](self, "iconImageInfo");
  return v2;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  if (self->_showsSquareCorners != a3)
  {
    self->_showsSquareCorners = a3;
    -[SBHLibraryCategoryPodBackgroundView setClipsToBounds:](self->_backgroundView, "setClipsToBounds:", !a3);
  }
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (SBHLibraryCategory)category
{
  return self->_category;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (NSString)location
{
  return self->_location;
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (void)setIconViewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_iconViewProvider, a3);
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_listLayoutProvider, a3);
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void)setIconImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageCache, a3);
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

- (void)setFolderIconImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_folderIconImageCache, a3);
}

- (BOOL)needsBackgroundBlur
{
  return self->_needsBackgroundBlur;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_preventFolderUpdateAssertion, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_lockedView, 0);
  objc_storeStrong((id *)&self->_iconListView, 0);
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
