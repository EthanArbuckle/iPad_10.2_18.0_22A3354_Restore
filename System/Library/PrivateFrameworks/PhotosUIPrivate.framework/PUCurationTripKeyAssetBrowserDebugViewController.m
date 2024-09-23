@implementation PUCurationTripKeyAssetBrowserDebugViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCurationTripKeyAssetBrowserDebugViewController;
  -[PUPhotosAlbumViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PUCurationTripKeyAssetBrowserDebugViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUPhotoCell"));

  -[PUCurationTripKeyAssetBrowserDebugViewController _update](self, "_update");
}

- (BOOL)updateSpec
{
  return 0;
}

- (void)_update
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *tripKeyAssetUUID;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PHFetchResult *v13;
  PHFetchResult *childHighlights;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSDictionary *v21;
  NSDictionary *iconicSceneScores;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  if (self->_tripHighlight)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "librarySpecificFetchOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", self->_tripHighlight, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    tripKeyAssetUUID = self->_tripKeyAssetUUID;
    self->_tripKeyAssetUUID = v7;

    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSortDescriptors:", v12);

    objc_msgSend(MEMORY[0x1E0CD1708], "fetchChildDayGroupHighlightsForHighlight:options:", self->_tripHighlight, v10);
    v13 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    childHighlights = self->_childHighlights;
    self->_childHighlights = v13;

    objc_msgSend(MEMORY[0x1E0D77E98], "requiredFetchPropertySets");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFetchPropertySets:", v15);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetByHighlightUUIDForHighlights:options:", self->_childHighlights, v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sortedArrayUsingDescriptors:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUCurationTripKeyAssetBrowserDebugViewController iconicSceneScores:](self, "iconicSceneScores:", v20);
    v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    iconicSceneScores = self->_iconicSceneScores;
    self->_iconicSceneScores = v21;

    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v20, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CD14E0];
    v30 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedTitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "transientCollectionListWithCollections:title:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v27, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosAlbumViewController setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:](self, "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:", v23, v28, 0);

  }
  else
  {
    -[PUPhotosAlbumViewController setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:](self, "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:", 0, 0, 0);
  }
  -[PUCurationTripKeyAssetBrowserDebugViewController collectionView](self, "collectionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "reloadData");

}

- (id)iconicSceneScores:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v10, "iconicScoreProperties", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "iconicScore");
        objc_msgSend(v11, "numberWithDouble:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)setTripHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_tripHighlight, a3);
  if (-[PUCurationTripKeyAssetBrowserDebugViewController isViewLoaded](self, "isViewLoaded"))
    -[PUCurationTripKeyAssetBrowserDebugViewController _update](self, "_update");
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PHFetchResult *childHighlights;
  uint64_t v11;
  void *v12;
  NSDictionary *iconicSceneScores;
  void *v14;
  void *v15;
  double v16;
  double v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PUCurationTripKeyAssetBrowserDebugViewController;
  v6 = a4;
  -[PUPhotosGridViewController collectionView:cellForItemAtIndexPath:](&v24, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController assetCollectionAssets](self, "assetCollectionAssets", v24.receiver, v24.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  childHighlights = self->_childHighlights;
  v11 = objc_msgSend(v6, "item");

  -[PHFetchResult objectAtIndexedSubscript:](childHighlights, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  iconicSceneScores = self->_iconicSceneScores;
  objc_msgSend(v9, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](iconicSceneScores, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(v9, "curationScore");
  objc_msgSend(v7, "setCurationScore:");
  objc_msgSend(v9, "overallAestheticScore");
  objc_msgSend(v7, "setAestheticScore:", v18);
  objc_msgSend(v12, "promotionScore");
  objc_msgSend(v7, "setPromotionScore:");
  objc_msgSend(v7, "setIconicSceneScore:", v17);
  objc_msgSend(v9, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToString:", self->_tripKeyAssetUUID) & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v20);

  objc_msgSend(v12, "localizedTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v21);

  objc_msgSend(v12, "localizedSubtitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSubtitle:", v22);

  return v7;
}

- (PHPhotosHighlight)tripHighlight
{
  return self->_tripHighlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripHighlight, 0);
  objc_storeStrong((id *)&self->_iconicSceneScores, 0);
  objc_storeStrong((id *)&self->_childHighlights, 0);
  objc_storeStrong((id *)&self->_tripKeyAssetUUID, 0);
}

@end
