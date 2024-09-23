@implementation PXPhotosMapLayout

- (PXPhotosMapLayout)initWithViewModel:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4 traitCollection:(id)a5 presentingViewController:(id)a6 initialLocation:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PXPhotosMapLayout *v17;
  PXPhotosMapLayout *v18;
  __int128 v19;
  PXPhotosMapContainerView *v20;
  PXPlacesMapController *v21;
  PXPlacesMapController *mapController;
  PXPhotosMapControllerAccessor *v23;
  void *v24;
  PXPlacesMapFetchResultController *v25;
  void *v26;
  uint64_t v27;
  PXPlacesMapFetchResultController *mapFetchResultsController;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  PXPlacesMapModeController *v41;
  PXPlacesMapModeController *mapModeController;
  PXPlacesMapOptionsController *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  PXPlacesMapOptionsController *mapOptionsController;
  void *v49;
  uint64_t v50;
  void *v52;
  id v53;
  objc_super v54;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v54.receiver = self;
  v54.super_class = (Class)PXPhotosMapLayout;
  v17 = -[PXGSingleViewLayout init](&v54, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_viewModel, a3);
    v19 = *(_OWORD *)&a4->item;
    *(_OWORD *)&v18->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)&a4->dataSourceIdentifier;
    *(_OWORD *)&v18->_sectionIndexPath.item = v19;
    objc_storeWeak((id *)&v18->_presentingViewController, v15);
    objc_storeStrong((id *)&v18->_initialLocation, a7);
    v20 = objc_alloc_init(PXPhotosMapContainerView);
    -[PXGSingleViewLayout setContentView:](v18, "setContentView:", v20);

    -[PXGSingleViewLayout setStyle:](v18, "setStyle:", 2);
    -[PXGSingleViewLayout setDelegate:](v18, "setDelegate:", v18);
    v21 = objc_alloc_init(PXPlacesMapController);
    mapController = v18->_mapController;
    v18->_mapController = v21;

    v23 = -[PXPhotosMapControllerAccessor initWithMapController:traitCollection:mapViewController:]([PXPhotosMapControllerAccessor alloc], "initWithMapController:traitCollection:mapViewController:", v18->_mapController, v14, 0);
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = [PXPlacesMapFetchResultController alloc];
    v53 = v13;
    objc_msgSend(v13, "libraryFilterState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[PXPlacesMapFetchResultController initWithMapControllerAccessor:libraryFilterState:photoLibrary:](v25, "initWithMapControllerAccessor:libraryFilterState:photoLibrary:", v23, v26, v24);
    mapFetchResultsController = v18->_mapFetchResultsController;
    v18->_mapFetchResultsController = (PXPlacesMapFetchResultController *)v27;

    -[PXPlacesMapFetchResultController setContentMode:](v18->_mapFetchResultsController, "setContentMode:", 1);
    -[PXPhotosMapLayout initialLocation](v18, "initialLocation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "mapLensAnchorFocusKilometerRadius");

      -[PXPhotosMapLayout initialLocation](v18, "initialLocation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = MEMORY[0x1A85CBC98](objc_msgSend(v31, "coordinate"));
      v34 = v33;
      v36 = v35;
      v38 = v37;

      -[PXPlacesMapFetchResultController mapController](v18->_mapFetchResultsController, "mapController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setInitialCoordinateRegion:", v32, v34, v36, v38);

    }
    -[PXPlacesMapFetchResultController preloadMap](v18->_mapFetchResultsController, "preloadMap", v16);
    -[PXPlacesMapFetchResultController mapView](v18->_mapFetchResultsController, "mapView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[PXPlacesMapModeController initWithMapView:prefersRealisticElevationStyle:]([PXPlacesMapModeController alloc], "initWithMapView:prefersRealisticElevationStyle:", v40, 1);
    mapModeController = v18->_mapModeController;
    v18->_mapModeController = v41;

    v43 = [PXPlacesMapOptionsController alloc];
    -[PXPhotosMapLayout mapModeController](v18, "mapModeController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosMapLayout mapFetchResultsController](v18, "mapFetchResultsController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPlacesLocationAuthorizationMonitor sharedInstance](PXPlacesLocationAuthorizationMonitor, "sharedInstance");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[PXPlacesMapOptionsController initWithMapModeController:mapFetchResultController:locationAuthorizationMonitor:](v43, "initWithMapModeController:mapFetchResultController:locationAuthorizationMonitor:", v44, v45, v46);
    mapOptionsController = v18->_mapOptionsController;
    v18->_mapOptionsController = (PXPlacesMapOptionsController *)v47;

    -[PXPlacesMapOptionsController setDelegate:](v18->_mapOptionsController, "setDelegate:", v18);
    -[PXPhotosMapLayout viewModel](v18, "viewModel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v49, "scrollingBehavior") == 2)
      v50 = 2;
    else
      v50 = 1;
    objc_msgSend(v40, "setPanningGestureMinimumNumberOfTouches:", v50);

    -[PXPhotosMapLayout _updateConfigurationView](v18, "_updateConfigurationView");
    v16 = v52;
    v13 = v53;
  }

  return v18;
}

- (void)setSelectionDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PXPhotosMapLayout mapFetchResultsController](self, "mapFetchResultsController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectionDelegate:", v4);

}

- (PXPlacesMapControllerSelectionDelegate)selectionDelegate
{
  void *v2;
  void *v3;
  void *v4;

  -[PXPhotosMapLayout mapFetchResultsController](self, "mapFetchResultsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXPlacesMapControllerSelectionDelegate *)v4;
}

- (CGSize)singleViewLayout:(id)a3 desiredSizeForReferenceSize:(CGSize)a4
{
  double height;
  CGFloat width;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a3, "safeAreaInsets");
  v8 = height - v7;
  -[PXPhotosMapLayout viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "headerTitleTopInset");
  v11 = v8 - v10;

  v12 = width;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)appearStateDidChangeForSingleViewLayout:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(a3, "appearState");
  if (v4 == 1)
  {
    -[PXPhotosMapLayout _fetchAssetResultsForMap](self, "_fetchAssetResultsForMap");
  }
  else if (!v4)
  {
    -[PXPhotosMapLayout mapController](self, "mapController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mapView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deselectAllAnnotationsAnimated:", 0);

  }
}

- (void)_updateConfigurationView
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  PXPhotosMapContainerViewConfiguration *v10;
  void *v11;
  PXPhotosMapContainerViewConfiguration *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;

  -[PXPlacesMapFetchResultController mapView](self->_mapFetchResultsController, "mapView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosMapLayout mapOptionsController](self, "mapOptionsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "perspectiveButtonState");

  -[PXPhotosMapLayout mapOptionsController](self, "mapOptionsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mapStyle");

  -[PXPhotosMapLayout mapOptionsController](self, "mapOptionsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "enableUserTrackingButton");

  v10 = [PXPhotosMapContainerViewConfiguration alloc];
  -[PXPhotosMapLayout mapOptionsController](self, "mapOptionsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXPhotosMapContainerViewConfiguration initWithMapView:mapOptionsViewDelegate:enableUserTrackingButton:perspectiveButtonState:mapStyle:](v10, "initWithMapView:mapOptionsViewDelegate:enableUserTrackingButton:perspectiveButtonState:mapStyle:", v18, v11, v9, v5, v7);

  -[PXGSingleViewLayout contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_descriptionForAssertionMessage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosMapLayout.m"), 133, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.contentView"), v16, v17);

    }
  }
  objc_msgSend(v13, "updateWithConfiguration:", v12);

}

- (void)_fetchAssetResultsForMap
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  id WeakRetained;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  uint64_t v15;
  _OWORD location[2];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PXPhotosMapLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "identifier");
  -[PXPhotosMapLayout sectionIndexPath](self, "sectionIndexPath");
  *(_QWORD *)&location[0] = v5;
  *((_QWORD *)&location[0] + 1) = v15;
  location[1] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_msgSend(v4, "assetsInSectionIndexPath:", location);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXPhotosMapLayout mapFetchResultsController](self, "mapFetchResultsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)location, v7);

    -[PXPhotosMapLayout initialLocation](self, "initialLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    WeakRetained = objc_loadWeakRetained((id *)location);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke;
    v12[3] = &unk_1E5145760;
    objc_copyWeak(&v13, (id *)location);
    v14 = v9;
    objc_msgSend(WeakRetained, "loadFetchResult:withCompletion:", v6, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }
  else
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(_QWORD *)((char *)location + 4) = self;
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "%@ requires a valid assetsFetchResult.", (uint8_t *)location, 0xCu);
    }

  }
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[33].dataSourceIdentifier;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[32].item;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXPlacesMapFetchResultController)mapFetchResultsController
{
  return self->_mapFetchResultsController;
}

- (PXPhotosMapSelectionHandler)selectionHandler
{
  return self->_selectionHandler;
}

- (PXPlacesMapController)mapController
{
  return self->_mapController;
}

- (PXPlacesMapModeController)mapModeController
{
  return self->_mapModeController;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (PXPlacesMapOptionsController)mapOptionsController
{
  return self->_mapOptionsController;
}

- (void)setMapOptionsController:(id)a3
{
  objc_storeStrong((id *)&self->_mapOptionsController, a3);
}

- (CLLocation)initialLocation
{
  return self->_initialLocation;
}

- (void)setInitialLocation:(id)a3
{
  objc_storeStrong((id *)&self->_initialLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialLocation, 0);
  objc_storeStrong((id *)&self->_mapOptionsController, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_mapModeController, 0);
  objc_storeStrong((id *)&self->_mapController, 0);
  objc_storeStrong((id *)&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_mapFetchResultsController, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  char v6;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke_2;
  v4[3] = &unk_1E5145760;
  objc_copyWeak(&v5, v2);
  v6 = *(_BYTE *)(a1 + 40);
  objc_msgSend(WeakRetained, "reloadContentModeWithCompletion:", v4);

  objc_destroyWeak(&v5);
}

void __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  char v6;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke_3;
  v4[3] = &unk_1E5145760;
  v6 = *(_BYTE *)(a1 + 40);
  objc_copyWeak(&v5, v2);
  objc_msgSend(WeakRetained, "resumeWithCompletion:", v4);

  objc_destroyWeak(&v5);
}

void __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke_3(uint64_t a1)
{
  _QWORD v1[4];
  id v2;
  char v3;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke_4;
  v1[3] = &unk_1E5145760;
  v3 = *(_BYTE *)(a1 + 40);
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], v1);
  objc_destroyWeak(&v2);
}

void __45__PXPhotosMapLayout__fetchAssetResultsForMap__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  if (*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "focusOnProvidedAssetsAnimated:", 0);

  }
}

@end
