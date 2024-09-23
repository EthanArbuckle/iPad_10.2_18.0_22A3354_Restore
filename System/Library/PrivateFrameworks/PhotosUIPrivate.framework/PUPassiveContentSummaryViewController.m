@implementation PUPassiveContentSummaryViewController

- (PUPassiveContentSummaryViewController)initWithSpec:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  id v9;
  PUPassiveContentSummaryViewController *v10;
  PUPassiveContentSummaryViewController *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v10 = -[PUPassiveContentSummaryViewController initWithCollectionViewLayout:](self, "initWithCollectionViewLayout:", v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_spec, a3);
    objc_storeStrong((id *)&v11->_dataSource, a4);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "delegates", (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addPointer:", v11);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

  }
  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *keyAssetBySuggestionUUID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUPassiveContentSummaryViewController;
  -[PUPassiveContentSummaryViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[PUPassiveContentSummaryViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[PUPassiveContentSummaryViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPassiveContentSummaryViewController spec](self, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_msgSend(v5, "collectionViewCellClass"), CFSTR("wallpaperCell"));

  -[PUPassiveContentSummaryViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("wallpaperClassHeader"));

  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  keyAssetBySuggestionUUID = self->_keyAssetBySuggestionUUID;
  self->_keyAssetBySuggestionUUID = v7;

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
  v8.super_class = (Class)PUPassiveContentSummaryViewController;
  -[PUPassiveContentSummaryViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  -[PUPassiveContentSummaryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  MidX = CGRectGetMidX(v9);
  -[PUPassiveContentSummaryViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  MidY = CGRectGetMidY(v10);
  -[PUPassiveContentSummaryViewController progressIndicator](self, "progressIndicator");
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
  -[PUPassiveContentSummaryViewController progressIndicator](self, "progressIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[PUProgressIndicatorView initWithStyle:]([PUProgressIndicatorView alloc], "initWithStyle:", 0);
    -[PUPassiveContentSummaryViewController setProgressIndicator:](self, "setProgressIndicator:", v5);

    -[PUPassiveContentSummaryViewController progressIndicator](self, "progressIndicator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocalizedMessage:", v14);

    -[PUPassiveContentSummaryViewController progressIndicator](self, "progressIndicator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeterminate:", 0);

    -[PUPassiveContentSummaryViewController progressIndicator](self, "progressIndicator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShowsBackground:", 1);

    -[PUPassiveContentSummaryViewController progressIndicator](self, "progressIndicator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUPassiveContentSummaryViewController progressIndicator](self, "progressIndicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "beginShowingProgressImmediately:animated:", 1, 1);

    -[PUPassiveContentSummaryViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPassiveContentSummaryViewController progressIndicator](self, "progressIndicator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    -[PUPassiveContentSummaryViewController progressIndicator](self, "progressIndicator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sizeToFit");

  }
}

- (void)hideProgressIndicator
{
  void *v3;
  _QWORD v4[5];

  -[PUPassiveContentSummaryViewController progressIndicator](self, "progressIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__PUPassiveContentSummaryViewController_hideProgressIndicator__block_invoke;
  v4[3] = &unk_1E58ABD10;
  v4[4] = self;
  objc_msgSend(v3, "endShowingProgressImmediately:animated:withCompletionHandler:", 1, 1, v4);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PUPassiveContentSummaryViewController dataSource](self, "dataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  unint64_t v7;

  -[PUPassiveContentSummaryViewController dataSource](self, "dataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countInSection:", 0);

  if (v7 >= 3)
    return 3;
  else
    return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v38;
  _QWORD v39[4];

  v39[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("wallpaperCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPassiveContentSummaryViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB36B0];
  v11 = objc_msgSend(v6, "row");

  objc_msgSend(v10, "indexPathForRow:inSection:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPassiveContentSummaryViewController keyAssetBySuggestionUUID](self, "keyAssetBySuggestionUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(v13, "photoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "librarySpecificFetchOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setFetchLimit:", 1);
    v19 = *MEMORY[0x1E0CD1A50];
    v39[0] = *MEMORY[0x1E0CD19F0];
    v39[1] = v19;
    v39[2] = *MEMORY[0x1E0CD1978];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFetchPropertySets:", v20);

    v21 = objc_alloc(MEMORY[0x1E0CD1620]);
    v38 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "photoLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v22, v23, *MEMORY[0x1E0CD1BD0], 0, 0, 0);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetBySuggestionUUIDForSuggestions:options:", v24, v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPassiveContentSummaryViewController keyAssetBySuggestionUUID](self, "keyAssetBySuggestionUUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v16, v28);

  }
  objc_msgSend(v7, "setAsset:", v16);
  v29 = objc_msgSend(MEMORY[0x1E0D77EF8], "posterClassificationForSuggestionSubtype:", objc_msgSend(v13, "subtype"));
  objc_msgSend(v7, "wallpaperView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClassificationMode:", v29);

  -[PUPassiveContentSummaryViewController spec](self, "spec");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "shouldShowClockOverlay");
  objc_msgSend(v7, "wallpaperView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setShowClockOverlay:", v32);

  -[PUPassiveContentSummaryViewController spec](self, "spec");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "cropMode");
  objc_msgSend(v7, "wallpaperView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setCropMode:", v35);

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  PUPassiveContentDebugViewSpec *v8;
  void *v9;
  PUPassiveContentDebugViewSpec *v10;
  PUPassiveContentDetailViewController *v11;
  void *v12;
  id v13;

  v5 = a4;
  -[PUPassiveContentSummaryViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "section");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v8 = [PUPassiveContentDebugViewSpec alloc];
  -[PUPassiveContentSummaryViewController spec](self, "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUPassiveContentDebugViewSpec initWithViewMode:](v8, "initWithViewMode:", objc_msgSend(v9, "viewMode"));

  v11 = -[PUPassiveContentDetailViewController initWithSpec:]([PUPassiveContentDetailViewController alloc], "initWithSpec:", v10);
  -[PUPassiveContentDetailViewController setDataSource:](v11, "setDataSource:", v13);
  -[PUPassiveContentSummaryViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pushViewController:animated:", v11, 1);

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  return -[PUPassiveContentSummaryViewController contextMenuConfigurationForItemAtIndexPath:](self, "contextMenuConfigurationForItemAtIndexPath:", a4, a5.x, a5.y);
}

- (id)contextMenuConfigurationForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  PUPassiveContentSummaryViewController *v22;

  v4 = a3;
  -[PUPassiveContentSummaryViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB36B0];
  v8 = objc_msgSend(v4, "row");

  objc_msgSend(v7, "indexPathForRow:inSection:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPassiveContentSummaryViewController keyAssetBySuggestionUUID](self, "keyAssetBySuggestionUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0DC36B8];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke;
  v19[3] = &unk_1E58A7FB0;
  v20 = v10;
  v21 = v13;
  v22 = self;
  v15 = v13;
  v16 = v10;
  objc_msgSend(v14, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
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

  -[PUPassiveContentSummaryViewController spec](self, "spec", a3, a4, a5);
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

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[PUPassiveContentSummaryViewController dataSource](self, "dataSource", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    -[PUPassiveContentSummaryViewController spec](self, "spec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "headerReferenceSize");
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v11 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
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

  -[PUPassiveContentSummaryViewController spec](self, "spec", a3, a4, a5);
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
  void *v16;

  v8 = a5;
  v9 = *MEMORY[0x1E0DC48A8];
  v10 = a4;
  objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("wallpaperClassHeader"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v10, "isEqualToString:", v9);

  if ((_DWORD)a3)
  {
    -[PUPassiveContentSummaryViewController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "count");
    objc_msgSend(v11, "setHidden:", v14 == 0);
    if (v14)
    {
      objc_msgSend(v13, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSectionHeaderTitle:", v15);

      -[PUPassiveContentSummaryViewController spec](self, "spec");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "headerInsets");
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
  v7.super_class = (Class)PUPassiveContentSummaryViewController;
  -[PUPassiveContentSummaryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[PUPassiveContentSummaryViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayout");

}

- (void)dataSourceChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PUPassiveContentSummaryViewController_dataSourceChanged___block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (NSArray)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (PUPassiveContentDebugViewSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (NSMutableDictionary)keyAssetBySuggestionUUID
{
  return self->_keyAssetBySuggestionUUID;
}

- (void)setKeyAssetBySuggestionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_keyAssetBySuggestionUUID, a3);
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
  objc_storeStrong((id *)&self->_keyAssetBySuggestionUUID, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __59__PUPassiveContentSummaryViewController_dataSourceChanged___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

id __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke(uint64_t a1)
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
  v30 = __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_2;
  v31 = &unk_1E58ABD10;
  v32 = v8;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_3;
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
  v21[2] = __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_4;
  v21[3] = &unk_1E58ABD10;
  v22 = *(_QWORD *)(a1 + 48);
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_5;
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

uint64_t __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showProgressIndicator:", CFSTR("Gathering Attachments..."));
}

uint64_t __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideProgressIndicator");
}

uint64_t __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showProgressIndicator:", CFSTR("Gathering Attachments..."));
}

uint64_t __84__PUPassiveContentSummaryViewController_contextMenuConfigurationForItemAtIndexPath___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideProgressIndicator");
}

uint64_t __62__PUPassiveContentSummaryViewController_hideProgressIndicator__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "progressIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setProgressIndicator:", 0);
}

@end
