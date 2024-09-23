@implementation PUCurationTragicFailureInHighlightsGridDebugViewController

- (PUCurationTragicFailureInHighlightsGridDebugViewController)initWithSpec:(id)a3
{
  PUCurationTragicFailureInHighlightsGridDebugViewController *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewController;
  result = -[PUPhotosAlbumViewController initWithSpec:](&v4, sel_initWithSpec_, a3);
  if (result)
  {
    result->_showsAll = 1;
    result->_showsTragicFailure = 1;
    result->_showsNonMemorable = 1;
    result->_showsPoorQuality = 1;
  }
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *showsTragicFailureButtonItem;
  UIBarButtonItem *v11;
  UIBarButtonItem *showsNonMemorableButtonItem;
  UIBarButtonItem *v13;
  UIBarButtonItem *showsPoorQualityButtonItem;
  void *v15;
  UIBarButtonItem *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  _QWORD v23[12];

  v23[11] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewController;
  -[PUPhotosAlbumViewController viewDidLoad](&v22, sel_viewDidLoad);
  -[PUCurationTragicFailureInHighlightsGridDebugViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftItemsSupplementBackButton:", 1);

  -[PUCurationTragicFailureInHighlightsGridDebugViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUPhotoCell"));

  -[PUCurationTragicFailureInHighlightsGridDebugViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("PUCurationTragicFailureInHighlightsGridDebugViewSectionHeaderReuseIdentifier"));

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("⬅️"), 0, self->_parentController);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("➡️"), 0, self->_parentController);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("🤡"), 0, self, sel_toggleShowsAll_);
  v9 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("🛑"), 0, self, sel_toggleShowsTragicFailure_);
  showsTragicFailureButtonItem = self->_showsTragicFailureButtonItem;
  self->_showsTragicFailureButtonItem = v9;

  v11 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("🥱"), 0, self, sel_toggleShowsNonMemorable_);
  showsNonMemorableButtonItem = self->_showsNonMemorableButtonItem;
  self->_showsNonMemorableButtonItem = v11;

  v13 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("🤢"), 0, self, sel_toggleShowsPoorQuality_);
  showsPoorQualityButtonItem = self->_showsPoorQualityButtonItem;
  self->_showsPoorQualityButtonItem = v13;

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v23[0] = v6;
  v23[1] = v15;
  v23[2] = v8;
  v23[3] = v15;
  v23[4] = self->_showsTragicFailureButtonItem;
  v23[5] = v15;
  v16 = self->_showsPoorQualityButtonItem;
  v23[6] = self->_showsNonMemorableButtonItem;
  v23[7] = v15;
  v23[8] = v16;
  v23[9] = v15;
  v23[10] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationTragicFailureInHighlightsGridDebugViewController setToolbarItems:](self, "setToolbarItems:", v17);

  -[PUCurationTragicFailureInHighlightsGridDebugViewController setButton:toOn:](self, "setButton:toOn:", v8, self->_showsAll);
  -[PUCurationTragicFailureInHighlightsGridDebugViewController setButton:toOn:](self, "setButton:toOn:", self->_showsTragicFailureButtonItem, self->_showsTragicFailure);
  -[UIBarButtonItem setEnabled:](self->_showsTragicFailureButtonItem, "setEnabled:", !self->_showsAll);
  -[PUCurationTragicFailureInHighlightsGridDebugViewController setButton:toOn:](self, "setButton:toOn:", self->_showsNonMemorableButtonItem, self->_showsNonMemorable);
  -[UIBarButtonItem setEnabled:](self->_showsNonMemorableButtonItem, "setEnabled:", !self->_showsAll);
  -[PUCurationTragicFailureInHighlightsGridDebugViewController setButton:toOn:](self, "setButton:toOn:", self->_showsPoorQualityButtonItem, self->_showsPoorQuality);
  -[UIBarButtonItem setEnabled:](self->_showsPoorQualityButtonItem, "setEnabled:", !self->_showsAll);
  -[PUCurationTragicFailureInHighlightsGridDebugViewController setButton:toOn:](self, "setButton:toOn:", v6, 0);
  -[PUCurationTragicFailureInHighlightsGridDebugViewController setButton:toOn:](self, "setButton:toOn:", v7, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", self->_parentController, sel_goToNextHighlight_);
  objc_msgSend(v18, "setDirection:", 2);
  -[PUCurationTragicFailureInHighlightsGridDebugViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addGestureRecognizer:", v18);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", self->_parentController, sel_goToPreviousHighlight_);
  objc_msgSend(v20, "setDirection:", 1);
  -[PUCurationTragicFailureInHighlightsGridDebugViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addGestureRecognizer:", v20);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewController;
  -[PUPhotosAlbumViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[PUCurationTragicFailureInHighlightsGridDebugViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollToItemAtIndexPath:atScrollPosition:animated:", v5, 1, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewController;
  -[PUPhotosAlbumViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[PUCurationTragicFailureInHighlightsGridDebugViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationTragicFailureInHighlightsGridDebugViewController toolbarItems](self, "toolbarItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarItems:animated:", v5, 1);

  -[PUCurationTragicFailureInHighlightsGridDebugViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToolbarHidden:", 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewController;
  -[PUPhotosAlbumViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)setHighlight:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *allAssets;
  void *v16;
  NSDictionary *v17;
  PUCurationTragicFailureInHighlightsGridDebugViewController *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSDictionary *utilityTypesByAssetUUID;
  void *v30;
  void *v31;
  NSArray *obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[3];
  _QWORD v39[4];

  v39[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_highlight, a3);
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v10);

  v11 = *MEMORY[0x1E0CD19F0];
  v38[0] = *MEMORY[0x1E0CD1A50];
  v38[1] = v11;
  v38[2] = *MEMORY[0x1E0CD1938];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v12);

  v30 = v7;
  v31 = v5;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchedObjects");
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  allAssets = self->_allAssets;
  self->_allAssets = v14;

  objc_msgSend(MEMORY[0x1E0CD1750], "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:", self->_allAssets);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v18 = self;
  obj = self->_allAssets;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v23, "localIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[PUCurationTragicFailureInHighlightsGridDebugViewController utilityTypesWithAsset:sceneClassifications:](v18, "utilityTypesWithAsset:sceneClassifications:", v23, v25);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "uuid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v27, v28);

      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v20);
  }

  utilityTypesByAssetUUID = v18->_utilityTypesByAssetUUID;
  v18->_utilityTypesByAssetUUID = v17;

  -[PUCurationTragicFailureInHighlightsGridDebugViewController update](v18, "update");
}

- (void)getTitle:(id *)a3 prompt:(id *)a4 shouldHideBackButton:(BOOL *)a5 leftBarButtonItems:(id *)a6 rightBarButtonItems:(id *)a7
{
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUTTR"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v13, 0, self, sel__presentTapToRadar);
  v15.receiver = self;
  v15.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewController;
  -[PUPhotosGridViewController getTitle:prompt:shouldHideBackButton:leftBarButtonItems:rightBarButtonItems:](&v15, sel_getTitle_prompt_shouldHideBackButton_leftBarButtonItems_rightBarButtonItems_, a3, a4, a5, a6, a7);
  if (*a6)
  {
    objc_msgSend(*a6, "arrayByAddingObject:", v14);
  }
  else
  {
    v16[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  }
  *a6 = (id)objc_claimAutoreleasedReturnValue();

}

- (void)update
{
  PHPhotosHighlight *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSDictionary *utilityTypesByAssetUUID;
  void *v11;
  void *v12;
  char v13;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  NSArray *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSArray **p_filteredAssets;
  PHPhotosHighlight *v31;
  NSArray *obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  PHPhotosHighlight *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = self->_highlight;
  objc_storeStrong((id *)&self->_filteredAssets, self->_allAssets);
  if (!self->_showsAll)
  {
    p_filteredAssets = &self->_filteredAssets;
    v31 = v3;
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = self->_allAssets;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v34 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          utilityTypesByAssetUUID = self->_utilityTypesByAssetUUID;
          objc_msgSend(v9, "uuid", p_filteredAssets);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](utilityTypesByAssetUUID, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "unsignedIntegerValue");

          if ((!self->_showsTragicFailure || (v13 & 2) == 0)
            && (!self->_showsNonMemorable || (v13 & 4) == 0)
            && (!self->_showsPoorQuality || (v13 & 8) == 0))
          {
            continue;
          }
          -[NSArray addObject:](v4, "addObject:", v9);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v6);
    }

    v17 = *p_filteredAssets;
    *p_filteredAssets = v4;
    v18 = v4;

    v19 = (void *)MEMORY[0x1E0CD13B8];
    v20 = *p_filteredAssets;
    -[PHPhotosHighlight localizedTitle](self->_highlight, "localizedTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "transientAssetCollectionWithAssets:title:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v3 = (PHPhotosHighlight *)v22;
  }
  v23 = (void *)MEMORY[0x1E0CD14E0];
  v37 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1, p_filteredAssets);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotosHighlight localizedTitle](v3, "localizedTitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "transientCollectionListWithCollections:title:", v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v26, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:](self, "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:", v3, v27, 0);
  -[PUCurationTragicFailureInHighlightsGridDebugViewController collectionView](self, "collectionView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "reloadData");

  -[PUCurationTragicFailureInHighlightsGridDebugViewController navigationController](self, "navigationController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setToolbarHidden:", 0);

}

- (BOOL)shouldShowSectionHeaders
{
  return 0;
}

- (void)setButton:(id)a3 toOn:(BOOL)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0DC1298];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setShadowBlurRadius:", 3.0);
  objc_msgSend(v7, "setShadowOffset:", 3.0, 2.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShadowColor:", v8);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 24.0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (a4)
  {
    v11 = *MEMORY[0x1E0DC1198];
    v19[0] = *MEMORY[0x1E0DC1138];
    v19[1] = v11;
    v20[0] = v9;
    v20[1] = v7;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = v20;
    v14 = v19;
    v15 = 2;
  }
  else
  {
    v17 = *MEMORY[0x1E0DC1138];
    v18 = v9;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = &v18;
    v14 = &v17;
    v15 = 1;
  }
  objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleTextAttributes:forState:", v16, 0);
  objc_msgSend(v6, "setWidth:", 0.0);

}

- (void)toggleShowsAll:(id)a3
{
  _BOOL8 v4;

  v4 = !self->_showsAll;
  self->_showsAll ^= 1u;
  -[PUCurationTragicFailureInHighlightsGridDebugViewController setButton:toOn:](self, "setButton:toOn:", a3, v4);
  -[UIBarButtonItem setEnabled:](self->_showsTragicFailureButtonItem, "setEnabled:", !self->_showsAll);
  -[UIBarButtonItem setEnabled:](self->_showsNonMemorableButtonItem, "setEnabled:", !self->_showsAll);
  -[UIBarButtonItem setEnabled:](self->_showsPoorQualityButtonItem, "setEnabled:", !self->_showsAll);
  -[PUCurationTragicFailureInHighlightsGridDebugViewController update](self, "update");
}

- (void)toggleShowsTragicFailure:(id)a3
{
  _BOOL8 v4;

  v4 = !self->_showsTragicFailure;
  self->_showsTragicFailure ^= 1u;
  -[PUCurationTragicFailureInHighlightsGridDebugViewController setButton:toOn:](self, "setButton:toOn:", a3, v4);
  -[PUCurationTragicFailureInHighlightsGridDebugViewController update](self, "update");
}

- (void)toggleShowsNonMemorable:(id)a3
{
  _BOOL8 v4;

  v4 = !self->_showsNonMemorable;
  self->_showsNonMemorable ^= 1u;
  -[PUCurationTragicFailureInHighlightsGridDebugViewController setButton:toOn:](self, "setButton:toOn:", a3, v4);
  -[PUCurationTragicFailureInHighlightsGridDebugViewController update](self, "update");
}

- (void)toggleShowsPoorQuality:(id)a3
{
  _BOOL8 v4;

  v4 = !self->_showsPoorQuality;
  self->_showsPoorQuality ^= 1u;
  -[PUCurationTragicFailureInHighlightsGridDebugViewController setButton:toOn:](self, "setButton:toOn:", a3, v4);
  -[PUCurationTragicFailureInHighlightsGridDebugViewController update](self, "update");
}

- (unint64_t)utilityTypesWithAsset:(id)a3 sceneClassifications:(id)a4
{
  id v5;
  id v6;
  double v7;
  unint64_t v8;
  void *v9;
  float v10;
  float v11;
  double v12;
  float v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  unint64_t v26;
  float v28;
  double v29;
  unint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "curationScore");
  v8 = v7 < 0.5;
  v31 = v5;
  if (objc_msgSend(v5, "isPhoto"))
  {
    objc_msgSend(v5, "mediaAnalysisProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "blurrinessScore");
    if (v10 < 0.01)
      goto LABEL_5;
    objc_msgSend(v5, "overallAestheticScore");
    v12 = v11;

    if (v12 < 0.1)
    {
LABEL_6:
      v8 |= 2uLL;
      goto LABEL_7;
    }
    objc_msgSend(v5, "aestheticProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "failureScore");
    if (v13 < -0.45)
    {
LABEL_5:

      goto LABEL_6;
    }
    objc_msgSend(v9, "tastefullyBlurredScore");
    v29 = v28;

    if (v29 < -0.92)
      goto LABEL_6;
  }
LABEL_7:
  v30 = v8;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = 0;
    v19 = *(_QWORD *)v33;
LABEL_9:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v19)
        objc_enumerationMutation(v14);
      v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v20);
      if (objc_msgSend(v21, "extendedSceneIdentifier", v30) == 2147483644)
      {
        objc_msgSend(v21, "confidence");
        if (v22 >= 0.54)
          break;
      }
      if (objc_msgSend(v21, "extendedSceneIdentifier") == 2147483645)
      {
        objc_msgSend(v21, "confidence");
        v17 = v23 >= 0.675;
      }
      else if (objc_msgSend(v21, "extendedSceneIdentifier") == 2147483646)
      {
        objc_msgSend(v21, "confidence");
        v18 = v24 >= 0.43;
      }
      if (v16 == ++v20)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v16)
          goto LABEL_9;

        if (v17)
        {
          v25 = v31;
          v26 = v30 | 4;
          if (!v18)
            goto LABEL_24;
        }
        else
        {
          v26 = v30;
          v25 = v31;
          if (!v18)
            goto LABEL_24;
        }
        v26 |= 8uLL;
        goto LABEL_24;
      }
    }
  }

  v26 = v30;
  v25 = v31;
LABEL_24:

  return v26;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSArray *filteredAssets;
  uint64_t v9;
  void *v10;
  NSDictionary *utilityTypesByAssetUUID;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewController;
  v6 = a4;
  -[PUPhotosGridViewController collectionView:cellForItemAtIndexPath:](&v15, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  filteredAssets = self->_filteredAssets;
  v9 = objc_msgSend(v6, "item", v15.receiver, v15.super_class);

  -[NSArray objectAtIndexedSubscript:](filteredAssets, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  utilityTypesByAssetUUID = self->_utilityTypesByAssetUUID;
  objc_msgSend(v10, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](utilityTypesByAssetUUID, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUtilityTypes:", objc_msgSend(v13, "unsignedIntegerValue"));

  return v7;
}

- (void)_presentTapToRadar
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isAnyAssetSelectedInAssetCollection:", v4);

  if ((v5 & 1) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__PUCurationTragicFailureInHighlightsGridDebugViewController__presentTapToRadar__block_invoke_2;
    v9[3] = &unk_1E58A9910;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0D7B428], "presentTermsAndConditionsForUIViewController:completion:", self, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("File Radar"), CFSTR("File radar without attaching photos?\nSelecting incorrect photos can help improve the tragic failure classification feature."), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__PUCurationTragicFailureInHighlightsGridDebugViewController__presentTapToRadar__block_invoke;
    v10[3] = &unk_1E58A8DE8;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("File Radar"), 0, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v7);
    objc_msgSend(v6, "addAction:", v8);
    -[PUCurationTragicFailureInHighlightsGridDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

- (void)_fileRadarWithIncorrectAssets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, CFSTR("Collecting data for radar..."), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__PUCurationTragicFailureInHighlightsGridDebugViewController__fileRadarWithIncorrectAssets___block_invoke;
  v8[3] = &unk_1E58AB790;
  v8[4] = self;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PUCurationTragicFailureInHighlightsGridDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, v8);

}

- (BOOL)_writeDiagnosticsToURL:(id)a3 incorrectAssets:(id)a4
{
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  const __CFString *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  NSObject *v85;
  BOOL v86;
  NSObject *v87;
  NSObject *v89;
  id v90;
  id obj;
  uint64_t v92;
  NSObject *v93;
  NSObject *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  NSObject *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  id v114;
  const __CFString *v115;
  NSObject *v116;
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[6];
  _QWORD v120[6];
  void *v121;
  _QWORD v122[2];
  _QWORD v123[2];
  _BYTE v124[128];
  uint8_t v125[128];
  uint8_t buf[4];
  NSObject *v127;
  __int16 v128;
  NSObject *v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = 0;
  v95 = v5;
  LOBYTE(v5) = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v114);
  v8 = v114;

  if ((v5 & 1) != 0)
  {
    v89 = v8;
    v9 = objc_opt_new();
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v90 = v6;
    obj = v6;
    v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v125, 16);
    if (v96)
    {
      v92 = *(_QWORD *)v111;
      v93 = v9;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v111 != v92)
            objc_enumerationMutation(obj);
          v103 = v10;
          v11 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v10);
          -[PUCurationTragicFailureInHighlightsGridDebugViewController _cloneAsset:toDirectory:](self, "_cloneAsset:toDirectory:", v11, v95, v89);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(sel_sceneIdentifier);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_opt_new();
          v102 = v11;
          objc_msgSend(v11, "sceneClassifications");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = 0u;
          v107 = 0u;
          v108 = 0u;
          v109 = 0u;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v106, v124, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v107;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v107 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
                v122[0] = v12;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v19, "extendedSceneIdentifier"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v122[1] = CFSTR("confidence");
                v123[0] = v20;
                v21 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v19, "confidence");
                objc_msgSend(v21, "numberWithDouble:");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v123[1] = v22;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v123, v122, 2);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v13, "addObject:", v23);
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v106, v124, 16);
            }
            while (v16);
          }
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v12, 1);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v121 = v101;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sortUsingDescriptors:", v24);

          v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v26 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v102, "overallAestheticScore");
          objc_msgSend(v26, "numberWithFloat:");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, CFSTR("overallAestheticScore"));

          objc_msgSend(v102, "aestheticProperties");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)MEMORY[0x1E0CB37E8];
          v30 = v28;
          objc_msgSend(v28, "wellFramedSubjectScore");
          objc_msgSend(v29, "numberWithFloat:");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v31, CFSTR("wellFramedSubjectScore"));

          v32 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "wellChosenSubjectScore");
          objc_msgSend(v32, "numberWithFloat:");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v33, CFSTR("wellChosenSubjectScore"));

          v34 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "tastefullyBlurredScore");
          objc_msgSend(v34, "numberWithFloat:");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v35, CFSTR("tastefullyBlurredScore"));

          v36 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "sharplyFocusedSubjectScore");
          objc_msgSend(v36, "numberWithFloat:");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v37, CFSTR("sharplyFocusedSubjectScore"));

          v38 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "wellTimedShotScore");
          objc_msgSend(v38, "numberWithFloat:");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v39, CFSTR("wellTimedShotScore"));

          v40 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "pleasantLightingScore");
          objc_msgSend(v40, "numberWithFloat:");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v41, CFSTR("pleasantLightingScore"));

          v42 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "pleasantReflectionsScore");
          objc_msgSend(v42, "numberWithFloat:");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v43, CFSTR("pleasantReflectionsScore"));

          v44 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "harmoniousColorScore");
          objc_msgSend(v44, "numberWithFloat:");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v45, CFSTR("harmoniousColorScore"));

          v46 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "livelyColorScore");
          objc_msgSend(v46, "numberWithFloat:");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v47, CFSTR("livelyColorScore"));

          v48 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "pleasantSymmetryScore");
          objc_msgSend(v48, "numberWithFloat:");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v49, CFSTR("pleasantSymmetryScore"));

          v50 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "pleasantPatternScore");
          objc_msgSend(v50, "numberWithFloat:");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v51, CFSTR("pleasantPatternScore"));

          v52 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "immersivenessScore");
          objc_msgSend(v52, "numberWithFloat:");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v53, CFSTR("immersivenessScore"));

          v54 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "pleasantPerspectiveScore");
          objc_msgSend(v54, "numberWithFloat:");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v55, CFSTR("pleasantPerspectiveScore"));

          v56 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "pleasantPostProcessingScore");
          objc_msgSend(v56, "numberWithFloat:");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v57, CFSTR("pleasantPostProcessingScore"));

          v58 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "noiseScore");
          objc_msgSend(v58, "numberWithFloat:");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v59, CFSTR("noiseScore"));

          v60 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "failureScore");
          objc_msgSend(v60, "numberWithFloat:");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v61, CFSTR("failureScore"));

          v62 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "pleasantCompositionScore");
          objc_msgSend(v62, "numberWithFloat:");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v63, CFSTR("pleasantCompositionScore"));

          v64 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "interestingSubjectScore");
          objc_msgSend(v64, "numberWithFloat:");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v65, CFSTR("interestingSubjectScore"));

          v66 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "intrusiveObjectPresenceScore");
          objc_msgSend(v66, "numberWithFloat:");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v67, CFSTR("intrusiveObjectPresenceScore"));

          v68 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "pleasantCameraTiltScore");
          objc_msgSend(v68, "numberWithFloat:");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v69, CFSTR("pleasantCameraTiltScore"));

          v70 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v30, "lowLight");
          objc_msgSend(v70, "numberWithFloat:");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v71, CFSTR("lowLight"));

          v119[0] = CFSTR("image");
          objc_msgSend(v104, "lastPathComponent");
          v72 = objc_claimAutoreleasedReturnValue();
          v100 = (void *)v72;
          v73 = &stru_1E58AD278;
          if (v72)
            v73 = (const __CFString *)v72;
          v120[0] = v73;
          v119[1] = CFSTR("analysisVersion");
          v74 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v102, "sceneAnalysisProperties");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "numberWithShort:", objc_msgSend(v99, "sceneAnalysisVersion"));
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v120[1] = v98;
          v119[2] = CFSTR("blurrinessScore");
          v75 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v102, "mediaAnalysisProperties");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "blurrinessScore");
          objc_msgSend(v75, "numberWithFloat:");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v120[2] = v76;
          v119[3] = CFSTR("exposureScore");
          v77 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v102, "mediaAnalysisProperties");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "exposureScore");
          objc_msgSend(v77, "numberWithFloat:");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v120[3] = v79;
          v120[4] = v13;
          v119[4] = CFSTR("sceneClassifications");
          v119[5] = CFSTR("aestheticScores");
          v120[5] = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v119, 6);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v93;
          -[NSObject addObject:](v93, "addObject:", v80);

          v10 = v103 + 1;
        }
        while (v103 + 1 != v96);
        v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v125, 16);
      }
      while (v96);
    }

    v116 = v9;
    v117[0] = CFSTR("type");
    v117[1] = CFSTR("report");
    v118[0] = CFSTR("junk");
    v115 = CFSTR("FP");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v118[1] = v81;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, v117, 2);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    v105 = v89;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v82, 1, &v105);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v105;

    if (v83)
    {
      -[NSObject URLByAppendingPathComponent:](v95, "URLByAppendingPathComponent:", CFSTR("report.json"));
      v85 = objc_claimAutoreleasedReturnValue();
      v86 = 1;
      if ((objc_msgSend(v83, "writeToURL:atomically:", v85, 1) & 1) != 0)
      {
LABEL_29:

        v6 = v90;
        goto LABEL_30;
      }
      PLUIGetLog();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v127 = v85;
        v128 = 2112;
        v129 = v84;
        _os_log_impl(&dword_1AAB61000, v87, OS_LOG_TYPE_ERROR, "Failed to write JSON radar report to path: %@, error: %@", buf, 0x16u);
      }

    }
    else
    {
      PLUIGetLog();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v127 = v84;
        _os_log_impl(&dword_1AAB61000, v85, OS_LOG_TYPE_ERROR, "Failed to create JSON data with error: %@", buf, 0xCu);
      }
    }
    v86 = 0;
    goto LABEL_29;
  }
  PLUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v127 = v95;
    v128 = 2112;
    v129 = v8;
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Failed to create directory for feedback files at path: %@, error: %@", buf, 0x16u);
  }
  v86 = 0;
  v84 = v8;
LABEL_30:

  return v86;
}

- (id)_cloneAsset:(id)a3 toDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  dispatch_semaphore_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  uint64_t *v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(MEMORY[0x1E0CD1438], "assetResourcesForAsset:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "type") == 1)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__79897;
  v39 = __Block_byref_object_dispose__79898;
  v40 = 0;
  if (v8)
  {
    v12 = (void *)MEMORY[0x1AF42B2C0]();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "originalFilename");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pathExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathExtension:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLByAppendingPathComponent:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v36[5];
    v36[5] = v18;

    v20 = objc_alloc_init(MEMORY[0x1E0CD1470]);
    objc_msgSend(v20, "setNetworkAccessAllowed:", 1);
    objc_msgSend(MEMORY[0x1E0CD1458], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = dispatch_semaphore_create(0);
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__79897;
    v33[4] = __Block_byref_object_dispose__79898;
    v34 = 0;
    v23 = v36[5];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __86__PUCurationTragicFailureInHighlightsGridDebugViewController__cloneAsset_toDirectory___block_invoke;
    v28[3] = &unk_1E58A8E38;
    v31 = &v35;
    v29 = v6;
    v32 = v33;
    v24 = v22;
    v30 = v24;
    objc_msgSend(v21, "writeDataForAssetResource:toFile:options:completionHandler:", v8, v23, v20, v28);
    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

    _Block_object_dispose(v33, 8);
    objc_autoreleasePoolPop(v12);
    v25 = (void *)v36[5];
  }
  else
  {
    v25 = 0;
  }
  v26 = v25;
  _Block_object_dispose(&v35, 8);

  return v26;
}

- (PHPhotosHighlight)highlight
{
  return self->_highlight;
}

- (PUCurationTragicFailureInHighlightsDebugViewController)parentController
{
  return self->_parentController;
}

- (void)setParentController:(id)a3
{
  objc_storeStrong((id *)&self->_parentController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentController, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_showsPoorQualityButtonItem, 0);
  objc_storeStrong((id *)&self->_showsNonMemorableButtonItem, 0);
  objc_storeStrong((id *)&self->_showsTragicFailureButtonItem, 0);
  objc_storeStrong((id *)&self->_utilityTypesByAssetUUID, 0);
  objc_storeStrong((id *)&self->_filteredAssets, 0);
  objc_storeStrong((id *)&self->_allAssets, 0);
}

void __86__PUCurationTragicFailureInHighlightsGridDebugViewController__cloneAsset_toDirectory___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Failed to write asset data to URL: %@, error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    v7 = objc_msgSend(getDEUtilsClass_79902(), "copyPath:toDestinationDir:zipped:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32), 1);
    if (v7)
    {
      v5 = v7;
      objc_msgSend(getDEUtilsClass_79902(), "removeFile:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
    }
    else
    {
      PLUIGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Failed to zip the asset, attaching unzipped", (uint8_t *)&v9, 2u);
      }

      v5 = 0;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __92__PUCurationTragicFailureInHighlightsGridDebugViewController__fileRadarWithIncorrectAssets___block_invoke(id *a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "assetCollectionAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = objc_msgSend(a1[5], "count");
  v5 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v4 / (double)v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringFromNumber:numberStyle:", v6, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[CLC] %ld incorrect tragic failure classification(s)"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "appendString:", CFSTR("— Tragic Failure Classification Feedback —\n"));
  objc_msgSend(v9, "appendFormat:", CFSTR("Incorrect Classification(s): %ld of %ld (%@)\n"), v4, v3, v7);
  NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1[4], "_writeDiagnosticsToURL:incorrectAssets:", v14, a1[5]) & 1) == 0)
  {
    PLUIGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v14;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "Failed to write diagnostics to URL: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v16, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v14, 0, 4, &v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v28;
  if (!v17)
  {
    PLUIGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v14;
      v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "Failed to find diagnostic files at URL: %@, error: %@", buf, 0x16u);
    }

  }
  v20 = (void *)MEMORY[0x1E0D7B428];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __92__PUCurationTragicFailureInHighlightsGridDebugViewController__fileRadarWithIncorrectAssets___block_invoke_271;
  v24[3] = &unk_1E58A8E10;
  v24[4] = a1[4];
  v25 = a1[6];
  v26 = v16;
  v27 = v14;
  v21 = v14;
  v22 = v16;
  LOBYTE(v23) = 0;
  objc_msgSend(v20, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:attachmentURLs:includeSysDiagnose:completionHandler:", v8, v9, CFSTR("Other Bug"), CFSTR("721490"), CFSTR("Photos Scene Classification"), CFSTR("all"), &stru_1E58AD278, v17, v23, v24);

}

void __92__PUCurationTragicFailureInHighlightsGridDebugViewController__fileRadarWithIncorrectAssets___block_invoke_271(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setEditing:animated:", 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
  v2 = *(void **)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v8 = 0;
  v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, &v8);
  v5 = v8;
  if ((v4 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to cleanup temporary Tap-To-Radar item at URL: %@, error: %@", buf, 0x16u);
    }

  }
}

uint64_t __80__PUCurationTragicFailureInHighlightsGridDebugViewController__presentTapToRadar__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fileRadarWithIncorrectAssets:", 0);
}

void __80__PUCurationTragicFailureInHighlightsGridDebugViewController__presentTapToRadar__block_invoke_2(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedAssets");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_fileRadarWithIncorrectAssets:", v3);

  }
}

@end
