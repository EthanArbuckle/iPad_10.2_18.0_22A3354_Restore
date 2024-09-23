@implementation PXPlacesMapFetchResultController

- (PXPlacesMapFetchResultController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapFetchResultController.m"), 55, CFSTR("%s is not available as initializer"), "-[PXPlacesMapFetchResultController init]");

  abort();
}

- (PXPlacesMapFetchResultController)initWithPhotoLibrary:(id)a3
{
  id v6;
  PXPlacesMapFetchResultController *v7;
  PXPlacesMapFetchResultController *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapFetchResultController.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXPlacesMapFetchResultController;
  v7 = -[PXPlacesMapFetchResultController init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_photoLibrary, a3);

  return v8;
}

- (PXPlacesMapFetchResultController)initWithMapControllerAccessor:(id)a3 libraryFilterState:(id)a4 photoLibrary:(id)a5
{
  id v10;
  id v11;
  id v12;
  PXPlacesMapFetchResultController *v13;
  PXPlacesMapFetchResultController *v14;
  PXPlacesGeotaggableMediaProvider *v15;
  PXPlacesMapGeotaggableInfoDelegate *geotaggableInfoDelegate;
  dispatch_queue_t v17;
  OS_dispatch_queue *serialQueue;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapFetchResultController.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v21.receiver = self;
  v21.super_class = (Class)PXPlacesMapFetchResultController;
  v13 = -[PXPlacesMapFetchResultController init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_photoLibrary, a5);
    v15 = objc_alloc_init(PXPlacesGeotaggableMediaProvider);
    geotaggableInfoDelegate = v14->_geotaggableInfoDelegate;
    v14->_geotaggableInfoDelegate = (PXPlacesMapGeotaggableInfoDelegate *)v15;

    objc_storeStrong((id *)&v14->_mapControllerAccessor, a3);
    v14->_contentMode = 1;
    v17 = dispatch_queue_create("Reload Queue", 0);
    serialQueue = v14->_serialQueue;
    v14->_serialQueue = (OS_dispatch_queue *)v17;

    v14->_isPreloaded = 0;
    objc_storeStrong((id *)&v14->_libraryFilterState, a4);
    -[PXLibraryFilterState registerChangeObserver:context:](v14->_libraryFilterState, "registerChangeObserver:context:", v14, PXLibraryFilterStateObservationContext_65249);
  }

  return v14;
}

- (PXPlacesMapFetchResultController)initWithLibraryFilterState:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  PXPlacesMapViewController *v8;
  PXPlacesMapFetchResultController *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(PXPlacesMapViewController);
  v9 = -[PXPlacesMapFetchResultController initWithMapControllerAccessor:libraryFilterState:photoLibrary:](self, "initWithMapControllerAccessor:libraryFilterState:photoLibrary:", v8, v7, v6);

  return v9;
}

- (PXPlacesMapView)mapView
{
  void *v2;
  void *v3;
  void *v4;

  -[PXPlacesMapFetchResultController mapControllerAccessor](self, "mapControllerAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXPlacesMapView *)v4;
}

- (PXPlacesMapController)mapController
{
  void *v2;
  void *v3;

  -[PXPlacesMapFetchResultController mapControllerAccessor](self, "mapControllerAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXPlacesMapController *)v3;
}

- (id)visibleGeotaggables
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PXPlacesMapFetchResultController currentAssetStore](self, "currentAssetStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapFetchResultController mapControllerAccessor](self, "mapControllerAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visibleGeotaggableFromDataSource:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)currentAssetStore
{
  unint64_t v3;
  void *v4;

  v3 = -[PXPlacesMapFetchResultController contentMode](self, "contentMode");
  if (v3 == 1)
  {
    -[PXPlacesMapFetchResultController providedAssetStore](self, "providedAssetStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[PXPlacesMapFetchResultController albumAssetStore](self, "albumAssetStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (PXPlacesMapPipeline)albumPipeline
{
  PXPlacesMapPipeline *albumPipeline;
  _BOOL4 v4;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXPlacesMapPipeline *v13;
  PXPlacesMapPipeline *v14;

  albumPipeline = self->_albumPipeline;
  if (!albumPipeline)
  {
    v4 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
    v5 = v4;
    if (v4)
      v6 = 3;
    else
      v6 = 2;
    -[PXPlacesMapFetchResultController albumAssetStore](self, "albumAssetStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesMapFetchResultController mapControllerAccessor](self, "mapControllerAccessor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pk_extendedTraitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesMapFetchResultController geotaggableInfoDelegate](self, "geotaggableInfoDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesMapFetchResultController thumbnailCurationDelegate](self, "thumbnailCurationDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPlacesMapPipelineFactory thumbnailPipelineForDataSource:extendedTraitCollection:geotaggableInfo:popoverImageType:popoverImageOptions:countLabelStyle:thumbnailCurationDelegate:](PXPlacesMapPipelineFactory, "thumbnailPipelineForDataSource:extendedTraitCollection:geotaggableInfo:popoverImageType:popoverImageOptions:countLabelStyle:thumbnailCurationDelegate:", v8, v10, v11, v6, 0, v5, v12);
    v13 = (PXPlacesMapPipeline *)objc_claimAutoreleasedReturnValue();

    v14 = self->_albumPipeline;
    self->_albumPipeline = v13;

    albumPipeline = self->_albumPipeline;
  }
  return albumPipeline;
}

- (PXPlacesPhotoAssetsStore)albumAssetStore
{
  PXPlacesPhotoAssetsStore *albumAssetStore;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PXPlacesPhotoAssetsStore *v9;
  void *v10;
  PXPlacesPhotoAssetsStore *v11;
  PXPlacesPhotoAssetsStore *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  albumAssetStore = self->_albumAssetStore;
  if (!albumAssetStore)
  {
    v4 = (void *)MEMORY[0x1E0CD1570];
    -[PXPlacesMapFetchResultController photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchOptionsWithPhotoLibrary:orObject:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPlacesMapFetchResultController libraryFilterState](self, "libraryFilterState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSharingFilter:", objc_msgSend(v7, "sharingFilter"));

    objc_msgSend(MEMORY[0x1E0CD1390], "pk_fetchPlacesAssetsInAssetCollection:shouldMergeOptionFetchPropertySets:options:", 0, 0, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [PXPlacesPhotoAssetsStore alloc];
    if (v8)
    {
      v14[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }
    v11 = -[PXPlacesPhotoAssetsStore initWithFetchResults:](v9, "initWithFetchResults:", v10);
    v12 = self->_albumAssetStore;
    self->_albumAssetStore = v11;

    if (v8)
    albumAssetStore = self->_albumAssetStore;
  }
  return albumAssetStore;
}

- (void)preloadMap
{
  if (!-[PXPlacesMapFetchResultController isPreloaded](self, "isPreloaded"))
  {
    -[PXPlacesMapFetchResultController setIsPreloaded:](self, "setIsPreloaded:", 1);
    -[PXPlacesMapFetchResultController loadFetchResults:withCompletion:](self, "loadFetchResults:withCompletion:", MEMORY[0x1E0C9AA60], 0);
  }
}

- (void)reloadMapWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0CD1570];
  -[PXPlacesMapFetchResultController photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchOptionsWithPhotoLibrary:orObject:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPlacesMapFetchResultController libraryFilterState](self, "libraryFilterState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSharingFilter:", objc_msgSend(v8, "sharingFilter"));

  -[PXPlacesMapFetchResultController serialQueue](self, "serialQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__PXPlacesMapFetchResultController_reloadMapWithCompletion___block_invoke;
  v12[3] = &unk_1E51422C8;
  v13 = v7;
  v10 = v7;
  objc_copyWeak(&v15, &location);
  v14 = v4;
  v11 = v4;
  dispatch_async(v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)reloadContentModeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PXPlacesMapFetchResultController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PXPlacesMapFetchResultController_reloadContentModeWithCompletion___block_invoke;
  v7[3] = &unk_1E51422C8;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)loadFetchResults:(id)a3 withCompletion:(id)a4
{
  id v6;
  PXPlacesPhotoAssetsStore *v7;
  _BOOL4 v8;
  _BOOL8 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(void);

  v18 = (void (**)(void))a4;
  v6 = a3;
  v7 = -[PXPlacesPhotoAssetsStore initWithFetchResults:]([PXPlacesPhotoAssetsStore alloc], "initWithFetchResults:", v6);

  -[PXPlacesMapFetchResultController setProvidedAssetStore:](self, "setProvidedAssetStore:", v7);
  v8 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  v9 = v8;
  if (v8)
    v10 = 3;
  else
    v10 = 2;
  -[PXPlacesMapFetchResultController providedAssetStore](self, "providedAssetStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapFetchResultController mapControllerAccessor](self, "mapControllerAccessor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pk_extendedTraitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapFetchResultController geotaggableInfoDelegate](self, "geotaggableInfoDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapFetchResultController thumbnailCurationDelegate](self, "thumbnailCurationDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPlacesMapPipelineFactory thumbnailPipelineForDataSource:extendedTraitCollection:geotaggableInfo:popoverImageType:popoverImageOptions:countLabelStyle:thumbnailCurationDelegate:](PXPlacesMapPipelineFactory, "thumbnailPipelineForDataSource:extendedTraitCollection:geotaggableInfo:popoverImageType:popoverImageOptions:countLabelStyle:thumbnailCurationDelegate:", v12, v14, v15, v10, 0, v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPlacesMapFetchResultController setProvidedPipeline:](self, "setProvidedPipeline:", v17);
  if (v18)
    v18[2]();

}

- (void)loadFetchResult:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPlacesMapFetchResultController loadFetchResults:withCompletion:](self, "loadFetchResults:withCompletion:", v9, v7, v10, v11);
}

- (void)loadProvidedAssetStoreWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPlacesMapFetchResultController providedAssetStore](self, "providedAssetStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadWithCompletion:", v4);

}

- (void)resumeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PXPlacesMapFetchResultController mapControllerAccessor](self, "mapControllerAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PXPlacesMapFetchResultController_resumeWithCompletion___block_invoke;
  v8[3] = &unk_1E5148A40;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "resumePipelines:", v8);

}

- (void)focusOnProvidedAssetsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[PXPlacesMapFetchResultController mapController](self, "mapController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapFetchResultController providedPipeline](self, "providedPipeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "focusOnGeotaggablesFromPipeline:animated:", v5, v3);

}

- (void)focusOnProvidedAssetsImmediately
{
  void *v3;
  id v4;

  -[PXPlacesMapFetchResultController mapController](self, "mapController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapFetchResultController providedPipeline](self, "providedPipeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusOnGeotaggablesFromPipelineImmediately:", v3);

}

- (void)focusOnGeotaggablesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[PXPlacesMapFetchResultController mapController](self, "mapController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapFetchResultController currentPipeline](self, "currentPipeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "focusOnGeotaggablesFromPipeline:animated:", v5, v3);

}

- (void)focusOnMapRect:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double var1;
  double var0;
  double v7;
  double v8;
  void *v10;
  id v11;

  v4 = a4;
  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v7 = a3.var0.var1;
  v8 = a3.var0.var0;
  -[PXPlacesMapFetchResultController mapController](self, "mapController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapFetchResultController currentPipeline](self, "currentPipeline");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVisibleMapRect:forPipeline:animated:", v10, v4, v8, v7, var0, var1);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXLibraryFilterStateObservationContext_65249 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapFetchResultController.m"), 317, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PXPlacesMapFetchResultController reloadMapWithCompletion:](self, "reloadMapWithCompletion:", 0);
    v9 = v11;
  }

}

- (PXPlacesMapControllerAccess)mapControllerAccessor
{
  return self->_mapControllerAccessor;
}

- (void)setMapControllerAccessor:(id)a3
{
  objc_storeStrong((id *)&self->_mapControllerAccessor, a3);
}

- (PXPlacesMapThumbnailCurationDelegate)thumbnailCurationDelegate
{
  return (PXPlacesMapThumbnailCurationDelegate *)objc_loadWeakRetained((id *)&self->_thumbnailCurationDelegate);
}

- (void)setThumbnailCurationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailCurationDelegate, a3);
}

- (unint64_t)contentMode
{
  return self->_contentMode;
}

- (void)setContentMode:(unint64_t)a3
{
  self->_contentMode = a3;
}

- (PXPlacesMapGeotaggableInfoDelegate)geotaggableInfoDelegate
{
  return self->_geotaggableInfoDelegate;
}

- (void)setGeotaggableInfoDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_geotaggableInfoDelegate, a3);
}

- (PXPlacesPhotoAssetsStore)providedAssetStore
{
  return (PXPlacesPhotoAssetsStore *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProvidedAssetStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PXPlacesMapPipeline)providedPipeline
{
  return (PXPlacesMapPipeline *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProvidedPipeline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)isPreloaded
{
  return self->_isPreloaded;
}

- (void)setIsPreloaded:(BOOL)a3
{
  self->_isPreloaded = a3;
}

- (void)setAlbumAssetStore:(id)a3
{
  objc_storeStrong((id *)&self->_albumAssetStore, a3);
}

- (void)setAlbumPipeline:(id)a3
{
  objc_storeStrong((id *)&self->_albumPipeline, a3);
}

- (PXPlacesMapPipeline)currentPipeline
{
  return self->_currentPipeline;
}

- (void)setCurrentPipeline:(id)a3
{
  objc_storeStrong((id *)&self->_currentPipeline, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_currentPipeline, 0);
  objc_storeStrong((id *)&self->_albumPipeline, 0);
  objc_storeStrong((id *)&self->_albumAssetStore, 0);
  objc_storeStrong((id *)&self->_providedPipeline, 0);
  objc_storeStrong((id *)&self->_providedAssetStore, 0);
  objc_storeStrong((id *)&self->_geotaggableInfoDelegate, 0);
  objc_destroyWeak((id *)&self->_thumbnailCurationDelegate);
  objc_storeStrong((id *)&self->_mapControllerAccessor, 0);
}

uint64_t __57__PXPlacesMapFetchResultController_resumeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __68__PXPlacesMapFetchResultController_reloadContentModeWithCompletion___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
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
  void (**v16)(void);
  _QWORD v17[4];
  id v18;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "contentMode");
    if (v4 == 1)
    {
      objc_msgSend(v3, "providedPipeline");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "providedAssetStore");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4)
      {
        v5 = 0;
        v7 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v3, "albumPipeline");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "albumAssetStore");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
    if (v5)
    {
      objc_msgSend(v3, "currentPipeline");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v3, "currentPipeline");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 == v5)
        {
          v16 = (void (**)(void))a1[5];
          if (v16)
            v16[2]();
          goto LABEL_13;
        }
        objc_msgSend(v3, "mapController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "suspendPipelines");

        objc_msgSend(v3, "mapController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "currentPipeline");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removePipeline:", v12);

        objc_msgSend(v3, "mapController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addPipeline:", v5);

        objc_msgSend(v3, "setCurrentPipeline:", v5);
        objc_msgSend(v3, "mapController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "resumePipelines:", 0);

      }
      else
      {
        objc_msgSend(v3, "mapController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addPipeline:", v5);

        objc_msgSend(v3, "setCurrentPipeline:", v5);
      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __68__PXPlacesMapFetchResultController_reloadContentModeWithCompletion___block_invoke_2;
      v17[3] = &unk_1E5148A40;
      v18 = a1[5];
      objc_msgSend(v7, "loadWithCompletion:", v17);

    }
LABEL_13:

  }
}

uint64_t __68__PXPlacesMapFetchResultController_reloadContentModeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __60__PXPlacesMapFetchResultController_reloadMapWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CD1390], "pk_fetchPlacesAssetsInAssetCollection:shouldMergeOptionFetchPropertySets:options:", 0, 0, *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__PXPlacesMapFetchResultController_reloadMapWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5146480;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v5 = *(id *)(a1 + 40);
  objc_msgSend(WeakRetained, "loadFetchResult:withCompletion:", v2, v4);

  objc_destroyWeak(&v6);
}

void __60__PXPlacesMapFetchResultController_reloadMapWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__PXPlacesMapFetchResultController_reloadMapWithCompletion___block_invoke_3;
  v4[3] = &unk_1E5146480;
  objc_copyWeak(&v6, v2);
  v5 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "reloadContentModeWithCompletion:", v4);

  objc_destroyWeak(&v6);
}

void __60__PXPlacesMapFetchResultController_reloadMapWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "resumeWithCompletion:", *(_QWORD *)(a1 + 32));

}

@end
