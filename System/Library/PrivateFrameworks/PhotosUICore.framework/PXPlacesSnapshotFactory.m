@implementation PXPlacesSnapshotFactory

- (PXPlacesSnapshotFactory)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesSnapshotFactory.m"), 139, CFSTR("%s is not available as initializer"), "-[PXPlacesSnapshotFactory init]");

  abort();
}

- (PXPlacesSnapshotFactory)initWithPhotoLibrary:(id)a3
{
  id v6;
  PXPlacesSnapshotFactory *v7;
  PXPlacesSnapshotFactory *v8;
  PXLibraryFilterState *v9;
  void *libraryFilterState;
  PXLibraryFilterState *v11;
  PXLibraryFilterState *v12;
  uint64_t v13;
  NSMutableArray *localSearches;
  dispatch_queue_t v15;
  OS_dispatch_queue *concurrentQueue;
  dispatch_queue_t v17;
  OS_dispatch_queue *serialQueue;
  void *v20;
  objc_super v21;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesSnapshotFactory.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v21.receiver = self;
  v21.super_class = (Class)PXPlacesSnapshotFactory;
  v7 = -[PXPlacesSnapshotFactory init](&v21, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    if (PFProcessIsLaunchedToExecuteTests())
    {
      v9 = objc_alloc_init(PXLibraryFilterState);
      libraryFilterState = v8->_libraryFilterState;
      v8->_libraryFilterState = v9;
    }
    else
    {
      +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v8->_photoLibrary);
      libraryFilterState = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", libraryFilterState);
      v12 = v8->_libraryFilterState;
      v8->_libraryFilterState = v11;

    }
    v8->_countCacheInvalidated = 1;
    v8->_cachedCount = 0;
    v13 = objc_opt_new();
    localSearches = v8->_localSearches;
    v8->_localSearches = (NSMutableArray *)v13;

    v15 = dispatch_queue_create("imagingServicesQueue", MEMORY[0x1E0C80D50]);
    concurrentQueue = v8->_concurrentQueue;
    v8->_concurrentQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_create("snapshotRequestsServicesQueue", 0);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v17;

    v8->_cachedIvarLock._os_unfair_lock_opaque = 0;
    v8->_countLabelStyle = 0;
    if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
      v8->_countLabelStyle = 1;
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_isRegisteredForPhotoLibraryChanges)
  {
    -[PXPlacesSnapshotFactory photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterChangeObserver:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)PXPlacesSnapshotFactory;
  -[PXPlacesSnapshotFactory dealloc](&v4, sel_dealloc);
}

- (int64_t)currentUserInterfaceStyle
{
  PXPlacesSnapshotFactory *v2;
  int64_t currentUserInterfaceStyle;

  v2 = self;
  objc_sync_enter(v2);
  currentUserInterfaceStyle = v2->_currentUserInterfaceStyle;
  objc_sync_exit(v2);

  return currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  PXPlacesSnapshotFactory *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_currentUserInterfaceStyle = a3;
  objc_sync_exit(obj);

}

- (void)requestMapSnapshotWithAssets:(id)a3 snapshotOptions:(id)a4 popoverImageOptions:(unint64_t)a5 completion:(id)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  PXPlacesPhotoAssetsStore *v37;
  id v38;
  PXPlacesPhotoAssetsStore *v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  id v44;
  id v45;
  void *v46;
  NSObject *v47;
  id v48;
  PXPlacesPhotoAssetsStore *v49;
  id v50;
  dispatch_queue_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v56;
  id v58;
  id v59;
  id v60;
  _QWORD block[4];
  PXPlacesPhotoAssetsStore *v62;
  id v63;
  _QWORD aBlock[4];
  id v65;
  PXPlacesPhotoAssetsStore *v66;
  id v67;
  id v68;
  id v69;
  NSObject *v70;
  PXPlacesSnapshotFactory *v71;
  id v72;
  NSObject *v73;
  id v74;
  id v75;
  _QWORD *v76;
  _QWORD *v77;
  _QWORD *v78;
  _QWORD *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  char v94;
  _QWORD v95[5];
  id v96;
  _QWORD v97[5];
  id v98;
  _QWORD v99[5];
  id v100;
  _QWORD v101[5];
  id v102;

  v59 = a3;
  v8 = a4;
  v58 = a6;
  objc_msgSend(v8, "viewSize");
  v53 = v10;
  v54 = v9;
  objc_msgSend(v8, "additionalInsets");
  v52 = v11;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v56 = objc_msgSend(v8, "shouldRenderThumbnailForNoLocation");
  v18 = objc_msgSend(v8, "popoverImageType");
  v101[0] = 0;
  v101[1] = v101;
  v101[2] = 0x3032000000;
  v101[3] = __Block_byref_object_copy__245719;
  v101[4] = __Block_byref_object_dispose__245720;
  v102 = 0;
  v99[0] = 0;
  v99[1] = v99;
  v99[2] = 0x3032000000;
  v99[3] = __Block_byref_object_copy__245719;
  v99[4] = __Block_byref_object_dispose__245720;
  v100 = 0;
  v97[0] = 0;
  v97[1] = v97;
  v97[2] = 0x3032000000;
  v97[3] = __Block_byref_object_copy__245719;
  v97[4] = __Block_byref_object_dispose__245720;
  v98 = 0;
  objc_msgSend(v8, "queue");
  v19 = objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = dispatch_queue_get_qos_class(v19, 0);

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v20 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v20, (dispatch_qos_class_t)a4, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  v51 = dispatch_queue_create("placesSnapshotConcurrentQueue", v21);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v22 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v22, (dispatch_qos_class_t)a4, 0);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = dispatch_queue_create("placesSnapshotSerialQueue", v23);

  objc_msgSend(v8, "extendedTraitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPlacesPopoverImageFactory sharedInstance](PXPlacesPopoverImageFactory, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "backgroundImageSizeForType:usingTraitCollection:", v18, v25);
  v28 = v27;
  v30 = v29;
  objc_msgSend(v26, "thumbnailImageSizeForImageType:usingTraitCollection:includeScale:", v18, v25, 1);
  v32 = v31;
  v34 = v33;
  LOBYTE(v23) = objc_msgSend(v8, "showsPointLabels");
  objc_msgSend(v8, "mapThumbnailCurationDelegate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v95[0] = 0;
  v95[1] = v95;
  v95[2] = 0x3032000000;
  v95[3] = __Block_byref_object_copy__245719;
  v95[4] = __Block_byref_object_dispose__245720;
  v96 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37 = -[PXPlacesPhotoAssetsStore initWithFetchResults:]([PXPlacesPhotoAssetsStore alloc], "initWithFetchResults:", v59);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke;
  aBlock[3] = &unk_1E513D240;
  v38 = v8;
  v65 = v38;
  v39 = v37;
  v66 = v39;
  v50 = v25;
  v67 = v50;
  v80 = v18;
  v81 = a5;
  v82 = 0;
  v40 = v35;
  v68 = v40;
  v83 = v54;
  v84 = v53;
  v85 = v52;
  v86 = v13;
  v87 = v15;
  v88 = v17;
  v60 = v59;
  v69 = v60;
  v41 = v51;
  v76 = v99;
  v77 = v97;
  v93 = (char)v23;
  v78 = v101;
  v70 = v41;
  v71 = self;
  v42 = v36;
  v72 = v42;
  v43 = v24;
  v73 = v43;
  v79 = v95;
  v94 = v56;
  v44 = v26;
  v74 = v44;
  v89 = v32;
  v90 = v34;
  v45 = v58;
  v75 = v45;
  v91 = v28;
  v92 = v30;
  v46 = _Block_copy(aBlock);
  objc_msgSend(v38, "queue");
  v47 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_13;
  block[3] = &unk_1E5148CE0;
  v62 = v39;
  v63 = v46;
  v48 = v46;
  v49 = v39;
  dispatch_async(v47, block);

  _Block_object_dispose(v95, 8);
  _Block_object_dispose(v97, 8);

  _Block_object_dispose(v99, 8);
  _Block_object_dispose(v101, 8);

}

- (void)requestPlacesLibraryAlbumSnapshotWithSnapshotOptions:(id)a3 andCompletion:(id)a4
{
  id v6;
  void (**v7)(id, UIImage *, int64_t, _QWORD);
  void *v8;
  uint64_t v9;
  UIImage *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  id v17;
  CGImageSource *v18;
  CGImageSource *v19;
  CFDictionaryRef v20;
  void *v21;
  void *v22;
  char v23;
  char v24;
  void *v25;
  UIImage *v26;
  NSObject *v27;
  void (**v28)(id, UIImage *, int64_t, _QWORD);
  id v29;
  CGImage *ImageAtIndex;
  void *v31;
  uint64_t v32;
  NSString *v33;
  BOOL v34;
  char v35;
  CFDictionaryRef v36;
  int64_t cachedCount;
  const __CFURL *url;
  void *v39;
  NSString *v40;
  _QWORD block[4];
  id v42;
  id v43;
  id v44;
  _BYTE location[12];
  __int16 v46;
  id v47;
  __int16 v48;
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, UIImage *, int64_t, _QWORD))a4;
  objc_msgSend(v6, "extendedTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceStyle");

  if (v9 == 2)
  {
    os_unfair_lock_lock(&self->_cachedIvarLock);
    v10 = self->_cachedSnapshotImageDark;
    v11 = self->_cachedFilePathDark;
    os_unfair_lock_unlock(&self->_cachedIvarLock);
    if (!v11)
    {
      objc_msgSend(v6, "cacheDirectoryPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("PXPlacesAlbumImageCached_Dark.jpg"));
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock(&self->_cachedIvarLock);
      objc_storeStrong((id *)&self->_cachedFilePathDark, v11);
      os_unfair_lock_unlock(&self->_cachedIvarLock);

    }
  }
  else
  {
    if (v9 != 1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 134218498;
      *(_QWORD *)&location[4] = v9;
      v46 = 2112;
      v47 = v6;
      v48 = 2080;
      v49 = "-[PXPlacesSnapshotFactory requestPlacesLibraryAlbumSnapshotWithSnapshotOptions:andCompletion:]";
      _os_log_fault_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "User interface style not expected here: %li\n with options: %@\n function: %s", location, 0x20u);
    }
    os_unfair_lock_lock(&self->_cachedIvarLock);
    v10 = self->_cachedSnapshotImageLight;
    v13 = self->_cachedFilePathLight;
    os_unfair_lock_unlock(&self->_cachedIvarLock);
    if (!v13)
    {
      objc_msgSend(v6, "cacheDirectoryPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("PXPlacesAlbumImageCached.jpg"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock(&self->_cachedIvarLock);
      objc_storeStrong((id *)&self->_cachedFilePathLight, v13);
      os_unfair_lock_unlock(&self->_cachedIvarLock);

    }
  }
  if (!v10)
  {
    os_unfair_lock_lock(&self->_cachedIvarLock);
    v16 = 8;
    if (v9 == 2)
      v16 = 16;
    v17 = *(id *)((char *)&self->super.isa + v16);
    v40 = self->_cachedSnapshotImageIdentifier;
    cachedCount = self->_cachedCount;
    os_unfair_lock_unlock(&self->_cachedIvarLock);
    v39 = v17;
    if (objc_msgSend(v17, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v17);
      url = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      v18 = CGImageSourceCreateWithURL(url, 0);
      v19 = v18;
      if (v18)
      {
        v20 = CGImageSourceCopyPropertiesAtIndex(v18, 0, 0);
        v36 = v20;
        if (v20)
        {
          -[__CFDictionary objectForKey:](v20, "objectForKey:", *MEMORY[0x1E0CBCB50], v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0CBCCB0]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v22 = 0;
        }
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v19, 0, 0);
        CFRelease(v19);
        if (!ImageAtIndex)
        {
          v10 = 0;
          goto LABEL_39;
        }
        objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", ImageAtIndex);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 == 1)
        {
          v32 = 24;
        }
        else
        {
          if (v9 != 2)
          {
            v10 = 0;
            goto LABEL_38;
          }
          v32 = 32;
        }
        os_unfair_lock_lock(&self->_cachedIvarLock);
        objc_storeStrong((id *)((char *)&self->super.isa + v32), v31);
        os_unfair_lock_unlock(&self->_cachedIvarLock);
        v10 = v31;
LABEL_38:
        CGImageRelease(ImageAtIndex);

LABEL_39:
        if (v22)
        {
          os_unfair_lock_lock(&self->_cachedIvarLock);
          objc_storeStrong((id *)&self->_cachedSnapshotImageIdentifier, v22);
          os_unfair_lock_unlock(&self->_cachedIvarLock);
          v33 = v22;

          v40 = v33;
        }

        if (v10 && v40)
        {
          v34 = -[PXPlacesSnapshotFactory _imageExistsWithLocalIdentifier:](self, "_imageExistsWithLocalIdentifier:");
          v35 = !v34;
          if (!v7)
            v35 = 1;
          if ((v35 & 1) == 0)
            v7[2](v7, v10, cachedCount, 0);
          if (v34)
            goto LABEL_27;
        }
        goto LABEL_22;
      }

    }
    v10 = 0;
LABEL_22:
    v23 = objc_msgSend(v6, "shouldSkipPlaceholder", v36);
    if (v7)
      v24 = v23;
    else
      v24 = 1;
    if ((v24 & 1) == 0)
    {
      objc_msgSend(v6, "extendedTraitCollection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPlacesSnapshotFactory _placeHolderImageForExtendedTraitCollection:](self, "_placeHolderImageForExtendedTraitCollection:", v25);
      v26 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v26, cachedCount, 0);

    }
LABEL_27:

    goto LABEL_28;
  }
  if (v7)
  {
    os_unfair_lock_lock(&self->_cachedIvarLock);
    v15 = self->_cachedCount;
    os_unfair_lock_unlock(&self->_cachedIvarLock);
    -[PXPlacesSnapshotFactory setCurrentUserInterfaceStyle:](self, "setCurrentUserInterfaceStyle:", v9);
    v7[2](v7, v10, v15, 0);
  }
LABEL_28:
  objc_initWeak((id *)location, self);
  objc_msgSend(v6, "queue");
  v27 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__PXPlacesSnapshotFactory_requestPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke;
  block[3] = &unk_1E51422C8;
  objc_copyWeak(&v44, (id *)location);
  v42 = v6;
  v43 = v7;
  v28 = v7;
  v29 = v6;
  dispatch_async(v27, block);

  objc_destroyWeak(&v44);
  objc_destroyWeak((id *)location);

}

- (void)_handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions:(id)a3 andCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19[2];
  _QWORD aBlock[5];
  id v21;
  _QWORD block[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  serialQueue = self->_serialQueue;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke;
  block[3] = &unk_1E5140330;
  block[4] = self;
  v24 = &v25;
  v10 = v7;
  v23 = v10;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v26 + 24))
  {
    aBlock[0] = v9;
    aBlock[1] = 3221225472;
    aBlock[2] = __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke_2;
    aBlock[3] = &unk_1E513D268;
    aBlock[4] = self;
    objc_copyWeak(&v21, &location);
    v11 = _Block_copy(aBlock);
    v12 = -[PXPlacesSnapshotFactory currentUserInterfaceStyle](self, "currentUserInterfaceStyle");
    objc_msgSend(v6, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke_4;
    v16[3] = &unk_1E513D290;
    objc_copyWeak(v19, &location);
    v16[4] = self;
    v14 = v6;
    v19[1] = v12;
    v17 = v14;
    v18 = v11;
    v15 = v11;
    dispatch_async(v13, v16);

    objc_destroyWeak(v19);
    objc_destroyWeak(&v21);
  }

  _Block_object_dispose(&v25, 8);
  objc_destroyWeak(&location);

}

- (void)_fetchImageOfAsset:(id)a3 withSnapshotOptions:(id)a4 andCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  PXPlacesSnapshotFactory *v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__PXPlacesSnapshotFactory__fetchImageOfAsset_withSnapshotOptions_andCompletion___block_invoke;
  v14[3] = &unk_1E513D2B8;
  v11 = v9;
  v15 = v11;
  v12 = v8;
  v16 = v12;
  v17 = self;
  objc_copyWeak(&v19, &location);
  v13 = v10;
  v18 = v13;
  -[PXPlacesSnapshotFactory requestPlacesImageOfAsset:withSnapshotOptions:andCompletion:](self, "requestPlacesImageOfAsset:withSnapshotOptions:andCompletion:", v12, v11, v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)requestPlacesImageOfAsset:(id)a3 withSnapshotOptions:(id)a4 andCompletion:(id)a5
{
  id v9;
  id v10;
  id v11;
  double latitude;
  double longitude;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  NSObject *concurrentQueue;
  uint64_t v43;
  id v44;
  NSObject *v45;
  NSObject *v46;
  id v47;
  id v48;
  NSObject *v49;
  NSObject *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  _QWORD *v63;
  _QWORD *v64;
  _BYTE *v65;
  _QWORD *v66;
  id v67[2];
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  NSObject *v72;
  _QWORD *v73;
  _QWORD *v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD block[4];
  id v79;
  id v80;
  NSObject *v81;
  _BYTE *v82;
  _QWORD *v83;
  id location;
  _QWORD v85[5];
  id v86;
  _QWORD v87[4];
  _QWORD v88[5];
  id v89;
  _QWORD v90[3];
  char v91;
  _BYTE buf[24];
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  uint64_t v96;
  CLLocationCoordinate2D v97;

  v96 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesSnapshotFactory.m"), 744, CFSTR("-[PXPlacesSnapshotFactory createMapImageOfGeotaggables:withSnapshotOptions:andCompletion:] snapshotOptions cannot be nil"));

  }
  objc_msgSend(v9, "locationCoordinate");
  latitude = v97.latitude;
  longitude = v97.longitude;
  if (CLLocationCoordinate2DIsValid(v97))
  {
    v14 = (void *)MEMORY[0x1E0D71860];
    objc_msgSend(v9, "coarseLocationProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "gpsHorizontalAccuracy");
    LODWORD(v14) = objc_msgSend(v14, "horizontalAccuracyIsCoarse:");

    objc_msgSend(v10, "extendedTraitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPlacesPopoverImageFactory sharedInstance](PXPlacesPopoverImageFactory, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v14;
    objc_msgSend(v17, "thumbnailImageSizeForImageType:usingTraitCollection:includeScale:", v14, v16, 1);
    v20 = v19;
    v22 = v21;

    +[PXPlacesPopoverImageFactory sharedInstance](PXPlacesPopoverImageFactory, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "backgroundImageSizeForType:usingTraitCollection:", v18, v16);
    v25 = v24;
    v27 = v26;

    MEMORY[0x1A85CBC98](latitude, longitude, 10000.0, 10000.0);
    +[PXPlacesMapView MKMapRectForCoordinateRegion:](PXPlacesMapView, "MKMapRectForCoordinateRegion:");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v36 = objc_alloc_init(MEMORY[0x1E0CC1860]);
    objc_msgSend(v36, "setSize:", v25, v27);
    objc_msgSend(v36, "setMapRect:", v29, v31, v33, v35);
    objc_msgSend(v36, "_setShowsPointLabels:", objc_msgSend(v10, "showsPointLabels"));
    objc_msgSend(v16, "traitCollectionForMapKit");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v36, "setTraitCollection:", v37);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[PXPlacesSnapshotFactory requestPlacesImageOfAsset:withSnapshotOptions:andCompletion:]";
      _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Trait collection is nil for snapshot options: %@\nfunction: %s", buf, 0x16u);
    }
    v90[0] = 0;
    v90[1] = v90;
    v90[2] = 0x2020000000;
    v91 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v93 = __Block_byref_object_copy__245719;
    v94 = __Block_byref_object_dispose__245720;
    v95 = 0;
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x3032000000;
    v88[3] = __Block_byref_object_copy__245719;
    v88[4] = __Block_byref_object_dispose__245720;
    v89 = 0;
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x2020000000;
    v87[3] = 0;
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x3032000000;
    v85[3] = __Block_byref_object_copy__245719;
    v85[4] = __Block_byref_object_dispose__245720;
    v86 = 0;
    objc_initWeak(&location, self);
    v56 = (void *)v18;
    v57 = (void *)v37;
    v58 = v11;
    v38 = v10;
    v39 = v9;
    v40 = objc_alloc_init(MEMORY[0x1E0CB3740]);
    v41 = dispatch_group_create();
    dispatch_group_enter(v41);
    concurrentQueue = self->_concurrentQueue;
    v43 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke;
    block[3] = &unk_1E513D308;
    v54 = v36;
    v79 = v54;
    v44 = v38;
    v80 = v44;
    v82 = buf;
    v83 = v88;
    v45 = v41;
    v81 = v45;
    dispatch_async(concurrentQueue, block);
    dispatch_group_enter(v45);
    v46 = self->_concurrentQueue;
    v68[0] = v43;
    v68[1] = 3221225472;
    v68[2] = __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_3;
    v68[3] = &unk_1E513D358;
    v47 = v44;
    v69 = v47;
    v48 = v39;
    v70 = v48;
    v76 = v20;
    v77 = v22;
    v55 = v40;
    v71 = v55;
    v73 = v90;
    v74 = v85;
    v75 = v87;
    v49 = v45;
    v72 = v49;
    dispatch_async(v46, v68);
    objc_msgSend(v47, "queue");
    v50 = objc_claimAutoreleasedReturnValue();
    v59[0] = v43;
    v59[1] = 3221225472;
    v59[2] = __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_5;
    v59[3] = &unk_1E513D380;
    v63 = v88;
    v62 = v58;
    v64 = v85;
    v65 = buf;
    v66 = v87;
    v51 = v48;
    v67[1] = v56;
    v60 = v51;
    v61 = v16;
    v52 = v16;
    objc_copyWeak(v67, &location);
    v9 = v39;
    v10 = v38;
    v11 = v58;
    dispatch_group_notify(v49, v50, v59);

    objc_destroyWeak(v67);
    objc_destroyWeak(&location);
    _Block_object_dispose(v85, 8);

    _Block_object_dispose(v87, 8);
    _Block_object_dispose(v88, 8);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v90, 8);

  }
}

- (void)_addLocalSearch:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PXPlacesSnapshotFactory__addLocalSearch___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (void)_removeLocalSearch:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PXPlacesSnapshotFactory__removeLocalSearch___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (void)requestBoundingRegionForQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CC1808]);
  objc_msgSend(v8, "setNaturalLanguageQuery:", v6);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC17F0]), "initWithRequest:", v8);
  -[PXPlacesSnapshotFactory _addLocalSearch:](self, "_addLocalSearch:", v9);
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__PXPlacesSnapshotFactory_requestBoundingRegionForQuery_completion___block_invoke;
  v12[3] = &unk_1E513D3A8;
  objc_copyWeak(&v15, &location);
  v10 = v9;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v10, "startWithCompletionHandler:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)requestMapSnapshotForQuery:(id)a3 snapshotOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__PXPlacesSnapshotFactory_requestMapSnapshotForQuery_snapshotOptions_completion___block_invoke;
  v13[3] = &unk_1E513D3F8;
  objc_copyWeak(&v16, &location);
  v11 = v9;
  v14 = v11;
  v12 = v10;
  v15 = v12;
  -[PXPlacesSnapshotFactory requestBoundingRegionForQuery:completion:](self, "requestBoundingRegionForQuery:completion:", v8, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)requestMapSnapshotOfRegion:(id *)a3 snapshotOptions:(id)a4 completion:(id)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  $FF1229205817863B52D17A627F035FCE *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *concurrentQueue;
  id v30;
  $FF1229205817863B52D17A627F035FCE *v31;
  id v32;
  void *v33;
  _QWORD block[4];
  id v35;
  $FF1229205817863B52D17A627F035FCE *v36;
  id v37;
  uint8_t buf[4];
  $FF1229205817863B52D17A627F035FCE *v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v10 = v8;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v42 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesSnapshotFactory.m"), 932, CFSTR("-[PXPlacesSnapshotFactory requestPlacesSnapshotWithSnapshotOptions:visibleRegion:completion:] snapshotOptions cannot be nil"));

  }
  +[PXPlacesMapView MKMapRectForCoordinateRegion:](PXPlacesMapView, "MKMapRectForCoordinateRegion:", v13, v12, v11, v10);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = objc_alloc_init(MEMORY[0x1E0CC1860]);
  -[$FF1229205817863B52D17A627F035FCE viewSize](v16, "viewSize");
  objc_msgSend(v26, "setSize:");
  objc_msgSend(v26, "setMapRect:", v19, v21, v23, v25);
  objc_msgSend(v26, "_setShowsPointLabels:", -[$FF1229205817863B52D17A627F035FCE showsPointLabels](v16, "showsPointLabels"));
  -[$FF1229205817863B52D17A627F035FCE extendedTraitCollection](v16, "extendedTraitCollection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "traitCollectionForMapKit");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v26, "setTraitCollection:", v28);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v39 = v16;
    v40 = 2080;
    v41 = "-[PXPlacesSnapshotFactory requestMapSnapshotOfRegion:snapshotOptions:completion:]";
    _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Trait collection is nil for snapshot options: %@\nfunction: %s", buf, 0x16u);
  }
  concurrentQueue = self->_concurrentQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PXPlacesSnapshotFactory_requestMapSnapshotOfRegion_snapshotOptions_completion___block_invoke;
  block[3] = &unk_1E5145688;
  v35 = v26;
  v36 = v16;
  v37 = v17;
  v30 = v17;
  v31 = v16;
  v32 = v26;
  dispatch_async(concurrentQueue, block);

}

- (int64_t)assetCountWithForcedRefresh:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t cachedCount;

  if (a3 || -[PXPlacesSnapshotFactory countCacheInvalidated](self, "countCacheInvalidated"))
  {
    -[PXPlacesSnapshotFactory photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D71860], "predicateForAssetWithLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInternalPredicate:", v6);

    objc_msgSend(v5, "setInternalSortDescriptors:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CD19C0], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFetchPropertySets:", v7);

    objc_msgSend(v5, "setShouldPrefetchCount:", 1);
    objc_msgSend(v5, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(v5, "setIncludeAssetSourceTypes:", 5);
    -[PXPlacesSnapshotFactory libraryFilterState](self, "libraryFilterState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSharingFilter:", objc_msgSend(v8, "sharingFilter"));

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    cachedCount = objc_msgSend(v9, "count");
    os_unfair_lock_lock(&self->_cachedIvarLock);
    self->_cachedCount = cachedCount;
    os_unfair_lock_unlock(&self->_cachedIvarLock);
    -[PXPlacesSnapshotFactory setAssetCountFetchResult:](self, "setAssetCountFetchResult:", v9);
    -[PXPlacesSnapshotFactory setCountCacheInvalidated:](self, "setCountCacheInvalidated:", 0);

  }
  else
  {
    os_unfair_lock_lock(&self->_cachedIvarLock);
    cachedCount = self->_cachedCount;
    os_unfair_lock_unlock(&self->_cachedIvarLock);
  }
  return cachedCount;
}

- (void)requestAssetCountWithForcedRefresh:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *concurrentQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  concurrentQueue = self->_concurrentQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PXPlacesSnapshotFactory_requestAssetCountWithForcedRefresh_completion___block_invoke;
  block[3] = &unk_1E5146308;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(concurrentQueue, block);

}

- (PHFetchResult)placesAssetsFetchResult
{
  PHFetchResult *placesAssetsFetchResult;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PHFetchResult *v11;
  PHFetchResult *v12;
  _QWORD v14[2];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  placesAssetsFetchResult = self->_placesAssetsFetchResult;
  if (!placesAssetsFetchResult)
  {
    -[PXPlacesSnapshotFactory photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("creationDate"), 0);
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSortDescriptors:", v7);

    objc_msgSend(v5, "setFetchLimit:", 1);
    v8 = *MEMORY[0x1E0CD1958];
    v14[0] = *MEMORY[0x1E0CD19C8];
    v14[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFetchPropertySets:", v9);

    -[PXPlacesSnapshotFactory libraryFilterState](self, "libraryFilterState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSharingFilter:", objc_msgSend(v10, "sharingFilter"));

    objc_msgSend(MEMORY[0x1E0CD1390], "pk_fetchPlacesAssetsInAssetCollection:shouldMergeOptionFetchPropertySets:options:", self->_placesCollection, 1, v5);
    v11 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    v12 = self->_placesAssetsFetchResult;
    self->_placesAssetsFetchResult = v11;

    placesAssetsFetchResult = self->_placesAssetsFetchResult;
  }
  return placesAssetsFetchResult;
}

- (id)_placeHolderImageForExtendedTraitCollection:(id)a3
{
  id v4;
  os_unfair_lock_s *p_cachedIvarLock;
  UIImage **p_cachedPlaceholderImage;
  UIImage *cachedPlaceholderImage;
  UIImage *v8;
  void *v9;

  v4 = a3;
  p_cachedIvarLock = &self->_cachedIvarLock;
  os_unfair_lock_lock(&self->_cachedIvarLock);
  cachedPlaceholderImage = self->_cachedPlaceholderImage;
  p_cachedPlaceholderImage = &self->_cachedPlaceholderImage;
  v8 = cachedPlaceholderImage;
  os_unfair_lock_unlock(p_cachedIvarLock);
  if (!v8)
  {
    +[PXPlacesPopoverImageFactory sharedInstance](PXPlacesPopoverImageFactory, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createAlbumPlaceHolderImageUsingTraitCollection:", v4);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_lock(p_cachedIvarLock);
    objc_storeStrong((id *)p_cachedPlaceholderImage, v8);
    os_unfair_lock_unlock(p_cachedIvarLock);
  }

  return v8;
}

- (id)_representativeAsset
{
  void *v2;
  void *v3;

  -[PXPlacesSnapshotFactory placesAssetsFetchResult](self, "placesAssetsFetchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)removePreviousCachedImages
{
  os_unfair_lock_s *p_cachedIvarLock;
  NSString *v4;
  void *v5;
  void *v6;
  NSString *v7;

  p_cachedIvarLock = &self->_cachedIvarLock;
  os_unfair_lock_lock(&self->_cachedIvarLock);
  v7 = self->_cachedFilePathLight;
  v4 = self->_cachedFilePathDark;
  os_unfair_lock_unlock(p_cachedIvarLock);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtPath:error:", v7, 0);

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeItemAtPath:error:", v4, 0);

  }
}

- (void)_saveImage:(id)a3 ofAsset:(id)a4 atPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a5;
  v8 = a4;
  UIImageJPEGRepresentation((UIImage *)a3, 1.0);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithData:", v16);
  objc_msgSend(v9, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CBCB50];
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CBCB50]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v12);
  objc_msgSend(v14, "setObject:forKey:", v13, *MEMORY[0x1E0CBCCB0]);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v10);
  objc_msgSend(v15, "setObject:forKey:", v14, v11);
  CGImageWriteEXIFJPEGToPath();

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
  -[PXPlacesSnapshotFactory photoLibrary](self, "photoLibrary", v13, v14);
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

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  NSTimer *assetCountChangedTimer;
  BOOL v27;

  v4 = a3;
  -[PXPlacesSnapshotFactory placesAssetsFetchResult](self, "placesAssetsFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXPlacesSnapshotFactory placesAssetsFetchResult](self, "placesAssetsFetchResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "changeDetailsForFetchResult:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PXPlacesSnapshotFactory placesAssetsFetchResult](self, "placesAssetsFetchResult");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fetchResultAfterChanges");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        -[PXPlacesSnapshotFactory placesAssetsFetchResult](self, "placesAssetsFetchResult");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v11;

      -[PXPlacesSnapshotFactory setPlacesAssetsFetchResult:](self, "setPlacesAssetsFetchResult:", v16);
      objc_msgSend(v8, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v17 != v18 || objc_msgSend(v17, "pk_isContentEqualTo:", v17) != 2;
      v27 = v19;
      objc_msgSend(v7, "removedObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertedObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "count"))
        v22 = 1;
      else
        v22 = objc_msgSend(v21, "count") != 0;

      if (v27)
      {
        -[PXPlacesSnapshotFactory delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "placesSnapshotDidChange");

        if (!v22)
          goto LABEL_22;
      }
      else if (!v22)
      {
        goto LABEL_22;
      }
      -[PXPlacesSnapshotFactory assetCountChangedTimer](self, "assetCountChangedTimer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        -[PXPlacesSnapshotFactory assetCountChangedTimer](self, "assetCountChangedTimer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "invalidate");

        assetCountChangedTimer = self->_assetCountChangedTimer;
        self->_assetCountChangedTimer = 0;

      }
      px_dispatch_on_main_queue();
    }
  }
  else
  {
    -[PXPlacesSnapshotFactory snapshottedAsset](self, "snapshottedAsset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[PXPlacesSnapshotFactory snapshottedAsset](self, "snapshottedAsset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "changeDetailsForObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[PXPlacesSnapshotFactory delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "placesSnapshotDidChange");

      }
    }
  }
LABEL_22:

}

- (void)tickAssetCountChangedTimer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "invalidate");

  }
  -[PXPlacesSnapshotFactory setCountCacheInvalidated:](self, "setCountCacheInvalidated:", 1);
  -[PXPlacesSnapshotFactory delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placesSnapshotCountDidChange");

}

- (PXPlacesSnapshotFactoryDelegate)delegate
{
  return (PXPlacesSnapshotFactoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHAssetCollection)placesCollection
{
  return self->_placesCollection;
}

- (void)setPlacesCollection:(id)a3
{
  objc_storeStrong((id *)&self->_placesCollection, a3);
}

- (BOOL)isRegisteredForPhotoLibraryChanges
{
  return self->_isRegisteredForPhotoLibraryChanges;
}

- (void)setIsRegisteredForPhotoLibraryChanges:(BOOL)a3
{
  self->_isRegisteredForPhotoLibraryChanges = a3;
}

- (PHAsset)snapshottedAsset
{
  return self->_snapshottedAsset;
}

- (void)setSnapshottedAsset:(id)a3
{
  objc_storeStrong((id *)&self->_snapshottedAsset, a3);
}

- (void)setPlacesAssetsFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_placesAssetsFetchResult, a3);
}

- (BOOL)countCacheInvalidated
{
  return self->_countCacheInvalidated;
}

- (void)setCountCacheInvalidated:(BOOL)a3
{
  self->_countCacheInvalidated = a3;
}

- (PHFetchResult)assetCountFetchResult
{
  return self->_assetCountFetchResult;
}

- (void)setAssetCountFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_assetCountFetchResult, a3);
}

- (NSTimer)assetCountChangedTimer
{
  return self->_assetCountChangedTimer;
}

- (void)setAssetCountChangedTimer:(id)a3
{
  objc_storeStrong((id *)&self->_assetCountChangedTimer, a3);
}

- (NSMutableArray)localSearches
{
  return self->_localSearches;
}

- (void)setLocalSearches:(id)a3
{
  objc_storeStrong((id *)&self->_localSearches, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (int64_t)countLabelStyle
{
  return self->_countLabelStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_localSearches, 0);
  objc_storeStrong((id *)&self->_assetCountChangedTimer, 0);
  objc_storeStrong((id *)&self->_assetCountFetchResult, 0);
  objc_storeStrong((id *)&self->_placesAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_snapshottedAsset, 0);
  objc_storeStrong((id *)&self->_placesCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_requestedCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_cachedPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotImageIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotImageDark, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotImageLight, 0);
  objc_storeStrong((id *)&self->_cachedFilePathDark, 0);
  objc_storeStrong((id *)&self->_cachedFilePathLight, 0);
}

void __49__PXPlacesSnapshotFactory_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v1, sel_tickAssetCountChangedTimer_, 0, 0, 2.0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAssetCountChangedTimer:", v2);

}

uint64_t __73__PXPlacesSnapshotFactory_requestAssetCountWithForcedRefresh_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "assetCountWithForcedRefresh:", *(unsigned __int8 *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __81__PXPlacesSnapshotFactory_requestMapSnapshotOfRegion_snapshotOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1868]), "initWithOptions:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__PXPlacesSnapshotFactory_requestMapSnapshotOfRegion_snapshotOptions_completion___block_invoke_2;
  v4[3] = &unk_1E513D420;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "startWithQueue:completionHandler:", v3, v4);

}

void __81__PXPlacesSnapshotFactory_requestMapSnapshotOfRegion_snapshotOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v5, v7);

}

void __81__PXPlacesSnapshotFactory_requestMapSnapshotForQuery_snapshotOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;

  if (a2)
  {
    v3 = (id *)(a1 + 48);
    v4 = a2;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(v4, "boundingRegion");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__PXPlacesSnapshotFactory_requestMapSnapshotForQuery_snapshotOptions_completion___block_invoke_2;
    v15[3] = &unk_1E513D3D0;
    v14 = *(_QWORD *)(a1 + 32);
    v16 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "requestMapSnapshotOfRegion:snapshotOptions:completion:", v14, v15, v7, v9, v11, v13);

  }
}

void __81__PXPlacesSnapshotFactory_requestMapSnapshotForQuery_snapshotOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Error returned from requestPlacesSnapshotWithSnapshotOptions:visibleRegion:completion: \"%@\", (uint8_t *)&v8, 0xCu);
    }
    v5 = 0;
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);

}

void __68__PXPlacesSnapshotFactory_requestBoundingRegionForQuery_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void (*v9)(void);
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_removeLocalSearch:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v11 = 136315394;
      v12 = "-[PXPlacesSnapshotFactory requestBoundingRegionForQuery:completion:]_block_invoke";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Error fetching bounding region in: %s error: %@", (uint8_t *)&v11, 0x16u);
    }
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v9 = *(void (**)(void))(v8 + 16);
LABEL_8:
      v9();
    }
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      v9 = *(void (**)(void))(v10 + 16);
      goto LABEL_8;
    }
  }

}

uint64_t __46__PXPlacesSnapshotFactory__removeLocalSearch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __43__PXPlacesSnapshotFactory__addLocalSearch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "addObject:", *(_QWORD *)(a1 + 40));
}

void __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1868]), "initWithOptions:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_2;
  v6[3] = &unk_1E513D2E0;
  v8 = *(_QWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v2, "startWithQueue:completionHandler:", v3, v6);

}

void __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;
  __int128 v9;

  objc_msgSend(*(id *)(a1 + 32), "geotaggableInformationDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_4;
  v6[3] = &unk_1E513D330;
  v3 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 72);
  v5 = *(_OWORD *)(a1 + 56);
  v4 = (id)v5;
  v8 = v5;
  objc_msgSend(v2, "imageForGeotaggable:ofSize:networkAccessAllowed:andCompletion:", v3, 1, v6, *(double *)(a1 + 88), *(double *)(a1 + 96));

}

void __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(void);
  CGImage *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  id WeakRetained;
  uint64_t v20;
  uint64_t v21;
  id v22;
  CGSize v23;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (!v2)
      return;
    v3 = *(void (**)(void))(v2 + 16);
    goto LABEL_5;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)
    && (v4 = *(CGImage **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)) != 0
    && CGImageGetWidth(v4)
    && CGImageGetHeight(*(CGImageRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "size");
    v6 = v5;
    v8 = v7;
    +[PXPlacesPopoverImageFactory sharedInstance](PXPlacesPopoverImageFactory, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createPopoverImageForGeotaggable:withImage:imageType:imageOptions:usingTraitCollection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(_QWORD *)(a1 + 96), 0, *(_QWORD *)(a1 + 40));
    v22 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "size");
    v11 = v6 * 0.5 - v10 * 0.5;
    objc_msgSend(v22, "size");
    v13 = v8 * 0.5 - v12 * 0.5;
    v23.width = v6;
    v23.height = v8;
    UIGraphicsBeginImageContextWithOptions(v23, 0, 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "drawInRect:", 0.0, 0.0, v6, v8);
    objc_msgSend(v22, "size");
    v15 = v14;
    objc_msgSend(v22, "size");
    objc_msgSend(v22, "drawInRect:", v11, v13, v15, v16);
    UIGraphicsGetImageFromCurrentImageContext();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
    v18 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(WeakRetained, "setSnapshottedAsset:", v18);

    v20 = *(_QWORD *)(a1 + 48);
    if (v20)
      (*(void (**)(uint64_t, void *, _QWORD))(v20 + 16))(v20, v17, 0);

  }
  else
  {
    v21 = *(_QWORD *)(a1 + 48);
    if (v21)
    {
      v3 = *(void (**)(void))(v21 + 16);
LABEL_5:
      v3();
    }
  }
}

void __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  id v8;

  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v7 + 24))
  {
    *(_BYTE *)(v7 + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a4);
    if (a3)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a3;
      CFRetain(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "unlock");

}

void __87__PXPlacesSnapshotFactory_requestPlacesImageOfAsset_withSnapshotOptions_andCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "image");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__PXPlacesSnapshotFactory__fetchImageOfAsset_withSnapshotOptions_andCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id WeakRetained;
  id v22;

  v22 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v22)
  {
    objc_msgSend(v7, "extendedTraitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceStyle");

    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 64));
    if (v9 == 1)
    {
      v11 = 8;
      v12 = 24;
    }
    else
    {
      if (v9 != 2)
      {
        v16 = 0;
        goto LABEL_10;
      }
      v11 = 16;
      v12 = 32;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + v12), a2);
    v16 = *(id *)(*(_QWORD *)(a1 + 48) + v11);
LABEL_10:
    v19 = *(_QWORD *)(a1 + 48);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v10;
    v17 = v10;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 64));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_saveImage:ofAsset:atPath:", v22, *(_QWORD *)(a1 + 40), v16);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_11;
  }
  if ((objc_msgSend(v7, "shouldSkipPlaceholder") & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 64));
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(_QWORD *)(v13 + 56);
    os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 64));
    v15 = *(_QWORD *)(a1 + 56);
    v16 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "extendedTraitCollection");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_placeHolderImageForExtendedTraitCollection:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, id))(v15 + 16))(v15, v18, v14, v6);

LABEL_11:
  }

}

void __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(void **)(a1[4] + 72);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = a1[4];
    v5 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = v3;

    v2 = *(void **)(a1[4] + 72);
  }
  if (!objc_msgSend(v2, "count"))
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v6 = (void *)a1[5];
  if (v6)
  {
    v7 = *(void **)(a1[4] + 72);
    v9 = (id)objc_msgSend(v6, "copy");
    v8 = _Block_copy(v9);
    objc_msgSend(v7, "addObject:", v8);

  }
}

void __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  char v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__245719;
  v27 = __Block_byref_object_dispose__245720;
  v28 = 0;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke_3;
  block[3] = &unk_1E5148AA8;
  block[4] = v8;
  block[5] = &v23;
  dispatch_sync(v9, block);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (id)v24[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13) + 16))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13));
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
    }
    while (v11);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v15 = objc_msgSend(WeakRetained, "isRegisteredForPhotoLibraryChanges", (_QWORD)v18);

  if ((v15 & 1) == 0)
  {
    v16 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v16, "photoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerChangeObserver:", *(_QWORD *)(a1 + 32));

  }
  _Block_object_dispose(&v23, 8);

}

void __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  int v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_representativeAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "localIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    v8 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(*(id *)(a1 + 40), "extendedTraitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceStyle");

    if (*(_QWORD *)(a1 + 64) == v10)
    {
      v11 = 0;
      if (!v8)
        goto LABEL_20;
    }
    else if (v10 != 1 || v6)
    {
      v11 = v10 == 2 && v7 == 0;
      if (!v8)
        goto LABEL_20;
    }
    else
    {
      v11 = 1;
      if (!v8)
        goto LABEL_20;
    }
    if ((objc_msgSend(v8, "isEqualToString:", v5) ^ 1 | v11) == 1)
    {
LABEL_20:
      v24 = objc_loadWeakRetained(v2);
      objc_msgSend(v24, "_fetchImageOfAsset:withSnapshotOptions:andCompletion:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend(*(id *)(a1 + 32), "setSnapshottedAsset:", v4);
    objc_msgSend(*(id *)(a1 + 40), "extendedTraitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "userInterfaceStyle");

    if (v26 == 2)
    {
      v27 = v7;
    }
    else
    {
      if (v26 != 1)
      {
        if (!v26 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v28 = 136315138;
          v29 = "-[PXPlacesSnapshotFactory _handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions:andCompletion:]_block_invoke_4";
          _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unspecified user interface style not expected here: %s", (uint8_t *)&v28, 0xCu);
        }
        v24 = 0;
        goto LABEL_30;
      }
      v27 = v6;
    }
    v24 = v27;
LABEL_30:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_31;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = 0;

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 32);
  *(_QWORD *)(v14 + 32) = 0;

  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(v16 + 56);
  os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 64));
  objc_msgSend(*(id *)(a1 + 32), "removePreviousCachedImages");
  objc_msgSend(*(id *)(a1 + 32), "setPlacesAssetsFetchResult:", 0);
  if ((objc_msgSend(*(id *)(a1 + 40), "shouldSkipPlaceholder") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("There are no assets with location in the library"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v19 = *(_QWORD *)(a1 + 48);
    v20 = objc_loadWeakRetained(v2);
    objc_msgSend(*(id *)(a1 + 40), "extendedTraitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_placeHolderImageForExtendedTraitCollection:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, _QWORD))(v19 + 16))(v19, v22, v17, 0);

  }
LABEL_32:

}

uint64_t __99__PXPlacesSnapshotFactory__handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
}

void __94__PXPlacesSnapshotFactory_requestPlacesLibraryAlbumSnapshotWithSnapshotOptions_andCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleAsyncPlacesLibraryAlbumSnapshotWithSnapshotOptions:andCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  PXPlacesMapController *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  id v49;
  id v50;
  NSObject *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  __int128 v57;
  double v58;
  double v59;
  double v60;
  double v61;
  PXPlacesMapController *v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  char v75;
  _QWORD v76[4];
  id v77;
  id v78;
  uint64_t v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  double v91;
  double v92;
  double v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  char v97;
  BOOL v98;
  _QWORD block[4];
  NSObject *v100;
  id v101;
  id v102;
  id v103;
  __int128 v104;
  __int128 v105;
  double v106;
  double v107;
  double v108;
  double v109;
  BOOL v110;
  char v111;
  _BYTE v112[9];
  MKMapRect v113;
  MKCoordinateRegion v114;

  objc_msgSend(*(id *)(a1 + 32), "geotaggableInformationDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPlacesMapPipelineFactory thumbnailPipelineForDataSource:extendedTraitCollection:geotaggableInfo:popoverImageType:popoverImageOptions:countLabelStyle:thumbnailCurationDelegate:](PXPlacesMapPipelineFactory, "thumbnailPipelineForDataSource:extendedTraitCollection:geotaggableInfo:popoverImageType:popoverImageOptions:countLabelStyle:thumbnailCurationDelegate:", v3, *(_QWORD *)(a1 + 48), v2, *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168), *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(PXPlacesMapController);
  v112[0] = 0;
  v7 = objc_msgSend(*(id *)(a1 + 32), "region");
  if (v9 >= -180.0
    && v9 <= 180.0
    && v8 >= -90.0
    && v8 <= 90.0
    && v10 >= 0.0
    && v10 <= 180.0
    && v11 >= 0.0
    && v11 <= 360.0)
  {
    v12 = MEMORY[0x1A85CBCD4](v7);
LABEL_11:
    objc_msgSend(v5, "minimumEdgeInsets", v12);
    v60 = v20 + *(double *)(a1 + 208);
    v61 = v21 + *(double *)(a1 + 216);
    v58 = v22 + *(double *)(a1 + 192);
    v59 = v23 + *(double *)(a1 + 200);
    _MKMapRectThatFits();
    v13 = v24;
    v15 = v25;
    v17 = v26;
    v19 = v27;
    goto LABEL_12;
  }
  -[PXPlacesMapController mapRectForGeotaggablesFromDataSource:renderer:mapViewSize:fitAdjusted:](v6, "mapRectForGeotaggablesFromDataSource:renderer:mapViewSize:fitAdjusted:", v3, v5, v112, *(double *)(a1 + 176), *(double *)(a1 + 184));
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (!v112[0])
    goto LABEL_11;
LABEL_12:
  v62 = v6;
  if (objc_msgSend(*(id *)(a1 + 64), "count", *(_QWORD *)&v58, *(_QWORD *)&v59, *(_QWORD *)&v60, *(_QWORD *)&v61) == 1
    && (objc_msgSend(*(id *)(a1 + 64), "firstObject"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v29 = objc_msgSend(v28, "count"),
        v28,
        v29 == 1))
  {
    objc_msgSend(*(id *)(a1 + 64), "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "fetchPropertySetsIfNeeded");
    objc_msgSend(v31, "location");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32 != 0;

    v34 = (void *)MEMORY[0x1E0D71860];
    objc_msgSend(v31, "coarseLocationProperties");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "gpsHorizontalAccuracy");
    LODWORD(v34) = objc_msgSend(v34, "horizontalAccuracyIsCoarse:");

    if ((_DWORD)v34)
    {
      v113.origin.x = v13;
      v113.origin.y = v15;
      v113.size.width = v17;
      v113.size.height = v19;
      v114 = MKCoordinateRegionForMapRect(v113);
      v13 = MEMORY[0x1A85CBCD4]((__n128)v114.center, *(__n128 *)&v114.center.longitude, v114.span.latitudeDelta * 4.0, v114.span.longitudeDelta * 4.0);
      v15 = v36;
      v17 = v37;
      v19 = v38;
    }

  }
  else
  {
    v33 = 1;
  }
  v39 = dispatch_group_create();
  dispatch_group_enter(v39);
  v40 = *(NSObject **)(a1 + 72);
  v41 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_2;
  block[3] = &unk_1E513D0B0;
  v104 = *(_OWORD *)(a1 + 120);
  v42 = v39;
  v100 = v42;
  v101 = *(id *)(a1 + 32);
  v102 = *(id *)(a1 + 64);
  v105 = *(_OWORD *)(a1 + 176);
  v110 = v33;
  v106 = v13;
  v107 = v15;
  v108 = v17;
  v109 = v19;
  v103 = *(id *)(a1 + 48);
  v111 = *(_BYTE *)(a1 + 256);
  dispatch_async(v40, block);
  dispatch_group_enter(v42);
  v43 = *(NSObject **)(a1 + 72);
  v76[0] = v41;
  v76[1] = 3221225472;
  v76[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_182;
  v76[3] = &unk_1E513D1A0;
  v44 = *(_QWORD *)(a1 + 136);
  v90 = v13;
  v91 = v15;
  v92 = v17;
  v93 = v19;
  v94 = *(_OWORD *)(a1 + 176);
  v88 = v44;
  v77 = v4;
  v45 = *(id *)(a1 + 48);
  v46 = *(_QWORD *)(a1 + 80);
  v78 = v45;
  v79 = v46;
  v80 = *(id *)(a1 + 56);
  v81 = *(id *)(a1 + 88);
  v47 = *(id *)(a1 + 96);
  v89 = *(_QWORD *)(a1 + 144);
  v97 = *(_BYTE *)(a1 + 257);
  v98 = v33;
  v82 = v47;
  v83 = v2;
  v84 = *(id *)(a1 + 104);
  v95 = *(_OWORD *)(a1 + 152);
  v85 = *(id *)(a1 + 64);
  v96 = *(_OWORD *)(a1 + 224);
  v86 = *(id *)(a1 + 32);
  v87 = v42;
  v48 = v42;
  v49 = v2;
  v50 = v4;
  dispatch_async(v43, v76);
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v51 = objc_claimAutoreleasedReturnValue();
  v63[0] = v41;
  v63[1] = 3221225472;
  v63[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_10;
  v63[3] = &unk_1E513D218;
  v67 = *(_QWORD *)(a1 + 128);
  v52 = *(id *)(a1 + 112);
  v53 = *(_QWORD *)(a1 + 136);
  v66 = v52;
  v71 = *(_OWORD *)(a1 + 176);
  v54 = *(_QWORD *)(a1 + 120);
  v68 = v53;
  v69 = v54;
  v55 = *(id *)(a1 + 96);
  v56 = *(_QWORD *)(a1 + 144);
  v64 = v55;
  v70 = v56;
  v72 = *(_OWORD *)(a1 + 240);
  v75 = *(_BYTE *)(a1 + 257);
  v57 = *(_OWORD *)(a1 + 208);
  v73 = *(_OWORD *)(a1 + 192);
  v74 = v57;
  v65 = *(id *)(a1 + 88);
  dispatch_group_notify(v48, v51, v63);

}

uint64_t __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD aBlock[4];
  id v10;
  id v11;
  id v12;
  __int128 v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_3;
  aBlock[3] = &unk_1E513D088;
  v13 = *(_OWORD *)(a1 + 64);
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v2 = _Block_copy(aBlock);
  v3 = objc_alloc_init(MEMORY[0x1E0CC1860]);
  objc_msgSend(v3, "setShowsBuildings:", 1);
  objc_msgSend(v3, "setSize:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  if (*(_BYTE *)(a1 + 128))
    objc_msgSend(v3, "setMapRect:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  objc_msgSend(*(id *)(a1 + 56), "traitCollectionForMapKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setTraitCollection:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v15 = v5;
    v16 = 2080;
    v17 = "-[PXPlacesSnapshotFactory requestMapSnapshotWithAssets:snapshotOptions:popoverImageOptions:completion:]_block_invoke";
    _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Trait collection is nil for snapshot options: %@\nfunction: %s", buf, 0x16u);
  }
  objc_msgSend(v3, "_setShowsPointLabels:", *(unsigned __int8 *)(a1 + 129));
  if (objc_msgSend(*(id *)(a1 + 40), "snapshotMapType"))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "snapshotMapType") == 1)
      v6 = 105;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v3, "setMapType:", v6);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1868]), "initWithOptions:", v3);
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startWithQueue:completionHandler:", v8, v2);

}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_182(uint64_t a1)
{
  PXPlacesMapViewPort *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id obj;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  _QWORD block[5];
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = -[PXPlacesMapViewPort initWithMapRect:andViewSize:zoomLevel:pitch:]([PXPlacesMapViewPort alloc], "initWithMapRect:andViewSize:zoomLevel:pitch:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168), *(double *)(a1 + 176), 0.0, 0.0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "executeWithUpdatedViewPort:andDataSourceChange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "annotationsToAddImmediately");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v45;
    v11 = MEMORY[0x1E0C80D38];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        dispatch_group_enter(v6);
        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_2_184;
        block[3] = &unk_1E513D128;
        block[4] = v13;
        v14 = *(id *)(a1 + 40);
        v15 = *(_QWORD *)(a1 + 48);
        v16 = *(void **)(a1 + 56);
        v37 = v14;
        v38 = v15;
        v39 = v16;
        v40 = *(id *)(a1 + 64);
        v17 = *(id *)(a1 + 72);
        v18 = *(_QWORD *)(a1 + 128);
        v41 = v17;
        v43 = v18;
        v42 = v6;
        dispatch_sync(v11, block);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v9);
  }

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), "count")
    && *(_BYTE *)(a1 + 216)
    && !*(_BYTE *)(a1 + 217)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_group_enter(v6);
    v26[0] = v8;
    v26[1] = 3221225472;
    v26[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_6;
    v26[3] = &unk_1E513D178;
    v27 = *(id *)(a1 + 88);
    v34 = *(_OWORD *)(a1 + 184);
    v28 = *(id *)(a1 + 40);
    v20 = *(id *)(a1 + 72);
    v21 = *(_QWORD *)(a1 + 128);
    v29 = v20;
    v33 = v21;
    v30 = v6;
    v31 = *(id *)(a1 + 96);
    v32 = *(id *)(a1 + 80);
    v35 = *(_OWORD *)(a1 + 200);
    dispatch_sync(MEMORY[0x1E0C80D38], v26);

  }
  objc_msgSend(*(id *)(a1 + 104), "queue");
  v19 = objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_9;
  v24[3] = &unk_1E5149198;
  v25 = *(id *)(a1 + 112);
  dispatch_group_notify(v6, v19, v24);

}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_10(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  int8x16_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    UIGraphicsBeginImageContextWithOptions(*(CGSize *)(a1 + 88), 0, 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "image");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "size");
    v4 = v3;
    objc_msgSend(v2, "size");
    objc_msgSend(v2, "drawInRect:", 0.0, 0.0, v4, v5);
    v6 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_11;
    block[3] = &unk_1E513D1F0;
    v11 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    v12 = *(_OWORD *)(a1 + 104);
    v15 = *(_BYTE *)(a1 + 152);
    v13 = *(_OWORD *)(a1 + 120);
    v14 = *(_OWORD *)(a1 + 136);
    v10 = v2;
    v8 = v2;
    dispatch_sync(v6, block);
    UIGraphicsGetImageFromCurrentImageContext();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_11(uint64_t a1)
{
  void *v1;
  void *v2;
  __int128 v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  char v10;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_12;
  v4[3] = &unk_1E513D1C8;
  v6 = *(_QWORD *)(a1 + 48);
  v10 = *(_BYTE *)(a1 + 104);
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4[1] = 3221225472;
  v3 = *(_OWORD *)(a1 + 72);
  v7 = *(_OWORD *)(a1 + 56);
  v8 = v3;
  v9 = *(_OWORD *)(a1 + 88);
  v5 = v1;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  CLLocationCoordinate2D v19;

  v18 = a2;
  v5 = a3;
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v18, "coordinate");
  if (CLLocationCoordinate2DIsValid(v19))
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v18, "coordinate");
    objc_msgSend(v10, "pointForCoordinate:");
    v12 = v11 + *(double *)(a1 + 48) * -0.5;
    v14 = v13 - v9;
LABEL_5:
    objc_msgSend(v5, "drawInRect:", v12, v14, v7, v9);
    goto LABEL_6;
  }
  if (*(_BYTE *)(a1 + 96))
  {
    v15 = *(double *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 32), "size");
    v12 = v16 * 0.5 - *(double *)(a1 + 48) * 0.5;
    objc_msgSend(*(id *)(a1 + 32), "size");
    v14 = (v17 - v15) * 0.5 - v9 * 0.5;
    goto LABEL_5;
  }
LABEL_6:

}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_2_184(uint64_t a1)
{
  PXPlacesMapThumbnailAnnotationView *v2;
  id v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  __int128 v10;
  id v11;
  id location;

  v2 = -[PXPlacesMapThumbnailAnnotationView initWithAnnotation:reuseIdentifier:extendedTraitCollection:imageCache:countLabelStyle:]([PXPlacesMapThumbnailAnnotationView alloc], "initWithAnnotation:reuseIdentifier:extendedTraitCollection:imageCache:countLabelStyle:", *(_QWORD *)(a1 + 32), &stru_1E5149688, *(_QWORD *)(a1 + 40), 0, objc_msgSend(*(id *)(a1 + 48), "countLabelStyle"));
  -[PXPlacesMapThumbnailAnnotationView setThumbnailCurationDelegate:](v2, "setThumbnailCurationDelegate:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v2);
  objc_initWeak(&location, v2);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_3_188;
  v7[3] = &unk_1E513D100;
  objc_copyWeak(&v11, &location);
  v3 = *(id *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v6 = *(_OWORD *)(a1 + 80);
  v5 = (id)v6;
  v10 = v6;
  -[PXPlacesMapThumbnailAnnotationView setDisplayCompletion:](v2, "setDisplayCompletion:", v7);
  -[PXPlacesMapThumbnailAnnotationView setAnnotation:](v2, "setAnnotation:", *(_QWORD *)(a1 + 32));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_6(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  __int128 v13;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_7;
  aBlock[3] = &unk_1E513D150;
  v8 = *(id *)(a1 + 32);
  v13 = *(_OWORD *)(a1 + 88);
  v9 = *(id *)(a1 + 40);
  v2 = *(id *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 80);
  v10 = v2;
  v12 = v3;
  v11 = *(id *)(a1 + 56);
  v4 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 64), "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 72), "imageForGeotaggable:ofSize:networkAccessAllowed:andCompletion:", v6, 0, v4, *(double *)(a1 + 104), *(double *)(a1 + 112));
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_9(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;

  objc_msgSend(*(id *)(a1 + 32), "createPopoverImageForGeotaggable:withImage:imageType:imageOptions:usingTraitCollection:", a2, a3, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(NSObject **)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_8;
  block[3] = &unk_1E513FD98;
  v10 = v4;
  v8 = *(_OWORD *)(a1 + 56);
  v6 = (id)v8;
  v11 = v8;
  v7 = v4;
  dispatch_async(v5, block);

}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_8(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", *MEMORY[0x1E0C9E500], *(double *)(MEMORY[0x1E0C9E500] + 8));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), v2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_3_188(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  __int128 v9;
  id v10;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_4;
  block[3] = &unk_1E513D100;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = v2;
  v8 = v3;
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "renderToImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_5;
  block[3] = &unk_1E513D0D8;
  v4 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 48);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_5(uint64_t a1)
{
  double v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "coordinate");
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v2, v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __103__PXPlacesSnapshotFactory_requestMapSnapshotWithAssets_snapshotOptions_popoverImageOptions_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  CGSize v22;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if ((!v6 || v7) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "snapshotMapType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "viewSize");
    NSStringFromCGSize(v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v11 = 136316162;
    v12 = "-[PXPlacesSnapshotFactory requestMapSnapshotWithAssets:snapshotOptions:popoverImageOptions:completion:]_block_invoke_3";
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error fetching place tile in: %s error: %@ (type: %@, %@, \nassets: %@)", (uint8_t *)&v11, 0x34u);

  }
}

@end
