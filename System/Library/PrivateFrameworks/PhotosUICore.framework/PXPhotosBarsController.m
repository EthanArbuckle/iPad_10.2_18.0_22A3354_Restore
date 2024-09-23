@implementation PXPhotosBarsController

- (PXPhotosBarsController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarsController.m"), 133, CFSTR("%s is not available as initializer"), "-[PXPhotosBarsController init]");

  abort();
}

- (PXPhotosBarsController)initWithPhotosContentController:(id)a3
{
  id v4;
  PXPhotosBarsController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  PXAssetSelectionTypeCounter *assetTypeCounter;
  uint64_t v24;
  NSMapTable *actionTypeByBarButtonItem;
  void *v26;
  uint64_t v27;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  uint64_t v29;
  PXLibraryFilterState *libraryFilterState;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PXPhotosBarsController;
  v5 = -[PXBarsController init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosBarsController setContentSizeCategory:](v5, "setContentSizeCategory:", v7);

    objc_storeWeak((id *)&v5->_contentController, v4);
    objc_msgSend(v4, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v5->_viewModel, v8);
    objc_msgSend(v8, "registerChangeObserver:context:", v5, PXPhotosBarsControllerViewModelObserverContext);
    objc_msgSend(v8, "specManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerChangeObserver:context:", v5, PXPhotosBarsControllerSpecObserverContext);

    objc_msgSend(v8, "specManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "spec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "interButtonSpacing");
    v5->_interButtonSpacing = v12;
    objc_msgSend(v11, "endButtonSpacing");
    v5->_endButtonSpacing = v13;
    v5->_wantsToggleSidebarButton = objc_msgSend(v11, "wantsToggleSidebarButton");
    objc_msgSend(v8, "gridActionManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPerformerDelegate:", v5);

    objc_msgSend(v8, "assetActionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPerformerDelegate:", v5);

    objc_msgSend(v8, "assetCollectionActionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPerformerDelegate:", v5);

    objc_msgSend(v8, "optionsController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      objc_msgSend(v8, "optionsController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "preloadOptions");

    }
    objc_msgSend(v8, "optionsController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setOptionsDelegate:", v5);

    objc_msgSend(v8, "selectionManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "assetTypeCounter");
    v22 = objc_claimAutoreleasedReturnValue();
    assetTypeCounter = v5->_assetTypeCounter;
    v5->_assetTypeCounter = (PXAssetSelectionTypeCounter *)v22;

    -[PXAssetSelectionTypeCounter registerChangeObserver:context:](v5->_assetTypeCounter, "registerChangeObserver:context:", v5, PXPhotosBarsControllerAssetTypeCountObserverContext);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v24 = objc_claimAutoreleasedReturnValue();
    actionTypeByBarButtonItem = v5->_actionTypeByBarButtonItem;
    v5->_actionTypeByBarButtonItem = (NSMapTable *)v24;

    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addDeferredKeyObserver:", v5);

    objc_msgSend(v8, "sharedLibraryStatusProvider");
    v27 = objc_claimAutoreleasedReturnValue();
    sharedLibraryStatusProvider = v5->_sharedLibraryStatusProvider;
    v5->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v27;

    -[PXSharedLibraryStatusProvider registerChangeObserver:context:](v5->_sharedLibraryStatusProvider, "registerChangeObserver:context:", v5, PXSharedLibraryStatusProviderObservationContext_272479);
    objc_msgSend(v8, "libraryFilterState");
    v29 = objc_claimAutoreleasedReturnValue();
    libraryFilterState = v5->_libraryFilterState;
    v5->_libraryFilterState = (PXLibraryFilterState *)v29;

    -[PXLibraryFilterState registerChangeObserver:context:](v5->_libraryFilterState, "registerChangeObserver:context:", v5, PXLibraryFilterStateObservationContext_272480);
  }

  return v5;
}

- (NSString)selectModeCaptionText
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  -[PXPhotosBarsController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInSelectMode");
  objc_msgSend(v2, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetTypeCounter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "typedCount");
  PXLocalizedSelectModeCaption(v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)_updateSelectModeCaption
{
  id v3;

  -[PXPhotosBarsController selectModeCaptionText](self, "selectModeCaptionText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  PXPhotosBarsUpdateSelectModeCaption(v3, self->_selectModeCaptionLabel, self->_selectModeChevronButton);

}

- (UILabel)selectModeCaptionLabel
{
  UILabel *selectModeCaptionLabel;
  UILabel *v4;
  UILabel *v5;

  selectModeCaptionLabel = self->_selectModeCaptionLabel;
  if (!selectModeCaptionLabel)
  {
    PXPhotosBarsCreateSelectModeCaptionLabel();
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_selectModeCaptionLabel;
    self->_selectModeCaptionLabel = v4;

    -[PXPhotosBarsController _updateSelectModeCaption](self, "_updateSelectModeCaption");
    selectModeCaptionLabel = self->_selectModeCaptionLabel;
  }
  return selectModeCaptionLabel;
}

- (UIButton)selectModeChevronButton
{
  UIButton *selectModeChevronButton;
  UIButton *v4;
  UIButton *v5;

  selectModeChevronButton = self->_selectModeChevronButton;
  if (!selectModeChevronButton)
  {
    PXPhotosBarsSelectModeChevronButton(self);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_selectModeChevronButton;
    self->_selectModeChevronButton = v4;

    -[PXPhotosBarsController _updateSelectModeCaption](self, "_updateSelectModeCaption");
    selectModeChevronButton = self->_selectModeChevronButton;
  }
  return selectModeChevronButton;
}

- (void)viewControllerDidChange
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXPhotosBarButtonItemsController *v13;
  void *v14;
  PXPhotosBarButtonItemsController *v15;
  PXPhotosBarButtonItemsController *barButtonItemsController;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXPhotosBarsController;
  -[PXBarsController viewControllerDidChange](&v17, sel_viewControllerDidChange);
  -[PXBarsController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_setPreferredLargeTitleDisplayMode:", 2);

  -[PXPhotosBarsController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "navBarStyle");

  if (v6 > 7 || ((1 << v6) & 0xC1) == 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v7, "configureWithOpaqueBackground");
    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "colorNavbarArea") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 0.3);
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v9);

    objc_msgSend(v7, "setShadowColor:", 0);
    objc_msgSend(v3, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStandardAppearance:", v7);

    -[PXPhotosBarsController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photosBarsControllerDidUpdateNavigationItemAppearance:", self);

  }
  objc_msgSend(v3, "px_extendedTraitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [PXPhotosBarButtonItemsController alloc];
  -[PXPhotosBarsController viewModel](self, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PXPhotosBarButtonItemsController initWithExtendedTraitCollection:viewModel:](v13, "initWithExtendedTraitCollection:viewModel:", v12, v14);
  barButtonItemsController = self->_barButtonItemsController;
  self->_barButtonItemsController = v15;

}

- (id)createAssetActionManagerForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PXPhotosBarsController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetActionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v5, "dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithSelectedObjectReference:dataSourceManager:", v4, v8);

  objc_msgSend(v9, "setPerformerDelegate:", self);
  return v9;
}

- (void)updateBars
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int16 v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
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
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  int v38;
  PXBarAnimationOptions *v39;
  double v40;
  uint64_t v41;
  PXBarAnimationOptions *v42;
  id v43;
  PXBarAnimationOptions *v44;
  id v45;
  void *v46;
  int v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_super v54;
  _QWORD block[4];
  id v56;
  PXBarAnimationOptions *v57;
  id v58;
  uint64_t v59;
  char v60;
  char v61;
  char v62;
  char v63;
  id v64;
  id v65;
  id v66;
  id v67[2];

  -[PXPhotosBarsController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = v4;
  if (!v5)
  {
    objc_msgSend(v4, "firstAssetCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedTitle");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v3, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v3, "title");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:

  -[PXPhotosBarsController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasSharedLibraryOrPreview");

  -[PXPhotosBarsController viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "allowedChromeItems");

  v13 = (id)MEMORY[0x1E0C9AA60];
  if ((v12 & 0x800) != 0)
  {
    PXPhotosBarsItemIdentifierProviderForModel(v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v13;
    v67[0] = v8;
    v64 = 0;
    v65 = v13;
    objc_msgSend(v16, "valuesForModel:title:leadingIdentifiers:trailingIdentifiers:toolbarIdentifiers:hasSharedLibraryOrPreview:", v3, v67, &v66, &v65, &v64, v10);
    v17 = v67[0];

    v15 = v66;
    v13 = v65;
    v14 = v64;

    v8 = v17;
  }
  else
  {
    v14 = 0;
    v15 = (id)MEMORY[0x1E0C9AA60];
  }
  v18 = (void *)objc_msgSend(v15, "copy");
  -[PXPhotosBarsController setLeftBarButtonItemIdentifiers:](self, "setLeftBarButtonItemIdentifiers:", v18);

  v19 = (void *)objc_msgSend(v13, "copy");
  -[PXPhotosBarsController setRightBarButtonItemIdentifiers:](self, "setRightBarButtonItemIdentifiers:", v19);

  v49 = v14;
  v20 = (void *)objc_msgSend(v14, "copy");
  -[PXPhotosBarsController setToolbarItemIdentifiers:](self, "setToolbarItemIdentifiers:", v20);

  -[PXBarsController viewController](self, "viewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTitle:", v8);

  if (objc_msgSend(v3, "navBarStyle") && objc_msgSend(v3, "navBarStyle") != 7 && objc_msgSend(v3, "navBarStyle") != 6)
  {
    -[PXBarsController viewController](self, "viewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTitle:", &stru_1E5149688);

  }
  -[PXBarsController viewController](self, "viewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "navigationItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackButtonTitle:", v8);

  -[PXBarsController viewController](self, "viewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "navigationItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "px_setBackButtonDisplayMode:", 2);

  v28 = objc_msgSend(v3, "_shouldMimicSystemChromelessUsingManualScrollEdgeAppearance");
  -[PXBarsController viewController](self, "viewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "navigationItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_setManualScrollEdgeAppearanceEnabled:", v28);

  v48 = objc_msgSend(v3, "isEmbedded");
  v31 = objc_msgSend(v3, "wantsTabBarVisible");
  v32 = objc_msgSend(v3, "wantsNavbarVisible");
  v52 = v8;
  if (objc_msgSend(v3, "wantsToolbarVisible"))
    v33 = objc_msgSend(v3, "toolbarStyle") == 0;
  else
    v33 = 0;
  v50 = v15;
  v51 = v13;
  if (objc_msgSend(v3, "requiresLightTopBars"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v35 = 2;
  }
  else
  {
    v34 = 0;
    v35 = 0;
  }
  -[PXPhotosBarsController barAppearance](self, "barAppearance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isAppearing") & 1) != 0)
    goto LABEL_29;
  objc_msgSend(v36, "navigationBarTintColor");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (v34 == v37)
  {

  }
  else
  {
    v38 = objc_msgSend(v34, "isEqual:", v37);

    if (!v38)
      goto LABEL_27;
  }
  if (v35 == objc_msgSend(v36, "barAppearancePreferredStatusBarStyle")
    && v32 == objc_msgSend(v36, "prefersNavigationBarVisible"))
  {
    v47 = objc_msgSend(v36, "prefersToolbarVisible");

    if (v33 == v47)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_27:

LABEL_28:
  if (v31 == objc_msgSend(v36, "prefersTabBarVisible"))
  {
    v39 = [PXBarAnimationOptions alloc];
    v40 = 0.3;
    v41 = 1;
    goto LABEL_31;
  }
LABEL_29:
  v39 = [PXBarAnimationOptions alloc];
  v40 = 0.0;
  v41 = 0;
LABEL_31:
  v42 = -[PXBarAnimationOptions initWithType:duration:](v39, "initWithType:duration:", v41, v40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PXPhotosBarsController_updateBars__block_invoke;
  block[3] = &unk_1E51434B8;
  v56 = v36;
  v57 = v42;
  v60 = v32;
  v61 = v33;
  v62 = v31;
  v63 = v48;
  v58 = v34;
  v59 = v35;
  v43 = v34;
  v44 = v42;
  v45 = v36;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v54.receiver = self;
  v54.super_class = (Class)PXPhotosBarsController;
  -[PXBarsController updateBars](&v54, sel_updateBars);
  -[PXPhotosBarsController delegate](self, "delegate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "photosBarsControllerDidUpdateBars:", self);

}

- (id)barAppearance
{
  void *v2;
  void *v3;

  -[PXBarsController viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_barAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PXPresentationEnvironment)presentationEnvironment
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PXPhotosBarsController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationEnvironmentForPhotosBarsController:withSourceItem:", self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PXBarsController viewController](self, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXPresentationEnvironmentForSender(v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (PXPresentationEnvironment *)v6;
}

- (PLDateRangeFormatter)dateRangeFormatter
{
  PLDateRangeFormatter *dateRangeFormatter;
  PLDateRangeFormatter *v4;
  PLDateRangeFormatter *v5;

  dateRangeFormatter = self->_dateRangeFormatter;
  if (!dateRangeFormatter)
  {
    v4 = (PLDateRangeFormatter *)objc_msgSend(objc_alloc(MEMORY[0x1E0D716B0]), "initWithPreset:", 0);
    v5 = self->_dateRangeFormatter;
    self->_dateRangeFormatter = v4;

    dateRangeFormatter = self->_dateRangeFormatter;
  }
  return dateRangeFormatter;
}

- (void)setInterButtonSpacing:(double)a3
{
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_interButtonSpacing != a3)
  {
    self->_interButtonSpacing = a3;
    v5[0] = CFSTR("PXBarItemIdentifierInterButtonSpacing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXBarsController purgeCachedBarButtonItemsForIdentifiers:](self, "purgeCachedBarButtonItemsForIdentifiers:", v4);

    -[PXBarsController invalidateBars](self, "invalidateBars");
  }
}

- (void)setEndButtonSpacing:(double)a3
{
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_endButtonSpacing != a3)
  {
    self->_endButtonSpacing = a3;
    v5[0] = CFSTR("PXBarItemIdentifierButtonEndSpacing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXBarsController purgeCachedBarButtonItemsForIdentifiers:](self, "purgeCachedBarButtonItemsForIdentifiers:", v4);

    -[PXBarsController invalidateBars](self, "invalidateBars");
  }
}

- (void)setWantsToggleSidebarButton:(BOOL)a3
{
  if (self->_wantsToggleSidebarButton != a3)
  {
    self->_wantsToggleSidebarButton = a3;
    -[PXBarsController invalidateBars](self, "invalidateBars");
  }
}

- (id)createBarButtonItemForIdentifier:(id)a3 placement:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __CFString *v13;
  char *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char *v22;
  id v23;
  __CFString *v24;
  id v25;
  id v26;
  void (**v27)(_QWORD);
  void *v28;
  void *v29;
  uint64_t v30;
  char *v31;
  void *v32;
  void *v33;
  void *v34;
  char *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  char *v40;
  __CFString *v42;
  void *v43;
  int v44;
  uint64_t v45;
  __CFString *v46;
  void *v47;
  __CFString *v48;
  id v49;
  void *v50;
  int v51;
  void *v52;
  __CFString *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  const __CFString *v64;
  void *v65;
  void *v66;
  __CFString *v67;
  __CFString *v68;
  __CFString *v69;
  __CFString *v70;
  void *v71;
  __CFString *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  id v76;
  id v77;
  char *v78;
  uint64_t v79;
  void *v80;
  id v81;
  id v82;
  int v83;
  void *v84;
  void *v85;
  PXPhotosBarsController *val;
  void *v87;
  void *v88;
  void *v89;
  _QWORD aBlock[4];
  id v91;
  PXPhotosBarsController *v92;
  __CFString *v93;
  id v94;
  id v95;
  id v96;
  id v97;
  char *v98;
  unint64_t v99;
  objc_super v100;
  objc_super v101;
  _QWORD v102[4];
  id v103;
  uint8_t buf[4];
  id v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[PXBarsController viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_extendedTraitCollection");
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  val = self;
  -[PXPhotosBarsController viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a4 - 2 >= 2)
  {
    if (a4 <= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, val, CFSTR("PXPhotosBarsController.m"), 384, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v11 = 0;
  }
  else if (objc_msgSend(v9, "navBarStyle") && objc_msgSend(v10, "navBarStyle") != 7)
  {
    v11 = 1;
  }
  else
  {
    v11 = objc_msgSend(v10, "wantsModernNavBarButtons");
  }
  v83 = v11;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierSelect")))
  {
    v87 = 0;
    v88 = 0;
    v78 = 0;
    v79 = 0;
    v12 = 0;
    v13 = 0;
    v14 = sel_handleSelectBarButtonItem_;
    goto LABEL_35;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierSelectAll")))
  {
    v87 = 0;
    v88 = 0;
    v78 = 0;
    v79 = 0;
    v12 = 0;
    v13 = 0;
    v14 = sel_handleSelectAllBarButtonItem_;
    goto LABEL_35;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierDeselectAll")))
  {
    v87 = 0;
    v88 = 0;
    v78 = 0;
    v79 = 0;
    v12 = 0;
    v13 = 0;
    v14 = sel_handleDeselectAllBarButtonItem_;
    goto LABEL_35;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierCancel")))
  {
    PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
    v87 = 0;
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0;
    v79 = 0;
    v12 = 0;
    v13 = 0;
    v14 = sel_handleCancelBarButtonItem_;
    goto LABEL_35;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierPlaceholder")))
  {
    v14 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v13 = 0;
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierShare")))
  {
    if (objc_msgSend(v10, "wantsShareGridButtonVisible")
      && (objc_msgSend(v10, "isInSelectMode") & 1) == 0)
    {
      v13 = CFSTR("PXPhotosGridActionShare");
    }
    else
    {
      v13 = CFSTR("PXAssetActionTypeShare");
    }
    v17 = v13;
    v87 = 0;
    v88 = 0;
    v14 = 0;
    v12 = 0;
    v18 = 2;
    goto LABEL_34;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierAddTo")))
  {
    v13 = CFSTR("PXAssetActionTypeAddToAlbum");
LABEL_26:
    v16 = v13;
    v88 = 0;
    v79 = 0;
LABEL_27:
    v87 = 0;
    v14 = 0;
LABEL_29:
    v12 = 0;
    v78 = 0;
    goto LABEL_35;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierAdd")))
  {
    v87 = 0;
    v88 = 0;
    v78 = 0;
    v79 = 0;
    v12 = 0;
    v13 = 0;
    v14 = sel_handleAddButtonItem_;
    goto LABEL_35;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierTrash")))
  {
    v13 = CFSTR("PXAssetActionTypeUnifiedDestructive");
    v42 = CFSTR("PXAssetActionTypeUnifiedDestructive");
    v87 = 0;
    v88 = 0;
    v14 = 0;
    v12 = 0;
    v18 = 3;
LABEL_34:
    v78 = 0;
    v79 = v18;
    goto LABEL_35;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierFilterIndicatorButton")))
  {
    objc_msgSend(v10, "contentFilterState");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "isFiltering");
    v45 = 4;
    if (v44)
      v45 = 5;
    v79 = v45;

    v13 = CFSTR("PXPhotosGridActionShowFilters");
    v46 = CFSTR("PXPhotosGridActionShowFilters");
    v88 = 0;
    goto LABEL_27;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierRecover")))
  {
    v13 = CFSTR("PXAssetActionTypeRecover");
    goto LABEL_26;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierRestore")))
  {
    v13 = CFSTR("PXAssetActionTypeRestore");
    goto LABEL_26;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierDelete")))
  {
    v13 = CFSTR("PXAssetActionTypeDelete");
    goto LABEL_26;
  }
  v47 = v10;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierSlideshow")))
  {
    v13 = CFSTR("PXAssetActionTypeSlideshow");
    v48 = CFSTR("PXAssetActionTypeSlideshow");
    v87 = 0;
    v88 = 0;
    v78 = 0;
    v79 = 0;
    v14 = 0;
    v12 = 0;
LABEL_101:
    v10 = v47;
LABEL_35:
    objc_msgSend(v10, "assetActionManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gridActionManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetCollectionActionManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PXPhotosBarsController_createBarButtonItemForIdentifier_placement___block_invoke_2;
    aBlock[3] = &unk_1E5143680;
    v22 = v14;
    v98 = v14;
    v23 = v7;
    v99 = a4;
    v91 = v23;
    v92 = val;
    v82 = v12;
    v97 = v82;
    v24 = v13;
    v93 = v24;
    v81 = v19;
    v94 = v81;
    v25 = v20;
    v95 = v25;
    v26 = v21;
    v96 = v26;
    v27 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (v83)
    {
      v77 = v7;
      -[PXPhotosBarsController barButtonItemsController](val, "barButtonItemsController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v28;
      if (v79 || v87 || v88)
      {
        if (v24)
          v35 = sel__handleActionTypeBarButtonItem_;
        else
          v35 = v22;
        if (v88)
        {
          v13 = v24;
          objc_msgSend(v28, "createBarButtonItemWithTitle:target:action:menuAction:", v88, val, v35, v78);
          v14 = (char *)objc_claimAutoreleasedReturnValue();
          goto LABEL_61;
        }
        if (v79)
        {
          objc_msgSend(v28, "createBarButtonItemWithSystemItem:target:action:menuAction:");
          v14 = (char *)objc_claimAutoreleasedReturnValue();
          v88 = 0;
          v13 = v24;
          goto LABEL_61;
        }
        v13 = v24;
        if (v87)
        {
          objc_msgSend(v28, "createBarButtonItemWithSystemIconName:target:action:menuAction:", v87, val, v35, v78);
          v14 = (char *)objc_claimAutoreleasedReturnValue();
          v88 = 0;
          goto LABEL_61;
        }
      }
      else
      {
        v80 = v10;
        v27[2](v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "title");
        v30 = objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          v13 = v24;
          if (v24)
            v31 = sel__handleActionTypeBarButtonItem_;
          else
            v31 = v22;
          v88 = (void *)v30;
          objc_msgSend(v84, "createBarButtonItemWithTitle:target:action:menuAction:", v30, val, v31, v78);
          v14 = (char *)objc_claimAutoreleasedReturnValue();
          v10 = v80;
LABEL_61:
          v32 = v25;
          v33 = v26;
          v34 = v81;
          v15 = v82;
          if (!v13)
            goto LABEL_67;
          goto LABEL_62;
        }
        PXAssertGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v105 = v23;
          _os_log_error_impl(&dword_1A6789000, v36, OS_LOG_TYPE_ERROR, "no default bar button item title for %@", buf, 0xCu);
        }

        v10 = v80;
        v13 = v24;
      }
      v15 = v82;
      v32 = v25;
      if (v13)
      {
        v14 = 0;
        v88 = 0;
        v33 = v26;
        v34 = v81;
LABEL_62:
        if ((objc_msgSend(v34, "canPerformActionType:", v13) & 1) != 0
          || (objc_msgSend(v32, "canPerformActionType:", v13) & 1) != 0)
        {
          v37 = v10;
          v38 = 1;
        }
        else
        {
          v37 = v10;
          v38 = objc_msgSend(v33, "canPerformActionType:", v13);
        }
        objc_msgSend(v14, "setEnabled:", v38);
        -[PXPhotosBarsController actionTypeByBarButtonItem](val, "actionTypeByBarButtonItem");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKey:", v13, v14);

        v10 = v37;
LABEL_67:

        v7 = v77;
        if (v14)
        {
LABEL_69:

          goto LABEL_70;
        }
LABEL_68:
        v27[2](v27);
        v14 = (char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_69;
      }

      v88 = 0;
      v7 = v77;
    }
    else
    {
      v13 = v24;
      v15 = v82;
      v32 = v25;
    }
    v33 = v26;
    v34 = v81;
    goto LABEL_68;
  }
  v49 = v7;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierActionMenu")))
  {
    +[PXSharingSettings sharedInstance](PXSharingSettings, "sharedInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "enableNewActionContextMenu");

    if (v51)
    {
      if (v11)
      {
        v87 = 0;
        v88 = 0;
        v14 = 0;
        v12 = 0;
        v13 = 0;
        v78 = sel_handleActionMenuBarButtonItem_;
        v79 = 1;
        v83 = 1;
        goto LABEL_101;
      }
      objc_initWeak((id *)buf, val);
      v102[0] = MEMORY[0x1E0C809B0];
      v102[1] = 3221225472;
      v102[2] = __69__PXPhotosBarsController_createBarButtonItemForIdentifier_placement___block_invoke;
      v102[3] = &unk_1E5143588;
      objc_copyWeak(&v103, (id *)buf);
      v12 = _Block_copy(v102);
      objc_destroyWeak(&v103);
      objc_destroyWeak((id *)buf);
      v87 = 0;
      v88 = 0;
      v14 = 0;
      v78 = 0;
      v13 = 0;
      v83 = 0;
    }
    else
    {
      v87 = 0;
      v88 = 0;
      v12 = 0;
      v78 = 0;
      v13 = 0;
      v14 = sel_handleActionMenuBarButtonItem_;
    }
    v79 = 1;
    goto LABEL_101;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierToggleAspectFit")))
  {
    -[PXPhotosBarsController viewModel](val, "viewModel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "aspectFitContent"))
      v53 = CFSTR("PXLibraryAllPhotosToggleSquares");
    else
      v53 = CFSTR("PXLibraryAllPhotosToggleFullFrames");
    PXLocalizedStringFromTable(v53, CFSTR("PhotosUICore"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = CFSTR("PXPhotosGridActionToggleAspectFit");
    v54 = CFSTR("PXPhotosGridActionToggleAspectFit");
    goto LABEL_94;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierSelectModeCaption")))
  {
    -[PXPhotosBarsController selectModeCaptionLabel](val, "selectModeCaptionLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosBarsController _updateSelectModeCaption](val, "_updateSelectModeCaption");
    v14 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v55);

LABEL_117:
    v13 = 0;
LABEL_118:
    v7 = v49;
    v10 = v47;
    v11 = v83;
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierSelectModeMenu")))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ellipsis.circle"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosBarsController delegate](val, "delegate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "barsControllerActionsForSelectionContextMenu:", val);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v47, "wantsSelectModeCaptionInContextMenu"))
    {
      -[PXPhotosBarsController selectModeCaptionText](val, "selectModeCaptionText");
      v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v58 = &stru_1E5149688;
    }
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", v58, v89);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:menu:", v56, v60);
    objc_msgSend(v47, "currentDataSource");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "containerCollection");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v62, "px_isRecentlyDeletedSmartAlbum") & 1) != 0
      || (objc_msgSend(v62, "px_isRecoveredSmartAlbum") & 1) != 0)
    {
      v63 = 1;
    }
    else
    {
      objc_msgSend(v47, "selectionSnapshot");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v65, "isAnyItemSelected");

    }
    objc_msgSend(v14, "setEnabled:", v63);

    goto LABEL_117;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierCustomOptionsButton")))
  {
    objc_msgSend(v47, "optionsController");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v59)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", a2, val, CFSTR("PXPhotosBarsController.m"), 480, CFSTR("The options bar item should never be requested without an options controller"));

    }
    objc_msgSend(v59, "actionPerformerType");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "systemIconImageName");
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    v88 = 0;
    v79 = 0;
    goto LABEL_95;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierDismiss")))
  {
    v88 = 0;
    v78 = 0;
    v79 = 0;
    v12 = 0;
    v13 = 0;
    v14 = sel_handleDismissButton_;
    v64 = CFSTR("xmark");
    goto LABEL_125;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierAddToLibrary")))
  {
    v13 = CFSTR("PXAssetActionTypeAddToLibrary");
LABEL_124:
    v67 = v13;
    v88 = 0;
    v78 = 0;
    v79 = 0;
    v14 = 0;
    v12 = 0;
    v64 = CFSTR("square.and.arrow.down");
    goto LABEL_125;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierContentSyndicationSaveAll")))
  {
    v13 = CFSTR("PXAssetCollectionActionTypeContentSyndicationSaveToLibrary");
    goto LABEL_124;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierInterButtonSpacing")))
  {
    v101.receiver = val;
    v101.super_class = (Class)PXPhotosBarsController;
    -[PXBarsController createBarButtonItemForIdentifier:placement:](&v101, sel_createBarButtonItemForIdentifier_placement_, v7, a4);
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierButtonEndSpacing")))
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierFileRadar")))
      {
        v13 = CFSTR("PXAssetActionTypeFileRadar");
      }
      else
      {
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierInfo")))
        {
          v88 = 0;
          v78 = 0;
          v79 = 0;
          v12 = 0;
          v13 = 0;
          v14 = sel_handleInfoButton_;
          v64 = CFSTR("info.circle");
          goto LABEL_125;
        }
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierReply")))
        {
          v13 = CFSTR("PXAssetActionTypeReply");
          v69 = CFSTR("PXAssetActionTypeReply");
          v88 = 0;
          v78 = 0;
          v79 = 0;
          v14 = 0;
          v12 = 0;
          v64 = CFSTR("arrowshape.turn.up.left");
          goto LABEL_125;
        }
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierTapback")))
        {
          v13 = CFSTR("PXAssetActionTypeTapback");
          v70 = CFSTR("PXAssetActionTypeTapback");
          v88 = 0;
          v78 = 0;
          v79 = 0;
          v14 = 0;
          v12 = 0;
          v64 = CFSTR("plus.bubble.tapback");
          goto LABEL_125;
        }
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierMergeDuplicates")))
        {
          objc_msgSend(v47, "assetActionManager");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = CFSTR("PXAssetActionTypeMergeDuplicates");
          objc_msgSend(v71, "barButtonItemForActionType:", CFSTR("PXAssetActionTypeMergeDuplicates"));
          v14 = (char *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v71, "canPerformActionType:", CFSTR("PXAssetActionTypeMergeDuplicates")))
            v73 = objc_msgSend(v71, "shouldEnableActionType:onAsset:", CFSTR("PXAssetActionTypeMergeDuplicates"), 0);
          else
            v73 = 0;
          objc_msgSend(v14, "setEnabled:", v73);
          objc_msgSend(v14, "setTarget:", val);
          objc_msgSend(v14, "setAction:", sel_handleMergeDuplicatesButton_);

          v13 = CFSTR("PXAssetActionTypeMergeDuplicates");
          goto LABEL_118;
        }
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierMoveToLibrary")))
        {
          v13 = CFSTR("PXAssetActionTypeMoveToLibrary");
        }
        else if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierMoveToPersonalLibrary")))
        {
          v13 = CFSTR("PXAssetActionTypeMoveToPersonalLibrary");
        }
        else
        {
          if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierMoveToSharedLibrary")))
          {
            if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierExplicitBack")))
            {
              v75 = objc_msgSend(v85, "userInterfaceIdiom");
              v76 = objc_alloc(MEMORY[0x1E0DC34F0]);
              if (v75 == 5)
              {
                v14 = (char *)objc_msgSend(v76, "initWithBarButtonSystemItem:target:action:", 101, val, sel_handleExplicitBackButton_);
              }
              else
              {
                v14 = (char *)objc_msgSend(v76, "initWithTitle:style:target:action:", CFSTR(" "), 0, val, sel_handleExplicitBackButton_);
                objc_msgSend(v14, "_setShowsBackButtonIndicator:", 1);
              }
              goto LABEL_117;
            }
            if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierSearch")))
            {
              v88 = 0;
              v78 = 0;
              v79 = 0;
              v12 = 0;
              v13 = 0;
              v14 = sel_handleSearchButton_;
              v64 = CFSTR("magnifyingglass");
            }
            else
            {
              if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PXBarItemIdentifierToggleSidebar")))
              {
                v87 = 0;
                v88 = 0;
                v78 = 0;
                v79 = 0;
                v14 = 0;
                v12 = 0;
                v13 = 0;
                goto LABEL_101;
              }
              v88 = 0;
              v78 = 0;
              v79 = 0;
              v12 = 0;
              v13 = 0;
              v83 = 0;
              v14 = sel_handleToggleSidebar_;
              v64 = CFSTR("sidebar.leading");
            }
LABEL_125:
            v87 = (void *)v64;
            goto LABEL_101;
          }
          v13 = CFSTR("PXAssetActionTypeMoveToSharedLibrary");
        }
      }
      v68 = v13;
      v88 = 0;
LABEL_94:
      v79 = 0;
      v87 = 0;
LABEL_95:
      v14 = 0;
      v12 = 0;
      v78 = 0;
      goto LABEL_101;
    }
    v100.receiver = val;
    v100.super_class = (Class)PXPhotosBarsController;
    -[PXBarsController createBarButtonItemForIdentifier:placement:](&v100, sel_createBarButtonItemForIdentifier_placement_, v7, a4);
  }
  v14 = (char *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v13 = 0;
  v10 = v47;
LABEL_18:
  if (!v14)
  {
    v83 = v11;
    v87 = 0;
    v88 = 0;
    v79 = 0;
    goto LABEL_29;
  }
  v87 = 0;
  v88 = 0;
  v15 = 0;
LABEL_70:
  v40 = v14;

  return v40;
}

- (id)_identifierForActionType:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  int v8;
  void *v9;
  void *v10;
  int v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeShare")))
  {
    v5 = CFSTR("PXBarItemIdentifierShare");
LABEL_9:
    v6 = v5;
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeHide")))
  {
    v5 = CFSTR("PXBarItemIdentifierSelectModeMenu");
    goto LABEL_9;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeTrash")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeRemove")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeUnifiedDestructive")))
  {
    v5 = CFSTR("PXBarItemIdentifierTrash");
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeDelete")))
  {
    v5 = CFSTR("PXBarItemIdentifierDelete");
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeRestore")))
  {
    v5 = CFSTR("PXBarItemIdentifierRestore");
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeRecover")))
  {
    v5 = CFSTR("PXBarItemIdentifierRecover");
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeSetSortOrder")))
  {
    v5 = CFSTR("PXBarItemIdentifierActionMenu");
    goto LABEL_9;
  }
  v8 = objc_msgSend(v4, "isEqualToString:", CFSTR("PXPhotosGridActionShowFilters"));
  -[PXPhotosBarsController viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    objc_msgSend(v9, "optionsController");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[PXPhotosBarsController viewModel](self, "viewModel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "optionsController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "actionPerformerType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v4, "isEqualToString:", v17);

      if (v18)
      {
        v5 = CFSTR("PXBarItemIdentifierCustomOptionsButton");
        goto LABEL_9;
      }
    }
    else
    {

    }
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("PXAssetActionTypeMergeDuplicates")))
    {
      v5 = 0;
      goto LABEL_10;
    }
    v5 = CFSTR("PXBarItemIdentifierMergeDuplicates");
    goto LABEL_9;
  }
  v11 = objc_msgSend(v9, "wantsContentFilterIndicatorVisible");
  v12 = CFSTR("PXBarItemIdentifierActionMenu");
  if (v11)
    v12 = CFSTR("PXBarItemIdentifierFilterIndicatorButton");
  v5 = v12;

LABEL_10:
  return v5;
}

- (void)handleMergeDuplicatesButton:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PXPhotosBarsController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetActionManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "executeActionForActionType:sender:completionHandler:", CFSTR("PXAssetActionTypeMergeDuplicates"), v4, 0);
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.deduplicationFromAlbumSelection"), MEMORY[0x1E0C9AA70]);

}

- (void)handleSelectBarButtonItem:(id)a3
{
  id v3;

  -[PXPhotosBarsController viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_272545);

}

- (void)handleSelectAllBarButtonItem:(id)a3
{
  void *v3;
  id v4;

  -[PXPhotosBarsController viewModel](self, "viewModel", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_226_272544);

}

- (void)handleDeselectAllBarButtonItem:(id)a3
{
  void *v3;
  id v4;

  -[PXPhotosBarsController viewModel](self, "viewModel", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_227_272543);

}

- (void)handleCancelBarButtonItem:(id)a3
{
  id v3;

  -[PXPhotosBarsController viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_228_272541);

}

- (id)createActionMenuController
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _BOOL4 v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PXPhotosGridActionMenuController *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v31;
  const __CFString *v32;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  -[PXPhotosBarsController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetCollectionActionManager");
  v3 = objc_claimAutoreleasedReturnValue();
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  if (objc_msgSend(v2, "wantsContentFilterVisible")
    && ((objc_msgSend(v4, "enableContentFiltering") ^ 1 | v6) & 1) == 0)
  {
    objc_msgSend(v5, "addObject:", CFSTR("PXPhotosGridActionShowFiltersMenu"));
  }
  if (objc_msgSend(v2, "supportsPeopleActions"))
  {
    v33[0] = CFSTR("PXPhotosGridActionToggleFaceMode");
    v33[1] = CFSTR("PXAssetCollectionActionTypeFavoritePerson");
    v33[2] = CFSTR("PXAssetCollectionActionTypeAddPersonToHome");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    if (_os_feature_enabled_impl())
      v8 = CFSTR("PXAssetCollectionActionTypeCustomizePeopleAlbum");
    else
      v8 = CFSTR("PXAssetCollectionActionTypeImprovePeopleRecognition");
    objc_msgSend(v5, "addObject:", v8);
  }
  if (objc_msgSend(v2, "supportsSocialGroupActions"))
  {
    v32 = CFSTR("PXAssetCollectionActionTypeCustomizeSocialGroupAlbum");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v9);

  }
  if (objc_msgSend(v2, "allowsShowDetails") && objc_msgSend(v4, "enableDetailsMenuAction"))
    objc_msgSend(v5, "addObject:", CFSTR("PXAssetCollectionActionTypeShowDetails"));
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "enableCollectionsSortButton");

  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v4, "enableSortAction") && (v11 & 1) == 0)
    objc_msgSend(v5, "addObject:", CFSTR("PXAssetCollectionActionTypeSetSortOrder"));
  objc_msgSend(v2, "optionsController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v2, "optionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionPerformerType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

  }
  if (objc_msgSend(v2, "allowsSlideshowAction"))
  {
    objc_msgSend(v5, "addObject:", CFSTR("PXAssetActionTypeSlideshow"));
    objc_msgSend(v5, "addObject:", CFSTR("PXAssetActionTypePlayMovie"));
  }
  if (objc_msgSend(v2, "allowsShowMapAction"))
    objc_msgSend(v5, "addObject:", CFSTR("PXAssetCollectionActionTypeShowMap"));
  if (!v6)
    objc_msgSend(v5, "addObject:", CFSTR("PXAssetCollectionActionTypeStoryDemo"));
  objc_msgSend(v5, "addObject:", CFSTR("PXAssetCollectionActionTypeMediaViewDemo"));
  if (objc_msgSend(v2, "allowsFileRadarAction"))
    objc_msgSend(v5, "addObject:", CFSTR("PXAssetActionTypeFileRadar"));
  if (objc_msgSend(v2, "allowsCMMActions"))
  {
    objc_msgSend(v5, "addObject:", CFSTR("PXAssetCollectionActionTypeCopyLink"));
    objc_msgSend(v5, "addObject:", CFSTR("PXAssetCollectionActionTypeTrashMomentShare"));
  }
  v31 = v4;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v3, 0);
  objc_msgSend(v2, "gridActionManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v15, "addObject:", v16);
  v17 = (void *)v3;
  objc_msgSend(v2, "assetActionManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v15, "addObject:", v18);
  v19 = -[PXPhotosGridActionMenuController initWithActionManagers:viewModel:]([PXPhotosGridActionMenuController alloc], "initWithActionManagers:viewModel:", v15, v2);
  +[PXSharingSettings sharedInstance](PXSharingSettings, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "enableNewActionContextMenu");

  if (v21)
  {
    if (objc_msgSend(v2, "allowsShareAllAction")
      && (objc_msgSend(v2, "wantsShareGridButtonVisible") & 1) == 0)
    {
      objc_msgSend(v5, "addObject:", CFSTR("PXPhotosGridActionShare"));
    }
    -[PXBarsController viewController](self, "viewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "px_sharePresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarsController.m"), 763, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharePresentation"));

    }
    objc_msgSend(v23, "defaultActivityTypeOrder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarsController.m"), 765, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("defaultActivityTypeOrder"));

    }
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v24);
    -[PXActionMenuController setDefaultActivityTypeOrder:](v19, "setDefaultActivityTypeOrder:", v25);

  }
  -[PXPhotosGridActionMenuController setAdditionalActionTypes:](v19, "setAdditionalActionTypes:", v5);

  return v19;
}

- (void)handleActionMenuBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  PXActivitySharingContext *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_class *v50;
  objc_class *v51;
  void *v52;
  objc_class *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPhotosBarsController createActionMenuController](self, "createActionMenuController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosBarsController setMenuController:](self, "setMenuController:", v5);

  -[PXPhotosBarsController menuController](self, "menuController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosBarsController viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "customExcludedActionTypesProvider");
  v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v8[2]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExcludedActionTypes:", v9);

  +[PXSharingSettings sharedInstance](PXSharingSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "enableNewActionContextMenu");

  if (!(_DWORD)v9)
  {
    objc_msgSend(v7, "currentDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containerCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "canContainAssets");

    if ((v25 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarsController.m"), 802, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource.containerCollection.canContainAssets"));

    }
    objc_msgSend(v13, "containerCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startDate");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endDate");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (!v23
      || !v26
      || (-[PXPhotosBarsController dateRangeFormatter](self, "dateRangeFormatter"),
          v28 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v28, "stringFromDate:toDate:", v23, v27),
          v29 = objc_claimAutoreleasedReturnValue(),
          v28,
          !v29))
    {
      -[PXPhotosBarsController contentController](self, "contentController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "countsController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
        objc_msgSend(v31, "counts");

      v29 = 0;
    }
    v60 = v27;
    v33 = -[PXActivitySharingContext initWithAssetCollection:assetsDataSource:]([PXActivitySharingContext alloc], "initWithAssetCollection:assetsDataSource:", v14, v13);
    v65 = v6;
    objc_msgSend(v6, "activityActions");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActivitySharingContext setActivities:](v33, "setActivities:", v34);

    -[PXActivitySharingContext setWantsActionSheet:](v33, "setWantsActionSheet:", 1);
    objc_msgSend(v14, "localizedTitle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActivitySharingContext setTitle:](v33, "setTitle:", v35);

    v59 = (void *)v29;
    -[PXActivitySharingContext setSubtitle:](v33, "setSubtitle:", v29);
    -[PXActivitySharingContext setExcludeShareActivity:](v33, "setExcludeShareActivity:", objc_msgSend(v7, "allowsShareAllAction") ^ 1);
    objc_msgSend(v13, "keyAsset");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActivitySharingContext setKeyAsset:](v33, "setKeyAsset:", v36);

    -[PXActivitySharingContext setSourceOrigin:](v33, "setSourceOrigin:", 3);
    -[PXBarsController viewController](self, "viewController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "px_sharePresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarsController.m"), 829, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharePresentation"));

    }
    v62 = v7;
    objc_msgSend(v38, "createActivitySharingControllerWithContext:", v33);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarsController.m"), 831, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activitySharingController"));

    }
    v40 = v4;
    objc_msgSend(v39, "activityViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_28:
        -[PXBarsController viewController](self, "viewController");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "presentViewController:animated:completion:", v41, 1, 0);

        v4 = v40;
        v6 = v65;
        v7 = v62;
        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "px_descriptionForAssertionMessage");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)v54;
      v55 = v54;
      v49 = v57;
      objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarsController.m"), 832, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("activitySharingController.activityViewController"), v55, v56);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarsController.m"), 832, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("activitySharingController.activityViewController"), v58);
    }

    goto LABEL_28;
  }
  v11 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(v6, "actions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "menuWithChildren:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosBarsController presentationEnvironment](self, "presentationEnvironment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v61 = v4;
    v64 = v6;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v15 = v7;
    objc_msgSend(v7, "internalMenuProducers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v67;
      do
      {
        v20 = 0;
        v21 = v13;
        do
        {
          if (*(_QWORD *)v67 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * v20), "makeInternalMenuWithPresentationEnvironment:", v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "mergingWithPhotosInternalMenu:", v22);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          ++v20;
          v21 = v13;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      }
      while (v18);
    }

    v6 = v64;
    v7 = v15;
    v4 = v61;
  }
  v23 = v4;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarsController.m"), 797, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("sender"), v45);
LABEL_33:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (objc_class *)objc_opt_class();
    NSStringFromClass(v51);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "px_descriptionForAssertionMessage");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarsController.m"), 797, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("sender"), v45, v52);

    goto LABEL_33;
  }
LABEL_13:
  objc_msgSend(v23, "setMenu:", v13);
LABEL_29:

}

- (void)handleDismissButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPhotosBarsController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photosBarsController:didRequestDismissWithSender:", self, v4);

}

- (void)handleExplicitBackButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPhotosBarsController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photosBarsController:didRequestDismissWithSender:", self, v4);

}

- (void)handleAddButtonItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[PXPhotosBarsController viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetCollectionActionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionPerformerForActionType:", CFSTR("PXAssetCollectionActionTypeAddFrom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PXPhotosBarsController_handleAddButtonItem___block_invoke;
  v7[3] = &unk_1E5148B78;
  v7[4] = self;
  objc_msgSend(v6, "performActionWithCompletionHandler:", v7);

}

- (void)handleInfoButton:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  -[PXPhotosBarsController viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoActionHandler");
  v6 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXBarsController viewController](self, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v5);

  }
}

- (void)handleSearchButton:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPhotosBarsController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photosBarsController:didRequestSearchWithSender:", self, v4);

}

- (void)handleToggleSidebar:(id)a3
{
  void *v3;
  id v4;

  -[PXBarsController viewController](self, "viewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_splitViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toggleSidebarVisibilityAnimated");

}

- (void)_handleActionTypeBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPhotosBarsController actionTypeByBarButtonItem](self, "actionTypeByBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXPhotosBarsController viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetActionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "actionPerformerForActionType:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_5;
    -[PXPhotosBarsController viewModel](self, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gridActionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "actionPerformerForActionType:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_5;
    -[PXPhotosBarsController viewModel](self, "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assetCollectionActionManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "actionPerformerForActionType:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
LABEL_5:
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __57__PXPhotosBarsController__handleActionTypeBarButtonItem___block_invoke;
      v14[3] = &unk_1E5148B78;
      v15 = v6;
      -[NSObject performActionWithCompletionHandler:](v9, "performActionWithCompletionHandler:", v14);

    }
    else
    {
      PLGridZeroGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v6;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Missing action performer for bar button action type %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_fault_impl(&dword_1A6789000, v9, OS_LOG_TYPE_FAULT, "no action type registered for bar button item %@", buf, 0xCu);
    }
  }

}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = a3;
  v10 = v6;
  if (a4 == 10)
  {
    -[PXPhotosBarsController setActiveActionPerformer:](self, "setActiveActionPerformer:", v6);
    -[PXPhotosBarsController setLastActionPerformer:](self, "setLastActionPerformer:", v10);
  }
  else
  {
    -[PXPhotosBarsController activeActionPerformer](self, "activeActionPerformer");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v10)
      -[PXPhotosBarsController setActiveActionPerformer:](self, "setActiveActionPerformer:", 0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v10, "shouldExitSelectModeForState:", a4))
    {
      -[PXPhotosBarsController lastActionPerformer](self, "lastActionPerformer");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8 == v10)
      {
        -[PXPhotosBarsController viewModel](self, "viewModel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "performChanges:", &__block_literal_global_265_272509);

      }
    }
  }

}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v15;

  v9 = a3;
  v10 = a4;
  switch(a5)
  {
    case 1:
      -[PXBarsController viewController](self, "viewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "navigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v13 != 0;
      if (v13)
        objc_msgSend(v13, "pushViewController:animated:", v10, 1);

      break;
    case 2:
      v11 = -[PXPhotosBarsController _actionPerformer:presentViewController:](self, "_actionPerformer:presentViewController:", v9, v10);
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarsController.m"), 941, CFSTR("Code which should be unreachable has been reached"));

      abort();
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (BOOL)_actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  id v20;
  char v21;
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
  objc_class *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  PXPhotosBarsController *v43;
  uint64_t *v44;
  SEL v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v8)
  {
    v21 = 0;
    goto LABEL_31;
  }
  v10 = v8;
  objc_msgSend(v10, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "enableFilterViewControllerAnchoringToSender");

    if (!v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "selectionSnapshot");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0;
        v47 = &v46;
        v48 = 0x3032000000;
        v49 = __Block_byref_object_copy__272498;
        v50 = __Block_byref_object_dispose__272499;
        v51 = 0;
        objc_msgSend(v22, "selectedIndexPaths");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __65__PXPhotosBarsController__actionPerformer_presentViewController___block_invoke;
        v41[3] = &unk_1E51437D0;
        v44 = &v46;
        v14 = v22;
        v45 = a2;
        v42 = v14;
        v43 = self;
        objc_msgSend(v23, "enumerateItemIndexPathsUsingBlock:", v41);

        if (v47[5])
        {
          -[PXPhotosBarsController contentController](self, "contentController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "regionOfInterestForAssetReference:", v47[5]);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            -[PXBarsController viewController](self, "viewController");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "view");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "setSourceView:", v27);
            objc_msgSend(v25, "rectInCoordinateSpace:", v27);
            objc_msgSend(v11, "setSourceRect:");

          }
        }

        _Block_object_dispose(&v46, 8);
      }
      else
      {
        -[PXBarsController viewController](self, "viewController");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSourceView:", v28);

      }
      goto LABEL_27;
    }
    objc_msgSend(v7, "actionType");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[PXPhotosBarsController _identifierForActionType:](self, "_identifierForActionType:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = CFSTR("PXBarItemIdentifierShare");
    if (v15)
      v17 = (__CFString *)v15;
    v18 = v17;

    objc_msgSend(v7, "sender");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      -[PXBarsController cachedBarButtonItemForIdentifier:](self, "cachedBarButtonItemForIdentifier:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        -[PXBarsController viewController](self, "viewController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "view");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSourceView:", v20);
        goto LABEL_26;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v19;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "px_descriptionForAssertionMessage");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarsController.m"), 958, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("sender"), v37, v34);

      }
      objc_msgSend(v11, "setSourceView:", v20);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[PXBarsController viewController](self, "viewController");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSourceView:", v29);

        goto LABEL_26;
      }
      v20 = v19;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "px_descriptionForAssertionMessage");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarsController.m"), 961, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("sender"), v38, v36);

      }
      objc_msgSend(v11, "setBarButtonItem:", v20);
    }
    v19 = v20;
LABEL_26:

LABEL_27:
  }
  -[PXPhotosBarsController presentationEnvironment](self, "presentationEnvironment");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 1;
  objc_msgSend(v30, "presentViewController:animated:completionHandler:", v10, 1, 0);

  objc_msgSend(v10, "presentingViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
    v21 = objc_msgSend(v10, "px_isDelayingPresentation");

LABEL_31:
  return v21;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a5;
  -[PXPhotosBarsController presentationEnvironment](self, "presentationEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  objc_msgSend(v9, "dismissViewController:animated:completionHandler:", v10, 1, v8);

  return v9 != 0;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  void *v3;
  void *v4;

  -[PXPhotosBarsController contentController](self, "contentController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(a3, "actionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosBarsController _identifierForActionType:](self, "_identifierForActionType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBarsController cachedBarButtonItemForIdentifier:](self, "cachedBarButtonItemForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosBarsController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationEnvironmentForPhotosBarsController:withSourceItem:", self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[PXBarsController viewController](self, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PXPresentationEnvironmentForSender(v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (PXMemoryAssetsActionFactory)memoryAssetsActionFactory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PXPhotosBarsController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXPhotosBarsController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "memoryAssetsActionFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (PXMemoryAssetsActionFactory *)v7;
}

- (void)photosGridActionPerformer:(id)a3 contentFilterStateChanged:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[PXPhotosBarsController viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PXPhotosBarsController_photosGridActionPerformer_contentFilterStateChanged___block_invoke;
  v8[3] = &unk_1E51437F8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performChanges:", v8);

}

- (int64_t)abilityToPlayMovieForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[PXBarsController viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "abilityToPlayMovieForAssetCollection:", v4);

  if (!v6)
  {
    objc_opt_class();
    v6 = objc_opt_isKindOfClass() & 1;
  }

  return v6;
}

- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PXBarsController viewController](self, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "tryToPresentMovieForAssetCollection:", v5) & 1) != 0)
    goto LABEL_2;
  v13 = v5;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v13;

    if (v14)
    {
      -[PXPhotosBarsController moviePresenter](self, "moviePresenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "presentingViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6 == v17)
        {

          goto LABEL_18;
        }

        if (!v6)
          goto LABEL_18;
      }
      else if (!v6)
      {
        v16 = 0;
        goto LABEL_18;
      }
      +[PXMoviePresenter moviePresenterWithPresentingViewController:](PXMoviePresenter, "moviePresenterWithPresentingViewController:", v6);
      v18 = objc_claimAutoreleasedReturnValue();

      -[PXPhotosBarsController setMoviePresenter:](self, "setMoviePresenter:", v18);
      v16 = (void *)v18;
LABEL_18:
      objc_msgSend(v16, "presentMovieViewControllerForAssetCollection:keyAssetFetchResult:preferredTransitionType:", v14, 0, 1);

LABEL_2:
      v7 = (void *)MEMORY[0x1E0D09910];
      v8 = *MEMORY[0x1E0D09818];
      v21[0] = v5;
      v9 = *MEMORY[0x1E0D09830];
      v19 = v8;
      v20 = v9;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v21[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v19, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.assetCollectionMoviePlayed"), v12, v19, v20, v21[0]);

      goto LABEL_13;
    }
  }
  else
  {

  }
  PLGridZeroGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v13;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Can't play movie for unexpected asset collection: %@", buf, 0xCu);
  }
LABEL_13:

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  const __CFString **v11;
  id v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  const __CFString *v29;
  _QWORD v30[2];
  _QWORD v31[28];
  _QWORD v32[20];

  v32[19] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if ((void *)PXPhotosBarsControllerViewModelObserverContext == a5)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = (a4 & 0x100000200026) != 0;
    if ((a4 & 0x100000200026) != 0)
    {
      v32[0] = CFSTR("PXBarItemIdentifierActionMenu");
      v32[1] = CFSTR("PXBarItemIdentifierSelect");
      v32[2] = CFSTR("PXBarItemIdentifierSelectModeCaption");
      v32[3] = CFSTR("PXBarItemIdentifierAdd");
      v32[4] = CFSTR("PXBarItemIdentifierShare");
      v32[5] = CFSTR("PXBarItemIdentifierTrash");
      v32[6] = CFSTR("PXBarItemIdentifierDelete");
      v32[7] = CFSTR("PXBarItemIdentifierRestore");
      v32[8] = CFSTR("PXBarItemIdentifierFileRadar");
      v32[9] = CFSTR("PXBarItemIdentifierInfo");
      v32[10] = CFSTR("PXBarItemIdentifierAddToLibrary");
      v32[11] = CFSTR("PXBarItemIdentifierContentSyndicationSaveAll");
      v32[12] = CFSTR("PXBarItemIdentifierMergeDuplicates");
      v32[13] = CFSTR("PXBarItemIdentifierMoveToLibrary");
      v32[14] = CFSTR("PXBarItemIdentifierMoveToPersonalLibrary");
      v32[15] = CFSTR("PXBarItemIdentifierMoveToSharedLibrary");
      v32[16] = CFSTR("PXBarItemIdentifierSelectModeMenu");
      v32[17] = CFSTR("PXBarItemIdentifierCustomOptionsButton");
      v32[18] = CFSTR("PXBarItemIdentifierSearch");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v14);

    }
    if ((a4 & 0x84000) != 0)
    {
      objc_msgSend(v12, "addObject:", CFSTR("PXBarItemIdentifierToggleAspectFit"));
      v13 = 1;
    }
    if ((a4 & 0x2000000) != 0)
    {
      objc_msgSend(v12, "addObject:", CFSTR("PXBarItemIdentifierFilterIndicatorButton"));
    }
    else
    {
      v15 = !v13;
      if ((a4 & 0x2401002020) != 0)
        v15 = 0;
      if (v15)
        goto LABEL_23;
    }
    -[PXBarsController purgeCachedBarButtonItemsForIdentifiers:](self, "purgeCachedBarButtonItemsForIdentifiers:", v12);
    -[PXBarsController invalidateBars](self, "invalidateBars");
LABEL_23:

    goto LABEL_32;
  }
  if ((void *)PXPhotosBarsControllerSpecObserverContext == a5)
  {
    if ((a4 & 1) == 0)
      goto LABEL_32;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferredContentSizeCategory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotosBarsController contentSizeCategory](self, "contentSizeCategory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 != v17)
    {
      -[PXPhotosBarsController setContentSizeCategory:](self, "setContentSizeCategory:", v17);
      v31[0] = CFSTR("PXBarItemIdentifierTrash");
      v31[1] = CFSTR("PXBarItemIdentifierFavorite");
      v31[2] = CFSTR("PXBarItemIdentifierSelect");
      v31[3] = CFSTR("PXBarItemIdentifierSelectAll");
      v31[4] = CFSTR("PXBarItemIdentifierDeselectAll");
      v31[5] = CFSTR("PXBarItemIdentifierShare");
      v31[6] = CFSTR("PXBarItemIdentifierAddTo");
      v31[7] = CFSTR("PXBarItemIdentifierEdit");
      v31[8] = CFSTR("PXBarItemIdentifierDone");
      v31[9] = CFSTR("PXBarItemIdentifierCancel");
      v31[10] = CFSTR("PXBarItemIdentifierPlaceholder");
      v31[11] = CFSTR("PXBarItemIdentifierAdd");
      v31[12] = CFSTR("PXBarItemIdentifierFaceMode");
      v31[13] = CFSTR("PXBarItemIdentifierAssetMode");
      v31[14] = CFSTR("PXBarItemIdentifierShowAll");
      v31[15] = CFSTR("PXBarItemIdentifierSummarize");
      v31[16] = CFSTR("PXBarItemIdentifierActionMenu");
      v31[17] = CFSTR("PXBarItemIdentifierSelectModeCaption");
      v31[18] = CFSTR("PXBarItemIdentifierRecover");
      v31[19] = CFSTR("PXBarItemIdentifierRestore");
      v31[20] = CFSTR("PXBarItemIdentifierDelete");
      v31[21] = CFSTR("PXBarItemIdentifierSlideshow");
      v31[22] = CFSTR("PXBarItemIdentifierToggleAspectFit");
      v31[23] = CFSTR("PXBarItemIdentifierCustomOptionsButton");
      v31[24] = CFSTR("PXBarItemIdentifierFilterIndicatorButton");
      v31[25] = CFSTR("PXBarItemIdentifierInfo");
      v31[26] = CFSTR("PXBarItemIdentifierMergeDuplicates");
      v31[27] = CFSTR("PXBarItemIdentifierSearch");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXBarsController purgeCachedBarButtonItemsForIdentifiers:](self, "purgeCachedBarButtonItemsForIdentifiers:", v19);
      -[PXBarsController invalidateBars](self, "invalidateBars");

    }
    -[PXPhotosBarsController viewModel](self, "viewModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "specManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "spec");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "interButtonSpacing");
    -[PXPhotosBarsController setInterButtonSpacing:](self, "setInterButtonSpacing:");
    objc_msgSend(v22, "endButtonSpacing");
    -[PXPhotosBarsController setEndButtonSpacing:](self, "setEndButtonSpacing:");
    -[PXPhotosBarsController setWantsToggleSidebarButton:](self, "setWantsToggleSidebarButton:", objc_msgSend(v22, "wantsToggleSidebarButton"));

LABEL_28:
    goto LABEL_32;
  }
  if ((void *)PXPhotosBarsControllerAssetTypeCountObserverContext == a5)
  {
    if ((a4 & 1) == 0)
      goto LABEL_32;
    v30[0] = CFSTR("PXBarItemIdentifierSelectModeCaption");
    v30[1] = CFSTR("PXBarItemIdentifierMergeDuplicates");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosBarsController viewModel](self, "viewModel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "wantsSelectModeCaptionInContextMenu");

    if (v24)
    {
      objc_msgSend(v17, "arrayByAddingObject:", CFSTR("PXBarItemIdentifierSelectModeMenu"));
      v25 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v25;
    }
    -[PXBarsController purgeCachedBarButtonItemsForIdentifiers:](self, "purgeCachedBarButtonItemsForIdentifiers:", v17);
    -[PXBarsController invalidateBars](self, "invalidateBars");
    goto LABEL_28;
  }
  if ((void *)PXSharedLibraryStatusProviderObservationContext_272479 == a5)
  {
    if ((a4 & 3) != 0)
    {
      v29 = CFSTR("PXBarItemIdentifierActionMenu");
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = &v29;
      goto LABEL_31;
    }
  }
  else
  {
    if ((void *)PXLibraryFilterStateObservationContext_272480 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosBarsController.m"), 1166, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((a4 & 1) != 0)
    {
      v28 = CFSTR("PXBarItemIdentifierFilterIndicatorButton");
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = &v28;
LABEL_31:
      objc_msgSend(v10, "arrayWithObjects:count:", v11, 1, v28, v29);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXBarsController purgeCachedBarButtonItemsForIdentifiers:](self, "purgeCachedBarButtonItemsForIdentifiers:", v26);

      -[PXBarsController invalidateBars](self, "invalidateBars");
    }
  }
LABEL_32:
  -[PXBarsController updateIfNeeded](self, "updateIfNeeded");

}

- (void)_reloadOptionsButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[PXBarsController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBarsController cachedBarButtonItemForIdentifier:](self, "cachedBarButtonItemForIdentifier:", CFSTR("PXBarItemIdentifierCustomOptionsButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "barButtonItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "barButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = CFSTR("PXBarItemIdentifierCustomOptionsButton");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXBarsController purgeCachedBarButtonItemsForIdentifiers:](self, "purgeCachedBarButtonItemsForIdentifiers:", v10);

    -[PXBarsController invalidateBars](self, "invalidateBars");
    -[PXBarsController updateIfNeeded](self, "updateIfNeeded");
    if (v9 == v6)
    {
      -[PXBarsController cachedBarButtonItemForIdentifier:](self, "cachedBarButtonItemForIdentifier:", CFSTR("PXBarItemIdentifierCustomOptionsButton"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        PXAssertGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v14 = 0;
          _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Expected to have an options bar button item to re-target the popover", v14, 2u);
        }

      }
      objc_msgSend(v5, "setBarButtonItem:", v11);

    }
  }
  else
  {
    v15[0] = CFSTR("PXBarItemIdentifierCustomOptionsButton");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXBarsController purgeCachedBarButtonItemsForIdentifiers:](self, "purgeCachedBarButtonItemsForIdentifiers:", v13);

    -[PXBarsController invalidateBars](self, "invalidateBars");
    -[PXBarsController updateIfNeeded](self, "updateIfNeeded");
  }

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a4;
  NSStringFromSelector(sel_enableNewActionMenu);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", v5) & 1) == 0)
  {
    NSStringFromSelector(sel_enableNewActionContextMenu);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqualToString:", v6))
    {
      NSStringFromSelector(sel_enableContentFiltering);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "isEqualToString:", v7);

      if ((v8 & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }

  }
LABEL_5:
  -[PXPhotosBarsController updateBars](self, "updateBars");
LABEL_6:

}

- (PXBarsControllerDelegate)delegate
{
  return (PXBarsControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSArray)leftBarButtonItemIdentifiers
{
  return self->_leftBarButtonItemIdentifiers;
}

- (void)setLeftBarButtonItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_leftBarButtonItemIdentifiers, a3);
}

- (NSArray)rightBarButtonItemIdentifiers
{
  return self->_rightBarButtonItemIdentifiers;
}

- (void)setRightBarButtonItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_rightBarButtonItemIdentifiers, a3);
}

- (NSArray)toolbarItemIdentifiers
{
  return self->_toolbarItemIdentifiers;
}

- (void)setToolbarItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarItemIdentifiers, a3);
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXPhotosContentController)contentController
{
  return (PXPhotosContentController *)objc_loadWeakRetained((id *)&self->_contentController);
}

- (PXAssetSelectionTypeCounter)assetTypeCounter
{
  return self->_assetTypeCounter;
}

- (PXActionPerformer)activeActionPerformer
{
  return self->_activeActionPerformer;
}

- (void)setActiveActionPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_activeActionPerformer, a3);
}

- (PXActionPerformer)lastActionPerformer
{
  return self->_lastActionPerformer;
}

- (void)setLastActionPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_lastActionPerformer, a3);
}

- (PXPhotosGridActionMenuController)menuController
{
  return self->_menuController;
}

- (void)setMenuController:(id)a3
{
  objc_storeStrong((id *)&self->_menuController, a3);
}

- (PXMoviePresenter)moviePresenter
{
  return self->_moviePresenter;
}

- (void)setMoviePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_moviePresenter, a3);
}

- (NSMapTable)actionTypeByBarButtonItem
{
  return self->_actionTypeByBarButtonItem;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
  objc_storeStrong((id *)&self->_contentSizeCategory, a3);
}

- (double)interButtonSpacing
{
  return self->_interButtonSpacing;
}

- (double)endButtonSpacing
{
  return self->_endButtonSpacing;
}

- (BOOL)wantsToggleSidebarButton
{
  return self->_wantsToggleSidebarButton;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXPhotosBarButtonItemsController)barButtonItemsController
{
  return self->_barButtonItemsController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barButtonItemsController, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_actionTypeByBarButtonItem, 0);
  objc_storeStrong((id *)&self->_moviePresenter, 0);
  objc_storeStrong((id *)&self->_menuController, 0);
  objc_storeStrong((id *)&self->_lastActionPerformer, 0);
  objc_storeStrong((id *)&self->_activeActionPerformer, 0);
  objc_storeStrong((id *)&self->_assetTypeCounter, 0);
  objc_destroyWeak((id *)&self->_contentController);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_dateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_selectModeChevronButton, 0);
  objc_storeStrong((id *)&self->_selectModeCaptionLabel, 0);
  objc_storeStrong((id *)&self->_toolbarItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItemIdentifiers, 0);
  objc_destroyWeak((id *)&self->delegate);
}

uint64_t __78__PXPhotosBarsController_photosGridActionPerformer_contentFilterStateChanged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentFilterState:", *(_QWORD *)(a1 + 32));
}

void __65__PXPhotosBarsController__actionPerformer_presentViewController___block_invoke(uint64_t a1, _OWORD *a2, _BYTE *a3)
{
  uint64_t v3;
  void *v4;
  void *v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  _OWORD v22[2];

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  if (v4)
  {
    *(_QWORD *)(v3 + 40) = 0;

    *a3 = 1;
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a2[1];
  v22[0] = *a2;
  v22[1] = v9;
  objc_msgSend(v8, "objectReferenceAtIndexPath:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", v14, v15, CFSTR("PXPhotosBarsController.m"), 975, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[selectionSnapshot.dataSource objectReferenceAtIndexPath:indexPath]"), v17);
LABEL_9:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 56);
    v19 = *(_QWORD *)(a1 + 40);
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", v18, v19, CFSTR("PXPhotosBarsController.m"), 975, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[selectionSnapshot.dataSource objectReferenceAtIndexPath:indexPath]"), v17, v21);

    goto LABEL_9;
  }
LABEL_5:
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

uint64_t __57__PXPhotosBarsController_actionPerformer_didChangeState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attemptSetInSelectMode:", 0);
}

void __57__PXPhotosBarsController__handleActionTypeBarButtonItem___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLGridZeroGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Action failed for bar button action type %{public}@: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

void __46__PXPhotosBarsController_handleAddButtonItem___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("No");
    if (a2)
      v7 = CFSTR("Yes");
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Add action completed with success: %@, error: %@", (uint8_t *)&v11, 0x16u);
  }

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canExitSelectMode");

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "viewModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performChanges:", &__block_literal_global_262_272516);

    }
  }

}

uint64_t __46__PXPhotosBarsController_handleAddButtonItem___block_invoke_260(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attemptSetInSelectMode:", 0);
}

uint64_t __52__PXPhotosBarsController_handleCancelBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attemptSetInSelectMode:", 0);
}

uint64_t __57__PXPhotosBarsController_handleDeselectAllBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

uint64_t __55__PXPhotosBarsController_handleSelectAllBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectAllItems");
}

uint64_t __52__PXPhotosBarsController_handleSelectBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attemptSetInSelectMode:", 1);
}

id __69__PXPhotosBarsController_createBarButtonItemForIdentifier_placement___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "createActionMenuController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setMenuController:", v3);

  v5 = (void *)MEMORY[0x1E0DC39D0];
  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "menuController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuWithTitle:children:", &stru_1E5149688, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __69__PXPhotosBarsController_createBarButtonItemForIdentifier_placement___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  objc_super v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 88))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 96);
    v11.receiver = *(id *)(a1 + 40);
    v11.super_class = (Class)PXPhotosBarsController;
    objc_msgSendSuper2(&v11, sel_createBarButtonItemForIdentifier_placement_, v2, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTarget:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v4, "setAction:", *(_QWORD *)(a1 + 88));
    if (v4)
      return v4;
  }
  else if (*(_QWORD *)(a1 + 80))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 96);
    v10.receiver = *(id *)(a1 + 40);
    v10.super_class = (Class)PXPhotosBarsController;
    objc_msgSendSuper2(&v10, sel_createBarButtonItemForIdentifier_placement_, v5, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setSecondaryActionsProvider:", *(_QWORD *)(a1 + 80));
    if (v4)
      return v4;
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    if (objc_msgSend(*(id *)(a1 + 56), "supportsActionType:"))
    {
      objc_msgSend(*(id *)(a1 + 56), "barButtonItemForActionType:", *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEnabled:", objc_msgSend(*(id *)(a1 + 56), "canPerformActionType:", *(_QWORD *)(a1 + 48)));
      if (v4)
        return v4;
    }
    if (objc_msgSend(*(id *)(a1 + 64), "supportsActionType:", *(_QWORD *)(a1 + 48)))
    {
      objc_msgSend(*(id *)(a1 + 64), "barButtonItemForActionType:", *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEnabled:", objc_msgSend(*(id *)(a1 + 64), "canPerformActionType:", *(_QWORD *)(a1 + 48)));
      if (v4)
        return v4;
    }
    if (objc_msgSend(*(id *)(a1 + 72), "supportsActionType:", *(_QWORD *)(a1 + 48)))
    {
      objc_msgSend(*(id *)(a1 + 72), "barButtonItemForActionType:", *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEnabled:", objc_msgSend(*(id *)(a1 + 72), "canPerformActionType:", *(_QWORD *)(a1 + 48)));
      if (v4)
        return v4;
    }
  }
  PLGridZeroGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v13 = v8;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Couldn't create bar button item for %@", buf, 0xCu);
  }

  v4 = 0;
  return v4;
}

void __36__PXPhotosBarsController_updateBars__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  char v9;
  __int16 v10;
  char v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PXPhotosBarsController_updateBars__block_invoke_2;
  v6[3] = &unk_1E5143490;
  v9 = *(_BYTE *)(a1 + 64);
  v10 = *(_WORD *)(a1 + 65);
  v4 = *(id *)(a1 + 48);
  v11 = *(_BYTE *)(a1 + 67);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "performChangesWithAnimationOptions:changes:", v3, v6);

}

void __36__PXPhotosBarsController_updateBars__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPrefersNavigationBarVisible:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v3, "setPrefersToolbarVisible:", *(unsigned __int8 *)(a1 + 49));
  objc_msgSend(v3, "setPrefersTabBarVisible:", *(unsigned __int8 *)(a1 + 50));
  objc_msgSend(v3, "setNavigationBarTintColor:", *(_QWORD *)(a1 + 32));
  if (!*(_BYTE *)(a1 + 51))
  {
    objc_msgSend(v3, "setBarAppearancePreferredStatusBarStyle:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "setPrefersStatusBarVisible:", 1);
  }

}

@end
