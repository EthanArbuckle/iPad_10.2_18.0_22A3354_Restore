@implementation PXPhotoKitAssetsDataSourceManager

void __81__PXPhotoKitAssetsDataSourceManager_photosDataSourceDidFinishBackgroundFetching___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assetsDataSourceManagerDidFinishBackgroundFetching:", *(_QWORD *)(a1 + 32));

}

- (PXPhotosDataSource)photosDataSource
{
  -[PXPhotoKitAssetsDataSourceManager _ensurePhotosDataSource](self, "_ensurePhotosDataSource");
  return self->_photosDataSource;
}

- (void)_ensurePhotosDataSource
{
  PXPhotosDataSource **p_photosDataSource;
  void *v4;
  void *v5;
  NSObject *v6;
  NSPredicate *v7;
  NSPredicate *v8;
  char v9;
  void *v10;
  NSPredicate *filterPredicate;
  NSObject *v12;
  NSArray *v13;
  NSArray *v14;
  char v15;
  void *v16;
  NSArray *sortDescriptors;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  PXContentSyndicationConfigurationProvider *v21;
  PXContentSyndicationConfigurationProvider *contentSyndicationConfigurationProvider;
  NSNumber *backgroundFetchOriginSection;
  NSNumber *v24;
  OS_dispatch_queue *v25;
  OS_dispatch_queue *initialDataSourceLoadingQueue;
  void *v27;
  NSString *v28;
  NSString *localizedLoadingInitialDataSourceMessage;
  NSObject *v30;
  id v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  PXPhotoKitAssetsDataSourceManager *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  int64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  p_photosDataSource = &self->_photosDataSource;
  if (self->_photosDataSource)
    return;
  -[PXPhotoKitAssetsDataSourceManager photosDataSourceProvider](self, "photosDataSourceProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createInitialPhotosDataSourceForDataSourceManager:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterPredicate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = self->_filterPredicate;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = -[NSObject isEqual:](v6, "isEqual:", v7);

    if ((v9 & 1) != 0)
      goto LABEL_8;
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v5, "filterPredicate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      filterPredicate = self->_filterPredicate;
      *(_DWORD *)buf = 138412802;
      v41 = v4;
      v42 = 2112;
      v43 = (uint64_t)v10;
      v44 = 2112;
      v45 = (int64_t)filterPredicate;
      _os_log_fault_impl(&dword_1A6789000, v6, OS_LOG_TYPE_FAULT, "Initial data source created by %@ does not have matching filterPredicate %@ != %@", buf, 0x20u);

    }
  }

LABEL_8:
  objc_msgSend(v5, "sortDescriptors");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = self->_sortDescriptors;
  if (v12 == v13)
  {

LABEL_13:
    goto LABEL_14;
  }
  v14 = v13;
  v15 = -[NSObject isEqual:](v12, "isEqual:", v13);

  if ((v15 & 1) == 0)
  {
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v5, "sortDescriptors");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      sortDescriptors = self->_sortDescriptors;
      *(_DWORD *)buf = 138412802;
      v41 = v4;
      v42 = 2112;
      v43 = (uint64_t)v16;
      v44 = 2112;
      v45 = (int64_t)sortDescriptors;
      _os_log_fault_impl(&dword_1A6789000, v12, OS_LOG_TYPE_FAULT, "Initial data source created by %@ does not have matching sortDescriptors %@ != %@", buf, 0x20u);

    }
    goto LABEL_13;
  }
LABEL_14:
  v18 = objc_msgSend(v5, "libraryFilter");
  if (v18 != -[PXPhotoKitAssetsDataSourceManager libraryFilter](self, "libraryFilter"))
  {
    PXAssertGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      v32 = objc_msgSend(v5, "libraryFilter");
      v33 = -[PXPhotoKitAssetsDataSourceManager libraryFilter](self, "libraryFilter");
      *(_DWORD *)buf = 138412802;
      v41 = v4;
      v42 = 2048;
      v43 = v32;
      v44 = 2048;
      v45 = v33;
      _os_log_fault_impl(&dword_1A6789000, v19, OS_LOG_TYPE_FAULT, "Initial data source created by %@ does not have matching libraryFilter %ld != %ld", buf, 0x20u);
    }

  }
  objc_msgSend(v5, "photoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:](PXContentSyndicationConfigurationProvider, "contentSyndicationConfigurationProviderWithPhotoLibrary:", v20);
  v21 = (PXContentSyndicationConfigurationProvider *)objc_claimAutoreleasedReturnValue();
  contentSyndicationConfigurationProvider = self->_contentSyndicationConfigurationProvider;
  self->_contentSyndicationConfigurationProvider = v21;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[PXContentSyndicationConfigurationProvider registerChangeObserver:context:](self->_contentSyndicationConfigurationProvider, "registerChangeObserver:context:", self, PXContentSyndicationConfigurationObservationContext);
  objc_msgSend(v5, "registerChangeObserver:", self);
  backgroundFetchOriginSection = self->_backgroundFetchOriginSection;
  if (backgroundFetchOriginSection)
  {
    objc_msgSend(v5, "setBackgroundFetchOriginSection:", -[NSNumber integerValue](backgroundFetchOriginSection, "integerValue"));
    v24 = self->_backgroundFetchOriginSection;
    self->_backgroundFetchOriginSection = 0;

  }
  objc_storeStrong((id *)p_photosDataSource, v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (!self->_initialDataSourceLoadingQueue)
    {
      v25 = (OS_dispatch_queue *)dispatch_queue_create("Initial Data Source Loading Queue", 0);
      initialDataSourceLoadingQueue = self->_initialDataSourceLoadingQueue;
      self->_initialDataSourceLoadingQueue = v25;

    }
    -[PXPhotoKitAssetsDataSourceManager _setLoadingInitialPhotosDataSource:](self, "_setLoadingInitialPhotosDataSource:", 1);
    -[PXPhotoKitAssetsDataSourceManager photosDataSourceProvider](self, "photosDataSourceProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v27, "localizedInitialLoadingStatusMessageForDataSourceManager:", self);
      v28 = (NSString *)objc_claimAutoreleasedReturnValue();
      localizedLoadingInitialDataSourceMessage = self->_localizedLoadingInitialDataSourceMessage;
      self->_localizedLoadingInitialDataSourceMessage = v28;

    }
    v30 = self->_initialDataSourceLoadingQueue;
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __60__PXPhotoKitAssetsDataSourceManager__ensurePhotosDataSource__block_invoke;
    v37 = &unk_1E5148D08;
    v38 = v27;
    v39 = self;
    v31 = v27;
    dispatch_async(v30, &v34);

  }
  -[PXPhotoKitAssetsDataSourceManager setPhotosDataSourceProvider:](self, "setPhotosDataSourceProvider:", 0, v34, v35, v36, v37);

}

- (void)setBackgroundFetchOriginSection:(int64_t)a3
{
  PXPhotosDataSource *photosDataSource;
  NSNumber *v5;
  NSNumber *backgroundFetchOriginSection;

  photosDataSource = self->_photosDataSource;
  if (photosDataSource)
  {
    -[PXPhotosDataSource setBackgroundFetchOriginSection:](photosDataSource, "setBackgroundFetchOriginSection:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    backgroundFetchOriginSection = self->_backgroundFetchOriginSection;
    self->_backgroundFetchOriginSection = v5;

  }
}

- (PXPhotosDataSourceProvider)photosDataSourceProvider
{
  return self->_photosDataSourceProvider;
}

- (void)setFilterPredicate:(id)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4
{
  NSPredicate *filterPredicate;
  void *v7;
  void *v8;
  NSPredicate *v9;
  id v10;

  v10 = a4;
  filterPredicate = (NSPredicate *)a3;
  -[PXPhotoKitAssetsDataSourceManager photosDataSourceIfExists](self, "photosDataSourceIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setFilterPredicate:provideIncrementalChangeDetailsForAssetCollections:", filterPredicate, v10);
  }
  else
  {
    v9 = (NSPredicate *)-[NSPredicate copy](filterPredicate, "copy");

    filterPredicate = self->_filterPredicate;
    self->_filterPredicate = v9;
  }

}

- (void)setFilterPredicate:(id)a3
{
  -[PXPhotoKitAssetsDataSourceManager setFilterPredicate:provideIncrementalChangeDetailsForAssetCollections:](self, "setFilterPredicate:provideIncrementalChangeDetailsForAssetCollections:", a3, 0);
}

- (id)createInitialDataSource
{
  -[PXPhotoKitAssetsDataSourceManager _ensurePhotosDataSource](self, "_ensurePhotosDataSource");
  return -[PXPhotoKitAssetsDataSourceManager _createAssetsDataSourceWithPhotosDataSource:withChangeDetails:](self, "_createAssetsDataSourceWithPhotosDataSource:withChangeDetails:", self->_photosDataSource, 0);
}

- (PXPhotoKitAssetsDataSourceManager)initWithPhotosDataSourceProvider:(id)a3
{
  id v4;
  PXPhotoKitAssetsDataSourceManager *v5;
  PXPhotoKitAssetsDataSourceManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXPhotoKitAssetsDataSourceManager;
  v5 = -[PXSectionedDataSourceManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PXPhotoKitAssetsDataSourceManager setPhotosDataSourceProvider:](v5, "setPhotosDataSourceProvider:", v4);

  return v6;
}

- (void)setPhotosDataSourceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_photosDataSourceProvider, a3);
}

- (int64_t)libraryFilter
{
  return self->_libraryFilter;
}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
    -[PXPhotoKitAssetsDataSourceManager updateWithPhotosDataSource:andDataSourceChange:](self, "updateWithPhotosDataSource:andDataSourceChange:", v8, v6);

}

- (void)updateWithPhotosDataSource:(id)a3 andDataSourceChange:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a4, "sectionedDataSourceChangeDetails");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetsDataSourceManager updateWithPhotosDataSource:sectionedDataSourceChangeDetails:](self, "updateWithPhotosDataSource:sectionedDataSourceChangeDetails:", v6, v7);

}

- (NSPredicate)filterPredicate
{
  void *v3;
  void *v4;
  NSPredicate *v5;
  NSPredicate *v6;

  -[PXPhotoKitAssetsDataSourceManager photosDataSourceIfExists](self, "photosDataSourceIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "filterPredicate");
    v5 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self->_filterPredicate;
  }
  v6 = v5;

  return v6;
}

- (PXPhotosDataSource)photosDataSourceIfExists
{
  return self->_photosDataSource;
}

- (void)photosDataSourceDidFinishBackgroundFetching:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__PXPhotoKitAssetsDataSourceManager_photosDataSourceDidFinishBackgroundFetching___block_invoke;
  v3[3] = &unk_1E51270B0;
  v3[4] = self;
  -[PXPhotoKitAssetsDataSourceManager enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v3);
}

- (void)setLibraryFilter:(int64_t)a3
{
  if (self->_libraryFilter != a3)
  {
    self->_libraryFilter = a3;
    -[PXPhotosDataSource setLibraryFilter:](self->_photosDataSource, "setLibraryFilter:");
  }
}

- (BOOL)forceAccurateSection:(int64_t)a3 andSectionsBeforeAndAfter:(int64_t)a4
{
  void *v6;

  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundFetchOriginSection:", a3);
  LOBYTE(a4) = objc_msgSend(v6, "forceAccurateSection:andSectionsBeforeAndAfter:", a3, a4);

  return a4;
}

- (void)startBackgroundFetchIfNeeded
{
  id v2;

  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startBackgroundFetchIfNeeded");

}

- (PXPhotoKitAssetsDataSourceManager)initWithPhotosDataSource:(id)a3
{
  id v4;
  PXPhotoKitAssetsDataSourceManager *v5;
  PXPhotoKitAssetsDataSourceManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXPhotoKitAssetsDataSourceManager;
  v5 = -[PXSectionedDataSourceManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PXPhotoKitAssetsDataSourceManager setPhotosDataSource:](v5, "setPhotosDataSource:", v4);

  return v6;
}

- (PXPhotoKitAssetsDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSourceManager.m"), 211, CFSTR("%s is not available as initializer"), "-[PXPhotoKitAssetsDataSourceManager init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  -[PXPhotosDataSource unregisterChangeObserver:](self->_photosDataSource, "unregisterChangeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitAssetsDataSourceManager;
  -[PXPhotoKitAssetsDataSourceManager dealloc](&v3, sel_dealloc);
}

- (id)createDataSourceManagerForAssetsInSectionOfAsset:(id)a3 usingNewTransientAssetCollection:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  PXPhotoKitAssetsDataSourceManager *v9;

  if (a3)
  {
    v4 = a4;
    v6 = a3;
    -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createDataSourceWithAssetsInSectionOfAsset:usingNewTransientAssetCollection:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v8);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)createDataSourceManagerForAsset:(id)a3
{
  void *v5;
  void *v6;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSourceManager.m"), 229, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("assetReference.asset"), v10, v11);

    }
    +[PXPhotoKitAssetsDataSourceManager dataSourceManagerWithAsset:](PXPhotoKitAssetsDataSourceManager, "dataSourceManagerWithAsset:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isLoadingInitialDataSource
{
  objc_super v4;

  if (-[PXPhotoKitAssetsDataSourceManager _isLoadingInitialPhotosDataSource](self, "_isLoadingInitialPhotosDataSource"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)PXPhotoKitAssetsDataSourceManager;
  return -[PXPhotoKitAssetsDataSourceManager isLoadingInitialDataSource](&v4, sel_isLoadingInitialDataSource);
}

- (void)_setLoadingInitialPhotosDataSource:(BOOL)a3
{
  if (self->__isLoadingInitialPhotosDataSource != a3)
  {
    self->__isLoadingInitialPhotosDataSource = a3;
    if (!a3)
      -[PXPhotoKitAssetsDataSourceManager _didFinishLoadingInitialPhotosDataSource](self, "_didFinishLoadingInitialPhotosDataSource");
  }
}

- (BOOL)includeAllBurstAssets
{
  void *v2;
  char v3;

  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "includeAllBurstAssets");

  return v3;
}

- (void)setIncludeAllBurstAssets:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  id v7;

  v3 = a3;
  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "includeAllBurstAssets");

  if (v6 != v3)
  {
    PXPreferencesSetIsStacksEnabled(v3);
    -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIncludeAllBurstAssets:", v3);

  }
}

- (id)_createAssetsDataSourceWithPhotosDataSource:(id)a3 withChangeDetails:(id)a4
{
  id v5;
  void *v6;
  PXPhotoKitAssetsDataSource *v7;

  v5 = a4;
  objc_msgSend(a3, "immutableCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXPhotoKitAssetsDataSource initWithImmutablePhotosDataSource:withChangeDetails:]([PXPhotoKitAssetsDataSource alloc], "initWithImmutablePhotosDataSource:withChangeDetails:", v6, v5);

  return v7;
}

- (void)updateWithPhotosDataSource:(id)a3 sectionedDataSourceChangeDetails:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v6 = a4;
  v9 = v6;
  if (a3)
  {
    -[PXPhotoKitAssetsDataSourceManager _createAssetsDataSourceWithPhotosDataSource:withChangeDetails:](self, "_createAssetsDataSourceWithPhotosDataSource:withChangeDetails:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    a3 = v7;
  }
  else
  {
    v8 = v6;
  }
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", a3, v8);

}

- (void)setPhotosDataSource:(id)a3
{
  -[PXPhotoKitAssetsDataSourceManager setPhotosDataSource:publishIntermediateEmptySnapshot:](self, "setPhotosDataSource:publishIntermediateEmptySnapshot:", a3, 1);
}

- (void)setPhotosDataSource:(id)a3 changeDetails:(id)a4
{
  PXPhotosDataSource *v7;
  PXPhotosDataSource *photosDataSource;
  id v9;
  PXPhotosDataSource *v10;

  v7 = (PXPhotosDataSource *)a3;
  photosDataSource = self->_photosDataSource;
  v10 = v7;
  if (photosDataSource != v7)
  {
    v9 = a4;
    -[PXPhotosDataSource unregisterChangeObserver:](photosDataSource, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_photosDataSource, a3);
    -[PXPhotosDataSource registerChangeObserver:](self->_photosDataSource, "registerChangeObserver:", self);
    -[PXPhotoKitAssetsDataSourceManager updateWithPhotosDataSource:sectionedDataSourceChangeDetails:](self, "updateWithPhotosDataSource:sectionedDataSourceChangeDetails:", v10, v9);

  }
}

- (void)setPhotosDataSource:(id)a3 publishIntermediateEmptySnapshot:(BOOL)a4
{
  PXPhotosDataSource *v7;
  PXPhotosDataSource *photosDataSource;
  BOOL v9;
  PXPhotosDataSource *v10;

  v7 = (PXPhotosDataSource *)a3;
  photosDataSource = self->_photosDataSource;
  if (photosDataSource != v7)
  {
    v10 = v7;
    -[PXPhotosDataSource unregisterChangeObserver:](photosDataSource, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_photosDataSource, a3);
    -[PXPhotosDataSource registerChangeObserver:](self->_photosDataSource, "registerChangeObserver:", self);
    if (a4
      || !-[PXPhotosDataSource isEmpty](v10, "isEmpty")
      || (v9 = -[PXPhotosDataSource isBackgroundFetching](v10, "isBackgroundFetching"), v7 = v10, !v9))
    {
      -[PXPhotoKitAssetsDataSourceManager updateWithPhotosDataSource:andDataSourceChange:](self, "updateWithPhotosDataSource:andDataSourceChange:", v10, 0);
      v7 = v10;
    }
  }

}

- (PHPhotoLibrary)photoLibrary
{
  void *v2;
  void *v3;

  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHPhotoLibrary *)v3;
}

- (OS_dispatch_queue)_utilityWorkQueue
{
  OS_dispatch_queue *utilityWorkQueue;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;

  utilityWorkQueue = self->__utilityWorkQueue;
  if (!utilityWorkQueue)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (OS_dispatch_queue *)dispatch_queue_create("PXPhotoKitAssetsDataSourceManager_background", v4);
    v6 = self->__utilityWorkQueue;
    self->__utilityWorkQueue = v5;

    utilityWorkQueue = self->__utilityWorkQueue;
  }
  return utilityWorkQueue;
}

- (id)sharedLibraryStatusProvider
{
  void *v2;
  void *v3;

  -[PXPhotoKitAssetsDataSourceManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCurationEnabledForAllCollections:(BOOL)a3 curationLength:(int64_t)a4 collectionsToDiff:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;

  v6 = a3;
  v8 = a5;
  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWantsCurationForAllCollections:collectionsToDiff:", v6, v8);

  objc_msgSend(v9, "setWantsCurationByDefault:", v6);
  objc_msgSend(v9, "setCurationLength:", a4);

}

- (void)setCurationEnabled:(BOOL)a3 forAssetCollection:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWantsCuration:forAssetCollection:", v4, v6);

}

- (BOOL)forceAccurateSectionsIfNeeded:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundFetchOriginSection:", objc_msgSend(v4, "lastIndex"));
    v6 = objc_msgSend(v5, "forceAccurateSectionsIfNeeded:reloadChanges:", v4, 0);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  return -[PXPhotosDataSource pauseChangeDeliveryAndBackgroundLoadingWithTimeout:identifier:](self->_photosDataSource, "pauseChangeDeliveryAndBackgroundLoadingWithTimeout:identifier:", a4, a3);
}

- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3
{
  -[PXPhotosDataSource resumeChangeDeliveryAndBackgroundLoading:](self->_photosDataSource, "resumeChangeDeliveryAndBackgroundLoading:", a3);
}

- (int64_t)backgroundFetchOriginSection
{
  if (self->_photosDataSource)
    return -[PXPhotosDataSource backgroundFetchOriginSection](self->_photosDataSource, "backgroundFetchOriginSection");
  else
    return -[NSNumber integerValue](self->_backgroundFetchOriginSection, "integerValue");
}

- (BOOL)isBackgroundFetching
{
  void *v2;
  int v3;

  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isBackgroundFetching") & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else if ((objc_msgSend(v2, "options") & 0x10000) != 0 && objc_msgSend(v2, "isEmpty"))
  {
    v3 = objc_msgSend(v2, "areAllSectionsConsideredAccurate") ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (BOOL)supportsFiltering
{
  return 1;
}

- (BOOL)supportsCurationToggling
{
  void *v2;
  char v3;

  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsCurationToggling");

  return v3;
}

- (void)setFilteringDisabled:(BOOL)a3 forAssetCollection:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisableFilters:forAssetCollection:", v4, v6);

}

- (BOOL)includeOthersInSocialGroupAssets
{
  void *v2;
  char v3;

  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "includeOthersInSocialGroupAssets");

  return v3;
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4
{
  _BOOL8 v4;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "includeOthersInSocialGroupAssets");

  if (v7 != v4)
  {
    -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIncludeOthersInSocialGroupAssets:provideIncrementalChangeDetailsForAssetCollections:", v4, v9);

  }
}

- (void)setAllowedUUIDs:(id)a3 manualOrderUUIDs:(id)a4 forAssetCollections:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowedUUIDs:manualOrderUUIDs:forAssetCollections:", v10, v9, v8);

}

- (NSArray)sortDescriptors
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  -[PXPhotoKitAssetsDataSourceManager photosDataSourceIfExists](self, "photosDataSourceIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "sortDescriptors");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self->_sortDescriptors;
  }
  v6 = v5;

  return v6;
}

- (void)setSortDescriptors:(id)a3
{
  NSArray *sortDescriptors;
  void *v5;
  NSArray *v6;
  id v7;

  sortDescriptors = (NSArray *)a3;
  -[PXPhotoKitAssetsDataSourceManager photosDataSourceIfExists](self, "photosDataSourceIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setSortDescriptors:", sortDescriptors);
  }
  else
  {
    v6 = (NSArray *)-[NSArray copy](sortDescriptors, "copy");

    sortDescriptors = self->_sortDescriptors;
    self->_sortDescriptors = v6;
  }

}

- (id)localizedEmptyPlaceholderTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;

  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionListFetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count")
    || (objc_msgSend(v2, "containerCollection"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        PXPhotoKitLocalizedTitleForEmptyContainerCollection(v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    objc_msgSend(v2, "container");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0
      || (objc_msgSend(v2, "container"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "px_fetchEmptyContentString"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          !v5))
    {
      PXPhotoKitLocalizedTitleForEmptyCollectionListFetchResult(v3, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (id)localizedEmptyPlaceholderAttributedMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionListFetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
    goto LABEL_3;
  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXPhotoKitLocalizedMessageForEmptyContainerCollection(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_3:
    PXPhotoKitLocalizedMessageForEmptyCollectionListFetchResult(v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)localizedLoadingInitialDataSourceMessage
{
  return (id)-[NSString copy](self->_localizedLoadingInitialDataSourceMessage, "copy");
}

- (void)forceIncludeAssetsAtIndexPaths:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceIncludeAssetsAtIndexes:", v4);

}

- (void)stopForceIncludingAllAssets
{
  id v2;

  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopForceIncludingAllAssets");

}

- (void)excludeAssetsAtIndexPaths:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceExcludeAssetsAtIndexes:", v4);

}

- (void)stopExcludingAssets:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopExcludingAssets:", v4);

}

- (void)refreshResultsForAssetCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "refetchResultsForAssetCollection:", v4);

}

- (void)markContentAsViewed
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "px_isFeaturedPhotosCollection"))
    -[PXPhotoKitAssetsDataSourceManager _markFeaturedPhotosAsViewed](self, "_markFeaturedPhotosAsViewed");
  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;

    if (v6)
      -[PXPhotoKitAssetsDataSourceManager _markSharedAlbumAsViewed:](self, "_markSharedAlbumAsViewed:", v6);
  }
  else
  {

    v6 = 0;
  }

}

- (void)_markFeaturedPhotosAsViewed
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  -[PXPhotoKitAssetsDataSourceManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PXPhotoKitAssetsDataSourceManager__markFeaturedPhotosAsViewed__block_invoke;
  block[3] = &unk_1E5149198;
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

- (void)_markSharedAlbumAsViewed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[PXPhotoKitAssetsDataSourceManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetsDataSourceManager _utilityWorkQueue](self, "_utilityWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PXPhotoKitAssetsDataSourceManager__markSharedAlbumAsViewed___block_invoke;
  v9[3] = &unk_1E5148D08;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, v9);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v9 = a3;
  if ((void *)PXContentSyndicationConfigurationObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetsDataSourceManager.m"), 650, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 5) != 0)
  {
    v14 = v9;
    -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "containerAssetCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCanIncludeUnsavedSyndicatedAssets:", +[PXPhotoKitAssetsDataSourceManager _includeUnsavedSyndicatedAssetsForAssetCollection:photoLibrary:](PXPhotoKitAssetsDataSourceManager, "_includeUnsavedSyndicatedAssetsForAssetCollection:photoLibrary:", v11, v12));

    v9 = v14;
  }

}

- (id)photosDataSourceInterestingAssetReferences:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PXPhotoKitAssetsDataSourceManager photosDataSource](self, "photosDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PXSectionedDataSourceManager queryObserversInterestingObjectReferences](self, "queryObserversInterestingObjectReferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexesOfObjectsPassingTest:", &__block_literal_global_106655);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectsAtIndexes:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_didFinishLoadingInitialPhotosDataSource
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __77__PXPhotoKitAssetsDataSourceManager__didFinishLoadingInitialPhotosDataSource__block_invoke;
  v2[3] = &unk_1E51270B0;
  v2[4] = self;
  -[PXPhotoKitAssetsDataSourceManager enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v2);
}

- (BOOL)ignoreSharedLibraryFilters
{
  return self->_ignoreSharedLibraryFilters;
}

- (void)setIgnoreSharedLibraryFilters:(BOOL)a3
{
  self->_ignoreSharedLibraryFilters = a3;
}

- (BOOL)_isLoadingInitialPhotosDataSource
{
  return self->__isLoadingInitialPhotosDataSource;
}

- (void)set_utilityWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->__utilityWorkQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__utilityWorkQueue, 0);
  objc_storeStrong((id *)&self->_photosDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_contentSyndicationConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_localizedLoadingInitialDataSourceMessage, 0);
  objc_storeStrong((id *)&self->_initialDataSourceLoadingQueue, 0);
  objc_storeStrong((id *)&self->_backgroundFetchOriginSection, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
}

void __77__PXPhotoKitAssetsDataSourceManager__didFinishLoadingInitialPhotosDataSource__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assetsDataSourceManagerDidFinishLoadingInitialDataSource:", *(_QWORD *)(a1 + 32));

}

uint64_t __80__PXPhotoKitAssetsDataSourceManager_photosDataSourceInterestingAssetReferences___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __62__PXPhotoKitAssetsDataSourceManager__markSharedAlbumAsViewed___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "photoLibraryForCurrentQueueQoS");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__PXPhotoKitAssetsDataSourceManager__markSharedAlbumAsViewed___block_invoke_2;
  v4[3] = &unk_1E5148D08;
  v5 = *(id *)(a1 + 40);
  v6 = v2;
  v3 = v2;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

void __62__PXPhotoKitAssetsDataSourceManager__markSharedAlbumAsViewed___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D71628];
  objc_msgSend(*(id *)(a1 + 32), "cloudGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudSharedAlbumWithGUID:inLibrary:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D71BA8], "userDidNavigateIntoSharedAlbum:", v4);
  }
  else
  {
    PLSharedAlbumsGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "cloudGUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Could not find plSharedAlbum to mark as viewed, for cloudGUID: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }

}

void __64__PXPhotoKitAssetsDataSourceManager__markFeaturedPhotosAsViewed__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[PXPhotosIntelligenceFetcher fetchFeaturedPhotoSuggestionsInPhotoLibrary:currentlyFeaturedOnly:](PXPhotosIntelligenceFetcher, "fetchFeaturedPhotoSuggestionsInPhotoLibrary:currentlyFeaturedOnly:", *(_QWORD *)(a1 + 32), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!objc_msgSend(v8, "state"))
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  if (objc_msgSend(v2, "count"))
  {
    v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__PXPhotoKitAssetsDataSourceManager__markFeaturedPhotosAsViewed__block_invoke_2;
    v10[3] = &unk_1E5149198;
    v11 = v2;
    objc_msgSend(v9, "performChanges:completionHandler:", v10, 0);

  }
}

void __64__PXPhotoKitAssetsDataSourceManager__markFeaturedPhotosAsViewed__block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "markActive");

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __60__PXPhotoKitAssetsDataSourceManager__ensurePhotosDataSource__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "loadInitialPhotosDataSourceForDataSourceManager:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PXPhotoKitAssetsDataSourceManager__ensurePhotosDataSource__block_invoke_2;
  v5[3] = &unk_1E5148D08;
  v3 = *(_QWORD *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __60__PXPhotoKitAssetsDataSourceManager__ensurePhotosDataSource__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundFetchOriginSection:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "backgroundFetchOriginSection"));
  if (objc_msgSend(*(id *)(a1 + 32), "isBackgroundFetching"))
    objc_msgSend(*(id *)(a1 + 32), "startBackgroundFetchIfNeeded");
  objc_msgSend(*(id *)(a1 + 40), "_setLoadingInitialPhotosDataSource:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "setPhotosDataSource:publishIntermediateEmptySnapshot:", *(_QWORD *)(a1 + 32), 1);
}

+ (PXPhotoKitAssetsDataSourceManager)dataSourceManagerWithAsset:(id)a3
{
  return (PXPhotoKitAssetsDataSourceManager *)objc_msgSend(a1, "dataSourceManagerWithAsset:options:", a3, 0);
}

+ (PXPhotoKitAssetsDataSourceManager)dataSourceManagerWithAsset:(id)a3 options:(unint64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PXPhotosDataSourceConfiguration *v14;
  PXPhotosDataSource *v15;
  PXPhotoKitAssetsDataSourceManager *v16;
  PXPhotoKitAssetsDataSourceManager *v17;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CD13B8];
  v20[0] = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transientAssetCollectionWithAssets:title:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CD14E0];
  v19 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transientCollectionListWithCollections:title:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchCollectionsInCollectionList:options:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v13, a4 | 4);
  v15 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v14);
  v16 = [PXPhotoKitAssetsDataSourceManager alloc];

  v17 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:](v16, "initWithPhotosDataSource:", v15);
  return v17;
}

+ (PXPhotoKitAssetsDataSourceManager)dataSourceManagerWithAssets:(id)a3
{
  return (PXPhotoKitAssetsDataSourceManager *)objc_msgSend(a1, "dataSourceManagerWithAssets:containerTitle:options:", a3, 0, 0);
}

+ (PXPhotoKitAssetsDataSourceManager)dataSourceManagerWithAssets:(id)a3 containerTitle:(id)a4 options:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PXPhotosDataSourceConfiguration *v11;
  PXPhotosDataSource *v12;
  PXPhotoKitAssetsDataSourceManager *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CD14E0];
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transientCollectionListWithCollections:title:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchCollectionsInCollectionList:options:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v10, a5);
  v12 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v11);
  v13 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v12);

  return v13;
}

+ (id)dataSourceManagerForAssetCollection:(id)a3
{
  return (id)objc_msgSend(a1, "dataSourceManagerForAssetCollection:existingAssetsFetchResult:", a3, 0);
}

+ (id)dataSourceManagerForAssetCollection:(id)a3 existingAssetsFetchResult:(id)a4
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  return (id)objc_msgSend(a1, "dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:", a3, a4, 0, 0, 0, 0, v5);
}

+ (id)dataSourceManagerForAssetCollection:(id)a3 existingAssetsFetchResult:(id)a4 existingKeyAssetsFetchResult:(id)a5 fetchPropertySets:(id)a6 basePredicate:(id)a7 options:(unint64_t)a8 ignoreSharedLibraryFilters:(BOOL)a9
{
  uint64_t v10;

  LOWORD(v10) = a9;
  return (id)objc_msgSend(a1, "dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:reverseSortOrder:", a3, a4, a5, a6, a7, a8, v10);
}

+ (id)dataSourceManagerForAssetCollection:(id)a3 existingAssetsFetchResult:(id)a4 existingKeyAssetsFetchResult:(id)a5 fetchPropertySets:(id)a6 basePredicate:(id)a7 options:(unint64_t)a8 ignoreSharedLibraryFilters:(BOOL)a9 reverseSortOrder:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  PXPhotoKitAssetsDataSourceManagerConfiguration *v24;
  void *v25;
  void *v27;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetsDataSourceManager.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollection"));

  }
  objc_msgSend(v17, "photoLibrary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(a1, "_includeUnsavedSyndicatedAssetsForAssetCollection:photoLibrary:", v17, v22);

  v24 = objc_alloc_init(PXPhotoKitAssetsDataSourceManagerConfiguration);
  -[PXPhotoKitAssetsDataSourceManagerConfiguration setExistingAssetsFetchResult:](v24, "setExistingAssetsFetchResult:", v18);
  -[PXPhotoKitAssetsDataSourceManagerConfiguration setExistingKeyAssetsFetchResult:](v24, "setExistingKeyAssetsFetchResult:", v19);
  -[PXPhotoKitAssetsDataSourceManagerConfiguration setFetchPropertySets:](v24, "setFetchPropertySets:", v20);
  -[PXPhotoKitAssetsDataSourceManagerConfiguration setBasePredicate:](v24, "setBasePredicate:", v21);
  -[PXPhotoKitAssetsDataSourceManagerConfiguration setOptions:](v24, "setOptions:", a8);
  -[PXPhotoKitAssetsDataSourceManagerConfiguration setIgnoreSharedLibraryFilters:](v24, "setIgnoreSharedLibraryFilters:", a9);
  -[PXPhotoKitAssetsDataSourceManagerConfiguration setReverseSortOrder:](v24, "setReverseSortOrder:", a10);
  -[PXPhotoKitAssetsDataSourceManagerConfiguration setCanIncludeUnsavedSyndicatedAssets:](v24, "setCanIncludeUnsavedSyndicatedAssets:", v23);
  objc_msgSend(a1, "dataSourceManagerForAssetCollection:configuration:", v17, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)dataSourceManagerForAssetCollection:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  PXPhotosDataSourceConfiguration *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  PXPhotosDataSource *v28;
  PXPhotoKitAssetsDataSourceManager *v29;
  unsigned int v31;
  char v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "existingAssetsFetchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "existingKeyAssetsFetchResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchPropertySets");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "basePredicate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "options");
  v32 = objc_msgSend(v6, "ignoreSharedLibraryFilters");
  v31 = objc_msgSend(v6, "reverseSortOrder");
  v10 = objc_msgSend(v6, "canIncludeUnsavedSyndicatedAssets");

  objc_msgSend(v5, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isTransient"))
  {
    v13 = (void *)MEMORY[0x1E0CD14E0];
    v40[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transientCollectionListWithCollections:title:identifier:photoLibrary:", v14, v15, 0, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v16, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v12, "setIncludeScreenRecordingsSmartAlbum:", 1);
    objc_msgSend(v12, "setIncludeUserSmartAlbums:", 1);
    v18 = objc_msgSend(v5, "assetCollectionType") == 2 && objc_msgSend(v5, "assetCollectionSubtype") == 1000000211;
    objc_msgSend(v12, "setIncludeProResSmartAlbum:", v18);
    v19 = objc_msgSend(v5, "assetCollectionType") == 2 && objc_msgSend(v5, "assetCollectionSubtype") == 1000000214;
    objc_msgSend(v12, "setIncludeSharedLibrarySharingSuggestionsSmartAlbum:", v19);
    objc_msgSend(v12, "setIncludePendingMemories:", 1);
    objc_msgSend(v12, "setIncludeLocalMemories:", 1);
    objc_msgSend(v12, "setIncludeStoryMemories:", 1);
    v20 = (void *)MEMORY[0x1E0CD13B8];
    objc_msgSend(v5, "localIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fetchAssetCollectionsWithLocalIdentifiers:options:", v21, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v22 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:containerCollection:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:containerCollection:options:", v17, 0, v9);
  -[PXPhotosDataSourceConfiguration setFetchPropertySets:](v22, "setFetchPropertySets:", v34);
  -[PXPhotosDataSourceConfiguration setBasePredicate:](v22, "setBasePredicate:", v33);
  +[PXContentFilterState defaultFilterStateForContainerCollection:photoLibrary:](PXContentFilterState, "defaultFilterStateForContainerCollection:photoLibrary:", v5, v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "predicateForUseCase:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSourceConfiguration setFilterPredicate:](v22, "setFilterPredicate:", v24);

  -[PXPhotosDataSourceConfiguration setIncludeOthersInSocialGroupAssets:](v22, "setIncludeOthersInSocialGroupAssets:", objc_msgSend(v23, "includeOthersInSocialGroupAssets"));
  -[PXPhotosDataSourceConfiguration setReverseSortOrder:](v22, "setReverseSortOrder:", v31);
  -[PXPhotosDataSourceConfiguration setCanIncludeUnsavedSyndicatedAssets:](v22, "setCanIncludeUnsavedSyndicatedAssets:", v10);
  if (v7)
  {
    v37 = v5;
    v38 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSourceConfiguration setExistingAssetCollectionFetchResults:](v22, "setExistingAssetCollectionFetchResults:", v25);

  }
  if (v8)
  {
    v35 = v5;
    v36 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSourceConfiguration setExistingKeyAssetsFetchResults:](v22, "setExistingKeyAssetsFetchResults:", v26);

  }
  if ((v32 & 1) != 0
    || (objc_msgSend(v5, "px_isSharedAlbum") & 1) != 0
    || (objc_msgSend(v5, "px_isMyPhotoStreamAlbum") & 1) != 0)
  {
    v27 = 1;
  }
  else
  {
    v27 = objc_msgSend(v5, "px_isUnableToUploadSmartAlbum");
  }
  -[PXPhotosDataSourceConfiguration setIgnoreSharedLibraryFilters:](v22, "setIgnoreSharedLibraryFilters:", v27);
  if (-[PXPhotosDataSourceConfiguration ignoreSharedLibraryFilters](v22, "ignoreSharedLibraryFilters"))
  {
    -[PXPhotosDataSourceConfiguration setLibraryFilterState:](v22, "setLibraryFilterState:", 0);
    -[PXPhotosDataSourceConfiguration setLibraryFilter:](v22, "setLibraryFilter:", 0);
  }
  v28 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v22);
  v29 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v28);

  return v29;
}

+ (BOOL)_includeUnsavedSyndicatedAssetsForAssetCollection:(id)a3 photoLibrary:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  char ShouldShowUnsavedAssetsInGridForAssetCollection;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetsDataSourceManager.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:](PXContentSyndicationConfigurationProvider, "contentSyndicationConfigurationProviderWithPhotoLibrary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "showUnsavedSyndicatedContentInPhotosGrids");
  ShouldShowUnsavedAssetsInGridForAssetCollection = v10;
  if (v7 && v10)
    ShouldShowUnsavedAssetsInGridForAssetCollection = PXContentSyndicationShouldShowUnsavedAssetsInGridForAssetCollection(v7);

  return ShouldShowUnsavedAssetsInGridForAssetCollection;
}

- (id)px_sharedLibrarySharingSuggestionsCountsManager
{
  void *v2;
  void *v3;

  -[PXPhotoKitAssetsDataSourceManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_sharedLibrarySharingSuggestionsCountsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
