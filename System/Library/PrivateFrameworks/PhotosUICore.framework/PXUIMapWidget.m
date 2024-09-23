@implementation PXUIMapWidget

- (PXUIMapWidget)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIMapWidget.m"), 205, CFSTR("%s is not available as initializer"), "-[PXUIMapWidget init]");

  abort();
}

- (PXUIMapWidget)initWithEnableCuratedThumbnails:(BOOL)a3
{
  PXUIMapWidget *v4;
  PXUIMapWidget *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *fetchedImages;
  NSMutableArray *v8;
  NSMutableArray *nearbyCountCompletionBlocks;
  uint64_t v10;
  NSString *cachedLocalizedTitle;
  os_log_t v12;
  OS_os_log *logger;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXUIMapWidget;
  v4 = -[PXUIMapWidget init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_enableCuratedThumbnails = a3;
    v4->_height = 171.0;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fetchedImages = v5->_fetchedImages;
    v5->_fetchedImages = v6;

    v5->_lastFetchedBoundingRectAssetCount = -1;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    nearbyCountCompletionBlocks = v5->__nearbyCountCompletionBlocks;
    v5->__nearbyCountCompletionBlocks = v8;

    v5->_contentSize = (CGSize)*MEMORY[0x1E0C9D820];
    PXLocalizedStringFromTable(CFSTR("PXPlacesWidgetTitle"), CFSTR("PhotosUICore"));
    v10 = objc_claimAutoreleasedReturnValue();
    cachedLocalizedTitle = v5->__cachedLocalizedTitle;
    v5->__cachedLocalizedTitle = (NSString *)v10;

    v12 = os_log_create("com.apple.photos.infopanel", "InfoPanel");
    logger = v5->_logger;
    v5->_logger = (OS_os_log *)v12;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[PXUIMapWidget unloadContentData](self, "unloadContentData");
  v3.receiver = self;
  v3.super_class = (Class)PXUIMapWidget;
  -[PXUIMapWidget dealloc](&v3, sel_dealloc);
}

- (void)setShowAddressLink:(BOOL)a3
{
  if (self->_showAddressLink != a3)
  {
    self->_showAddressLink = a3;
    if (self->_isLoaded)
      -[PXUIMapWidget _reloadFooterTitle](self, "_reloadFooterTitle");
  }
}

- (void)setContext:(id)a3
{
  PXPhotosDetailsContext *v4;
  void *v5;
  PXPhotosDetailsContext *context;
  id v7;

  v4 = (PXPhotosDetailsContext *)a3;
  -[PXPhotosDetailsContext photosDataSource](self->_context, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterChangeObserver:", self);

  -[PXPhotosDetailsContext photosDataSource](v4, "photosDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerChangeObserver:", self);
  context = self->_context;
  self->_context = v4;

  if (self->_isLoaded)
    -[PXUIMapWidget _reloadFooterTitle](self, "_reloadFooterTitle");

}

- (void)setContentSize:(CGSize)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  if (self->_contentSize.width != a3.width || self->_contentSize.height != a3.height)
  {
    self->_contentSize = a3;
    if (self->__contentView)
    {
      -[PXUIMapWidget _updateContentViewFrame](self, "_updateContentViewFrame");
      if (-[PXUIMapWidget _hasLocation](self, "_hasLocation"))
      {
        -[PXUIMapWidget _fetchResultsForSections](self, "_fetchResultsForSections");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v5 = -[PXUIMapWidget _hasLocation](self, "_hasLocation") ^ 1;
        -[PXUIMapWidget _imageView](self, "_imageView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "frame");
        -[PXUIMapWidget _fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:](self, "_fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:", v5, v9, 0, v7, v8);

      }
    }
  }
}

- (BOOL)infoPanelLayoutEnabled
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[PXUIMapWidget spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  -[PXUIMapWidget context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "viewSourceOrigin");

  return v6 == 1 && v4 != 3;
}

- (NSString)snappableWidgetIdentifier
{
  return (NSString *)CFSTR("PXUIMapWidget");
}

- (void)_loadContainerView
{
  double width;
  double height;
  UIView *v5;
  UIView *contentView;
  void *v7;
  double v8;
  double v9;
  PXImageViewSpec *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  double v14;
  double v15;
  PXImageUIView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UIImageView *v30;
  void *v31;
  void *v32;
  UIImageView *chevronImageView;
  UIButton *v34;
  void *v35;
  void *v36;
  void *v37;
  UIButton *adjustButton;
  UIButton *v39;
  UIView *footerView;
  UIView *v41;
  UIView *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  UIView *v47;
  UIView *containerView;
  PXPlacesUtils *v49;
  void *v50;
  _PXPlacesSnapshotKey *v51;
  double v52;
  double v53;
  _PXPlacesSnapshotKey *v54;
  void *v55;
  UIImageView *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;

  if (!self->__containerView)
  {
    width = self->_contentSize.width;
    height = self->_contentSize.height;
    v5 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, width, height);
    contentView = self->__contentView;
    self->__contentView = v5;

    -[PXUIMapWidget widgetDelegate](self, "widgetDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widgetExtendedTraitCollection:", self);
    v60 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v60, "displayScale");
    v9 = v8;
    v10 = objc_alloc_init(PXImageViewSpec);
    -[PXUIMapWidget spec](self, "spec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXViewSpec setBackgroundColor:](v10, "setBackgroundColor:");
    -[PXViewSpec setDisplayScale:](v10, "setDisplayScale:", v9);
    v12 = objc_msgSend(v60, "userInterfaceIdiom");
    v13 = -[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled");
    -[PXUIMapWidget footerHeight](self, "footerHeight");
    v15 = height - v14;
    v16 = objc_alloc_init(PXImageUIView);
    -[PXImageUIView setFrame:](v16, "setFrame:", 0.0, 0.0, width, v15);
    objc_msgSend(v11, "defaultPlacesPlaceholderColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImageUIView setBackgroundColor:](v16, "setBackgroundColor:", v17);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapGestureRecognizer_);
    -[PXImageUIView addGestureRecognizer:](v16, "addGestureRecognizer:", v18);

    -[PXImageUIView setAutoresizingMask:](v16, "setAutoresizingMask:", 18);
    -[PXImageUIView setUserInteractionEnabled:](v16, "setUserInteractionEnabled:", 1);
    -[PXImageUIView setContentMode:](v16, "setContentMode:", 2);
    -[PXImageUIView setSpec:](v16, "setSpec:", v10);
    -[PXImageUIView setFloatingRotationEnabled:](v16, "setFloatingRotationEnabled:", 0);
    -[PXImageUIView setFloatingViewEnabled:](v16, "setFloatingViewEnabled:", v12 == 3);
    if (v12 != 3)
    {
      -[PXImageUIView setDrawsFocusRing:](v16, "setDrawsFocusRing:", 1);
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapGestureRecognizer_);
      objc_msgSend(v19, "setAllowedPressTypes:", &unk_1E53E9FF0);
      -[PXImageUIView addGestureRecognizer:](v16, "addGestureRecognizer:", v19);

    }
    objc_storeStrong((id *)&self->__imageView, v16);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel_userDidSelectFooter_, 64);
    PXLocalizedStringFromTable(CFSTR("PXPlacesWidgetFooterAddressButtonTitleAXLabel"), CFSTR("PhotosUICore"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAccessibilityLabel:", v21);

    PXLocalizedStringFromTable(CFSTR("PXPlacesWidgetFooterAddressButtonTitleAXHint"), CFSTR("PhotosUICore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAccessibilityHint:", v22);

    objc_msgSend(v20, "setAccessibilityIdentifier:", CFSTR("com.apple.photos.infoPanel.map.footer.address"));
    objc_storeStrong((id *)&self->_footerButton, v20);
    objc_msgSend(v20, "titleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLineBreakMode:", 5);
    objc_msgSend(v23, "setNumberOfLines:", -[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled"));
    objc_msgSend(v23, "setTextAlignment:", 4);
    if (v13)
    {
      -[PXUIMapWidget _updateFooterContextMenu](self, "_updateFooterContextMenu");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObserver:selector:name:object:", self, sel__clipboardChanged_, *MEMORY[0x1E0DC51B8], 0);

      v58 = v11;
      v25 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
      -[UIView setAutoresizingMask:](v25, "setAutoresizingMask:", 18);
      -[UIView contentView](v25, "contentView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addSubview:", v20);

      v27 = (void *)MEMORY[0x1E0DC3888];
      -[PXUIMapWidget footerFont](self, "footerFont");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "configurationWithFont:", v28);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v29);
      objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v30, "setTintColor:", v31);

      -[UIImageView setContentMode:](v30, "setContentMode:", 4);
      -[UIImageView setPreferredSymbolConfiguration:](v30, "setPreferredSymbolConfiguration:", v57);
      -[UIView contentView](v25, "contentView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addSubview:", v30);

      chevronImageView = self->_chevronImageView;
      self->_chevronImageView = v30;
      v56 = v30;

      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
      v34 = (UIButton *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(CFSTR("PXPlacesWidgetAdjustButtonTitle"), CFSTR("PhotosUICore"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitle:forState:](v34, "setTitle:forState:", v35, 0);

      -[UIButton addTarget:action:forControlEvents:](v34, "addTarget:action:forControlEvents:", self, sel__didTapAdjustLocation, 64);
      PXLocalizedStringFromTable(CFSTR("PXPlacesWidgetAdjustButtonTitleAXHint"), CFSTR("PhotosUICore"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setAccessibilityHint:](v34, "setAccessibilityHint:", v36);

      -[UIButton setAccessibilityIdentifier:](v34, "setAccessibilityIdentifier:", CFSTR("com.apple.photos.infoPanel.map.footer.adjust"));
      -[UIView contentView](v25, "contentView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addSubview:", v34);

      adjustButton = self->_adjustButton;
      self->_adjustButton = v34;
      v39 = v34;

      footerView = self->_footerView;
      self->_footerView = v25;
      v41 = v25;
      v11 = v58;
      v42 = v41;

      -[UIView layer](self->__contentView, "layer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setCornerRadius:", 8.0);

      -[UIView layer](self->__contentView, "layer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setMasksToBounds:", 1);

      -[UIView addSubview:](self->__contentView, "addSubview:", v16);
      -[UIView addSubview:](self->__contentView, "addSubview:", v42);

    }
    else
    {
      -[UIView addSubview:](self->__contentView, "addSubview:", v16);
      -[UIView addSubview:](self->__contentView, "addSubview:", v20);
    }
    -[PXUIMapWidget _reloadFooterTitle](self, "_reloadFooterTitle");
    -[PXUIMapWidget _updateContentViewFrame](self, "_updateContentViewFrame");
    v45 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "bounds");
    v47 = (UIView *)objc_msgSend(v45, "initWithFrame:");
    containerView = self->__containerView;
    self->__containerView = v47;

    -[UIView addSubview:](self->__containerView, "addSubview:", self->__contentView);
    v49 = objc_alloc_init(PXPlacesUtils);
    -[PXPlacesUtils pkExtendedTraitCollectionFromPXExtendedTraitCollection:](v49, "pkExtendedTraitCollectionFromPXExtendedTraitCollection:", v60);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = [_PXPlacesSnapshotKey alloc];
    -[PXUIMapWidget _estimatedMapViewImageSize](self, "_estimatedMapViewImageSize");
    v54 = -[_PXPlacesSnapshotKey initWithImageSize:userInterfaceStyle:](v51, "initWithImageSize:userInterfaceStyle:", objc_msgSend(v50, "userInterfaceStyle"), v52, v53);
    if (-[PXUIMapWidget _hasCachedSnapshotImageForKey:](self, "_hasCachedSnapshotImageForKey:", v54))
    {
      -[PXUIMapWidget _fetchResultsForSections](self, "_fetchResultsForSections");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXUIMapWidget _estimatedMapViewImageSize](self, "_estimatedMapViewImageSize");
      -[PXUIMapWidget _fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:](self, "_fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:", 0, v55, 0);

    }
    else
    {
      -[PXUIMapWidget _showPlaceholder](self, "_showPlaceholder");
    }

  }
}

- (void)_copyLocationTapped
{
  void *v2;
  id v3;

  -[PXUIMapWidget _firstAsset](self, "_firstAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    PXCopyLocationFromAssetToPasteboard(v2);
    v2 = v3;
  }

}

- (BOOL)_containsLocationInPasteboard
{
  uint64_t v2;
  void *v3;
  char v4;

  -[PXUIMapWidget _firstAsset](self, "_firstAsset");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = PXCanAssignLocationFromPasteboardToAsset(v2);
  else
    v4 = 0;

  return v4;
}

- (void)_pasteLocationTapped
{
  void *v2;
  id v3;

  -[PXUIMapWidget _firstAsset](self, "_firstAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    PXAssignLocationFromPasteboardToAsset(v2);
    v2 = v3;
  }

}

- (void)_didTapAdjustLocation
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (-[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled"))
  {
    v3 = (void *)MEMORY[0x1E0D09910];
    v9 = *MEMORY[0x1E0D09830];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.infoPanelAdjustLocationTapped"), v6);

  }
  -[PXUIMapWidget widgetUnlockDelegate](self, "widgetUnlockDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__PXUIMapWidget__didTapAdjustLocation__block_invoke;
  v8[3] = &unk_1E5149198;
  v8[4] = self;
  objc_msgSend(v7, "widget:performAfterUnlockingDeviceIfNecessary:failurehandler:", self, v8, 0);

}

- (void)loadContentData
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  self->_isLoaded = 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleContentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  if (-[PXUIMapWidget _hasLocation](self, "_hasLocation"))
  {
    -[PXUIMapWidget _estimatedMapViewImageSize](self, "_estimatedMapViewImageSize");
    v5 = v4;
    v7 = v6;
    -[PXUIMapWidget _fetchResultsForSections](self, "_fetchResultsForSections");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PXUIMapWidget _fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:](self, "_fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:", 0, v8, 0, v5, v7);

  }
}

- (CGSize)_estimatedMapViewImageSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[PXUIMapWidget spec](self, "spec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentGuideInsets");

  PXEdgeInsetsInsetRect();
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)unloadContentData
{
  id v3;

  self->_isLoaded = 0;
  -[PXPhotosDetailsContext photosDataSource](self->_context, "photosDataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterChangeObserver:", self);

}

- (void)_setHasLoadedContentData:(BOOL)a3
{
  id v4;

  if (self->_hasLoadedContentData != a3)
  {
    self->_hasLoadedContentData = a3;
    -[PXUIMapWidget widgetDelegate](self, "widgetDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetHasLoadedContentDataDidChange:", self);

  }
}

- (void)_handleContentSizeCategoryDidChange:(id)a3
{
  UIFont *footerFont;

  footerFont = self->_footerFont;
  self->_footerFont = 0;

  -[PXUIMapWidget _updateFooterHeight](self, "_updateFooterHeight");
  -[PXUIMapWidget _updateFooterButton](self, "_updateFooterButton");
}

- (id)_fetchResultsForSections
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXUIMapWidget context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "numberOfSections") >= 1)
  {
    v6 = 0;
    do
    {
      objc_msgSend(v5, "assetsInSection:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

      ++v6;
    }
    while (objc_msgSend(v5, "numberOfSections") > v6);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)_fetchCountOfAssetsWithLocation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;
  CLLocationCoordinate2D v26;

  v25 = *MEMORY[0x1E0C80C00];
  -[PXUIMapWidget _fetchResultsForSections](self, "_fetchResultsForSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v16;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v16 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "locationCoordinate");
              v5 += CLLocationCoordinate2DIsValid(v26);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v11);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateContentViewFrame
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

  -[PXUIMapWidget spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentGuideInsets");

  PXEdgeInsetsInsetRect();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PXUIMapWidget _contentView](self, "_contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[PXUIMapWidget _layoutSubviews](self, "_layoutSubviews");
}

- (void)_layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double MaxY;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double MaxX;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  void *v117;
  _BOOL8 v118;
  void *v119;
  double v120;
  id v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;

  -[PXUIMapWidget spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentGuideInsets");

  v4 = 0.0;
  PXEdgeInsetsInsetRect();
  v6 = v5;
  v8 = v7;
  -[PXUIMapWidget footerHeight](self, "footerHeight");
  v10 = v9;
  -[PXUIMapWidget spec](self, "spec");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");

  v12 = -[PXUIMapWidget _hasLocation](self, "_hasLocation");
  -[PXUIMapWidget _firstAsset](self, "_firstAsset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "canPerformEditOperation:", 3);

  if (v12)
  {
    v15 = v8 - v10;
    v16 = v6;
    v17 = 0.0;
  }
  else
  {
    v17 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  -[PXUIMapWidget _imageView](self, "_imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v17, v4, v16, v15);

  v19 = !v12;
  -[PXUIMapWidget _imageView](self, "_imageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", v19);

  if ((v19 & 1) != 0)
  {
    v21 = 1;
  }
  else
  {
    -[PXUIMapWidget cachedFooterTitle](self, "cachedFooterTitle");
    v19 = objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend((id)v19, "length") == 0;
  }
  -[PXUIMapWidget chevronImageView](self, "chevronImageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setHidden:", v21);

  if (v12)
  {

    v23 = v14 ^ 1u;
  }
  else
  {
    v23 = 1;
  }
  -[PXUIMapWidget adjustButton](self, "adjustButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHidden:", v23);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "userInterfaceLayoutDirection");

  if (!v12)
  {
    -[PXUIMapWidget footerButton](self, "footerButton");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setContentHorizontalAlignment:", 0);

    -[PXUIMapWidget footerButton](self, "footerButton");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setContentVerticalAlignment:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIMapWidget footerButton](self, "footerButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setBackgroundColor:", v48);

    -[PXUIMapWidget footerButton](self, "footerButton");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "layer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setCornerRadius:", 8.0);

    -[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled");
LABEL_18:
    if (-[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled"))
    {
      PXRectRoundToPixel();
      v53 = v52;
      v55 = v54;
      v57 = v56;
      v59 = v58;
      -[PXUIMapWidget footerView](self, "footerView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setFrame:", v53, v55, v57, v59);

      -[PXUIMapWidget footerView](self, "footerView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "frame");
      v63 = v62;
      v65 = v64;
      v67 = v66;
      v69 = v68;
      -[PXUIMapWidget footerButton](self, "footerButton");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setFrame:", v63, v65, v67, v69);

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXUIMapWidget footerView](self, "footerView");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setBackgroundColor:", v71);

    }
    else
    {
      v123.origin.x = v17;
      v123.origin.y = v4;
      v123.size.width = v16;
      v123.size.height = v15;
      CGRectGetMaxY(v123);
      -[PXUIMapWidget spec](self, "spec");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "distanceBetweenMapViewAndAddressTop");

      PXRectRoundToPixel();
      v75 = v74;
      v77 = v76;
      v79 = v78;
      v81 = v80;
      -[PXUIMapWidget footerButton](self, "footerButton");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setFrame:", v75, v77, v79, v81);
    }

    -[PXUIMapWidget footerButton](self, "footerButton");
    v121 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "setHidden:", 0);
    goto LABEL_27;
  }
  if (v26 == 1)
    v27 = 2;
  else
    v27 = 1;
  -[PXUIMapWidget footerButton](self, "footerButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setContentHorizontalAlignment:", v27);

  -[PXUIMapWidget footerButton](self, "footerButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setContentVerticalAlignment:", 0);

  -[PXUIMapWidget footerButton](self, "footerButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBackgroundColor:", 0);

  if (!-[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled"))
    goto LABEL_18;
  v122.origin.x = v17;
  v122.origin.y = v4;
  v122.size.width = v16;
  v122.size.height = v15;
  MaxY = CGRectGetMaxY(v122);
  PXRectRoundToPixel();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  -[PXUIMapWidget footerView](self, "footerView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIMapWidget footerView](self, "footerView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setBackgroundColor:", v41);

  -[PXUIMapWidget adjustButton](self, "adjustButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "intrinsicContentSize");
  v45 = v44;

  if (v26 == 1)
    MEMORY[0x1A85CD2B8](v6 - (v45 + 9.0), 0.0, v45, v10, 0.0, MaxY, v6, v10);
  PXRectRoundToPixel();
  v83 = v82;
  v85 = v84;
  v87 = v86;
  v89 = v88;
  -[PXUIMapWidget adjustButton](self, "adjustButton");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setFrame:", v83, v85, v87, v89);

  -[PXUIMapWidget chevronImageView](self, "chevronImageView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "image");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "size");
  v94 = v93;

  v120 = MaxY;
  -[PXUIMapWidget footerButton](self, "footerButton");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "intrinsicContentSize");
  v97 = v96;

  v98 = fmin(v97, v6 - (v45 + 36.0 + v94 + 2.0));
  v124.origin.x = 9.0;
  v124.origin.y = 0.0;
  v124.size.width = v98;
  v124.size.height = v10;
  MaxX = CGRectGetMaxX(v124);
  if (v26 == 1)
    MEMORY[0x1A85CD2B8](9.0, 0.0, v98, v10, 0.0, MaxY, v6, v10);
  PXRectRoundToPixel();
  v101 = v100;
  v103 = v102;
  v105 = v104;
  v107 = v106;
  -[PXUIMapWidget footerButton](self, "footerButton");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setFrame:", v101, v103, v105, v107);

  if (v26 == 1)
    MEMORY[0x1A85CD2B8](MaxX + 2.0, 0.0, v94, v10, 0.0, v120, v6, v10);
  PXRectRoundToPixel();
  v110 = v109;
  v112 = v111;
  v114 = v113;
  v116 = v115;
  -[PXUIMapWidget chevronImageView](self, "chevronImageView");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setFrame:", v110, v112, v114, v116);

  -[PXUIMapWidget cachedFooterTitle](self, "cachedFooterTitle");
  v121 = (id)objc_claimAutoreleasedReturnValue();
  v118 = objc_msgSend(v121, "length") == 0;
  -[PXUIMapWidget footerButton](self, "footerButton");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setHidden:", v118);

LABEL_27:
}

- (void)_showPlaceholder
{
  -[PXUIMapWidget _setImage:animated:](self, "_setImage:animated:", 0, 0);
}

- (void)setSpec:(id)a3
{
  PXWidgetSpec *v5;
  PXWidgetSpec *v6;

  v5 = (PXWidgetSpec *)a3;
  if (self->_spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXUIMapWidget _updateFooterHeight](self, "_updateFooterHeight");
    -[PXUIMapWidget _updateHeight](self, "_updateHeight");
    -[PXUIMapWidget _updateContentViewFrame](self, "_updateContentViewFrame");
    v5 = v6;
  }

}

- (BOOL)hasContentForCurrentInput
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  BOOL v11;
  BOOL v12;

  -[PXUIMapWidget _firstAsset](self, "_firstAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled");
  -[PXUIMapWidget context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "viewSourceOrigin");

  v7 = objc_msgSend(v3, "canPerformEditOperation:", 3);
  -[PXUIMapWidget widgetUnlockDelegate](self, "widgetUnlockDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "widgetDeviceIsUnlocked:", self);

  if (v9)
  {
    v10 = -[PXUIMapWidget _hasLocation](self, "_hasLocation");
    if (v6 == 1)
      v11 = v7;
    else
      v11 = 0;
    if (v10 || !v4)
      v12 = v10;
    else
      v12 = v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_hasLocation
{
  void *v2;
  void *v3;
  BOOL HasLocationForDataSource;

  -[PXUIMapWidget context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HasLocationForDataSource = PXPhotosDetailsContextHasLocationForDataSource(v3);

  return HasLocationForDataSource;
}

- (double)preferredContentHeightForWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[PXUIMapWidget spec](self, "spec", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentGuideInsets");
  v6 = v5;
  v8 = v7;

  return v8 + v6 + self->_height;
}

- (PXAnonymousView)contentView
{
  PXAnonymousView *result;

  -[PXUIMapWidget _loadContainerView](self, "_loadContainerView");
  result = -[PXUIMapWidget _containerView](self, "_containerView");
  self->_didDisplayContentView = 1;
  return result;
}

- (NSString)localizedTitle
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  id v7;

  -[PXUIMapWidget _cachedLocalizedTitle](self, "_cachedLocalizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIMapWidget context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "viewSourceOrigin") == 1)
  {
    v5 = -[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled");

    if (v5)
    {
      v6 = 0;
      goto LABEL_9;
    }
  }
  else
  {

  }
  if (v3)
  {
    v7 = v3;
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXPlacesWidgetTitle"), CFSTR("PhotosUICore"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v7;
LABEL_9:

  return (NSString *)v6;
}

- (NSString)localizedDisclosureTitle
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;

  -[PXUIMapWidget context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "viewSourceOrigin");

  v5 = -[PXFeatureSpec userInterfaceIdiom](self->_spec, "userInterfaceIdiom") == 3 || v4 == 1;
  if (v5 && -[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled"))
  {
    v6 = 0;
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXPlacesNearbyAssets"), CFSTR("PhotosUICore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (BOOL)allowUserInteractionWithSubtitle
{
  return 1;
}

- (id)_firstAsset
{
  void *v2;
  void *v3;

  -[PXUIMapWidget context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateFooterHeight
{
  _BOOL4 v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  v3 = -[PXUIMapWidget showAddressLink](self, "showAddressLink");
  if (-[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled"))
  {
    if (-[PXUIMapWidget _hasLocation](self, "_hasLocation"))
      v4 = 38.0;
    else
      v4 = 42.0;
  }
  else
  {
    v4 = 0.0;
    if (v3)
    {
      -[PXUIMapWidget _contentView](self, "_contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "frame");
      v7 = v6;

      -[PXUIMapWidget footerButton](self, "footerButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "titleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sizeThatFits:", v7, 0.0);
      v11 = v10;

      -[PXUIMapWidget spec](self, "spec");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "distanceBetweenMapViewAndAddressTop");
      v4 = v11 + v13;

    }
  }
  -[PXUIMapWidget setFooterHeight:](self, "setFooterHeight:", v4);
}

- (void)setFooterHeight:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_footerHeight = a3;
    -[PXUIMapWidget _updateHeight](self, "_updateHeight");
  }
}

- (id)_reloadFooterQueue
{
  if (_reloadFooterQueue_onceToken != -1)
    dispatch_once(&_reloadFooterQueue_onceToken, &__block_literal_global_222_176320);
  return (id)_reloadFooterQueue_queue;
}

- (void)_reloadFooterTitle
{
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id location;

  if (-[PXUIMapWidget showAddressLink](self, "showAddressLink"))
  {
    if (-[PXUIMapWidget _hasLocation](self, "_hasLocation"))
    {
      objc_initWeak(&location, self);
      -[PXUIMapWidget _reloadFooterQueue](self, "_reloadFooterQueue");
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __35__PXUIMapWidget__reloadFooterTitle__block_invoke;
      block[3] = &unk_1E5148D30;
      objc_copyWeak(&v6, &location);
      dispatch_async(v3, block);

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      PXLocalizedStringFromTable(CFSTR("PXPlacesWidgetAddLocationButtonTitle"), CFSTR("PhotosUICore"));
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[PXUIMapWidget _updateFooterWithTitle:](self, "_updateFooterWithTitle:", v4);

    }
  }
}

- (void)_handleReloadFooterTitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *logger;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _BYTE location[12];
  __int16 v34;
  void *v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D09910], "startSignpost");
  -[PXUIMapWidget _firstAsset](self, "_firstAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchPropertySetsIfNeeded");
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v8 = objc_msgSend(v5, "requestAssetRevGeocodingForAssetLocalIdentifiers:withError:", v7, &v30);
  v9 = v30;

  if ((v8 & 1) == 0)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      v23 = logger;
      objc_msgSend(v4, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138478083;
      *(_QWORD *)&location[4] = v24;
      v34 = 2114;
      v35 = v25;
      _os_log_error_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "PXUIMapWidget error requesting rev geocoding for assetuuid: %{private}@, error: %{public}@", location, 0x16u);

    }
  }
  -[PXUIMapWidget _firstAsset](self, "_firstAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[PXUIMapWidget _localizedGeoDescriptionForAsset:](self, "_localizedGeoDescriptionForAsset:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0D09910];
    v13 = v4;
    v14 = v5;
    v15 = v9;
    v16 = *MEMORY[0x1E0D09708];
    v17 = *MEMORY[0x1E0D09828];
    v31[0] = *MEMORY[0x1E0D09850];
    v31[1] = v17;
    v32[0] = CFSTR("com.apple.photos.CPAnalytics.infoPanelRevGeoLookupDuration");
    v32[1] = v11;
    v31[2] = *MEMORY[0x1E0D09830];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v16;
    v9 = v15;
    v5 = v14;
    v4 = v13;
    objc_msgSend(v12, "endSignpost:forEventName:withPayload:", v3, v21, v20);

    objc_initWeak((id *)location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PXUIMapWidget__handleReloadFooterTitle__block_invoke;
    block[3] = &unk_1E5147280;
    v28 = v26;
    v22 = v26;
    objc_copyWeak(&v29, (id *)location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v29);

    objc_destroyWeak((id *)location);
  }

}

- (void)_updateFooterWithTitle:(id)a3
{
  -[PXUIMapWidget setCachedFooterTitle:](self, "setCachedFooterTitle:", a3);
  -[PXUIMapWidget _updateFooterButton](self, "_updateFooterButton");
  -[PXUIMapWidget _updateFooterHeight](self, "_updateFooterHeight");
}

- (void)_updateFooterContextMenu
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v3 = -[PXUIMapWidget _hasLocation](self, "_hasLocation");
  v4 = -[PXUIMapWidget _containsLocationInPasteboard](self, "_containsLocationInPasteboard");
  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mapWidgetAllowCopyPasteLocation");

  -[PXUIMapWidget context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photosDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsMultipleAssets");

  if ((v3 || v4) && v6 && (v9 & 1) == 0)
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
    -[PXUIMapWidget _contentView](self, "_contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addInteraction:", v11);

  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__PXUIMapWidget_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v5[3] = &unk_1E5135EE0;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_contextMenuActions
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PXUIMapWidget _containsLocationInPasteboard](self, "_containsLocationInPasteboard"))
  {
    -[PXUIMapWidget _pasteLocationAction](self, "_pasteLocationAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  if (-[PXUIMapWidget _hasLocation](self, "_hasLocation"))
  {
    v5 = -[PXUIMapWidget _copyLocationAction](self, "_copyLocationAction");
    objc_msgSend(v3, "addObject:", v5);

  }
  return v3;
}

- (id)_pasteLocationAction
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  PXLocalizedStringFromTable(CFSTR("PXPlacesWidgetPasteLocationButtonTitle"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__PXUIMapWidget__pasteLocationAction__block_invoke;
  v6[3] = &unk_1E5147F40;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, 0, 0, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (id)_copyLocationAction
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  PXLocalizedStringFromTable(CFSTR("PXPlacesWidgetCopyLocationButtonTitle"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PXUIMapWidget__copyLocationAction__block_invoke;
  v6[3] = &unk_1E5147F40;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, 0, 0, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (void)_updateFooterButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
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
  id v20;
  id v21;
  void *v22;
  char v23;
  double v24;
  id v25;
  void (**v26)(_QWORD);
  _QWORD aBlock[4];
  id v28;

  -[PXUIMapWidget footerButton](self, "footerButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIMapWidget adjustButton](self, "adjustButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIMapWidget chevronImageView](self, "chevronImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIMapWidget footerFont](self, "footerFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v7 != v8;
  if (v7 != v8)
  {
    -[PXUIMapWidget footerFont](self, "footerFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    v12 = (void *)MEMORY[0x1E0DC3888];
    -[PXUIMapWidget footerFont](self, "footerFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configurationWithFont:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setPreferredSymbolConfiguration:", v14);
  }
  objc_msgSend(v4, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIMapWidget footerFont](self, "footerFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 != v17)
  {
    -[PXUIMapWidget footerFont](self, "footerFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v18);

    v9 = 1;
  }
  if (-[PXUIMapWidget showAddressLink](self, "showAddressLink"))
  {
    -[PXUIMapWidget cachedFooterTitle](self, "cachedFooterTitle");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v3, "titleForState:", 0);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v20 == v21)
  {

LABEL_15:
    if (!v9)
      goto LABEL_20;
    goto LABEL_19;
  }
  v22 = v21;
  v23 = objc_msgSend(v20, "isEqualToString:", v21);

  if ((v23 & 1) != 0)
    goto LABEL_15;
  objc_msgSend(v3, "setTitle:forState:", v20, 0);
  objc_msgSend(v3, "setAccessibilityValue:", v20);
  objc_msgSend(v3, "alpha");
  if (v24 == 0.0 && v20)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__PXUIMapWidget__updateFooterButton__block_invoke;
    aBlock[3] = &unk_1E5149198;
    v25 = v3;
    v28 = v25;
    v26 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(v25, "px_intersectsWindowBounds"))
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v26, 0.25);
    else
      v26[2](v26);

  }
LABEL_19:
  -[PXUIMapWidget _layoutSubviews](self, "_layoutSubviews");
LABEL_20:

}

- (UIFont)footerFont
{
  UIFont *footerFont;
  UIFont *v4;
  UIFont *v5;

  footerFont = self->_footerFont;
  if (!footerFont)
  {
    if (-[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled"))
      MEMORY[0x1A85CC970](7, 0x8000, 7);
    else
      PXFontWithTextStyleSymbolicTraits();
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_footerFont;
    self->_footerFont = v4;

    footerFont = self->_footerFont;
  }
  return footerFont;
}

- (id)_localizedGeoDescriptionForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "fetchPropertySetsIfNeeded");
    if (-[PXUIMapWidget _requiresDetailedAddressFooterString](self, "_requiresDetailedAddressFooterString"))
    {
      objc_msgSend(v5, "px_singleLineMailingAddress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
      objc_msgSend(v5, "photosOneUpProperties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedGeoDescriptionIsHome:", &v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        PXLocalizedStringFromTable(CFSTR("PXPlacesWidgetHomeTitle"), CFSTR("PhotosUICore"));
        v8 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v8;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_requiresDetailedAddressFooterString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("CN"));
  return (char)v2;
}

- (void)_updateHeight
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  _BOOL4 v7;

  -[PXUIMapWidget spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 3)
  {
    -[PXUIMapWidget footerHeight](self, "footerHeight");
    v6 = v5 + 400.0;
  }
  else
  {
    v7 = -[PXUIMapWidget _hasLocation](self, "_hasLocation");
    v6 = 42.0;
    if (v7)
      v6 = 171.0;
  }
  -[PXUIMapWidget setHeight:](self, "setHeight:", v6);
}

- (void)setHeight:(double)a3
{
  id v5;

  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_height = a3;
    -[PXUIMapWidget widgetDelegate](self, "widgetDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetPreferredContentHeightForWidthDidChange:", self);

  }
}

- (void)userDidSelectFooter:(id)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  double latitude;
  double longitude;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];
  CLLocationCoordinate2D v20;

  v19[1] = *MEMORY[0x1E0C80C00];
  if (-[PXUIMapWidget _hasLocation](self, "_hasLocation", a3))
  {
    v4 = (void *)MEMORY[0x1E0D09910];
    v18 = *MEMORY[0x1E0D09830];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.infoPanelLocationTapped"), v7);

    -[PXUIMapWidget _firstAsset](self, "_firstAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PXUIMapWidget showAddressLink](self, "showAddressLink") && v8)
    {
      objc_msgSend(v8, "coordinate");
      latitude = v20.latitude;
      longitude = v20.longitude;
      if (CLLocationCoordinate2DIsValid(v20))
      {
        -[PXUIMapWidget _localizedGeoDescriptionForAsset:](self, "_localizedGeoDescriptionForAsset:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXUIMapWidget _openMapsAtCoordinate:title:](self, "_openMapsAtCoordinate:title:", v11, latitude, longitude);

      }
    }

  }
  else if (-[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled"))
  {
    v12 = (void *)MEMORY[0x1E0D09910];
    v16 = *MEMORY[0x1E0D09830];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.infoPanelAddLocationTapped"), v15);

    -[PXUIMapWidget _presentLocationSearchPicker](self, "_presentLocationSearchPicker");
  }
}

- (void)_openMapsAtCoordinate:(CLLocationCoordinate2D)a3 title:(id)a4
{
  double longitude;
  double latitude;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  PXUIMapWidget *v16;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = (void *)MEMORY[0x1E0C99D68];
  v8 = a4;
  objc_msgSend(v7, "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXProgressIndicatorAlertController beginShowingModalProgressWithConfiguration:](PXProgressIndicatorAlertController, "beginShowingModalProgressWithConfiguration:", &__block_literal_global_251_176291);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__PXUIMapWidget__openMapsAtCoordinate_title___block_invoke_2;
  v13[3] = &unk_1E5142230;
  v14 = v10;
  v15 = v9;
  v16 = self;
  v11 = v9;
  v12 = v10;
  +[PXPlacesMapController launchMapsAtCoordinate:withTitle:completionHandler:](PXPlacesMapController, "launchMapsAtCoordinate:withTitle:completionHandler:", v8, v13, latitude, longitude);

}

- (void)userDidSelectDisclosureControl
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXUIMapWidget widgetUnlockDelegate](self, "widgetUnlockDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__PXUIMapWidget_userDidSelectDisclosureControl__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "widget:performAfterUnlockingDeviceIfNecessary:failurehandler:", self, v4, 0);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") != 3)
    goto LABEL_12;
  -[PXUIMapWidget _imageView](self, "_imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[PXUIMapWidget _hasLocation](self, "_hasLocation");

    if (v7)
    {
      if (-[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled"))
      {
        v8 = (void *)MEMORY[0x1E0D09910];
        v26 = *MEMORY[0x1E0D09830];
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.infoPanelLocationTapped"), v11);

      }
      +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D72608]);

      objc_initWeak(&location, self);
      -[PXUIMapWidget widgetUnlockDelegate](self, "widgetUnlockDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __45__PXUIMapWidget__handleTapGestureRecognizer___block_invoke;
      v21[3] = &unk_1E5148D30;
      objc_copyWeak(&v22, &location);
      objc_msgSend(v13, "widget:performAfterUnlockingDeviceIfNecessary:failurehandler:", self, v21, 0);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
      goto LABEL_12;
    }
  }
  else
  {

  }
  if (!-[PXUIMapWidget _hasLocation](self, "_hasLocation"))
  {
    if (-[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled"))
    {
      v14 = (void *)MEMORY[0x1E0D09910];
      v24 = *MEMORY[0x1E0D09830];
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.infoPanelAddLocationTapped"), v17);

    }
    objc_initWeak(&location, self);
    -[PXUIMapWidget widgetUnlockDelegate](self, "widgetUnlockDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __45__PXUIMapWidget__handleTapGestureRecognizer___block_invoke_2;
    v19[3] = &unk_1E5148D30;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v18, "widget:performAfterUnlockingDeviceIfNecessary:failurehandler:", self, v19, 0);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
LABEL_12:

}

- (void)controllerTraitCollectionDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[PXUIMapWidget _imageView](self, "_imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;

  if ((PXSizeIsEmpty() & 1) == 0
    && -[PXUIMapWidget _hasLocation](self, "_hasLocation")
    && objc_msgSend(v6, "hasDifferentColorAppearanceComparedToTraitCollection:", v13))
  {
    -[PXUIMapWidget _fetchResultsForSections](self, "_fetchResultsForSections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIMapWidget _fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:](self, "_fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:", 0, v12, 0, v9, v11);

  }
}

- (void)_showPlacesWithContentMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXLibraryFilterState *v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    -[PXUIMapWidget _firstAsset](self, "_firstAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXUIMapWidget context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photosDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstAssetCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v18);
    v11 = -[PXLibraryFilterState viewMode](v10, "viewMode");
    v12 = PXPhotoKitAssetCollectionSupportsNearbyAssetsAffordance(v9);
    -[PXUIMapWidget _mapViewController](self, "_mapViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mapFetchResultsController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mapView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerCoordinate");
    +[PXLemonadeMapView makeViewWithPhotoLibrary:collection:libraryFilterViewMode:initialCenterCoordinate:wantsNearbyAssetsAffordance:enableGridView:](_TtC12PhotosUICore17PXLemonadeMapView, "makeViewWithPhotoLibrary:collection:libraryFilterViewMode:initialCenterCoordinate:wantsNearbyAssetsAffordance:enableGridView:", v6, v9, v11, v12, 1);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    v16 = 2;
  }
  else
  {
    -[PXUIMapWidget _mapViewControllerWithContentMode:](self, "_mapViewControllerWithContentMode:", a3);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fetchResultViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIMapWidget set_presentedMapViewController:](self, "set_presentedMapViewController:", v6);
    v16 = 1;
  }

  -[PXUIMapWidget widgetDelegate](self, "widgetDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "widget:transitionToViewController:withTransitionType:", self, v19, v16);

}

- (id)_mapViewControllerWithContentMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  PXPlacesMapContainerConfiguration *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  PXPlacesMapThumbnailRenderer *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  PXPlacesMapContainerConfiguration *v33;
  PXPlacesMapContainerViewController *v34;

  -[PXUIMapWidget _firstAsset](self, "_firstAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPlacesMapFetchResultViewController mapFetchResultsController](self->__mapViewController, "mapFetchResultsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mapView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerCoordinate");
  v10 = v9;
  v12 = v11;

  v13 = -[PXPlacesMapContainerConfiguration initWithConfiguration:]([PXPlacesMapContainerConfiguration alloc], "initWithConfiguration:", &__block_literal_global_261);
  v34 = -[PXPlacesMapContainerViewController initWithPhotoLibrary:configuration:]([PXPlacesMapContainerViewController alloc], "initWithPhotoLibrary:configuration:", v6, v13);
  -[PXPlacesMapContainerViewController fetchResultViewController](v34, "fetchResultViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mapFetchResultsController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEditLocationDelegate:", self);
  -[PXUIMapWidget _firstAsset](self, "_firstAsset");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "canPerformEditOperation:", 3);

  -[PXUIMapWidget context](self, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "viewSourceOrigin") == 1)
    v19 = v17;
  else
    v19 = 0;
  objc_msgSend(v14, "setCanEditLocation:", v19);

  objc_msgSend(v15, "setContentMode:", a3);
  objc_msgSend(v14, "setStyle:", 2);
  objc_msgSend(v14, "setShowNavigationBar:", -[PXFeatureSpec userInterfaceIdiom](self->_spec, "userInterfaceIdiom") != 3);
  objc_msgSend(v15, "mapControllerAccessor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mapViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "mapController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setInitialCenterCoordinate:", v10, v12);
  v23 = -[PXPlacesMapThumbnailRenderer initWithTraitCollection:informationDelegate:popoverImageType:popoverImageOptions:countLabelStyle:thumbnailCurationDelegate:]([PXPlacesMapThumbnailRenderer alloc], "initWithTraitCollection:informationDelegate:popoverImageType:popoverImageOptions:countLabelStyle:thumbnailCurationDelegate:", 0, 0, 2, 0, 0, 0);
  -[PXPlacesMapThumbnailRenderer minimumEdgeInsets](v23, "minimumEdgeInsets");
  objc_msgSend(v22, "setInitialEdgePadding:");
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "px_firstKeyWindow");
    v33 = v13;
    v25 = v7;
    v26 = v6;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    v29 = v28;
    v31 = v30;

    v6 = v26;
    v7 = v25;
    v13 = v33;

    objc_msgSend(v22, "setVisibleMapRelativeToViewPort:andViewSize:forRenderer:", self->_viewPort, v23, v29, v31);
  }
  objc_msgSend(v15, "preloadMap");
  -[PXUIMapWidget _loadMapDataWithFetchResultsController:](self, "_loadMapDataWithFetchResultsController:", v15);

  return v34;
}

- (void)_clipboardChanged:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pasteboardTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "containsObject:", CFSTR("com.apple.photos.pasteboard.location")))
    {
      v9 = -[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled");

      if (v9)
        -[PXUIMapWidget _updateFooterContextMenu](self, "_updateFooterContextMenu");
    }
    else
    {

    }
    v6 = v10;
  }

}

- (void)_presentLocationSearchPicker
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
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[PXUIMapWidget context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXUIMapWidget context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetsByCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CD13B8];
      v16[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transientAssetCollectionWithAssets:title:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXPhotosDetailsLocationSearchUIFactory searchViewControllerWithAssets:delegate:](PXPhotosDetailsLocationSearchUIFactory, "searchViewControllerWithAssets:delegate:", v13, self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXUIMapWidget widgetDelegate](self, "widgetDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "widget:transitionToViewController:withTransitionType:", self, v14, 2);

    }
  }

}

- (void)_hasLocationDidChange
{
  -[PXUIMapWidget _reloadFooterTitle](self, "_reloadFooterTitle");
  -[PXUIMapWidget _showPlaceholder](self, "_showPlaceholder");
  -[PXUIMapWidget _updateHeight](self, "_updateHeight");
  -[PXUIMapWidget _updateContentViewFrame](self, "_updateContentViewFrame");
  if (-[PXUIMapWidget infoPanelLayoutEnabled](self, "infoPanelLayoutEnabled"))
    -[PXUIMapWidget _updateFooterContextMenu](self, "_updateFooterContextMenu");
}

- (void)_loadMapDataWithFetchResultsController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PXUIMapWidget context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photosDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "numberOfSections") >= 1)
    {
      v8 = 0;
      do
      {
        objc_msgSend(v7, "assetsInSection:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v5, "addObject:", v9);

        ++v8;
      }
      while (objc_msgSend(v7, "numberOfSections") > v8);
    }
    v10 = objc_initWeak(&location, v4);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__PXUIMapWidget__loadMapDataWithFetchResultsController___block_invoke;
    v11[3] = &unk_1E5148D30;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "loadFetchResults:withCompletion:", v5, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  v7 = a4;
  if (self->__contentView)
  {
    +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "placesWidgetShowOnlyPlaceholder");

    if ((v9 & 1) == 0)
    {
      if (!objc_msgSend(v7, "hasIncrementalChanges"))
        goto LABEL_13;
      objc_msgSend(v7, "originatingPhotoLibraryChange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXUIMapWidget _firstAsset](self, "_firstAsset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "changeDetailsForObject:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "objectBeforeChanges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "px_descriptionForAssertionMessage");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIMapWidget.m"), 1188, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("assetChangeDetails.objectBeforeChanges"), v27, v28);

        }
      }
      objc_msgSend(v12, "objectAfterChanges");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "px_descriptionForAssertionMessage");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIMapWidget.m"), 1189, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("assetChangeDetails.objectAfterChanges"), v31, v32);

        }
      }
      objc_msgSend(v13, "location");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "location");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "distanceFromLocation:", v16);
      v18 = v17;
      objc_msgSend(v7, "contentChangedIndexPaths");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if ((v15 != 0) != (v16 != 0) || v18 != 0.0 || v20)
      {
LABEL_13:
        -[PXUIMapWidget _hasLocationDidChange](self, "_hasLocationDidChange");
        -[PXUIMapWidget _fetchResultsForSections](self, "_fetchResultsForSections");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeAllObjects](self->_fetchedImages, "removeAllObjects");
        if (-[PXUIMapWidget _hasLocation](self, "_hasLocation"))
        {
          -[PXUIMapWidget _estimatedMapViewImageSize](self, "_estimatedMapViewImageSize");
          -[PXUIMapWidget _fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:](self, "_fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:", 0, v21, 0);
          -[PXUIMapWidget _presentedMapViewController](self, "_presentedMapViewController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "mapFetchResultsController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXUIMapWidget _loadMapDataWithFetchResultsController:](self, "_loadMapDataWithFetchResultsController:", v23);

        }
      }
      -[PXUIMapWidget widgetDelegate](self, "widgetDelegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "widgetPreferredContentHeightForWidthDidChange:", self);

    }
  }

}

- (void)_fetchPlacesSnapshotUsingMapType:(unint64_t)a3 fetchResults:(id)a4 imageSize:(CGSize)a5 shouldFetchNearbyAssetCount:(BOOL)a6
{
  id v9;
  void *v10;
  void *v11;
  PXPlacesUtils *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _PXPlacesSnapshotKey *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_time_t v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  PXPlacesUtils *v27;
  id v28;
  id v29;
  id v30[4];
  BOOL v31;
  _QWORD block[4];
  _PXPlacesSnapshotKey *v33;
  id v34;
  id v35[3];
  id location[2];

  v9 = a4;
  objc_initWeak(location, self);
  -[PXUIMapWidget widgetDelegate](self, "widgetDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "widgetExtendedTraitCollection:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(PXPlacesUtils);
  -[PXPlacesUtils pkExtendedTraitCollectionFromPXExtendedTraitCollection:](v12, "pkExtendedTraitCollectionFromPXExtendedTraitCollection:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayScale");
  PXSizeRoundToPixel();
  v15 = v14;
  v17 = v16;
  v18 = -[_PXPlacesSnapshotKey initWithImageSize:userInterfaceStyle:]([_PXPlacesSnapshotKey alloc], "initWithImageSize:userInterfaceStyle:", objc_msgSend(v13, "userInterfaceStyle"), v14, v16);
  -[NSMutableDictionary objectForKey:](self->_fetchedImages, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[PXUIMapWidget _setImage:animated:](self, "_setImage:animated:", v19, 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIMapWidget _contentView](self, "_contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v20);

  }
  else
  {
    if (!a3)
    {
      v22 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __101__PXUIMapWidget__fetchPlacesSnapshotUsingMapType_fetchResults_imageSize_shouldFetchNearbyAssetCount___block_invoke;
      block[3] = &unk_1E513FDE8;
      objc_copyWeak(v35, location);
      v33 = v18;
      v34 = v9;
      v35[1] = *(id *)&v15;
      v35[2] = *(id *)&v17;
      dispatch_after(v22, MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(v35);
    }
    objc_msgSend((id)objc_opt_class(), "sharedSnapshotRequestConcurrentQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __101__PXUIMapWidget__fetchPlacesSnapshotUsingMapType_fetchResults_imageSize_shouldFetchNearbyAssetCount___block_invoke_2;
    v25[3] = &unk_1E5131CC8;
    objc_copyWeak(v30, location);
    v26 = v11;
    v27 = v12;
    v28 = v23;
    v30[1] = *(id *)&v15;
    v30[2] = *(id *)&v17;
    v30[3] = (id)a3;
    v29 = v9;
    v31 = a6;
    v24 = v23;
    dispatch_async(v24, v25);

    objc_destroyWeak(v30);
  }

  objc_destroyWeak(location);
}

- (void)_generateSnapshotsForExtendedTraitCollection:(id)a3 placesUtils:(id)a4 queue:(id)a5 size:(CGSize)a6 snapshotMapType:(unint64_t)a7 fetchResults:(id)a8 shouldFetchNearbyAssetCount:(BOOL)a9
{
  double height;
  double width;
  id v15;
  uint64_t v16;
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
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  _QWORD v42[5];
  id v43;
  id v44[4];
  BOOL v45;
  _QWORD v46[5];
  id v47;
  id v48[4];
  BOOL v49;
  id location;
  _QWORD v51[2];
  _QWORD v52[4];

  height = a6.height;
  width = a6.width;
  v52[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v40 = a4;
  v38 = a5;
  v37 = a8;
  v39 = v15;
  objc_msgSend(v15, "traitCollection");
  v16 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v16;
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0DC3E88];
    v52[0] = v16;
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "traitCollectionWithTraitsFromCollections:", v19);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0DC3E88];
    v51[0] = v36;
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "traitCollectionWithTraitsFromCollections:", v22);
    v32 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
    v34 = 0;
  }
  objc_msgSend(v40, "pkExtendedTraitCollectionFromPXExtendedTraitCollection:", v15, v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setUserInterfaceStyle:", 1);
  objc_msgSend(v23, "setTraitCollectionForMapKit:", v34);
  objc_msgSend(v40, "pkExtendedTraitCollectionFromPXExtendedTraitCollection:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setUserInterfaceStyle:", 2);
  objc_msgSend(v24, "setTraitCollectionForMapKit:", v33);
  -[PXUIMapWidget _snapshotOptionsForExtendedTraitCollection:queue:viewSize:snapshotMapType:](self, "_snapshotOptionsForExtendedTraitCollection:queue:viewSize:snapshotMapType:", v23, v38, a7, width, height);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIMapWidget _snapshotOptionsForExtendedTraitCollection:queue:viewSize:snapshotMapType:](self, "_snapshotOptionsForExtendedTraitCollection:queue:viewSize:snapshotMapType:", v24, v38, a7, width, height);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[PXUIMapWidget _factory](self, "_factory");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __142__PXUIMapWidget__generateSnapshotsForExtendedTraitCollection_placesUtils_queue_size_snapshotMapType_fetchResults_shouldFetchNearbyAssetCount___block_invoke;
  v46[3] = &unk_1E5131CF0;
  objc_copyWeak(v48, &location);
  v46[4] = self;
  v48[1] = *(id *)&width;
  v48[2] = *(id *)&height;
  v29 = v23;
  v47 = v29;
  v48[3] = (id)a7;
  v49 = a9;
  objc_msgSend(v27, "requestMapSnapshotWithAssets:snapshotOptions:popoverImageOptions:completion:", v37, v25, 1, v46);

  -[PXUIMapWidget _factory](self, "_factory");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v28;
  v42[1] = 3221225472;
  v42[2] = __142__PXUIMapWidget__generateSnapshotsForExtendedTraitCollection_placesUtils_queue_size_snapshotMapType_fetchResults_shouldFetchNearbyAssetCount___block_invoke_3;
  v42[3] = &unk_1E5131CF0;
  objc_copyWeak(v44, &location);
  v42[4] = self;
  v44[1] = *(id *)&width;
  v44[2] = *(id *)&height;
  v31 = v24;
  v43 = v31;
  v44[3] = (id)a7;
  v45 = a9;
  objc_msgSend(v30, "requestMapSnapshotWithAssets:snapshotOptions:popoverImageOptions:completion:", v37, v26, 1, v42);

  objc_destroyWeak(v44);
  objc_destroyWeak(v48);
  objc_destroyWeak(&location);

}

- (id)_snapshotOptionsForExtendedTraitCollection:(id)a3 queue:(id)a4 viewSize:(CGSize)a5 snapshotMapType:(unint64_t)a6
{
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  PXPlacesGeotaggableMediaProvider *v14;
  void *v15;

  height = a5.height;
  width = a5.width;
  v11 = a4;
  v12 = a3;
  -[PXUIMapWidget _createSnapshotOptions](self, "_createSnapshotOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setExtendedTraitCollection:", v12);

  v14 = objc_alloc_init(PXPlacesGeotaggableMediaProvider);
  objc_msgSend(v13, "setGeotaggableInformationDelegate:", v14);

  objc_msgSend(v13, "setQueue:", v11);
  objc_msgSend(v13, "setViewSize:", width, height);
  objc_msgSend(v13, "setSnapshotMapType:", a6);
  objc_msgSend(v13, "setPopoverImageType:", 5);
  objc_msgSend(v13, "setShouldRenderThumbnailForNoLocation:", 1);
  if (-[PXUIMapWidget enableCuratedThumbnails](self, "enableCuratedThumbnails"))
  {
    -[PXUIMapWidget thumbnailLocationCurator](self, "thumbnailLocationCurator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMapThumbnailCurationDelegate:", v15);

  }
  return v13;
}

- (PXPlacesMapThumbnailLocationCurator)thumbnailLocationCurator
{
  PXPlacesMapThumbnailLocationCurator *thumbnailLocationCurator;
  PXPlacesMapThumbnailLocationCurator *v4;
  PXPlacesMapThumbnailLocationCurator *v5;

  thumbnailLocationCurator = self->_thumbnailLocationCurator;
  if (!thumbnailLocationCurator)
  {
    v4 = objc_alloc_init(PXPlacesMapThumbnailLocationCurator);
    v5 = self->_thumbnailLocationCurator;
    self->_thumbnailLocationCurator = v4;

    thumbnailLocationCurator = self->_thumbnailLocationCurator;
  }
  return thumbnailLocationCurator;
}

- (PXPlacesSnapshotFactory)_factory
{
  PXUIMapWidget *v2;
  void *v3;
  PXPlacesSnapshotFactory *v4;
  PXPlacesSnapshotFactory *factory;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->__factory)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PXPlacesSnapshotFactory initWithPhotoLibrary:]([PXPlacesSnapshotFactory alloc], "initWithPhotoLibrary:", v3);
    factory = v2->__factory;
    v2->__factory = v4;

  }
  objc_sync_exit(v2);

  return v2->__factory;
}

- (id)_createSnapshotOptions
{
  PXUIMapWidget *v2;
  PXPlacesSnapshotOptions *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init(PXPlacesSnapshotOptions);
  objc_sync_exit(v2);

  return v3;
}

- (void)_handleSnapshotResponse:(id)a3 viewPort:(id)a4 snapshotMapType:(unint64_t)a5 shouldFetchNearbyAssetCount:(BOOL)a6 fetchedImageKey:(id)a7 error:(id)a8 userInterfaceStyle:(int64_t)a9
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;

  v11 = a6;
  v32 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v18 = v17;
  if (self->_isLoaded)
  {
    if (v17)
    {
      if (a5 == 1)
      {
        -[PXUIMapWidget _showPlaceholder](self, "_showPlaceholder");
      }
      else
      {
        -[PXUIMapWidget _imageView](self, "_imageView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "frame");
        v21 = v20;
        v23 = v22;

        if (v21 == *MEMORY[0x1E0C9D820] && v23 == *(double *)(MEMORY[0x1E0C9D820] + 8))
        {
          -[PXUIMapWidget _estimatedMapViewImageSize](self, "_estimatedMapViewImageSize");
          v21 = v25;
          v23 = v26;
        }
        -[PXUIMapWidget _fetchResultsForSections](self, "_fetchResultsForSections");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXUIMapWidget _fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:](self, "_fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:", 1, v27, v11, v21, v23);

      }
    }
    else
    {
      if (a5)
      {
        if (-[PXUIMapWidget _hasCachedSnapshotImageForKey:](self, "_hasCachedSnapshotImageForKey:", v16))
          goto LABEL_18;
      }
      else
      {
        -[NSMutableDictionary setObject:forKey:](self->_fetchedImages, "setObject:forKey:", v32, v16);
      }
      objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "userInterfaceStyle");

      if (v29 == a9)
      {
        -[PXUIMapWidget _setHasLoadedContentData:](self, "_setHasLoadedContentData:", 1);
        -[PXUIMapWidget _setImage:animated:](self, "_setImage:animated:", v32, 1);
        -[PXUIMapWidget _contentView](self, "_contentView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setBackgroundColor:", v31);

      }
    }
  }
LABEL_18:

}

- (void)_setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  _QWORD aBlock[4];
  id v20;
  id v21;
  id v22;

  v4 = a4;
  v6 = a3;
  -[PXUIMapWidget _imageView](self, "_imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXUIMapWidget spec](self, "spec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultPlacesPlaceholderColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__PXUIMapWidget__setImage_animated___block_invoke;
  aBlock[3] = &unk_1E51457C8;
  v11 = v7;
  v20 = v11;
  v12 = v6;
  v21 = v12;
  v13 = v9;
  v22 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  v15 = v14;
  if (v4)
  {
    v16 = (void *)MEMORY[0x1E0DC3F10];
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __36__PXUIMapWidget__setImage_animated___block_invoke_2;
    v17[3] = &unk_1E5148A40;
    v18 = v14;
    objc_msgSend(v16, "transitionWithView:duration:options:animations:completion:", v11, 5242880, v17, 0, 0.25);

  }
  else
  {
    v14[2](v14);
  }

}

- (BOOL)_hasCachedSnapshotImageForKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_fetchedImages, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (PXWidgetDelegate)widgetDelegate
{
  return (PXWidgetDelegate *)objc_loadWeakRetained((id *)&self->_widgetDelegate);
}

- (void)setWidgetDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetDelegate, a3);
}

- (PXWidgetUnlockDelegate)widgetUnlockDelegate
{
  return (PXWidgetUnlockDelegate *)objc_loadWeakRetained((id *)&self->_widgetUnlockDelegate);
}

- (void)setWidgetUnlockDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetUnlockDelegate, a3);
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (BOOL)showAddressLink
{
  return self->_showAddressLink;
}

- (UIView)_containerView
{
  return self->__containerView;
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (PXImageUIView)_imageView
{
  return self->__imageView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (UIButton)footerButton
{
  return self->_footerButton;
}

- (UIButton)adjustButton
{
  return self->_adjustButton;
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (NSMutableArray)_nearbyCountCompletionBlocks
{
  return self->__nearbyCountCompletionBlocks;
}

- (void)set_nearbyCountCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->__nearbyCountCompletionBlocks, a3);
}

- (PXPlacesMapFetchResultViewController)_mapViewController
{
  return self->__mapViewController;
}

- (PXPlacesMapFetchResultViewController)_presentedMapViewController
{
  return (PXPlacesMapFetchResultViewController *)objc_loadWeakRetained((id *)&self->__presentedMapViewController);
}

- (void)set_presentedMapViewController:(id)a3
{
  objc_storeWeak((id *)&self->__presentedMapViewController, a3);
}

- (void)set_factory:(id)a3
{
  objc_storeStrong((id *)&self->__factory, a3);
}

- (NSString)_cachedLocalizedTitle
{
  return self->__cachedLocalizedTitle;
}

- (void)set_cachedLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->__cachedLocalizedTitle, a3);
}

- (NSString)_cachedDisclosureTitle
{
  return self->__cachedDisclosureTitle;
}

- (void)set_cachedDisclosureTitle:(id)a3
{
  objc_storeStrong((id *)&self->__cachedDisclosureTitle, a3);
}

- (NSString)cachedFooterTitle
{
  return self->_cachedFooterTitle;
}

- (void)setCachedFooterTitle:(id)a3
{
  objc_storeStrong((id *)&self->_cachedFooterTitle, a3);
}

- (double)height
{
  return self->_height;
}

- (double)footerHeight
{
  return self->_footerHeight;
}

- (BOOL)hasLoadedContentData
{
  return self->_hasLoadedContentData;
}

- (BOOL)enableCuratedThumbnails
{
  return self->_enableCuratedThumbnails;
}

- (void)setThumbnailLocationCurator:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailLocationCurator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailLocationCurator, 0);
  objc_storeStrong((id *)&self->_cachedFooterTitle, 0);
  objc_storeStrong((id *)&self->__cachedDisclosureTitle, 0);
  objc_storeStrong((id *)&self->__cachedLocalizedTitle, 0);
  objc_storeStrong((id *)&self->__factory, 0);
  objc_destroyWeak((id *)&self->__presentedMapViewController);
  objc_storeStrong((id *)&self->__mapViewController, 0);
  objc_storeStrong((id *)&self->__nearbyCountCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_adjustButton, 0);
  objc_storeStrong((id *)&self->_footerButton, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->__containerView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_widgetUnlockDelegate);
  objc_destroyWeak((id *)&self->_widgetDelegate);
  objc_storeStrong((id *)&self->_footerFont, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_fetchedImages, 0);
  objc_storeStrong((id *)&self->_viewPort, 0);
}

uint64_t __36__PXUIMapWidget__setImage_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 48));
}

uint64_t __36__PXUIMapWidget__setImage_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __142__PXUIMapWidget__generateSnapshotsForExtendedTraitCollection_placesUtils_queue_size_snapshotMapType_fetchResults_shouldFetchNearbyAssetCount___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  char v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a3);
    v16 = *(_OWORD *)(a1 + 56);
    v11 = *(id *)(a1 + 40);
    objc_copyWeak(&v15, (id *)(a1 + 48));
    v12 = v7;
    v13 = v8;
    v17 = *(_QWORD *)(a1 + 72);
    v18 = *(_BYTE *)(a1 + 80);
    v14 = v9;
    px_dispatch_on_main_queue();

    objc_destroyWeak(&v15);
  }

}

void __142__PXUIMapWidget__generateSnapshotsForExtendedTraitCollection_placesUtils_queue_size_snapshotMapType_fetchResults_shouldFetchNearbyAssetCount___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  char v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a3);
    v16 = *(_OWORD *)(a1 + 56);
    v11 = *(id *)(a1 + 40);
    objc_copyWeak(&v15, (id *)(a1 + 48));
    v12 = v7;
    v13 = v8;
    v17 = *(_QWORD *)(a1 + 72);
    v18 = *(_BYTE *)(a1 + 80);
    v14 = v9;
    px_dispatch_on_main_queue();

    objc_destroyWeak(&v15);
  }

}

void __142__PXUIMapWidget__generateSnapshotsForExtendedTraitCollection_placesUtils_queue_size_snapshotMapType_fetchResults_shouldFetchNearbyAssetCount___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  _PXPlacesSnapshotKey *v3;

  v3 = -[_PXPlacesSnapshotKey initWithImageSize:userInterfaceStyle:]([_PXPlacesSnapshotKey alloc], "initWithImageSize:userInterfaceStyle:", objc_msgSend(*(id *)(a1 + 32), "userInterfaceStyle"), *(double *)(a1 + 72), *(double *)(a1 + 80));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_handleSnapshotResponse:viewPort:snapshotMapType:shouldFetchNearbyAssetCount:fetchedImageKey:error:userInterfaceStyle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), *(unsigned __int8 *)(a1 + 96), v3, *(_QWORD *)(a1 + 56), 2);

}

void __142__PXUIMapWidget__generateSnapshotsForExtendedTraitCollection_placesUtils_queue_size_snapshotMapType_fetchResults_shouldFetchNearbyAssetCount___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _PXPlacesSnapshotKey *v3;

  v3 = -[_PXPlacesSnapshotKey initWithImageSize:userInterfaceStyle:]([_PXPlacesSnapshotKey alloc], "initWithImageSize:userInterfaceStyle:", objc_msgSend(*(id *)(a1 + 32), "userInterfaceStyle"), *(double *)(a1 + 72), *(double *)(a1 + 80));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_handleSnapshotResponse:viewPort:snapshotMapType:shouldFetchNearbyAssetCount:fetchedImageKey:error:userInterfaceStyle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), *(unsigned __int8 *)(a1 + 96), v3, *(_QWORD *)(a1 + 56), 1);

}

void __101__PXUIMapWidget__fetchPlacesSnapshotUsingMapType_fetchResults_imageSize_shouldFetchNearbyAssetCount___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained(v2);
    v6 = objc_msgSend(v5, "_hasCachedSnapshotImageForKey:", *(_QWORD *)(a1 + 32));

    if ((v6 & 1) == 0)
    {
      v7 = objc_loadWeakRetained(v2);
      objc_msgSend(v7, "_fetchPlacesSnapshotUsingMapType:fetchResults:imageSize:shouldFetchNearbyAssetCount:", 1, *(_QWORD *)(a1 + 40), 1, *(double *)(a1 + 56), *(double *)(a1 + 64));

    }
  }
}

void __101__PXUIMapWidget__fetchPlacesSnapshotUsingMapType_fetchResults_imageSize_shouldFetchNearbyAssetCount___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_generateSnapshotsForExtendedTraitCollection:placesUtils:queue:size:snapshotMapType:fetchResults:shouldFetchNearbyAssetCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 96), *(double *)(a1 + 72), *(double *)(a1 + 80));

}

void __56__PXUIMapWidget__loadMapDataWithFetchResultsController___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PXUIMapWidget__loadMapDataWithFetchResultsController___block_invoke_2;
  v3[3] = &unk_1E5148D30;
  objc_copyWeak(&v4, v1);
  objc_msgSend(WeakRetained, "loadProvidedAssetStoreWithCompletion:", v3);

  objc_destroyWeak(&v4);
}

void __56__PXUIMapWidget__loadMapDataWithFetchResultsController___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PXUIMapWidget__loadMapDataWithFetchResultsController___block_invoke_3;
  v3[3] = &unk_1E5148D30;
  objc_copyWeak(&v4, v1);
  objc_msgSend(WeakRetained, "reloadContentModeWithCompletion:", v3);

  objc_destroyWeak(&v4);
}

void __56__PXUIMapWidget__loadMapDataWithFetchResultsController___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 32));
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v1);
}

void __56__PXUIMapWidget__loadMapDataWithFetchResultsController___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "focusOnProvidedAssetsAnimated:", 1);

}

void __51__PXUIMapWidget__mapViewControllerWithContentMode___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setEnableNearbyAssetsAffordance:", 1);
  objc_msgSend(v2, "setGridViewEnabled:", 1);

}

void __45__PXUIMapWidget__handleTapGestureRecognizer___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showPlacesWithContentMode:", 1);

}

void __45__PXUIMapWidget__handleTapGestureRecognizer___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentLocationSearchPicker");

}

void __47__PXUIMapWidget_userDidSelectDisclosureControl__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showPlacesWithContentMode:", 0);

}

void __45__PXUIMapWidget__openMapsAtCoordinate_title___block_invoke_2(uint64_t a1, int a2)
{
  double v4;
  double v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stopShowing");
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  v5 = -v4;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 56);
  if (v4 >= -3.0)
  {
    if ((a2 & 1) != 0)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        v10 = 138543618;
        v11 = CFSTR("YES");
        v12 = 2048;
        v13 = v5;
        _os_log_fault_impl(&dword_1A6789000, v6, OS_LOG_TYPE_FAULT, "PXUIMapWidget: launchMapsAtCoordinate completed with success: %{public}@, and took %f.", (uint8_t *)&v10, 0x16u);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543618;
      v11 = CFSTR("NO");
      v12 = 2048;
      v13 = v5;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "PXUIMapWidget: launchMapsAtCoordinate completed with success: %{public}@, and took %f.", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = v7;
    v9 = v6;
    v10 = 138543618;
    v11 = v8;
    v12 = 2048;
    v13 = v5;
    _os_log_fault_impl(&dword_1A6789000, v9, OS_LOG_TYPE_FAULT, "PXUIMapWidget: launchMapsAtCoordinate completed with success: %{public}@, and took %f.", (uint8_t *)&v10, 0x16u);

  }
}

uint64_t __45__PXUIMapWidget__openMapsAtCoordinate_title___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMinimumDisplayDuration:", 0.0);
}

uint64_t __36__PXUIMapWidget__updateFooterButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __36__PXUIMapWidget__copyLocationAction__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "_copyLocationTapped");

  }
}

void __37__PXUIMapWidget__pasteLocationAction__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "_pasteLocationTapped");

  }
}

id __71__PXUIMapWidget_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(*(id *)(a1 + 32), "_contextMenuActions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "menuWithChildren:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __41__PXUIMapWidget__handleReloadFooterTitle__block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_updateFooterWithTitle:", *(_QWORD *)(a1 + 32));

  }
}

void __35__PXUIMapWidget__reloadFooterTitle__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleReloadFooterTitle");

}

void __35__PXUIMapWidget__reloadFooterQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.photos.PXUIMapWidget.reloadFooterQueue", v0);
  v2 = (void *)_reloadFooterQueue_queue;
  _reloadFooterQueue_queue = (uint64_t)v1;

}

uint64_t __38__PXUIMapWidget__didTapAdjustLocation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentLocationSearchPicker");
}

+ (id)sharedSnapshotRequestConcurrentQueue
{
  if (sharedSnapshotRequestConcurrentQueue_onceToken != -1)
    dispatch_once(&sharedSnapshotRequestConcurrentQueue_onceToken, &__block_literal_global_176369);
  return (id)sharedSnapshotRequestConcurrentQueue_sharedQueue;
}

void __53__PXUIMapWidget_sharedSnapshotRequestConcurrentQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.photos.mapSnapshotRequestQueue", attr);
  v2 = (void *)sharedSnapshotRequestConcurrentQueue_sharedQueue;
  sharedSnapshotRequestConcurrentQueue_sharedQueue = (uint64_t)v1;

}

@end
