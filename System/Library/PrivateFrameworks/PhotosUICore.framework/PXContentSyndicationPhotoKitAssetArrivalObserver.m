@implementation PXContentSyndicationPhotoKitAssetArrivalObserver

- (PXContentSyndicationPhotoKitAssetArrivalObserver)initWithExpectedAssetUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  PXContentSyndicationPhotoKitAssetArrivalObserver *v8;
  uint64_t v9;
  NSSet *expectedUUIDs;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXContentSyndicationPhotoKitAssetArrivalObserver;
  v8 = -[PXContentSyndicationPhotoKitAssetArrivalObserver init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    expectedUUIDs = v8->_expectedUUIDs;
    v8->_expectedUUIDs = (NSSet *)v9;

    objc_storeStrong((id *)&v8->_photoLibrary, a4);
  }

  return v8;
}

- (void)dealloc
{
  id completionHandler;
  objc_super v4;

  -[PHPhotoLibrary unregisterChangeObserver:](self->_photoLibrary, "unregisterChangeObserver:", self);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  v4.receiver = self;
  v4.super_class = (Class)PXContentSyndicationPhotoKitAssetArrivalObserver;
  -[PXContentSyndicationPhotoKitAssetArrivalObserver dealloc](&v4, sel_dealloc);
}

- (void)waitForAssetArrivalsWithCompletion:(id)a3
{
  void (**v4)(id, PHFetchResult *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PHFetchResult *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  PHFetchResult *assetsFetchResult;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, PHFetchResult *, _QWORD))a3;
  -[PXContentSyndicationPhotoKitAssetArrivalObserver photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIncludePlaceholderAssets:", 0);
  objc_msgSend(v6, "setIncludeGuestAssets:", 0);
  -[PXContentSyndicationPhotoKitAssetArrivalObserver expectedUUIDs](self, "expectedUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  PLSyndicationUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[PXContentSyndicationPhotoKitAssetArrivalObserver expectedUUIDs](self, "expectedUUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 134218242;
    v24 = v8;
    v25 = 2114;
    v26 = (uint64_t)v10;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "[AssetArrivalObserver] Waiting for the existence of %lu assets in the user library: %{public}@", (uint8_t *)&v23, 0x16u);

  }
  v11 = (void *)MEMORY[0x1E0CD1390];
  -[PXContentSyndicationPhotoKitAssetArrivalObserver expectedUUIDs](self, "expectedUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchAssetsWithLocalIdentifiers:options:", v13, v6);
  v14 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

  v15 = -[PHFetchResult count](v14, "count");
  PLSyndicationUIGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15 == v8)
  {
    if (v17)
    {
      v23 = 134217984;
      v24 = v8;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "[AssetArrivalObserver] Expected number of assets (%lu) already found in library. Returning early.", (uint8_t *)&v23, 0xCu);
    }

    if (v4)
      v4[2](v4, v14, 0);
  }
  else
  {
    if (v17)
    {
      v18 = -[PHFetchResult count](v14, "count");
      v23 = 134218240;
      v24 = v18;
      v25 = 2048;
      v26 = v8;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "[AssetArrivalObserver] %lu out of %lu assets found in library. Waiting for assets to arrive...", (uint8_t *)&v23, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentSyndicationPhotoKitAssetArrivalObserver setWaitStartTimestamp:](self, "setWaitStartTimestamp:", v19);

    v20 = (void *)objc_msgSend(v4, "copy");
    -[PXContentSyndicationPhotoKitAssetArrivalObserver setCompletionHandler:](self, "setCompletionHandler:", v20);

    -[PXContentSyndicationPhotoKitAssetArrivalObserver photoLibrary](self, "photoLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerChangeObserver:", self);

  }
  assetsFetchResult = self->_assetsFetchResult;
  self->_assetsFetchResult = v14;

}

- (void)updateWithFetchResult:(id)a3
{
  id v5;
  NSUInteger v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  int v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_assetsFetchResult, a3);
  v6 = -[PHFetchResult count](self->_assetsFetchResult, "count");
  -[PXContentSyndicationPhotoKitAssetArrivalObserver expectedUUIDs](self, "expectedUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = objc_claimAutoreleasedReturnValue();
    -[PXContentSyndicationPhotoKitAssetArrivalObserver waitStartTimestamp](self, "waitStartTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject timeIntervalSinceDate:](v9, "timeIntervalSinceDate:", v10);
    v12 = v11;

    PLSyndicationUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134218240;
      v18 = v8;
      v19 = 2048;
      v20 = v12;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "[AssetArrivalObserver] Expected number of assets (%lu) have arrived. Completing observation. Took %.3f seconds", (uint8_t *)&v17, 0x16u);
    }

    -[PXContentSyndicationPhotoKitAssetArrivalObserver photoLibrary](self, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unregisterChangeObserver:", self);

    -[PXContentSyndicationPhotoKitAssetArrivalObserver completionHandler](self, "completionHandler");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[PXContentSyndicationPhotoKitAssetArrivalObserver setCompletionHandler:](self, "setCompletionHandler:", 0);
    if (v15)
    {
      -[PXContentSyndicationPhotoKitAssetArrivalObserver assetsFetchResult](self, "assetsFetchResult");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v15)[2](v15, v16, 0);

    }
  }
  else
  {
    PLSyndicationUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134218240;
      v18 = v6;
      v19 = 2048;
      v20 = v8;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "[AssetArrivalObserver] %lu out of %lu assets now in library.", (uint8_t *)&v17, 0x16u);
    }
  }

}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXContentSyndicationPhotoKitAssetArrivalObserver assetsFetchResult](self, "assetsFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForFetchResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    PLSyndicationUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_INFO, "[AssetArrivalObserver] Received updated fetch result.", buf, 2u);
    }

    if (objc_msgSend(v6, "hasIncrementalChanges"))
    {
      objc_msgSend(v6, "insertedObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        v10 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v6, "insertedObjects");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v6, "insertedObjects", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v23;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v23 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "localIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v18);

              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v15);
        }

        PLSyndicationUIGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = objc_msgSend(v12, "count");
          *(_DWORD *)buf = 134218242;
          v27 = v20;
          v28 = 2114;
          v29 = v12;
          _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "[AssetArrivalObserver] %lu assets in updated fetch result %{public}@", buf, 0x16u);
        }

      }
    }
    objc_msgSend(v6, "fetchResultAfterChanges");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentSyndicationPhotoKitAssetArrivalObserver updateWithFetchResult:](self, "updateWithFetchResult:", v21);

  }
}

- (NSSet)expectedUUIDs
{
  return self->_expectedUUIDs;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PHFetchResult)assetsFetchResult
{
  return self->_assetsFetchResult;
}

- (NSDate)waitStartTimestamp
{
  return self->_waitStartTimestamp;
}

- (void)setWaitStartTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_waitStartTimestamp, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_waitStartTimestamp, 0);
  objc_storeStrong((id *)&self->_assetsFetchResult, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_expectedUUIDs, 0);
}

@end
