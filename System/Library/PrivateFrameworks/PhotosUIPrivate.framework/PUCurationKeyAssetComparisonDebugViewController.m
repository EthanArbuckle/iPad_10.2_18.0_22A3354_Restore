@implementation PUCurationKeyAssetComparisonDebugViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PUCurationKeyAssetComparisonDebugViewController;
  -[PUPhotosAlbumViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PUCurationKeyAssetComparisonDebugViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("PUCurationKeyAssetComparisonViewSectionHeaderReuseIdentifier"));

  self->_showsDifferentOnly = 1;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("☑︎Different Only"), 0, self, sel_toggleShowsDifferentOnly_);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("☐Meaningful Only"), 0, self, sel_toggleShowsMeaningsOnly_);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v9[0] = v6;
  v9[1] = v4;
  v9[2] = v6;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationKeyAssetComparisonDebugViewController setToolbarItems:](self, "setToolbarItems:", v7);

  -[PUCurationKeyAssetComparisonDebugViewController _fetchHighlights](self, "_fetchHighlights");
}

- (void)_fetchHighlights
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSUInteger v17;
  NSMutableArray *v18;
  NSMutableArray *currentKeyAssets;
  NSMutableArray *v20;
  NSMutableArray *legacyKeyAssets;
  NSMutableArray *v22;
  NSMutableArray *modernKeyAssets;
  NSMutableArray *v24;
  NSMutableArray *keyAssetReasons;
  NSMutableArray *v26;
  NSMutableArray *indexMap;
  PHNullAsset *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  NSArray *obj;
  _QWORD block[4];
  id v45;
  PUCurationKeyAssetComparisonDebugViewController *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _QWORD v53[3];
  _QWORD v54[5];

  v54[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000301, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchedObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v10);

  v42 = v3;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000304, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchedObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v12);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortUsingDescriptors:", v16);

  v40 = v8;
  objc_storeStrong((id *)&self->_highlights, v8);
  v17 = -[NSArray count](self->_highlights, "count");
  v18 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v17);
  currentKeyAssets = self->_currentKeyAssets;
  self->_currentKeyAssets = v18;

  v20 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v17);
  legacyKeyAssets = self->_legacyKeyAssets;
  self->_legacyKeyAssets = v20;

  v22 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v17);
  modernKeyAssets = self->_modernKeyAssets;
  self->_modernKeyAssets = v22;

  v24 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v17);
  keyAssetReasons = self->_keyAssetReasons;
  self->_keyAssetReasons = v24;

  v26 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v17);
  indexMap = self->_indexMap;
  self->_indexMap = v26;

  v28 = objc_alloc_init(PHNullAsset);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = self->_highlights;
  v29 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v49 != v31)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)v34;
        if (v34)
          v36 = (void *)v34;
        else
          v36 = v28;
        v37 = v36;

        -[NSMutableArray addObject:](self->_currentKeyAssets, "addObject:", v37);
        -[NSMutableArray addObject:](self->_legacyKeyAssets, "addObject:", v28);
        -[NSMutableArray addObject:](self->_modernKeyAssets, "addObject:", v28);

        -[NSMutableArray addObject:](self->_keyAssetReasons, "addObject:", &stru_1E58AD278);
      }
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v30);
  }

  dispatch_get_global_queue(25, 0);
  v38 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PUCurationKeyAssetComparisonDebugViewController__fetchHighlights__block_invoke;
  block[3] = &unk_1E58AB790;
  v45 = v41;
  v46 = self;
  v47 = &unk_1E59BABB0;
  v39 = v41;
  dispatch_async(v38, block);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUCurationKeyAssetComparisonDebugViewController;
  -[PUPhotosAlbumViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  self->_canLiveUpdate = 1;
  -[PUCurationKeyAssetComparisonDebugViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationKeyAssetComparisonDebugViewController toolbarItems](self, "toolbarItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarItems:animated:", v5, 1);

  -[PUCurationKeyAssetComparisonDebugViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToolbarHidden:", 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCurationKeyAssetComparisonDebugViewController;
  -[PUPhotosAlbumViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_canLiveUpdate = 0;
}

- (BOOL)shouldShowSectionHeaders
{
  return 1;
}

- (void)toggleShowsDifferentOnly:(id)a3
{
  _BOOL4 showsDifferentOnly;
  const __CFString *v6;

  showsDifferentOnly = self->_showsDifferentOnly;
  self->_showsDifferentOnly = !showsDifferentOnly;
  if (showsDifferentOnly)
    v6 = CFSTR("☐Different Only");
  else
    v6 = CFSTR("☑︎Different Only");
  objc_msgSend(a3, "setTitle:", v6);
  -[PUCurationKeyAssetComparisonDebugViewController updateData](self, "updateData");
}

- (void)toggleShowsMeaningsOnly:(id)a3
{
  _BOOL4 showsMeaningsOnly;
  const __CFString *v6;

  showsMeaningsOnly = self->_showsMeaningsOnly;
  self->_showsMeaningsOnly = !showsMeaningsOnly;
  if (showsMeaningsOnly)
    v6 = CFSTR("☐Meaningful Only");
  else
    v6 = CFSTR("☑︎Meaningful Only");
  objc_msgSend(a3, "setTitle:", v6);
  -[PUCurationKeyAssetComparisonDebugViewController updateData](self, "updateData");
}

- (void)updateData
{
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableArray *indexMap;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSMutableArray *obj;
  void *v35;
  void *v36;
  NSUInteger v37;
  void *v38;
  _QWORD v39[4];

  v39[3] = *MEMORY[0x1E0C80C00];
  obj = self->_legacyKeyAssets;
  objc_sync_enter(obj);
  v37 = -[NSArray count](self->_highlights, "count");
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v37);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3 * v37);
  -[NSMutableArray removeAllObjects](self->_indexMap, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    for (i = 0; v37 != i; ++i)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_currentKeyAssets, "objectAtIndexedSubscript:", i);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_legacyKeyAssets, "objectAtIndexedSubscript:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_modernKeyAssets, "objectAtIndexedSubscript:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!self->_showsDifferentOnly)
        goto LABEL_10;
      if ((objc_msgSend(v4, "isTransient") & 1) != 0)
        goto LABEL_10;
      if ((objc_msgSend(v5, "isTransient") & 1) != 0)
        goto LABEL_10;
      if ((objc_msgSend(v6, "isTransient") & 1) != 0)
        goto LABEL_10;
      objc_msgSend(v4, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      if (!v9
        || (objc_msgSend(v5, "uuid"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "uuid"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v10, "isEqualToString:", v11),
            v11,
            v10,
            !v12))
      {
LABEL_10:
        v16 = 1;
      }
      else
      {
        objc_msgSend(v6, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        v16 = v15 ^ 1;
      }
      if (self->_showsMeaningsOnly)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_keyAssetReasons, "objectAtIndexedSubscript:", i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "hasPrefix:", CFSTR("Meanings"));

        if ((v16 & v18 & 1) != 0)
          goto LABEL_15;
      }
      else if (v16)
      {
LABEL_15:
        objc_msgSend(v38, "addObject:", v4);
        objc_msgSend(v38, "addObject:", v5);
        objc_msgSend(v38, "addObject:", v6);
        -[NSArray objectAtIndexedSubscript:](self->_highlights, "objectAtIndexedSubscript:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndexedSubscript:](self->_keyAssetReasons, "objectAtIndexedSubscript:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "length"))
        {
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v19, "localizedSubtitle");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray objectAtIndexedSubscript:](self->_keyAssetReasons, "objectAtIndexedSubscript:", i);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ - %@"), v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v19, "localizedSubtitle");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v25 = (void *)MEMORY[0x1E0CD13B8];
        v39[0] = v4;
        v39[1] = v5;
        v39[2] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v26, v24, 0, v36);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "addObject:", v27);
        indexMap = self->_indexMap;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](indexMap, "addObject:", v29);

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v38, &stru_1E58AD278, 0, v36);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD14E0], "transientCollectionListWithCollections:title:", v35, CFSTR("Highlights"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v31, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:](self, "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:", v30, v32, 0);
  -[PUCurationKeyAssetComparisonDebugViewController navigationController](self, "navigationController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setToolbarHidden:", 0);

  objc_sync_exit(obj);
}

- (void)didTapHeaderView:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[NSMutableArray objectAtIndexedSubscript:](self->_indexMap, "objectAtIndexedSubscript:", objc_msgSend(a3, "sectionIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  -[NSArray objectAtIndexedSubscript:](self->_highlights, "objectAtIndexedSubscript:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B4F0]), "initWithHighlight:", v8);
  objc_msgSend(v6, "setInitiallyShowCuration:", 1);
  objc_msgSend(v6, "setCurrentCurationType:", 0);
  -[PUCurationKeyAssetComparisonDebugViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v6, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleAssets, 0);
  objc_storeStrong((id *)&self->_indexMap, 0);
  objc_storeStrong((id *)&self->_keyAssetReasons, 0);
  objc_storeStrong((id *)&self->_modernKeyAssets, 0);
  objc_storeStrong((id *)&self->_legacyKeyAssets, 0);
  objc_storeStrong((id *)&self->_currentKeyAssets, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
}

void __67__PUCurationKeyAssetComparisonDebugViewController__fetchHighlights__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  id obj;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v31[5];
  _QWORD block[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "librarySpecificFetchOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 40) + 1800);
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v24)
  {
    v1 = 0;
    v22 = *(_QWORD *)v39;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v39 != v22)
        {
          v3 = v2;
          objc_enumerationMutation(obj);
          v2 = v3;
        }
        v26 = v2;
        v4 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v2), "localIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(a1 + 48);
        v37 = 0;
        objc_msgSend(v4, "curationDebugInformationForAssetCollectionWithLocalIdentifier:options:error:", v5, v6, &v37);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v37;

        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("keyAssetComparison"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0CD1390];
        objc_msgSend(v7, "allValues");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "fetchAssetsWithLocalIdentifiers:options:", v9, v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = *(id *)(*(_QWORD *)(a1 + 40) + 1816);
        objc_sync_enter(v27);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v29 = v10;
        v11 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v34 != v12)
                objc_enumerationMutation(v29);
              v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(v14, "uuid");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("legacyKeyAssetUUID"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v15, "isEqualToString:", v16);

              if (v17)
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1816), "replaceObjectAtIndex:withObject:", v1, v14);
              objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("keyAssetUUID"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v15, "isEqualToString:", v18);

              if (v19)
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1824), "replaceObjectAtIndex:withObject:", v1, v14);

            }
            v11 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v11);
        }

        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("keyAssetReason"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "length"))
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1832), "replaceObjectAtIndex:withObject:", v1, v20);

        objc_sync_exit(v27);
        if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * (v1 - 9), 1) <= 0x1999999999999998uLL)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __67__PUCurationKeyAssetComparisonDebugViewController__fetchHighlights__block_invoke_2;
          block[3] = &unk_1E58ABD10;
          block[4] = *(_QWORD *)(a1 + 40);
          dispatch_async(MEMORY[0x1E0C80D38], block);
        }

        ++v1;
        v2 = v26 + 1;
      }
      while (v26 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v24);
  }

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __67__PUCurationKeyAssetComparisonDebugViewController__fetchHighlights__block_invoke_3;
  v31[3] = &unk_1E58ABD10;
  v31[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v31);

}

_BYTE *__67__PUCurationKeyAssetComparisonDebugViewController__fetchHighlights__block_invoke_2(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[1858])
    return (_BYTE *)objc_msgSend(result, "updateData");
  return result;
}

_BYTE *__67__PUCurationKeyAssetComparisonDebugViewController__fetchHighlights__block_invoke_3(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[1858])
    return (_BYTE *)objc_msgSend(result, "updateData");
  return result;
}

@end
