@implementation PXRemoveAssetsFromAssetCollectionAction

- (PXRemoveAssetsFromAssetCollectionAction)initWithAssets:(id)a3 assetCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PXRemoveAssetsFromAssetCollectionAction *v11;
  uint64_t v12;
  NSArray *assetsInput;
  PXRemoveAssetsFromAssetCollectionAction *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXPhotosAction initWithPhotoLibrary:](self, "initWithPhotoLibrary:", v10);

    if (v11)
    {
      v12 = objc_msgSend(v6, "copy");
      assetsInput = v11->_assetsInput;
      v11->_assetsInput = (NSArray *)v12;

      objc_storeStrong((id *)&v11->_collectionInput, a4);
    }
    self = v11;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)actionIdentifier
{
  return CFSTR("RemoveAssetsFromAssetCollection");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXPhotoKitAssetActionManagerStandardActionTitle_Remove");
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke;
  v15[3] = &unk_1E51457C8;
  v15[4] = self;
  v16 = v5;
  v17 = v6;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke_5;
  v11[3] = &unk_1E5146940;
  v11[4] = self;
  v12 = v16;
  v13 = v17;
  v14 = v4;
  v8 = v4;
  v9 = v17;
  v10 = v16;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v15, v11);

}

- (void)performUndo:(id)a3
{
  NSDictionary *removedAssetIdentifiers;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PXRemoveAssetsFromAssetCollectionAction *v13;
  id v14;
  id v15;

  removedAssetIdentifiers = self->_removedAssetIdentifiers;
  v5 = a3;
  -[NSDictionary allKeys](removedAssetIdentifiers, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAction standardFetchOptions](self, "standardFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithLocalIdentifiers:options:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__PXRemoveAssetsFromAssetCollectionAction_performUndo___block_invoke_2;
  v11[3] = &unk_1E5148370;
  v12 = v8;
  v13 = self;
  v14 = v7;
  v15 = &__block_literal_global_28_142542;
  v9 = v7;
  v10 = v8;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v11, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionInput, 0);
  objc_storeStrong((id *)&self->_assetsInput, 0);
  objc_storeStrong((id *)&self->_removedAssetIndexes, 0);
  objc_storeStrong((id *)&self->_removedAssetIdentifiers, 0);
}

void __55__PXRemoveAssetsFromAssetCollectionAction_performUndo___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = v2;
    v14 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v16 != v14)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v5, "localIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v8, *(_QWORD *)(a1 + 48));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, *(_QWORD *)(a1 + 48));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD13C8], "changeRequestForAssetCollection:assets:", v5, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v7, objc_msgSend(v10, "count"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "insertAssets:atIndexes:", v9, v12);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v3);
  }

}

id __55__PXRemoveAssetsFromAssetCollectionAction_performUndo___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v6 = objc_msgSend(v4, "firstIndex");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    do
    {
      if (v7 >= a3)
        v8 = a3;
      else
        v8 = v7;
      objc_msgSend(v5, "addIndex:", v8);
      v7 = objc_msgSend(v4, "indexGreaterThanIndex:", v7);
      ++a3;
    }
    while (v7 != 0x7FFFFFFFFFFFFFFFLL);
  }
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

void __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD13C8], "changeRequestForAssetCollection:assets:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAssets:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "localIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    PXMap();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, v2);

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke_3;
    v6[3] = &unk_1E512D108;
    v4 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v4, "enumerateSelectedAssetIndexSetsUsingBlock:", v6);

  }
}

void __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 48));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  objc_msgSend(v8, "objectsAtIndexes:", v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13C8], "changeRequestForAssetCollection:assets:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeAssets:", v13);
  objc_msgSend(v9, "localIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PXMap();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v11);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v11);
}

uint64_t __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

uint64_t __57__PXRemoveAssetsFromAssetCollectionAction_performAction___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

@end
