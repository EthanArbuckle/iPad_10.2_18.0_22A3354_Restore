@implementation PUCurationAssetBrowserViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCurationAssetBrowserViewController;
  -[PUPhotosAlbumViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PUCurationAssetBrowserViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUPhotoCell"));

  -[PUCurationAssetBrowserViewController _update](self, "_update");
}

- (void)setScoreConfiguration:(id)a3 withFaces:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CD1390];
  v7 = *MEMORY[0x1E0CD1A08];
  v15 = *MEMORY[0x1E0CD1960];
  v16 = v7;
  v8 = *MEMORY[0x1E0CD1978];
  v17 = *MEMORY[0x1E0CD19F0];
  v18 = v8;
  v19 = *MEMORY[0x1E0CD1A50];
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", &v15, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAssetsGroupedByFaceUUIDForFaces:fetchPropertySets:", v10, v12, v15, v16, v17, v18, v19, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationAssetBrowserViewController setScoreConfiguration:withAssets:](self, "setScoreConfiguration:withAssets:", v11, v14);

}

- (void)setScoreConfiguration:(id)a3 forAssetUUIDs:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = (void *)MEMORY[0x1E0CD16F8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "px_systemPhotoLibrary");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithUUIDs:options:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(v10, "fetchedObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);

  -[PUCurationAssetBrowserViewController setScoreConfiguration:withAssets:](self, "setScoreConfiguration:withAssets:", v8, v13);
}

- (void)setScoreConfiguration:(id)a3 withAssets:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PUCurationAssetBrowserViewController setScoreConfiguration:](self, "setScoreConfiguration:", a3);
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCurationAssetBrowserViewController setPhotoLibrary:](self, "setPhotoLibrary:", v9);

    -[PUCurationAssetBrowserViewController assetContainersForAssets:](self, "assetContainersForAssets:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCurationAssetBrowserViewController setAssetContainers:](self, "setAssetContainers:", v10);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("score"), 0);
    -[PUCurationAssetBrowserViewController assetContainers](self, "assetContainers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortUsingDescriptors:", v13);

  }
  else
  {
    -[PUCurationAssetBrowserViewController setAssetContainers:](self, "setAssetContainers:", 0);
  }
  if (-[PUCurationAssetBrowserViewController isViewLoaded](self, "isViewLoaded"))
    -[PUCurationAssetBrowserViewController _update](self, "_update");

}

- (void)_update
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[PUCurationAssetBrowserViewController assetContainers](self, "assetContainers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PUCurationAssetBrowserViewController assetContainers](self, "assetContainers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v10), "asset");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  v12 = (void *)MEMORY[0x1E0CD13B8];
  -[PUCurationAssetBrowserViewController scoreConfiguration](self, "scoreConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationAssetBrowserViewController photoLibrary](self, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v5, v14, 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CD14E0];
  v27 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "transientCollectionListWithCollections:title:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:](self, "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:", v16, v21, 0);
  -[PUCurationAssetBrowserViewController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reloadData");

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PUCurationAssetBrowserViewController;
  v6 = a4;
  -[PUPhotosGridViewController collectionView:cellForItemAtIndexPath:](&v14, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationAssetBrowserViewController assetContainers](self, "assetContainers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "score");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScore:", v12);

  return v7;
}

- (id)assetContainersForAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  float v25;
  PUCurationAssetContainer *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    -[PUCurationAssetBrowserViewController scoreConfiguration](self, "scoreConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "dataType");

    if (v7 == 1)
    {
      v8 = (void *)MEMORY[0x1E0D77EE0];
      -[PUCurationAssetBrowserViewController photoLibrary](self, "photoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCurationAssetBrowserViewController scoreConfiguration](self, "scoreConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "plistPathForPhotoLibrary:dataType:", v9, objc_msgSend(v10, "dataType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUCurationAssetBrowserViewController scoreByAssetForPlistPath:](self, "scoreByAssetForPlistPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v28 = v4;
    v13 = v4;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      v17 = 0.0;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v18);
          -[PUCurationAssetBrowserViewController scoreConfiguration](self, "scoreConfiguration");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "dataType");

          if (v21)
          {
            if (v21 != 1)
              goto LABEL_16;
            objc_msgSend(v19, "uuid");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "doubleValue");
            v17 = v24;

          }
          else
          {
            objc_msgSend(v19, "mediaAnalysisProperties");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "wallpaperScore");
            v17 = v25;
          }

LABEL_16:
          if (v17 > 0.0)
          {
            v26 = objc_alloc_init(PUCurationAssetContainer);
            -[PUCurationAssetContainer setScore:](v26, "setScore:", v17);
            -[PUCurationAssetContainer setAsset:](v26, "setAsset:", v19);
            objc_msgSend(v5, "addObject:", v26);

          }
          ++v18;
        }
        while (v15 != v18);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v15);
    }

    v4 = v28;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)scoreByAssetForPlistPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->photoLibrary, a3);
}

- (NSMutableArray)assetContainers
{
  return self->_assetContainers;
}

- (void)setAssetContainers:(id)a3
{
  objc_storeStrong((id *)&self->_assetContainers, a3);
}

- (PNScoreConfiguration)scoreConfiguration
{
  return self->_scoreConfiguration;
}

- (void)setScoreConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_scoreConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreConfiguration, 0);
  objc_storeStrong((id *)&self->_assetContainers, 0);
  objc_storeStrong((id *)&self->photoLibrary, 0);
}

@end
