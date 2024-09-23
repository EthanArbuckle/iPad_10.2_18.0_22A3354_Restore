@implementation PXStoryOverlayController

- (PXStoryOverlayController)initWithObservableModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryOverlayController.m"), 47, CFSTR("%s is not available as initializer"), "-[PXStoryOverlayController initWithObservableModel:]");

  abort();
}

- (PXStoryOverlayController)initWithViewModel:(id)a3
{
  id v4;
  PXStoryOverlayController *v5;
  PXStoryOverlayController *v6;
  uint64_t v7;
  PXNumberAnimator *chromeVisibilityFractionAnimator;
  uint64_t v9;
  PXNumberAnimator *scrubberVisibilityFractionAnimator;
  uint64_t v11;
  PXNumberAnimator *styleSwitcherVisibilityFractionAnimator;
  uint64_t v13;
  PXNumberAnimator *relatedOverlayVisibilityFractionAnimator;
  uint64_t v15;
  PXNumberAnimator *fadeOutOverlayVisibilityFractionAnimator;
  uint64_t v17;
  PXNumberAnimator *infoPanelVisibilityFractionAnimator;
  _QWORD v20[4];
  PXStoryOverlayController *v21;
  id v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PXStoryOverlayController;
  v5 = -[PXStoryController initWithObservableModel:](&v23, sel_initWithObservableModel_, v4);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewModel, v4);
    objc_msgSend(v4, "registerChangeObserver:context:", v6, ViewModelObservationContext_207446);
    v7 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    chromeVisibilityFractionAnimator = v6->_chromeVisibilityFractionAnimator;
    v6->_chromeVisibilityFractionAnimator = (PXNumberAnimator *)v7;

    -[PXNumberAnimator registerChangeObserver:context:](v6->_chromeVisibilityFractionAnimator, "registerChangeObserver:context:", v6, ChromeVisibilityFractionAnimatorObservationContext);
    v9 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    scrubberVisibilityFractionAnimator = v6->_scrubberVisibilityFractionAnimator;
    v6->_scrubberVisibilityFractionAnimator = (PXNumberAnimator *)v9;

    -[PXNumberAnimator registerChangeObserver:context:](v6->_scrubberVisibilityFractionAnimator, "registerChangeObserver:context:", v6, ScrubberVisibilityFractionAnimatorObservationContext);
    v11 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    styleSwitcherVisibilityFractionAnimator = v6->_styleSwitcherVisibilityFractionAnimator;
    v6->_styleSwitcherVisibilityFractionAnimator = (PXNumberAnimator *)v11;

    -[PXNumberAnimator registerChangeObserver:context:](v6->_styleSwitcherVisibilityFractionAnimator, "registerChangeObserver:context:", v6, StyleSwitcherVisibilityFractionAnimatorObservationContext);
    v13 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    relatedOverlayVisibilityFractionAnimator = v6->_relatedOverlayVisibilityFractionAnimator;
    v6->_relatedOverlayVisibilityFractionAnimator = (PXNumberAnimator *)v13;

    -[PXNumberAnimator registerChangeObserver:context:](v6->_relatedOverlayVisibilityFractionAnimator, "registerChangeObserver:context:", v6, RelatedOverlayVisibilityFractionAnimatorObservationContext);
    v15 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    fadeOutOverlayVisibilityFractionAnimator = v6->_fadeOutOverlayVisibilityFractionAnimator;
    v6->_fadeOutOverlayVisibilityFractionAnimator = (PXNumberAnimator *)v15;

    -[PXNumberAnimator registerChangeObserver:context:](v6->_fadeOutOverlayVisibilityFractionAnimator, "registerChangeObserver:context:", v6, FadeOutOverlayVisibilityFractionAnimatorObservationContext);
    v17 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    infoPanelVisibilityFractionAnimator = v6->_infoPanelVisibilityFractionAnimator;
    v6->_infoPanelVisibilityFractionAnimator = (PXNumberAnimator *)v17;

    -[PXNumberAnimator registerChangeObserver:context:](v6->_infoPanelVisibilityFractionAnimator, "registerChangeObserver:context:", v6, InfoPanelVisibilityFractionAnimatorObservationContext);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __46__PXStoryOverlayController_initWithViewModel___block_invoke;
    v20[3] = &unk_1E5146E00;
    v21 = v6;
    v22 = v4;
    -[PXStoryController performChanges:](v21, "performChanges:", v20);

  }
  return v6;
}

- (void)configureUpdater:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryOverlayController;
  v3 = a3;
  -[PXStoryController configureUpdater:](&v4, sel_configureUpdater_, v3);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateMainModel, v4.receiver, v4.super_class);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateRelatedOverlayVisible);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateChromeItems);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateChromeVisibilityFractionAnimator);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateChromeVisibilityFraction);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateScrubberVisibilityFractionAnimator);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateScrubberVisibilityFraction);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateStyleSwitcherVisibilityFractionAnimator);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateStyleSwitcherVisibilityFraction);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateRelatedOverlayVisibilityFractionAnimator);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateRelatedOverlayVisibilityFraction);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateFadeOutOverlayVisibilityFractionAnimator);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateFadeOutOverlayVisibilityFraction);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateInfoPanelVisibilityFractionAnimator);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateInfoPanelVisibilityFraction);

}

- (void)setMainModel:(id)a3
{
  PXStoryModel *v5;
  PXStoryModel *mainModel;
  PXStoryModel *v7;

  v5 = (PXStoryModel *)a3;
  mainModel = self->_mainModel;
  if (mainModel != v5)
  {
    v7 = v5;
    -[PXStoryModel unregisterChangeObserver:context:](mainModel, "unregisterChangeObserver:context:", self, MainModelObservationContext_207445);
    objc_storeStrong((id *)&self->_mainModel, a3);
    -[PXStoryModel registerChangeObserver:context:](self->_mainModel, "registerChangeObserver:context:", self, MainModelObservationContext_207445);
    -[PXStoryOverlayController _invalidateChromeItems](self, "_invalidateChromeItems");
    -[PXStoryOverlayController _invalidateFadeOutOverlayVisibilityFractionAnimator](self, "_invalidateFadeOutOverlayVisibilityFractionAnimator");
    -[PXStoryOverlayController _invalidateStyleSwitcherVisibilityFractionAnimator](self, "_invalidateStyleSwitcherVisibilityFractionAnimator");
    v5 = v7;
  }

}

- (void)_invalidateMainModel
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMainModel);

}

- (void)_updateMainModel
{
  void *v3;
  id v4;

  -[PXStoryOverlayController viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryOverlayController setMainModel:](self, "setMainModel:", v3);

}

- (void)_invalidateChromeItems
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateChromeItems);

}

- (void)_updateChromeItems
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  double v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  _QWORD v35[6];
  char v36;
  uint64_t v37;
  double v38;
  uint64_t v39;

  -[PXStoryOverlayController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryOverlayController mainModel](self, "mainModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "wantsChromeVisible");
  objc_msgSend(v4, "viewLayoutSpec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "wantsRelatedOverlayVisible"))
  {
    if (objc_msgSend(v5, "viewMode") == 1
      && objc_msgSend(v5, "readinessStatus") == 1
      && objc_msgSend(v8, "playerShowsBufferingStatus")
      && (!objc_msgSend(v4, "wantsScrubberVisible")
       || objc_msgSend(v8, "wantsBufferingIndicatorOverScrubber")
       && (objc_msgSend(v5, "isScrolling") & 1) == 0
       && (objc_msgSend(v4, "isScrubbing") & 1) == 0))
    {
      v11 = 0x8000;
    }
    else
    {
      v11 = 0;
    }
    v10 = v11 | objc_msgSend(v7, "canShowCloseButton");
    v12 = objc_msgSend(v4, "viewMode");
    switch(v12)
    {
      case 0:
        goto LABEL_30;
      case 1:
        v13 = objc_msgSend(v7, "fullsizePlayerDefaultChromeItems") | v10;
        if (objc_msgSend(v8, "allowAspectModeToggle"))
        {
          v14 = v13 | 0x4000;
        }
        else
        {
          -[PXStoryOverlayController mainModel](self, "mainModel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "extendedTraitCollection");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "userInterfaceIdiom");

          if (objc_msgSend(v8, "showStyleSwitcher"))
          {
            v24 = 512;
            if (v23 == 5)
              v24 = 1073742336;
            v14 = v24 | v13;
          }
          else
          {
            v25 = objc_msgSend(v8, "showMusicAndColorGradeEditor");
            v26 = v13 | 0x18;
            if (!v25)
              v26 = v13;
            v14 = v26 | 0x20;
          }
        }
        objc_msgSend(v5, "timeline");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "firstSegmentIdentifier");
        v37 = 0;
        v38 = 0.0;
        v39 = 0;
        if (v5)
        {
          objc_msgSend(v5, "currentScrollPosition");
          v29 = v38;
          v30 = &v39;
          if (v38 <= 0.5)
            v30 = &v37;
          v31 = *v30;
        }
        else
        {
          v31 = 0;
        }
        v32 = objc_msgSend(v8, "preferTopChromeItemsInAppNavigationBar", v29);
        if (v28 == v31)
          v33 = 1;
        else
          v33 = v32;
        if (v33)
          v34 = v14;
        else
          v34 = v14 | 0xC00;
        if (objc_msgSend(v4, "edgeToHighlight") == 2)
          v34 |= 0x1000uLL;
        if (objc_msgSend(v4, "edgeToHighlight") == 8)
          v34 |= 0x2000uLL;
        if (objc_msgSend(v4, "shouldShowErrorIndicator"))
          v10 = v34 | 0x10000;
        else
          v10 = v34;
        if (objc_msgSend(v7, "canShowMuteToggleButton")
          && ((objc_msgSend(v4, "wantsChromeVisible") & 1) != 0
           || objc_msgSend(v4, "canShowMuteToggleButtonWhenChromeIsHidden")))
        {
          v10 |= 0x1000000uLL;
        }

        goto LABEL_34;
      case 2:
        if ((objc_msgSend(v4, "isInSelectMode") & 1) != 0)
          goto LABEL_26;
        if (!objc_msgSend(v8, "preferTopChromeItemsInAppNavigationBar"))
          v10 = v11 | 0x20020C42;
        goto LABEL_33;
      case 3:
        goto LABEL_34;
      case 4:
        v10 = v11;
        goto LABEL_34;
      case 5:
        v10 = v11 | 4;
        goto LABEL_34;
      default:
        if (v12 == 100)
        {
LABEL_30:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryOverlayController.m"), 256, CFSTR("Code which should be unreachable has been reached"));

          abort();
        }
        goto LABEL_34;
    }
  }
  if (objc_msgSend(v4, "isRelatedOverlayScrolledIntoView")
    && (objc_msgSend(v7, "shouldHideChromeItemsWhenRelatedOverlayIsScrolledIntoView") & 1) != 0)
  {
LABEL_26:
    v10 = 0;
  }
  else
  {
    if (objc_msgSend(v7, "canShowCloseButton"))
      v9 = 3073;
    else
      v9 = 3072;
    if (objc_msgSend(v7, "onlyShowReplayEndButtonAtTopOfTitle"))
    {
      v10 = v9 | 0x40000;
    }
    else
    {
      v15 = objc_msgSend(v5, "currentAssetCollectionIsFavorite");
      v16 = 1835008;
      if (v15)
        v16 = 2883584;
      v17 = v16 | v9;
      if (objc_msgSend(v4, "wantsFeedbackAction"))
        v10 = v17 | 0x2000000;
      else
        v10 = v17;
    }
  }
LABEL_33:
  v6 = 1;
LABEL_34:
  v19 = v10 & ~objc_msgSend(v4, "allowedChromeItems") & 0x1010004;
  v20 = objc_msgSend(v4, "allowedChromeItems");
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __46__PXStoryOverlayController__updateChromeItems__block_invoke;
  v35[3] = &__block_descriptor_49_e35_v16__0___PXStoryMutableViewModel__8l;
  v36 = v6;
  v35[4] = v20 & v10;
  v35[5] = v19;
  objc_msgSend(v4, "performChanges:", v35);

}

- (void)_invalidateRelatedOverlayVisible
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateRelatedOverlayVisible);

}

- (void)_updateRelatedOverlayVisible
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  _QWORD v15[4];
  char v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PXStoryOverlayController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isPerformingViewControllerTransition") & 1) == 0)
  {
    if (!objc_msgSend(v3, "isAtPlaybackEnd") || objc_msgSend(v3, "viewMode") != 1)
      goto LABEL_9;
    objc_msgSend(v3, "mainConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isAppleMusicPreview"))
      goto LABEL_8;
    objc_msgSend(v3, "mainConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "shouldDismissAtEnd") & 1) != 0
      || objc_msgSend(v3, "isPerformingViewControllerTransition"))
    {

LABEL_8:
LABEL_9:
      v6 = 0;
LABEL_10:
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __56__PXStoryOverlayController__updateRelatedOverlayVisible__block_invoke;
      v15[3] = &__block_descriptor_33_e35_v16__0___PXStoryMutableViewModel__8l;
      v16 = v6;
      objc_msgSend(v3, "performChanges:", v15);
      goto LABEL_11;
    }
    v7 = objc_msgSend(v3, "shouldAutoReplayPreference");

    if ((v7 & 1) != 0)
      goto LABEL_9;
    if ((objc_msgSend(v3, "wantsRelatedOverlayVisible") & 1) != 0)
    {
      v6 = 1;
      goto LABEL_10;
    }
    v18 = 0;
    v8 = objc_msgSend(v3, "checkIfShouldPreventAdvancingAndReturnReason:", &v18);
    v9 = v18;
    v10 = v9;
    if ((v8 & 1) != 0)
    {
      v11 = v9;
    }
    else
    {
      -[PXStoryOverlayController mainModel](self, "mainModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v13 = objc_msgSend(v12, "checkIfShouldPreventAdvancingAndReturnReason:", &v17);
      v11 = v17;

      if (!v13)
      {
        v6 = 1;
LABEL_22:

        goto LABEL_10;
      }
    }
    PLStoryGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEBUG, "preventing overlay from becoming visible for reason: %@", buf, 0xCu);
    }

    v6 = 0;
    goto LABEL_22;
  }
LABEL_11:

}

- (void)_invalidateChromeVisibilityFractionAnimator
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateChromeVisibilityFractionAnimator);

}

- (void)_updateChromeVisibilityFractionAnimator
{
  void *v3;
  double v4;
  id v5;

  -[PXStoryOverlayController chromeVisibilityFractionAnimator](self, "chromeVisibilityFractionAnimator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryOverlayController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "wantsChromeVisible"))
    v4 = 1.0;
  else
    v4 = 0.0;

  -[PXStoryOverlayController _updateAnimator:endValue:animated:](self, "_updateAnimator:endValue:animated:", v5, 1, v4);
}

- (void)_invalidateChromeVisibilityFraction
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateChromeVisibilityFraction);

}

- (void)_updateChromeVisibilityFraction
{
  void *v3;
  _QWORD v4[5];

  -[PXStoryOverlayController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__PXStoryOverlayController__updateChromeVisibilityFraction__block_invoke;
  v4[3] = &unk_1E5146E78;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_invalidateScrubberVisibilityFractionAnimator
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateScrubberVisibilityFractionAnimator);

}

- (void)_updateScrubberVisibilityFractionAnimator
{
  void *v3;
  double v4;
  id v5;

  -[PXStoryOverlayController scrubberVisibilityFractionAnimator](self, "scrubberVisibilityFractionAnimator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryOverlayController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "wantsScrubberVisible"))
    v4 = 1.0;
  else
    v4 = 0.0;

  -[PXStoryOverlayController _updateAnimator:endValue:animated:](self, "_updateAnimator:endValue:animated:", v5, 1, v4);
}

- (void)_invalidateStyleSwitcherVisibilityFractionAnimator
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateStyleSwitcherVisibilityFractionAnimator);

}

- (void)_updateStyleSwitcherVisibilityFractionAnimator
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  -[PXStoryOverlayController styleSwitcherVisibilityFractionAnimator](self, "styleSwitcherVisibilityFractionAnimator");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryOverlayController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "viewMode");

  if (v4 == 4)
  {
    v5 = 1.0;
    v6 = 1;
  }
  else
  {
    -[PXStoryOverlayController viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mainConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isAppleMusicPreview");

    v6 = v9 ^ 1u;
    v5 = 0.0;
    if (v9)
      v5 = 1.0;
  }
  -[PXStoryOverlayController _updateAnimator:endValue:animated:](self, "_updateAnimator:endValue:animated:", v10, v6, v5);

}

- (void)_invalidateFadeOutOverlayVisibilityFractionAnimator
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFadeOutOverlayVisibilityFractionAnimator);

}

- (void)_updateFadeOutOverlayVisibilityFractionAnimator
{
  void *v3;
  double v4;
  double v5;
  id v6;

  -[PXStoryOverlayController fadeOutOverlayVisibilityFractionAnimator](self, "fadeOutOverlayVisibilityFractionAnimator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryOverlayController mainModel](self, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outroFractionCompleted");
  v5 = v4;

  -[PXStoryOverlayController _updateAnimator:endValue:animated:](self, "_updateAnimator:endValue:animated:", v6, 1, v5);
}

- (void)_invalidateFadeOutOverlayVisibilityFraction
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFadeOutOverlayVisibilityFraction);

}

- (void)_updateFadeOutOverlayVisibilityFraction
{
  void *v3;
  _QWORD v4[5];

  -[PXStoryOverlayController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__PXStoryOverlayController__updateFadeOutOverlayVisibilityFraction__block_invoke;
  v4[3] = &unk_1E5146E78;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_invalidateInfoPanelVisibilityFractionAnimator
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateInfoPanelVisibilityFractionAnimator);

}

- (void)_updateInfoPanelVisibilityFractionAnimator
{
  void *v3;
  double v4;
  double v5;
  id v6;

  -[PXStoryOverlayController infoPanelVisibilityFractionAnimator](self, "infoPanelVisibilityFractionAnimator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryOverlayController mainModel](self, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "desiredInfoPanelVisibilityFraction");
  v5 = v4;

  -[PXStoryOverlayController _updateAnimator:endValue:animated:](self, "_updateAnimator:endValue:animated:", v6, 1, v5);
}

- (void)_invalidateInfoPanelVisibilityFraction
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateInfoPanelVisibilityFraction);

}

- (void)_updateInfoPanelVisibilityFraction
{
  void *v3;
  _QWORD v4[5];

  -[PXStoryOverlayController mainModel](self, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__PXStoryOverlayController__updateInfoPanelVisibilityFraction__block_invoke;
  v4[3] = &unk_1E5142E50;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_updateAnimator:(id)a3 endValue:(double)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v6;
  void *v7;
  _QWORD aBlock[5];

  v5 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PXStoryOverlayController__updateAnimator_endValue_animated___block_invoke;
  aBlock[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
  *(double *)&aBlock[4] = a4;
  v6 = a3;
  v7 = _Block_copy(aBlock);
  if (v5)
    objc_msgSend(v6, "performChangesUsingDefaultSpringAnimationWithInitialVelocity:changes:", v7, 0.0);
  else
    objc_msgSend(v6, "performChangesWithoutAnimation:", v7);

}

- (void)_invalidateScrubberVisibilityFraction
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateScrubberVisibilityFraction);

}

- (void)_updateScrubberVisibilityFraction
{
  void *v3;
  _QWORD v4[5];

  -[PXStoryOverlayController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__PXStoryOverlayController__updateScrubberVisibilityFraction__block_invoke;
  v4[3] = &unk_1E5146E78;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_invalidateStyleSwitcherVisibilityFraction
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateStyleSwitcherVisibilityFraction);

}

- (void)_updateStyleSwitcherVisibilityFraction
{
  void *v3;
  _QWORD v4[5];

  -[PXStoryOverlayController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__PXStoryOverlayController__updateStyleSwitcherVisibilityFraction__block_invoke;
  v4[3] = &unk_1E5146E78;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_invalidateRelatedOverlayVisibilityFractionAnimator
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateRelatedOverlayVisibilityFractionAnimator);

}

- (void)_updateRelatedOverlayVisibilityFractionAnimator
{
  BOOL v3;
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  v3 = -[PXStoryOverlayController preventAnimatingNextRelatedOverlayVisibilityFractionChange](self, "preventAnimatingNextRelatedOverlayVisibilityFractionChange");
  -[PXStoryOverlayController setPreventAnimatingNextRelatedOverlayVisibilityFractionChange:](self, "setPreventAnimatingNextRelatedOverlayVisibilityFractionChange:", 0);
  -[PXStoryOverlayController relatedOverlayVisibilityFractionAnimator](self, "relatedOverlayVisibilityFractionAnimator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PXStoryOverlayController__updateRelatedOverlayVisibilityFractionAnimator__block_invoke;
  aBlock[3] = &unk_1E5145840;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  if (v3)
    objc_msgSend(v4, "performChangesWithoutAnimation:", v5);
  else
    objc_msgSend(v4, "performChangesUsingDefaultSpringAnimationWithInitialVelocity:changes:", v5, 0.0);

}

- (void)_invalidateRelatedOverlayVisibilityFraction
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateRelatedOverlayVisibilityFraction);

}

- (void)_updateRelatedOverlayVisibilityFraction
{
  void *v3;
  _QWORD v4[5];

  -[PXStoryOverlayController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__PXStoryOverlayController__updateRelatedOverlayVisibilityFraction__block_invoke;
  v4[3] = &unk_1E5146E78;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)handleModelChange:(unint64_t)a3
{
  _QWORD v5[6];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryOverlayController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PXStoryOverlayController_handleModelChange___block_invoke;
  v5[3] = &unk_1E51363F0;
  v5[4] = self;
  v5[5] = a3;
  -[PXStoryController performChanges:](self, "performChanges:", v5);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  _QWORD *v9;
  objc_super v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  v8 = a3;
  if ((void *)ChromeVisibilityFractionAnimatorObservationContext == a5)
  {
    if ((a4 & 2) == 0)
      goto LABEL_33;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke;
    v22[3] = &unk_1E5146DD8;
    v22[4] = self;
    v9 = v22;
    goto LABEL_32;
  }
  if ((void *)RelatedOverlayVisibilityFractionAnimatorObservationContext == a5)
  {
    if ((a4 & 2) == 0)
      goto LABEL_33;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_2;
    v21[3] = &unk_1E5146DD8;
    v21[4] = self;
    v9 = v21;
    goto LABEL_32;
  }
  if ((void *)ScrubberVisibilityFractionAnimatorObservationContext == a5)
  {
    if ((a4 & 2) == 0)
      goto LABEL_33;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_3;
    v20[3] = &unk_1E5146DD8;
    v20[4] = self;
    v9 = v20;
    goto LABEL_32;
  }
  if ((void *)StyleSwitcherVisibilityFractionAnimatorObservationContext == a5)
  {
    if ((a4 & 2) == 0)
      goto LABEL_33;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_4;
    v19[3] = &unk_1E5146DD8;
    v19[4] = self;
    v9 = v19;
    goto LABEL_32;
  }
  if ((void *)FadeOutOverlayVisibilityFractionAnimatorObservationContext == a5)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_5;
    v18[3] = &unk_1E5146DD8;
    v18[4] = self;
    v9 = v18;
    goto LABEL_32;
  }
  if ((void *)InfoPanelVisibilityFractionAnimatorObservationContext == a5)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_6;
    v17[3] = &unk_1E5146DD8;
    v17[4] = self;
    v9 = v17;
    goto LABEL_32;
  }
  if ((void *)MainModelObservationContext_207445 != a5)
  {
    if ((void *)ViewModelObservationContext_207446 != a5)
    {
      v10.receiver = self;
      v10.super_class = (Class)PXStoryOverlayController;
      -[PXStoryController observable:didChange:context:](&v10, sel_observable_didChange_context_, v8, a4, a5);
      goto LABEL_33;
    }
    if ((a4 & 0x800000000000008) == 0)
      goto LABEL_33;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_12;
    v11[3] = &unk_1E5146DD8;
    v11[4] = self;
    v9 = v11;
LABEL_32:
    -[PXStoryController performChanges:](self, "performChanges:", v9);
    goto LABEL_33;
  }
  if ((a4 & 0x200000210004) != 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_7;
    v16[3] = &unk_1E5146DD8;
    v16[4] = self;
    -[PXStoryController performChanges:](self, "performChanges:", v16);
  }
  if ((a4 & 0x98200000000) != 0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_8;
    v15[3] = &unk_1E5146DD8;
    v15[4] = self;
    -[PXStoryController performChanges:](self, "performChanges:", v15);
  }
  if ((a4 & 0x400004000000) != 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_9;
    v14[3] = &unk_1E5146DD8;
    v14[4] = self;
    -[PXStoryController performChanges:](self, "performChanges:", v14);
  }
  if ((a4 & 0x400000000000000) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_10;
    v13[3] = &unk_1E5146DD8;
    v13[4] = self;
    -[PXStoryController performChanges:](self, "performChanges:", v13);
  }
  if ((a4 & 8) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__PXStoryOverlayController_observable_didChange_context___block_invoke_11;
    v12[3] = &unk_1E5146DD8;
    v12[4] = self;
    v9 = v12;
    goto LABEL_32;
  }
LABEL_33:

}

- (PXStoryViewModel)viewModel
{
  return (PXStoryViewModel *)objc_loadWeakRetained((id *)&self->_viewModel);
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (PXNumberAnimator)chromeVisibilityFractionAnimator
{
  return self->_chromeVisibilityFractionAnimator;
}

- (PXNumberAnimator)scrubberVisibilityFractionAnimator
{
  return self->_scrubberVisibilityFractionAnimator;
}

- (PXNumberAnimator)styleSwitcherVisibilityFractionAnimator
{
  return self->_styleSwitcherVisibilityFractionAnimator;
}

- (PXNumberAnimator)relatedOverlayVisibilityFractionAnimator
{
  return self->_relatedOverlayVisibilityFractionAnimator;
}

- (PXNumberAnimator)fadeOutOverlayVisibilityFractionAnimator
{
  return self->_fadeOutOverlayVisibilityFractionAnimator;
}

- (PXNumberAnimator)infoPanelVisibilityFractionAnimator
{
  return self->_infoPanelVisibilityFractionAnimator;
}

- (BOOL)preventAnimatingNextRelatedOverlayVisibilityFractionChange
{
  return self->_preventAnimatingNextRelatedOverlayVisibilityFractionChange;
}

- (void)setPreventAnimatingNextRelatedOverlayVisibilityFractionChange:(BOOL)a3
{
  self->_preventAnimatingNextRelatedOverlayVisibilityFractionChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoPanelVisibilityFractionAnimator, 0);
  objc_storeStrong((id *)&self->_fadeOutOverlayVisibilityFractionAnimator, 0);
  objc_storeStrong((id *)&self->_relatedOverlayVisibilityFractionAnimator, 0);
  objc_storeStrong((id *)&self->_styleSwitcherVisibilityFractionAnimator, 0);
  objc_storeStrong((id *)&self->_scrubberVisibilityFractionAnimator, 0);
  objc_storeStrong((id *)&self->_chromeVisibilityFractionAnimator, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateChromeVisibilityFraction");
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateRelatedOverlayVisibilityFraction");
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateScrubberVisibilityFraction");
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateStyleSwitcherVisibilityFraction");
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateFadeOutOverlayVisibilityFraction");
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateInfoPanelVisibilityFraction");
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateChromeItems");
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateRelatedOverlayVisible");
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateFadeOutOverlayVisibilityFractionAnimator");
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateInfoPanelVisibilityFractionAnimator");
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateChromeItems");
}

uint64_t __57__PXStoryOverlayController_observable_didChange_context___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateChromeItems");
}

void __46__PXStoryOverlayController_handleModelChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 8) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateChromeVisibilityFraction");
    objc_msgSend(*(id *)(a1 + 32), "_invalidateChromeVisibilityFractionAnimator");
    v3 = *(_QWORD *)(a1 + 40);
    if ((v3 & 0x2000000) == 0)
    {
LABEL_3:
      if ((v3 & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((v3 & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(*(id *)(a1 + 32), "_invalidateScrubberVisibilityFractionAnimator");
  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 0x2000) == 0)
  {
LABEL_4:
    if ((v3 & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_9;
  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "_invalidateStyleSwitcherVisibilityFractionAnimator");
  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 0x8000) == 0)
    goto LABEL_11;
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "_invalidateRelatedOverlayVisibilityFractionAnimator");
  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 0x40) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPreventAnimatingNextRelatedOverlayVisibilityFractionChange:", 1);
    v3 = *(_QWORD *)(a1 + 40);
  }
LABEL_11:
  if ((v3 & 0x4001000202000) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateRelatedOverlayVisible");
    v3 = *(_QWORD *)(a1 + 40);
  }
  if ((v3 & 0x40) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateMainModel");
    v3 = *(_QWORD *)(a1 + 40);
  }
  if ((v3 & 0x4028AA8A022) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateChromeItems");

}

void __67__PXStoryOverlayController__updateRelatedOverlayVisibilityFraction__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "relatedOverlayVisibilityFractionAnimator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationValue");
  objc_msgSend(v3, "setRelatedOverlayVisibilityFraction:");

}

void __75__PXStoryOverlayController__updateRelatedOverlayVisibilityFractionAnimator__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  int v4;
  double v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "wantsRelatedOverlayVisible");
  v5 = 0.0;
  if (v4)
    v5 = 1.0;
  objc_msgSend(v3, "setValue:", v5);

}

void __66__PXStoryOverlayController__updateStyleSwitcherVisibilityFraction__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "styleSwitcherVisibilityFractionAnimator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationValue");
  objc_msgSend(v3, "setStyleSwitcherVisibilityFraction:");

}

void __61__PXStoryOverlayController__updateScrubberVisibilityFraction__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "scrubberVisibilityFractionAnimator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationValue");
  objc_msgSend(v3, "setScrubberVisibilityFraction:");

}

uint64_t __62__PXStoryOverlayController__updateAnimator_endValue_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

void __62__PXStoryOverlayController__updateInfoPanelVisibilityFraction__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "infoPanelVisibilityFractionAnimator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationValue");
  objc_msgSend(v3, "setInfoPanelVisibilityFraction:");

}

void __67__PXStoryOverlayController__updateFadeOutOverlayVisibilityFraction__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "fadeOutOverlayVisibilityFractionAnimator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationValue");
  objc_msgSend(v3, "setFadeOutOverlayVisibilityFraction:");

}

void __59__PXStoryOverlayController__updateChromeVisibilityFraction__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v2, "chromeVisibilityFractionAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationValue");
  v5 = v4;

  objc_msgSend(v6, "setChromeVisibilityFraction:", v5);
}

uint64_t __56__PXStoryOverlayController__updateRelatedOverlayVisible__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWantsRelatedOverlayVisible:", *(unsigned __int8 *)(a1 + 32));
}

void __46__PXStoryOverlayController__updateChromeItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setChromeItems:", v3);
  objc_msgSend(v4, "setWantsChromeVisible:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v4, "setChromeItemsToBeDisplayedExternally:", *(_QWORD *)(a1 + 40));

}

uint64_t __46__PXStoryOverlayController_initWithViewModel___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 40), "mainModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMainModel:", v2);

  objc_msgSend(*(id *)(a1 + 32), "_invalidateRelatedOverlayVisible");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateChromeItems");
}

@end
