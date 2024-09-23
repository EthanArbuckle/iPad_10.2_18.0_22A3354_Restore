@implementation PXPlacesAlbumCoverProvider

- (PXPlacesAlbumCoverProvider)initWithDelegate:(id)a3 andPlacesCollection:(id)a4
{
  id v7;
  id v8;
  PXPlacesAlbumCoverProvider *v9;
  PXPlacesAlbumCoverProvider *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *backgroundQueue;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *requestsQueue;
  uint64_t v19;
  NSMutableDictionary *cachedPlaceholders;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PXPlacesAlbumCoverProvider;
  v9 = -[PXPlacesAlbumCoverProvider init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_factoryDelegate, a3);
    objc_storeStrong((id *)&v10->_placesCollection, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.photos.places.AlbumCoverProvider-Background", v12);
    backgroundQueue = v10->_backgroundQueue;
    v10->_backgroundQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UTILITY, 0);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = dispatch_queue_create("com.apple.photos.places.AlbumCoverProvider-Requests", v16);
    requestsQueue = v10->_requestsQueue;
    v10->_requestsQueue = (OS_dispatch_queue *)v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    cachedPlaceholders = v10->_cachedPlaceholders;
    v10->_cachedPlaceholders = (NSMutableDictionary *)v19;

  }
  return v10;
}

- (int64_t)cachedCount
{
  PXPlacesAlbumCoverProvider *v2;
  int64_t cachedCount;

  v2 = self;
  objc_sync_enter(v2);
  cachedCount = v2->_cachedCount;
  objc_sync_exit(v2);

  return cachedCount;
}

- (void)setCachedCount:(int64_t)a3
{
  PXPlacesAlbumCoverProvider *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_cachedCount = a3;
  objc_sync_exit(obj);

}

- (void)preloadCachedSnapshotForUserInterfaceStyle:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  int64_t v9;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__PXPlacesAlbumCoverProvider_preloadCachedSnapshotForUserInterfaceStyle___block_invoke;
  v7[3] = &unk_1E5145560;
  v8 = v5;
  v9 = a3;
  v7[4] = self;
  v6 = v5;
  objc_msgSend(v6, "scheduleTaskWithQoS:block:", 0, v7);

}

- (void)preloadPlaceholderForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    -[PXPlacesAlbumCoverProvider backgroundImageNameForType:usingTraitCollection:](self, "backgroundImageNameForType:usingTraitCollection:", 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesAlbumCoverProvider cachedPlaceholders](self, "cachedPlaceholders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __67__PXPlacesAlbumCoverProvider_preloadPlaceholderForTraitCollection___block_invoke;
      v10[3] = &unk_1E513DD48;
      v10[4] = self;
      v11 = v4;
      v12 = v8;
      v13 = v5;
      v9 = v8;
      objc_msgSend(v9, "scheduleTaskWithQoS:block:", 0, v10);

    }
  }

}

- (void)requestPlacesAlbumCover:(id)a3 snapshotTraitCollection:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, uint64_t, int64_t, _QWORD);
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  int64_t v15;
  UIImage *cachedSnapshotImage;
  NSString *cachedSnapshotImageIdentifier;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *backgroundQueue;
  void (**v22)(id, void *, uint64_t, int64_t, _QWORD);
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id buf[2];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, uint64_t, int64_t, _QWORD))a5;
  -[PXPlacesAlbumCoverProvider placesAlbumCoverProviderLog](self, "placesAlbumCoverProviderLog");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FetchCachedPlacesCover", ", (uint8_t *)buf, 2u);
  }

  v15 = -[PXPlacesAlbumCoverProvider cachedCount](self, "cachedCount");
  if (!self->_cachedSnapshotImage)
  {
    if (self->_cachedSnapshotImageIdentifier)
    {
      if (-[PXPlacesAlbumCoverProvider _imageExistsWithLocalIdentifier:](self, "_imageExistsWithLocalIdentifier:"))
      {
        if (!v10)
          goto LABEL_15;
        goto LABEL_6;
      }
      cachedSnapshotImage = self->_cachedSnapshotImage;
      self->_cachedSnapshotImage = 0;

      cachedSnapshotImageIdentifier = self->_cachedSnapshotImageIdentifier;
      self->_cachedSnapshotImageIdentifier = 0;

    }
    else if (!v10)
    {
      goto LABEL_15;
    }
    -[PXPlacesAlbumCoverProvider _placeHolderImageForExtendedTraitCollection:](self, "_placeHolderImageForExtendedTraitCollection:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v18, 1, v15, 0);

    goto LABEL_15;
  }
  if (v10)
LABEL_6:
    ((void (*)(void (**)(id, void *, uint64_t, int64_t, _QWORD)))v10[2])(v10);
LABEL_15:
  v19 = v14;
  v20 = v19;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v20, OS_SIGNPOST_INTERVAL_END, v12, "FetchCachedPlacesCover", ", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  backgroundQueue = self->_backgroundQueue;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __89__PXPlacesAlbumCoverProvider_requestPlacesAlbumCover_snapshotTraitCollection_completion___block_invoke;
  v25[3] = &unk_1E5147230;
  objc_copyWeak(&v29, buf);
  v26 = v8;
  v27 = v9;
  v28 = v10;
  v22 = v10;
  v23 = v9;
  v24 = v8;
  dispatch_async(backgroundQueue, v25);

  objc_destroyWeak(&v29);
  objc_destroyWeak(buf);

}

- (void)requestAssetCountWithForcedRefresh:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *backgroundQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  backgroundQueue = self->_backgroundQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__PXPlacesAlbumCoverProvider_requestAssetCountWithForcedRefresh_completion___block_invoke;
  v9[3] = &unk_1E511C3F0;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(backgroundQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (PXPlacesSnapshotFactory)factory
{
  PXPlacesAlbumCoverProvider *v2;
  PXPlacesSnapshotFactory *factory;
  void *v4;
  PXPlacesSnapshotFactory *v5;
  PXPlacesSnapshotFactory *v6;
  PXPlacesSnapshotFactory *v7;
  void *v8;
  PXPlacesSnapshotFactory *v9;
  void *v10;
  PXPlacesSnapshotFactory *v11;

  v2 = self;
  objc_sync_enter(v2);
  factory = v2->_factory;
  if (!factory)
  {
    -[PHAssetCollection photoLibrary](v2->_placesCollection, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PXPlacesSnapshotFactory initWithPhotoLibrary:]([PXPlacesSnapshotFactory alloc], "initWithPhotoLibrary:", v4);
    v6 = v2->_factory;
    v2->_factory = v5;

    v7 = v2->_factory;
    -[PXPlacesAlbumCoverProvider factoryDelegate](v2, "factoryDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesSnapshotFactory setDelegate:](v7, "setDelegate:", v8);

    v9 = v2->_factory;
    -[PXPlacesAlbumCoverProvider placesCollection](v2, "placesCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesSnapshotFactory setPlacesCollection:](v9, "setPlacesCollection:", v10);

    factory = v2->_factory;
  }
  v11 = factory;
  objc_sync_exit(v2);

  return v11;
}

- (id)_placeHolderImageForExtendedTraitCollection:(id)a3
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
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithPaletteColors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationByApplyingConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4B50], 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationByApplyingConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("map"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_fetchCachedSnapshotImage:(id *)a3 andIdentifier:(id *)a4 forUserInterfaceStyle:(int64_t)a5
{
  NSObject *v7;
  __CFString *v8;
  uint64_t v9;
  const __CFURL *v10;
  CGImageSource *v11;
  CGImageSource *v12;
  CFDictionaryRef v13;
  CFDictionaryRef v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  BOOL v21;
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a5 == 2)
  {
    +[PXPlacesAlbumCoverProvider _cachedSnapshotPathDark](PXPlacesAlbumCoverProvider, "_cachedSnapshotPathDark");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v8 = (__CFString *)v9;
    goto LABEL_11;
  }
  if (a5 == 1)
  {
    +[PXPlacesAlbumCoverProvider _cachedSnapshotPathLight](PXPlacesAlbumCoverProvider, "_cachedSnapshotPathLight");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (a5)
  {
    v8 = 0;
  }
  else
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315138;
      v24 = "-[PXPlacesAlbumCoverProvider _fetchCachedSnapshotImage:andIdentifier:forUserInterfaceStyle:]";
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "We shouldn't have an unspecified user interface style: %s", (uint8_t *)&v23, 0xCu);
    }

    v8 = &stru_1E5149688;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
  v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v11 = CGImageSourceCreateWithURL(v10, 0);
  if (v11)
  {
    v12 = v11;
    v13 = CGImageSourceCopyPropertiesAtIndex(v11, 0, 0);
    v14 = v13;
    if (v13)
    {
      -[__CFDictionary objectForKey:](v13, "objectForKey:", *MEMORY[0x1E0CBCB50]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0CBCCB0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    CFRelease(v12);

  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71740]), "initWithImagePath:format:imageType:optimalSourcePixelSize:options:", v8, 10000, 1, 0, 0.0, 0.0);
  objc_msgSend(v17, "cachedImage:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (a3)
    *a3 = objc_retainAutorelease(v18);
  if (a4)
    *a4 = objc_retainAutorelease(v16);
  if (v19)
    v20 = v16 == 0;
  else
    v20 = 1;
  v21 = !v20;

  return v21;
}

- (BOOL)_imageExistsWithLocalIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CD1390];
  v13 = a3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCollection photoLibrary](self->_placesCollection, "photoLibrary", v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchAssetsWithLocalIdentifiers:options:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = objc_msgSend(v10, "count") != 0;
  else
    v11 = 0;

  return v11;
}

- (id)createAlbumPlaceHolderImageUsingTraitCollection:(id)a3
{
  void *v3;
  void *v4;

  -[PXPlacesAlbumCoverProvider backgroundImageNameForType:usingTraitCollection:](self, "backgroundImageNameForType:usingTraitCollection:", 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)backgroundImageNameForType:(int64_t)a3 usingTraitCollection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;

  v5 = a4;
  v6 = v5;
  if ((unint64_t)a3 > 1)
  {
    v10 = CFSTR("PXPlacesThumbnailPopover");
    if (a3 != 2)
      v10 = 0;
    if (a3 == 5)
      v9 = CFSTR("PXPlacesThumbnailPopoverInfoPanel");
    else
      v9 = v10;
  }
  else
  {
    v7 = objc_msgSend(v5, "userInterfaceIdiom");
    v8 = objc_msgSend(v6, "layoutSizeSubclass");
    v9 = 0;
    switch(v7)
    {
      case 0:
      case 2:
        v9 = CFSTR("PXPlacesAlbumCover-iPad");
        break;
      case 1:
        if ((unint64_t)(v8 - 1) >= 3)
          v9 = 0;
        else
          v9 = off_1E511C430[v8 - 1];
        break;
      case 4:
        v9 = CFSTR("PXPlacesAlbumCover-OSX");
        break;
      default:
        break;
    }
  }

  return (id)v9;
}

- (id)placesAlbumCoverProviderLog
{
  if (placesAlbumCoverProviderLog_onceToken != -1)
    dispatch_once(&placesAlbumCoverProviderLog_onceToken, &__block_literal_global_169);
  return (id)placesAlbumCoverProviderLog_placesAlbumCoverProviderLog;
}

- (void)setFactory:(id)a3
{
  objc_storeStrong((id *)&self->_factory, a3);
}

- (PXPlacesSnapshotFactoryDelegate)factoryDelegate
{
  return self->_factoryDelegate;
}

- (void)setFactoryDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_factoryDelegate, a3);
}

- (PHAssetCollection)placesCollection
{
  return self->_placesCollection;
}

- (void)setPlacesCollection:(id)a3
{
  objc_storeStrong((id *)&self->_placesCollection, a3);
}

- (NSMutableDictionary)cachedPlaceholders
{
  return self->_cachedPlaceholders;
}

- (void)setCachedPlaceholders:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPlaceholders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPlaceholders, 0);
  objc_storeStrong((id *)&self->_placesCollection, 0);
  objc_storeStrong((id *)&self->_factoryDelegate, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_requestsQueue, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotImageIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotImage, 0);
}

void __57__PXPlacesAlbumCoverProvider_placesAlbumCoverProviderLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "PlacesAlbumCoverProvider");
  v1 = (void *)placesAlbumCoverProviderLog_placesAlbumCoverProviderLog;
  placesAlbumCoverProviderLog_placesAlbumCoverProviderLog = (uint64_t)v0;

}

void __76__PXPlacesAlbumCoverProvider_requestAssetCountWithForcedRefresh_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "factory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestAssetCountWithForcedRefresh:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

void __89__PXPlacesAlbumCoverProvider_requestPlacesAlbumCover_snapshotTraitCollection_completion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  PXPlacesUtils *v3;
  void *v4;
  PXPlacesSnapshotOptions *v5;
  PXPlacesGeotaggableMediaProvider *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = objc_alloc_init(PXPlacesUtils);
    -[PXPlacesUtils pkExtendedTraitCollectionFromPXExtendedTraitCollection:](v3, "pkExtendedTraitCollectionFromPXExtendedTraitCollection:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTraitCollectionForMapKit:", *(_QWORD *)(a1 + 40));
    v5 = objc_alloc_init(PXPlacesSnapshotOptions);
    -[PXPlacesSnapshotOptions setExtendedTraitCollection:](v5, "setExtendedTraitCollection:", v4);
    v6 = objc_alloc_init(PXPlacesGeotaggableMediaProvider);
    -[PXPlacesSnapshotOptions setGeotaggableInformationDelegate:](v5, "setGeotaggableInformationDelegate:", v6);

    +[PXPlacesAlbumCoverProvider _cachedSnapshotPathLight](PXPlacesAlbumCoverProvider, "_cachedSnapshotPathLight");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByDeletingLastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesSnapshotOptions setCacheDirectoryPath:](v5, "setCacheDirectoryPath:", v8);

    -[PXPlacesSnapshotOptions setQueue:](v5, "setQueue:", WeakRetained[4]);
    -[PXPlacesSnapshotOptions setShouldSkipPlaceholder:](v5, "setShouldSkipPlaceholder:", 1);
    objc_msgSend(WeakRetained, "factory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __89__PXPlacesAlbumCoverProvider_requestPlacesAlbumCover_snapshotTraitCollection_completion___block_invoke_2;
    v10[3] = &unk_1E511C3C8;
    v10[4] = WeakRetained;
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v9, "requestPlacesLibraryAlbumSnapshotWithSnapshotOptions:andCompletion:", v5, v10);

  }
}

void __89__PXPlacesAlbumCoverProvider_requestPlacesAlbumCover_snapshotTraitCollection_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id v16;

  v6 = a4;
  objc_msgSend(*(id *)(a1 + 32), "setCachedCount:", a3);
  v16 = 0;
  v15 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_fetchCachedSnapshotImage:andIdentifier:forUserInterfaceStyle:", &v16, &v15, objc_msgSend(*(id *)(a1 + 40), "userInterfaceStyle"));
  v7 = v16;
  v8 = v15;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, id, _QWORD, uint64_t, id))(v9 + 16))(v9, v7, 0, a3, v6);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PXPlacesAlbumCoverProvider_requestPlacesAlbumCover_snapshotTraitCollection_completion___block_invoke_3;
  block[3] = &unk_1E51457C8;
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

void __89__PXPlacesAlbumCoverProvider_requestPlacesAlbumCover_snapshotTraitCollection_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_storeStrong((id *)(v1 + 8), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 48));
  }
}

void __67__PXPlacesAlbumCoverProvider_preloadPlaceholderForTraitCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_placeHolderImageForExtendedTraitCollection:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PXPlacesAlbumCoverProvider_preloadPlaceholderForTraitCollection___block_invoke_2;
  v5[3] = &unk_1E51457C8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = v2;
  v4 = v2;
  objc_msgSend(v3, "scheduleMainQueueTaskAndWait:", v5);

}

void __67__PXPlacesAlbumCoverProvider_preloadPlaceholderForTraitCollection___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "cachedPlaceholders");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

void __73__PXPlacesAlbumCoverProvider_preloadCachedSnapshotForUserInterfaceStyle___block_invoke(_QWORD *a1)
{
  void *v2;
  int v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;

  v2 = (void *)a1[4];
  v10 = 0;
  v11 = 0;
  v3 = objc_msgSend(v2, "_fetchCachedSnapshotImage:andIdentifier:forUserInterfaceStyle:", &v11, &v10, a1[6]);
  v4 = v11;
  v5 = v10;
  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__PXPlacesAlbumCoverProvider_preloadCachedSnapshotForUserInterfaceStyle___block_invoke_2;
    v7[3] = &unk_1E51457C8;
    v6 = (void *)a1[5];
    v7[4] = a1[4];
    v8 = v4;
    v9 = v5;
    objc_msgSend(v6, "scheduleMainQueueTaskAndWait:", v7);

  }
}

void __73__PXPlacesAlbumCoverProvider_preloadCachedSnapshotForUserInterfaceStyle___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 48));
}

+ (id)_cachedSnapshotPathLight
{
  if (_cachedSnapshotPathLight_onceToken != -1)
    dispatch_once(&_cachedSnapshotPathLight_onceToken, &__block_literal_global_40796);
  return (id)_cachedSnapshotPathLight_cachedSnapshotPathLight;
}

+ (id)_cachedSnapshotPathDark
{
  if (_cachedSnapshotPathDark_onceToken != -1)
    dispatch_once(&_cachedSnapshotPathDark_onceToken, &__block_literal_global_135);
  return (id)_cachedSnapshotPathDark_cachedSnapshotPathDark;
}

+ (id)_cachedSnapshotPathForFilename:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _cachedSnapshotPathForFilename__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_cachedSnapshotPathForFilename__onceToken, &__block_literal_global_136_40792);
  objc_msgSend((id)_cachedSnapshotPathForFilename__systemLibraryPathManager, "photoDirectoryWithType:additionalPathComponents:", 28, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __61__PXPlacesAlbumCoverProvider__cachedSnapshotPathForFilename___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_cachedSnapshotPathForFilename__systemLibraryPathManager;
  _cachedSnapshotPathForFilename__systemLibraryPathManager = v0;

}

void __53__PXPlacesAlbumCoverProvider__cachedSnapshotPathDark__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PXPlacesAlbumCoverProvider _cachedSnapshotPathForFilename:](PXPlacesAlbumCoverProvider, "_cachedSnapshotPathForFilename:", CFSTR("PXPlacesAlbumImageCached_Dark.jpg"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_cachedSnapshotPathDark_cachedSnapshotPathDark;
  _cachedSnapshotPathDark_cachedSnapshotPathDark = v0;

}

void __54__PXPlacesAlbumCoverProvider__cachedSnapshotPathLight__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PXPlacesAlbumCoverProvider _cachedSnapshotPathForFilename:](PXPlacesAlbumCoverProvider, "_cachedSnapshotPathForFilename:", CFSTR("PXPlacesAlbumImageCached.jpg"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_cachedSnapshotPathLight_cachedSnapshotPathLight;
  _cachedSnapshotPathLight_cachedSnapshotPathLight = v0;

}

@end
