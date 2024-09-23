@implementation PXContentSyndicationGadget

- (PXContentSyndicationGadget)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationGadget.m"), 85, CFSTR("%s is not available as initializer"), "-[PXContentSyndicationGadget init]");

  abort();
}

- (PXContentSyndicationGadget)initWithAssetFetchResultProvider:(id)a3 imageProvider:(id)a4 socialLayerHighlightProvider:(id)a5
{
  id v10;
  id v11;
  id v12;
  PXContentSyndicationGadget *v13;
  PXContentSyndicationGadget *v14;
  PXContentSyndicationGadgetViewModel *v15;
  PXContentSyndicationGadgetViewModel *viewModel;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationGadget.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageProvider"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationGadget.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetFetchResultProvider"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationGadget.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("socialLayerHighlightProvider"));

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)PXContentSyndicationGadget;
  v13 = -[PXContentSyndicationGadget init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_keyImagesAssetFetchResultProvider, a3);
    objc_storeStrong((id *)&v14->_imageProvider, a4);
    objc_storeStrong((id *)&v14->_socialLayerHighlightProvider, a5);
    v15 = objc_alloc_init(PXContentSyndicationGadgetViewModel);
    viewModel = v14->_viewModel;
    v14->_viewModel = v15;

  }
  return v14;
}

- (void)setContentSyndicationItem:(id)a3
{
  PXContentSyndicationItem *v5;
  void *v6;
  PXContentSyndicationItem *v7;
  BOOL v8;
  PXContentSyndicationItem *v9;

  v9 = (PXContentSyndicationItem *)a3;
  v5 = self->_contentSyndicationItem;
  v6 = v9;
  if (v5 == v9)
    goto LABEL_4;
  v7 = v5;
  v8 = -[PXContentSyndicationItem isEqual:](v5, "isEqual:", v9);

  if (!v8)
  {
    objc_storeStrong((id *)&self->_contentSyndicationItem, a3);
    -[PXContentSyndicationGadget _refreshGadgetContents](self, "_refreshGadgetContents");
    -[PXContentSyndicationItem assetCollection](v9, "assetCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentSyndicationGadget setInitialAssetCollection:](self, "setInitialAssetCollection:", v6);
LABEL_4:

  }
}

- (void)setInitialAssetCollection:(id)a3
{
  PXDisplayAssetCollection *v5;
  PXDisplayAssetCollection *initialAssetCollection;
  PXDisplayAssetFetchResult *keyImagesAssetFetchResult;
  NSObject *v8;
  int v9;
  PXContentSyndicationGadget *v10;
  __int16 v11;
  PXDisplayAssetCollection *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (PXDisplayAssetCollection *)a3;
  initialAssetCollection = self->_initialAssetCollection;
  if (initialAssetCollection != v5)
  {
    if (initialAssetCollection)
      -[PXContentSyndicationAssetFetchResultProvider unregisterChangeObserver:forAssetCollection:](self->_keyImagesAssetFetchResultProvider, "unregisterChangeObserver:forAssetCollection:", self);
    objc_storeStrong((id *)&self->_initialAssetCollection, a3);
    keyImagesAssetFetchResult = self->_keyImagesAssetFetchResult;
    self->_keyImagesAssetFetchResult = 0;

    if (self->_initialAssetCollection)
    {
      PLSyndicationUIGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134218242;
        v10 = self;
        v11 = 2114;
        v12 = v5;
        _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "ContentSyndicationGadget %p: Setting initial asset collection: %{public}@", (uint8_t *)&v9, 0x16u);
      }

      -[PXContentSyndicationAssetFetchResultProvider registerChangeObserver:forAssetCollection:](self->_keyImagesAssetFetchResultProvider, "registerChangeObserver:forAssetCollection:", self, self->_initialAssetCollection);
    }
    -[PXContentSyndicationGadget _fetchKeyImages](self, "_fetchKeyImages");
  }

}

- (void)setAssetCollection:(id)a3
{
  PXDisplayAssetCollection *v5;
  PXDisplayAssetCollection *v6;
  PXDisplayAssetCollection *v7;
  char v8;
  NSObject *v9;
  int v10;
  PXContentSyndicationGadget *v11;
  __int16 v12;
  PXDisplayAssetCollection *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (PXDisplayAssetCollection *)a3;
  v6 = self->_assetCollection;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXDisplayAssetCollection isEqual:](v6, "isEqual:", v5);

    if ((v8 & 1) == 0)
    {
      PLSyndicationUIGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 134218242;
        v11 = self;
        v12 = 2114;
        v13 = v5;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "ContentSyndicationGadget %p: Setting real asset collection: %{public}@", (uint8_t *)&v10, 0x16u);
      }

      objc_storeStrong((id *)&self->_assetCollection, a3);
      if (self->_assetCollection)
        -[PXContentSyndicationCountsController setAssetCollection:](self->_countsController, "setAssetCollection:");
      -[PXContentSyndicationGadget _refreshGadgetContents](self, "_refreshGadgetContents");
    }
  }

}

- (void)setReferenceAssetForSocialLayerHighlight:(id)a3
{
  PXDisplayAsset *v4;
  PXDisplayAsset *v5;
  char v6;
  PXDisplayAsset *v7;
  PXDisplayAsset *referenceAssetForSocialLayerHighlight;
  PXDisplayAsset *v9;

  v9 = (PXDisplayAsset *)a3;
  v4 = self->_referenceAssetForSocialLayerHighlight;
  if (v4 == v9)
  {

  }
  else
  {
    v5 = v4;
    v6 = -[PXDisplayAsset isEqual:](v4, "isEqual:", v9);

    if ((v6 & 1) == 0)
    {
      if (self->_referenceAssetForSocialLayerHighlight)
        -[PXContentSyndicationSocialLayerHighlightProvider unregisterChangeObserver:forAsset:](self->_socialLayerHighlightProvider, "unregisterChangeObserver:forAsset:", self);
      v7 = (PXDisplayAsset *)-[PXDisplayAsset copyWithZone:](v9, "copyWithZone:", 0);
      referenceAssetForSocialLayerHighlight = self->_referenceAssetForSocialLayerHighlight;
      self->_referenceAssetForSocialLayerHighlight = v7;

      if (self->_referenceAssetForSocialLayerHighlight)
        -[PXContentSyndicationSocialLayerHighlightProvider registerChangeObserver:forAsset:](self->_socialLayerHighlightProvider, "registerChangeObserver:forAsset:", self);
    }
  }

}

- (PXRegionOfInterest)regionOfInterestForOneUpTransition
{
  void *v2;
  void *v3;

  -[PXContentSyndicationGadget view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regionOfInterestForOneUpTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXRegionOfInterest *)v3;
}

- (BOOL)contentViewHiddenForOneUpTransition
{
  void *v2;
  char v3;

  -[PXContentSyndicationGadget view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentViewHiddenForOneUpTransition");

  return v3;
}

- (void)setContentViewHiddenForOneUpTransition:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PXContentSyndicationGadget view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentViewHiddenForOneUpTransition:", v3);

}

- (void)_retrieveAssetCollectionIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  PXContentSyndicationGadget *v12;
  uint8_t buf[4];
  PXContentSyndicationGadget *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PXContentSyndicationGadget assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    return;
  }
  if (-[PXDisplayAssetFetchResult count](self->_keyImagesAssetFetchResult, "count") >= 1)
  {
    -[PXDisplayAssetFetchResult firstObject](self->_keyImagesAssetFetchResult, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;

      if (v5)
      {
        if (_retrieveAssetCollectionIfNeeded_predicate != -1)
          dispatch_once(&_retrieveAssetCollectionIfNeeded_predicate, &__block_literal_global_4643);
        PLSyndicationUIGetLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v14 = self;
          _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "ContentSyndicationGadget %p: Queueing real asset collection fetch, in background", buf, 0xCu);
        }

        v7 = _retrieveAssetCollectionIfNeeded__fetchQueue;
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __62__PXContentSyndicationGadget__retrieveAssetCollectionIfNeeded__block_invoke_143;
        v10[3] = &unk_1E5148D08;
        v8 = v5;
        v11 = v8;
        v12 = self;
        dispatch_async(v7, v10);

        goto LABEL_14;
      }
    }
    else
    {

    }
    -[PXContentSyndicationGadget initialAssetCollection](self, "initialAssetCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentSyndicationGadget setAssetCollection:](self, "setAssetCollection:", v9);

    v8 = 0;
LABEL_14:

  }
}

- (unint64_t)gadgetType
{
  return 21;
}

- (unint64_t)gadgetCapabilities
{
  return 2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PXContentSyndicationGadget viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXContentSyndicationGadgetView sizeThatFits:viewModel:](PXContentSyndicationGadgetView, "sizeThatFits:viewModel:", v5, width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setGadgetSpec:(id)a3
{
  PXGadgetSpec *v5;
  PXGadgetSpec *v6;
  BOOL v7;
  PXGadgetSpec *v8;

  v8 = (PXGadgetSpec *)a3;
  v5 = self->_gadgetSpec;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXGadgetSpec isEqual:](v5, "isEqual:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_gadgetSpec, a3);
      -[PXContentSyndicationGadget _fetchKeyImages](self, "_fetchKeyImages");
    }
  }

}

- (Class)collectionViewItemClass
{
  return (Class)objc_opt_class();
}

- (void)prepareCollectionViewItem:(id)a3
{
  PXContentSyndicationGadgetView *view;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  PXContentSyndicationGadgetView *v11;

  v11 = (PXContentSyndicationGadgetView *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationGadget.m"), 245, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collectionViewItem"), v8);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentSyndicationGadgetView px_descriptionForAssertionMessage](v11, "px_descriptionForAssertionMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationGadget.m"), 245, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collectionViewItem"), v8, v10);

    goto LABEL_6;
  }
LABEL_3:
  view = self->_view;
  self->_view = v11;

  -[PXContentSyndicationGadgetView setViewModel:](self->_view, "setViewModel:", self->_viewModel);
  -[PXContentSyndicationGadgetView setDelegate:](self->_view, "setDelegate:", self);
  -[PXContentSyndicationGadget _refreshGadgetContents](self, "_refreshGadgetContents");
  -[PXContentSyndicationGadget _fetchKeyImages](self, "_fetchKeyImages");

}

- (void)_presentDetailViewController
{
  if (-[PXDisplayAssetFetchResult count](self->_keyImagesAssetFetchResult, "count") < 2)
    -[PXContentSyndicationGadget presentOneUpAnimated:](self, "presentOneUpAnimated:", 1);
  else
    -[PXContentSyndicationGadget presentGridAnimated:](self, "presentGridAnimated:", 1);
}

- (void)presentGridAnimated:(BOOL)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  PXFooterViewModel *v8;
  PXFooterViewModel *gridFooterViewModel;
  NSObject *v10;
  PXPhotosUIViewController *v11;
  void *v12;
  int v13;
  PXContentSyndicationGadget *v14;
  __int16 v15;
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PLSyndicationUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PXContentSyndicationGadget contentSyndicationItem](self, "contentSyndicationItem");
    v5 = objc_claimAutoreleasedReturnValue();
    v13 = 134218242;
    v14 = self;
    v15 = 2114;
    v16 = v5;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "ContentSyndicationGadget %p: Presenting grid from content syndication item: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  -[PXContentSyndicationGadget assetCollection](self, "assetCollection");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_16;
  -[PXContentSyndicationGadget initialAssetCollection](self, "initialAssetCollection");
  v6 = objc_claimAutoreleasedReturnValue();
  PLSyndicationUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218242;
    v14 = self;
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "ContentSyndicationGadget %p: The real asset collection was not (yet) available when presenting the grid. Falling back to initial asset collection: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  if (v6)
  {
LABEL_16:
    if (!self->_gridFooterViewModel)
    {
      v8 = objc_alloc_init(PXFooterViewModel);
      gridFooterViewModel = self->_gridFooterViewModel;
      self->_gridFooterViewModel = v8;

    }
    -[PXContentSyndicationGadget _updateCounts](self, "_updateCounts");
    PXPhotosViewConfigurationForAssetCollectionWithExistingAssetsFetchResult(v6, 0, 0, 0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject setContentStartingPosition:](v10, "setContentStartingPosition:", 1);
    -[NSObject setNavBarStyle:](v10, "setNavBarStyle:", 0);
    -[NSObject setShouldOptOutOfChromelessBars:](v10, "setShouldOptOutOfChromelessBars:", 1);
    -[NSObject setSectionHeaderStyle:](v10, "setSectionHeaderStyle:", 3);
    -[NSObject setAllowedActions:](v10, "setAllowedActions:", -[NSObject allowedActions](v10, "allowedActions") | 0x40000);
    -[NSObject setWantsOneUpShowInLibraryButton:](v10, "setWantsOneUpShowInLibraryButton:", 1);
    -[NSObject setFooterViewModel:](v10, "setFooterViewModel:", self->_gridFooterViewModel);
    -[NSObject setOneUpPresentationOrigin:](v10, "setOneUpPresentationOrigin:", 16);
    v11 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v10);
    -[PXContentSyndicationGadget delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "gadget:transitionToViewController:animated:completion:", self, v11, 1, 0);

    -[PXContentSyndicationGadget _donateUserActivityForAssetCollectionIfNeeded](self, "_donateUserActivityForAssetCollectionIfNeeded");
  }
  else
  {
    PLSyndicationUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    -[PXContentSyndicationGadget contentSyndicationItem](self, "contentSyndicationItem");
    v10 = objc_claimAutoreleasedReturnValue();
    v13 = 134218242;
    v14 = self;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "ContentSyndicationGadget %p: Attempted to present a grid from content syndication item: %{public}@, but neither initial or real asset collection was available. Skipping.", (uint8_t *)&v13, 0x16u);
  }

LABEL_11:
}

- (void)_donateUserActivityForAssetCollectionIfNeeded
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  PXContentSyndicationGadget *v11;
  _QWORD v12[4];
  id v13;

  if (objc_msgSend(MEMORY[0x1E0CA5920], "px_allowsDonationsForCurrentProcess"))
  {
    -[PXContentSyndicationGadget assetCollection](self, "assetCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[PXContentSyndicationGadget assetCollection](self, "assetCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
        v7 = (void *)MEMORY[0x1E0CA5920];
        v8 = MEMORY[0x1E0C809B0];
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __75__PXContentSyndicationGadget__donateUserActivityForAssetCollectionIfNeeded__block_invoke;
        v12[3] = &unk_1E5136628;
        v13 = v6;
        v9[0] = v8;
        v9[1] = 3221225472;
        v9[2] = __75__PXContentSyndicationGadget__donateUserActivityForAssetCollectionIfNeeded__block_invoke_2;
        v9[3] = &unk_1E5124740;
        v10 = v5;
        v11 = self;
        objc_msgSend(v7, "px_requestActivityWithActivityType:titleProvider:completionBlock:", CFSTR("com.apple.mobileslideshow.album"), v12, v9);

      }
    }
  }
}

- (void)presentOneUpAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  PXDisplayAssetFetchResult *keyImagesAssetFetchResult;
  int v11;
  uint64_t v12;
  __int16 v13;
  PXContentSyndicationGadget *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  PXDisplayAssetFetchResult *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[PXDisplayAssetFetchResult firstObject](self->_keyImagesAssetFetchResult, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXContentSyndicationGadget delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentSyndicationGadget:presentOneUpAnimated:asset:", self, v3, v5);

  }
  else
  {
    PLSyndicationUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      keyImagesAssetFetchResult = self->_keyImagesAssetFetchResult;
      v11 = 138544130;
      v12 = v8;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = v9;
      v17 = 2048;
      v18 = keyImagesAssetFetchResult;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "<%{public}@:%p> Ignoring attempt to present 1up with no key asset. Fetch result: <%{public}@:%p>", (uint8_t *)&v11, 0x2Au);
    }

  }
}

- (id)_makePresentationEnvironment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PXContentSyndicationGadget delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gadgetViewControllerHostingGadget:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXContentSyndicationGadget view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXViewControllerPresenter popoverPresenterWithViewController:sourceItem:](PXViewControllerPresenter, "popoverPresenterWithViewController:sourceItem:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_createActionForType:(id)a3 image:(id)a4 attributes:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  -[PXContentSyndicationGadget contentSyndicationItem](self, "contentSyndicationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetCollectionActionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "canPerformActionType:", v8))
  {
    objc_msgSend(v11, "localizedTitleForActionType:useCase:", v8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0DC3428];
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __68__PXContentSyndicationGadget__createActionForType_image_attributes___block_invoke;
    v19 = &unk_1E5145928;
    v20 = v11;
    v21 = v8;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v12, v9, 0, &v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAttributes:", a5, v16, v17, v18, v19);
    objc_destroyWeak(&v22);

  }
  else
  {
    v14 = 0;
  }

  objc_destroyWeak(&location);
  return v14;
}

- (id)targetPreviewViewForLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  CGPoint v29;
  CGRect v30;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXContentSyndicationGadget view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[PXContentSyndicationGadget view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "convertRect:toCoordinateSpace:", v7, v10, v12, v14, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v30.origin.x = v19;
  v30.origin.y = v21;
  v30.size.width = v23;
  v30.size.height = v25;
  v29.x = x;
  v29.y = y;
  if (CGRectContainsPoint(v30, v29))
  {
    -[PXContentSyndicationGadget view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "previewView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }
  return v27;
}

- (id)previewParametersForTargetPreviewView:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_alloc_init(MEMORY[0x1E0DC3508]);
  objc_msgSend(v3, "setShadowPath:", v5);

  return v3;
}

- (id)contextMenuWithSuggestedActions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(void *, const __CFString *, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD aBlock[5];
  id v30;
  id location;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PXContentSyndicationGadget_contextMenuWithSuggestedActions___block_invoke;
  aBlock[3] = &unk_1E5116D80;
  aBlock[4] = self;
  v6 = v4;
  v30 = v6;
  v7 = (void (**)(void *, const __CFString *, void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.down"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, CFSTR("PXAssetCollectionActionTypeContentSyndicationSaveToLibrary"), v8, 0);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  -[PXContentSyndicationGadget view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "replyActionFromAttributionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v9, "addObject:", v11);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContentSyndicationGadget _createActionForType:image:attributes:](self, "_createActionForType:image:attributes:", CFSTR("PXAssetCollectionActionTypeContentSyndicationRemoveSuggestion"), v12, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v9, "addObject:", v13);
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5149688, 0, 0, 1, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v14);

  }
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("photo.on.rectangle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, CFSTR("PXAssetCollectionActionTypeRevealInMoment"), v15, 0);

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "canShowInternalUI");

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ant.circle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v5;
    v27[1] = 3221225472;
    v27[2] = __62__PXContentSyndicationGadget_contextMenuWithSuggestedActions___block_invoke_2;
    v27[3] = &unk_1E5147F40;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", CFSTR("File a Radar"), v19, 0, v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0DC39D0];
    v32[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "menuWithTitle:image:identifier:options:children:", &stru_1E5149688, 0, 0, 1, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v23);

    objc_destroyWeak(&v28);
  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&location);
  return v24;
}

- (void)_fileRadar
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PXContentSyndicationGadget assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PXContentSyndicationGadget assetCollection](self, "assetCollection");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setIncludeGuestAssets:", 1);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v10, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXFileRadarViewControllerForContentSyndicationAssets(v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentSyndicationGadget delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentGadgetViewController:animated:completion:", v8, 1, 0);

  }
}

- (id)additionalContextMenuActionsForAttributionViewInContentSyndicationGadgetView:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContentSyndicationGadget _createActionForType:image:attributes:](self, "_createActionForType:image:attributes:", CFSTR("PXAssetCollectionActionTypeContentSyndicationRemoveSuggestion"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_descriptionForAssertionMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationGadget.m"), 468, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("menuElement"), v12, v13);

    }
    objc_msgSend(v5, "addObject:", v8);

  }
  return v5;
}

- (void)_refreshGadgetContents
{
  void *v3;
  PXContentSyndicationCountsController *v4;
  PXContentSyndicationCountsController *countsController;
  void *v6;
  void *v7;
  void *v8;
  PXContentSyndicationSocialLayerHighlightProvider *socialLayerHighlightProvider;
  void *v10;
  _QWORD v11[5];

  if (self->_view)
  {
    if (!self->_countsController)
    {
      -[PXContentSyndicationGadget delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "countsControllerForContentSyndicationGadget:", self);
      v4 = (PXContentSyndicationCountsController *)objc_claimAutoreleasedReturnValue();
      countsController = self->_countsController;
      self->_countsController = v4;

      -[PXContentSyndicationCountsController registerChangeObserver:context:](self->_countsController, "registerChangeObserver:context:", self, PXCountsControllerObservationContext);
    }
    -[PXContentSyndicationGadget assetCollection](self, "assetCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PXContentSyndicationGadget assetCollection](self, "assetCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXContentSyndicationCountsController setAssetCollection:](self->_countsController, "setAssetCollection:", v7);

    }
    -[PXContentSyndicationGadget referenceAssetForSocialLayerHighlight](self, "referenceAssetForSocialLayerHighlight");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      socialLayerHighlightProvider = self->_socialLayerHighlightProvider;
      -[PXContentSyndicationGadget referenceAssetForSocialLayerHighlight](self, "referenceAssetForSocialLayerHighlight");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __52__PXContentSyndicationGadget__refreshGadgetContents__block_invoke;
      v11[3] = &unk_1E5116DD0;
      v11[4] = self;
      -[PXContentSyndicationSocialLayerHighlightProvider fetchSocialLayerHighlightForAsset:completion:](socialLayerHighlightProvider, "fetchSocialLayerHighlightForAsset:completion:", v10, v11);

    }
  }
}

- (void)_fetchKeyImages
{
  uint64_t v3;
  uint64_t v4;
  PXContentSyndicationGadgetViewModel *viewModel;
  PXImageRequesterHelper *v6;
  PXImageRequesterHelper *frontImageRequesterHelper;
  PXImageRequesterHelper *v8;
  PXImageRequesterHelper *middleImageRequesterHelper;
  PXImageRequesterHelper *v10;
  PXImageRequesterHelper *backImageRequesterHelper;
  id v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  void *v22;
  char v23;
  _QWORD v24[5];

  if (self->_view)
  {
    v3 = -[PXDisplayAssetFetchResult count](self->_keyImagesAssetFetchResult, "count");
    if (v3 >= 3)
      v4 = 3;
    else
      v4 = v3;
    viewModel = self->_viewModel;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __45__PXContentSyndicationGadget__fetchKeyImages__block_invoke;
    v24[3] = &__block_descriptor_40_e54_v16__0___PXContentSyndicationGadgetMutableViewModel__8l;
    v24[4] = v4;
    -[PXContentSyndicationGadgetViewModel performChanges:](viewModel, "performChanges:", v24);
    if (!self->_frontImageRequesterHelper)
    {
      v6 = objc_alloc_init(PXImageRequesterHelper);
      frontImageRequesterHelper = self->_frontImageRequesterHelper;
      self->_frontImageRequesterHelper = v6;

      -[PXImageRequesterHelper registerChangeObserver:context:](self->_frontImageRequesterHelper, "registerChangeObserver:context:", self, PXImageRequesterHelperFrontObservationContext);
      v8 = objc_alloc_init(PXImageRequesterHelper);
      middleImageRequesterHelper = self->_middleImageRequesterHelper;
      self->_middleImageRequesterHelper = v8;

      -[PXImageRequesterHelper registerChangeObserver:context:](self->_middleImageRequesterHelper, "registerChangeObserver:context:", self, PXImageRequesterHelperMiddleObservationContext);
      v10 = objc_alloc_init(PXImageRequesterHelper);
      backImageRequesterHelper = self->_backImageRequesterHelper;
      self->_backImageRequesterHelper = v10;

      -[PXImageRequesterHelper registerChangeObserver:context:](self->_backImageRequesterHelper, "registerChangeObserver:context:", self, PXImageRequesterHelperBackObservationContext);
    }
    -[PXDisplayAssetFetchResult firstObject](self->_keyImagesAssetFetchResult, "firstObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[PXImageRequesterHelper asset](self->_frontImageRequesterHelper, "asset");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
      {

LABEL_12:
        -[PXContentSyndicationGadget _updateImageRequesterHelper:withAsset:](self, "_updateImageRequesterHelper:withAsset:", self->_frontImageRequesterHelper, v12);
        if (v4 < 2)
        {
          v16 = 0;
        }
        else
        {
          -[PXDisplayAssetFetchResult objectAtIndex:](self->_keyImagesAssetFetchResult, "objectAtIndex:", 1);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            -[PXImageRequesterHelper asset](self->_middleImageRequesterHelper, "asset");
            v17 = (id)objc_claimAutoreleasedReturnValue();
            if (v16 == v17)
            {

              goto LABEL_19;
            }
            v18 = v17;
            v19 = objc_msgSend(v16, "isEqual:", v17);

            if ((v19 & 1) != 0)
            {
LABEL_19:
              -[PXContentSyndicationGadget _updateImageRequesterHelper:withAsset:](self, "_updateImageRequesterHelper:withAsset:", self->_middleImageRequesterHelper, v16);
              if (v4 < 3)
              {
                v20 = 0;
              }
              else
              {
                -[PXDisplayAssetFetchResult objectAtIndex:](self->_keyImagesAssetFetchResult, "objectAtIndex:", 2);
                v20 = (id)objc_claimAutoreleasedReturnValue();
                if (v20)
                {
                  -[PXImageRequesterHelper asset](self->_backImageRequesterHelper, "asset");
                  v21 = (id)objc_claimAutoreleasedReturnValue();
                  if (v20 == v21)
                  {

                    goto LABEL_26;
                  }
                  v22 = v21;
                  v23 = objc_msgSend(v20, "isEqual:", v21);

                  if ((v23 & 1) != 0)
                    goto LABEL_26;
                }
              }
              -[PXContentSyndicationGadget _handleKeyImage:atIndex:](self, "_handleKeyImage:atIndex:", 0, 2);
LABEL_26:
              -[PXContentSyndicationGadget _updateImageRequesterHelper:withAsset:](self, "_updateImageRequesterHelper:withAsset:", self->_backImageRequesterHelper, v20);

              return;
            }
          }
        }
        -[PXContentSyndicationGadget _handleKeyImage:atIndex:](self, "_handleKeyImage:atIndex:", 0, 1);
        goto LABEL_19;
      }
      v14 = v13;
      v15 = objc_msgSend(v12, "isEqual:", v13);

      if ((v15 & 1) != 0)
        goto LABEL_12;
    }
    -[PXContentSyndicationGadget _handleKeyImage:atIndex:](self, "_handleKeyImage:atIndex:", 0, 0);
    goto LABEL_12;
  }
}

- (void)_updateImageRequesterHelper:(id)a3 withAsset:(id)a4
{
  id v6;
  PXContentSyndicationGadgetView *view;
  id v8;
  CGFloat Width;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  PXContentSyndicationGadget *v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  CGRect v18;

  v6 = a4;
  view = self->_view;
  v8 = a3;
  -[PXContentSyndicationGadgetView frame](view, "frame");
  Width = CGRectGetWidth(v18);
  -[PXGadgetSpec displayScale](self->_gadgetSpec, "displayScale");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__PXContentSyndicationGadget__updateImageRequesterHelper_withAsset___block_invoke;
  v12[3] = &unk_1E5116E18;
  v13 = v6;
  v14 = self;
  v15 = Width;
  v16 = Width;
  v17 = v10;
  v11 = v6;
  objc_msgSend(v8, "performChanges:", v12);

}

- (void)_handleKeyImage:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  PXContentSyndicationGadgetViewModel *viewModel;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a3;
  viewModel = self->_viewModel;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__PXContentSyndicationGadget__handleKeyImage_atIndex___block_invoke;
  v9[3] = &unk_1E5116E40;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[PXContentSyndicationGadgetViewModel performChanges:](viewModel, "performChanges:", v9);

}

- (void)_updateCounts
{
  PXContentSyndicationCountsController *countsController;
  _QWORD v4[3];

  countsController = self->_countsController;
  if (countsController)
  {
    -[PXContentSyndicationCountsController detailedCounts](countsController, "detailedCounts");
    countsController = self->_countsController;
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  -[PXContentSyndicationGadget _updateOverlayTitleWithDetailedCounts:savedCount:](self, "_updateOverlayTitleWithDetailedCounts:savedCount:", v4, -[PXContentSyndicationCountsController savedCount](countsController, "savedCount"));
  -[PXContentSyndicationGadget _updateGridFooterViewModel](self, "_updateGridFooterViewModel");
}

- (void)_updateOverlayTitleWithDetailedCounts:(id *)a3 savedCount:(int64_t)a4
{
  unint64_t var1;
  unint64_t var2;
  unint64_t v10;
  void *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  int64_t v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[3];

  var1 = a3->var1;
  var2 = a3->var2;
  if (a3->var0 != 0x7FFFFFFFFFFFFFFFLL && var1 != 0x7FFFFFFFFFFFFFFFLL && var2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = var1 + a3->var0 + var2;
    if (v10 && (unint64_t)(a4 + 1) >= 2)
    {
      if (v10 == a4)
      {
        if (a4 == 1)
          v13 = CFSTR("PXContentSyndicationOverlaySavedTitledSingle");
        else
          v13 = CFSTR("PXContentSyndicationOverlaySavedTitledMultiple");
        PXLocalizedStringFromTable(v13, CFSTR("PhotosUICore"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "rangeOfString:", CFSTR("{checkmarkIcon}"));
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v14);
LABEL_22:

          goto LABEL_23;
        }
        v18 = v15;
        v19 = v16;
        objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v17, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "imageWithRenderingMode:", 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC12B0]), "initWithData:ofType:", 0, 0);
        objc_msgSend(v23, "setImage:", v22);
        objc_msgSend(v22, "baselineOffsetFromBottom");
        v25 = v24;
        objc_msgSend(v22, "alignmentRectInsets");
        v27 = v25 + v26;
        objc_msgSend(v23, "bounds");
        objc_msgSend(v22, "size");
        objc_msgSend(v23, "setBounds:", 0.0, v27, v28, v29);
        objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v23);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v14);
        objc_msgSend(v12, "replaceCharactersInRange:withAttributedString:", v18, v19, v30);

      }
      else
      {
        v36[0] = a3->var0;
        v36[1] = var1;
        v36[2] = var2;
        PXLocalizedStringForDetailedCounts(v36, CFSTR("PXContentSyndicationOverlayPhotosCountAndSavedTitleFormat"), CFSTR("PXContentSyndicationOverlayVideosCountAndSavedTitleFormat"), CFSTR("PXContentSyndicationOverlayItemsCountAndSavedTitleFormat"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = a4;
        PXLocalizedStringWithValidatedFormat(v14, CFSTR("%ld %ld"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v17, v10, v33);
      }

      goto LABEL_22;
    }
  }
  v12 = 0;
LABEL_23:
  -[PXContentSyndicationGadget viewModel](self, "viewModel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __79__PXContentSyndicationGadget__updateOverlayTitleWithDetailedCounts_savedCount___block_invoke;
  v34[3] = &unk_1E5116DA8;
  v35 = v12;
  v32 = v12;
  objc_msgSend(v31, "performChanges:", v34);

}

- (void)_updateGridFooterViewModel
{
  void *v3;
  void *v4;
  PXFooterViewModel *gridFooterViewModel;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  if (self->_gridFooterViewModel)
  {
    -[PXContentSyndicationCountsController totalCountDescription](self->_countsController, "totalCountDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      PXLocalizedStringFromTable(CFSTR("PXContentSyndicationLoadingCountsTitle"), CFSTR("PhotosUICore"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PXContentSyndicationCountsController savedCountDescription](self->_countsController, "savedCountDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    gridFooterViewModel = self->_gridFooterViewModel;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__PXContentSyndicationGadget__updateGridFooterViewModel__block_invoke;
    v8[3] = &unk_1E5116E68;
    v9 = v3;
    v10 = v4;
    v6 = v4;
    v7 = v3;
    -[PXFooterViewModel performChanges:](gridFooterViewModel, "performChanges:", v8);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void *v11;
  PXContentSyndicationGadget *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v6 = a4;
  v8 = a3;
  if ((void *)PXImageRequesterHelperFrontObservationContext == a5
    || PXImageRequesterHelperMiddleObservationContext == (_QWORD)a5
    || PXImageRequesterHelperBackObservationContext == (_QWORD)a5)
  {
    if ((v6 & 0x20) != 0)
    {
      if ((void *)PXImageRequesterHelperFrontObservationContext == a5)
      {
        v15 = v8;
        -[PXImageRequesterHelper image](self->_frontImageRequesterHelper, "image");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = self;
        v13 = v11;
        v14 = 0;
      }
      else if ((void *)PXImageRequesterHelperMiddleObservationContext == a5)
      {
        v15 = v8;
        -[PXImageRequesterHelper image](self->_middleImageRequesterHelper, "image");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = self;
        v13 = v11;
        v14 = 1;
      }
      else
      {
        if ((void *)PXImageRequesterHelperBackObservationContext != a5)
          goto LABEL_21;
        v15 = v8;
        -[PXImageRequesterHelper image](self->_backImageRequesterHelper, "image");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = self;
        v13 = v11;
        v14 = 2;
      }
      -[PXContentSyndicationGadget _handleKeyImage:atIndex:](v12, "_handleKeyImage:atIndex:", v13, v14);

      goto LABEL_20;
    }
  }
  else if ((v6 & 3) != 0 && (void *)PXCountsControllerObservationContext == a5)
  {
    v15 = v8;
    -[PXContentSyndicationGadget _updateCounts](self, "_updateCounts");
LABEL_20:
    v8 = v15;
  }
LABEL_21:

}

- (void)assetFetchResultProvider:(id)a3 didChangeAssetFetchResult:(id)a4 forAssetCollection:(id)a5
{
  id v7;
  id v8;

  objc_storeStrong((id *)&self->_keyImagesAssetFetchResult, a4);
  v7 = a4;
  -[PXContentSyndicationGadget _fetchKeyImages](self, "_fetchKeyImages");
  -[PXDisplayAssetFetchResult firstObject](self->_keyImagesAssetFetchResult, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PXContentSyndicationGadget setReferenceAssetForSocialLayerHighlight:](self, "setReferenceAssetForSocialLayerHighlight:", v8);
  -[PXContentSyndicationGadget _retrieveAssetCollectionIfNeeded](self, "_retrieveAssetCollectionIfNeeded");

}

- (void)socialLayerHighlightProvider:(id)a3 didChangeSocialLayerHighlight:(id)a4 forAsset:(id)a5
{
  id v6;
  PXContentSyndicationGadgetViewModel *viewModel;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  viewModel = self->_viewModel;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __98__PXContentSyndicationGadget_socialLayerHighlightProvider_didChangeSocialLayerHighlight_forAsset___block_invoke;
  v9[3] = &unk_1E5116DA8;
  v10 = v6;
  v8 = v6;
  -[PXContentSyndicationGadgetViewModel performChanges:](viewModel, "performChanges:", v9);

}

- (PXContentSyndicationGadgetDelegate)delegate
{
  return (PXContentSyndicationGadgetDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (CGRect)visibleContentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleContentRect.origin.x;
  y = self->_visibleContentRect.origin.y;
  width = self->_visibleContentRect.size.width;
  height = self->_visibleContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVisibleContentRect:(CGRect)a3
{
  self->_visibleContentRect = a3;
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (PXContentSyndicationItem)contentSyndicationItem
{
  return self->_contentSyndicationItem;
}

- (PXContentSyndicationGadgetViewModel)viewModel
{
  return self->_viewModel;
}

- (PXContentSyndicationGadgetView)view
{
  return self->_view;
}

- (PXDisplayAssetCollection)initialAssetCollection
{
  return self->_initialAssetCollection;
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PXDisplayAsset)referenceAssetForSocialLayerHighlight
{
  return self->_referenceAssetForSocialLayerHighlight;
}

- (NSUserActivity)siriActionActivity
{
  return self->_siriActionActivity;
}

- (void)setSiriActionActivity:(id)a3
{
  objc_storeStrong((id *)&self->_siriActionActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriActionActivity, 0);
  objc_storeStrong((id *)&self->_referenceAssetForSocialLayerHighlight, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_initialAssetCollection, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_contentSyndicationItem, 0);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_backImageRequesterHelper, 0);
  objc_storeStrong((id *)&self->_middleImageRequesterHelper, 0);
  objc_storeStrong((id *)&self->_frontImageRequesterHelper, 0);
  objc_storeStrong((id *)&self->_gridFooterViewModel, 0);
  objc_storeStrong((id *)&self->_countsController, 0);
  objc_storeStrong((id *)&self->_socialLayerHighlightProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_keyImagesAssetFetchResult, 0);
  objc_storeStrong((id *)&self->_keyImagesAssetFetchResultProvider, 0);
}

uint64_t __98__PXContentSyndicationGadget_socialLayerHighlightProvider_didChangeSocialLayerHighlight_forAsset___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSocialLayerHighlight:", *(_QWORD *)(a1 + 32));
}

void __56__PXContentSyndicationGadget__updateGridFooterViewModel__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setSubtitle1:", *(_QWORD *)(a1 + 40));

}

uint64_t __79__PXContentSyndicationGadget__updateOverlayTitleWithDetailedCounts_savedCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOverlayTitle:", *(_QWORD *)(a1 + 32));
}

uint64_t __54__PXContentSyndicationGadget__handleKeyImage_atIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setKeyImage:atIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __68__PXContentSyndicationGadget__updateImageRequesterHelper_withAsset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAsset:", v3);
  objc_msgSend(v4, "setMediaProvider:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(v4, "setContentSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(v4, "setScale:", *(double *)(a1 + 64));

}

uint64_t __45__PXContentSyndicationGadget__fetchKeyImages__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setKeyImageCount:", *(_QWORD *)(a1 + 32));
}

void __52__PXContentSyndicationGadget__refreshGadgetContents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PXContentSyndicationGadget__refreshGadgetContents__block_invoke_2;
  v6[3] = &unk_1E5116DA8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performChanges:", v6);

}

uint64_t __52__PXContentSyndicationGadget__refreshGadgetContents__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSocialLayerHighlight:", *(_QWORD *)(a1 + 32));
}

void __62__PXContentSyndicationGadget_contextMenuWithSuggestedActions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_createActionForType:image:attributes:", a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    v5 = v6;
  }

}

void __62__PXContentSyndicationGadget_contextMenuWithSuggestedActions___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fileRadar");

}

void __68__PXContentSyndicationGadget__createActionForType_image_attributes___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "canPerformActionType:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "actionPerformerForActionType:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_makePresentationEnvironment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPresentationEnvironment:", v3);

    objc_msgSend(v4, "performActionWithCompletionHandler:", 0);
  }
}

id __75__PXContentSyndicationGadget__donateUserActivityForAssetCollectionIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return px_deferredLocalizedStringWithFormat(CFSTR("PXSiriActionsViewAlbumContainerTitle"), a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
}

void __75__PXContentSyndicationGadget__donateUserActivityForAssetCollectionIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("uuid");
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("isContentSyndicationAlbum");
  v8[0] = v5;
  v8[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addUserInfoEntriesFromDictionary:", v6);

  objc_msgSend(v4, "setEligibleForSearch:", 1);
  objc_msgSend(v4, "_setEligibleForPrediction:", 1);
  objc_msgSend(v4, "setEligibleForHandoff:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setSiriActionActivity:", v4);
  objc_msgSend(v4, "becomeCurrent");

}

void __62__PXContentSyndicationGadget__retrieveAssetCollectionIfNeeded__block_invoke_143(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PXContentSyndicationAssetsFetchResultMatchingSyndicationGroupingOfAsset(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLSyndicationUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v11 = v4;
    v12 = 2112;
    v13 = v2;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "ContentSyndicationGadget %p: Real asset collection retrieved: %@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PXContentSyndicationGadget__retrieveAssetCollectionIfNeeded__block_invoke_144;
  v7[3] = &unk_1E5148D08;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v2;
  v9 = v5;
  v6 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __62__PXContentSyndicationGadget__retrieveAssetCollectionIfNeeded__block_invoke_144(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:subtype:", v2, 1000000501);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (id *)(a1 + 40);
  }
  else
  {
    v4 = (id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "initialAssetCollection");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v3;
  objc_msgSend(*v4, "setAssetCollection:", v3);

}

void __62__PXContentSyndicationGadget__retrieveAssetCollectionIfNeeded__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("PXContentSyndicationGadget", v2);
  v1 = (void *)_retrieveAssetCollectionIfNeeded__fetchQueue;
  _retrieveAssetCollectionIfNeeded__fetchQueue = (uint64_t)v0;

}

@end
