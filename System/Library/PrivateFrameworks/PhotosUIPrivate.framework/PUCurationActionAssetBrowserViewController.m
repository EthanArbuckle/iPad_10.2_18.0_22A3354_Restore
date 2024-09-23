@implementation PUCurationActionAssetBrowserViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCurationActionAssetBrowserViewController;
  -[PUPhotosAlbumViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PUCurationActionAssetBrowserViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUPhotoCell"));

  -[PUCurationActionAssetBrowserViewController _update](self, "_update");
}

- (void)setTraitContainer:(id)a3 withFaces:(id)a4 detectionTraitsByFaceLocalIdentifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  PUCurationActionAssetContainer *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  PUCurationActionAssetBrowserViewController *v34;
  uint64_t v35;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v36 = a5;
  -[PUCurationActionAssetBrowserViewController setTraitContainer:](self, "setTraitContainer:", a3);
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationActionAssetBrowserViewController setCurationPhotoLibrary:](self, "setCurationPhotoLibrary:", v10);

  v33 = v8;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsGroupedByFaceUUIDForFaces:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationActionAssetBrowserViewController traitContainer](self, "traitContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "value");

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v34 = self;
  -[PUCurationActionAssetBrowserViewController setAssetContainers:](self, "setAssetContainers:", v14);

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v11;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v15)
  {
    v16 = v15;
    v35 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v43 != v35)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CD1528], "localIdentifierWithUUID:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v39;
          while (2)
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v39 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
              if (objc_msgSend(v26, "type") == 1 && objc_msgSend(v26, "value") == v13)
              {
                v27 = objc_alloc_init(PUCurationActionAssetContainer);
                objc_msgSend(obj, "objectForKeyedSubscript:", v18);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[PUCurationActionAssetContainer setAsset:](v27, "setAsset:", v28);

                objc_msgSend(v26, "score");
                -[PUCurationActionAssetContainer setScore:](v27, "setScore:");
                -[PUCurationActionAssetBrowserViewController assetContainers](v34, "assetContainers");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "addObject:", v27);

                goto LABEL_17;
              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
            if (v23)
              continue;
            break;
          }
        }
LABEL_17:

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v16);
  }

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("score"), 0);
  -[PUCurationActionAssetBrowserViewController assetContainers](v34, "assetContainers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sortUsingDescriptors:", v32);

  if (-[PUCurationActionAssetBrowserViewController isViewLoaded](v34, "isViewLoaded"))
    -[PUCurationActionAssetBrowserViewController _update](v34, "_update");

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
  -[PUCurationActionAssetBrowserViewController assetContainers](self, "assetContainers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PUCurationActionAssetBrowserViewController assetContainers](self, "assetContainers", 0);
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
  -[PUCurationActionAssetBrowserViewController traitContainer](self, "traitContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationActionAssetBrowserViewController curationPhotoLibrary](self, "curationPhotoLibrary");
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
  -[PUCurationActionAssetBrowserViewController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reloadData");

}

- (id)_globalHeaderTitle
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  -[PUCurationActionAssetBrowserViewController traitContainer](self, "traitContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "highPrecisionOperatingPoint");
  v5 = v4;
  objc_msgSend(v2, "operatingPoint");
  v7 = v6;
  objc_msgSend(v2, "highRecallOperatingPoint");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Green: >= %.3f (HighPrecision), Black/White: >= %.3f (OperatingPoint), Yellow: >= %.3f (HighRecall), Red: else"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)configureGlobalHeaderView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUCurationActionAssetBrowserViewController _globalHeaderTitle](self, "_globalHeaderTitle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

}

- (double)globalHeaderHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[PUCurationActionAssetBrowserViewController _globalHeaderTitle](self, "_globalHeaderTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationActionAssetBrowserViewController _existingView](self, "_existingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0D7B7F0], "sizeThatFits:forTitle:", v3, v6, v8);
  v10 = v9;

  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD block[4];
  id v21;
  void *v22;
  uint64_t v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PUCurationActionAssetBrowserViewController;
  v6 = a4;
  -[PUPhotosGridViewController collectionView:cellForItemAtIndexPath:](&v24, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationActionAssetBrowserViewController assetContainers](self, "assetContainers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "score");
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScore:", v13);

  -[PUCurationActionAssetBrowserViewController traitContainer](self, "traitContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PUCurationActionAssetBrowserViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  block[3] = &unk_1E58A9DF0;
  v15 = v7;
  v23 = v12;
  v21 = v15;
  v22 = v14;
  v16 = v14;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v17 = v22;
  v18 = v15;

  return v18;
}

- (NSMutableArray)assetContainers
{
  return self->_assetContainers;
}

- (void)setAssetContainers:(id)a3
{
  objc_storeStrong((id *)&self->_assetContainers, a3);
}

- (PUCurationTraitContainer)traitContainer
{
  return self->_traitContainer;
}

- (void)setTraitContainer:(id)a3
{
  objc_storeStrong((id *)&self->_traitContainer, a3);
}

- (PHPhotoLibrary)curationPhotoLibrary
{
  return self->_curationPhotoLibrary;
}

- (void)setCurationPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_curationPhotoLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_traitContainer, 0);
  objc_storeStrong((id *)&self->_assetContainers, 0);
}

void __84__PUCurationActionAssetBrowserViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;

  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "highPrecisionOperatingPoint");
  if (v2 >= v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = *(double *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "operatingPoint");
    if (v4 >= v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = *(double *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "highRecallOperatingPoint");
      if (v6 >= v7)
        objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v8 = objc_claimAutoreleasedReturnValue();
    }
  }
  v9 = (id)v8;
  objc_msgSend(*(id *)(a1 + 32), "setColor:", v8);

}

@end
