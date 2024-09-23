@implementation PUPassiveContentDetailViewController

- (PUPassiveContentDetailViewController)initWithSpec:(id)a3
{
  id v5;
  id v6;
  PUPassiveContentDetailViewController *v7;
  PUPassiveContentDetailViewController *v8;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v7 = -[PUPassiveContentDetailViewController initWithCollectionViewLayout:](self, "initWithCollectionViewLayout:", v6);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_spec, a3);

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPassiveContentDetailViewController;
  -[PUPassiveContentDetailViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PUPassiveContentDetailViewController px_enableOneUpPresentation](self, "px_enableOneUpPresentation");
  -[PUPassiveContentDetailViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPassiveContentDetailViewController setTitle:](self, "setTitle:", v4);

  -[PUPassiveContentDetailViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPassiveContentDetailViewController spec](self, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_msgSend(v6, "collectionViewCellClass"), CFSTR("wallpaperCell"));

  -[PUPassiveContentDetailViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("wallpaperClassHeader"));

}

- (void)setDataSource:(id)a3
{
  PUPassiveContentDataSource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *keyAssetBySuggestionUUID;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v5 = (PUPassiveContentDataSource *)a3;
  if (self->_dataSource != v5)
  {
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[PUPassiveContentDataSource delegates](self->_dataSource, "delegates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addPointer:", self);

    -[PUPassiveContentDataSource fetchResult](v5, "fetchResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *MEMORY[0x1E0CD1A50];
    v15[0] = *MEMORY[0x1E0CD19F0];
    v15[1] = v10;
    v15[2] = *MEMORY[0x1E0CD1978];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFetchPropertySets:", v11);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetBySuggestionUUIDForSuggestions:options:", v7, v9);
    v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    keyAssetBySuggestionUUID = self->_keyAssetBySuggestionUUID;
    self->_keyAssetBySuggestionUUID = v12;

    -[PUPassiveContentDetailViewController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reloadData");

  }
}

- (void)displayAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PUWallpaperPosterEditDebugViewController *v7;
  void *v8;
  PUParallaxLayerStackDebugViewController *v9;
  void *v10;
  void *v11;
  PUWallpaperPlaygroundViewController *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[PUPassiveContentDetailViewController currentSuggestion](self, "currentSuggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "type") == 8)
    {
      -[PUPassiveContentDetailViewController px_oneUpPresentation](self, "px_oneUpPresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDelegate:", self);
      objc_msgSend(v6, "startWithConfigurationHandler:", 0);
    }
    else
    {
      +[PUSuggestionsSettings sharedInstance](PUSuggestionsSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v6, "viewMode"))
      {
        case 0:
          -[PUPassiveContentDetailViewController px_oneUpPresentation](self, "px_oneUpPresentation");
          v7 = (PUWallpaperPosterEditDebugViewController *)objc_claimAutoreleasedReturnValue();
          -[PUWallpaperPosterEditDebugViewController setDelegate:](v7, "setDelegate:", self);
          -[PUWallpaperPosterEditDebugViewController startWithConfigurationHandler:](v7, "startWithConfigurationHandler:", 0);
          goto LABEL_11;
        case 1:
          -[PUPassiveContentDetailViewController parallaxViewController](self, "parallaxViewController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v8)
          {
            v9 = objc_alloc_init(PUParallaxLayerStackDebugViewController);
            -[PUPassiveContentDetailViewController setParallaxViewController:](self, "setParallaxViewController:", v9);

          }
          -[PUPassiveContentDetailViewController parallaxViewController](self, "parallaxViewController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "loadPHAsset:", v4);

          -[PUPassiveContentDetailViewController navigationController](self, "navigationController");
          v7 = (PUWallpaperPosterEditDebugViewController *)objc_claimAutoreleasedReturnValue();
          -[PUPassiveContentDetailViewController parallaxViewController](self, "parallaxViewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUWallpaperPosterEditDebugViewController pushViewController:animated:](v7, "pushViewController:animated:", v11, 0);

          goto LABEL_11;
        case 2:
          v12 = [PUWallpaperPlaygroundViewController alloc];
          v14[0] = v4;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = -[PUWallpaperPlaygroundViewController initWithAssets:](v12, "initWithAssets:", v13);

          -[PUWallpaperPosterEditDebugViewController presentPlaygroundWithPresentingViewController:](v7, "presentPlaygroundWithPresentingViewController:", self);
          goto LABEL_11;
        case 3:
          v7 = -[PUWallpaperPosterEditDebugViewController initWithAsset:]([PUWallpaperPosterEditDebugViewController alloc], "initWithAsset:", v4);
          -[PUWallpaperPosterEditDebugViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 5);
          -[PUPassiveContentDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
LABEL_11:

          break;
        default:
          break;
      }
    }

  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PUPassiveContentDetailViewController dataSource](self, "dataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sectionCount");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[PUPassiveContentDetailViewController dataSource](self, "dataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countInSection:", a4);

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("wallpaperCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPassiveContentDetailViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPassiveContentDetailViewController keyAssetBySuggestionUUID](self, "keyAssetBySuggestionUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAsset:", v12);
  v13 = objc_msgSend(MEMORY[0x1E0D77EF8], "posterClassificationForSuggestionSubtype:", objc_msgSend(v9, "subtype"));
  objc_msgSend(v7, "wallpaperView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClassificationMode:", v13);

  -[PUPassiveContentDetailViewController spec](self, "spec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "shouldShowClockOverlay");
  objc_msgSend(v7, "wallpaperView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShowClockOverlay:", v16);

  -[PUPassiveContentDetailViewController spec](self, "spec");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "cropMode");
  objc_msgSend(v7, "wallpaperView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCropMode:", v19);

  return v7;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double MidX;
  void *v5;
  double MidY;
  void *v7;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  v8.receiver = self;
  v8.super_class = (Class)PUPassiveContentDetailViewController;
  -[PUPassiveContentDetailViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  -[PUPassiveContentDetailViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  MidX = CGRectGetMidX(v9);
  -[PUPassiveContentDetailViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  MidY = CGRectGetMidY(v10);
  -[PUPassiveContentDetailViewController progressIndicator](self, "progressIndicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCenter:", MidX, MidY);

}

- (void)showProgressIndicator:(id)a3
{
  void *v4;
  PUProgressIndicatorView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[PUPassiveContentDetailViewController progressIndicator](self, "progressIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[PUProgressIndicatorView initWithStyle:]([PUProgressIndicatorView alloc], "initWithStyle:", 0);
    -[PUPassiveContentDetailViewController setProgressIndicator:](self, "setProgressIndicator:", v5);

    -[PUPassiveContentDetailViewController progressIndicator](self, "progressIndicator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocalizedMessage:", v14);

    -[PUPassiveContentDetailViewController progressIndicator](self, "progressIndicator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeterminate:", 0);

    -[PUPassiveContentDetailViewController progressIndicator](self, "progressIndicator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShowsBackground:", 1);

    -[PUPassiveContentDetailViewController progressIndicator](self, "progressIndicator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUPassiveContentDetailViewController progressIndicator](self, "progressIndicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "beginShowingProgressImmediately:animated:", 1, 1);

    -[PUPassiveContentDetailViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPassiveContentDetailViewController progressIndicator](self, "progressIndicator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    -[PUPassiveContentDetailViewController progressIndicator](self, "progressIndicator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sizeToFit");

  }
}

- (void)hideProgressIndicator
{
  void *v3;
  _QWORD v4[5];

  -[PUPassiveContentDetailViewController progressIndicator](self, "progressIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__PUPassiveContentDetailViewController_hideProgressIndicator__block_invoke;
  v4[3] = &unk_1E58ABD10;
  v4[4] = self;
  objc_msgSend(v3, "endShowingProgressImmediately:animated:withCompletionHandler:", 1, 1, v4);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  -[PUPassiveContentDetailViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexPath:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[PUPassiveContentDetailViewController setCurrentSuggestion:](self, "setCurrentSuggestion:", v10);
  -[PUPassiveContentDetailViewController keyAssetBySuggestionUUID](self, "keyAssetBySuggestionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPassiveContentDetailViewController displayAsset:](self, "displayAsset:", v9);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  return -[PUPassiveContentDetailViewController contextMenuConfigurationForItemAtIndexPath:](self, "contextMenuConfigurationForItemAtIndexPath:", a4, a5.x, a5.y);
}

- (id)contextMenuConfigurationForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  PUPassiveContentDetailViewController *v18;

  v4 = a3;
  -[PUPassiveContentDetailViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPassiveContentDetailViewController keyAssetBySuggestionUUID](self, "keyAssetBySuggestionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC36B8];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke;
  v15[3] = &unk_1E58A7FB0;
  v16 = v6;
  v17 = v9;
  v18 = self;
  v11 = v9;
  v12 = v6;
  objc_msgSend(v10, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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

  -[PUPassiveContentDetailViewController spec](self, "spec", a3, a4, a5);
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

  -[PUPassiveContentDetailViewController spec](self, "spec", a3, a4, a5);
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

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  -[PUPassiveContentDetailViewController dataSource](self, "dataSource", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countInSection:", a5);

  if (v8)
  {
    -[PUPassiveContentDetailViewController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "titleForSection:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
    {
      -[PUPassiveContentDetailViewController spec](self, "spec");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "headerReferenceSize");
      v13 = v12;
      v15 = v14;

    }
    else
    {
      v13 = *MEMORY[0x1E0C9D820];
      v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }

  }
  else
  {
    v13 = *MEMORY[0x1E0C9D820];
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v8 = a5;
  v9 = *MEMORY[0x1E0DC48A8];
  v10 = a4;
  objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("wallpaperClassHeader"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v10, "isEqualToString:", v9);

  if ((_DWORD)a3)
  {
    -[PUPassiveContentDetailViewController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleForSection:", objc_msgSend(v8, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "length");
    objc_msgSend(v11, "setHidden:", v14 == 0);
    if (v14)
    {
      objc_msgSend(v11, "setSectionHeaderTitle:", v13);
      -[PUPassiveContentDetailViewController spec](self, "spec");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "headerInsets");
      objc_msgSend(v11, "setSectionHeaderInsets:");

    }
  }

  return v11;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPassiveContentDetailViewController;
  -[PUPassiveContentDetailViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[PUPassiveContentDetailViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayout");

}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[PUPassiveContentDetailViewController oneUpDataSourceManager](self, "oneUpDataSourceManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[PUPassiveContentDetailViewController dataSource](self, "dataSource", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
          -[PUPassiveContentDetailViewController keyAssetBySuggestionUUID](self, "keyAssetBySuggestionUUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            objc_msgSend(v5, "addObject:", v15);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v9);
    }

    -[PUPassiveContentDetailViewController dataSource](self, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fetchResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc(MEMORY[0x1E0CD1620]);
    v20 = (void *)objc_msgSend(v19, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v5, v18, *MEMORY[0x1E0CD1B90], 0, 0, 0);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B790]), "initWithAssetFetchResult:options:", v20, 4);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B788]), "initWithPhotosDataSourceConfiguration:", v21);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B6F8]), "initWithPhotosDataSource:", v22);
    -[PUPassiveContentDetailViewController setOneUpDataSourceManager:](self, "setOneUpDataSourceManager:", v23);

  }
  -[PUPassiveContentDetailViewController oneUpDataSourceManager](self, "oneUpDataSourceManager");
  return (id)objc_claimAutoreleasedReturnValue();
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
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];

  -[PUPassiveContentDetailViewController oneUpPresentationDataSourceManager:](self, "oneUpPresentationDataSourceManager:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPassiveContentDetailViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPassiveContentDetailViewController currentSuggestion](self, "currentSuggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "indexOfObject:", v8);

  v12[0] = objc_msgSend(v5, "identifier");
  v12[1] = 0;
  v12[2] = v9;
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "assetReferenceAtItemIndexPath:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a4, "asset", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPassiveContentDetailViewController keyAssetBySuggestionUUID](self, "keyAssetBySuggestionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeysForObject:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPassiveContentDetailViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForSuggestionUUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPassiveContentDetailViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scrollToItemAtIndexPath:atScrollPosition:animated:", v9, 2, 1);

}

- (void)dataSourceChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PUPassiveContentDetailViewController_dataSourceChanged___block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (PUPassiveContentDataSource)dataSource
{
  return self->_dataSource;
}

- (PUPassiveContentDebugViewSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (NSDictionary)keyAssetBySuggestionUUID
{
  return self->_keyAssetBySuggestionUUID;
}

- (void)setKeyAssetBySuggestionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_keyAssetBySuggestionUUID, a3);
}

- (PHSuggestion)currentSuggestion
{
  return self->_currentSuggestion;
}

- (void)setCurrentSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_currentSuggestion, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_parallaxViewController, 0);
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_storeStrong((id *)&self->_keyAssetBySuggestionUUID, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __58__PUPassiveContentDetailViewController_dataSourceChanged___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

id __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  uint64_t v32;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PUWallpaperHelper deleteSuggestionAction:](PUWallpaperHelper, "deleteSuggestionAction:", *(_QWORD *)(a1 + 32));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v19);
  +[PUWallpaperHelper rejectSuggestionAction:](PUWallpaperHelper, "rejectSuggestionAction:", *(_QWORD *)(a1 + 32));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v18);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUWallpaperHelper presentPosterEditorWithAsset:fromViewController:](PUWallpaperHelper, "presentPosterEditorWithAsset:fromViewController:", v3, v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v17);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PUWallpaperVisualDiagnosticsProvider visualDiagnosticsActionForSuggestion:asset:fromViewController:](PUWallpaperVisualDiagnosticsProvider, "visualDiagnosticsActionForSuggestion:asset:fromViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = MEMORY[0x1E0C809B0];
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_2;
  v31 = &unk_1E58ABD10;
  v32 = v8;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_3;
  v26 = &unk_1E58AB060;
  v27 = v8;
  +[PUParallaxLayerStackRadarController visualDiagnosticsActionForAsset:compoundLayerStack:segmentationItem:fromViewController:actionBeingHandler:actionEndHandler:](PUParallaxLayerStackRadarController, "visualDiagnosticsActionForAsset:compoundLayerStack:segmentationItem:fromViewController:actionBeingHandler:actionEndHandler:", v7, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v10);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v11);

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v21[1] = 3221225472;
  v21[2] = __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_4;
  v21[3] = &unk_1E58ABD10;
  v22 = *(_QWORD *)(a1 + 48);
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_5;
  v20[3] = &unk_1E58AB060;
  v20[4] = v22;
  v21[0] = v9;
  +[PUWallpaperHelper fileRadarSubmenuForSuggestion:asset:actionBeingHandler:actionEndHandler:](PUWallpaperHelper, "fileRadarSubmenuForSuggestion:asset:actionBeingHandler:actionEndHandler:", v12, v13, v21, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v14);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showProgressIndicator:", CFSTR("Gathering Attachments..."));
}

uint64_t __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideProgressIndicator");
}

uint64_t __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showProgressIndicator:", CFSTR("Gathering Attachments..."));
}

uint64_t __83__PUPassiveContentDetailViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideProgressIndicator");
}

uint64_t __61__PUPassiveContentDetailViewController_hideProgressIndicator__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "progressIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setProgressIndicator:", 0);
}

@end
