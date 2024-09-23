@implementation PUCarouselSharingViewController

- (PUCarouselSharingViewController)initWithPhotoCollectionsFetchResult:(id)a3 assetsFetchResultsByAssetCollection:(id)a4 selection:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PUCarouselSharingViewController *v14;
  PUPhotosSharingViewControllerSpec *v15;
  PUPhotosSharingViewControllerSpec *spec;
  void *v17;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *assetItemsByAssetIdentifier;
  uint64_t v21;
  NSMapTable *indexPathsByOptionView;
  uint64_t v23;
  PHCachingImageManager *cachingImageManager;
  PXAssetBadgeManager *v25;
  PXAssetBadgeManager *badgeManager;
  NSMutableArray *v27;
  NSMutableArray *photoViewLoaderBlocks;
  NSMutableArray *v29;
  NSMutableArray *livePhotoViewLoaderBlocks;
  void *v31;
  void *v33;
  void *v34;
  objc_super v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoCollectionsFetchResult"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selection"));

LABEL_3:
  v35.receiver = self;
  v35.super_class = (Class)PUCarouselSharingViewController;
  v14 = -[PUCarouselSharingViewController init](&v35, sel_init);
  if (v14)
  {
    v15 = objc_alloc_init(PUPhotosSharingViewControllerSpec);
    spec = v14->_spec;
    v14->_spec = v15;

    objc_storeStrong((id *)&v14->_photoCollectionsFetchResult, a3);
    objc_storeStrong((id *)&v14->_photoSelectionManager, a5);
    if (v11)
    {
      v17 = (void *)objc_msgSend(v11, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    objc_storeStrong((id *)&v14->_resultsForAssetCollection, v17);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    assetItemsByAssetIdentifier = v14->_assetItemsByAssetIdentifier;
    v14->_assetItemsByAssetIdentifier = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v21 = objc_claimAutoreleasedReturnValue();
    indexPathsByOptionView = v14->_indexPathsByOptionView;
    v14->_indexPathsByOptionView = (NSMapTable *)v21;

    v14->_shouldScrollToSelection = 1;
    v23 = objc_opt_new();
    cachingImageManager = v14->_cachingImageManager;
    v14->_cachingImageManager = (PHCachingImageManager *)v23;

    v14->_shouldPlayVitalityHintAfterViewDidAppear = 0;
    -[PUCarouselSharingViewController setExtendedLayoutIncludesOpaqueBars:](v14, "setExtendedLayoutIncludesOpaqueBars:", 1);
    v25 = (PXAssetBadgeManager *)objc_alloc_init(MEMORY[0x1E0D7B1D8]);
    badgeManager = v14->__badgeManager;
    v14->__badgeManager = v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    photoViewLoaderBlocks = v14->__photoViewLoaderBlocks;
    v14->__photoViewLoaderBlocks = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    livePhotoViewLoaderBlocks = v14->__livePhotoViewLoaderBlocks;
    v14->__livePhotoViewLoaderBlocks = v29;

    v14->_readyForInteraction = 1;
    objc_msgSend(v10, "photoLibrary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "px_registerChangeObserver:", v14);

  }
  return v14;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[PHFetchResult photoLibrary](self->_photoCollectionsFetchResult, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_unregisterChangeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)PUCarouselSharingViewController;
  -[PUCarouselSharingViewController dealloc](&v5, sel_dealloc);
}

- (NSMutableSet)analyticsEventsSent
{
  NSMutableSet *analyticsEventsSent;
  NSMutableSet *v4;
  NSMutableSet *v5;

  analyticsEventsSent = self->_analyticsEventsSent;
  if (!analyticsEventsSent)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->_analyticsEventsSent;
    self->_analyticsEventsSent = v4;

    analyticsEventsSent = self->_analyticsEventsSent;
  }
  return analyticsEventsSent;
}

- (void)_setLastKnownReferenceIndexPath:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath **p_lastKnownReferenceIndexPath;
  char v7;
  NSIndexPath *v8;

  v5 = (NSIndexPath *)a3;
  p_lastKnownReferenceIndexPath = &self->__lastKnownReferenceIndexPath;
  if (*p_lastKnownReferenceIndexPath != v5)
  {
    v8 = v5;
    v7 = -[NSIndexPath isEqual:](*p_lastKnownReferenceIndexPath, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)p_lastKnownReferenceIndexPath, a3);
      v5 = v8;
    }
  }

}

- (BOOL)_shouldShowAsset:(id)a3
{
  return objc_msgSend(a3, "canPerformSharingAction");
}

- (void)_updateInterfaceForModelReloadAnimated:(BOOL)a3
{
  void *v4;

  -[PUCarouselSharingViewController _resetPreheating](self, "_resetPreheating", a3);
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[PUCarouselSharingViewController _setViewInSyncWithModel:](self, "_setViewInSyncWithModel:", 1);
}

- (void)_getFirstValidIndexPath:(id *)a3 lastValidIndexPath:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  id v13;

  v7 = -[PUCarouselSharingViewController _numberOfSections](self, "_numberOfSections");
  v8 = v7 - 1;
  if (v7 < 1)
  {
    v13 = 0;
    v10 = 0;
    if (a3)
LABEL_13:
      *a3 = objc_retainAutorelease(v13);
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v13 = 0;
    do
    {
      if (v13 && v10)
        break;
      v11 = -[PUCarouselSharingViewController _numberOfItemsInSection:](self, "_numberOfItemsInSection:", v9);
      if (!v13 && v11)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = -[PUCarouselSharingViewController _numberOfItemsInSection:](self, "_numberOfItemsInSection:", v8);
      if (v12 && !v10)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v12 - 1, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      ++v9;
      --v8;
    }
    while (v8 != -1);
    if (a3)
      goto LABEL_13;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v10);

}

- (CGSize)_sizeForItemAtIndexPath:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  BOOL v31;
  int v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  int v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v46;
  double v47;
  double v48;
  CGSize result;
  CGRect v50;

  -[PUCarouselSharingViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUCarouselSharingViewController _shouldShowAsset:](self, "_shouldShowAsset:", v4))
  {
    -[PUCarouselSharingViewController _collectionViewContentFrame](self, "_collectionViewContentFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = objc_msgSend(v4, "pixelWidth");
    v14 = objc_msgSend(v4, "pixelHeight");
    -[PUCarouselSharingViewController spec](self, "spec");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "interItemSpacingForWidth:", v10);
    v17 = v16;

    -[PUCarouselSharingViewController px_safeAreaInsets](self, "px_safeAreaInsets");
    v19 = v8 + v18;
    v22 = v10 - (v20 + v21);
    v50.size.height = v12 - (v18 + v23);
    v50.origin.x = v6 + v20;
    v50.origin.y = v19;
    v50.size.width = v22;
    v24 = CGRectGetWidth(v50) + v17 * -4.0;
    -[PUCarouselSharingViewController spec](self, "spec");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "selectionBadgeSize");
    v27 = v26;
    -[PUCarouselSharingViewController spec](self, "spec");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "selectionBadgeOffset");
    v30 = v27 + v29 * 2.0;

    if (v13)
      v31 = v14 == 0;
    else
      v31 = 1;
    v32 = v31;
    if (v24 >= v12)
      v33 = v12;
    else
      v33 = v24;
    if (v32)
      v34 = v33;
    else
      v34 = (double)v14;
    if (v32)
      v35 = v33;
    else
      v35 = (double)v13;
    -[PUCarouselSharingViewController spec](self, "spec");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCarouselSharingViewController _existingView](self, "_existingView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bounds");
    v38 = objc_msgSend(v36, "maximizeImageHeightForBounds:");

    if (v38)
    {
      v39 = v12 * v35 / v34;
      if (v39 < v30)
        v39 = v30;
      if (v24 < v39)
        v39 = v24;
    }
    else
    {
      PURectWithSizeThatFitsInRect(v35, v34, 0.0, 0.0, v24, v12);
      if (v43 < v30 && v34 < v35)
      {
        v42 = v42 * (v30 / v43);
        v43 = v30;
      }
      if (v42 < v30 && v35 < v34)
      {
        v43 = v43 * (v30 / v42);
        v42 = v30;
      }
      if (v42 >= v30)
        v39 = v42;
      else
        v39 = v30;
      if (v24 < v39)
        v39 = v24;
      if (v43 >= v30)
        v46 = v43;
      else
        v46 = v30;
      if (v12 >= v46)
        v12 = v46;
    }
    v41 = round(v39);
    v40 = round(v12);
  }
  else
  {
    v41 = *MEMORY[0x1E0C9D820];
    v40 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v47 = v41;
  v48 = v40;
  result.height = v48;
  result.width = v47;
  return result;
}

- (double)_horizontalOffsetInCollectionView:(id)a3 forCenteringOnItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = a3;
  objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  v8 = v7;
  objc_msgSend(v5, "bounds");
  v10 = v9;

  return round(v8 + v10 * -0.5);
}

- (void)_updatePhotoForAsset:(id)a3 cell:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  id v19;
  int v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24[2];
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)(objc_msgSend(v9, "tag") + 1);
  objc_msgSend(v9, "setTag:", v11);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v9, "frame");
  v14 = PUPixelSizeFromPointSize(v13);
  v16 = v15;
  objc_initWeak(&location, self);
  -[PUCarouselSharingViewController cachingImageManager](self, "cachingImageManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__PUCarouselSharingViewController__updatePhotoForAsset_cell_atIndexPath___block_invoke;
  v21[3] = &unk_1E58A6A48;
  v18 = v9;
  v22 = v18;
  v24[1] = v11;
  objc_copyWeak(v24, &location);
  v19 = v10;
  v23 = v19;
  v20 = objc_msgSend(v17, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v8, 0, v12, v21, v14, v16);

  objc_msgSend(v18, "setCurrentImageRequestID:", v20);
  objc_destroyWeak(v24);

  objc_destroyWeak(&location);
}

- (void)_handleStillImageRequestResult:(id)a3 info:(id)a4 forCell:(id)a5 indexPath:(id)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
  {
    objc_msgSend(v10, "photoView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentHelper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "placeHolderImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      -[PUCarouselSharingViewController currentIndexPath](self, "currentIndexPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqual:", v11);

      if (v18)
      {
        -[PUCarouselSharingViewController assetTransitionInfo](self, "assetTransitionInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "image");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          objc_msgSend(v15, "setPlaceHolderImage:", v20);
        else
          objc_msgSend(v15, "setPhotoImage:", v21);

      }
      else
      {
        objc_msgSend(v15, "setPhotoImage:", v21);
      }
    }

  }
  else
  {
    -[PUCarouselSharingViewController _handleSchedulingStillPhotoRequestResult:forCell:tag:](self, "_handleSchedulingStillPhotoRequestResult:forCell:tag:", v21, v10, objc_msgSend(v10, "tag"));
  }

}

- (void)_updateAdditionalContentForAsset:(id)a3 cell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  _BOOL4 v10;
  int v11;
  int v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _QWORD v33[4];
  id v34;
  id v35[2];
  _QWORD v36[4];
  id v37;
  id v38;
  id v39[2];
  _QWORD v40[4];
  id v41;
  id v42;
  id v43[2];
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v7, "tag");
  if (objc_msgSend(v6, "playbackStyle") != 5)
  {
    v10 = objc_msgSend(v6, "playbackStyle") == 2;
LABEL_5:
    if (objc_msgSend(v6, "playbackStyle") == 3)
    {
      v11 = objc_msgSend(v6, "canPlayPhotoIris");
      v12 = 0;
    }
    else
    {
      v12 = 0;
      v11 = 0;
    }
    goto LABEL_8;
  }
  v9 = -[PUCarouselSharingViewController _isLoopingPlaybackAllowed](self, "_isLoopingPlaybackAllowed");
  v10 = objc_msgSend(v6, "playbackStyle") == 2;
  if (!v9)
    goto LABEL_5;
  v11 = 0;
  v12 = 1;
LABEL_8:
  v13 = -[PUCarouselSharingViewController _isLoopingPlaybackAllowed](self, "_isLoopingPlaybackAllowed");
  objc_msgSend(v7, "photoView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLoopingPlaybackAllowed:", v13);

  if (v12)
  {
    -[PUCarouselSharingViewController cachingImageManager](self, "cachingImageManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0CD1808]);
    objc_msgSend(v17, "setNetworkAccessAllowed:", 1);
    objc_msgSend(v17, "setVideoComplementAllowed:", 1);
    objc_initWeak(location, self);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke;
    v40[3] = &unk_1E58A6A70;
    objc_copyWeak(v43, location);
    v41 = v7;
    v42 = v6;
    v43[1] = v8;
    objc_msgSend(v16, "requestAVAssetForVideo:options:resultHandler:", v42, v17, v40);

    objc_destroyWeak(v43);
    objc_destroyWeak(location);

  }
  else
  {
    objc_msgSend(v7, "photoView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentHelper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setLoopingVideoAsset:", 0);
  }
  objc_msgSend(v7, "photoView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentHelper");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (-[PUCarouselSharingViewController _isLoopingPlaybackAllowed](self, "_isLoopingPlaybackAllowed"))
    {
      objc_msgSend(v21, "animatedImage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        -[PUCarouselSharingViewController cachingImageManager](self, "cachingImageManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
        objc_msgSend(v24, "setVersion:", 2);
        objc_msgSend(v24, "setNetworkAccessAllowed:", 0);
        objc_initWeak(location, self);
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke_3;
        v36[3] = &unk_1E58A6A98;
        objc_copyWeak(v39, location);
        v37 = v7;
        v38 = v6;
        v39[1] = v8;
        objc_msgSend(v23, "requestAnimatedImageForAsset:options:resultHandler:", v38, v24, v36);

        objc_destroyWeak(v39);
        objc_destroyWeak(location);

      }
    }
  }
  else
  {
    objc_msgSend(v21, "setAnimatedImage:", 0);
  }

  objc_msgSend(v7, "photoView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "contentHelper");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (!v11)
  {
    objc_msgSend(v26, "setShowsLivePhoto:", 0);
    goto LABEL_22;
  }
  objc_msgSend(v26, "livePhoto");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    -[PUCarouselSharingViewController cachingImageManager](self, "cachingImageManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v31 = PUPixelSizeFromPointSize(v29);
    v32 = v30;
    if (v31 == *MEMORY[0x1E0C9D820] && v30 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      goto LABEL_23;
    v27 = objc_alloc_init(MEMORY[0x1E0CD1618]);
    objc_msgSend(v27, "setDeliveryMode:", 1);
    objc_initWeak(location, self);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke_167;
    v33[3] = &unk_1E58A6AE8;
    objc_copyWeak(v35, location);
    v34 = v7;
    v35[1] = v8;
    objc_msgSend(v25, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v6, 0, v27, v33, v31, v32);

    objc_destroyWeak(v35);
    objc_destroyWeak(location);
LABEL_22:

LABEL_23:
  }

}

- (void)_handleSchedulingStillPhotoRequestResult:(id)a3 forCell:(id)a4 tag:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a4;
  if (-[PUCarouselSharingViewController isReadyForInteraction](self, "isReadyForInteraction"))
  {
    -[PUCarouselSharingViewController _handleStillPhotoRequestResult:forCell:tag:](self, "_handleStillPhotoRequestResult:forCell:tag:", v8, v9, a5);
  }
  else
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__PUCarouselSharingViewController__handleSchedulingStillPhotoRequestResult_forCell_tag___block_invoke;
    aBlock[3] = &unk_1E58A6AC0;
    objc_copyWeak(v16, &location);
    v14 = v8;
    v15 = v9;
    v16[1] = (id)a5;
    v10 = _Block_copy(aBlock);
    -[PUCarouselSharingViewController _photoViewLoaderBlocks](self, "_photoViewLoaderBlocks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _Block_copy(v10);
    objc_msgSend(v11, "addObject:", v12);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }

}

- (void)_handleStillPhotoRequestResult:(id)a3 forCell:(id)a4 tag:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "tag") == a5)
  {
    objc_msgSend(v7, "photoView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentHelper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setPhotoImage:", v10);
  }

}

- (void)_handleSchedulingLivePhotoRequestResult:(id)a3 forCell:(id)a4 tag:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a4;
  if (-[PUCarouselSharingViewController isReadyForInteraction](self, "isReadyForInteraction"))
  {
    -[PUCarouselSharingViewController _handleLivePhotoRequestResult:forCell:tag:](self, "_handleLivePhotoRequestResult:forCell:tag:", v8, v9, a5);
  }
  else
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__PUCarouselSharingViewController__handleSchedulingLivePhotoRequestResult_forCell_tag___block_invoke;
    aBlock[3] = &unk_1E58A6AC0;
    objc_copyWeak(v16, &location);
    v14 = v8;
    v15 = v9;
    v16[1] = (id)a5;
    v10 = _Block_copy(aBlock);
    -[PUCarouselSharingViewController _livePhotoViewLoaderBlocks](self, "_livePhotoViewLoaderBlocks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _Block_copy(v10);
    objc_msgSend(v11, "addObject:", v12);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }

}

- (void)_handleLivePhotoRequestResult:(id)a3 forCell:(id)a4 tag:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9 && objc_msgSend(v9, "tag") == a5)
  {
    -[PUCarouselSharingViewController sharingLog](self, "sharingLog");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "displayLivePhoto", ", buf, 2u);
    }

    objc_msgSend(v10, "photoView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentHelper");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShowsLivePhoto:", 1);

    v14 = -[PUScrollViewSpeedometer regime](self->_speedometer, "regime") != 3;
    objc_msgSend(v10, "photoView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentHelper");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setShouldPrepareForPlayback:", v14);
    objc_msgSend(v16, "setLivePhoto:", v8);
    -[PUCarouselSharingViewController sharingLog](self, "sharingLog");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)v18 = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "displayLivePhoto", ", v18, 2u);
    }

  }
}

- (void)_handleLoopingVideoRequestResult:(id)a3 forCell:(id)a4 asset:(id)a5 tag:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  if (v10
    && objc_msgSend(v10, "tag") == a6
    && -[PUCarouselSharingViewController _isLoopingPlaybackAllowed](self, "_isLoopingPlaybackAllowed"))
  {
    objc_msgSend(v10, "photoView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentHelper");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setLoopingVideoAsset:", v14);
  }

}

- (void)_handleAnimatedImageResult:(id)a3 forCell:(id)a4 asset:(id)a5 tag:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a5;
  if (v9 && objc_msgSend(v9, "tag") == a6)
  {
    objc_msgSend(v9, "photoView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setAnimatedImage:", v13);
  }

}

- (void)_updateCell:(id)a3 forItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _OWORD v29[2];
  __int128 v30;
  __int128 v31;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 449, CFSTR("expected cell"));

  }
  -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", objc_msgSend(v8, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v8, "item"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (double)(unint64_t)objc_msgSend(v11, "pixelWidth");
  v13 = (double)(unint64_t)objc_msgSend(v11, "pixelHeight");
  objc_msgSend(v7, "photoView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setPhotoSize:", v12, v13);
  objc_msgSend(v15, "setFillMode:", 1);
  objc_msgSend(v15, "setCornerRadius:", 8.0);
  -[PUCarouselSharingViewController spec](self, "spec");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "selectionBadgeOffset");
  v18 = v17;
  v20 = v19;

  objc_msgSend(v15, "setCustomPaddingForBadgeElements:", v18, v20);
  v30 = 0u;
  v31 = 0u;
  -[PUCarouselSharingViewController _badgeManager](self, "_badgeManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "badgeInfoForAsset:inCollection:options:", v11, v9, 8);
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
  }

  v29[0] = v30;
  v29[1] = v31;
  objc_msgSend(v15, "setBadgeInfo:", v29);
  -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v8, "item"), v9);

  objc_msgSend(v7, "setSelected:", v24);
  objc_msgSend(v15, "setDelegate:", self);
  -[PUCarouselSharingViewController _updatePhotoForAsset:cell:atIndexPath:](self, "_updatePhotoForAsset:cell:atIndexPath:", v11, v7, v8);
  -[PUCarouselSharingViewController _updateAdditionalContentForAsset:cell:](self, "_updateAdditionalContentForAsset:cell:", v11, v7);
  -[PUCarouselSharingViewController _activityAssetItemForAsset:createIfNecessary:](self, "_activityAssetItemForAsset:createIfNecessary:", v11, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
    v27 = objc_msgSend(v25, "excludeLiveness");
  else
    v27 = 0;
  objc_msgSend(v15, "setLivePhotoHidden:", v27);

}

- (void)_pageToIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a4;
  v6 = a3;
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentOffset");
  v8 = v7;
  -[PUCarouselSharingViewController _horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:](self, "_horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:", v11, v6);
  v10 = v9;

  objc_msgSend(v11, "setContentOffset:animated:", v4, v10, v8);
}

- (id)_indexPathOfCenterVisibleItemInCollectionView:(id)a3
{
  id v4;
  void *v5;
  CGRect v7;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  -[PUCarouselSharingViewController _indexPathInCollectionView:closestToContentOffsetX:](self, "_indexPathInCollectionView:closestToContentOffsetX:", v4, CGRectGetMidX(v7));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_indexPathInCollectionView:(id)a3 closestToPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  y = a4.y;
  x = a4.x;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "visibleCells");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v8 = 0;
      v12 = *(_QWORD *)v24;
      v13 = 1.79769313e308;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v7, "indexPathForCell:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUCarouselSharingViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[PUCarouselSharingViewController _shouldShowAsset:](self, "_shouldShowAsset:", v17))
          {
            objc_msgSend(v15, "center");
            v20 = (v19 - y) * (v19 - y) + (v18 - x) * (v18 - x);
            if (v20 < v13)
            {
              v21 = v16;

              v13 = v20;
              v8 = v21;
            }
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v11);
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)_indexPathInCollectionView:(id)a3 closestToContentOffsetX:(double)a4
{
  id v6;
  double width;
  double MidY;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  CGRect v31;
  CGRect v32;

  v6 = a3;
  -[PUCarouselSharingViewController _collectionViewContentFrame](self, "_collectionViewContentFrame");
  width = v31.size.width;
  MidY = CGRectGetMidY(v31);
  objc_msgSend(v6, "indexPathForItemAtPoint:", a4, MidY);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[PUCarouselSharingViewController spec](self, "spec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interItemSpacingForWidth:", width);
    v12 = v11;

    objc_msgSend(v6, "indexPathForItemAtPoint:", a4 - v12, MidY);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathForItemAtPoint:", v12 + a4, MidY);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v13)
      v16 = v14 == 0;
    else
      v16 = 1;
    if (v16)
    {
      if (v13)
        v17 = v13;
      else
        v17 = (void *)v14;
      v9 = v17;

      if (!v9)
      {
        v18 = 0;
LABEL_22:
        -[PUCarouselSharingViewController _indexPathInCollectionView:closestToPoint:](self, "_indexPathInCollectionView:closestToPoint:", v6, a4, MidY);
        v29 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v29;
        goto LABEL_23;
      }
    }
    else
    {
      objc_msgSend(v6, "cellForItemAtIndexPath:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cellForItemAtIndexPath:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      v25 = a4 - CGRectGetMaxX(*(CGRect *)&v21);
      if (v25 >= 0.0)
        v26 = v25;
      else
        v26 = -v25;
      objc_msgSend(v20, "frame");
      v27 = a4 - CGRectGetMinX(v32);
      if (v27 < 0.0)
        v27 = -v27;
      if (v26 >= v27)
        v28 = v15;
      else
        v28 = v13;
      v9 = v28;

    }
  }
  -[PUCarouselSharingViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PUCarouselSharingViewController _shouldShowAsset:](self, "_shouldShowAsset:", v18))
    goto LABEL_22;
LABEL_23:

  return v9;
}

- (int64_t)_numberOfSections
{
  void *v2;
  int64_t v3;

  -[PUCarouselSharingViewController photoCollectionsFetchResult](self, "photoCollectionsFetchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)_numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (unint64_t)_indexForPhotoCollection:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[PUCarouselSharingViewController photoCollectionsFetchResult](self, "photoCollectionsFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (id)_photoCollectionAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PUCarouselSharingViewController photoCollectionsFetchResult](self, "photoCollectionsFetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_assetAtIndexPath:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  v5 = a3;
  v6 = objc_msgSend(v5, "section");
  if (v6 >= -[PUCarouselSharingViewController _numberOfSections](self, "_numberOfSections"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "section");
    v14 = -[PUCarouselSharingViewController _numberOfSections](self, "_numberOfSections");
    -[PUCarouselSharingViewController photoCollectionsFetchResult](self, "photoCollectionsFetchResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 568, CFSTR("Out-of-bounds section %li/%li - sections: %@ "), v13, v14, v15);

  }
  -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "item");
  if (v8 >= -[PUCarouselSharingViewController _numberOfItemsInSection:](self, "_numberOfItemsInSection:", objc_msgSend(v5, "section")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v5, "item");
    v17 = -[PUCarouselSharingViewController _numberOfItemsInSection:](self, "_numberOfItemsInSection:", objc_msgSend(v5, "section"));
    v18 = objc_msgSend(v5, "section");
    v19 = objc_msgSend(v7, "assetCollectionType");
    v20 = objc_msgSend(v7, "assetCollectionSubtype");
    objc_msgSend(v7, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 575, CFSTR("Out-of-bounds item %li/%li from section %li - assetCollectionType=%ld/%ld, uuid=%@"), v22, v17, v18, v19, v20, v21);

  }
  -[PUCarouselSharingViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v5, "item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_indexPathOfAsset:(id)a3 sectionHint:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__74564;
  v24 = __Block_byref_object_dispose__74565;
  v25 = 0;
  if (v6)
  {
    -[PUCarouselSharingViewController photoCollectionsFetchResult](self, "photoCollectionsFetchResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((a4 & 0x8000000000000000) == 0 && objc_msgSend(v7, "count") > (unint64_t)a4)
    {
      objc_msgSend(v8, "objectAtIndex:", a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCarouselSharingViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "indexOfObject:", v6);
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, a4);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v21[5];
        v21[5] = v12;

      }
    }
    if (!v21[5])
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __65__PUCarouselSharingViewController__indexPathOfAsset_sectionHint___block_invoke;
      v17[3] = &unk_1E58A6B10;
      v17[4] = self;
      v18 = v6;
      v19 = &v20;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v17);

    }
    v14 = (void *)v21[5];
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;
  _Block_object_dispose(&v20, 8);

  return v15;
}

- (void)_updateVisibleCells
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UICollectionView indexPathsForVisibleItems](self->_mainCollectionView, "indexPathsForVisibleItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[UICollectionView cellForItemAtIndexPath:](self->_mainCollectionView, "cellForItemAtIndexPath:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          -[PUCarouselSharingViewController _updateCell:forItemAtIndexPath:](self, "_updateCell:forItemAtIndexPath:", v9, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_updateAdditionalContentForVisibleCells
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  -[UICollectionView indexPathsForVisibleItems](self->_mainCollectionView, "indexPathsForVisibleItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[UICollectionView cellForItemAtIndexPath:](self->_mainCollectionView, "cellForItemAtIndexPath:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", objc_msgSend(v8, "section"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUCarouselSharingViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v8, "item"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUCarouselSharingViewController _updateAdditionalContentForAsset:cell:](self, "_updateAdditionalContentForAsset:cell:", v12, v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)_updateVisibleCellBadges
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[UICollectionView indexPathsForVisibleItems](self->_mainCollectionView, "indexPathsForVisibleItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[UICollectionView supplementaryViewForElementKind:atIndexPath:](self->_mainCollectionView, "supplementaryViewForElementKind:atIndexPath:", CFSTR("PUPhotosSharingOptionBadgeKind"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          -[PUCarouselSharingViewController _updateOptionView:atIndexPath:](self, "_updateOptionView:atIndexPath:", v9, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (PHFetchResult)assetCollectionsFetchResult
{
  return self->_photoCollectionsFetchResult;
}

- (id)assetsInAssetCollection:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  PUCarouselSharingViewController *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (!v5)
      goto LABEL_17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 645, CFSTR("%s must be called on the main thread"), "-[PUCarouselSharingViewController assetsInAssetCollection:]");

    if (!v5)
      goto LABEL_17;
  }
  -[NSMutableDictionary objectForKey:](self->_resultsForAssetCollection, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    PLShareSheetGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      v10 = objc_msgSend(v5, "assetCollectionType");
      v11 = objc_msgSend(v5, "assetCollectionSubtype");
      objc_msgSend(v5, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v35 = v8;
      v36 = 2048;
      v37 = self;
      v38 = 2048;
      v39 = v10;
      v40 = 2048;
      v41 = v11;
      v42 = 2114;
      v43 = v12;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "<%@:%p>: no cached assets for assetCollection: assetCollectionType=%ld/%ld, uuid=%{public}@", buf, 0x34u);

    }
    -[PUCarouselSharingViewController photosDataSource](self, "photosDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "sectionForAssetCollection:", v5);

    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v5);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, v15);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PLShareSheetGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)objc_opt_class();
        v18 = v17;
        v19 = objc_msgSend(v6, "count");
        *(_DWORD *)buf = 138412802;
        v35 = v17;
        v36 = 2048;
        v37 = self;
        v38 = 2048;
        v39 = v19;
        _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEFAULT, "<%@:%p>: will use [PHAsset fetchAssetsInAssetCollection:options] - %lu", buf, 0x20u);

      }
    }
    else
    {
      -[PUCarouselSharingViewController photosDataSource](self, "photosDataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "forceAccurateSectionsIfNeeded:", v21);

      -[PUCarouselSharingViewController photosDataSource](self, "photosDataSource");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "assetsInSection:", v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      PLShareSheetGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_opt_class();
        v24 = v23;
        v25 = objc_msgSend(v6, "count");
        *(_DWORD *)buf = 138412802;
        v35 = v23;
        v36 = 2048;
        v37 = self;
        v38 = 2048;
        v39 = v25;
        _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEFAULT, "<%@:%p>: will use [self.photosDataSource assetsInSection:] - %lu", buf, 0x20u);

      }
    }

    if (v6)
    {
      -[NSMutableDictionary setObject:forKey:](self->_resultsForAssetCollection, "setObject:forKey:", v6, v5);
      goto LABEL_18;
    }
    PLShareSheetGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = (void *)objc_opt_class();
      v28 = v27;
      v29 = objc_msgSend(v5, "assetCollectionType");
      v30 = objc_msgSend(v5, "assetCollectionSubtype");
      objc_msgSend(v5, "uuid");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v35 = v27;
      v36 = 2048;
      v37 = self;
      v38 = 2048;
      v39 = v29;
      v40 = 2048;
      v41 = v30;
      v42 = 2114;
      v43 = v31;
      _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_ERROR, "<%@:%p>: fetched assets are nil for assetCollection: assetCollectionType=%ld/%ld, uuid=%{public}@", buf, 0x34u);

    }
LABEL_17:
    v6 = 0;
  }
LABEL_18:

  return v6;
}

- (void)_playVitalityHintAfterViewDidAppear
{
  id v3;

  if (self->_shouldPlayVitalityHintAfterViewDidAppear
    && -[PUCarouselSharingViewController _appearState](self, "_appearState") == 2)
  {
    self->_shouldPlayVitalityHintAfterViewDidAppear = 0;
    -[PUCarouselSharingViewController _lastKnownReferenceIndexPath](self, "_lastKnownReferenceIndexPath");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PUCarouselSharingViewController _playLivePhotoHintIfNeededAtIndexPath:](self, "_playLivePhotoHintIfNeededAtIndexPath:", v3);

  }
}

- (void)_handlePhotoViewLoaderBlocks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD aBlock[4];
  id v16;
  id location;

  if (-[PUCarouselSharingViewController isReadyForInteraction](self, "isReadyForInteraction")
    && -[PUCarouselSharingViewController _appearState](self, "_appearState") == 2)
  {
    -[PUCarouselSharingViewController _photoViewLoaderBlocks](self, "_photoViewLoaderBlocks");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    -[PUCarouselSharingViewController _photoViewLoaderBlocks](self, "_photoViewLoaderBlocks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    -[PUCarouselSharingViewController _livePhotoViewLoaderBlocks](self, "_livePhotoViewLoaderBlocks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    -[PUCarouselSharingViewController _livePhotoViewLoaderBlocks](self, "_livePhotoViewLoaderBlocks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAllObjects");

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PUCarouselSharingViewController__handlePhotoViewLoaderBlocks__block_invoke;
    aBlock[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v16, &location);
    v9 = _Block_copy(aBlock);
    if (objc_msgSend(v4, "count") || objc_msgSend(v7, "count"))
    {
      objc_copyWeak(&v14, &location);
      v11 = v4;
      v12 = v7;
      v13 = v9;
      px_dispatch_on_main_queue();

      objc_destroyWeak(&v14);
    }
    else
    {
      v10 = v9;
      px_dispatch_on_main_queue();

    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

- (id)_activityAssetItemForAsset:(id)a3 createIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  PUActivityAssetItem *v8;
  BOOL v9;
  void *v10;
  int v11;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_assetItemsByAssetIdentifier, "objectForKey:", v7);
  v8 = (PUActivityAssetItem *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = 1;
  else
    v9 = !v4;
  if (!v9)
  {
    v8 = -[PUActivityAssetItem initWithAsset:]([PUActivityAssetItem alloc], "initWithAsset:", v6);
    -[NSMutableDictionary setObject:forKey:](self->_assetItemsByAssetIdentifier, "setObject:forKey:", v8, v7);
    if (!-[PUCarouselSharingViewController sendAsAssetBundles](self, "sendAsAssetBundles"))
    {
      +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "irisUIEnabled");

      -[PUActivityAssetItem setExcludeLiveness:](v8, "setExcludeLiveness:", v11 ^ 1u);
      -[PUActivityAssetItem setExcludeLocation:](v8, "setExcludeLocation:", 0);
      -[PUActivityAssetItem setExcludeCaption:](v8, "setExcludeCaption:", 0);
      -[PUActivityAssetItem setExcludeAccessibilityDescription:](v8, "setExcludeAccessibilityDescription:", 0);
    }
  }

  return v8;
}

- (id)currentActivityAssetItems
{
  void *v3;
  void *v4;
  void *v5;

  -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSelectedAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCarouselSharingViewController _updatedActivityAssetItemsForAssets:](self, "_updatedActivityAssetItemsForAssets:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_updatedActivityAssetItemsForAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v4, "count"));
  -[NSMutableDictionary allKeys](self->_assetItemsByAssetIdentifier, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[PUCarouselSharingViewController _activityAssetItemForAsset:createIfNecessary:](self, "_activityAssetItemForAsset:createIfNecessary:", v13, 1, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

        objc_msgSend(v13, "localIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeObject:", v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  -[NSMutableDictionary removeObjectsForKeys:](self->_assetItemsByAssetIdentifier, "removeObjectsForKeys:", v7);
  return v5;
}

- (void)_addActivityAssetItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUCarouselSharingViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "carouselSharingViewController:addAssetItem:", self, v4);

}

- (void)_removeActivityAssetItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assetItemsByAssetIdentifier, "setObject:forKeyedSubscript:", 0, v7);
  -[PUCarouselSharingViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "carouselSharingViewController:removeAssetItem:", self, v4);

}

- (void)_replaceActivityAssetItem:(id)a3 withAssetItem:(id)a4 notifyDelegate:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a5;
  v15 = a3;
  v9 = a4;
  objc_msgSend(v15, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 770, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[previousAsset isEqual:asset]"));

  }
  objc_msgSend(v10, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assetItemsByAssetIdentifier, "setObject:forKeyedSubscript:", v9, v12);
  if (v5)
  {
    -[PUCarouselSharingViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "carouselSharingViewController:replaceAssetItem:withAssetItem:", self, v15, v9);

  }
}

- (void)_setSelected:(BOOL)a3 atIndexPath:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  char v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v5 = a3;
  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndex:", objc_msgSend(v7, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _activityAssetItemForAsset:createIfNecessary:](self, "_activityAssetItemForAsset:createIfNecessary:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "item");
  if (v5)
  {
    objc_msgSend(v11, "selectAssetAtIndex:inAssetCollection:", v12, v8);

    -[PUCarouselSharingViewController _addActivityAssetItem:](self, "_addActivityAssetItem:", v10);
    v13 = CFSTR("com.apple.photos.CPAnalytics.shareSheetCarouselSelected");
  }
  else
  {
    objc_msgSend(v11, "deselectAssetAtIndex:inAssetCollection:", v12, v8);

    objc_msgSend(v10, "setExcludeLiveness:", 0);
    -[PUCarouselSharingViewController _removeActivityAssetItem:](self, "_removeActivityAssetItem:", v10);
    v13 = CFSTR("com.apple.photos.CPAnalytics.shareSheetCarouselDeselected");
  }
  -[PUCarouselSharingViewController analyticsEventsSent](self, "analyticsEventsSent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v13);

  if ((v15 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1E0D09910];
    v26 = *MEMORY[0x1E0D09830];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sendEvent:withPayload:", v13, v19);

    -[PUCarouselSharingViewController analyticsEventsSent](self, "analyticsEventsSent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v13);

  }
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cellForItemAtIndexPath:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSelected:", v5);
  objc_msgSend(v21, "_visibleSupplementaryViewOfKind:atIndexPath:", CFSTR("PUPhotosSharingSelectionBadgeKind"), v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSelected:", v5);
  if (objc_msgSend(v9, "playbackStyle") == 3)
  {
    objc_msgSend(v21, "_visibleSupplementaryViewOfKind:atIndexPath:", CFSTR("PUPhotosSharingOptionBadgeKind"), v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCarouselSharingViewController _updateOptionView:atIndexPath:](self, "_updateOptionView:atIndexPath:", v24, v7);

  }
}

- (BOOL)_isAnyAssetSelected
{
  PUCarouselSharingViewController *v2;
  void *v3;

  v2 = self;
  -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isAnyAssetSelectedInAssetCollections:", v2->_photoCollectionsFetchResult);

  return (char)v2;
}

- (BOOL)isItemAtIndexPathSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "item");

  LOBYTE(v4) = objc_msgSend(v6, "isAssetAtIndexSelected:inAssetCollection:", v7, v5);
  return (char)v4;
}

- (void)selectItemAtIndexPath:(id)a3
{
  -[PUCarouselSharingViewController _setSelected:atIndexPath:animated:](self, "_setSelected:atIndexPath:animated:", 1, a3, 0);
}

- (void)deselectItemAtIndexPath:(id)a3
{
  -[PUCarouselSharingViewController _setSelected:atIndexPath:animated:](self, "_setSelected:atIndexPath:animated:", 0, a3, 0);
}

- (void)_updateOptionView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = -[PUCarouselSharingViewController sendAsAssetBundles](self, "sendAsAssetBundles");
  -[PUCarouselSharingViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v9 = 1;
  -[PUCarouselSharingViewController _activityAssetItemForAsset:createIfNecessary:](self, "_activityAssetItemForAsset:createIfNecessary:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v15, "playbackStyle");
  -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", objc_msgSend(v6, "section"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v6, "item");

  LODWORD(v6) = objc_msgSend(v13, "isAssetAtIndexSelected:inAssetCollection:", v14, v12);
  if ((_DWORD)v6)
    v9 = objc_msgSend(v10, "excludeLiveness") ^ 1;
  objc_msgSend(v7, "setInteractive:", !v8);
  objc_msgSend(v7, "setToggled:", v9);
  objc_msgSend(v7, "setHidden:", v11 != 3);

}

- (NSString)localizedSelectionTitle
{
  void *v3;
  void *v4;

  if (-[PUCarouselSharingViewController _isAnyAssetSelected](self, "_isAnyAssetSelected"))
  {
    -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedSelectionString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PULocalizedString(CFSTR("SHARING_HEADER_NO_ITEMS_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (void)_handleSelectionOption:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  -[NSMapTable objectForKey:](self->_indexPathsByOptionView, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _activityAssetItemForAsset:createIfNecessary:](self, "_activityAssetItemForAsset:createIfNecessary:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", objc_msgSend(v7, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v7, "item"), v10);

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_msgSend(v9, "copy");
    v14 = objc_msgSend(v9, "excludeLiveness") ^ 1;
    objc_msgSend(v13, "setExcludeLiveness:", v14);
    v27 = v13;
    -[PUCarouselSharingViewController _replaceActivityAssetItem:withAssetItem:notifyDelegate:](self, "_replaceActivityAssetItem:withAssetItem:notifyDelegate:", v9, v13, 1);
    -[PUCarouselSharingViewController _updateOptionView:atIndexPath:](self, "_updateOptionView:atIndexPath:", v6, v7);
    v15 = objc_msgSend(v8, "canPlayPhotoIris");
    if ((v14 & 1) == 0 && v15)
      -[PUCarouselSharingViewController _playLivePhotoHintIfNeededAtIndexPath:](self, "_playLivePhotoHintIfNeededAtIndexPath:", v7);
    -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cellForItemAtIndexPath:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v17;
    objc_msgSend(v17, "photoView");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v18, "contentHelper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setLivePhotoHidden:", v14);
    -[PUCarouselSharingViewController analyticsEventsSent](self, "analyticsEventsSent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = objc_msgSend(v20, "containsObject:", CFSTR("com.apple.photos.CPAnalytics.shareSheetCarouselLiveToggled"));

    if ((v18 & 1) == 0)
    {
      v25 = (void *)MEMORY[0x1E0D09910];
      v28 = *MEMORY[0x1E0D09830];
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.shareSheetCarouselLiveToggled"), v23);

      -[PUCarouselSharingViewController analyticsEventsSent](self, "analyticsEventsSent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", CFSTR("com.apple.photos.CPAnalytics.shareSheetCarouselLiveToggled"));

    }
  }
  else
  {
    -[PUCarouselSharingViewController _setSelected:atIndexPath:animated:](self, "_setSelected:atIndexPath:animated:", 1, v7, 1);
  }

}

- (void)_arrowKey:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[PUCarouselSharingViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");
    objc_msgSend(v16, "input");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC4E28]);

    if (v8)
    {
      if (v6 == 1)
        v9 = -1;
      else
        v9 = 1;
    }
    else
    {
      objc_msgSend(v16, "input");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC4E10]);

      if (v6 == 1)
        v12 = 1;
      else
        v12 = -1;
      if (v11)
        v9 = v12;
      else
        v9 = 0;
    }
    -[PUCarouselSharingViewController currentIndexPath](self, "currentIndexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "next:indexPathFromIndexPath:", v9, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      -[PUCarouselSharingViewController _pageToIndexPath:animated:](self, "_pageToIndexPath:animated:", v15, 1);

  }
}

- (void)_playLivePhotoHintIfNeededAtIndexPath:(id)a3
{
  UICollectionView *mainCollectionView;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  mainCollectionView = self->_mainCollectionView;
  v5 = a3;
  -[UICollectionView cellForItemAtIndexPath:](mainCollectionView, "cellForItemAtIndexPath:", v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _activityAssetItemForAsset:createIfNecessary:](self, "_activityAssetItemForAsset:createIfNecessary:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", objc_msgSend(v5, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "item");

  v11 = objc_msgSend(v9, "isAssetAtIndexSelected:inAssetCollection:", v10, v8);
  if ((objc_msgSend(v7, "excludeLiveness") & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "photoView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentHelper");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        objc_msgSend(v13, "startPlaybackWithStyle:", 2);
      else
        objc_msgSend(v13, "stopPlayback");

    }
  }

}

- (void)_handleTapAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "canPerformSharingAction"))
  {
    -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", objc_msgSend(v9, "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v9, "item"), v6);

    -[PUCarouselSharingViewController _setSelected:atIndexPath:animated:](self, "_setSelected:atIndexPath:animated:", v8 ^ 1u, v9, 0);
  }
  if ((objc_msgSend(v4, "isDragging") & 1) == 0
    && (objc_msgSend(v4, "isDecelerating") & 1) == 0
    && objc_msgSend(v4, "isTracking"))
  {
    -[PUCarouselSharingViewController _pageToIndexPath:animated:](self, "_pageToIndexPath:animated:", v9, 1);
  }

}

- (void)_handleTapInMainCollectionView:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v8);
  v6 = v5;

  -[PUCarouselSharingViewController _indexPathInCollectionView:closestToContentOffsetX:](self, "_indexPathInCollectionView:closestToContentOffsetX:", v8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[PUCarouselSharingViewController _handleTapAtIndexPath:](self, "_handleTapAtIndexPath:", v7);

}

- (CGRect)_collectionViewContentFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGRect result;

  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  -[PUCarouselSharingViewController _getMainCollectionViewFrame:collectionViewLayoutInsets:](self, "_getMainCollectionViewFrame:collectionViewLayoutInsets:", &v8, &v6);
  v2 = *(double *)&v8 + *((double *)&v6 + 1);
  v3 = *((double *)&v8 + 1) + *(double *)&v6;
  v4 = *(double *)&v9 - (*((double *)&v6 + 1) + *((double *)&v7 + 1));
  v5 = *((double *)&v9 + 1) - (*(double *)&v6 + *(double *)&v7);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)_getMainCollectionViewFrame:(CGRect *)a3 collectionViewLayoutInsets:(UIEdgeInsets *)a4
{
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  __int128 v15;

  -[PUCarouselSharingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if (a3)
  {
    a3->origin.x = v8;
    a3->origin.y = v10;
    a3->size.width = v12;
    a3->size.height = v14;
  }
  if (a4)
  {
    v15 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&a4->bottom = v15;
  }
}

- (id)_validIndexPathFromIndexPath:(id)a3
{
  id v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 1007, CFSTR("expected index path"));

  }
  v6 = -[PUCarouselSharingViewController _numberOfSections](self, "_numberOfSections") - 1;
  v7 = objc_msgSend(v5, "section");
  if (v6 >= v7)
    v6 = v7;
  v8 = objc_msgSend(v5, "item");
  if (v6 < 0)
  {
LABEL_10:
    v11 = 0;
    goto LABEL_16;
  }
  v9 = v8;
  v10 = -[PUCarouselSharingViewController _numberOfItemsInSection:](self, "_numberOfItemsInSection:", v6);
  if (!v10)
  {
    while (v6 > 0)
    {
      v10 = -[PUCarouselSharingViewController _numberOfItemsInSection:](self, "_numberOfItemsInSection:", --v6);
      if (v10)
      {
        v9 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_12;
      }
    }
    goto LABEL_10;
  }
LABEL_12:
  if (v10 - 1 >= v9)
    v12 = v9;
  else
    v12 = v10 - 1;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v12, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v11;
}

- (void)_updateLastKnownReferenceIndexPath
{
  void *v3;
  void *v4;
  id v5;

  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController mainCollectionViewLayout](self, "mainCollectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v3, "hasReferenceIndexPath"))
  {
    -[PUCarouselSharingViewController _indexPathOfCenterVisibleItemInCollectionView:](self, "_indexPathOfCenterVisibleItemInCollectionView:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCarouselSharingViewController _setLastKnownReferenceAsset:indexPath:](self, "_setLastKnownReferenceAsset:indexPath:", 0, v4);

  }
}

- (void)_setLastKnownReferenceAsset:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((!v7 || v6) && !v7 && v6)
  {
    -[PUCarouselSharingViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[PUCarouselSharingViewController _setLastKnownReferenceIndexPath:](self, "_setLastKnownReferenceIndexPath:", v6);
  -[PUCarouselSharingViewController _setLastKnownReferenceAsset:](self, "_setLastKnownReferenceAsset:", v7);

}

- (id)currentIndexPath
{
  void *v3;
  NSIndexPath *v4;
  void *v6;
  void *v7;
  id v8;

  -[PUCarouselSharingViewController _lastKnownReferenceIndexPath](self, "_lastKnownReferenceIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (-[PUCarouselSharingViewController _lastKnownReferenceIndexPath](self, "_lastKnownReferenceIndexPath"),
        (v4 = (NSIndexPath *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[PUCarouselSharingViewController _updateLastKnownReferenceIndexPath](self, "_updateLastKnownReferenceIndexPath");
    -[PUCarouselSharingViewController _lastKnownReferenceIndexPath](self, "_lastKnownReferenceIndexPath");
    v4 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[PUCarouselSharingViewController _lastKnownReferenceAsset](self, "_lastKnownReferenceAsset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6
        || (-[PUCarouselSharingViewController _lastKnownReferenceAsset](self, "_lastKnownReferenceAsset"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            -[PUCarouselSharingViewController _indexPathOfAsset:sectionHint:](self, "_indexPathOfAsset:sectionHint:", v7, 0x7FFFFFFFFFFFFFFFLL), v4 = (NSIndexPath *)objc_claimAutoreleasedReturnValue(), v7, !v4))
      {
        v4 = self->_inFlightReferenceIndexPath;
        if (!v4)
        {
          v8 = 0;
          -[PUCarouselSharingViewController _getFirstValidIndexPath:lastValidIndexPath:](self, "_getFirstValidIndexPath:lastValidIndexPath:", &v8, 0);
          v4 = (NSIndexPath *)v8;
        }
      }
    }
  }
  -[PUCarouselSharingViewController _setLastKnownReferenceAsset:indexPath:](self, "_setLastKnownReferenceAsset:indexPath:", 0, v4);
  return v4;
}

- (PHAsset)currentAsset
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[PUCarouselSharingViewController _lastKnownReferenceAsset](self, "_lastKnownReferenceAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUCarouselSharingViewController currentIndexPath](self, "currentIndexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PUCarouselSharingViewController _lastKnownReferenceAsset](self, "_lastKnownReferenceAsset");
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v5;
    }

  }
  return (PHAsset *)v3;
}

- (void)setPhotosSharingTransitionContext:(id)a3
{
  PUPhotosSharingTransitionContext *v5;
  PUPhotosSharingTransitionContext **p_photosSharingTransitionContext;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (PUPhotosSharingTransitionContext *)a3;
  p_photosSharingTransitionContext = &self->_photosSharingTransitionContext;
  if (self->_photosSharingTransitionContext != v5)
  {
    objc_storeStrong((id *)&self->_photosSharingTransitionContext, a3);
    if (*p_photosSharingTransitionContext)
    {
      -[PUPhotosSharingTransitionContext keyAssetIndexPath](*p_photosSharingTransitionContext, "keyAssetIndexPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCarouselSharingViewController _setLastKnownReferenceAsset:indexPath:](self, "_setLastKnownReferenceAsset:indexPath:", 0, v7);

    }
    -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v8, "visibleCells", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v8, "indexPathForCell:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUCarouselSharingViewController _updateCell:forItemAtIndexPath:](self, "_updateCell:forItemAtIndexPath:", v14, v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
}

- (void)setOneUpPhotosSharingTransitionContext:(id)a3
{
  PUPhotosSharingTransitionContext *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  PUPhotosSharingTransitionContext *v15;

  v6 = (PUPhotosSharingTransitionContext *)a3;
  if (self->_photosSharingTransitionContext != v6)
  {
    v15 = v6;
    objc_storeStrong((id *)&self->_photosSharingTransitionContext, a3);
    v6 = v15;
    if (v15)
    {
      -[PUPhotosSharingTransitionContext currentAssetReference](v15, "currentAssetReference");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "asset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_7:

        v6 = v15;
        goto LABEL_8;
      }
      v9 = v8;
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_6:
          -[PUCarouselSharingViewController _setLastKnownReferenceAsset:indexPath:](self, "_setLastKnownReferenceAsset:indexPath:", v9, 0);

          goto LABEL_7;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "px_descriptionForAssertionMessage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 1116, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("displayAsset"), v12, v14);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 1116, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("displayAsset"), v12);
      }

      goto LABEL_6;
    }
  }
LABEL_8:

}

- (void)setOneUpPhotosSharingTransitionInfo:(id)a3
{
  PUAssetTransitionInfo **p_assetTransitionInfo;
  void *v6;
  PUAssetTransitionInfo *v7;

  p_assetTransitionInfo = &self->_assetTransitionInfo;
  v7 = (PUAssetTransitionInfo *)a3;
  if (*p_assetTransitionInfo != v7)
  {
    objc_storeStrong((id *)&self->_assetTransitionInfo, a3);
    if (*p_assetTransitionInfo)
    {
      -[PUCarouselSharingViewController currentIndexPath](self, "currentIndexPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCarouselSharingViewController _updateCellAtIndexPath:withTransitionInfo:](self, "_updateCellAtIndexPath:withTransitionInfo:", v6, *p_assetTransitionInfo);

    }
  }

}

- (void)setLeadingAssetTransitionInfo:(id)a3
{
  PUAssetTransitionInfo *v5;
  PUAssetTransitionInfo *v6;

  v5 = (PUAssetTransitionInfo *)a3;
  if (self->_leadingAssetTransitionInfo != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_leadingAssetTransitionInfo, a3);
    -[PUCarouselSharingViewController _updateAssetTransitionInfo:](self, "_updateAssetTransitionInfo:", self->_leadingAssetTransitionInfo);
    v5 = v6;
  }

}

- (void)setTrailingAssetTransitionInfo:(id)a3
{
  PUAssetTransitionInfo *v5;
  PUAssetTransitionInfo *v6;

  v5 = (PUAssetTransitionInfo *)a3;
  if (self->_trailingAssetTransitionInfo != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_trailingAssetTransitionInfo, a3);
    -[PUCarouselSharingViewController _updateAssetTransitionInfo:](self, "_updateAssetTransitionInfo:", self->_trailingAssetTransitionInfo);
    v5 = v6;
  }

}

- (void)_updateAssetTransitionInfo:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;

  v5 = a3;
  if (v5)
  {
    v15 = v5;
    objc_msgSend(v5, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_6:

      v5 = v15;
      goto LABEL_7;
    }
    v7 = v6;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_5:
        -[PUCarouselSharingViewController currentIndexPath](self, "currentIndexPath");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUCarouselSharingViewController _indexPathOfAsset:sectionHint:](self, "_indexPathOfAsset:sectionHint:", v7, objc_msgSend(v8, "section"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUCarouselSharingViewController _updateCellAtIndexPath:withTransitionInfo:](self, "_updateCellAtIndexPath:withTransitionInfo:", v9, v15);
        goto LABEL_6;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_descriptionForAssertionMessage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 1155, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("displayAsset"), v12, v14);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 1155, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("displayAsset"), v12);
    }

    goto LABEL_5;
  }
LABEL_7:

}

- (void)_updateCellAtIndexPath:(id)a3 withTransitionInfo:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a4;
  v7 = a3;
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "px_descriptionForAssertionMessage");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 1163, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[self.mainCollectionView cellForItemAtIndexPath:indexPath]"), v23, v24);

    }
    objc_msgSend(v25, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "photoImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "size");
    v15 = v14;
    objc_msgSend(v13, "size");
    if (v15 > v16)
    {
      objc_msgSend(v9, "photoView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contentHelper");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPhotoImage:", 0);

      objc_msgSend(v9, "photoView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "contentHelper");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setPlaceHolderImage:", v10);

    }
  }

}

- (void)setPhotosSharingTransitionLayout:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  -[PUCarouselSharingViewController _transitionLayout](self, "_transitionLayout");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v7 != v12)
  {
    objc_storeStrong((id *)&self->__transitionLayout, a3);
    if (v12)
    {
      v9 = v12;
    }
    else
    {
      -[PUCarouselSharingViewController mainCollectionViewLayout](self, "mainCollectionViewLayout");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCollectionViewLayout:animated:", v10, v4);

    v8 = v12;
  }

}

- (id)_selectionViewAtIndexPath:(id)a3 forCollectionView:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 1189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collectionView"));

  }
  objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", CFSTR("PUPhotosSharingSelectionBadgeKind"), CFSTR("PUPhotosSharingBadgeIdentifier"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", objc_msgSend(v7, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v7, "item"), v10);

  objc_msgSend(v9, "setSelected:", v12);
  return v9;
}

- (id)_optionViewAtIndexPath:(id)a3 forCollectionView:(id)a4
{
  id v7;
  PUPhotosSharingOptionView *v8;
  id v9;

  if (a4)
  {
    v7 = a3;
    objc_msgSend(a4, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", CFSTR("PUPhotosSharingOptionBadgeKind"), CFSTR("PUPhotosSharingOptionIdentifier"), v7);
    v8 = (PUPhotosSharingOptionView *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosSharingOptionView setTarget:action:](v8, "setTarget:action:", self, sel__handleSelectionOption_);
    -[NSMapTable setObject:forKey:](self->_indexPathsByOptionView, "setObject:forKey:", v7, v8);
  }
  else
  {
    v9 = a3;
    v8 = objc_alloc_init(PUPhotosSharingOptionView);
  }
  -[PUCarouselSharingViewController _updateOptionView:atIndexPath:](self, "_updateOptionView:atIndexPath:", v8, a3);

  return v8;
}

- (void)_resetPreheating
{
  -[PHCachingImageManager stopCachingImagesForAllAssets](self->_cachingImageManager, "stopCachingImagesForAllAssets");
  -[PUCarouselSharingViewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PUCarouselSharingViewController _setPreheatedAssets:](self, "_setPreheatedAssets:", 0);
}

- (void)_updatePreheatedAssets
{
  void *v3;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  PUPhotosSharingTransitionContext *photosSharingTransitionContext;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id obj;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  _BYTE v81[128];
  uint64_t v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  v85 = *MEMORY[0x1E0C80C00];
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  x = v86.origin.x;
  y = v86.origin.y;
  width = v86.size.width;
  height = v86.size.height;
  if (!CGRectIsEmpty(v86))
  {
    if ((unint64_t)(-[PUCarouselSharingViewController interfaceOrientation](self, "interfaceOrientation") - 1) >= 2)
      v8 = height;
    else
      v8 = width;
    -[PUCarouselSharingViewController _previousPreheatRect](self, "_previousPreheatRect");
    v10 = v9;
    v87.origin.x = x;
    v87.origin.y = y;
    v87.size.width = width;
    v87.size.height = height;
    v88 = CGRectInset(v87, v8 * -2.0, 0.0);
    v11 = v88.origin.x;
    v12 = v88.origin.y;
    v13 = v88.origin.x - v10;
    if (v13 < 0.0)
      v13 = -v13;
    if (v13 > v8 / 3.0)
    {
      v14 = v88.size.width;
      v15 = v88.size.height;
      if (-[PUCarouselSharingViewController px_isVisible](self, "px_isVisible"))
      {
        -[PUCarouselSharingViewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", v11, v12, v14, v15);
        photosSharingTransitionContext = self->_photosSharingTransitionContext;
        objc_msgSend(v3, "collectionViewLayout");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (photosSharingTransitionContext)
          objc_msgSend(v17, "layoutAttributesForElementsInRect:", v11, v12, v14, v15);
        else
          objc_msgSend(v17, "layoutAttributesForItemsInRect:", v11, v12, v14, v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v19, "count"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v22 = v19;
        v23 = (void *)v20;
        obj = v22;
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v77;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v77 != v26)
                objc_enumerationMutation(obj);
              v28 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
              if (!objc_msgSend(v28, "representedElementCategory"))
              {
                objc_msgSend(v28, "indexPath");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[PUCarouselSharingViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "addObject:", v30);
                objc_msgSend(v23, "setObject:forKey:", v28, v30);

              }
            }
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
          }
          while (v25);
        }

        -[PUCarouselSharingViewController _preheatedAssets](self, "_preheatedAssets");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUCarouselSharingViewController _setPreheatedAssets:](self, "_setPreheatedAssets:", v21);
        v32 = (void *)objc_msgSend(v21, "mutableCopy");
        objc_msgSend(v32, "minusSet:", v31);
        v65 = (void *)objc_msgSend(v31, "mutableCopy");
        objc_msgSend(v65, "minusSet:", v21);
        if (objc_msgSend(v32, "count") || objc_msgSend(v65, "count"))
        {
          v61 = v31;
          v62 = v21;
          v64 = v3;
          v33 = (void *)objc_opt_new();
          -[PUCarouselSharingViewController cachingImageManager](self, "cachingImageManager");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v60 = v32;
          v35 = v32;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v73;
            do
            {
              for (j = 0; j != v37; ++j)
              {
                if (*(_QWORD *)v73 != v38)
                  objc_enumerationMutation(v35);
                v40 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j);
                objc_msgSend(v23, "objectForKeyedSubscript:", v40, v60);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "frame");
                v43 = PUPixelSizeFromPointSize(v42);
                v45 = v44;
                v82 = v40;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "startCachingImagesForAssets:targetSize:contentMode:options:", v46, 0, v33, v43, v45);

              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
            }
            while (v37);
          }
          v63 = v23;

          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          v66 = v65;
          v47 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v69;
            do
            {
              for (k = 0; k != v48; ++k)
              {
                if (*(_QWORD *)v69 != v49)
                  objc_enumerationMutation(v66);
                v51 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k);
                -[PUCarouselSharingViewController _indexPathOfAsset:sectionHint:](self, "_indexPathOfAsset:sectionHint:", v51, 0x7FFFFFFFFFFFFFFFLL, v60);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                -[PUCarouselSharingViewController mainCollectionViewLayout](self, "mainCollectionViewLayout");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "layoutAttributesForItemAtIndexPath:", v52);
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v54, "frame");
                v56 = PUPixelSizeFromPointSize(v55);
                v58 = v57;
                v80 = v51;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "stopCachingImagesForAssets:targetSize:contentMode:options:", v59, 0, v33, v56, v58);

              }
              v48 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
            }
            while (v48);
          }

          v23 = v63;
          v3 = v64;
          v31 = v61;
          v21 = v62;
          v32 = v60;
        }

      }
    }
  }

}

- (CGRect)frameForBadgeOfKind:(id)a3 forItemFrame:(CGRect)a4 atIndexPath:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  PUPhotosSharingCollectionViewItemSublayout *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
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
  double v36;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  v13 = -[PUPhotosSharingCollectionViewItemSublayout initWithIndexPath:itemFrame:]([PUPhotosSharingCollectionViewItemSublayout alloc], "initWithIndexPath:itemFrame:", v12, x, y, width, height);
  -[PUCarouselSharingViewController layout:collectionView:sizeForBadgeViewOfKind:forItemAtIndexPath:](self, "layout:collectionView:sizeForBadgeViewOfKind:forItemAtIndexPath:", 0, 0, CFSTR("PUPhotosSharingSelectionBadgeKind"), v12);
  -[PUPhotosSharingCollectionViewItemSublayout setSelectionBadgeSize:](v13, "setSelectionBadgeSize:");
  -[PUCarouselSharingViewController layout:collectionView:sizeForBadgeViewOfKind:forItemAtIndexPath:](self, "layout:collectionView:sizeForBadgeViewOfKind:forItemAtIndexPath:", 0, 0, CFSTR("PUPhotosSharingOptionBadgeKind"), v12);
  v15 = v14;
  v17 = v16;

  -[PUPhotosSharingCollectionViewItemSublayout setOptionBadgeSize:](v13, "setOptionBadgeSize:", v15, v17);
  LOBYTE(v12) = objc_msgSend(v11, "isEqualToString:", CFSTR("PUPhotosSharingSelectionBadgeKind"));
  -[PUCarouselSharingViewController spec](self, "spec");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((v12 & 1) != 0)
    v20 = objc_msgSend(v18, "selectionBadgeCorner");
  else
    v20 = objc_msgSend(v18, "optionBadgeCorner");
  v21 = v20;

  -[PUPhotosSharingCollectionViewItemSublayout setBadgesCorner:](v13, "setBadgesCorner:", v21);
  -[PUCarouselSharingViewController spec](self, "spec");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "selectionBadgeOffset");
  -[PUPhotosSharingCollectionViewItemSublayout setBadgesOffset:](v13, "setBadgesOffset:");

  -[PUPhotosSharingCollectionViewItemSublayout prepareSublayout](v13, "prepareSublayout");
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("PUPhotosSharingSelectionBadgeKind")))
  {
    -[PUPhotosSharingCollectionViewItemSublayout selectionBadgeLayoutAttributes](v13, "selectionBadgeLayoutAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("PUPhotosSharingOptionBadgeKind")))
    {
LABEL_10:
      v26 = *MEMORY[0x1E0C9D648];
      v28 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v30 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v32 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      goto LABEL_11;
    }
    -[PUPhotosSharingCollectionViewItemSublayout optionBadgeLayoutAttributes](v13, "optionBadgeLayoutAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;
  if (!v23)
    goto LABEL_10;
  objc_msgSend(v23, "frame");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

LABEL_11:
  v33 = v26;
  v34 = v28;
  v35 = v30;
  v36 = v32;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (BOOL)ppt_scrollToAssetAtRelativeIndex:(int64_t)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  if (a3 != -1 && a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 1308, CFSTR("only support single step"));

  }
  -[PUCarouselSharingViewController currentIndexPath](self, "currentIndexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "next:indexPathFromIndexPath:", a3, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PUCarouselSharingViewController _pptSetOnDidEndScrollingBlock:](self, "_pptSetOnDidEndScrollingBlock:", v7);
    -[PUCarouselSharingViewController _pageToIndexPath:animated:](self, "_pageToIndexPath:animated:", v11, 1);
  }

  return v11 != 0;
}

- (void)ppt_faultInScollViewContentSize
{
  id v3;
  id v4;
  id v5;
  id v6;

  v5 = 0;
  v6 = 0;
  -[PUCarouselSharingViewController _getFirstValidIndexPath:lastValidIndexPath:](self, "_getFirstValidIndexPath:lastValidIndexPath:", &v6, &v5);
  v3 = v6;
  v4 = v5;
  -[PUCarouselSharingViewController _pageToIndexPath:animated:](self, "_pageToIndexPath:animated:", v4, 0);
  -[PUCarouselSharingViewController _pageToIndexPath:animated:](self, "_pageToIndexPath:animated:", v3, 0);

}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  return 0;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  PHFetchResult *v11;
  PHFetchResult *photoCollectionsFetchResult;
  void *v13;
  NSMutableDictionary *resultsForAssetCollection;
  id v15;
  id v16;
  NSMutableSet *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController photoCollectionsFetchResult](self, "photoCollectionsFetchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForFetchResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((objc_msgSend(v7, "hasMoves") & 1) == 0 && objc_msgSend(v7, "hasIncrementalChanges"))
    {
      objc_msgSend(v7, "insertedIndexes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {

      }
      else
      {
        objc_msgSend(v7, "removedIndexes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count") == 0;

        if (v10)
        {
LABEL_8:
          objc_msgSend(v5, "addObject:", v7);
          objc_msgSend(v7, "fetchResultAfterChanges");
          v11 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
          photoCollectionsFetchResult = self->_photoCollectionsFetchResult;
          self->_photoCollectionsFetchResult = v11;

          goto LABEL_9;
        }
      }
    }
    *((_BYTE *)v37 + 24) = 1;
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  resultsForAssetCollection = self->_resultsForAssetCollection;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __68__PUCarouselSharingViewController_photoLibraryDidChangeOnMainQueue___block_invoke;
  v32[3] = &unk_1E58A6B38;
  v15 = v4;
  v33 = v15;
  v35 = &v36;
  v16 = v13;
  v34 = v16;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](resultsForAssetCollection, "enumerateKeysAndObjectsUsingBlock:", v32);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = self->__preheatedAssets;
  v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(v15, "changeDetailsForObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "assetContentChanged"))
        {
          *((_BYTE *)v37 + 24) = 1;

          goto LABEL_19;
        }

      }
      v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v18)
        continue;
      break;
    }
  }
LABEL_19:

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __68__PUCarouselSharingViewController_photoLibraryDidChangeOnMainQueue___block_invoke_2;
  v27[3] = &unk_1E58A6B60;
  v27[4] = self;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v27);
  if (objc_msgSend(v5, "count") || objc_msgSend(v16, "count"))
  {
    -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handlePhotoLibraryChange:", v15);

    -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "orderedSelectedAssets");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUCarouselSharingViewController _updatedActivityAssetItemsForAssets:](self, "_updatedActivityAssetItemsForAssets:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCarouselSharingViewController delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "carouselSharingViewController:setAssetItems:", self, v25);

    -[PUCarouselSharingViewController _processCollectionListChangeNotifications:singleCollectionNotifications:needsReloadData:](self, "_processCollectionListChangeNotifications:singleCollectionNotifications:needsReloadData:", v5, v16, *((unsigned __int8 *)v37 + 24));
  }

  _Block_object_dispose(&v36, 8);
}

- (void)_processCollectionListChangeNotifications:(id)a3 singleCollectionNotifications:(id)a4 needsReloadData:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSIndexPath *v13;
  NSIndexPath *inFlightReferenceIndexPath;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a5;
  v18 = a4;
  if (!objc_msgSend(a3, "count") && !objc_msgSend(v18, "count"))
    goto LABEL_19;
  -[PUCarouselSharingViewController _lastKnownReferenceAsset](self, "_lastKnownReferenceAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _lastKnownReferenceIndexPath](self, "_lastKnownReferenceIndexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    v12 = 0;
    goto LABEL_9;
  }
  if (v9)
    v11 = objc_msgSend(v9, "section");
  else
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  -[PUCarouselSharingViewController _indexPathOfAsset:sectionHint:](self, "_indexPathOfAsset:sectionHint:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_9:
    if (v10)
    {
      -[PUCarouselSharingViewController _validIndexPathFromIndexPath:](self, "_validIndexPathFromIndexPath:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  -[PUCarouselSharingViewController _setLastKnownReferenceAsset:indexPath:](self, "_setLastKnownReferenceAsset:indexPath:", 0, v12);
  if (self->_inFlightReferenceIndexPath)
  {
    -[PUCarouselSharingViewController _validIndexPathFromIndexPath:](self, "_validIndexPathFromIndexPath:");
    v13 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
    inFlightReferenceIndexPath = self->_inFlightReferenceIndexPath;
    self->_inFlightReferenceIndexPath = v13;

  }
  if (v5)
  {
    if (-[PUCarouselSharingViewController isViewLoaded](self, "isViewLoaded")
      && (-[PUCarouselSharingViewController view](self, "view"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "window"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v16))
    {
      -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "reloadData");

      -[PUCarouselSharingViewController _setViewInSyncWithModel:](self, "_setViewInSyncWithModel:", 1);
      -[PUCarouselSharingViewController _updatePreheatedAssets](self, "_updatePreheatedAssets");
    }
    else
    {
      -[PUCarouselSharingViewController _setViewInSyncWithModel:](self, "_setViewInSyncWithModel:", 0);
    }
  }

LABEL_19:
}

- (void)_updateMainViewAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  PUPhotosSharingCollectionViewLayout *v6;
  double v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  UITapGestureRecognizer *v21;
  UITapGestureRecognizer *tapGestureRecognizer;
  PUScrollViewSpeedometer *v23;
  PUScrollViewSpeedometer *speedometer;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  if (!-[PUCarouselSharingViewController isViewLoaded](self, "isViewLoaded", a3))
    return;
  -[PUCarouselSharingViewController spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[PUCarouselSharingViewController _getMainCollectionViewFrame:collectionViewLayoutInsets:](self, "_getMainCollectionViewFrame:collectionViewLayoutInsets:", &v27, &v29);
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController mainCollectionViewLayout](self, "mainCollectionViewLayout");
  v6 = (PUPhotosSharingCollectionViewLayout *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interItemSpacingForWidth:", *(double *)&v28);
  if (v6)
  {
    if (v5)
      goto LABEL_4;
  }
  else
  {
    v16 = v7;
    v6 = objc_alloc_init(PUPhotosSharingCollectionViewLayout);
    -[PUPhotosSharingCollectionViewLayout setSharingBadgesCorner:](v6, "setSharingBadgesCorner:", objc_msgSend(v4, "selectionBadgeCorner"));
    objc_msgSend(v4, "selectionBadgeOffset");
    -[PUPhotosSharingCollectionViewLayout setSharingBadgesOffset:](v6, "setSharingBadgesOffset:");
    -[PUPhotosSharingCollectionViewLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:](v6, "_setWantsRightToLeftHorizontalMirroringIfNeeded:", 1);
    -[PUHorizontalTiledCollectionViewLayout setDelegate:](v6, "setDelegate:", self);
    -[PUCarouselSharingViewController _setMainCollectionViewLayout:](self, "_setMainCollectionViewLayout:", v6);
    -[PUHorizontalTiledCollectionViewLayout setInteritemSpacing:](v6, "setInteritemSpacing:", v16);
    if (v5)
      goto LABEL_4;
  }
  v17 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v5 = (void *)objc_msgSend(v17, "initWithFrame:collectionViewLayout:", v6, v27, v28);
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  -[PUCarouselSharingViewController _setMainCollectionView:](self, "_setMainCollectionView:", v5);
  -[PUCarouselSharingViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v5);

  objc_msgSend(v5, "setAlwaysBounceVertical:", 0);
  objc_msgSend(v5, "setAlwaysBounceHorizontal:", 1);
  objc_msgSend(v5, "setPagingEnabled:", 0);
  objc_msgSend(v5, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
  objc_msgSend(v5, "setDataSource:", self);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUPhotosSharingCellIdentifier"));
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUPhotosSharingSelectionBadgeKind"), CFSTR("PUPhotosSharingBadgeIdentifier"));
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUPhotosSharingOptionBadgeKind"), CFSTR("PUPhotosSharingOptionIdentifier"));
  objc_msgSend(v5, "setContentInsetAdjustmentBehavior:", 2);
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "photoCollectionViewBackgroundColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setBackgroundColor:", v20);
  v21 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapInMainCollectionView_);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v21;

  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_tapGestureRecognizer, "setNumberOfTapsRequired:", 1);
  -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_tapGestureRecognizer, "setNumberOfTouchesRequired:", 1);
  -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
  objc_msgSend(v5, "addGestureRecognizer:", self->_tapGestureRecognizer);
  v23 = objc_alloc_init(PUScrollViewSpeedometer);
  speedometer = self->_speedometer;
  self->_speedometer = v23;

  -[PUScrollViewSpeedometer setMediumLowerThreshold:](self->_speedometer, "setMediumLowerThreshold:", 100.0);
  -[PUScrollViewSpeedometer setMediumUpperThreshold:](self->_speedometer, "setMediumUpperThreshold:", 500.0);
  -[PUScrollViewSpeedometer setFastLowerThreshold:](self->_speedometer, "setFastLowerThreshold:", 500.0);
  -[PUScrollViewSpeedometer setFastUpperThreshold:](self->_speedometer, "setFastUpperThreshold:", 1000.0);
  -[PUScrollViewSpeedometer setDelegate:](self->_speedometer, "setDelegate:", self);

LABEL_4:
  objc_msgSend(v5, "setFrame:", v27, v28);
  v25 = 0;
  v26 = 0;
  -[PUCarouselSharingViewController _getFirstValidIndexPath:lastValidIndexPath:](self, "_getFirstValidIndexPath:lastValidIndexPath:", &v26, &v25);
  v8 = v26;
  v9 = v25;
  v10 = v9;
  if (v8 && v9)
  {
    -[PUCarouselSharingViewController _sizeForItemAtIndexPath:](self, "_sizeForItemAtIndexPath:", v8);
    v12 = v11;
    -[PUCarouselSharingViewController _sizeForItemAtIndexPath:](self, "_sizeForItemAtIndexPath:", v10);
    v13 = *((double *)&v29 + 1) + round((*(double *)&v28 - v12) * 0.5);
    v15 = *((double *)&v30 + 1) + round((*(double *)&v28 - v14) * 0.5);
    *((double *)&v29 + 1) = v13;
    *((double *)&v30 + 1) = v15;
  }
  else
  {
    v13 = *((double *)&v29 + 1);
    v15 = *((double *)&v30 + 1);
  }
  -[PUHorizontalTiledCollectionViewLayout setItemsContentInset:](v6, "setItemsContentInset:", *(double *)&v29, v13, *(double *)&v30, v15);

}

- (void)_setLoopingPlaybackAllowed:(BOOL)a3
{
  if (self->__loopingPlaybackAllowed != a3)
  {
    self->__loopingPlaybackAllowed = a3;
    -[PUCarouselSharingViewController _updateAdditionalContentForVisibleCells](self, "_updateAdditionalContentForVisibleCells");
  }
}

- (void)setReadyForInteraction:(BOOL)a3
{
  if (self->_readyForInteraction != a3)
  {
    self->_readyForInteraction = a3;
    -[PUCarouselSharingViewController _handlePhotoViewLoaderBlocks](self, "_handlePhotoViewLoaderBlocks");
  }
}

- (void)setSendAsAssetBundles:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_sendAsAssetBundles != a3)
  {
    self->_sendAsAssetBundles = a3;
    if (a3)
    {
      -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "orderedSelectedAssets");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v6);
            -[PUCarouselSharingViewController _activityAssetItemForAsset:createIfNecessary:](self, "_activityAssetItemForAsset:createIfNecessary:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), 0, (_QWORD)v13);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)objc_msgSend(v11, "copy");
            objc_msgSend(v12, "setExcludeLiveness:", 0);
            objc_msgSend(v12, "setExcludeLocation:", 0);
            objc_msgSend(v12, "setExcludeCaption:", 0);
            objc_msgSend(v12, "setExcludeAccessibilityDescription:", 0);
            -[PUCarouselSharingViewController _replaceActivityAssetItem:withAssetItem:notifyDelegate:](self, "_replaceActivityAssetItem:withAssetItem:notifyDelegate:", v11, v12, 0);

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v8);
      }

    }
    -[PUCarouselSharingViewController _updateVisibleCellBadges](self, "_updateVisibleCellBadges", (_QWORD)v13);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCarouselSharingViewController;
  -[PUCarouselSharingViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PUCarouselSharingViewController _updateMainViewAnimated:](self, "_updateMainViewAnimated:", 0);
  if (!-[PUCarouselSharingViewController _isViewInSyncWithModel](self, "_isViewInSyncWithModel"))
    -[PUCarouselSharingViewController _updateInterfaceForModelReloadAnimated:](self, "_updateInterfaceForModelReloadAnimated:", 0);
  -[PUCarouselSharingViewController _setLoopingPlaybackAllowed:](self, "_setLoopingPlaybackAllowed:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCarouselSharingViewController;
  -[PUCarouselSharingViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUCarouselSharingViewController _handlePhotoViewLoaderBlocks](self, "_handlePhotoViewLoaderBlocks");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUCarouselSharingViewController;
  -[PUCarouselSharingViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[PUCarouselSharingViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    self->_shouldPlayVitalityHintAfterViewDidAppear = 0;
  -[PUCarouselSharingViewController _setLoopingPlaybackAllowed:](self, "_setLoopingPlaybackAllowed:", 0);
}

- (id)_firstSelectedIndexPath
{
  void *v3;
  PHFetchResult *photoCollectionsFetchResult;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__74564;
  v12 = __Block_byref_object_dispose__74565;
  v13 = 0;
  -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  photoCollectionsFetchResult = self->_photoCollectionsFetchResult;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__PUCarouselSharingViewController__firstSelectedIndexPath__block_invoke;
  v7[3] = &unk_1E58A6B88;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateSelectedAssetsWithAssetCollectionOrdering:block:", photoCollectionsFetchResult, v7);
  v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _QWORD v20[2];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)PUCarouselSharingViewController;
  -[PUCarouselSharingViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[PUCarouselSharingViewController _updateMainViewAnimated:](self, "_updateMainViewAnimated:", 0);
  -[PUCarouselSharingViewController _setViewInSyncWithModel:](self, "_setViewInSyncWithModel:", 0);
  -[PUCarouselSharingViewController _lastKnownReferenceAsset](self, "_lastKnownReferenceAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  -[PUCarouselSharingViewController _lastKnownReferenceIndexPath](self, "_lastKnownReferenceIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PUCarouselSharingViewController _firstSelectedIndexPath](self, "_firstSelectedIndexPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCarouselSharingViewController _setLastKnownReferenceAsset:indexPath:](self, "_setLastKnownReferenceAsset:indexPath:", 0, v3);
LABEL_2:

  }
  -[PUCarouselSharingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoCollectionViewBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v7);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = *MEMORY[0x1E0DC4E28];
  v20[0] = *MEMORY[0x1E0DC4E10];
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), 0, sel__arrowKey_);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setWantsPriorityOverSystemBehavior:", 1);
        -[PUCarouselSharingViewController addKeyCommand:](self, "addKeyCommand:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v11);
  }

}

- (void)viewWillLayoutSubviews
{
  NSIndexPath *v3;
  NSIndexPath *inFlightReferenceIndexPath;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUCarouselSharingViewController;
  -[PUCarouselSharingViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  if (!self->_inFlightRotation && !self->_inFlightReferenceIndexPath)
  {
    -[PUCarouselSharingViewController currentIndexPath](self, "currentIndexPath");
    v3 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
    inFlightReferenceIndexPath = self->_inFlightReferenceIndexPath;
    self->_inFlightReferenceIndexPath = v3;

  }
  -[PUCarouselSharingViewController _updateMainViewAnimated:](self, "_updateMainViewAnimated:", 0);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  NSIndexPath *inFlightReferenceIndexPath;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUCarouselSharingViewController;
  -[PUCarouselSharingViewController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  -[PUCarouselSharingViewController photosSharingTransitionContext](self, "photosSharingTransitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_shouldScrollToSelection)
  {
    objc_msgSend(v3, "keyAssetIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      || (-[PUCarouselSharingViewController _firstSelectedIndexPath](self, "_firstSelectedIndexPath"),
          (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[PUCarouselSharingViewController _pageToIndexPath:animated:](self, "_pageToIndexPath:animated:", v5, 0);

    }
    self->_shouldScrollToSelection = 0;
  }
  if (!self->_inFlightRotation)
  {
    inFlightReferenceIndexPath = self->_inFlightReferenceIndexPath;
    self->_inFlightReferenceIndexPath = 0;

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  NSIndexPath *v9;
  NSIndexPath *inFlightReferenceIndexPath;
  NSIndexPath *v11;
  objc_super v12;
  _QWORD v13[5];
  _QWORD v14[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _indexPathOfCenterVisibleItemInCollectionView:](self, "_indexPathOfCenterVisibleItemInCollectionView:", v8);
  v9 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();

  inFlightReferenceIndexPath = self->_inFlightReferenceIndexPath;
  self->_inFlightReferenceIndexPath = v9;
  v11 = v9;

  self->_inFlightRotation = 1;
  v13[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__PUCarouselSharingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v14[3] = &unk_1E58A7A08;
  v14[4] = self;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__PUCarouselSharingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v13[3] = &unk_1E58A7A08;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v14, v13);
  v12.receiver = self;
  v12.super_class = (Class)PUCarouselSharingViewController;
  -[PUCarouselSharingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

- (void)setHideCellForCurrentReferenceAsset:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _indexPathOfCenterVisibleItemInCollectionView:](self, "_indexPathOfCenterVisibleItemInCollectionView:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_visibleSupplementaryViewOfKind:atIndexPath:", CFSTR("PUPhotosSharingSelectionBadgeKind"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_visibleSupplementaryViewOfKind:atIndexPath:", CFSTR("PUPhotosSharingOptionBadgeKind"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v3);
  objc_msgSend(v7, "setHidden:", v3);
  objc_msgSend(v8, "setHidden:", v3);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[PUCarouselSharingViewController _numberOfItemsInSection:](self, "_numberOfItemsInSection:", a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PUPhotosSharingCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _updateCell:forItemAtIndexPath:](self, "_updateCell:forItemAtIndexPath:", v7, v6);

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("PUPhotosSharingSelectionBadgeKind")))
  {
    -[PUCarouselSharingViewController _selectionViewAtIndexPath:forCollectionView:](self, "_selectionViewAtIndexPath:forCollectionView:", v11, v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("PUPhotosSharingOptionBadgeKind")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCarouselSharingViewController.m"), 1728, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PUCarouselSharingViewController _optionViewAtIndexPath:forCollectionView:](self, "_optionViewAtIndexPath:forCollectionView:", v11, v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  char isKindOfClass;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v13;
    v9 = objc_msgSend(v8, "currentImageRequestID");
    if ((_DWORD)v9)
    {
      -[PUCarouselSharingViewController cachingImageManager](self, "cachingImageManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cancelImageRequest:", v9);

      objc_msgSend(v8, "setCurrentImageRequestID:", 0);
    }
    objc_msgSend(v8, "photoView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setLivePhoto:", 0);
    objc_msgSend(v12, "setLoopingVideoAsset:", 0);
    objc_msgSend(v12, "setAnimatedImage:", 0);
    objc_msgSend(v12, "setLoopingPlaybackAllowed:", 0);

    v7 = v13;
  }

}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  id v8;

  v8 = a4;
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PUPhotosSharingOptionBadgeKind")))
    -[NSMapTable removeObjectForKey:](self->_indexPathsByOptionView, "removeObjectForKey:", v8);

}

- (CGSize)layout:(id)a3 collectionView:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  -[PUCarouselSharingViewController _sizeForItemAtIndexPath:](self, "_sizeForItemAtIndexPath:", a5, a4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)layout:(id)a3 collectionView:(id)a4 sizeForBadgeViewOfKind:(id)a5 forItemAtIndexPath:(id)a6
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v8 = a5;
  v9 = a6;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("PUPhotosSharingSelectionBadgeKind")))
  {
    -[PUCarouselSharingViewController spec](self, "spec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectionBadgeSize");
    v12 = v11;
    v14 = v13;
LABEL_7:

    goto LABEL_8;
  }
  v12 = *MEMORY[0x1E0C9D820];
  v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("PUPhotosSharingOptionBadgeKind")))
  {
    -[PUCarouselSharingViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "irisUIEnabled");

    if (v16 && objc_msgSend(v10, "canPlayPhotoIris"))
    {
      -[PUCarouselSharingViewController spec](self, "spec");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "optionBadgeSize");
      v12 = v18;
      v14 = v19;

    }
    goto LABEL_7;
  }
LABEL_8:

  v20 = v12;
  v21 = v14;
  result.height = v21;
  result.width = v20;
  return result;
}

- (double)layout:(id)a3 collectionView:(id)a4 bottomBadgeInsetforItemAtIndexPath:(id)a5
{
  void *v5;
  double v6;
  void *v7;
  int v8;

  -[PUCarouselSharingViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", a5, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "playbackStyle") == 4
    || (v6 = 0.0, objc_msgSend(v5, "playbackStyle") == 5)
    && (objc_msgSend(MEMORY[0x1E0D7B200], "sharedInstance"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "showLoopBadges"),
        v7,
        v8))
  {
    v6 = 24.0;
  }

  return v6;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  id v5;

  -[PUScrollViewSpeedometer scrollViewDidScroll:](self->_speedometer, "scrollViewDidScroll:", a3);
  -[PUCarouselSharingViewController _updatePreheatedAssets](self, "_updatePreheatedAssets");
  -[PUCarouselSharingViewController photosSharingTransitionContext](self, "photosSharingTransitionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PUCarouselSharingViewController _indexPathOfCenterVisibleItemInCollectionView:](self, "_indexPathOfCenterVisibleItemInCollectionView:", self->_mainCollectionView);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PUCarouselSharingViewController _setLastKnownReferenceAsset:indexPath:](self, "_setLastKnownReferenceAsset:indexPath:", 0, v5);

  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[PUScrollViewSpeedometer scrollViewWillBeginDragging:](self->_speedometer, "scrollViewWillBeginDragging:", a3);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  id v8;
  double v9;
  double v10;
  double v11;
  double y;
  double width;
  double height;
  double MidX;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  BOOL v31;
  _BOOL4 v32;
  double v33;
  double v34;
  void *v35;
  char v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  CGPoint *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;
  CGRect v50;

  x = a4.x;
  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "contentOffset");
  v10 = v9;
  v11 = a5->x;
  y = a5->y;
  objc_msgSend(v8, "bounds");
  width = v50.size.width;
  height = v50.size.height;
  v50.origin.x = v11;
  v50.origin.y = y;
  MidX = CGRectGetMidX(v50);
  -[PUCarouselSharingViewController mainCollectionViewLayout](self, "mainCollectionViewLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutAttributesForItemsInRect:", v11, y, width, height);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  v20 = v18;
  if (!v19)
    goto LABEL_23;
  v21 = v19;
  v41 = a5;
  v22 = *(_QWORD *)v43;
  v23 = 1.79769313e308;
  v24 = 1.79769313e308;
  do
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v43 != v22)
        objc_enumerationMutation(v18);
      v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      objc_msgSend(v26, "indexPath", v41);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCarouselSharingViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PUCarouselSharingViewController _shouldShowAsset:](self, "_shouldShowAsset:", v28))
      {
        -[PUCarouselSharingViewController _horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:](self, "_horizontalOffsetInCollectionView:forCenteringOnItemAtIndexPath:", v8, v27);
        v30 = v29;
        v31 = v29 > v10 && x > 0.0;
        v32 = v29 < v10 && x < 0.0;
        if (x == 0.0 || v31 || v32)
        {
          objc_msgSend(v26, "center");
          v34 = vabdd_f64(v33, MidX);
          if (v34 < v23)
          {
            v23 = v34;
            v24 = v30;
          }
        }
      }

    }
    v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  }
  while (v21);

  if (v24 != 1.79769313e308)
  {
    v41->x = v24;
    v41->y = 0.0;
    -[PUCarouselSharingViewController analyticsEventsSent](self, "analyticsEventsSent");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "containsObject:", CFSTR("com.apple.photos.CPAnalytics.shareSheetCarouselScrolled"));

    if ((v36 & 1) == 0)
    {
      v37 = (void *)MEMORY[0x1E0D09910];
      v46 = *MEMORY[0x1E0D09830];
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.shareSheetCarouselScrolled"), v40);

      -[PUCarouselSharingViewController analyticsEventsSent](self, "analyticsEventsSent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", CFSTR("com.apple.photos.CPAnalytics.shareSheetCarouselScrolled"));
LABEL_23:

    }
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  -[PUScrollViewSpeedometer scrollViewDidEndDragging:willDecelerate:](self->_speedometer, "scrollViewDidEndDragging:willDecelerate:", a3, a4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[PUScrollViewSpeedometer scrollViewDidEndDecelerating:](self->_speedometer, "scrollViewDidEndDecelerating:", a3);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  void (**v4)(void);

  -[PUCarouselSharingViewController _pptOnDidEndScrollingBlock](self, "_pptOnDidEndScrollingBlock", a3);
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PUCarouselSharingViewController _pptSetOnDidEndScrollingBlock:](self, "_pptSetOnDidEndScrollingBlock:", 0);
    v4[2]();
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  UITapGestureRecognizer *v7;
  void *v8;
  UITapGestureRecognizer *tapGestureRecognizer;
  char v10;
  id v11;

  v6 = a4;
  v7 = (UITapGestureRecognizer *)a3;
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  tapGestureRecognizer = self->_tapGestureRecognizer;

  if (tapGestureRecognizer == v7)
  {
    objc_msgSend(v8, "panGestureRecognizer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v6)
      v10 = objc_msgSend(v8, "isDecelerating");
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  v5 = a4;
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _indexPathInCollectionView:closestToPoint:](self, "_indexPathInCollectionView:closestToPoint:", v11, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", objc_msgSend(v12, "section"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController assetsInAssetCollection:](self, "assetsInAssetCollection:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v12, "item"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "canPlayPhotoIris"))
  {
    -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_visibleSupplementaryViewOfKind:atIndexPath:", CFSTR("PUPhotosSharingOptionBadgeKind"), v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  v18 = objc_msgSend(v17, "pointInside:withEvent:", 0, v8, v10) ^ 1;

  return v18;
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  void *v5;

  -[PUCarouselSharingViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    a3 = 1;

  if (!a3)
    NSLog(CFSTR("dismiss cancelled due to sharing action: %@"), self);
  return a3;
}

- (void)scrollViewSpeedometer:(id)a3 regimeDidChange:(int64_t)a4 from:(int64_t)a5
{
  void *v7;

  if (!self->_inFlightRotation)
  {
    -[PUCarouselSharingViewController cachingImageManager](self, "cachingImageManager", a3, a4, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsCachingHighQualityImages:", a4 < 1);

  }
  -[PUCarouselSharingViewController _setLoopingPlaybackAllowed:](self, "_setLoopingPlaybackAllowed:", a4 < 3, a4, a5);
}

- (CGRect)_frameAtIndexPath:(id)a3 inView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  v6 = a4;
  v7 = a3;
  -[PUCarouselSharingViewController mainCollectionViewLayout](self, "mainCollectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutAttributesForItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertRect:fromView:", v18, v11, v13, v15, v17);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGRect)oneUpAssetTransitionAssetFinalFrame:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
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
  CGRect result;

  -[PUCarouselSharingViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[PUCarouselSharingViewController currentIndexPath](self, "currentIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _frameAtIndexPath:inView:](self, "_frameAtIndexPath:inView:", v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)referenceAssetTransitionInfo
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  -[PUCarouselSharingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _indexPathOfCenterVisibleItemInCollectionView:](self, "_indexPathOfCenterVisibleItemInCollectionView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCarouselSharingViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _frameAtIndexPath:inView:](self, "_frameAtIndexPath:inView:", v5, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[PUCarouselSharingViewController _badgeTransitionInfosForCell:](self, "_badgeTransitionInfosForCell:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __63__PUCarouselSharingViewController_referenceAssetTransitionInfo__block_invoke;
  v27[3] = &unk_1E58A6BB0;
  v32 = v13;
  v33 = v15;
  v34 = v17;
  v35 = v19;
  v28 = v10;
  v29 = v7;
  v30 = v20;
  v31 = v8;
  v21 = v8;
  v22 = v20;
  v23 = v7;
  v24 = v10;
  +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:](PUAssetTransitionInfo, "assetTransitionInfoWithConfigurationBlock:", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)adjacentVisibleAssetsTransitionInfos
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v33;
  id obj;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  -[PUCarouselSharingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _indexPathOfCenterVisibleItemInCollectionView:](self, "_indexPathOfCenterVisibleItemInCollectionView:", v4);
  v35 = v4;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v5;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v39)
  {
    v37 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v50 != v37)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        if (v7 != v38)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "photoView");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "contentHelper");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "photoImage");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            v12 = v10;
          }
          else
          {
            objc_msgSend(v9, "placeHolderImage");
            v12 = (id)objc_claimAutoreleasedReturnValue();
          }
          v13 = v12;

          objc_msgSend(v35, "indexPathForCell:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUCarouselSharingViewController view](self, "view");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUCarouselSharingViewController _frameAtIndexPath:inView:](self, "_frameAtIndexPath:inView:", v14, v15);
          v17 = v16;
          v19 = v18;
          v21 = v20;
          v23 = v22;

          -[PUCarouselSharingViewController _assetAtIndexPath:](self, "_assetAtIndexPath:", v14);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUCarouselSharingViewController _badgeTransitionInfosForCell:](self, "_badgeTransitionInfosForCell:", v7);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __71__PUCarouselSharingViewController_adjacentVisibleAssetsTransitionInfos__block_invoke;
          v40[3] = &unk_1E58A6BB0;
          v45 = v17;
          v46 = v19;
          v47 = v21;
          v48 = v23;
          v41 = v13;
          v42 = v8;
          v43 = v25;
          v44 = v24;
          v26 = v24;
          v27 = v25;
          v28 = v8;
          v29 = v13;
          +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:](PUAssetTransitionInfo, "assetTransitionInfoWithConfigurationBlock:", v40);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v30);

        }
      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v39);
  }

  v31 = (void *)objc_msgSend(v36, "copy");
  return v31;
}

- (id)_badgeTransitionInfosForCell:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  PUPhotosSharingOptionView *v19;
  PUBadgeTransitionInfo *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  PUPhotosSharingSelectionView *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  PUBadgeTransitionInfo *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v41;
  void *v42;
  void *v43;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v5;
  objc_msgSend(v6, "indexPathForCell:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController spec](self, "spec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionBadgeOffset");
  v10 = v9;
  v12 = v11;

  objc_msgSend(v6, "collectionViewLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", CFSTR("PUPhotosSharingOptionBadgeKind"), v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *MEMORY[0x1E0C9D538];
  v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v43 = v14;
  objc_msgSend(v14, "frame");
  v19 = -[PUPhotosSharingOptionView initWithFrame:]([PUPhotosSharingOptionView alloc], "initWithFrame:", v15, v16, v17, v18);
  -[PUCarouselSharingViewController _updateOptionView:atIndexPath:](self, "_updateOptionView:atIndexPath:", v19, v7);
  -[PUPhotosSharingOptionView layoutSubviews](v19, "layoutSubviews");
  v20 = objc_alloc_init(PUBadgeTransitionInfo);
  -[PUBadgeTransitionInfo setSnapshotView:](v20, "setSnapshotView:", v19);
  -[PUCarouselSharingViewController spec](self, "spec");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUBadgeTransitionInfo setBadgesCorner:](v20, "setBadgesCorner:", objc_msgSend(v21, "optionBadgeCorner"));

  -[PUBadgeTransitionInfo setBadgesOffset:](v20, "setBadgesOffset:", v10, v12);
  objc_msgSend(v14, "frame");
  objc_msgSend(v5, "convertRect:fromView:", v6);
  -[PUBadgeTransitionInfo setFrame:](v20, "setFrame:");
  objc_msgSend(v42, "addObject:", v20);
  objc_msgSend(v6, "collectionViewLayout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", CFSTR("PUPhotosSharingSelectionBadgeKind"), v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "frame");
  v26 = -[PUPhotosSharingSelectionView initWithFrame:]([PUPhotosSharingSelectionView alloc], "initWithFrame:", v15, v16, v24, v25);
  -[PUCarouselSharingViewController _photoCollectionAtIndex:](self, "_photoCollectionAtIndex:", objc_msgSend(v7, "section"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController photoSelectionManager](self, "photoSelectionManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v7, "item"), v27);

  -[PUPhotosSharingSelectionView setSelected:](v26, "setSelected:", v29);
  v30 = objc_alloc_init(PUBadgeTransitionInfo);
  -[PUBadgeTransitionInfo setSnapshotView:](v30, "setSnapshotView:", v26);
  -[PUCarouselSharingViewController spec](self, "spec");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUBadgeTransitionInfo setBadgesCorner:](v30, "setBadgesCorner:", objc_msgSend(v31, "selectionBadgeCorner"));

  -[PUBadgeTransitionInfo setBadgesOffset:](v30, "setBadgesOffset:", v10, v12);
  objc_msgSend(v23, "frame");
  objc_msgSend(v41, "convertRect:fromView:", v6);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  -[PUBadgeTransitionInfo setFrame:](v30, "setFrame:", v33, v35, v37, v39);
  objc_msgSend(v42, "addObject:", v30);

  return v42;
}

- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(id, void *);
  _QWORD v29[4];
  id v30;
  PUCarouselSharingViewController *v31;
  id v32;

  v28 = (void (**)(id, void *))a4;
  -[PUCarouselSharingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[PUCarouselSharingViewController mainCollectionView](self, "mainCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _indexPathOfCenterVisibleItemInCollectionView:](self, "_indexPathOfCenterVisibleItemInCollectionView:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCarouselSharingViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController _frameAtIndexPath:inView:](self, "_frameAtIndexPath:inView:", v7, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v14, v16, v18, v20);
  objc_msgSend(v21, "setImage:", v11);
  objc_msgSend(v21, "setClipsToBounds:", 1);
  objc_msgSend(v21, "setContentMode:", 2);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __95__PUCarouselSharingViewController_oneUpAssetTransition_requestTransitionContextWithCompletion___block_invoke;
  v29[3] = &unk_1E58A9EA0;
  v22 = v11;
  v30 = v22;
  v31 = self;
  v23 = v7;
  v32 = v23;
  +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:](PUAssetTransitionInfo, "assetTransitionInfoWithConfigurationBlock:", v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCarouselSharingViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUOneUpAssetTransitionContext oneUpAssetTransitionContextWithContainerView:fromView:snapshotView:transitionInfo:](PUOneUpAssetTransitionContext, "oneUpAssetTransitionContextWithContainerView:fromView:snapshotView:transitionInfo:", 0, v25, v21, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "oneUpTransitionContextWithContextShouldHideBackground:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    v28[2](v28, v27);

}

- (void)photoViewContentHelper:(id)a3 livePhotoWillBeginPlaybackWithStyle:(int64_t)a4
{
  -[UITapGestureRecognizer pu_cancel](self->_tapGestureRecognizer, "pu_cancel", a3, a4);
}

- (OS_os_log)sharingLog
{
  if (sharingLog_onceToken != -1)
    dispatch_once(&sharingLog_onceToken, &__block_literal_global_74527);
  return (OS_os_log *)(id)sharingLog_sharingLog;
}

- (PHFetchResult)photoCollectionsFetchResult
{
  return self->_photoCollectionsFetchResult;
}

- (PUPhotoSelectionManager)photoSelectionManager
{
  return self->_photoSelectionManager;
}

- (void)setPhotoSelectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_photoSelectionManager, a3);
}

- (PUCarouselSharingViewControllerDelegate)delegate
{
  return (PUCarouselSharingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isReadyForInteraction
{
  return self->_readyForInteraction;
}

- (BOOL)sendAsAssetBundles
{
  return self->_sendAsAssetBundles;
}

- (BOOL)sendAsUnmodifiedOriginals
{
  return self->_sendAsUnmodifiedOriginals;
}

- (void)setSendAsUnmodifiedOriginals:(BOOL)a3
{
  self->_sendAsUnmodifiedOriginals = a3;
}

- (PUPhotosSharingViewControllerSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (UICollectionView)mainCollectionView
{
  return self->_mainCollectionView;
}

- (void)_setMainCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_mainCollectionView, a3);
}

- (PUPhotosSharingCollectionViewLayout)mainCollectionViewLayout
{
  return self->_mainCollectionViewLayout;
}

- (void)_setMainCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_mainCollectionViewLayout, a3);
}

- (BOOL)_isViewInSyncWithModel
{
  return self->__viewInSyncWithModel;
}

- (void)_setViewInSyncWithModel:(BOOL)a3
{
  self->__viewInSyncWithModel = a3;
}

- (PHCachingImageManager)cachingImageManager
{
  return self->_cachingImageManager;
}

- (CGRect)_previousPreheatRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__previousPreheatRect.origin.x;
  y = self->__previousPreheatRect.origin.y;
  width = self->__previousPreheatRect.size.width;
  height = self->__previousPreheatRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setPreviousPreheatRect:(CGRect)a3
{
  self->__previousPreheatRect = a3;
}

- (NSMutableSet)_preheatedAssets
{
  return self->__preheatedAssets;
}

- (void)_setPreheatedAssets:(id)a3
{
  objc_storeStrong((id *)&self->__preheatedAssets, a3);
}

- (UICollectionViewLayout)_transitionLayout
{
  return self->__transitionLayout;
}

- (void)_setTransitionLayout:(id)a3
{
  objc_storeStrong((id *)&self->__transitionLayout, a3);
}

- (PUPhotosSharingTransitionContext)photosSharingTransitionContext
{
  return self->_photosSharingTransitionContext;
}

- (PUAssetTransitionInfo)assetTransitionInfo
{
  return self->_assetTransitionInfo;
}

- (void)setAssetTransitionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_assetTransitionInfo, a3);
}

- (PUAssetTransitionInfo)leadingAssetTransitionInfo
{
  return self->_leadingAssetTransitionInfo;
}

- (PUAssetTransitionInfo)trailingAssetTransitionInfo
{
  return self->_trailingAssetTransitionInfo;
}

- (PHAsset)_lastKnownReferenceAsset
{
  return self->__lastKnownReferenceAsset;
}

- (void)_setLastKnownReferenceAsset:(id)a3
{
  objc_storeStrong((id *)&self->__lastKnownReferenceAsset, a3);
}

- (NSIndexPath)_lastKnownReferenceIndexPath
{
  return self->__lastKnownReferenceIndexPath;
}

- (BOOL)_isLoopingPlaybackAllowed
{
  return self->__loopingPlaybackAllowed;
}

- (PXAssetBadgeManager)_badgeManager
{
  return self->__badgeManager;
}

- (id)_pptOnDidEndScrollingBlock
{
  return self->__pptOnDidEndScrollingBlock;
}

- (void)_pptSetOnDidEndScrollingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1152);
}

- (NSMutableArray)_photoViewLoaderBlocks
{
  return self->__photoViewLoaderBlocks;
}

- (NSMutableArray)_livePhotoViewLoaderBlocks
{
  return self->__livePhotoViewLoaderBlocks;
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (void)setPhotosDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_photosDataSource, a3);
}

- (void)setAnalyticsEventsSent:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsEventsSent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventsSent, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->__livePhotoViewLoaderBlocks, 0);
  objc_storeStrong((id *)&self->__photoViewLoaderBlocks, 0);
  objc_storeStrong(&self->__pptOnDidEndScrollingBlock, 0);
  objc_storeStrong((id *)&self->__badgeManager, 0);
  objc_storeStrong((id *)&self->__lastKnownReferenceIndexPath, 0);
  objc_storeStrong((id *)&self->__lastKnownReferenceAsset, 0);
  objc_storeStrong((id *)&self->_trailingAssetTransitionInfo, 0);
  objc_storeStrong((id *)&self->_leadingAssetTransitionInfo, 0);
  objc_storeStrong((id *)&self->_assetTransitionInfo, 0);
  objc_storeStrong((id *)&self->_photosSharingTransitionContext, 0);
  objc_storeStrong((id *)&self->__transitionLayout, 0);
  objc_storeStrong((id *)&self->__preheatedAssets, 0);
  objc_storeStrong((id *)&self->_cachingImageManager, 0);
  objc_storeStrong((id *)&self->_mainCollectionViewLayout, 0);
  objc_storeStrong((id *)&self->_mainCollectionView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photoSelectionManager, 0);
  objc_storeStrong((id *)&self->_photoCollectionsFetchResult, 0);
  objc_storeStrong((id *)&self->_inFlightReferenceIndexPath, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indexPathsByOptionView, 0);
  objc_storeStrong((id *)&self->_assetItemsByAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_resultsForAssetCollection, 0);
  objc_storeStrong((id *)&self->_speedometer, 0);
}

void __45__PUCarouselSharingViewController_sharingLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "PUPhotosSharingViewController");
  v1 = (void *)sharingLog_sharingLog;
  sharingLog_sharingLog = (uint64_t)v0;

}

void __95__PUCarouselSharingViewController_oneUpAssetTransition_requestTransitionContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setImage:", v3);
  objc_msgSend(*(id *)(a1 + 40), "_assetAtIndexPath:", *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAsset:", v5);

}

void __71__PUCarouselSharingViewController_adjacentVisibleAssetsTransitionInfos__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "setImage:", v3);
  objc_msgSend(v6, "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "contentHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cornerRadius");
  objc_msgSend(v6, "setCornerRadius:");

  objc_msgSend(v6, "setBadgeTransitionInfos:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "contentHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentHelper:", v5);

  objc_msgSend(v6, "setAsset:", *(_QWORD *)(a1 + 56));
}

void __63__PUCarouselSharingViewController_referenceAssetTransitionInfo__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "setImage:", v3);
  objc_msgSend(v6, "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "contentHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cornerRadius");
  objc_msgSend(v6, "setCornerRadius:");

  objc_msgSend(v6, "setBadgeTransitionInfos:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "contentHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentHelper:", v5);

  objc_msgSend(v6, "setAsset:", *(_QWORD *)(a1 + 56));
}

_QWORD *__86__PUCarouselSharingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  _QWORD *result;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSuspended");

  objc_msgSend(*(id *)(a1 + 32), "_updateMainViewAnimated:", 0);
  result = *(_QWORD **)(a1 + 32);
  if (result[126])
  {
    objc_msgSend(result, "mainCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_pageToIndexPath:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008), v3 ^ 1u);
  }
  return result;
}

uint64_t __86__PUCarouselSharingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_resetPreheating");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1008);
  *(_QWORD *)(v2 + 1008) = 0;

  result = objc_msgSend(*(id *)(a1 + 32), "_updateLastKnownReferenceIndexPath");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1017) = 0;
  return result;
}

void __58__PUCarouselSharingViewController__firstSelectedIndexPath__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  *a5 = 1;
}

void __68__PUCarouselSharingViewController_photoLibraryDidChangeOnMainQueue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "changeDetailsForFetchResult:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "hasMoves") & 1) == 0 && objc_msgSend(v6, "hasIncrementalChanges"))
    {
      objc_msgSend(v6, "insertedIndexes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {

      }
      else
      {
        objc_msgSend(v6, "removedIndexes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (!v9)
        {
LABEL_8:
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v10);
          goto LABEL_9;
        }
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_8;
  }
LABEL_9:

}

void __68__PUCarouselSharingViewController_photoLibraryDidChangeOnMainQueue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
  v5 = a2;
  objc_msgSend(a3, "fetchResultAfterChanges");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

void __63__PUCarouselSharingViewController__handlePhotoViewLoaderBlocks__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_playVitalityHintAfterViewDidAppear");

}

void __63__PUCarouselSharingViewController__handlePhotoViewLoaderBlocks__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_msgSend(WeakRetained, "_appearState");

  if (v3 == 2)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v6);
    }

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = *(id *)(a1 + 40);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13));
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v11);
    }

    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
  }
}

uint64_t __63__PUCarouselSharingViewController__handlePhotoViewLoaderBlocks__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__PUCarouselSharingViewController__indexPathOfAsset_sectionHint___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "assetsInAssetCollection:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", *(_QWORD *)(a1 + 40));

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v8, a3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

void __87__PUCarouselSharingViewController__handleSchedulingLivePhotoRequestResult_forCell_tag___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleLivePhotoRequestResult:forCell:tag:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

void __88__PUCarouselSharingViewController__handleSchedulingStillPhotoRequestResult_forCell_tag___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleStillPhotoRequestResult:forCell:tag:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

void __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13[2];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_copyWeak(v13, a1 + 6);
  v10 = v7;
  v11 = a1[4];
  v12 = a1[5];
  v13[1] = a1[7];
  px_dispatch_on_main_queue();

  objc_destroyWeak(v13);
}

void __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13[2];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_copyWeak(v13, a1 + 6);
    v10 = v5;
    v11 = a1[4];
    v12 = a1[5];
    v13[1] = a1[7];
    px_dispatch_on_main_queue();

    objc_destroyWeak(v13);
  }
  else
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C58]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Did not load animated image for playback in the share sheet. In cloud = %@. Error = %@", buf, 0x16u);

    }
  }

}

void __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke_167(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12[2];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_copyWeak(v12, a1 + 5);
    v10 = v5;
    v11 = a1[4];
    v12[1] = a1[6];
    px_dispatch_on_main_queue();

    objc_destroyWeak(v12);
  }
  else
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C58]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Did not load live photo for playback in the share sheet. In cloud = %@. Error = %@", buf, 0x16u);

    }
  }

}

void __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke_2_168(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleSchedulingLivePhotoRequestResult:forCell:tag:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

void __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleAnimatedImageResult:forCell:asset:tag:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));

}

void __73__PUCarouselSharingViewController__updateAdditionalContentForAsset_cell___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleLoopingVideoRequestResult:forCell:asset:tag:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));

}

void __73__PUCarouselSharingViewController__updatePhotoForAsset_cell_atIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7 && objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 56))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_handleStillImageRequestResult:info:forCell:indexPath:", v7, v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

@end
