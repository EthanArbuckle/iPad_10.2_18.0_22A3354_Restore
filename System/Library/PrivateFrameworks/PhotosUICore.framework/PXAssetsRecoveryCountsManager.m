@implementation PXAssetsRecoveryCountsManager

- (PXAssetsRecoveryCountsManager)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXAssetsRecoveryCountsManager *v6;
  PXAssetsRecoveryCountsManager *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXAssetsRecoveryCountsManager;
  v6 = -[PXAssetsRecoveryCountsManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    objc_msgSend(v5, "px_registerChangeObserver:", v7);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.photos.assetsRecoveryCounts-fetch", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    -[PXAssetsRecoveryCountsManager _startFetchingRecoveredAssets](v7, "_startFetchingRecoveredAssets");
  }

  return v7;
}

- (PXAssetsRecoveryCountsManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsRecoveryCountsManager.m"), 46, CFSTR("%s is not available as initializer"), "-[PXAssetsRecoveryCountsManager init]");

  abort();
}

- (NSString)bannerTitle
{
  void *v2;
  void *v3;

  -[PXAssetsRecoveryCountsManager recoveredAssetsFetchResult](self, "recoveredAssetsFetchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");
  PXLocalizedCountsDescription(CFSTR("PXAssetsRecoveryBannerTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bannerSubtitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  +[PXLocalization currentDeviceCanonicalModel](PXLocalization, "currentDeviceCanonicalModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("PXAssetsRecoveryBannerSubtitle_%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)bannerActionTitle
{
  return (NSString *)PXLocalizedStringFromTable(CFSTR("PXAssetsRecoveryBannerActionTitle"), CFSTR("PhotosUICore"));
}

- (PHAsset)lastRecoveredAsset
{
  void *v2;
  void *v3;

  -[PXAssetsRecoveryCountsManager recoveredAssetsFetchResult](self, "recoveredAssetsFetchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHAsset *)v3;
}

- (int64_t)assetCollectionSubtype
{
  return 1000000219;
}

- (PHAssetCollection)recoveredAssetsSmartAlbum
{
  PHAssetCollection *recoveredAssetsSmartAlbum;
  void *v4;
  void *v5;
  void *v6;
  PHAssetCollection *v7;
  PHAssetCollection *v8;

  recoveredAssetsSmartAlbum = self->_recoveredAssetsSmartAlbum;
  if (!recoveredAssetsSmartAlbum)
  {
    -[PXAssetsRecoveryCountsManager photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, -[PXAssetsRecoveryCountsManager assetCollectionSubtype](self, "assetCollectionSubtype"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (PHAssetCollection *)objc_claimAutoreleasedReturnValue();
    v8 = self->_recoveredAssetsSmartAlbum;
    self->_recoveredAssetsSmartAlbum = v7;

    recoveredAssetsSmartAlbum = self->_recoveredAssetsSmartAlbum;
  }
  return recoveredAssetsSmartAlbum;
}

- (void)setRecoveredAssetsFetchResult:(id)a3
{
  PHFetchResult *v5;
  PHFetchResult **p_recoveredAssetsFetchResult;
  PHFetchResult *v7;
  PHFetchResult *v8;
  char v9;
  uint64_t v10;
  _QWORD v11[5];

  v5 = (PHFetchResult *)a3;
  p_recoveredAssetsFetchResult = &self->_recoveredAssetsFetchResult;
  v7 = self->_recoveredAssetsFetchResult;
  if (v7 == v5)
  {

  }
  else
  {
    v8 = v7;
    v9 = -[PHFetchResult isEqual:](v5, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = -[PHFetchResult count](*p_recoveredAssetsFetchResult, "count");
      objc_storeStrong((id *)&self->_recoveredAssetsFetchResult, a3);
      if (v10 != -[PHFetchResult count](*p_recoveredAssetsFetchResult, "count"))
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __63__PXAssetsRecoveryCountsManager_setRecoveredAssetsFetchResult___block_invoke;
        v11[3] = &unk_1E51479C8;
        v11[4] = self;
        -[PXAssetsRecoveryCountsManager performChanges:](self, "performChanges:", v11);
      }
      -[PXAssetsRecoveryCountsManager _updateShouldShowBanner](self, "_updateShouldShowBanner");
    }
  }

}

- (void)setBannerDismissalDate:(id)a3
{
  NSDate *v5;
  NSDate *v6;
  NSDate *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  PXAssetsRecoveryCountsManager *v14;
  NSDate *v15;

  v5 = (NSDate *)a3;
  v6 = self->_bannerDismissalDate;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[NSDate isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_bannerDismissalDate, a3);
      -[PXAssetsRecoveryCountsManager queue](self, "queue");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v12 = __56__PXAssetsRecoveryCountsManager_setBannerDismissalDate___block_invoke;
      v13 = &unk_1E5148D08;
      v14 = self;
      v15 = v5;
      dispatch_async(v9, &v10);

      -[PXAssetsRecoveryCountsManager _updateShouldShowBanner](self, "_updateShouldShowBanner", v10, v11, v12, v13, v14);
    }
  }

}

- (void)setShouldShowBanner:(BOOL)a3
{
  if (self->_shouldShowBanner != a3)
  {
    self->_shouldShowBanner = a3;
    -[PXAssetsRecoveryCountsManager signalChange:](self, "signalChange:", 1);
  }
}

- (void)markAsRead
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXAssetsRecoveryCountsManager setBannerDismissalDate:](self, "setBannerDismissalDate:", v3);

}

- (void)_startFetchingRecoveredAssets
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];

  -[PXAssetsRecoveryCountsManager photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dateForKey:", CFSTR("AssetsRecoveryBannerDismissalDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetsRecoveryCountsManager setBannerDismissalDate:](self, "setBannerDismissalDate:", v5);

  objc_msgSend(v4, "registerChangeObserver:context:", self, PXPhotoLibraryLocalDefaultsObservationContext);
  -[PXAssetsRecoveryCountsManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PXAssetsRecoveryCountsManager__startFetchingRecoveredAssets__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)_updateShouldShowBanner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  _QWORD v10[5];
  BOOL v11;

  -[PXAssetsRecoveryCountsManager recoveredAssetsFetchResult](self, "recoveredAssetsFetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "curationProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXAssetsRecoveryCountsManager bannerDismissalDate](self, "bannerDismissalDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (v7)
      v9 = objc_msgSend(v7, "compare:", v6) == -1;
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__PXAssetsRecoveryCountsManager__updateShouldShowBanner__block_invoke;
  v10[3] = &unk_1E5142B28;
  v10[4] = self;
  v11 = v9;
  -[PXAssetsRecoveryCountsManager performChanges:](self, "performChanges:", v10);

}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (self->_recoveredAssetsFetchResult)
  {
    objc_msgSend(v10, "changeDetailsForFetchResult:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "fetchResultAfterChanges");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetsRecoveryCountsManager setRecoveredAssetsFetchResult:](self, "setRecoveredAssetsFetchResult:", v9);

    }
  }

}

- (void)photoLibraryLocalDefaults:(id)a3 didChangeValueForKey:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("AssetsRecoveryBannerDismissalDate")))
  {
    v6 = v5;
    px_dispatch_on_main_queue();

  }
}

- (BOOL)shouldShowBanner
{
  return self->_shouldShowBanner;
}

- (NSDate)bannerDismissalDate
{
  return self->_bannerDismissalDate;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PHFetchResult)recoveredAssetsFetchResult
{
  return self->_recoveredAssetsFetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveredAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bannerDismissalDate, 0);
  objc_storeStrong((id *)&self->_recoveredAssetsSmartAlbum, 0);
}

uint64_t __80__PXAssetsRecoveryCountsManager_photoLibraryLocalDefaults_didChangeValueForKey___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 40), "dateForKey:", CFSTR("AssetsRecoveryBannerDismissalDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBannerDismissalDate:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "_updateShouldShowBanner");
}

uint64_t __56__PXAssetsRecoveryCountsManager__updateShouldShowBanner__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldShowBanner:", *(unsigned __int8 *)(a1 + 40));
}

void __62__PXAssetsRecoveryCountsManager__startFetchingRecoveredAssets__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = *MEMORY[0x1E0CD1978];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchPropertySets:", v4);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInternalSortDescriptors:", v6);

  v7 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(*(id *)(a1 + 32), "recoveredAssetsSmartAlbum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchAssetsInAssetCollection:options:", v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PXAssetsRecoveryCountsManager__startFetchingRecoveredAssets__block_invoke_2;
  block[3] = &unk_1E5148D08;
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v10 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __62__PXAssetsRecoveryCountsManager__startFetchingRecoveredAssets__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRecoveredAssetsFetchResult:", *(_QWORD *)(a1 + 40));
}

void __56__PXAssetsRecoveryCountsManager_setBannerDismissalDate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDate:forKey:", *(_QWORD *)(a1 + 40), CFSTR("AssetsRecoveryBannerDismissalDate"));

}

uint64_t __63__PXAssetsRecoveryCountsManager_setRecoveredAssetsFetchResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2);
}

@end
