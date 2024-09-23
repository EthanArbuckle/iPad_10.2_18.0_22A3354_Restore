@implementation PXPeopleAlbumProvider

- (PXPeopleAlbumProvider)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  PXLibraryFilterState *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  PXPeopleDataSourceSection *v10;
  PXPeopleDataSourceSection *v11;
  PXPeopleSectionedDataSource *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PXPeopleProgressManager *v17;
  void *v18;
  dispatch_queue_t v19;
  void *v20;
  dispatch_queue_t v21;
  void *v22;
  dispatch_queue_t v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)PXPeopleAlbumProvider;
  v2 = -[PXPeopleAlbumProvider init](&v28, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v3;

    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", *((_QWORD *)v2 + 5));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v5);
    v7 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v6;

    *(int64x2_t *)(v2 + 104) = vdupq_n_s64(0x4070000000000000uLL);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = -[PXPeopleDataSourceSection initWithPersonFetchType:]([PXPeopleDataSourceSection alloc], "initWithPersonFetchType:", 0);
    v11 = -[PXPeopleDataSourceSection initWithPersonFetchType:]([PXPeopleDataSourceSection alloc], "initWithPersonFetchType:", 1);
    v12 = [PXPeopleSectionedDataSource alloc];
    v29[0] = v10;
    v29[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PXPeopleSectionedDataSource initWithSections:](v12, "initWithSections:", v13);
    v15 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v14;

    PXLocalizedStringForPeoplePetsHomeTitle(objc_msgSend(*((id *)v2 + 5), "px_peoplePetsHomeVisibility"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v2 + 7), "setLocalizedTitle:", v16);

    v17 = -[PXPeopleProgressManager initWithPhotoLibrary:]([PXPeopleProgressManager alloc], "initWithPhotoLibrary:", *((_QWORD *)v2 + 5));
    v18 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v17;

    v19 = dispatch_queue_create("PXPeopleAlbumProviderIsolationQueue", v9);
    v20 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v19;

    v21 = dispatch_queue_create("PXPeopleAlbumProviderCacheIsolationQueue", v9);
    v22 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v21;

    v23 = dispatch_queue_create("PXPeopleAlbumProviderBackgroudQueue", v9);
    v24 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v23;

    *((_QWORD *)v2 + 10) = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v2, sel_imageCacheDidChanged_, CFSTR("PXPeopleFaceCropManagerDidInvalidateCacheNotification"), v26);

    objc_msgSend(v25, "addObserver:selector:name:object:", v2, sel__appWillEnterForeground, *MEMORY[0x1E0DC4860], 0);
  }
  return (PXPeopleAlbumProvider *)v2;
}

- (void)_prepareIfNeeded
{
  void *v3;
  void *v4;

  if (!self->_didPrepareDataSource)
  {
    v3 = (void *)MEMORY[0x1A85CE17C]();
    -[PXPeopleAlbumProvider peopleDataSource](self, "peopleDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addChangeObserver:", self);
    objc_msgSend(v4, "loadAndStartListeningToLibraryNotifications");

    objc_autoreleasePoolPop(v3);
    self->_didPrepareDataSource = 1;
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PXPeopleSectionedDataSource removeChangeObserver:](self->_peopleDataSource, "removeChangeObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleAlbumProvider;
  -[PXPeopleAlbumProvider dealloc](&v4, sel_dealloc);
}

- (void)requestAlbumImagesWithSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *isolationQueue;
  id v14;
  NSObject *cacheIsolationQueue;
  NSObject *backgroundQueue;
  _QWORD v17[5];
  id v18[2];
  id location;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD block[5];
  id v28;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  -[PXPeopleAlbumProvider progressMgr](self, "progressMgr");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "featureUnlocked");

  if (v11)
  {
    v12 = MEMORY[0x1E0C809B0];
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__PXPeopleAlbumProvider_requestAlbumImagesWithSize_displayScale_completion___block_invoke;
    block[3] = &unk_1E5148CE0;
    block[4] = self;
    v14 = v9;
    v28 = v14;
    dispatch_sync(isolationQueue, block);
    -[PXPeopleAlbumProvider setImageSize:](self, "setImageSize:", width, height);
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__228454;
    v25 = __Block_byref_object_dispose__228455;
    v26 = 0;
    cacheIsolationQueue = self->_cacheIsolationQueue;
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __76__PXPeopleAlbumProvider_requestAlbumImagesWithSize_displayScale_completion___block_invoke_148;
    v20[3] = &unk_1E5148AA8;
    v20[4] = self;
    v20[5] = &v21;
    dispatch_sync(cacheIsolationQueue, v20);
    if (objc_msgSend((id)v22[5], "count") || self->_didInitiateReCacheRequest)
    {
      if (!v14)
      {
LABEL_6:
        _Block_object_dispose(&v21, 8);

        goto LABEL_9;
      }
    }
    else
    {
      self->_didInitiateReCacheRequest = 1;
      objc_initWeak(&location, self);
      backgroundQueue = self->_backgroundQueue;
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __76__PXPeopleAlbumProvider_requestAlbumImagesWithSize_displayScale_completion___block_invoke_2;
      v17[3] = &unk_1E513FF48;
      objc_copyWeak(v18, &location);
      v18[1] = *(id *)&a4;
      v17[4] = self;
      dispatch_async(backgroundQueue, v17);
      objc_destroyWeak(v18);
      objc_destroyWeak(&location);
      if (!v14)
        goto LABEL_6;
    }
    (*((void (**)(id, uint64_t))v14 + 2))(v14, v22[5]);
    goto LABEL_6;
  }
  if (v9)
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
LABEL_9:

}

- (id)peopleViewController
{
  void *v3;
  void *v4;
  PXPeopleOnboardingViewController *v5;
  void *v6;
  PXPeopleOnboardingViewController *v7;
  _BOOL4 v8;
  PXPeopleCollectionViewController *v9;

  -[PXPeopleAlbumProvider libraryFilterState](self, "libraryFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "viewMode"))
  {
    -[PXPeopleAlbumProvider progressMgr](self, "progressMgr");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProcessingStatus:", 0);
    v5 = [PXPeopleOnboardingViewController alloc];
    -[PXPeopleAlbumProvider peopleDataSource](self, "peopleDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
  }
  else
  {
    -[PXPeopleAlbumProvider _prepareIfNeeded](self, "_prepareIfNeeded");
    v8 = -[PXPeopleAlbumProvider _shouldShowInterstitialProgress](self, "_shouldShowInterstitialProgress");
    -[PXPeopleAlbumProvider progressMgr](self, "progressMgr");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleAlbumProvider peopleDataSource](self, "peopleDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v9 = -[PXPeopleCollectionViewController initWithDataSource:progressManager:libraryFilterState:]([PXPeopleCollectionViewController alloc], "initWithDataSource:progressManager:libraryFilterState:", v6, v4, v3);
      -[PXPeopleCollectionViewController setProgressFooterAvailable:](v9, "setProgressFooterAvailable:", 1);
      goto LABEL_7;
    }
    v7 = [PXPeopleOnboardingViewController alloc];
  }
  v9 = -[PXPeopleOnboardingViewController initWithDataSource:progressManager:libraryFilterState:](v7, "initWithDataSource:progressManager:libraryFilterState:", v6, v4, v3);
LABEL_7:

  return v9;
}

- (BOOL)isCountAvailable
{
  return self->_cachedPeopleCount != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_updateCachedCountIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  if (self->_cachedPeopleCount == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShouldPrefetchCount:", 1);
    objc_msgSend(v5, "setPersonContext:", 1);
    objc_msgSend(v5, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIncludedDetectionTypes:", v3);

    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleAlbumProvider setCachedPeopleCount:](self, "setCachedPeopleCount:", objc_msgSend(v4, "count"));

  }
}

- (int64_t)peopleCount
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;

  -[PXPeopleAlbumProvider libraryFilterState](self, "libraryFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "viewMode");

  if (v4)
    return 0;
  -[PXPeopleAlbumProvider progressMgr](self, "progressMgr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "featureUnlocked");

  if (!v6)
    return 0;
  -[PXPeopleAlbumProvider _updateCachedCountIfNeeded](self, "_updateCachedCountIfNeeded");
  if (self->_cachedPeopleCount == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return self->_cachedPeopleCount;
}

- (id)_visiblePersons
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  -[PXPeopleAlbumProvider peopleDataSource](self, "peopleDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allPersons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  if (v4 >= 4)
    v5 = 4;
  else
    v5 = v4;
  objc_msgSend(v3, "subarrayWithRange:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_reCacheImagesWithDisplayScale:(double)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PXPeopleAlbumProvider _visiblePersons](self, "_visiblePersons");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleAlbumProvider _asyncAddImagesToCacheWithPersons:displayScale:completion:](self, "_asyncAddImagesToCacheWithPersons:displayScale:completion:", v7, v6, a3);

}

- (void)_asyncAddImagesToCacheWithPersons:(id)a3 displayScale:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *cacheIsolationQueue;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24[4];
  int v25;
  id location;
  _QWORD block[5];
  id v28;

  v8 = a3;
  v9 = a5;
  -[PXPeopleAlbumProvider imageSize](self, "imageSize");
  v11 = v10;
  v13 = v12;
  do
    v14 = __ldaxr((unsigned int *)&uniqueRequestID);
  while (__stlxr(v14 + 1, (unsigned int *)&uniqueRequestID));
  -[PXPeopleAlbumProvider setCurrentRequestId:](self, "setCurrentRequestId:", v14);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v16 = MEMORY[0x1E0C809B0];
  cacheIsolationQueue = self->_cacheIsolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PXPeopleAlbumProvider__asyncAddImagesToCacheWithPersons_displayScale_completion___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v18 = v15;
  v28 = v18;
  dispatch_sync(cacheIsolationQueue, block);
  objc_initWeak(&location, self);
  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __83__PXPeopleAlbumProvider__asyncAddImagesToCacheWithPersons_displayScale_completion___block_invoke_2;
  v21[3] = &unk_1E5139A80;
  v24[1] = v11;
  v24[2] = v13;
  v24[3] = *(id *)&a4;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v22 = v19;
  objc_copyWeak(v24, &location);
  v25 = v14;
  v20 = v9;
  v23 = v20;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v21);

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

}

- (void)_handleRequestResult:(id)a3 forRequestID:(int)a4 person:(id)a5 atIndex:(int64_t)a6 error:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  NSObject *cacheIsolationQueue;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t *v24;
  int64_t v25;
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = (void (**)(_QWORD))a8;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__228454;
  v31 = __Block_byref_object_dispose__228455;
  v32 = 0;
  cacheIsolationQueue = self->_cacheIsolationQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __91__PXPeopleAlbumProvider__handleRequestResult_forRequestID_person_atIndex_error_completion___block_invoke;
  v21[3] = &unk_1E5139AA8;
  v26 = a4;
  v21[4] = self;
  v19 = v14;
  v22 = v19;
  v20 = v16;
  v24 = &v27;
  v25 = a6;
  v23 = v20;
  dispatch_sync(cacheIsolationQueue, v21);
  if (v17 && v28[5])
    v17[2](v17);

  _Block_object_dispose(&v27, 8);
}

- (BOOL)_shouldShowInterstitialProgress
{
  void *v2;
  char v3;

  -[PXPeopleAlbumProvider progressMgr](self, "progressMgr");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMonitoringProgress:", 0);
  v3 = objc_msgSend(v2, "shouldUseInterstitial");

  return v3;
}

- (void)peopleSectionedDataSourceMembersChangedNonIncrementally:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PXPeopleAlbumProvider_peopleSectionedDataSourceMembersChangedNonIncrementally___block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)peopleSectionedDataSource:(id)a3 didApplyIncrementalChanges:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  _QWORD block[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "hasIncrementalChanges"))
        {
          -[PXPeopleAlbumProvider _invalidateCache](self, "_invalidateCache");
          -[PXPeopleAlbumProvider peopleDataSource](self, "peopleDataSource");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "totalPersonCount");

          -[PXPeopleAlbumProvider setCachedPeopleCount:](self, "setCachedPeopleCount:", v11);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __78__PXPeopleAlbumProvider_peopleSectionedDataSource_didApplyIncrementalChanges___block_invoke;
          block[3] = &unk_1E5149198;
          block[4] = self;
          dispatch_async(MEMORY[0x1E0C80D38], block);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)imageCacheDidChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  id v13;
  id location;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("PXPeopleFaceCropManagerInvalidatedPersonLocalIdentifiersKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleAlbumProvider _visiblePersons](self, "_visiblePersons");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "localIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v6, "containsObject:", v11);

        if ((v12 & 1) != 0)
        {

          objc_initWeak(&location, self);
          objc_copyWeak(&v13, &location);
          px_dispatch_on_main_queue();
          objc_destroyWeak(&v13);
          objc_destroyWeak(&location);
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }

LABEL_12:
}

- (void)_invalidateCache
{
  NSObject *cacheIsolationQueue;
  _QWORD block[5];

  cacheIsolationQueue = self->_cacheIsolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PXPeopleAlbumProvider__invalidateCache__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_sync(cacheIsolationQueue, block);
}

- (void)_appWillEnterForeground
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id location;

  if (!self->_didPrepareDataSource)
  {
    objc_initWeak(&location, self);
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PXPeopleAlbumProvider__appWillEnterForeground__block_invoke;
    block[3] = &unk_1E5147280;
    objc_copyWeak(&v5, &location);
    block[4] = self;
    dispatch_async(v3, block);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (PXPeopleSectionedDataSource)peopleDataSource
{
  return self->_peopleDataSource;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (PXPeopleProgressManager)progressMgr
{
  return self->_progressMgr;
}

- (void)setProgressMgr:(id)a3
{
  objc_storeStrong((id *)&self->_progressMgr, a3);
}

- (id)requestCompletion
{
  return self->_requestCompletion;
}

- (void)setRequestCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)cachedPeopleCount
{
  return self->_cachedPeopleCount;
}

- (void)setCachedPeopleCount:(int64_t)a3
{
  self->_cachedPeopleCount = a3;
}

- (int)currentRequestId
{
  return self->_currentRequestId;
}

- (void)setCurrentRequestId:(int)a3
{
  self->_currentRequestId = a3;
}

- (NSMutableDictionary)imageCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setImageCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong(&self->_requestCompletion, 0);
  objc_storeStrong((id *)&self->_progressMgr, 0);
  objc_storeStrong((id *)&self->_peopleDataSource, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_cacheIsolationQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

void __48__PXPeopleAlbumProvider__appWillEnterForeground__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "progressMgr");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "featureUnlocked");

  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PXPeopleAlbumProvider__appWillEnterForeground__block_invoke_2;
    block[3] = &unk_1E5149198;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __48__PXPeopleAlbumProvider__appWillEnterForeground__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PXPeopleAlbumDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __41__PXPeopleAlbumProvider__invalidateCache__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setCurrentRequestId:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setImageCache:", 0);
}

void __46__PXPeopleAlbumProvider_imageCacheDidChanged___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateCache");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PXPeopleAlbumDidChangeNotification"), v3);

}

void __78__PXPeopleAlbumProvider_peopleSectionedDataSource_didApplyIncrementalChanges___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PXPeopleAlbumDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __81__PXPeopleAlbumProvider_peopleSectionedDataSourceMembersChangedNonIncrementally___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_invalidateCache");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PXPeopleAlbumDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __91__PXPeopleAlbumProvider__handleRequestResult_forRequestID_person_atIndex_error_completion___block_invoke(uint64_t a1)
{
  unsigned int v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = atomic_load((unsigned int *)(a1 + 72));
  v3 = objc_msgSend(*(id *)(a1 + 32), "currentRequestId");
  objc_msgSend(*(id *)(a1 + 32), "imageCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == v3)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      if (!*(_QWORD *)(a1 + 48) && v4)
      {
        v10 = v4;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v5, v6);

        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v10);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

        v4 = v10;
      }
    }
  }

}

uint64_t __83__PXPeopleAlbumProvider__asyncAddImagesToCacheWithPersons_displayScale_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImageCache:", *(_QWORD *)(a1 + 40));
}

void __83__PXPeopleAlbumProvider__asyncAddImagesToCacheWithPersons_displayScale_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PXPeopleFaceCropFetchOptions *v6;
  void *v7;
  unsigned int v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13[2];
  unsigned int v14;

  v5 = a2;
  v6 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v5, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  -[PXPeopleFaceCropFetchOptions setDeliveryMode:](v6, "setDeliveryMode:", 1);
  v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__PXPeopleAlbumProvider__asyncAddImagesToCacheWithPersons_displayScale_completion___block_invoke_3;
  v10[3] = &unk_1E5139A58;
  objc_copyWeak(v13, (id *)(a1 + 48));
  v8 = atomic_load((unsigned int *)(a1 + 80));
  v14 = v8;
  v9 = v5;
  v11 = v9;
  v13[1] = a3;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v7, "requestFaceCropForOptions:resultHandler:", v6, v10);

  objc_destroyWeak(v13);
}

void __83__PXPeopleAlbumProvider__asyncAddImagesToCacheWithPersons_displayScale_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;

  v5 = (id *)(a1 + 48);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = atomic_load((unsigned int *)(a1 + 64));
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_handleRequestResult:forRequestID:person:atIndex:error:completion:", v7, v8, v9, v10, v11, *(_QWORD *)(a1 + 40));
}

uint64_t __76__PXPeopleAlbumProvider_requestAlbumImagesWithSize_displayScale_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRequestCompletion:", *(_QWORD *)(a1 + 40));
}

void __76__PXPeopleAlbumProvider_requestAlbumImagesWithSize_displayScale_completion___block_invoke_148(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(*(id *)(a1 + 32), "imageCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __76__PXPeopleAlbumProvider_requestAlbumImagesWithSize_displayScale_completion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  double v4;
  _QWORD v5[5];
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_prepareIfNeeded");
  v4 = *(double *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__PXPeopleAlbumProvider_requestAlbumImagesWithSize_displayScale_completion___block_invoke_3;
  v5[3] = &unk_1E5139A30;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v6, v2);
  objc_msgSend(WeakRetained, "_reCacheImagesWithDisplayScale:completion:", v5, v4);
  objc_destroyWeak(&v6);

}

void __76__PXPeopleAlbumProvider_requestAlbumImagesWithSize_displayScale_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *(*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__150;
  v12 = __Block_byref_object_dispose__151;
  v13 = 0;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__PXPeopleAlbumProvider_requestAlbumImagesWithSize_displayScale_completion___block_invoke_152;
  v6[3] = &unk_1E5139A08;
  v6[4] = &v8;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_sync(v4, v6);
  v5 = v9[5];
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);

}

void __76__PXPeopleAlbumProvider_requestAlbumImagesWithSize_displayScale_completion___block_invoke_152(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "requestCompletion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_228485 != -1)
    dispatch_once(&sharedInstance_onceToken_228485, &__block_literal_global_228486);
  return (id)sharedInstance_sharedInstance_228487;
}

void __39__PXPeopleAlbumProvider_sharedInstance__block_invoke()
{
  PXPeopleAlbumProvider *v0;
  void *v1;

  v0 = objc_alloc_init(PXPeopleAlbumProvider);
  v1 = (void *)sharedInstance_sharedInstance_228487;
  sharedInstance_sharedInstance_228487 = (uint64_t)v0;

}

@end
