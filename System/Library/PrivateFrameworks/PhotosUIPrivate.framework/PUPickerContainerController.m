@implementation PUPickerContainerController

- (id)_pickerViewControllerWithConfiguration:(id)a3 sessionInfo:(id)a4 collectionList:(id)a5 selectionCoordinator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PUPickerContainerController *v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  PUPickerContainerController._pickerViewController(configuration:sessionInfo:collectionList:selectionCoordinator:)();
  v16 = v15;

  return v16;
}

- (id)_viewControllerWithSidebarNavigationDestination:(id)a3 configuration:(id)a4 sessionInfo:(id)a5 selectionCoordinator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PUPickerContainerController *v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  PUPickerContainerController._viewController(sidebarNavigationDestination:configuration:sessionInfo:selectionCoordinator:)();
  v16 = v15;

  return v16;
}

- (id)px_gridPresentation
{
  void *v3;
  void *v4;

  createGridPresentationWithViewController(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController sessionInfo](self, "sessionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionInfo:", v4);

  return v3;
}

- (PUPickerContainerController)initWithConfiguration:(id)a3 loadingStatusManager:(id)a4 selectionCoordinator:(id)a5 additionalSelectionState:(id)a6 resizeTaskDescriptorViewModel:(id)a7 actionHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PUPickerContainerController *v21;
  void *v22;
  uint64_t v23;
  PUPickerSegmentedControl *v24;
  void *v25;
  void *v26;
  void *v27;
  PUPickerSegmentedControl *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  double v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  UIBarButtonItem *toolbarShowSelectedGroup;
  id v43;
  void *v44;
  uint64_t v45;
  UIBarButtonItem *toolbarOptionsBarButton;
  void *v47;
  uint64_t v48;
  UIBarButtonItem *toolbarNewAlbumBarButton;
  id v50;
  void *v51;
  uint64_t v52;
  UIBarButtonItem *toolbarSortAndFilterBarButtonItem;
  void *v54;
  void *v55;
  id v57;
  id v58;
  id obj;
  id v60;
  id v61;
  void *v62;
  objc_super v63;
  _QWORD v64[2];
  _QWORD v65[3];

  v65[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  obj = a6;
  v18 = a6;
  v60 = a7;
  v19 = a7;
  v20 = a8;
  v63.receiver = self;
  v63.super_class = (Class)PUPickerContainerController;
  v21 = -[PUPickerContainerController initWithNibName:bundle:](&v63, sel_initWithNibName_bundle_, 0, 0);
  if (v21)
  {
    v62 = v15;
    objc_msgSend(v15, "registerChangeObserver:context:", v21, PUPhotoPickerConfigurationObservationContext);
    objc_msgSend(v18, "observable");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "registerChangeObserver:context:", v21, PUPhotoPickerAdditionalSelectionStateObservationContext);

    objc_msgSend(v19, "registerChangeObserver:context:", v21, PUPhotoPickerResizeTaskDescriptorViewModelObservationContext_73498);
    objc_storeStrong((id *)&v21->_configuration, a3);
    objc_storeStrong((id *)&v21->_selectionCoordinator, a5);
    objc_storeStrong((id *)&v21->_additionalSelectionState, obj);
    objc_storeStrong((id *)&v21->_resizeTaskDescriptorViewModel, v60);
    objc_storeWeak((id *)&v21->_containerControllerActionHandler, v20);
    v58 = v16;
    v57 = v20;
    if (_os_feature_enabled_impl())
      PXLemonadeLocalizedString();
    else
      PXLocalizedString();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = [PUPickerSegmentedControl alloc];
    objc_msgSend(v62, "allPhotosVirtualCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "title");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v26;
    v65[1] = v23;
    v61 = (id)v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[PUPickerSegmentedControl initWithItems:](v24, "initWithItems:", v27);

    -[PUPickerSegmentedControl setClipsToBounds:](v28, "setClipsToBounds:", 1);
    -[PUPickerSegmentedControl _setAlwaysEmitValueChanged:](v28, "_setAlwaysEmitValueChanged:", 1);
    -[PUPickerSegmentedControl addTarget:action:forControlEvents:](v28, "addTarget:action:forControlEvents:", v21, sel_handleNavigationBarSegmentedControl_, 4096);
    -[PUPickerSegmentedControl setSelectedSegmentIndex:](v28, "setSelectedSegmentIndex:", 0);
    objc_storeStrong((id *)&v21->_navigationBarSegmentedControl, v28);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1AF42A0A8](8, 2, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "titleLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFont:", v30);

    objc_msgSend(v29, "titleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAdjustsFontForContentSizeCategory:", 1);

    objc_msgSend(v29, "setShowsLargeContentViewer:", 1);
    objc_msgSend(v29, "addTarget:action:forControlEvents:", v21, sel_handleToolbarShowSelectedButton_, 0x2000);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTitleColor:forState:", v33, 2);

    objc_storeStrong((id *)&v21->_showSelectedButtonTitleButton, v29);
    v34 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTextColor:", v35);

    objc_msgSend(v34, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v34, "setShowsLargeContentViewer:", 1);
    objc_msgSend(v34, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFont:", v36);

    objc_msgSend(v34, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC4908]);
    LODWORD(v37) = 1148846080;
    objc_msgSend(v34, "setContentCompressionResistancePriority:forAxis:", 1, v37);
    objc_storeStrong((id *)&v21->_showSelectedButtonSubtitleLabel, v34);
    v38 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v64[0] = v29;
    v64[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v38, "initWithArrangedSubviews:", v39);

    objc_msgSend(v40, "setAxis:", 1);
    objc_msgSend(v40, "setAlignment:", 3);
    objc_msgSend(v40, "setDistribution:", 0);
    v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v40);
    toolbarShowSelectedGroup = v21->_toolbarShowSelectedGroup;
    v21->_toolbarShowSelectedGroup = (UIBarButtonItem *)v41;

    v43 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("switch.2"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "initWithImage:style:target:action:", v44, 0, v21, sel_handleToolbarOptionsButton_);
    toolbarOptionsBarButton = v21->_toolbarOptionsBarButton;
    v21->_toolbarOptionsBarButton = (UIBarButtonItem *)v45;

    PXLocalizedString();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityLabel:](v21->_toolbarOptionsBarButton, "setAccessibilityLabel:", v47);

    if (objc_msgSend(v62, "isAddToAlbumPicker"))
    {
      v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 4, v21, sel_handleToolbarNewAlbumButton_);
      toolbarNewAlbumBarButton = v21->_toolbarNewAlbumBarButton;
      v21->_toolbarNewAlbumBarButton = (UIBarButtonItem *)v48;

    }
    v50 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.arrow.down"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "initWithImage:menu:", v51, 0);
    toolbarSortAndFilterBarButtonItem = v21->_toolbarSortAndFilterBarButtonItem;
    v21->_toolbarSortAndFilterBarButtonItem = (UIBarButtonItem *)v52;

    -[PUPickerContainerController configuration](v21, "configuration");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "sourceType");

    v15 = v62;
    PXLocalizedString();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityLabel:](v21->_toolbarSortAndFilterBarButtonItem, "setAccessibilityLabel:", v55);

    v16 = v58;
    -[PUPickerContainerController _setupViewControllersWithConfiguration:loadingStatusManager:selectionCoordinator:](v21, "_setupViewControllersWithConfiguration:loadingStatusManager:selectionCoordinator:", v62, v58, v17);

    v20 = v57;
  }

  return v21;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0D7B288], "tearDownPrivacyControllersIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)PUPickerContainerController;
  -[PUPickerContainerController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
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
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PUPickerContainerController;
  -[PUPickerContainerController viewDidLoad](&v23, sel_viewDidLoad);
  -[PUPickerContainerController px_enableExtendedTraitCollection](self, "px_enableExtendedTraitCollection");
  -[PUPickerContainerController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allPhotosVirtualCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController photosViewController](self, "photosViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

  -[PUPickerContainerController searchSuggestionsCollectionViewDataSource](self, "searchSuggestionsCollectionViewDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setChangeObserver:", self);

  -[PUPickerContainerController navigationBarBottomPalette](self, "navigationBarBottomPalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setBottomPalette:", v8);

  if (-[PUPickerContainerController _isConfiguredForStickerSuggestionGroup](self, "_isConfiguredForStickerSuggestionGroup"))
  {
    -[PUPickerContainerController _updateNumberOfItemsToPlayInline](self, "_updateNumberOfItemsToPlayInline");
  }
  -[PUPickerContainerController resizeTaskDescriptorViewModel](self, "resizeTaskDescriptorViewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performChanges:", &__block_literal_global_73732);

  -[PUPickerContainerController photosViewController](self, "photosViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "gridActionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPerformerDelegate:", self);

  -[PUPickerContainerController configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "albumsConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PUPickerContainerController albumsViewController](self, "albumsViewController");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUPickerContainerController photosViewController](self, "photosViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[PUPickerContainerController photosViewController](self, "photosViewController");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PUPickerContainerController peopleConfigController](self, "peopleConfigController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "hasContent");

      if (v20)
      {
        -[PUPickerContainerController peopleConfigController](self, "peopleConfigController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "incrementViewControllersForPerson:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      -[PUPickerContainerController collectionsViewController](self, "collectionsViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        -[PUPickerContainerController collectionsViewController](self, "collectionsViewController");
      else
        -[PUPickerContainerController unavailableViewController](self, "unavailableViewController");
      v16 = objc_claimAutoreleasedReturnValue();
    }
  }
  v18 = (void *)v16;
LABEL_8:
  -[PUPickerContainerController _addOrReplaceItemViewControllerWithViewController:](self, "_addOrReplaceItemViewControllerWithViewController:", v18);
  -[PUPickerContainerController updateBars](self, "updateBars");

}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUPickerContainerController;
  -[PUPickerContainerController viewIsAppearing:](&v10, sel_viewIsAppearing_, a3);
  -[PUPickerContainerController photosViewController](self, "photosViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerChangeObserver:context:", self, PUPhotoPickerPhotosViewControllerViewModelObservationContext);

  -[PUPickerContainerController photosViewController](self, "photosViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "gridView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerObserver:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPickerContainerController;
  -[PUPickerContainerController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PUPickerContainerController containerControllerActionHandler](self, "containerControllerActionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerControllerDidAppear:", self);

  -[PUPickerContainerController _showPhotosIndicatorBrieflyIfNeeded](self, "_showPhotosIndicatorBrieflyIfNeeded");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PUPickerContainerController;
  -[PUPickerContainerController viewDidLayoutSubviews](&v16, sel_viewDidLayoutSubviews);
  -[PUPickerContainerController photosIndicator](self, "photosIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController photosIndicator](self, "photosIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bringSubviewToFront:", v5);

  if (-[PUPickerContainerController shouldStopScrollingItemsViewControllerToTop](self, "shouldStopScrollingItemsViewControllerToTop"))
  {
    goto LABEL_13;
  }
  -[PUPickerContainerController itemsViewController](self, "itemsViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstSelectedAssetReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPickerContainerController configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "shouldScrollToSelectedItemInitially") || !v7)
  {

    goto LABEL_11;
  }

  if (!v9)
  {
LABEL_11:
    -[PUPickerContainerController itemsViewController](self, "itemsViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pu_scrollToInitialPositionAnimated:", 0);

    goto LABEL_12;
  }
  objc_msgSend(v7, "scrollToRevealAssetReference:completion:", v9, 0);
LABEL_12:
  objc_initWeak(&location, self);
  v12 = dispatch_time(0, 1000000000);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__PUPickerContainerController_viewDidLayoutSubviews__block_invoke;
  v13[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v14, &location);
  dispatch_after(v12, MEMORY[0x1E0C80D38], v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

LABEL_13:
  if (self->_hasNavigationBarTransitionPending)
    -[PUPickerContainerController _updateInteractiveBarTransition](self, "_updateInteractiveBarTransition");
}

- (void)viewSafeAreaInsetsDidChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;
  UIEdgeInsets v10;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)PUPickerContainerController;
  -[PUPickerContainerController viewSafeAreaInsetsDidChange](&v6, sel_viewSafeAreaInsetsDidChange);
  PLPickerGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PUPickerContainerController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeAreaInsets");
    NSStringFromUIEdgeInsets(v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEBUG, "Call _updateInteractiveBarTransition, safe area insets changed to %@", buf, 0xCu);

  }
  -[PUPickerContainerController _updateInteractiveBarTransition](self, "_updateInteractiveBarTransition");
}

- (void)updateViewConstraints
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_super v22;

  -[PUPickerContainerController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mode");
  v5 = v4 == 1;
  v6 = v4 != 1;

  -[PUPickerContainerController topConstraint](self, "topConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", v6);

  -[PUPickerContainerController bottomConstraint](self, "bottomConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", v6);

  -[PUPickerContainerController topSafeAreaConstraint](self, "topSafeAreaConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", v5);

  -[PUPickerContainerController bottomSafeAreaConstraint](self, "bottomSafeAreaConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", v5);

  -[PUPickerContainerController leadingConstraint](self, "leadingConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[PUPickerContainerController trailingConstraint](self, "trailingConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[PUPickerContainerController configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "supportsInteractiveBarTransition"))
  {
    -[PUPickerContainerController configuration](self, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "interactiveBarTransitionFractionExpanded");
    v16 = v15 < 0.8;

  }
  else
  {
    v16 = 0;
  }

  -[PUPickerContainerController photosIndicatorTopConstraint](self, "photosIndicatorTopConstraint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", v16);

  -[PUPickerContainerController photosIndicatorLeadingConstraint](self, "photosIndicatorLeadingConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", v16);

  v19 = v16 ^ 1;
  -[PUPickerContainerController photosIndicatorTopSafeAreaConstraint](self, "photosIndicatorTopSafeAreaConstraint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", v19);

  -[PUPickerContainerController photosIndicatorLeadingSafeAreaConstraint](self, "photosIndicatorLeadingSafeAreaConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", v19);

  v22.receiver = self;
  v22.super_class = (Class)PUPickerContainerController;
  -[PUPickerContainerController updateViewConstraints](&v22, sel_updateViewConstraints);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUPickerContainerController;
  -[PUPickerContainerController traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  -[PUPickerContainerController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_presentationSemanticContext");
  v7 = objc_msgSend(v4, "_presentationSemanticContext");

  if (v6 != v7)
    -[PUPickerContainerController updateBars](self, "updateBars");
  -[PUPickerContainerController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    -[PUPickerContainerController photosViewController](self, "photosViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidateHeaderView");

  }
}

- (id)sessionInfoForConfiguration:(id)a3 loadingStatusManager:(id)a4 selectionCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  PUImagePickerSessionInfo *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PUImagePickerSessionInfo initWithPhotosViewDelegate:loadingStatusManager:allowMultipleSelection:limitedLibrary:]([PUImagePickerSessionInfo alloc], "initWithPhotosViewDelegate:loadingStatusManager:allowMultipleSelection:limitedLibrary:", self, v9, 1, objc_msgSend(v10, "isLimitedLibraryPicker"));

  -[PUSessionInfo setSelectionCoordinator:](v11, "setSelectionCoordinator:", v8);
  -[PUSessionInfo setAllowsSwipeToSelect:](v11, "setAllowsSwipeToSelect:", objc_msgSend(v10, "allowsSwipeToSelect"));
  objc_msgSend(v10, "generatedFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetPredicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSessionInfo setAssetsFilterPredicate:](v11, "setAssetsFilterPredicate:", v13);

  objc_msgSend(v10, "generatedFilter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSessionInfo setAssetTypesToInclude:](v11, "setAssetTypesToInclude:", objc_msgSend(v14, "genericAssetTypes"));

  objc_msgSend(v10, "generatedFilter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSessionInfo setNoContentPlaceholderType:](v11, "setNoContentPlaceholderType:", objc_msgSend(v15, "noContentPlaceholderType"));

  -[PUSessionInfo setWantsNumberedSelectionStyle:](v11, "setWantsNumberedSelectionStyle:", objc_msgSend(v10, "isOrderedSelection"));
  -[PUSessionInfo setExcludesSharedAlbums:](v11, "setExcludesSharedAlbums:", objc_msgSend(v10, "excludesSharedAlbums"));
  -[PUSessionInfo setExcludesHiddenAlbum:](v11, "setExcludesHiddenAlbum:", objc_msgSend(v10, "excludesHiddenAlbum"));
  -[PUSessionInfo setExcludesNewAlbumCreation:](v11, "setExcludesNewAlbumCreation:", objc_msgSend(v10, "excludesNewAlbumCreation"));
  -[PUSessionInfo setReverseSortOrder:](v11, "setReverseSortOrder:", 1);
  -[PUSessionInfo setHasClearBackgroundColor:](v11, "setHasClearBackgroundColor:", objc_msgSend(v10, "hasClearBackgroundColor"));
  -[PUSessionInfo setContentStartingPosition:](v11, "setContentStartingPosition:", 2);
  -[PUSessionInfo setSelectingTargetAlbum:](v11, "setSelectingTargetAlbum:", objc_msgSend(v10, "sourceType") == 2);
  objc_msgSend(v10, "pickerClientBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUSessionInfo setPickerClientBundleIdentifier:](v11, "setPickerClientBundleIdentifier:", v16);
  -[PUSessionInfo addSessionInfoObserver:](v11, "addSessionInfoObserver:", self);
  return v11;
}

- (void)_setupViewControllersWithConfiguration:(id)a3 loadingStatusManager:(id)a4 selectionCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  PUPickerContainerController *v12;
  void *v13;
  void *v14;
  char v15;
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
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  uint64_t v34;
  PXSectionedSelectionManager *photosSelectionManager;
  void *v36;
  PUPickerSearchBar *v37;
  void *v38;
  uint64_t v39;
  id v40;
  PUPickerContainerController *v41;
  void *v42;
  PUPickerSuggestionsView *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  PUPickerSuggestionsView *v47;
  void *v48;
  id v49;
  _QWORD *v50;
  void *v51;
  PUPickerSuggestionResultFetcher *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  PUPickerSuggestionResultFetcher *v57;
  PUPickerNavigationBarPalette *v58;
  _UINavigationBarPalette *navigationBarBottomPalette;
  void *v60;
  void *v61;
  uint64_t v62;
  UIViewController *unavailableViewController;
  uint64_t v64;
  id v65;
  id obj;
  id v67;
  PUPickerSearchBar *v68;
  id v69;
  id v70;
  void *v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  id from[4];
  id v79;
  id location;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  v69 = v9;
  v70 = v10;
  v12 = self;
  v71 = v11;
  objc_msgSend(v11, "containerCollectionFetchResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || (v15 = objc_msgSend(v11, "isPeopleOrPetsPicker"), v14, (v15 & 1) != 0))
  {
    v16 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v11, "generatedFilter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "assetPredicate");
  v67 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "customSortDescriptors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v11, "customSortDescriptors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v11, "showsWallpaperSuggestions"))
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v24;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sortToken"), 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v21;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v22;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  objc_msgSend(v11, "containerCollectionFetchResult");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v64) = 0;
  BYTE1(v64) = objc_msgSend(v11, "allowsSwipeToSelect");
  LOBYTE(v64) = 1;
  PXPhotosViewConfigurationForImagePickerWithAssetCollectionFetchResult();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setStartsInSelectMode:", 1, v64);
  objc_msgSend(v16, "setWantsNumberedSelectionStyle:", objc_msgSend(v71, "isOrderedSelection"));
  objc_msgSend(v71, "generatedFilter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNoContentPlaceholderType:", objc_msgSend(v27, "noContentPlaceholderType"));

  objc_msgSend(v16, "setLoadingStatusManager:", v69);
  objc_msgSend(v16, "setDelegate:", v12);
  objc_msgSend(v16, "setContentStartingPosition:", 2);
  if (objc_msgSend(v71, "hasClearBackgroundColor"))
    v28 = 2;
  else
    v28 = 0;
  objc_msgSend(v16, "setBackgroundStyle:", v28);
  objc_msgSend(v71, "pickerClientBundleIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPickerClientBundleIdentifier:", v29);

  objc_initWeak(&location, v12);
  from[0] = (id)MEMORY[0x1E0C809B0];
  from[1] = (id)3221225472;
  from[2] = __PUAssetPickerCreatePXPhotosViewConfiguration_block_invoke;
  from[3] = &unk_1E58A6998;
  objc_copyWeak(&v79, &location);
  objc_msgSend(v16, "setBadgesModifier:", from);
  objc_msgSend(v16, "setIgnoreFilterPredicateAssert:", 1);
  objc_msgSend(v16, "setIgnoreContentFilterStateWhenNotFiltering:", 0);
  objc_msgSend(v71, "phPickerConfiguration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_aspectRatio");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v31, "_aspectRatio");
    if (v32 == *MEMORY[0x1E0CD2208])
      v33 = *MEMORY[0x1E0D7C690];
    else
      objc_msgSend(v31, "_aspectRatio");
    objc_msgSend(v16, "setItemAspectRatio:", v33);
    objc_msgSend(v16, "setSectionBodyStyle:", 1);
  }
  if (objc_msgSend(v71, "showsWallpaperSuggestions"))
  {
    objc_msgSend(v16, "setShowLoadingPlaceholderWhenEmpty:", 1);
    objc_msgSend(v16, "setOverrideDefaultNumberOfColumns:", 3);
    objc_msgSend(v16, "setPreferredColumnCountsDelegate:", v12);
    objc_msgSend(v16, "setUseLowMemoryDecode:", 1);
    objc_msgSend(v16, "setIgnoreContentFilterStateWhenNotFiltering:", 1);
    objc_msgSend(v16, "setItemAspectRatio:", *MEMORY[0x1E0D7C690]);
    objc_msgSend(v16, "setPreferredAssetCropDelegate:", v12);
  }
  if (objc_msgSend(v71, "mode") == 1)
  {
    objc_msgSend(v16, "setWantsSingleRowScrollingLayout:", 1);
    objc_msgSend(v16, "setSectionBodyStyle:", 0);
    objc_msgSend(v16, "setContentMode:", 1);
  }

  objc_destroyWeak(&v79);
  objc_destroyWeak(&location);

LABEL_23:
  objc_storeStrong((id *)&v12->_photosViewConfiguration, v16);
  if (v16)
  {
    -[PUPickerContainerController sessionInfoForConfiguration:loadingStatusManager:selectionCoordinator:](v12, "sessionInfoForConfiguration:loadingStatusManager:selectionCoordinator:", v71, v69, v70);
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v12->_sessionInfo, obj);
    if (!objc_msgSend(v71, "sourceType"))
      -[PUPickerContainerController _setupPhotosTabWithPhotosViewConfiguration:](v12, "_setupPhotosTabWithPhotosViewConfiguration:", v16);
    objc_msgSend(v16, "dataSourceManager");
    v65 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v12->_photosDataSourceManager, v65);
    objc_msgSend(v16, "selectionManager");
    v34 = objc_claimAutoreleasedReturnValue();
    photosSelectionManager = v12->_photosSelectionManager;
    v12->_photosSelectionManager = (PXSectionedSelectionManager *)v34;

    objc_initWeak(from, v12);
    v36 = v71;
    if (_os_feature_enabled_impl())
    {
      v37 = [PUPickerSearchBar alloc];
      objc_msgSend(v71, "photoLibrary");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = MEMORY[0x1E0C809B0];
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __112__PUPickerContainerController__setupViewControllersWithConfiguration_loadingStatusManager_selectionCoordinator___block_invoke;
      v76[3] = &unk_1E58A66F8;
      objc_copyWeak(&v77, from);
      v74[0] = v39;
      v74[1] = 3221225472;
      v74[2] = __112__PUPickerContainerController__setupViewControllersWithConfiguration_loadingStatusManager_selectionCoordinator___block_invoke_2;
      v74[3] = &unk_1E58AA420;
      objc_copyWeak(&v75, from);
      v68 = -[PUPickerSearchBar initWithPhotoLibrary:searchHandler:scopeHandler:](v37, "initWithPhotoLibrary:searchHandler:scopeHandler:", v38, v76, v74);

      objc_destroyWeak(&v75);
      objc_destroyWeak(&v77);
      v36 = v71;
    }
    else
    {
      -[PUPickerContainerController _setupSearchWithPickerConfiguration:](v12, "_setupSearchWithPickerConfiguration:", v71);
      v68 = 0;
    }
    v40 = v36;
    v41 = v12;
    objc_msgSend(v40, "suggestionGroup");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      v43 = [PUPickerSuggestionsView alloc];
      v44 = objc_msgSend(v40, "isProcessingSuggestions");
      v45 = objc_msgSend(v40, "showsWallpaperSuggestions");
      objc_msgSend(v40, "generatedFilter");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[PUPickerSuggestionsView initWithIsProcessing:isDeviceAspectRatioContentMode:contentHasSpecialFilter:](v43, "initWithIsProcessing:isDeviceAspectRatioContentMode:contentHasSpecialFilter:", v44, v45, objc_msgSend(v46, "containsStickersFilter"));

      objc_msgSend(v40, "photoLibrary");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPickerSuggestionsView setPhotoLibrary:](v47, "setPhotoLibrary:", v48);

      -[PUPickerSuggestionsView setDelegate:](v47, "setDelegate:", v41);
      -[PUPickerSuggestionsView setSuggestionGroup:](v47, "setSuggestionGroup:", v42);
    }
    else
    {
      v47 = 0;
    }

    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __112__PUPickerContainerController__setupViewControllersWithConfiguration_loadingStatusManager_selectionCoordinator___block_invoke_3;
    v72[3] = &unk_1E58A6720;
    objc_copyWeak(&v73, from);
    v49 = v40;
    v50 = v72;
    objc_msgSend(v49, "suggestionGroup");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      v52 = [PUPickerSuggestionResultFetcher alloc];
      objc_msgSend(v49, "photoLibrary");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v49, "isProcessingSuggestions");
      v55 = objc_msgSend(v49, "showsWallpaperSuggestions");
      objc_msgSend(v49, "generatedFilter");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[PUPickerSuggestionResultFetcher initWithPhotoLibrary:isProcessing:isDeviceAspectRatioContentMode:contentHasSpecialFilter:updateHandler:](v52, "initWithPhotoLibrary:isProcessing:isDeviceAspectRatioContentMode:contentHasSpecialFilter:updateHandler:", v53, v54, v55, objc_msgSend(v56, "containsStickersFilter"), v50);

    }
    else
    {
      v57 = 0;
    }

    objc_storeStrong((id *)&v41->_searchBar, v68);
    objc_storeStrong((id *)&v41->_pickerSuggestionsView, v47);
    objc_storeStrong((id *)&v41->_pickerSuggestionResultFetcher, v57);
    v58 = -[PUPickerNavigationBarPalette initWithTopView:bottomView:]([PUPickerNavigationBarPalette alloc], "initWithTopView:bottomView:", v68, v47);
    navigationBarBottomPalette = v41->_navigationBarBottomPalette;
    v41->_navigationBarBottomPalette = &v58->super;

    objc_destroyWeak(&v73);
    objc_destroyWeak(from);

  }
  else if (objc_msgSend(v71, "isPeopleOrPetsPicker"))
  {
    -[PUPickerContainerController _setupPeopleOrPetsPickerWithPickerConfiguration:](v12, "_setupPeopleOrPetsPickerWithPickerConfiguration:", v71);
  }
  else
  {
    v60 = (void *)MEMORY[0x1E0CD21E0];
    objc_msgSend(v71, "phPickerConfiguration");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "unavailableViewController:configuration:error:delegate:", 4, v61, 0, 0);
    v62 = objc_claimAutoreleasedReturnValue();
    unavailableViewController = v12->_unavailableViewController;
    v12->_unavailableViewController = (UIViewController *)v62;

  }
}

- (void)_setupPhotosTabWithPhotosViewConfiguration:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PXPhotosUIViewController *lastVisiblePhotosViewController;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0D7B810];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithConfiguration:", v5);

    -[PUPickerContainerController configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasClearBackgroundColor");
    objc_msgSend(v6, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHitTestsAsOpaque:", v8);

    objc_storeStrong((id *)&self->_photosViewController, v6);
    lastVisiblePhotosViewController = self->_lastVisiblePhotosViewController;
    self->_lastVisiblePhotosViewController = (PXPhotosUIViewController *)v6;

  }
}

- (void)_setupAlbumsViewControllerWithPickerConfiguration:(id)a3 loadingStatusManager:(id)a4 selectionCoordinator:(id)a5 sessionInfo:(id)a6 photosViewConfiguration:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UIViewController *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  uint64_t v36;
  PUHorizontalAlbumListGadgetProvider *v37;
  void *v38;
  void *v39;
  void *v40;
  PUHorizontalAlbumListGadgetProvider *v41;
  void *v42;
  void *v43;
  UIViewController *v44;
  void *v45;
  void *v46;
  void *albumsViewController;
  void *v48;
  PUAlbumsGadgetDataSourceManager *v49;
  void *v50;
  PUAlbumsGadgetDataSourceManager *v51;
  id v52;
  PUAlbumsGadgetViewController *v53;
  void *v54;
  UIViewController *v55;
  id v56;
  void *v57;
  void *v58;
  UIViewController *v59;
  UIViewController *v60;
  UIViewController *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[2];

  v66[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (a7)
  {
    objc_msgSend(v10, "albumsConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preselectedIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      objc_msgSend(v10, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "librarySpecificFetchOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "albumsConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "preselectedIdentifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0CD13B8];
      v66[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fetchAssetCollectionsWithLocalIdentifiers:options:", v21, v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v11, "setSourceAlbum:", v23);
        objc_msgSend(v11, "setScrollToSourceAlbumWhenPresented:", 1);
        objc_msgSend(v11, "setShowCheckmarkOnSourceAlbum:", 1);
      }

    }
    objc_msgSend(v10, "albumsConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_identifiers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      objc_msgSend(v11, "setAllowSelectingNonEditableAlbums:", 1);
      objc_msgSend(v10, "albumsConfiguration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "_identifiers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPickerContainerController collectionListForAlbumIdentifier:configuration:](self, "collectionListForAlbumIdentifier:configuration:", v28, v10);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v29 = 0;
    }
    if (_os_feature_enabled_impl())
    {
      -[PUPickerContainerController selectionCoordinator](self, "selectionCoordinator");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPickerContainerController _pickerViewControllerWithConfiguration:sessionInfo:collectionList:selectionCoordinator:](self, "_pickerViewControllerWithConfiguration:sessionInfo:collectionList:selectionCoordinator:", v10, v11, v29, v30);
      v31 = (UIViewController *)objc_claimAutoreleasedReturnValue();

      -[PUPickerContainerController configuration](self, "configuration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isAddToAlbumPicker");

      if ((v33 & 1) == 0)
      {
        -[PUPickerContainerController configuration](self, "configuration");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "isAlbumPicker");

      }
      PXLocalizedString();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController setTitle:](v31, "setTitle:", v46);

      albumsViewController = self->_albumsViewController;
      self->_albumsViewController = v31;
    }
    else
    {
      objc_msgSend(v10, "albumsConfiguration");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "_identifiers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "count");

      if (v36)
      {
        if (objc_msgSend(v10, "mode") == 1)
        {
          objc_msgSend(v11, "setRootCollectionList:", v29);
          v37 = [PUHorizontalAlbumListGadgetProvider alloc];
          -[PUPickerContainerController px_extendedTraitCollection](self, "px_extendedTraitCollection");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPickerContainerController sessionInfo](self, "sessionInfo");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "photoLibrary");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = -[PUHorizontalAlbumListGadgetProvider initWithType:extendedTraitCollection:sessionInfo:photoLibrary:](v37, "initWithType:extendedTraitCollection:sessionInfo:photoLibrary:", 6, v38, v39, v40);

          -[PUHorizontalAlbumListGadgetProvider loadDataForGadgets](v41, "loadDataForGadgets");
          -[PUHorizontalAlbumListGadgetProvider generateGadgets](v41, "generateGadgets");
          -[PXGadgetProvider gadgets](v41, "gadgets");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "firstObject");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
            v44 = v43;
          else
            v44 = 0;

          v56 = objc_alloc(MEMORY[0x1E0D7B4A0]);
          -[PUPickerContainerController px_extendedTraitCollection](self, "px_extendedTraitCollection");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = (void *)objc_msgSend(v56, "initWithTraitCollection:scrollAxis:", v57, 2);

          -[UIViewController setGadgetSpec:](v44, "setGadgetSpec:", v58);
          v59 = self->_albumsViewController;
          self->_albumsViewController = v44;

        }
        if (self->_albumsViewController)
          goto LABEL_26;
        -[PUPickerContainerController px_gridPresentation](self, "px_gridPresentation");
        albumsViewController = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(albumsViewController, "createAlbumListViewControllerWithCollectionList:", v29);
        v60 = (UIViewController *)objc_claimAutoreleasedReturnValue();
        v61 = self->_albumsViewController;
        self->_albumsViewController = v60;

      }
      else
      {
        objc_msgSend(v10, "photoLibrary");
        albumsViewController = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D7B970], "sharedLibraryStatusProviderWithPhotoLibrary:", albumsViewController);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B578]), "initWithSharedLibraryStatusProvider:", v65);
        v49 = [PUAlbumsGadgetDataSourceManager alloc];
        -[PUPickerContainerController px_extendedTraitCollection](self, "px_extendedTraitCollection");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = -[PUAlbumsGadgetDataSourceManager initWithTraitCollection:sessionInfo:photoLibrary:libraryFilterState:](v49, "initWithTraitCollection:sessionInfo:photoLibrary:libraryFilterState:", v50, v11, albumsViewController, v48);

        v52 = objc_alloc_init(MEMORY[0x1E0D7B490]);
        v53 = -[PUAlbumsGadgetViewController initWithLayout:dataSourceManager:]([PUAlbumsGadgetViewController alloc], "initWithLayout:dataSourceManager:", v52, v51);
        -[PUAlbumsGadgetViewController setSessionInfo:](v53, "setSessionInfo:", v11);
        PXLocalizedString();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUAlbumsGadgetViewController setTitle:](v53, "setTitle:", v54);

        v55 = self->_albumsViewController;
        self->_albumsViewController = &v53->super.super.super;

      }
    }

LABEL_26:
    v62 = objc_msgSend(v10, "hasClearBackgroundColor");
    -[UIViewController view](self->_albumsViewController, "view");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "layer");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setHitTestsAsOpaque:", v62);

  }
}

- (void)_setupCollectionsViewControllerWithPickerConfiguration:(id)a3 sessionInfo:(id)a4 photosViewConfiguration:(id)a5
{
  id v7;
  id v8;
  void *v9;
  UIViewController *v10;
  void *v11;
  UIViewController *collectionsViewController;

  if (a5)
  {
    v7 = a4;
    v8 = a3;
    -[PUPickerContainerController selectionCoordinator](self, "selectionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController _pickerViewControllerWithConfiguration:sessionInfo:collectionList:selectionCoordinator:](self, "_pickerViewControllerWithConfiguration:sessionInfo:collectionList:selectionCoordinator:", v8, v7, 0, v9);
    v10 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    PXLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController setTitle:](v10, "setTitle:", v11);

    collectionsViewController = self->_collectionsViewController;
    self->_collectionsViewController = v10;

  }
}

- (void)_setupPeopleOrPetsPickerWithPickerConfiguration:(id)a3
{
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PXPeoplePickerConfigurationController *v12;
  PXPeoplePickerConfigurationController *peopleConfigController;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "peopleConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 685, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration.peopleConfigurations.count > 0"));

  }
  v7 = objc_msgSend(v21, "sourceType") == 4 || objc_msgSend(v21, "sourceType") == 3;
  v8 = objc_alloc(MEMORY[0x1E0D7B6A0]);
  objc_msgSend(v21, "peopleConfigurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v21, "selectionLimit");
  objc_msgSend(v21, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (PXPeoplePickerConfigurationController *)objc_msgSend(v8, "initWithPeopleConfigurations:selectionLimit:wantsPets:configControllerHandler:photoLibrary:", v9, v10, v7, self, v11);
  peopleConfigController = self->_peopleConfigController;
  self->_peopleConfigController = v12;

  objc_msgSend(v21, "allPersonIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerConfigurationController setIdentifiers:](self->_peopleConfigController, "setIdentifiers:", v15);

  objc_msgSend(v21, "preselectedItemIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerConfigurationController setPreselectedIdentifiers:](self->_peopleConfigController, "setPreselectedIdentifiers:", v17);

  -[PUPickerContainerController selectionCoordinator](self, "selectionCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerConfigurationController setSelectionCoordinator:](self->_peopleConfigController, "setSelectionCoordinator:", v18);

  -[PXPeoplePickerConfigurationController setShouldActLikeSingleSelectPicker:](self->_peopleConfigController, "setShouldActLikeSingleSelectPicker:", objc_msgSend(v21, "isFollowupSingleSelectionPeoplePicker"));
  -[PXPeoplePickerConfigurationController setCompactMode:](self->_peopleConfigController, "setCompactMode:", objc_msgSend(v21, "mode") == 1);
  -[PXPeoplePickerConfigurationController setTransparentBackground:](self->_peopleConfigController, "setTransparentBackground:", objc_msgSend(v21, "hasClearBackgroundColor"));
  objc_msgSend(v21, "photoLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController setPeopleSortOrderType:](self, "setPeopleSortOrderType:", -[PUPickerContainerController _currentPeopleSortOrderForPhotoLibrary:](self, "_currentPeopleSortOrderForPhotoLibrary:", v19));

}

- (int64_t)_currentPeopleSortOrderForPhotoLibrary:(id)a3
{
  int64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7B6B8], "currentSortOrderFor:", a3);
  if (result != 2)
    return result == 1;
  return result;
}

- (void)_setupSearchWithPickerConfiguration:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  PUPickerSearchSuggestionsHeaderView *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  PUPickerContainerController *v17;
  UISearchController *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UISearchController *searchController;
  id v24;
  void *v25;
  uint64_t v26;
  PXSearchQueryController *queryController;
  _QWORD v28[4];
  id v29;
  id location;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v6 = objc_alloc_init(MEMORY[0x1E0DC3620]);
  v7 = (void *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  v8 = objc_alloc_init(MEMORY[0x1E0D7B910]);
  objc_storeStrong((id *)&self->_searchSuggestionsSectionProvider, v8);
  v9 = objc_alloc(MEMORY[0x1E0D7B8E0]);
  v31[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithCollectionView:searchDataSourceSectionProviders:", v7, v10);

  objc_storeStrong((id *)&self->_searchSuggestionsCollectionViewDataSource, v11);
  v12 = -[PUPickerSearchSuggestionsHeaderView initWithCollectionView:dataSource:]([PUPickerSearchSuggestionsHeaderView alloc], "initWithCollectionView:dataSource:", v7, v11);
  -[PUPickerSearchSuggestionsHeaderView setSuggestionsSelectionDelegate:](v12, "setSuggestionsSelectionDelegate:", self);
  -[PXPhotosUIViewController view](self->_photosViewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerSearchSuggestionsHeaderView collectionView](v12, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v14);

  objc_storeStrong((id *)&self->_searchSuggestionsHeaderView, v12);
  v16 = (objc_class *)MEMORY[0x1E0DC3C40];
  v17 = self;
  v18 = (UISearchController *)objc_msgSend([v16 alloc], "initWithSearchResultsController:", 0);
  -[UISearchController setObscuresBackgroundDuringPresentation:](v18, "setObscuresBackgroundDuringPresentation:", 0);
  -[UISearchController setHidesNavigationBarDuringPresentation:](v18, "setHidesNavigationBarDuringPresentation:", 0);
  -[UISearchController setAutomaticallyShowsCancelButton:](v18, "setAutomaticallyShowsCancelButton:", 0);
  -[UISearchController setSearchResultsUpdater:](v18, "setSearchResultsUpdater:", v17);
  -[UISearchController searchBar](v18, "searchBar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPlaceholder:", v20);

  objc_msgSend(v19, "setAutocapitalizationType:", 0);
  objc_msgSend(v19, "setDelegate:", v17);

  objc_msgSend(MEMORY[0x1E0D7B908], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "enableAutoCorrect"))
    v22 = 2;
  else
    v22 = 1;
  objc_msgSend(v19, "setAutocorrectionType:", v22);

  objc_msgSend(v19, "setSpellCheckingType:", 1);
  searchController = v17->_searchController;
  v17->_searchController = v18;

  objc_initWeak(&location, v17);
  v24 = objc_alloc(MEMORY[0x1E0D7B8F0]);
  objc_msgSend(v4, "photoLibrary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __67__PUPickerContainerController__setupSearchWithPickerConfiguration___block_invoke;
  v28[3] = &unk_1E58A6748;
  objc_copyWeak(&v29, &location);
  v26 = objc_msgSend(v24, "initWithPhotoLibrary:requestSceneAncestryInformation:resultsHandler:", v25, 0, v28);

  queryController = v17->_queryController;
  v17->_queryController = (PXSearchQueryController *)v26;

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (id)collectionListForAlbumIdentifier:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIncludeAllPhotosSmartAlbum:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithLocalIdentifiers:options:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v6);

  objc_msgSend(v9, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0CD1620]);
  objc_msgSend(v5, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v12, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v11, v13, 0, 0, 0, 0);
  v15 = (void *)MEMORY[0x1E0CD14E0];
  PXLocalizedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transientCollectionListWithCollectionsFetchResult:title:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)_updateSortAndFilterMenu
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  id *v33;
  id v34;
  id *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t);
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id location;

  if (_os_feature_enabled_impl())
  {
    -[PUPickerContainerController configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "sourceType");

    if (v5 <= 4 && ((1 << v5) & 0x1A) != 0)
    {
      -[PUPickerContainerController _peopleSortAndFilterMenu](self, "_peopleSortAndFilterMenu");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      -[PUPickerContainerController toolbarSortAndFilterBarButtonItem](self, "toolbarSortAndFilterBarButtonItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMenu:", v34);

      return;
    }
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0DC3428];
    PXLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __55__PUPickerContainerController__updateSortAndFilterMenu__block_invoke;
    v41[3] = &unk_1E58AB5D0;
    v35 = &v42;
    objc_copyWeak(&v42, &location);
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, 0, 0, v41);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0DC3428];
    PXLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v9;
    v37 = 3221225472;
    v38 = __55__PUPickerContainerController__updateSortAndFilterMenu__block_invoke_2;
    v39 = &unk_1E58AB5D0;
    v33 = &v40;
    objc_copyWeak(&v40, &location);
    objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v12, 0, 0, &v36);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PUPickerContainerController assetSortOrderType](self, "assetSortOrderType") == 1)
    {
      objc_msgSend(v13, "setState:", 1);
      v14 = 0;
    }
    else
    {
      objc_msgSend(v13, "setState:", 0);
      v14 = 1;
    }
    objc_msgSend(v10, "setState:", v14);
    v15 = objc_alloc(MEMORY[0x1E0D7B7E8]);
    -[PUPickerContainerController photosViewController](self, "photosViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "viewModelIfLoaded");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithViewModel:actionType:", v17, *MEMORY[0x1E0D7C650]);

    objc_msgSend(v18, "menuElement");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_10:
        objc_msgSend(v19, "children");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "mutableCopy");

        v22 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v21, "reverseObjectEnumerator");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "allObjects");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "arrayWithArray:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "addObject:", v13);
        objc_msgSend(v25, "addObject:", v10);
        objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPickerContainerController toolbarSortAndFilterBarButtonItem](self, "toolbarSortAndFilterBarButtonItem");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setMenu:", v26);

        objc_destroyWeak(v33);
        objc_destroyWeak(v35);
        objc_destroyWeak(&location);
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "px_descriptionForAssertionMessage");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 865, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("filterMenuElement"), v30, v32, &v40, &v42, v36, v37, v38, v39);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 865, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("filterMenuElement"), v30);
    }

    goto LABEL_10;
  }
}

- (id)_peopleSortAndFilterMenu
{
  id v3;
  int64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[PUPickerContainerController peopleSortOrderType](self, "peopleSortOrderType");
  if (v4 == 1)
  {
    v5 = CFSTR("arrow.up.to.line");
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    v5 = CFSTR("arrow.down.to.line");
LABEL_5:
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:
  v7 = (void *)MEMORY[0x1E0DC3428];
  PXLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __55__PUPickerContainerController__peopleSortAndFilterMenu__block_invoke;
  v22[3] = &unk_1E58AB5D0;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, v6, 0, v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3428];
  PXLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __55__PUPickerContainerController__peopleSortAndFilterMenu__block_invoke_2;
  v20[3] = &unk_1E58AB5D0;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v12, 0, 0, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[PUPickerContainerController peopleSortOrderType](self, "peopleSortOrderType");
  if ((unint64_t)(v14 - 1) < 2)
  {
    objc_msgSend(v10, "setState:", 1);
    v15 = 0;
LABEL_11:
    objc_msgSend(v13, "setState:", v15);
    goto LABEL_12;
  }
  if (!v14)
  {
    objc_msgSend(v10, "setState:", 0);
    v15 = 1;
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v3, "addObject:", v10);
  objc_msgSend(v3, "addObject:", v13);
  v16 = (void *)MEMORY[0x1E0DC39D0];
  PXLocalizedString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "menuWithTitle:children:", v17, v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
  return v18;
}

- (void)setReplacesConfirmationButtonWithActivityIndicator:(BOOL)a3
{
  if (self->_replacesConfirmationButtonWithActivityIndicator != a3)
  {
    self->_replacesConfirmationButtonWithActivityIndicator = a3;
    -[PUPickerContainerController updateBars](self, "updateBars");
  }
}

- (void)navigationWillPresentViewController:(id)a3
{
  id v4;

  v4 = a3;
  -[PUPickerContainerController updateBars](self, "updateBars");
  -[PUPickerContainerController _updateInteractiveBarTransition](self, "_updateInteractiveBarTransition");
  -[PUPickerContainerController _updateLastVisiblePhotosViewController:](self, "_updateLastVisiblePhotosViewController:", v4);

}

- (void)updateBars
{
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 949, CFSTR("%s must be called on the main thread"), "-[PUPickerContainerController updateBars]");

  }
  -[PUPickerContainerController _cleanUpInteractiveBarTransitionIfNeeded](self, "_cleanUpInteractiveBarTransitionIfNeeded");
  -[PUPickerContainerController _updateNavigationBar](self, "_updateNavigationBar");
  -[PUPickerContainerController _updateToolbar](self, "_updateToolbar");
}

- (void)searchWithString:(id)a3
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
  id v13;

  v13 = a3;
  if (_os_feature_enabled_impl())
  {
    -[PUPickerContainerController searchBar](self, "searchBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v13);
    objc_msgSend(v4, "updateSearchText:", v5);
  }
  else
  {
    -[PUPickerContainerController searchController](self, "searchController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "searchTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[PUPickerContainerController _searchWithString:tokens:](self, "_searchWithString:tokens:", v13, MEMORY[0x1E0C9AA60]);
      goto LABEL_7;
    }
    -[PUPickerContainerController searchController](self, "searchController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchTextField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v13);

    -[PUPickerContainerController searchController](self, "searchController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchTextField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTokens:", MEMORY[0x1E0C9AA60]);

  }
LABEL_7:

}

- (void)resignSearchBarAsFirstResponder
{
  id v3;

  if (-[PUPickerContainerController searchBarIsFirstResponder](self, "searchBarIsFirstResponder"))
  {
    -[PUPickerContainerController firstResponder](self, "firstResponder");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resignFirstResponder");

  }
}

- (BOOL)hasContent
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  -[PUPickerContainerController photosViewController](self, "photosViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUPickerContainerController photosDataSourceManager](self, "photosDataSourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsAnyItems") & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      -[PUPickerContainerController photosDataSourceManager](self, "photosDataSourceManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v10, "isFiltered");

    }
    goto LABEL_8;
  }
  -[PUPickerContainerController peopleConfigController](self, "peopleConfigController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasContent");

  if ((v8 & 1) == 0)
  {
    if (_os_feature_enabled_impl())
    {
      -[PUPickerContainerController configuration](self, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "sourceType");

      if (v13 == 2)
      {
        -[PUPickerContainerController albumsViewController](self, "albumsViewController");
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v4 = (void *)v14;
        v6 = v14 != 0;
LABEL_8:

        return v6;
      }
      -[PUPickerContainerController configuration](self, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "sourceType");

      if (v16 == 5)
      {
        -[PUPickerContainerController collectionsViewController](self, "collectionsViewController");
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    return 0;
  }
  return 1;
}

- (BOOL)isShowingLiveWallpaperSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[PUPickerContainerController childViewControllers](self, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController photosViewController](self, "photosViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", v4))
  {
    -[PUPickerContainerController configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "showsWallpaperSuggestions"))
    {
      -[PUPickerContainerController pickerSuggestionResultFetcherResult](self, "pickerSuggestionResultFetcherResult");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isLiveWallpaperSuggestion");

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)selectedSuggestionAnalyticsName
{
  void *v2;
  void *v3;

  -[PUPickerContainerController pickerSuggestionResultFetcherResult](self, "pickerSuggestionResultFetcherResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "analyticsName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSidebarViewController:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id location;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 1003, CFSTR("%s must be called on the main thread"), "-[PUPickerContainerController setSidebarViewController:]");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_sidebarViewController);

  if (WeakRetained != v5)
  {
    objc_storeWeak((id *)&self->_sidebarViewController, v5);
    -[PUPickerContainerController updateBars](self, "updateBars");
    -[PUPickerContainerController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_navigationDestination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "selectItemForDestination:", v9);
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__PUPickerContainerController_setSidebarViewController___block_invoke;
    v11[3] = &unk_1E58A6790;
    v11[4] = self;
    objc_copyWeak(&v12, &location);
    -[PUPickerContainerController navigateToDestination:options:completionHandler:](self, "navigateToDestination:options:completionHandler:", v9, 0, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

- (void)scrollContentToInitialPosition
{
  id v2;

  -[PUPickerContainerController lastVisiblePhotosViewController](self, "lastVisiblePhotosViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pu_scrollToInitialPositionAnimated:", 1);

}

- (void)zoomInContent
{
  -[PUPickerContainerController _performPhotosGridActionIfPossible:](self, "_performPhotosGridActionIfPossible:", *MEMORY[0x1E0D7C640]);
}

- (void)zoomOutContent
{
  -[PUPickerContainerController _performPhotosGridActionIfPossible:](self, "_performPhotosGridActionIfPossible:", *MEMORY[0x1E0D7C648]);
}

- (PUPickerPrivacyBadge)photosIndicator
{
  void *v3;
  int v4;
  PUPickerPrivacyBadge *v5;
  PUPickerPrivacyBadge *photosIndicator;
  PUPickerPrivacyBadge *v7;

  if (!self->_photosIndicator)
  {
    -[PUPickerContainerController configuration](self, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldShowPhotosIndicator");

    if (v4)
    {
      v5 = objc_alloc_init(PUPickerPrivacyBadge);
      -[PUPickerPrivacyBadge setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
      photosIndicator = self->_photosIndicator;
      self->_photosIndicator = v5;
      v7 = v5;

      -[PUPickerPrivacyBadge setTranslatesAutoresizingMaskIntoConstraints:](self->_photosIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
  }
  return self->_photosIndicator;
}

- (PUPickerOnboardingHeaderView)onboardingHeaderView
{
  void *v3;
  int v4;
  PUPickerOnboardingHeaderView *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PUPickerOnboardingHeaderView *v12;
  PUPickerOnboardingHeaderView *onboardingHeaderView;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  if (!self->_onboardingHeaderView)
  {
    -[PUPickerContainerController configuration](self, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldShowOnboardingHeaderView");

    if (v4)
    {
      objc_initWeak(&location, self);
      v5 = [PUPickerOnboardingHeaderView alloc];
      -[PUPickerContainerController configuration](self, "configuration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pickerClientDisplayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPickerContainerController configuration](self, "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isLimitedLibraryPicker");
      v10 = (void *)MEMORY[0x1E0DC3428];
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __51__PUPickerContainerController_onboardingHeaderView__block_invoke;
      v18 = &unk_1E58AB5D0;
      objc_copyWeak(&v19, &location);
      objc_msgSend(v10, "actionWithHandler:", &v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PUPickerOnboardingHeaderView initWithClientDisplayName:isLimitedLibraryPicker:closeAction:](v5, "initWithClientDisplayName:isLimitedLibraryPicker:closeAction:", v7, v9, v11, v15, v16, v17, v18);
      onboardingHeaderView = self->_onboardingHeaderView;
      self->_onboardingHeaderView = v12;

      -[PUPickerOnboardingHeaderView setDelegate:](self->_onboardingHeaderView, "setDelegate:", self);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  return self->_onboardingHeaderView;
}

- (UIViewController)albumsViewController
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;

  if (!self->_albumsViewController)
  {
    -[PUPickerContainerController photosViewConfiguration](self, "photosViewConfiguration");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[PUPickerContainerController sessionInfo](self, "sessionInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[PUPickerContainerController configuration](self, "configuration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPickerContainerController photosViewConfiguration](self, "photosViewConfiguration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "loadingStatusManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPickerContainerController selectionCoordinator](self, "selectionCoordinator");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPickerContainerController sessionInfo](self, "sessionInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
LABEL_7:
            -[PUPickerContainerController photosViewConfiguration](self, "photosViewConfiguration");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUPickerContainerController _setupAlbumsViewControllerWithPickerConfiguration:loadingStatusManager:selectionCoordinator:sessionInfo:photosViewConfiguration:](self, "_setupAlbumsViewControllerWithPickerConfiguration:loadingStatusManager:selectionCoordinator:sessionInfo:photosViewConfiguration:", v8, v10, v11, v12, v13);

            -[PUPickerContainerController updateBars](self, "updateBars");
            return self->_albumsViewController;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "px_descriptionForAssertionMessage");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 1070, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.sessionInfo"), v16, v18);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 1070, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.sessionInfo"), v16);
        }

        goto LABEL_7;
      }
    }
  }
  return self->_albumsViewController;
}

- (id)albumsViewControllerIfLoaded
{
  return self->_albumsViewController;
}

- (UIViewController)collectionsViewController
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;

  if (!self->_collectionsViewController)
  {
    -[PUPickerContainerController photosViewConfiguration](self, "photosViewConfiguration");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[PUPickerContainerController sessionInfo](self, "sessionInfo");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
LABEL_8:

        return self->_collectionsViewController;
      }
      v7 = (void *)v6;
      -[PUPickerContainerController configuration](self, "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "sourceType");

      if (v9 == 5)
      {
        -[PUPickerContainerController configuration](self, "configuration");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPickerContainerController sessionInfo](self, "sessionInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
LABEL_7:
            -[PUPickerContainerController photosViewConfiguration](self, "photosViewConfiguration");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUPickerContainerController _setupCollectionsViewControllerWithPickerConfiguration:sessionInfo:photosViewConfiguration:](self, "_setupCollectionsViewControllerWithPickerConfiguration:sessionInfo:photosViewConfiguration:", v5, v10, v11);

            goto LABEL_8;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "px_descriptionForAssertionMessage");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 1084, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.sessionInfo"), v15, v17);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 1084, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.sessionInfo"), v15);
        }

        goto LABEL_7;
      }
    }
  }
  return self->_collectionsViewController;
}

- (void)photosGridActionPerformer:(id)a3 contentFilterStateChanged:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  -[PUPickerContainerController photosViewController](self, "photosViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__PUPickerContainerController_photosGridActionPerformer_contentFilterStateChanged___block_invoke;
  v9[3] = &unk_1E58A67D8;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "performChanges:", v9);

  -[PUPickerContainerController _updateSortAndFilterMenu](self, "_updateSortAndFilterMenu");
}

- (BOOL)searchBarIsFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (_os_feature_enabled_impl())
  {
    -[PUPickerContainerController searchBar](self, "searchBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[PUPickerContainerController firstResponder](self, "firstResponder");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        -[PUPickerContainerController searchBar](self, "searchBar");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPickerContainerController firstResponder](self, "firstResponder");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v5, "_containsResponder:", v6);

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    -[PUPickerContainerController searchController](self, "searchController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "isActive");
  }

  return v7;
}

- (UIViewController)itemsViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  -[PUPickerContainerController unavailableViewController](self, "unavailableViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUPickerContainerController unavailableViewController](self, "unavailableViewController");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v8 = (void *)v4;
    return (UIViewController *)v8;
  }
  -[PUPickerContainerController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPeopleOrPetsPicker");

  if (!v6)
  {
    -[PUPickerContainerController photosViewController](self, "photosViewController");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[PUPickerContainerController peopleConfigController](self, "peopleConfigController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v8;
}

- (void)_addOrReplaceItemViewControllerWithViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
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
  void *v32;
  id v33;

  v33 = a3;
  -[PUPickerContainerController px_addOrReplaceChildViewController:activateConstraints:](self, "px_addOrReplaceChildViewController:activateConstraints:", v33, 0);
  -[PUPickerContainerController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "userInterfaceIdiom") != 6)
  {

    goto LABEL_5;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_5:
    objc_msgSend(v4, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController setTopConstraint:](self, "setTopConstraint:", v18);

    objc_msgSend(v4, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController setBottomConstraint:](self, "setBottomConstraint:", v14);
    goto LABEL_6;
  }
  objc_msgSend(v4, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController setTopConstraint:](self, "setTopConstraint:", v11);

  objc_msgSend(v4, "safeAreaLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController setBottomConstraint:](self, "setBottomConstraint:", v15);

LABEL_6:
  objc_msgSend(v4, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController setLeadingConstraint:](self, "setLeadingConstraint:", v21);

  objc_msgSend(v4, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController setTrailingConstraint:](self, "setTrailingConstraint:", v24);

  objc_msgSend(v4, "safeAreaLayoutGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController setTopSafeAreaConstraint:](self, "setTopSafeAreaConstraint:", v28);

  objc_msgSend(v4, "safeAreaLayoutGuide");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController setBottomSafeAreaConstraint:](self, "setBottomSafeAreaConstraint:", v32);

  objc_msgSend(v4, "setNeedsUpdateConstraints");
  -[PUPickerContainerController _updateLastVisiblePhotosViewController:](self, "_updateLastVisiblePhotosViewController:", v33);

}

- (void)_performPhotosGridActionIfPossible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUPickerContainerController lastVisiblePhotosViewController](self, "lastVisiblePhotosViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gridActionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "canPerformActionType:", v4))
  {
    objc_msgSend(v7, "actionPerformerForActionType:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__PUPickerContainerController__performPhotosGridActionIfPossible___block_invoke;
    v10[3] = &unk_1E58AB060;
    v11 = v4;
    objc_msgSend(v8, "performActionWithCompletionHandler:", v10);

    v9 = v11;
  }
  else
  {
    PLPickerGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "Can't perform action type %@", buf, 0xCu);
    }
  }

}

- (void)_updateFilterPredicate
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  if (_os_feature_enabled_impl())
  {
    -[PUPickerContainerController searchResultUUIDs](self, "searchResultUUIDs");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
      goto LABEL_10;
  }
  else
  {
    -[PUPickerContainerController searchQueryResult](self, "searchQueryResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEmpty");

    if ((v6 & 1) == 0)
    {
      -[PUPickerContainerController searchQueryResult](self, "searchQueryResult");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "searchAssetResults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PXMap();
      v3 = (id)objc_claimAutoreleasedReturnValue();

      if (v3)
        goto LABEL_10;
    }
  }
  -[PUPickerContainerController pickerSuggestionResultFetcherResult](self, "pickerSuggestionResultFetcherResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v3 = 0;
    goto LABEL_11;
  }
  PXMap();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = (void *)MEMORY[0x1E0C9AA60];
  if (v11)
    v13 = (void *)v11;
  v3 = v13;

LABEL_10:
  -[PUPickerContainerController _updatePhotosViewControllerNoContentPlaceholder](self, "_updatePhotosViewControllerNoContentPlaceholder");
LABEL_11:
  -[PUPickerContainerController photosDataSourceManager](self, "photosDataSourceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53__PUPickerContainerController__updateFilterPredicate__block_invoke_3;
  v17[3] = &unk_1E58A6880;
  v18 = v3;
  v15 = v3;
  objc_msgSend(v14, "performChanges:", v17);

  -[PUPickerContainerController _updateSortOrder](self, "_updateSortOrder");
  -[PUPickerContainerController _updateSortDescriptors](self, "_updateSortDescriptors");
  -[PUPickerContainerController _updateNumberOfItemsToPlayInline](self, "_updateNumberOfItemsToPlayInline");
  -[PUPickerContainerController _updateNavigationBar](self, "_updateNavigationBar");
  -[PUPickerContainerController photosViewController](self, "photosViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pu_scrollToInitialPositionAnimated:", 0);

}

- (void)_updatePhotosViewControllerNoContentPlaceholder
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  _QWORD v19[4];
  id v20;
  id v21;

  -[PUPickerContainerController pickerSuggestionResultFetcherResult](self, "pickerSuggestionResultFetcherResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedFilterableSuggestion");

  if (v4
    && (-[PUPickerContainerController configuration](self, "configuration"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isProcessingSuggestions"),
        v5,
        v6))
  {
    PXLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "suggestionGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isForWallpaper");

    if ((v10 & 1) != 0
      || (-[PUPickerContainerController configuration](self, "configuration"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "generatedFilter"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "containsStickersFilter"),
          v17,
          v16,
          v18))
    {
      PXLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
    v7 = 0;
  }
  -[PUPickerContainerController photosViewController](self, "photosViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewModelIfLoaded");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__PUPickerContainerController__updatePhotosViewControllerNoContentPlaceholder__block_invoke;
  v19[3] = &unk_1E58A68A8;
  v20 = v7;
  v21 = v11;
  v14 = v11;
  v15 = v7;
  objc_msgSend(v13, "performChanges:", v19);

}

- (void)_updateSortOrder
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PUPickerContainerController photosDataSourceManager](self, "photosDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;

    if (v4)
    {
      -[PUPickerContainerController pickerSuggestionResultFetcherResult](self, "pickerSuggestionResultFetcherResult");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "shouldReverseSortOrder");

      objc_msgSend(v4, "photosDataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setReverseSortOrder:", v6 == 0);

      goto LABEL_9;
    }
  }
  else
  {

  }
  PLPickerGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = 0;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Can't update sort order because the data source manager (%@) is not PhotoKit based.", (uint8_t *)&v9, 0xCu);
  }

  v4 = 0;
LABEL_9:

}

- (void)_updateSortDescriptors
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  -[PUPickerContainerController photosDataSourceManager](self, "photosDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;

    if (v4)
    {
      if (-[PUPickerContainerController isShowingLiveWallpaperSuggestions](self, "isShowingLiveWallpaperSuggestions"))
      {
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("mediaAnalysisAttributes.activityScore"), 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v5;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("mediaAnalysisAttributes.wallpaperScore"), 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = v6;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("favorite"), 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2] = v7;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v25[3] = v8;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v25[4] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "photosDataSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSortDescriptors:", v10);

      }
      else
      {
        -[PUPickerContainerController configuration](self, "configuration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "showsWallpaperSuggestions");

        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = v5;
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v24[1] = v6;
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v24[2] = v7;
          v16 = (void *)MEMORY[0x1E0C99D20];
          v17 = v24;
        }
        else
        {
          -[PUPickerContainerController configuration](self, "configuration");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "customSortDescriptors");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            -[PUPickerContainerController configuration](self, "configuration");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "customSortDescriptors");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "photosDataSource");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setSortDescriptors:", v6);
            goto LABEL_16;
          }
          if (-[PUPickerContainerController assetSortOrderType](self, "assetSortOrderType") != 1)
          {
            objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            v22[0] = v5;
            objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sortToken"), 1);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v22[1] = v6;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "photosDataSource");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setSortDescriptors:", v7);
            goto LABEL_15;
          }
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = v5;
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v23[1] = v6;
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v23[2] = v7;
          v16 = (void *)MEMORY[0x1E0C99D20];
          v17 = v23;
        }
        objc_msgSend(v16, "arrayWithObjects:count:", v17, 3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "photosDataSource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setSortDescriptors:", v8);
      }

LABEL_15:
LABEL_16:

      goto LABEL_10;
    }
  }
  else
  {

  }
  PLPickerGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v20 = 138412290;
    v21 = 0;
    _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "Can't update sort descriptors because the data source manager (%@) is not PhotoKit based.", (uint8_t *)&v20, 0xCu);
  }

  v4 = 0;
LABEL_10:
  -[PUPickerContainerController photosViewController](self, "photosViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invalidateHeaderView");

}

- (void)_updatePeopleSort
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[PUPickerContainerController peopleSortOrderType](self, "peopleSortOrderType");
  if (v3 == 2)
    v4 = 2;
  else
    v4 = v3 == 1;
  v5 = (void *)MEMORY[0x1E0D7B6B8];
  -[PUPickerContainerController configuration](self, "configuration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortOrder:toPhotoLibrary:", v4, v6);

}

- (void)_updateNumberOfItemsToPlayInline
{
  void *v3;
  uint64_t v4;
  BOOL IsReduceMotionEnabled;
  void *v6;
  id v7;

  -[PUPickerContainerController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "shouldDisableInlinePlayback") & 1) != 0)
  {
    v4 = 0;
LABEL_8:

    goto LABEL_9;
  }
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();

  if (IsReduceMotionEnabled)
  {
    v4 = 0;
  }
  else
  {
    if (!-[PUPickerContainerController _isConfiguredForStickerSuggestionGroup](self, "_isConfiguredForStickerSuggestionGroup"))
    {
      -[PUPickerContainerController pickerSuggestionResultFetcherResult](self, "pickerSuggestionResultFetcherResult");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "numberOfItemsToPlayInline");
      goto LABEL_8;
    }
    v4 = 3;
  }
LABEL_9:
  -[PUPickerContainerController photosViewController](self, "photosViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfItemsToPlayInline:", v4);

}

- (void)_updateNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  -[PUPickerContainerController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController sidebarViewController](self, "sidebarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPickerContainerController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  -[PUPickerContainerController childViewControllers](self, "childViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController photosViewController](self, "photosViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  v10 = 0;
  if (-[PUPickerContainerController hasContent](self, "hasContent") && v9)
    v10 = objc_msgSend(v3, "allowsSearchBar");
  v11 = 0;
  if (-[PUPickerContainerController hasContent](self, "hasContent") && !v4)
    v11 = objc_msgSend(v3, "allowsSegmentedControl");
  if (v9)
  {
    objc_msgSend(v3, "suggestionGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v12 != 0;

  }
  else
  {
    v57 = 0;
  }
  if (v6 == 5 && (objc_msgSend(v3, "allowsToolbar") & 1) != 0)
  {
    v13 = 0;
    v14 = 0;
    if (!v11)
      goto LABEL_13;
LABEL_17:
    -[PUPickerContainerController navigationBarSegmentedControl](self, "navigationBarSegmentedControl");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[PUPickerContainerController searchController](self, "searchController");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  -[PUPickerContainerController traitCollection](self, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController _cancellationBarButtonItemWithTraitCollection:](self, "_cancellationBarButtonItemWithTraitCollection:", v17);
  v13 = objc_claimAutoreleasedReturnValue();

  -[PUPickerContainerController traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController _confirmationBarButtonItemWithTraitCollection:](self, "_confirmationBarButtonItemWithTraitCollection:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_17;
LABEL_13:
  if (!v10)
  {
    v63 = 0;
    goto LABEL_20;
  }
  -[PUPickerContainerController searchController](self, "searchController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v6 == 5)
  {
    objc_msgSend(v15, "searchBar");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
    v62 = 0;
    goto LABEL_21;
  }
  v62 = v15;
  v63 = 0;
LABEL_21:
  v59 = v3;
  v19 = objc_msgSend(v3, "allowsNavigationBar");
  -[PUPickerContainerController sidebarViewController](self, "sidebarViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "navigationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "navigationBar");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPickerContainerController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "navigationBar");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPickerContainerController sidebarViewController](self, "sidebarViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "navigationItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPickerContainerController navigationItem](self, "navigationItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController configuration](self, "configuration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "supportsInteractiveBarTransition");

  if ((v27 & 1) == 0)
    objc_msgSend(v60, "setHidden:", v19 ^ 1u);
  -[PUPickerContainerController childViewControllers](self, "childViewControllers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "title");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController setTitle:](self, "setTitle:", v30);

  objc_msgSend(v24, "setLeftBarButtonItem:", v13);
  objc_msgSend(v24, "leftBarButtonItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(v61, "setHidden:", 0);
  }
  else
  {
    objc_msgSend(v24, "rightBarButtonItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setHidden:", v32 == 0);

  }
  v58 = (void *)v13;
  if (v24)
    v33 = 0;
  else
    v33 = v13;
  objc_msgSend(v25, "setLeftBarButtonItem:", v33);
  objc_msgSend(v25, "setTitleView:", v63);
  if (-[PUPickerContainerController _isConfiguredForRetailExperience](self, "_isConfiguredForRetailExperience"))
  {
    PXLocalizedString();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController configuration](self, "configuration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v35, "selectionLimit");
    PXLocalizedStringWithValidatedFormat();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPrompt:", v36, v56);

  }
  v37 = v9 ^ 1u;
  objc_msgSend(v25, "setSearchController:", v62);
  objc_msgSend(v25, "setPreferredSearchBarPlacement:", 2);
  -[PUPickerContainerController searchBar](self, "searchBar");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setHidden:", v10 ^ 1u);

  -[PUPickerContainerController pickerSuggestionsView](self, "pickerSuggestionsView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setHidden:", !v57);

  -[PUPickerContainerController navigationBarBottomPalette](self, "navigationBarBottomPalette");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setHidden:", (v10 | v57) ^ 1u);

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  -[PUPickerContainerController navigationController](self, "navigationController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "viewControllers");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v65 != v45)
          objc_enumerationMutation(v42);
        objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "navigationItem");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setRightBarButtonItem:", v14);

      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    }
    while (v44);
  }

  -[PUPickerContainerController navigationBarSegmentedControl](self, "navigationBarSegmentedControl");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setSelectedSegmentIndex:", v37);

  -[PUPickerContainerController pickerSuggestionsView](self, "pickerSuggestionsView");
  v49 = objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v50 = (void *)v49;
    -[PUPickerContainerController pickerSuggestionsView](self, "pickerSuggestionsView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "isHidden");

    v53 = v58;
    if ((v52 & 1) != 0)
    {
      v54 = 0;
    }
    else
    {
      v54 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
      objc_msgSend(v54, "configureWithDefaultBackground");
    }
    v55 = v59;
  }
  else
  {
    v54 = 0;
    v53 = v58;
    v55 = v59;
  }
  objc_msgSend(v60, "setScrollEdgeAppearance:", v54);

}

- (void)_updateToolbar
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  char v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  -[PUPickerContainerController _updateSelectionStatusBarButtonItem](self, "_updateSelectionStatusBarButtonItem");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController _updateSortAndFilterMenu](self, "_updateSortAndFilterMenu");
  -[PUPickerContainerController childViewControllers](self, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController itemsViewController](self, "itemsViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  -[PUPickerContainerController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "isAddToAlbumPicker");

  if ((_DWORD)v4)
  {
    -[PUPickerContainerController toolbarNewAlbumBarButton](self, "toolbarNewAlbumBarButton");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUPickerContainerController configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "excludesSortAndFilterMenuWithPhotosTabSelected:", v5) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      -[PUPickerContainerController configuration](self, "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "showsWallpaperSuggestions") & 1) != 0)
      {
        v7 = 0;
      }
      else
      {
        -[PUPickerContainerController toolbarSortAndFilterBarButtonItem](self, "toolbarSortAndFilterBarButtonItem");
        v7 = objc_claimAutoreleasedReturnValue();
      }

    }
  }
  -[PUPickerContainerController configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "excludesOptionsMenu") & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    -[PUPickerContainerController toolbarOptionsBarButton](self, "toolbarOptionsBarButton");
    v11 = objc_claimAutoreleasedReturnValue();
  }

  -[PUPickerContainerController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if (v13 == 5)
  {
    -[PUPickerContainerController traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController _cancellationBarButtonItemWithTraitCollection:](self, "_cancellationBarButtonItemWithTraitCollection:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    -[PUPickerContainerController traitCollection](self, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController _confirmationBarButtonItemWithTraitCollection:](self, "_confirmationBarButtonItemWithTraitCollection:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
    v17 = 0;
  }
  -[PUPickerContainerController showSelectedButtonTitleButton](self, "showSelectedButtonTitleButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isEnabled") & 1) != 0)
  {
    v19 = 1;
  }
  else
  {
    -[PUPickerContainerController showSelectedButtonSubtitleLabel](self, "showSelectedButtonSubtitleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v20, "isHidden") ^ 1;

  }
  if (v15)
    v21 = 1;
  else
    v21 = v19;
  if (v17)
    v21 = 1;
  if (v7)
    v21 = 1;
  v46 = (void *)v11;
  if (v11)
    v22 = 1;
  else
    v22 = v21;
  -[PUPickerContainerController configuration](self, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "allowsToolbar");

  objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = v26;
  if (v7)
    objc_msgSend(v26, "addObject:", v7);
  v45 = (void *)v7;
  -[PUPickerContainerController traitCollection](self, "traitCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "userInterfaceIdiom");

  if (v29 == 5 && v46)
    objc_msgSend(v27, "addObject:", v46);
  v31 = v24 & v22;
  if (v47)
    v32 = v19;
  else
    v32 = 0;
  if (v32 == 1)
  {
    objc_msgSend(v27, "addObject:", v25);
    objc_msgSend(v27, "addObject:", v47);
    objc_msgSend(v27, "addObject:", v25);
  }
  if (v15 | v17)
  {
    if (!v47 && v45)
      objc_msgSend(v27, "addObject:", v25);
    if (v15)
    {
      objc_msgSend(v27, "addObject:", v15);
      if (!v17)
        goto LABEL_54;
      objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 8.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v33);

      v30 = (void *)v17;
    }
    else
    {
      v30 = (void *)v17;
      if (!v17)
        goto LABEL_54;
    }
  }
  else
  {
    if (!v46)
      goto LABEL_54;
    if (v45)
      v34 = v32;
    else
      v34 = 1;
    v30 = v46;
    if ((v34 & 1) == 0)
    {
      objc_msgSend(v27, "addObject:", v25);
      v30 = v46;
    }
  }
  objc_msgSend(v27, "addObject:", v30);
LABEL_54:
  v35 = (void *)objc_msgSend(v27, "copy", v30);
  -[PUPickerContainerController navigationController](self, "navigationController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setToolbarHidden:", v31 ^ 1u);

  -[PUPickerContainerController albumsViewControllerIfLoaded](self, "albumsViewControllerIfLoaded");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "px_barAppearance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __45__PUPickerContainerController__updateToolbar__block_invoke;
  v52[3] = &__block_descriptor_33_e34_v16__0___PXMutableBarAppearance__8l;
  v53 = v31;
  objc_msgSend(v38, "performChangesWithAnimationOptions:changes:", 0, v52);

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[PUPickerContainerController navigationController](self, "navigationController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "viewControllers");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v49 != v43)
          objc_enumerationMutation(v40);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "setToolbarItems:", v35);
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v42);
  }

}

- (id)_cancellationBarButtonItemWithTraitCollection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "userInterfaceIdiom");
  -[PUPickerContainerController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "cancellationBehaviorWithTraitCollection:", v4);

  objc_initWeak(&location, self);
  switch(v7)
  {
    case 3:
      v12 = (void *)MEMORY[0x1E0DC3428];
      PXLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __77__PUPickerContainerController__cancellationBarButtonItemWithTraitCollection___block_invoke_3;
      v30 = &unk_1E58AB5D0;
      v10 = &v31;
      objc_copyWeak(&v31, &location);
      objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v9, 0, 0, &v27);
      v11 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      v13 = (void *)MEMORY[0x1E0DC3428];
      PXLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __77__PUPickerContainerController__cancellationBarButtonItemWithTraitCollection___block_invoke_2;
      v32[3] = &unk_1E58AB5D0;
      v10 = &v33;
      objc_copyWeak(&v33, &location);
      objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v9, 0, 0, v32);
      v11 = objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      v8 = (void *)MEMORY[0x1E0DC3428];
      PXLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __77__PUPickerContainerController__cancellationBarButtonItemWithTraitCollection___block_invoke;
      v34[3] = &unk_1E58AB5D0;
      v10 = &v35;
      objc_copyWeak(&v35, &location);
      objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, 0, 0, v34);
      v11 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v20 = 0;
      v14 = 0;
      goto LABEL_24;
  }
  v14 = (void *)v11;

  objc_destroyWeak(v10);
  if (!v14)
  {
    v20 = 0;
    goto LABEL_24;
  }
  if (v5 != 5)
  {
    if (v7 == 3)
    {
      v21 = objc_alloc(MEMORY[0x1E0DC34F0]);
      v22 = 24;
    }
    else
    {
      if (v7 != 2)
      {
        v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithPrimaryAction:", v14);
LABEL_19:
        v20 = (void *)v23;
        if (!v23)
          goto LABEL_24;
        goto LABEL_20;
      }
      v21 = objc_alloc(MEMORY[0x1E0DC34F0]);
      v22 = 1;
    }
    v23 = objc_msgSend(v21, "initWithBarButtonSystemItem:primaryAction:", v22, v14, v27, v28, v29, v30);
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMacIdiomStyle:", 1);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintGreaterThanOrEqualToConstant:", 72.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addConstraints:", v19);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v16);
  if (!v20)
    goto LABEL_24;
LABEL_20:
  if ((unint64_t)(v7 - 2) >= 2)
  {
    if (v7 == 1)
    {
      -[PUPickerContainerController selectionCoordinator](self, "selectionCoordinator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "selectedObjectIDs");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setEnabled:", objc_msgSend(v25, "count") != 0);

    }
  }
  else
  {
    objc_msgSend(v20, "setEnabled:", 1);
  }
LABEL_24:

  objc_destroyWeak(&location);
  return v20;
}

- (id)_confirmationBarButtonItemWithTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v27;
  unint64_t v28;
  _QWORD v29[4];
  id v30;
  id location;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUPickerContainerController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController selectionCoordinator](self, "selectionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedObjectIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!-[PUPickerContainerController hasContent](self, "hasContent"))
    goto LABEL_12;
  v9 = objc_msgSend(v5, "confirmationBehavior");
  if (v9)
  {
    if (v9 != 1 && v9 != 3)
      goto LABEL_12;
    v27 = v8;
    if (!-[PUPickerContainerController replacesConfirmationButtonWithActivityIndicator](self, "replacesConfirmationButtonWithActivityIndicator"))goto LABEL_9;
LABEL_8:
    v10 = &stru_1E58AD278;
    goto LABEL_10;
  }
  v27 = v8;
  if (-[PUPickerContainerController replacesConfirmationButtonWithActivityIndicator](self, "replacesConfirmationButtonWithActivityIndicator"))
  {
    goto LABEL_8;
  }
LABEL_9:
  PXLocalizedString();
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_12:
    v19 = 0;
    goto LABEL_33;
  }
LABEL_10:
  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E0DC3428];
  v29[1] = 3221225472;
  v29[2] = __77__PUPickerContainerController__confirmationBarButtonItemWithTraitCollection___block_invoke;
  v29[3] = &unk_1E58AB5D0;
  v29[0] = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v30, &location);
  objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v10, 0, 0, v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom") == 5)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "tintedButtonConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMacIdiomStyle:", 1);
    objc_msgSend(v13, "setShowsActivityIndicator:", -[PUPickerContainerController replacesConfirmationButtonWithActivityIndicator](self, "replacesConfirmationButtonWithActivityIndicator"));
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintGreaterThanOrEqualToConstant:", 72.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addConstraints:", v17);

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v14);
LABEL_15:
    v19 = (void *)v18;

    goto LABEL_17;
  }
  if (-[PUPickerContainerController replacesConfirmationButtonWithActivityIndicator](self, "replacesConfirmationButtonWithActivityIndicator"))
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShowsActivityIndicator:", 1);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v14);
    goto LABEL_15;
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithPrimaryAction:", v12);
LABEL_17:
  objc_msgSend(v19, "setStyle:", 2, v27);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  if (!v19)
    goto LABEL_33;
  v20 = objc_msgSend(v5, "confirmationBehavior");
  if (v20 < 2)
  {
    v21 = (objc_msgSend(v5, "allowsUnlimitedMultipleSelection") & 1) != 0 || v28 <= objc_msgSend(v5, "selectionLimit");
    v23 = objc_msgSend(v5, "allowsEmptySelection");
    if (v28)
      v24 = 1;
    else
      v24 = v23;
    v22 = v24 & v21;
    goto LABEL_28;
  }
  if (v20 == 3)
  {
    v22 = 1;
LABEL_28:
    objc_msgSend(v19, "setEnabled:", v22);
  }
  if (objc_msgSend(v19, "isEnabled"))
    v25 = -[PUPickerContainerController replacesConfirmationButtonWithActivityIndicator](self, "replacesConfirmationButtonWithActivityIndicator") ^ 1;
  else
    v25 = 0;
  objc_msgSend(v19, "setEnabled:", v25);
LABEL_33:

  return v19;
}

- (id)_updateSelectionStatusBarButtonItem
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  unsigned int v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  _QWORD v92[4];
  id v93;
  id v94;
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[4];

  v98[2] = *MEMORY[0x1E0C80C00];
  -[PUPickerContainerController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController peopleConfigController](self, "peopleConfigController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isPeoplePicker");
  v6 = objc_msgSend(v3, "isPetsPicker");
  v7 = objc_msgSend(v3, "isPeopleAndPetsPicker");
  if (objc_msgSend(v3, "isPeopleOrPetsPicker"))
    v8 = objc_msgSend(v4, "shouldActLikeSingleSelectPicker");
  else
    v8 = 0;
  if (objc_msgSend(v3, "isAlbumPicker"))
    v9 = objc_msgSend(v3, "selectionLimit") == 1;
  else
    v9 = 0;
  v10 = objc_msgSend(v3, "isCollectionsPicker");
  v11 = 0;
  if (((!-[PUPickerContainerController hasContent](self, "hasContent") | v8) & 1) == 0 && !v9 && (v10 & 1) == 0)
  {
    if ((objc_msgSend(v3, "isAddToAlbumPicker") & 1) != 0)
    {
      v11 = 0;
      goto LABEL_95;
    }
    -[PUPickerContainerController selectionCoordinator](self, "selectionCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectedObjectIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "generatedFilter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayAssetMediaType");

    v16 = objc_msgSend(v14, "count");
    if ((objc_msgSend(v3, "isSingleSelection") & 1) != 0)
    {
      v17 = 0;
      goto LABEL_40;
    }
    if (v16 < 1)
    {
      if (!v7 && !v6 && !v5 && !objc_msgSend(v3, "isAlbumPicker"))
        objc_msgSend(v3, "isCollectionsPicker");
      PXLocalizedString();
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7
        || v6
        || v5
        || objc_msgSend(v3, "isAlbumPicker")
        || objc_msgSend(v3, "isCollectionsPicker"))
      {
        PXLocalizedString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v16;
        PXLocalizedStringWithValidatedFormat();
        v19 = objc_claimAutoreleasedReturnValue();
LABEL_33:
        v17 = (void *)v19;

        goto LABEL_40;
      }
      if ((objc_msgSend(v3, "allowsOpeningStagingArea") & 1) != 0)
      {
        PXLocalizedString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v16;
        PULocalizedStringWithValidatedFormat(v18, CFSTR("%lu"));
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
      objc_msgSend(v3, "generatedFilter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "photoLibrary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "displayAssetMediaTypeConsideringAssetObjectIDs:photoLibrary:", v14, v21);

      PXLocalizedSelectionMessageForAssetsCount();
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v22;
LABEL_40:
    if (objc_msgSend(v3, "isLimitedLibraryPicker", v73))
    {
      objc_msgSend(v3, "hasPreselection");
      PXLocalizedString();
      v27 = objc_claimAutoreleasedReturnValue();
LABEL_61:
      v26 = 0;
      goto LABEL_62;
    }
    -[PUPickerContainerController configuration](self, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "excludesOptionsMenu") && objc_msgSend(v3, "allowsDownscaling"))
    {

      if (v16 >= 1)
      {
        -[PUPickerContainerController resizeTaskDescriptorViewModel](self, "resizeTaskDescriptorViewModel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedFileSizeDescription");
        v25 = objc_claimAutoreleasedReturnValue();
LABEL_60:
        v27 = v25;

        goto LABEL_61;
      }
    }
    else
    {

    }
    if (objc_msgSend(v3, "selectionLimit") <= 1 || v16 < 1 || v16 < objc_msgSend(v3, "selectionLimit") - 10)
    {
      if ((objc_msgSend(v3, "excludesLocationMetadataSubtitle") & 1) != 0)
      {
        v26 = 0;
        v27 = 0;
      }
      else
      {
        -[PUPickerContainerController additionalSelectionState](self, "additionalSelectionState");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "shouldIncludeLocation");

        PXLocalizedString();
        v27 = objc_claimAutoreleasedReturnValue();
        if (v29)
          v30 = CFSTR("location.fill");
        else
          v30 = CFSTR("location.slash");
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v30);
        v26 = objc_claimAutoreleasedReturnValue();
      }
LABEL_62:
      if (v17)
        v32 = v17;
      else
        v32 = (void *)v27;
      if (v17)
        v33 = 0;
      else
        v33 = (void *)v26;
      if (v17)
        v34 = (void *)v27;
      else
        v34 = 0;
      v84 = (void *)v26;
      if (v17)
        v35 = (void *)v26;
      else
        v35 = 0;
      v91 = v32;
      v90 = v33;
      v36 = v34;
      v89 = v35;
      if (v16 < 1)
        v37 = 0;
      else
        v37 = objc_msgSend(v3, "allowsOpeningStagingArea");
      -[PUPickerContainerController showSelectedButtonTitleButton](self, "showSelectedButtonTitleButton", v74);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPickerContainerController showSelectedButtonSubtitleLabel](self, "showSelectedButtonSubtitleLabel");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v14;
      v88 = v36;
      v85 = (void *)v27;
      v86 = v17;
      v83 = v37;
      v82 = v38;
      if (v91)
      {
        objc_msgSend(v38, "titleLabel");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "font");
        v80 = objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          if (v37)
            v41 = 0;
          else
            v41 = 2;
          objc_msgSend(v38, "titleColorForState:", v41);
          v42 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v39, "textColor");
          v42 = objc_claimAutoreleasedReturnValue();
        }
        v45 = (void *)v42;
        v46 = *MEMORY[0x1E0DC1140];
        v97[0] = *MEMORY[0x1E0DC1138];
        v97[1] = v46;
        v47 = (void *)v80;
        v98[0] = v80;
        v98[1] = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v91);
        objc_msgSend(v49, "addAttributes:range:", v48, 0, objc_msgSend(v91, "length"));
        if (v90)
        {
          v50 = objc_msgSend(v91, "rangeOfString:", CFSTR("{symbol}"));
          if (v50 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v52 = v50;
            v53 = (void *)MEMORY[0x1E0CB3498];
            v76 = v51;
            objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v90);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "attributedStringWithAttachment:", v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = v4;
            v56 = (void *)objc_msgSend(v55, "mutableCopy");

            v47 = (void *)v80;
            objc_msgSend(v56, "addAttributes:range:", v48, 0, 1);
            objc_msgSend(v49, "replaceCharactersInRange:withAttributedString:", v52, v76, v56);

            v4 = v78;
          }
        }
        v43 = (void *)objc_msgSend(v49, "copy");

        v36 = v88;
        if (v88)
          goto LABEL_90;
      }
      else
      {
        v43 = 0;
        if (v36)
        {
LABEL_90:
          objc_msgSend(v39, "font");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "textColor");
          v58 = objc_claimAutoreleasedReturnValue();
          v59 = *MEMORY[0x1E0DC1140];
          v95[0] = *MEMORY[0x1E0DC1138];
          v95[1] = v59;
          v96[0] = v57;
          v96[1] = v58;
          v81 = (void *)v58;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v36);
          objc_msgSend(v61, "addAttributes:range:", v60, 0, objc_msgSend(v36, "length"));
          if (v89)
          {
            v62 = objc_msgSend(v36, "rangeOfString:", CFSTR("{symbol}"));
            if (v62 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v64 = v62;
              v65 = (void *)MEMORY[0x1E0CB3498];
              v75 = v63;
              objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v89);
              v79 = v4;
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "attributedStringWithAttachment:", v66);
              v77 = v57;
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = (void *)objc_msgSend(v67, "mutableCopy");

              v57 = v77;
              v4 = v79;
              objc_msgSend(v68, "addAttributes:range:", v60, 0, 1);
              objc_msgSend(v61, "replaceCharactersInRange:withAttributedString:", v64, v75, v68);

            }
          }
          v44 = (void *)objc_msgSend(v61, "copy");

          goto LABEL_94;
        }
      }
      v44 = 0;
LABEL_94:
      v69 = (void *)MEMORY[0x1E0DC3F10];
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __66__PUPickerContainerController__updateSelectionStatusBarButtonItem__block_invoke;
      v92[3] = &unk_1E58ABCA8;
      v93 = v82;
      v94 = v43;
      v70 = v43;
      v71 = v82;
      objc_msgSend(v69, "performWithoutAnimation:", v92);
      objc_msgSend(v71, "setEnabled:", v83);
      objc_msgSend(v39, "setAttributedText:", v44);
      objc_msgSend(v39, "setHidden:", v44 == 0);
      -[PUPickerContainerController toolbarShowSelectedGroup](self, "toolbarShowSelectedGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_95;
    }
    objc_msgSend(v3, "generatedFilter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "displayAssetMediaType");

    if (!objc_msgSend(v3, "isAlbumPicker"))
      objc_msgSend(v3, "isCollectionsPicker");
    PXLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v3, "selectionLimit");
    PULocalizedStringWithValidatedFormat(v24, CFSTR("%ld"));
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_60;
  }
LABEL_95:

  return v11;
}

- (void)_showPhotosIndicatorBrieflyIfNeeded
{
  void *v3;
  void *v4;
  char v5;
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
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD aBlock[5];

  -[PUPickerContainerController configuration](self, "configuration");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v35, "shouldShowPhotosIndicator") & 1) == 0)
    goto LABEL_4;
  -[PUPickerContainerController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "shouldShowOnboardingOverlayView"))
  {

LABEL_4:
    return;
  }
  -[PUPickerContainerController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShowOnboardingHeaderView");

  if ((v5 & 1) == 0)
  {
    -[PUPickerContainerController configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performChanges:", &__block_literal_global_418);

    -[PUPickerContainerController photosIndicator](self, "photosIndicator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[PUPickerContainerController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController photosIndicator](self, "photosIndicator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[PUPickerContainerController photosIndicator](self, "photosIndicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v13, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController setPhotosIndicatorTopConstraint:](self, "setPhotosIndicatorTopConstraint:", v14);

    -[PUPickerContainerController photosIndicator](self, "photosIndicator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safeAreaLayoutGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v19, 1.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController setPhotosIndicatorTopSafeAreaConstraint:](self, "setPhotosIndicatorTopSafeAreaConstraint:", v20);

    -[PUPickerContainerController photosIndicator](self, "photosIndicator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v24, 1.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController setPhotosIndicatorLeadingConstraint:](self, "setPhotosIndicatorLeadingConstraint:", v25);

    -[PUPickerContainerController photosIndicator](self, "photosIndicator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "safeAreaLayoutGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v30, 1.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController setPhotosIndicatorLeadingSafeAreaConstraint:](self, "setPhotosIndicatorLeadingSafeAreaConstraint:", v31);

    -[PUPickerContainerController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setNeedsUpdateConstraints");

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PUPickerContainerController__showPhotosIndicatorBrieflyIfNeeded__block_invoke_2;
    aBlock[3] = &unk_1E58A9910;
    aBlock[4] = self;
    v33 = _Block_copy(aBlock);
    -[PUPickerContainerController photosIndicator](self, "photosIndicator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "flipToPrivacyIconAndDismissAfterDelay:completion:", v33, 1.0);

  }
}

- (void)_filterWithSuggestionResult:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 1867, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result != nil"));

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 1868, CFSTR("%s must be called on the main thread"), "-[PUPickerContainerController _filterWithSuggestionResult:]");

  }
  -[PUPickerContainerController setPickerSuggestionResultFetcherResult:](self, "setPickerSuggestionResultFetcherResult:", v9);
  -[PUPickerContainerController searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "selectedFilterableSuggestion"))
    v6 = v9;
  else
    v6 = 0;
  objc_msgSend(v5, "updateContainer:", v6);

  -[PUPickerContainerController _updateFilterPredicate](self, "_updateFilterPredicate");
}

- (void)_filterWithSearchQueryResult:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 1877, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryResult != nil"));

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 1878, CFSTR("%s must be called on the main thread"), "-[PUPickerContainerController _filterWithSearchQueryResult:]");

  }
  -[PUPickerContainerController setSearchQueryResult:](self, "setSearchQueryResult:", v8);
  -[PUPickerContainerController searchSuggestionsSectionProvider](self, "searchSuggestionsSectionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchQueryResult:", v8);

  -[PUPickerContainerController _updateFilterPredicate](self, "_updateFilterPredicate");
}

- (void)_filterWithSearchResultUUIDs:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 1886, CFSTR("%s must be called on the main thread"), "-[PUPickerContainerController _filterWithSearchResultUUIDs:]");

  }
  -[PUPickerContainerController setSearchResultUUIDs:](self, "setSearchResultUUIDs:", v6);
  -[PUPickerContainerController _updateFilterPredicate](self, "_updateFilterPredicate");

}

- (BOOL)_isConfiguredForStickerSuggestionGroup
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PUPickerContainerController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestionGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD21F8], "stickersSuggestionGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (BOOL)_isConfiguredForRetailExperience
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;

  -[PUPickerContainerController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestionGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD21F8], "retailExperienceSuggestionGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (!v6)
    return 0;
  -[PUPickerContainerController configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickerClientBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("com.apple.mobileslideshow"));

  return v9;
}

- (void)_cleanUpInteractiveBarTransitionIfNeeded
{
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
  __int128 v14;
  __int128 v15;
  void *v16;
  id v17[2];
  _OWORD v18[3];
  _OWORD v19[3];
  _OWORD v20[2];
  __int128 v21;

  -[PUPickerContainerController configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "supportsInteractiveBarTransition"))
  {

  }
  else
  {
    -[PUPickerContainerController viewIfLoaded](self, "viewIfLoaded");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PUPickerContainerController photosViewController](self, "photosViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "gridView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAvoidSnapshotOnHeightChanges:", 0);

      -[PUPickerContainerController navigationController](self, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "navigationBar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      *(_OWORD *)v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v20[0] = *MEMORY[0x1E0C9BAA8];
      v15 = v20[0];
      v20[1] = *(_OWORD *)v17;
      v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v14 = v21;
      objc_msgSend(v8, "setTransform:", v20);
      objc_msgSend(v8, "setUserInteractionEnabled:", 1);
      objc_msgSend(v8, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeAllAnimations");

      -[PUPickerContainerController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "toolbar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v19[0] = v15;
      v19[1] = *(_OWORD *)v17;
      v19[2] = v14;
      objc_msgSend(v11, "setTransform:", v19);
      objc_msgSend(v11, "setUserInteractionEnabled:", 1);
      objc_msgSend(v11, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeAllAnimations");

      -[PUPickerContainerController _currentContainerViewForInteractionBarTransition](self, "_currentContainerViewForInteractionBarTransition");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v15;
      v18[1] = *(_OWORD *)v17;
      v18[2] = v14;
      objc_msgSend(v13, "setTransform:", v18);

    }
  }
}

- (void)handleNavigationBarSegmentedControl:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  __CFString *v22;
  __CFString *v23;
  _QWORD v24[5];
  char v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "selectedSegmentIndex");
  v5 = v4;
  if (v4)
  {
    if (v4 == 1)
    {
      -[PUPickerContainerController childViewControllers](self, "childViewControllers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPickerContainerController albumsViewController](self, "albumsViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "containsObject:", v7);

      v9 = 23;
      if ((v8 & 1) == 0)
        goto LABEL_8;
LABEL_6:
      v13 = 1;
      v14 = 3;
      goto LABEL_9;
    }
    v9 = 0;
  }
  else
  {
    -[PUPickerContainerController childViewControllers](self, "childViewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController itemsViewController](self, "itemsViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    v9 = 22;
    if (v12)
      goto LABEL_6;
  }
LABEL_8:
  v13 = 0;
  v14 = 0;
LABEL_9:
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B868]), "initWithType:revealMode:", v9, v14);
  v16 = objc_msgSend(v15, "type");
  PLPickerGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = CFSTR("NO");
      if (v13)
        v19 = CFSTR("YES");
      v20 = v19;
      *(_DWORD *)buf = 134218498;
      v27 = v5;
      v28 = 2112;
      v29 = v20;
      v30 = 2112;
      v31 = v15;
      _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_DEFAULT, "Selected %ld (same item: %@) to navigate to destination: %@", buf, 0x20u);

    }
    if (v13)
      v21 = 2;
    else
      v21 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __67__PUPickerContainerController_handleNavigationBarSegmentedControl___block_invoke;
    v24[3] = &__block_descriptor_41_e20_v24__0q8__NSError_16l;
    v24[4] = v5;
    v25 = v13;
    -[PUPickerContainerController navigateToDestination:options:completionHandler:](self, "navigateToDestination:options:completionHandler:", v15, v21, v24);
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v22 = CFSTR("NO");
      if (v13)
        v22 = CFSTR("YES");
      v23 = v22;
      *(_DWORD *)buf = 134218242;
      v27 = v5;
      v28 = 2112;
      v29 = v23;
      _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_ERROR, "Unable to select %ld (same item: %@) because a destination doesn't exist.", buf, 0x16u);

    }
  }

}

- (void)handleToolbarShowSelectedButton:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  -[PUPickerContainerController selectionCoordinator](self, "selectionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedObjectIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 1963, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.selectionCoordinator.selectedObjectIDs.count > 0"));

  }
  -[PUPickerContainerController containerControllerActionHandler](self, "containerControllerActionHandler");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerController:didTapShowSelectedButton:", self, v5);

}

- (void)handleToolbarOptionsButton:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  -[PUPickerContainerController configuration](self, "configuration", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "excludesOptionsMenu");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 1969, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.configuration.excludesOptionsMenu"));

  }
  -[PUPickerContainerController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPickerContainerController configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController selectionCoordinator](self, "selectionCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController additionalSelectionState](self, "additionalSelectionState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPickerOptionsViewFactory viewControllerWithConfiguration:selectionCoordinator:additionalSelectionState:](PUPickerOptionsViewFactory, "viewControllerWithConfiguration:selectionCoordinator:additionalSelectionState:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v12);
  PULocalizedString(CFSTR("OPTIONS_BUTTON_TITLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v14);

  v15 = (void *)MEMORY[0x1E0DC3428];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __58__PUPickerContainerController_handleToolbarOptionsButton___block_invoke;
  v21[3] = &unk_1E58A6930;
  v22 = v8;
  v16 = v8;
  objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", &stru_1E58AD278, 0, 0, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:primaryAction:menu:", 0, v17, 0);
  objc_msgSend(v12, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRightBarButtonItem:", v18);

  objc_msgSend(v16, "presentViewController:animated:completion:", v13, 1, 0);
}

- (void)handleToolbarNewAlbumButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PUPickerContainerController *v13;

  -[PUPickerContainerController configuration](self, "configuration", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_virtualCollections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootAlbumCollectionList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0D7B700]);
  v9 = (void *)objc_msgSend(v8, "initWithActionType:collectionList:", *MEMORY[0x1E0D7C240], v7);
  objc_msgSend(v9, "setDelegate:", self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__PUPickerContainerController_handleToolbarNewAlbumButton___block_invoke;
  v11[3] = &unk_1E58AA020;
  v12 = v9;
  v13 = self;
  v10 = v9;
  objc_msgSend(v10, "performActionWithCompletionHandler:", v11);

}

- (id)undoManagerForActionPerformer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PUPickerContainerController navigationController](self, "navigationController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v14;

  v9 = a3;
  v10 = a4;
  switch(a5)
  {
    case 1:
      -[PUPickerContainerController navigationController](self, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 1;
      objc_msgSend(v12, "px_pushViewController:animated:completion:", v10, 1, 0);

      break;
    case 2:
      v11 = -[PUPickerContainerController _actionPerformer:presentViewController:](self, "_actionPerformer:presentViewController:", v9, v10);
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2056, CFSTR("Code which should be unreachable has been reached"));

      abort();
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (BOOL)_actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    objc_msgSend(v9, "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "actionType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == (void *)*MEMORY[0x1E0D7C638])
      {
        -[PUPickerContainerController toolbarSortAndFilterBarButtonItem](self, "toolbarSortAndFilterBarButtonItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setBarButtonItem:", v12);
      }
      else
      {
        -[PUPickerContainerController navigationController](self, "navigationController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setSourceView:", v13);

      }
    }
    -[PUPickerContainerController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 1;
    objc_msgSend(v15, "presentViewController:animated:completion:", v9, 1, 0);

    objc_msgSend(v9, "presentingViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      v14 = objc_msgSend(v9, "px_isDelayingPresentation");

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "type");
  if ((unint64_t)(v3 - 8) > 0x14)
    return 0;
  else
    return qword_1AB0EFF38[v3 - 8];
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  void *v27;
  char isKindOfClass;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  id v43;
  void *v44;
  objc_class *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  objc_class *v57;
  void *v58;
  uint8_t buf[4];
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  if (objc_msgSend(v9, "revealMode"))
  {
    if (objc_msgSend(v9, "revealMode") == 3)
    {
      -[PUPickerContainerController childViewControllers](self, "childViewControllers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        if (objc_msgSend(v12, "pu_scrollToInitialPositionAnimated:", (a4 >> 1) & 1))
          v13 = 1;
        else
          v13 = 5;
        v10[2](v10, v13, 0);
      }
      else
      {
        PLPickerGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v9;
          _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_ERROR, "Unsupported scrolling to top (can't find child view controller): %@", buf, 0xCu);
        }

        v10[2](v10, 2, 0);
      }

      goto LABEL_53;
    }
    PLPickerGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v9;
      v17 = "Unsupported destination reveal mode: %@";
LABEL_27:
      _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
      goto LABEL_28;
    }
    goto LABEL_28;
  }
  if (objc_msgSend(v9, "type") == 22)
  {
    -[PUPickerContainerController itemsViewController](self, "itemsViewController");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v15 = (void *)v14;
    goto LABEL_46;
  }
  if (objc_msgSend(v9, "type") == 23)
  {
    -[PUPickerContainerController sidebarViewController](self, "sidebarViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      -[PUPickerContainerController albumsViewController](self, "albumsViewController");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  objc_msgSend(v9, "collection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    goto LABEL_25;
  -[PUPickerContainerController sidebarViewController](self, "sidebarViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PUPickerContainerController px_gridPresentation](self, "px_gridPresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D7B570], "isLemonadeUIEnabled"))
    {
      if (-[PUPickerContainerController _shouldLoadLemonadeFeedForDestination:](self, "_shouldLoadLemonadeFeedForDestination:", v9))
      {
        -[PUPickerContainerController configuration](self, "configuration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPickerContainerController sessionInfo](self, "sessionInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPickerContainerController selectionCoordinator](self, "selectionCoordinator");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPickerContainerController _viewControllerWithSidebarNavigationDestination:configuration:sessionInfo:selectionCoordinator:](self, "_viewControllerWithSidebarNavigationDestination:configuration:sessionInfo:selectionCoordinator:", v9, v22, v23, v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_37:
        objc_msgSend(v9, "collection");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localizedTitle");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
        {
LABEL_45:
          -[PUPickerContainerController configuration](self, "configuration");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "hasClearBackgroundColor");
          objc_msgSend(v15, "view");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "layer");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setHitTestsAsOpaque:", v37);

LABEL_46:
          v26 = 0;
          if (v15)
            goto LABEL_47;
LABEL_25:
          PLPickerGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v9;
            v17 = "Unsupported destination: %@";
            goto LABEL_27;
          }
LABEL_28:

          v10[2](v10, 2, 0);
          goto LABEL_53;
        }
        objc_msgSend(v9, "collection");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedTitle");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setTitle:", v34);

LABEL_44:
        goto LABEL_45;
      }
      objc_msgSend(v9, "collection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_36:
          objc_msgSend(v21, "createViewControllerForAssetCollection:", v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_37;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (objc_class *)objc_opt_class();
        NSStringFromClass(v52);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "px_descriptionForAssertionMessage");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2131, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("destination.collection"), v51, v53);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (objc_class *)objc_opt_class();
        NSStringFromClass(v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2131, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("destination.collection"), v51);
      }

      goto LABEL_36;
    }
    objc_msgSend(v9, "collection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v9, "collection");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if ((isKindOfClass & 1) != 0)
    {
      if (v29)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_33:
          objc_msgSend(v21, "createViewControllerForAssetCollection:", v30);
          v31 = objc_claimAutoreleasedReturnValue();
LABEL_43:
          v15 = (void *)v31;
          goto LABEL_44;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "px_descriptionForAssertionMessage");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2138, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("destination.collection"), v46, v48);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2138, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("destination.collection"), v46);
      }

      goto LABEL_33;
    }
    objc_opt_class();
    v35 = objc_opt_isKindOfClass();

    if ((v35 & 1) == 0)
    {
      v15 = 0;
      goto LABEL_45;
    }
    objc_msgSend(v9, "collection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_42:
        objc_msgSend(v21, "createAlbumListViewControllerWithCollectionList:", v30);
        v31 = objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (objc_class *)objc_opt_class();
      NSStringFromClass(v57);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "px_descriptionForAssertionMessage");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2140, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("destination.collection"), v56, v58);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2140, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("destination.collection"), v56);
    }

    goto LABEL_42;
  }
  -[PUPickerContainerController albumsViewController](self, "albumsViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 1;
  if (!v15)
    goto LABEL_25;
LABEL_47:
  -[PUPickerContainerController childViewControllers](self, "childViewControllers");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "containsObject:", v15);

  if ((v41 & 1) == 0)
    -[PUPickerContainerController _addOrReplaceItemViewControllerWithViewController:](self, "_addOrReplaceItemViewControllerWithViewController:", v15);
  -[PUPickerContainerController updateBars](self, "updateBars");
  if (v26)
  {
    objc_msgSend(v15, "navigateToDestination:options:completionHandler:", v9, a4, v10);
  }
  else
  {
    -[PUPickerContainerController navigationController](self, "navigationController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (id)objc_msgSend(v42, "popToRootViewControllerAnimated:", 0);

    v10[2](v10, 1, 0);
  }

LABEL_53:
}

- (id)px_navigationDestination
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v15;
  int v16;
  void *v17;

  -[PUPickerContainerController childViewControllers](self, "childViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.childViewControllers.count <= 1"));

  }
  -[PUPickerContainerController childViewControllers](self, "childViewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (-[PUPickerContainerController itemsViewController](self, "itemsViewController"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isEqual:", v8),
        v8,
        !v9))
  {
    -[PUPickerContainerController albumsViewController](self, "albumsViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v7, "isEqual:", v15);

    if (!v16)
    {
      objc_msgSend(v7, "px_navigationDestination");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v10 = objc_alloc(MEMORY[0x1E0D7B868]);
    v11 = 23;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0D7B868]);
    v11 = 22;
  }
  v12 = objc_msgSend(v10, "initWithType:revealMode:", v11, 0);
LABEL_7:
  v13 = (void *)v12;

  return v13;
}

- (BOOL)_shouldLoadLemonadeFeedForDestination:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "collection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "px_isEventsVirtualCollection") & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v3, "collection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "px_isPeopleVirtualCollection") & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        objc_msgSend(v3, "collection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "px_isMemoriesVirtualCollection") & 1) != 0)
        {
          v7 = 1;
        }
        else
        {
          objc_msgSend(v3, "collection");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "px_isTripsVirtualCollection") & 1) != 0)
          {
            v7 = 1;
          }
          else
          {
            objc_msgSend(v3, "collection");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v11, "px_isWallpaperSuggestionsVirtualCollection") & 1) != 0)
            {
              v7 = 1;
            }
            else
            {
              objc_msgSend(v3, "collection");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v12, "px_isFeaturedPhotosCollection") & 1) != 0)
              {
                v7 = 1;
              }
              else
              {
                objc_msgSend(v3, "collection");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v7 = objc_msgSend(v13, "px_isMapVirtualCollection");

              }
            }

          }
        }

      }
    }

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)allowsContextMenuInteractionForPhotosViewController:(id)a3
{
  void *v3;
  char v4;

  -[PUPickerContainerController configuration](self, "configuration", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsContextMenuInteraction");

  return v4;
}

- (id)photosViewController:(id)a3 animationForProposedAnimation:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  if (-[PUPickerContainerController searchBarIsFirstResponder](self, "searchBarIsFirstResponder"))
    v6 = 0;
  else
    v6 = v5;
  v7 = v6;

  return v7;
}

- (id)headerViewForPhotosViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;

  v4 = a3;
  -[PUPickerContainerController photosViewController](self, "photosViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4
    || (-[PUPickerContainerController configuration](self, "configuration"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "mode"),
        v6,
        v7 == 1))
  {
    v8 = 0;
    return v8;
  }
  -[PUPickerContainerController configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "allowsSearchSuggestions") & 1) != 0)
  {
    -[PUPickerContainerController searchSuggestionsCollectionViewDataSource](self, "searchSuggestionsCollectionViewDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "numberOfItems");

    if (v12 >= 1)
    {
      -[PUPickerContainerController searchSuggestionsHeaderView](self, "searchSuggestionsHeaderView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else
  {

  }
  v8 = 0;
LABEL_10:
  -[PUPickerContainerController configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "shouldShowOnboardingHeaderView");

  if (v14)
  {
    -[PUPickerContainerController onboardingHeaderView](self, "onboardingHeaderView");
    v15 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v15;
  }
  else
  {
    -[PUPickerContainerController setOnboardingHeaderView:](self, "setOnboardingHeaderView:", 0);
  }
  return v8;
}

- (BOOL)shouldAnimateFromHeaderView:(id)a3 toHeaderView:(id)a4
{
  id v5;
  char isKindOfClass;

  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (a4 == 0) & isKindOfClass;
}

- (BOOL)photosViewController:(id)a3 canPlayAssetInline:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;

  v5 = a4;
  if (objc_msgSend(v5, "playbackStyle") == 3)
  {
    v6 = v5;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;

      if (v7)
      {
        -[PUPickerContainerController configuration](self, "configuration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "showsWallpaperSuggestions");

        if (v9)
        {
          -[PUPickerContainerController pickerSuggestionResultFetcherResult](self, "pickerSuggestionResultFetcherResult");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "inlinePlaybackDisallowedAssetUUIDs");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "uuid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "containsObject:", v12) ^ 1;

LABEL_10:
          goto LABEL_11;
        }
        if (-[PUPickerContainerController _isConfiguredForStickerSuggestionGroup](self, "_isConfiguredForStickerSuggestionGroup"))
        {
          LOBYTE(v13) = objc_msgSend(v7, "playbackStyle") == 3;
          goto LABEL_10;
        }
      }
    }
    else
    {

      v7 = 0;
    }
    LOBYTE(v13) = 0;
    goto LABEL_10;
  }
  LOBYTE(v13) = 0;
LABEL_11:

  return v13;
}

- (BOOL)photosViewController:(id)a3 isAssetEligibleForAutoPlayback:(id)a4
{
  return 1;
}

- (BOOL)photosViewController:(id)a3 isAssetEligibleForPlaybackWithSettlingEffect:(id)a4
{
  void *v4;
  char v5;

  -[PUPickerContainerController configuration](self, "configuration", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showsWallpaperSuggestions");

  return v5;
}

- (unint64_t)photosViewControllerFilterSortedRecordsStrategy:(id)a3
{
  if (-[PUPickerContainerController _isConfiguredForStickerSuggestionGroup](self, "_isConfiguredForStickerSuggestionGroup", a3))
  {
    return 2;
  }
  else
  {
    return PXPreferencesGetBool();
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  uint8_t buf[16];

  v9 = a3;
  if ((void *)PUPhotoPickerResizeTaskDescriptorViewModelObservationContext_73498 == a5)
    goto LABEL_10;
  if ((void *)PUPhotoPickerPhotosViewControllerViewModelObservationContext == a5)
  {
    if ((a4 & 0x200000000) == 0)
      goto LABEL_11;
LABEL_10:
    -[PUPickerContainerController updateBars](self, "updateBars");
    goto LABEL_11;
  }
  if ((void *)PUPhotoPickerConfigurationObservationContext == a5)
  {
    if ((a4 & 0x23) != 0)
      -[PUPickerContainerController updateBars](self, "updateBars");
    if ((a4 & 0x29) != 0)
    {
      -[PUPickerContainerController photosViewController](self, "photosViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "invalidateHeaderView");

    }
    if ((a4 & 0xE0) != 0)
    {
      -[PUPickerContainerController _updateInteractiveBarTransition](self, "_updateInteractiveBarTransition");
      -[PUPickerContainerController _showPhotosIndicatorBrieflyIfNeeded](self, "_showPhotosIndicatorBrieflyIfNeeded");
      -[PUPickerContainerController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNeedsUpdateConstraints");

    }
  }
  else
  {
    if ((void *)PUPhotoPickerAdditionalSelectionStateObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2341, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    PLPickerGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEFAULT, "Preparation options were changed.", buf, 2u);
    }

    -[PUPickerContainerController _updateToolbar](self, "_updateToolbar");
    -[PUPickerContainerController configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "confirmationBehavior");

    if ((unint64_t)(v12 - 2) <= 2)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__PUPickerContainerController_observable_didChange_context___block_invoke;
      block[3] = &unk_1E58ABD10;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
LABEL_11:

}

- (void)_updateLastVisiblePhotosViewController:(id)a3
{
  id v4;
  id v5;
  PXPhotosUIViewController *v6;
  PXPhotosUIViewController *lastVisiblePhotosViewController;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PUPickerContainerController lastVisiblePhotosViewController](self, "lastVisiblePhotosViewController");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (v5 != v9)
      {
        v6 = (PXPhotosUIViewController *)v9;
        lastVisiblePhotosViewController = self->_lastVisiblePhotosViewController;
        self->_lastVisiblePhotosViewController = v6;
LABEL_7:

        v4 = v9;
        goto LABEL_8;
      }
    }
    -[PUPickerContainerController lastVisiblePhotosViewController](self, "lastVisiblePhotosViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v9;
    if (v8)
    {
      lastVisiblePhotosViewController = self->_lastVisiblePhotosViewController;
      self->_lastVisiblePhotosViewController = 0;
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)_updateInteractiveBarTransition
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  __int128 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  NSObject *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  float v38;
  double v39;
  double v40;
  _BOOL8 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform buf;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[PUPickerContainerController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsInteractiveBarTransition");

  if (v4)
  {
    -[PUPickerContainerController _currentContainerViewForInteractionBarTransition](self, "_currentContainerViewForInteractionBarTransition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      self->_hasNavigationBarTransitionPending = 0;
      -[PUPickerContainerController photosViewController](self, "photosViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "gridView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAvoidSnapshotOnHeightChanges:", 1);

      -[PUPickerContainerController navigationController](self, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPickerContainerController configuration](self, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "interactiveBarTransitionFractionExpanded");
      v12 = v11;

      v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v57.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v57.c = v13;
      *(_OWORD *)&v57.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      *(_OWORD *)&v56.a = *(_OWORD *)&v57.a;
      *(_OWORD *)&v56.c = v13;
      *(_OWORD *)&v56.tx = *(_OWORD *)&v57.tx;
      *(_OWORD *)&v55.a = *(_OWORD *)&v57.a;
      *(_OWORD *)&v55.c = v13;
      *(_OWORD *)&v55.tx = *(_OWORD *)&v57.tx;
      objc_msgSend(v9, "childViewControllers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15 == 1)
      {
        objc_msgSend(v9, "topViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "safeAreaInsets");
        v19 = v18;

        v20 = (1.0 - v12) * v19;
        -[PUPickerContainerController view](self, "view");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "safeAreaInsets");
        v23 = v22;

        objc_msgSend(v9, "toolbar");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bounds");
        v26 = v25;

        PLPickerGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf.a) = 134218752;
          *(double *)((char *)&buf.a + 4) = v20;
          WORD2(buf.b) = 2048;
          *(double *)((char *)&buf.b + 6) = v12;
          HIWORD(buf.c) = 2048;
          buf.d = v23;
          LOWORD(buf.tx) = 2048;
          *(double *)((char *)&buf.tx + 2) = v26;
          _os_log_impl(&dword_1AAB61000, v27, OS_LOG_TYPE_DEBUG, "_updateInteractiveBarTransition will transition with offset %f, fractionExpanded %f, bottom safe area %f, toolbar height: %f", (uint8_t *)&buf, 0x2Au);
        }

        memset(&buf, 0, sizeof(buf));
        CGAffineTransformMakeScale(&buf, 1.0, v12);
        memset(&v54, 0, sizeof(v54));
        CGAffineTransformMakeTranslation(&v54, 0.0, v20 * -0.5);
        t1 = buf;
        t2 = v54;
        CGAffineTransformConcat(&v57, &t1, &t2);
        CGAffineTransformMakeTranslation(&v56, 0.0, (1.0 - v12) * (v23 + v26));
        CGAffineTransformMakeTranslation(&v55, 0.0, -v20);
      }
      else
      {
        v29 = v12 <= 0.8;
        objc_msgSend(v9, "navigationBar");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setHidden:", v29);

        objc_msgSend(v9, "toolbar");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setHidden:", v29);

      }
      v51 = v57;
      objc_msgSend(v9, "navigationBar");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v51;
      objc_msgSend(v32, "setTransform:", &v50);

      v49 = v56;
      objc_msgSend(v9, "toolbar");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v49;
      objc_msgSend(v33, "setTransform:", &v48);

      v47 = v55;
      objc_msgSend(v5, "setTransform:", &v47);
      objc_msgSend(v9, "navigationBar");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "animationForKey:", CFSTR("navBarOpacity"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v36, "toValue");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "floatValue");
        v39 = v38;
      }
      else
      {
        objc_msgSend(v9, "navigationBar");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "alpha");
        v39 = v40;
      }

      v41 = v12 > 0.8 && v39 == 0.0;
      if (v41 || v39 > 0.0 && v12 < 0.8)
      {
        -[PUPickerContainerController _animationForNavigationBarVisible:fromCurrentOpacity:](self, "_animationForNavigationBarVisible:fromCurrentOpacity:", v41, v39);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "navigationBar");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "layer");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addAnimation:forKey:", v42, CFSTR("navBarOpacity"));

        objc_msgSend(v9, "navigationBar");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setUserInteractionEnabled:", v41);

        objc_msgSend(v9, "toolbar");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setUserInteractionEnabled:", v41);

      }
    }
    else
    {
      PLPickerGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v57.a) = 0;
        _os_log_impl(&dword_1AAB61000, v28, OS_LOG_TYPE_DEFAULT, "_updateInteractiveBarTransition will postpone transition, there isn't a view controller presented yet.", (uint8_t *)&v57, 2u);
      }

      self->_hasNavigationBarTransitionPending = 1;
    }

  }
}

- (id)_currentContainerViewForInteractionBarTransition
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  -[PUPickerContainerController childViewControllers](self, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerContainerController photosViewController](self, "photosViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if (v5)
  {
    -[PUPickerContainerController photosViewController](self, "photosViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUPickerContainerController childViewControllers](self, "childViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerContainerController albumsViewController](self, "albumsViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (!v9)
    {
      v11 = 0;
      return v11;
    }
    -[PUPickerContainerController albumsViewController](self, "albumsViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v6;
  objc_msgSend(v6, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_animationForNavigationBarVisible:(BOOL)a3 fromCurrentOpacity:(double)a4
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFromValue:", v7);

  if (v5)
    v8 = &unk_1E59BC630;
  else
    v8 = &unk_1E59BC640;
  objc_msgSend(v6, "setToValue:", v8);
  objc_msgSend(v6, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v6, "setRemovedOnCompletion:", v5);
  objc_msgSend(v6, "setStiffness:", 246.7);
  objc_msgSend(v6, "setDamping:", 31.4);
  objc_msgSend(v6, "settlingDuration");
  objc_msgSend(v6, "setDuration:");
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimingFunction:", v9);

  return v6;
}

- (void)sessionInfoStatusDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  -[PUPickerContainerController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sourceType");

  if (v6 == 2)
  {
    objc_msgSend(v4, "targetAlbum");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", v8);
    else
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__PUPickerContainerController_sessionInfoStatusDidChange___block_invoke;
    v11[3] = &unk_1E58ABCA8;
    v11[4] = self;
    v12 = v9;
    v10 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

- (void)searchComposableDataSourceDidChange:(id)a3
{
  id v3;

  -[PUPickerContainerController photosViewController](self, "photosViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateHeaderView");

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  objc_msgSend(a3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTextField");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "text");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E58AD278;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(v15, "tokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C9AA60];
  PXMap();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = v10;
  v14 = v13;

  -[PUPickerContainerController _searchWithString:tokens:](self, "_searchWithString:tokens:", v8, v14);
}

- (void)_searchWithString:(id)a3 tokens:(id)a4
{
  id v7;
  id v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v7 = a4;
  if (v20)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2479, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchString"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2480, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchTokens"));

LABEL_3:
  v8 = objc_alloc_init(MEMORY[0x1E0D7B900]);
  objc_msgSend(v8, "setWantsLibraryChanges:", 0);
  objc_msgSend(v8, "setWantsCuratedAssetsFetchResult:", 0);
  objc_msgSend(v8, "setWantsWordEmbeddings:", 0);
  -[PUPickerContainerController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  if (v10 < 600.0)
    v11 = 4;
  else
    v11 = 5;
  objc_msgSend(v8, "setSuggestionLimit:", v11);

  -[PUPickerContainerController configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "generatedFilter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "searchQueryFilterOptions");
  if (v14)
    v15 = v14;
  else
    v15 = 7;
  objc_msgSend(v8, "setFilterOptions:", v15);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B8E8]), "initWithSearchText:searchTokens:scopedSearchIdentifiers:searchResultTypes:options:", v20, v7, 0, 1, v8);
  -[PUPickerContainerController queryController](self, "queryController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "performSearch:", v16);

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[PUPickerContainerController photosViewController](self, "photosViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerView");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "frame");
  v7 = v6;
  -[PUPickerContainerController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaInsets");
  v10 = v7 - v9;

  -[PUPickerContainerController photosViewController](self, "photosViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "gridView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scrollViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setContentOffset:animated:", 1, 0.0, v10);
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  if (objc_msgSend(a3, "isTracking"))
    -[PUPickerContainerController resignSearchBarAsFirstResponder](self, "resignSearchBarAsFirstResponder");
}

- (void)didSelectSuggestionAtIndexPath:(id)a3 collectionView:(id)a4
{
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  uint8_t buf[4];
  NSObject *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[PUPickerContainerController searchSuggestionsCollectionViewDataSource](self, "searchSuggestionsCollectionViewDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIdentifierForIndexPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2535, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIdentifier"));

  }
  objc_msgSend(v9, "searchDataSourceSectionProviderForItemIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2537, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[dataSource searchDataSourceSectionProviderForItemIdentifier:itemIdentifier]"), v25, v27);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2537, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[dataSource searchDataSourceSectionProviderForItemIdentifier:itemIdentifier]"), v25);
  }

LABEL_5:
  v12 = objc_msgSend(v11, "type");
  if ((unint64_t)(v12 - 1) < 2)
  {
    PXAssertGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v7;
      v30 = 2112;
      v31 = v11;
      _os_log_error_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "Selection not handled for selected index path %@, in search section provider: %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  if (v12 == 3)
  {
    objc_msgSend(v11, "searchSuggestionForIdentifier:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    PLPhotosSearchGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v14;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEFAULT, "Selected Search Suggestion: %@", buf, 0xCu);
    }

    -[PUPickerContainerController searchController](self, "searchController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "searchBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "searchTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3C50], "px_searchTokenWithRepresentedObjectToken:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textualRange");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tokens");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "replaceTextualPortionOfRange:withToken:atIndex:", v20, v19, objc_msgSend(v21, "count"));

LABEL_14:
    goto LABEL_15;
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2553, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
LABEL_15:

}

- (void)peopleConfigurationController:(id)a3 didFinishWithCurrentViewController:(id)a4 selectedPerson:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v8 = a5;
  -[PUPickerContainerController peopleConfigController](self, "peopleConfigController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v24;
  if (v9 != v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2563, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peopleConfigController == self.peopleConfigController"));

    v10 = v24;
  }
  objc_msgSend(v10, "incrementViewControllersForPerson:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_msgSend(v24, "buttonType");
    if (v12 == 2)
    {
      v20 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PXLocalizedString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v20;
      v16 = v14;
      v17 = 2;
    }
    else
    {
      if (v12 != 1)
      {
        v18 = 0;
        goto LABEL_11;
      }
      v13 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PXLocalizedString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v16 = v14;
      v17 = 0;
    }
    v18 = (void *)objc_msgSend(v15, "initWithTitle:style:target:action:", v16, v17, v24, sel_didAdvanceWithSender_);

LABEL_11:
    objc_msgSend(v11, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRightBarButtonItem:", v18);

    -[PUPickerContainerController navigationController](self, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pushViewController:animated:", v11, 1);

    -[PUPickerContainerController _updateToolbar](self, "_updateToolbar");
    goto LABEL_12;
  }
  -[PUPickerContainerController containerControllerActionHandler](self, "containerControllerActionHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addedObjectIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "containerController:didTapBatchedItems:", self, v19);

LABEL_12:
}

- (void)peopleConfigurationController:(id)a3 didPopViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  -[PUPickerContainerController peopleConfigController](self, "peopleConfigController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2598, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peopleConfigController == self.peopleConfigController"));

  }
  -[PUPickerContainerController _updateToolbar](self, "_updateToolbar");
}

- (CGRect)preferredCropForAsset:(id)a3 withAspectRatio:(double)a4
{
  id v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int16 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect result;

  v5 = a3;
  -[PUPickerContainerController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showsWallpaperSuggestions");

  v8 = *MEMORY[0x1E0C9D628];
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (v7)
  {
    v12 = v5;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    -[PUPickerContainerController pickerSuggestionResultFetcher](self, "pickerSuggestionResultFetcher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && v14)
    {
      -[PUPickerContainerController pickerSuggestionResultFetcherResult](self, "pickerSuggestionResultFetcherResult");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "suggestionSubtypeByAssetUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = objc_msgSend(v18, "integerValue");
        v20 = objc_msgSend(MEMORY[0x1E0D77EF8], "posterClassificationForSuggestionSubtype:", v19);
      }
      else
      {
        -[PUPickerContainerController pickerSuggestionResultFetcherResult](self, "pickerSuggestionResultFetcherResult");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v21, "posterClassification");

      }
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v24 = v23;
      v26 = v25;

      if (v24 <= v26)
        v27 = 1;
      else
        v27 = 2;
      objc_msgSend(MEMORY[0x1E0D751A8], "deviceConfigurationForOrientation:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D77EF8], "bestWallpaperCropForAsset:classification:outputCropScore:outputLayoutAcceptable:layoutConfiguration:", v13, v20, 0, 0, v28);
      v8 = v29;
      v9 = v30;
      v10 = v31;
      v11 = v32;

    }
  }

  v33 = v8;
  v34 = v9;
  v35 = v10;
  v36 = v11;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (id)preferredColumnCounts:(id)a3
{
  void *v3;
  void *v4;

  -[PUPickerContainerController pickerSuggestionResultFetcherResult](self, "pickerSuggestionResultFetcherResult", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allowedColumnsOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)pickerSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PUPickerContainerController pickerSuggestionResultFetcher](self, "pickerSuggestionResultFetcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentSuggestion:", v5);

}

- (void)pickerSuggestionsViewDidSelectSameSuggestion:(id)a3
{
  id v3;

  -[PUPickerContainerController itemsViewController](self, "itemsViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_scrollToInitialPositionAnimated:", 1);

}

- (void)pickerOnboardingHeaderViewWantsToLearnMoreAboutDataAccess:(id)a3
{
  id v4;

  -[PUPickerContainerController containerControllerActionHandler](self, "containerControllerActionHandler", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerControllerWantsToLearnMoreAboutDataAccess:", self);

}

- (void)setPhotosIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_photosIndicator, a3);
}

- (void)setOnboardingHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingHeaderView, a3);
}

- (BOOL)replacesConfirmationButtonWithActivityIndicator
{
  return self->_replacesConfirmationButtonWithActivityIndicator;
}

- (PUSidebarViewController)sidebarViewController
{
  return (PUSidebarViewController *)objc_loadWeakRetained((id *)&self->_sidebarViewController);
}

- (PUPickerConfiguration)configuration
{
  return self->_configuration;
}

- (PUSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (PXSelectionCoordinator)selectionCoordinator
{
  return self->_selectionCoordinator;
}

- (PUPickerAdditionalSelectionState)additionalSelectionState
{
  return self->_additionalSelectionState;
}

- (PUPhotoPickerResizeTaskDescriptorViewModel)resizeTaskDescriptorViewModel
{
  return self->_resizeTaskDescriptorViewModel;
}

- (PUPickerContainerControllerActionHandler)containerControllerActionHandler
{
  return (PUPickerContainerControllerActionHandler *)objc_loadWeakRetained((id *)&self->_containerControllerActionHandler);
}

- (UISegmentedControl)navigationBarSegmentedControl
{
  return self->_navigationBarSegmentedControl;
}

- (_UINavigationBarPalette)navigationBarBottomPalette
{
  return self->_navigationBarBottomPalette;
}

- (UIButton)showSelectedButtonTitleButton
{
  return self->_showSelectedButtonTitleButton;
}

- (UILabel)showSelectedButtonSubtitleLabel
{
  return self->_showSelectedButtonSubtitleLabel;
}

- (UIBarButtonItem)toolbarShowSelectedGroup
{
  return self->_toolbarShowSelectedGroup;
}

- (UIBarButtonItem)toolbarOptionsBarButton
{
  return self->_toolbarOptionsBarButton;
}

- (UIBarButtonItem)toolbarNewAlbumBarButton
{
  return self->_toolbarNewAlbumBarButton;
}

- (UIBarButtonItem)toolbarSortAndFilterBarButtonItem
{
  return self->_toolbarSortAndFilterBarButtonItem;
}

- (BOOL)shouldStopScrollingItemsViewControllerToTop
{
  return self->_shouldStopScrollingItemsViewControllerToTop;
}

- (void)setShouldStopScrollingItemsViewControllerToTop:(BOOL)a3
{
  self->_shouldStopScrollingItemsViewControllerToTop = a3;
}

- (PXPhotosUIViewController)photosViewController
{
  return self->_photosViewController;
}

- (PXPhotosUIViewController)lastVisiblePhotosViewController
{
  return self->_lastVisiblePhotosViewController;
}

- (PXAssetsDataSourceManager)photosDataSourceManager
{
  return self->_photosDataSourceManager;
}

- (PXSectionedSelectionManager)photosSelectionManager
{
  return self->_photosSelectionManager;
}

- (PXPhotosViewConfiguration)photosViewConfiguration
{
  return self->_photosViewConfiguration;
}

- (PUPickerSearchBar)searchBar
{
  return self->_searchBar;
}

- (NSArray)searchResultUUIDs
{
  return self->_searchResultUUIDs;
}

- (void)setSearchResultUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultUUIDs, a3);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (PXSearchQueryController)queryController
{
  return self->_queryController;
}

- (PXSearchSuggestionsSectionProvider)searchSuggestionsSectionProvider
{
  return self->_searchSuggestionsSectionProvider;
}

- (PXSearchComposableDataSource)searchSuggestionsCollectionViewDataSource
{
  return self->_searchSuggestionsCollectionViewDataSource;
}

- (PUPickerSearchSuggestionsHeaderView)searchSuggestionsHeaderView
{
  return self->_searchSuggestionsHeaderView;
}

- (PXSearchQueryResult)searchQueryResult
{
  return self->_searchQueryResult;
}

- (void)setSearchQueryResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchQueryResult, a3);
}

- (PHFetchResult)allowedAssetsFetchResultForSearch
{
  return self->_allowedAssetsFetchResultForSearch;
}

- (void)setAllowedAssetsFetchResultForSearch:(id)a3
{
  objc_storeStrong((id *)&self->_allowedAssetsFetchResultForSearch, a3);
}

- (PXPeoplePickerConfigurationController)peopleConfigController
{
  return self->_peopleConfigController;
}

- (NSLayoutConstraint)photosIndicatorTopConstraint
{
  return self->_photosIndicatorTopConstraint;
}

- (void)setPhotosIndicatorTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_photosIndicatorTopConstraint, a3);
}

- (NSLayoutConstraint)photosIndicatorTopSafeAreaConstraint
{
  return self->_photosIndicatorTopSafeAreaConstraint;
}

- (void)setPhotosIndicatorTopSafeAreaConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_photosIndicatorTopSafeAreaConstraint, a3);
}

- (NSLayoutConstraint)photosIndicatorLeadingConstraint
{
  return self->_photosIndicatorLeadingConstraint;
}

- (void)setPhotosIndicatorLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_photosIndicatorLeadingConstraint, a3);
}

- (NSLayoutConstraint)photosIndicatorLeadingSafeAreaConstraint
{
  return self->_photosIndicatorLeadingSafeAreaConstraint;
}

- (void)setPhotosIndicatorLeadingSafeAreaConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_photosIndicatorLeadingSafeAreaConstraint, a3);
}

- (UIViewController)unavailableViewController
{
  return self->_unavailableViewController;
}

- (PUPickerSuggestionsView)pickerSuggestionsView
{
  return self->_pickerSuggestionsView;
}

- (PUPickerSuggestionResultFetcher)pickerSuggestionResultFetcher
{
  return self->_pickerSuggestionResultFetcher;
}

- (PUPickerSuggestionResultFetcherResult)pickerSuggestionResultFetcherResult
{
  return self->_pickerSuggestionResultFetcherResult;
}

- (void)setPickerSuggestionResultFetcherResult:(id)a3
{
  objc_storeStrong((id *)&self->_pickerSuggestionResultFetcherResult, a3);
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingConstraint, a3);
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingConstraint, a3);
}

- (NSLayoutConstraint)topSafeAreaConstraint
{
  return self->_topSafeAreaConstraint;
}

- (void)setTopSafeAreaConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topSafeAreaConstraint, a3);
}

- (NSLayoutConstraint)bottomSafeAreaConstraint
{
  return self->_bottomSafeAreaConstraint;
}

- (void)setBottomSafeAreaConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomSafeAreaConstraint, a3);
}

- (int64_t)assetSortOrderType
{
  return self->_assetSortOrderType;
}

- (void)setAssetSortOrderType:(int64_t)a3
{
  self->_assetSortOrderType = a3;
}

- (int64_t)peopleSortOrderType
{
  return self->_peopleSortOrderType;
}

- (void)setPeopleSortOrderType:(int64_t)a3
{
  self->_peopleSortOrderType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_topSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_pickerSuggestionResultFetcherResult, 0);
  objc_storeStrong((id *)&self->_pickerSuggestionResultFetcher, 0);
  objc_storeStrong((id *)&self->_pickerSuggestionsView, 0);
  objc_storeStrong((id *)&self->_unavailableViewController, 0);
  objc_storeStrong((id *)&self->_photosIndicatorLeadingSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_photosIndicatorLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_photosIndicatorTopSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_photosIndicatorTopConstraint, 0);
  objc_storeStrong((id *)&self->_peopleConfigController, 0);
  objc_storeStrong((id *)&self->_allowedAssetsFetchResultForSearch, 0);
  objc_storeStrong((id *)&self->_searchQueryResult, 0);
  objc_storeStrong((id *)&self->_searchSuggestionsHeaderView, 0);
  objc_storeStrong((id *)&self->_searchSuggestionsCollectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_searchSuggestionsSectionProvider, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_searchResultUUIDs, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_photosViewConfiguration, 0);
  objc_storeStrong((id *)&self->_photosSelectionManager, 0);
  objc_storeStrong((id *)&self->_photosDataSourceManager, 0);
  objc_storeStrong((id *)&self->_lastVisiblePhotosViewController, 0);
  objc_storeStrong((id *)&self->_photosViewController, 0);
  objc_storeStrong((id *)&self->_toolbarSortAndFilterBarButtonItem, 0);
  objc_storeStrong((id *)&self->_toolbarNewAlbumBarButton, 0);
  objc_storeStrong((id *)&self->_toolbarOptionsBarButton, 0);
  objc_storeStrong((id *)&self->_toolbarShowSelectedGroup, 0);
  objc_storeStrong((id *)&self->_showSelectedButtonSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_showSelectedButtonTitleButton, 0);
  objc_storeStrong((id *)&self->_navigationBarBottomPalette, 0);
  objc_storeStrong((id *)&self->_navigationBarSegmentedControl, 0);
  objc_destroyWeak((id *)&self->_containerControllerActionHandler);
  objc_storeStrong((id *)&self->_resizeTaskDescriptorViewModel, 0);
  objc_storeStrong((id *)&self->_additionalSelectionState, 0);
  objc_storeStrong((id *)&self->_selectionCoordinator, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_sidebarViewController);
  objc_storeStrong((id *)&self->_collectionsViewController, 0);
  objc_storeStrong((id *)&self->_albumsViewController, 0);
  objc_storeStrong((id *)&self->_onboardingHeaderView, 0);
  objc_storeStrong((id *)&self->_photosIndicator, 0);
}

uint64_t __70__PUPickerContainerController_updateSearchResultsForSearchController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "representedObject");
}

void __58__PUPickerContainerController_sessionInfoStatusDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "selectionCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectionCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifySelectionWithRemovedOIDs:insertedOIDs:", v3, *(_QWORD *)(a1 + 40));

}

void __60__PUPickerContainerController_observable_didChange_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "selectionCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedObjectIDs");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "selectionCoordinator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "modifySelectionWithRemovedOIDs:insertedOIDs:", v7, v4);

    objc_msgSend(*(id *)(a1 + 32), "selectionCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modifySelectionWithRemovedOIDs:insertedOIDs:", v6, v7);

  }
}

void __59__PUPickerContainerController_handleToolbarNewAlbumButton___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLPickerGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to create new album): %@", buf, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "createdCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", v9);
  else
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__PUPickerContainerController_handleToolbarNewAlbumButton___block_invoke_436;
  v12[3] = &unk_1E58ABCA8;
  v12[4] = *(_QWORD *)(a1 + 40);
  v13 = v10;
  v11 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __59__PUPickerContainerController_handleToolbarNewAlbumButton___block_invoke_436(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "selectionCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectionCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifySelectionWithRemovedOIDs:insertedOIDs:", v3, *(_QWORD *)(a1 + 40));

}

uint64_t __58__PUPickerContainerController_handleToolbarOptionsButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void __67__PUPickerContainerController_handleNavigationBarSegmentedControl___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLPickerGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(a1 + 40))
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v10 = v9;
      v15 = 134218242;
      v16 = v8;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "Selected %ld sucessfully (same item: %@)", (uint8_t *)&v15, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 40))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = v12;
    objc_msgSend(v5, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218754;
    v16 = v11;
    v17 = 2112;
    v18 = v13;
    v19 = 2048;
    v20 = a2;
    v21 = 2112;
    v22 = v14;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Unable to select %ld (same item: %@) because of error (%ld): %@", (uint8_t *)&v15, 0x2Au);

  }
}

uint64_t __66__PUPickerContainerController__showPhotosIndicatorBrieflyIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "photosIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setPhotosIndicator:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPhotosIndicatorTopConstraint:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPhotosIndicatorTopSafeAreaConstraint:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPhotosIndicatorLeadingConstraint:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPhotosIndicatorLeadingSafeAreaConstraint:", 0);
}

uint64_t __66__PUPickerContainerController__showPhotosIndicatorBrieflyIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDidShowPhotosIndicator:", 1);
}

uint64_t __66__PUPickerContainerController__updateSelectionStatusBarButtonItem__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAttributedTitle:forState:", *(_QWORD *)(a1 + 40), 0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __77__PUPickerContainerController__confirmationBarButtonItemWithTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "containerControllerActionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "containerController:didTapAddButton:", v5, v6);
}

void __77__PUPickerContainerController__cancellationBarButtonItemWithTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "containerControllerActionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "containerController:didTapClearButton:", v5, v6);
}

void __77__PUPickerContainerController__cancellationBarButtonItemWithTraitCollection___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "containerControllerActionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "containerController:didTapCancelButton:", v5, v6);
}

void __77__PUPickerContainerController__cancellationBarButtonItemWithTraitCollection___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "containerControllerActionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "containerController:didTapAddButton:", v5, v6);
}

void __45__PUPickerContainerController__updateToolbar__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(unsigned __int8 *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setPrefersToolbarVisible:", v2);
  objc_msgSend(v3, "setPrefersTabBarVisible:", 0);

}

void __78__PUPickerContainerController__updatePhotosViewControllerNoContentPlaceholder__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setShowLoadingPlaceholderWhenEmpty:", 0);
  objc_msgSend(v3, "setNoContentPlaceholderFallbackTitle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setNoContentPlaceholderFallbackMessage:", *(_QWORD *)(a1 + 40));

}

void __53__PUPickerContainerController__updateFilterPredicate__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilterPredicate:provideIncrementalChangeDetailsForAssetCollections:", v4, v5);

  if (v3)
}

uint64_t __53__PUPickerContainerController__updateFilterPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __53__PUPickerContainerController__updateFilterPredicate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetUUID");
}

void __66__PUPickerContainerController__performPhotosGridActionIfPossible___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLPickerGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    if (a2)
      v8 = CFSTR("YES");
    v9 = v8;
    v10 = 138412802;
    v11 = v7;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Finished action %@ with success %@ and error %@", (uint8_t *)&v10, 0x20u);

  }
}

uint64_t __83__PUPickerContainerController_photosGridActionPerformer_contentFilterStateChanged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentFilterState:", *(_QWORD *)(a1 + 32));
}

void __51__PUPickerContainerController_onboardingHeaderView__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performChanges:", &__block_literal_global_296);

}

uint64_t __51__PUPickerContainerController_onboardingHeaderView__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDidDismissOnboardingHeaderView:", 1);
}

void __56__PUPickerContainerController_setSidebarViewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 == 1
    || (objc_msgSend(*(id *)(a1 + 32), "configuration"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "sourceType"),
        v6,
        v7))
  {
    PLPickerGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134218242;
      v12 = a2;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "Completed content view navigation with result: %ld (error: %@)", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B868]), "initWithType:revealMode:", 22, 0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "navigateToDestination:options:completionHandler:", v9, 0, &__block_literal_global_292_73669);

  }
}

void __56__PUPickerContainerController_setSidebarViewController___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPickerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218242;
    v7 = a2;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Completed fallback content view navigation with result: %ld (error: %@)", (uint8_t *)&v6, 0x16u);
  }

}

void __55__PUPickerContainerController__peopleSortAndFilterMenu__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "peopleSortOrderType");

  switch(v3)
  {
    case 2:
      goto LABEL_4;
    case 1:
      v4 = objc_loadWeakRetained(v1);
      v5 = v4;
      v6 = 2;
      goto LABEL_6;
    case 0:
LABEL_4:
      v4 = objc_loadWeakRetained(v1);
      v5 = v4;
      v6 = 1;
LABEL_6:
      objc_msgSend(v4, "setPeopleSortOrderType:", v6);

      break;
  }
  v7 = objc_loadWeakRetained(v1);
  objc_msgSend(v7, "_updateSortAndFilterMenu");

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "_updatePeopleSort");

}

void __55__PUPickerContainerController__peopleSortAndFilterMenu__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPeopleSortOrderType:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_updateSortAndFilterMenu");

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "_updatePeopleSort");

}

void __55__PUPickerContainerController__updateSortAndFilterMenu__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAssetSortOrderType:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_updateSortAndFilterMenu");

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "_updateSortDescriptors");

}

void __55__PUPickerContainerController__updateSortAndFilterMenu__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAssetSortOrderType:", 1);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_updateSortAndFilterMenu");

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "_updateSortDescriptors");

}

void __67__PUPickerContainerController__setupSearchWithPickerConfiguration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "searchResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("PPT_AssetPickerDidFinishSearchQuery"), 0);

  }
  if (a2 != 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_filterWithSearchQueryResult:", v9);

  }
}

void __112__PUPickerContainerController__setupViewControllersWithConfiguration_loadingStatusManager_selectionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_filterWithSearchResultUUIDs:", v3);

}

void __112__PUPickerContainerController__setupViewControllersWithConfiguration_loadingStatusManager_selectionCoordinator___block_invoke_2(uint64_t a1, char a2)
{
  void *v2;
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "pickerSuggestionsView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "clearFilterableSuggestion");

  }
}

void __112__PUPickerContainerController__setupViewControllersWithConfiguration_loadingStatusManager_selectionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v5);
}

void __112__PUPickerContainerController__setupViewControllersWithConfiguration_loadingStatusManager_selectionCoordinator___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_filterWithSuggestionResult:", *(_QWORD *)(a1 + 32));

}

void __52__PUPickerContainerController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShouldStopScrollingItemsViewControllerToTop:", 1);

}

uint64_t __42__PUPickerContainerController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateAssetsForResizing");
}

- (void)ppt_switchToAlbumsTab
{
  id v3;

  -[PUPickerContainerController navigationBarSegmentedControl](self, "navigationBarSegmentedControl");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedSegmentIndex:", 1);
  -[PUPickerContainerController handleNavigationBarSegmentedControl:](self, "handleNavigationBarSegmentedControl:", v3);

}

- (void)ppt_prepareForSearchTest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  void *v10;
  _QWORD block[4];
  id v12;
  id v13;

  v5 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[PUPickerContainerController searchController](self, "searchController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerContainerController.m"), 2668, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchBar"));

    }
    objc_msgSend(v7, "becomeFirstResponder");
    v8 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PUPickerContainerController_PPT__ppt_prepareForSearchTest___block_invoke;
    block[3] = &unk_1E58AB968;
    v12 = v7;
    v13 = v5;
    v9 = v7;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __61__PUPickerContainerController_PPT__ppt_prepareForSearchTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
