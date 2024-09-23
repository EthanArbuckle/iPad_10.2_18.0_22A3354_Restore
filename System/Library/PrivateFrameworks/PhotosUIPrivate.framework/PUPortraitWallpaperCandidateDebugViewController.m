@implementation PUPortraitWallpaperCandidateDebugViewController

- (PUPortraitWallpaperCandidateDebugViewController)initWithSpec:(id)a3 mode:(int64_t)a4
{
  id v7;
  id v8;
  PUPortraitWallpaperCandidateDebugViewController *v9;
  PUPortraitWallpaperCandidateDebugViewController *v10;

  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v9 = -[PUPortraitWallpaperCandidateDebugViewController initWithCollectionViewLayout:](self, "initWithCollectionViewLayout:", v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_spec, a3);
    v10->_mode = a4;
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  int64_t mode;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PHFetchResult *v13;
  PHFetchResult *assets;
  id v15;
  PHFetchResult *v16;
  PHFetchResult *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)PUPortraitWallpaperCandidateDebugViewController;
  -[PUPortraitWallpaperCandidateDebugViewController viewDidLoad](&v21, sel_viewDidLoad);
  -[PUPortraitWallpaperCandidateDebugViewController px_enableOneUpPresentation](self, "px_enableOneUpPresentation");
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  mode = self->_mode;
  switch(mode)
  {
    case 0:
      objc_msgSend(v3, "librarySpecificFetchOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D77EF8], "knownPersonLocalIdentifiersInPhotoLibrary:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D77EF8], "predicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInternalPredicate:", v9);

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v10;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sortToken"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInternalSortDescriptors:", v12);

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v7);
      v13 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
      assets = self->_assets;
      self->_assets = v13;

LABEL_8:
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0D77EF8], "coldStartPortraitWallpaperInPhotoLibrary:passingFilterBlock:maximumNumberOfTries:", v3, &__block_literal_global_55945, *MEMORY[0x1E0D78168]);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x1E0D77EF8], "coldStartDeviceOwnerWallpaperInPhotoLibrary:", v3);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = (void *)v6;
      v15 = objc_alloc(MEMORY[0x1E0CD1620]);
      v16 = (PHFetchResult *)objc_msgSend(v15, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v7, v4, *MEMORY[0x1E0CD1B90], 0, 0, 0);
      v17 = self->_assets;
      self->_assets = v16;

      goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d items"), -[PHFetchResult count](self->_assets, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPortraitWallpaperCandidateDebugViewController navigationItem](self, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:", v18);

  -[PUPortraitWallpaperCandidateDebugViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("wallpaperCell"));

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[PHFetchResult count](self->_assets, "count", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  PHFetchResult *assets;
  uint64_t v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("wallpaperCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  assets = self->_assets;
  v9 = objc_msgSend(v6, "row");

  -[PHFetchResult objectAtIndexedSubscript:](assets, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAsset:", v10);

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[PUPortraitWallpaperCandidateDebugViewController spec](self, "spec", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemSize");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v5;
  double v6;
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
  UIEdgeInsets result;

  -[PUPortraitWallpaperCandidateDebugViewController spec](self, "spec", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewContentInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  PHAsset *v5;
  PHAsset *currentAsset;

  -[PHFetchResult objectAtIndexedSubscript:](self->_assets, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  v5 = (PHAsset *)objc_claimAutoreleasedReturnValue();
  currentAsset = self->_currentAsset;
  self->_currentAsset = v5;

  -[PUPortraitWallpaperCandidateDebugViewController displayAsset:](self, "displayAsset:", self->_currentAsset);
}

- (void)displayAsset:(id)a3
{
  id v4;
  void *v5;
  PUWallpaperPosterEditDebugViewController *v6;
  void *v7;
  PUParallaxLayerStackDebugViewController *v8;
  void *v9;
  void *v10;
  PUWallpaperPlaygroundViewController *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[PUSuggestionsSettings sharedInstance](PUSuggestionsSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v5, "viewMode"))
    {
      case 0:
        -[PUPortraitWallpaperCandidateDebugViewController px_oneUpPresentation](self, "px_oneUpPresentation");
        v6 = (PUWallpaperPosterEditDebugViewController *)objc_claimAutoreleasedReturnValue();
        -[PUWallpaperPosterEditDebugViewController setDelegate:](v6, "setDelegate:", self);
        -[PUWallpaperPosterEditDebugViewController startWithConfigurationHandler:](v6, "startWithConfigurationHandler:", 0);
        goto LABEL_9;
      case 1:
        -[PUPortraitWallpaperCandidateDebugViewController parallaxViewController](self, "parallaxViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
        {
          v8 = objc_alloc_init(PUParallaxLayerStackDebugViewController);
          -[PUPortraitWallpaperCandidateDebugViewController setParallaxViewController:](self, "setParallaxViewController:", v8);

        }
        -[PUPortraitWallpaperCandidateDebugViewController parallaxViewController](self, "parallaxViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "loadPHAsset:", v4);

        -[PUPortraitWallpaperCandidateDebugViewController navigationController](self, "navigationController");
        v6 = (PUWallpaperPosterEditDebugViewController *)objc_claimAutoreleasedReturnValue();
        -[PUPortraitWallpaperCandidateDebugViewController parallaxViewController](self, "parallaxViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUWallpaperPosterEditDebugViewController pushViewController:animated:](v6, "pushViewController:animated:", v10, 0);

        goto LABEL_9;
      case 2:
        v11 = [PUWallpaperPlaygroundViewController alloc];
        v13[0] = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[PUWallpaperPlaygroundViewController initWithAssets:](v11, "initWithAssets:", v12);

        -[PUWallpaperPosterEditDebugViewController presentPlaygroundWithPresentingViewController:](v6, "presentPlaygroundWithPresentingViewController:", self);
        goto LABEL_9;
      case 3:
        v6 = -[PUWallpaperPosterEditDebugViewController initWithAsset:]([PUWallpaperPosterEditDebugViewController alloc], "initWithAsset:", v4);
        -[PUWallpaperPosterEditDebugViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 5);
        -[PUPortraitWallpaperCandidateDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
LABEL_9:

        break;
      default:
        break;
    }

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPortraitWallpaperCandidateDebugViewController;
  -[PUPortraitWallpaperCandidateDebugViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[PUPortraitWallpaperCandidateDebugViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayout");

}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PUPortraitWallpaperCandidateDebugViewController oneUpDataSourceManager](self, "oneUpDataSourceManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B790]), "initWithAssetFetchResult:options:", self->_assets, 4);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B788]), "initWithPhotosDataSourceConfiguration:", v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B6F8]), "initWithPhotosDataSource:", v6);
    -[PUPortraitWallpaperCandidateDebugViewController setOneUpDataSourceManager:](self, "setOneUpDataSourceManager:", v7);

  }
  return -[PUPortraitWallpaperCandidateDebugViewController oneUpDataSourceManager](self, "oneUpDataSourceManager");
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  return objc_alloc_init(MEMORY[0x1E0D7B768]);
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 0;
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  void *v4;
  void *v5;
  NSUInteger v6;
  void *v7;
  _QWORD v9[4];

  -[PUPortraitWallpaperCandidateDebugViewController oneUpPresentationDataSourceManager:](self, "oneUpPresentationDataSourceManager:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PHFetchResult indexOfObject:](self->_assets, "indexOfObject:", self->_currentAsset);
  v9[0] = objc_msgSend(v5, "identifier");
  v9[1] = 0;
  v9[2] = v6;
  v9[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "assetReferenceAtItemIndexPath:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[PUPortraitWallpaperCandidateDebugViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v5, "indexPath");
  PXIndexPathFromSimpleIndexPath();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollToItemAtIndexPath:atScrollPosition:animated:", v7, 2, 1);

}

- (PUPassiveContentDebugViewSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (PXAssetsDataSourceManager)oneUpDataSourceManager
{
  return self->_oneUpDataSourceManager;
}

- (void)setOneUpDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, a3);
}

- (PUParallaxLayerStackDebugViewController)parallaxViewController
{
  return self->_parallaxViewController;
}

- (void)setParallaxViewController:(id)a3
{
  objc_storeStrong((id *)&self->_parallaxViewController, a3);
}

- (PUProgressIndicatorView)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setProgressIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicator, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_parallaxViewController, 0);
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

uint64_t __62__PUPortraitWallpaperCandidateDebugViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (objc_class *)MEMORY[0x1E0CD1818];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithPhotoAsset:", v3);

  v5 = objc_msgSend(MEMORY[0x1E0D71280], "tryLoadSegmentationForColdAsset:", v4);
  return v5;
}

@end
