@implementation PXAddAssetsToAssetCollectionAction

- (PXAddAssetsToAssetCollectionAction)initWithAssets:(id)a3 assetCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  PXAddAssetsToAssetCollectionAction *v19;
  uint64_t v20;
  PHPhotoLibrary *targetPhotoLibrary;
  id obj;
  void *v25;
  void *v26;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  obj = a4;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v6, v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fetchedObjectIDsSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v16, "objectID", obj);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v10, "containsObject:", v17);

        if ((v18 & 1) == 0)
          objc_msgSend(v7, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }

  v27.receiver = self;
  v27.super_class = (Class)PXAddAssetsToAssetCollectionAction;
  v19 = -[PXAssetsAction initWithAssets:](&v27, sel_initWithAssets_, v7);
  if (v19)
  {
    objc_msgSend(v6, "photoLibrary");
    v20 = objc_claimAutoreleasedReturnValue();
    targetPhotoLibrary = v19->_targetPhotoLibrary;
    v19->_targetPhotoLibrary = (PHPhotoLibrary *)v20;

    objc_storeStrong((id *)&v19->_assetCollection, obj);
    objc_storeStrong((id *)&v19->_existingAssets, v25);
  }

  return v19;
}

- (PXContentSyndicationPhotoKitAssetGroup)assetGroup
{
  PXContentSyndicationPhotoKitAssetGroup *assetGroup;
  PXContentSyndicationPhotoKitAssetGroup *v4;
  void *v5;
  PXContentSyndicationPhotoKitAssetGroup *v6;
  PXContentSyndicationPhotoKitAssetGroup *v7;

  assetGroup = self->_assetGroup;
  if (!assetGroup)
  {
    v4 = [PXContentSyndicationPhotoKitAssetGroup alloc];
    -[PXAssetsAction assets](self, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXContentSyndicationPhotoKitAssetGroup initWithAssets:](v4, "initWithAssets:", v5);
    v7 = self->_assetGroup;
    self->_assetGroup = v6;

    assetGroup = self->_assetGroup;
  }
  return assetGroup;
}

- (NSArray)userLibraryAssets
{
  void *v2;
  void *v3;

  -[PXAddAssetsToAssetCollectionAction assetGroup](self, "assetGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userLibraryAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)unsavedSyndicatedAssets
{
  void *v2;
  void *v3;

  -[PXAddAssetsToAssetCollectionAction assetGroup](self, "assetGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unsavedSyndicatedAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setShouldSortAssetsByCreationDate:(BOOL)a3
{
  void *v6;

  if (-[PXAction executionStarted](self, "executionStarted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAddAssetsToAssetCollectionAction.m"), 78, CFSTR("%s cannot be called after the receiver has started executing."), "-[PXAddAssetsToAssetCollectionAction setShouldSortAssetsByCreationDate:]");

  }
  self->_shouldSortAssetsByCreationDate = a3;
}

- (void)setDropTargetAsset:(id)a3
{
  PHAsset *v5;
  PHAsset *dropTargetAsset;
  void *v7;

  v5 = (PHAsset *)a3;
  if (-[PXAction executionStarted](self, "executionStarted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAddAssetsToAssetCollectionAction.m"), 83, CFSTR("%s cannot be called after the receiver has started executing."), "-[PXAddAssetsToAssetCollectionAction setDropTargetAsset:]");

  }
  dropTargetAsset = self->_dropTargetAsset;
  self->_dropTargetAsset = v5;

}

- (void)_addAssets:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  PXAddAssetsToAssetCollectionAction *v25;
  BOOL v26;

  v6 = a3;
  v7 = a4;
  -[PXAddAssetsToAssetCollectionAction addedAssets](self, "addedAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = 0;
  else
    v9 = -[PXAddAssetsToAssetCollectionAction shouldSortAssetsByCreationDate](self, "shouldSortAssetsByCreationDate");

  -[PXAddAssetsToAssetCollectionAction existingAssets](self, "existingAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAddAssetsToAssetCollectionAction dropTargetAsset](self, "dropTargetAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAddAssetsToAssetCollectionAction targetPhotoLibrary](self, "targetPhotoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__PXAddAssetsToAssetCollectionAction__addAssets_completionHandler___block_invoke;
  v21[3] = &unk_1E5134020;
  v26 = v9;
  v22 = v6;
  v23 = v11;
  v24 = v10;
  v25 = self;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __67__PXAddAssetsToAssetCollectionAction__addAssets_completionHandler___block_invoke_2;
  v18[3] = &unk_1E5146918;
  v18[4] = self;
  v19 = v22;
  v20 = v7;
  v14 = v7;
  v15 = v22;
  v16 = v10;
  v17 = v11;
  objc_msgSend(v12, "performChanges:completionHandler:", v21, v18);

}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXPhotosGridAddPhotosActionMenuTitle");
}

- (void)performAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PXAddAssetsToAssetCollectionAction assetGroup](self, "assetGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unsavedSyndicatedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "userLibraryAssets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

    objc_msgSend(v4, "syndicationIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAddAssetsToAssetCollectionAction targetPhotoLibrary](self, "targetPhotoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PXContentSyndicationUserLibraryAssetsFromSyndicationIdentifiers(v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addObjectsFromArray:", v11);
    -[PXAddAssetsToAssetCollectionAction assetCollection](self, "assetCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXAddAssetsToLastUsedAssetCollectionAction userDidAddAssetsToAssetCollection:](PXAddAssetsToLastUsedAssetCollectionAction, "userDidAddAssetsToAssetCollection:", v12);

    -[PXAddAssetsToAssetCollectionAction _addAssets:completionHandler:](self, "_addAssets:completionHandler:", v8, v13);
  }

}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[PXAddAssetsToAssetCollectionAction targetPhotoLibrary](self, "targetPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PXAddAssetsToAssetCollectionAction_performUndo___block_invoke;
  v6[3] = &unk_1E5149198;
  v6[4] = self;
  objc_msgSend(v5, "performChanges:completionHandler:", v6, v4);

}

- (void)performRedo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXAddAssetsToAssetCollectionAction addedAssets](self, "addedAssets");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXAddAssetsToAssetCollectionAction _addAssets:completionHandler:](self, "_addAssets:completionHandler:", v5, v4);

}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (BOOL)shouldSortAssetsByCreationDate
{
  return self->_shouldSortAssetsByCreationDate;
}

- (PHAsset)dropTargetAsset
{
  return self->_dropTargetAsset;
}

- (PHPhotoLibrary)targetPhotoLibrary
{
  return self->_targetPhotoLibrary;
}

- (PHFetchResult)existingAssets
{
  return self->_existingAssets;
}

- (PXFastEnumeration)addedAssets
{
  return self->_addedAssets;
}

- (void)setAddedAssets:(id)a3
{
  objc_storeStrong((id *)&self->_addedAssets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedAssets, 0);
  objc_storeStrong((id *)&self->_existingAssets, 0);
  objc_storeStrong((id *)&self->_targetPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_dropTargetAsset, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_assetGroup, 0);
}

void __50__PXAddAssetsToAssetCollectionAction_performUndo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CD13C8];
  objc_msgSend(*(id *)(a1 + 32), "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeRequestForAssetCollection:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addedAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAssets:", v4);

}

void __67__PXAddAssetsToAssetCollectionAction__addAssets_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (void *)MEMORY[0x1E0CD1390];
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "px_orderedAssetsFromAssets:sortDescriptors:", v3, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = *(id *)(a1 + 32);
  }
  if (*(_QWORD *)(a1 + 40))
    v7 = objc_msgSend(*(id *)(a1 + 48), "indexOfObject:");
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = (void *)MEMORY[0x1E0CD13C8];
  objc_msgSend(*(id *)(a1 + 56), "assetCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changeRequestForAssetCollection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(a1 + 48), "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v11, "addIndex:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v11, "count"))
    objc_msgSend(v10, "removeAssets:", v12);
  if (objc_msgSend(v11, "count", (_QWORD)v19) && *(_QWORD *)(a1 + 40))
  {
    if ((objc_msgSend(v11, "containsIndex:", v7) & 1) != 0)
      goto LABEL_23;
    v7 -= objc_msgSend(v11, "countOfIndexesInRange:", 0, v7);
  }
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertAssets:atIndexes:", v12, v18);

    goto LABEL_25;
  }
LABEL_23:
  objc_msgSend(v10, "addAssets:", v12);
LABEL_25:

}

void __67__PXAddAssetsToAssetCollectionAction__addAssets_completionHandler___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v5 = (void *)a1[4];
  v4 = a1[5];
  v6 = a3;
  objc_msgSend(v5, "setAddedAssets:", v4);
  (*(void (**)(void))(a1[6] + 16))();

}

@end
