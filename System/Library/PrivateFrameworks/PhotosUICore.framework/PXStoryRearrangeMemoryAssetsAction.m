@implementation PXStoryRearrangeMemoryAssetsAction

- (PXStoryRearrangeMemoryAssetsAction)initWithModel:(id)a3 movedAssets:(id)a4 beforeAsset:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  PXStoryRearrangeMemoryAssetsAction *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)PXStoryRearrangeMemoryAssetsAction;
  v13 = -[PXPhotosAction initWithPhotoLibrary:](&v15, sel_initWithPhotoLibrary_, v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_model, a3);
    objc_storeStrong((id *)&v13->_movedAssets, a4);
    objc_storeStrong((id *)&v13->_targetAsset, a5);
  }

  return v13;
}

- (id)actionIdentifier
{
  return CFSTR("RearrangeMemoryAssets");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXRearrangeMemoryAssetsActionName");
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD block[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  unint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char v43[32];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXStoryRearrangeMemoryAssetsAction movedAssets](self, "movedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRearrangeMemoryAssetsAction targetAsset](self, "targetAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRearrangeMemoryAssetsAction model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "assetsDataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "allowCustomUserAssets") || !v10 || !objc_msgSend(v5, "count"))
  {

    goto LABEL_8;
  }
  v12 = objc_msgSend(v10, "numberOfSections");

  if (v12 != 1)
  {
LABEL_8:
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    goto LABEL_9;
  }
  objc_msgSend(v10, "firstSectionIndexPath");
  objc_msgSend(v10, "assetsInSectionIndexPath:", v43);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(v13, "count"));
  objc_msgSend(v13, "objectsAtIndexes:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v15, "mutableCopy");

  if (v6)
    v16 = objc_msgSend(v13, "indexOfObject:", v6);
  else
    v16 = objc_msgSend(v13, "count");
  v17 = v31;
  v18 = +[PXDragAndDropUtilities adjustedTargetIndexForCollection:movedObjects:targetIndex:](PXDragAndDropUtilities, "adjustedTargetIndexForCollection:movedObjects:targetIndex:", v31, v5, v16);
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }
  else
  {
    v28 = v14;
    v29 = v13;
    v30 = v6;
    v26 = v18;
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v18, objc_msgSend(v5, "count"));
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v20 = v5;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v40 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(v19, "addObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v22);
    }

    v17 = v31;
    objc_msgSend(v31, "removeObjectsInArray:", v19);
    objc_msgSend(v31, "insertObjects:atIndexes:", v19, v27);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PXStoryRearrangeMemoryAssetsAction_performAction___block_invoke;
    block[3] = &unk_1E51430C0;
    block[4] = self;
    v33 = v8;
    v38 = v26;
    v34 = v10;
    v35 = v19;
    v36 = v31;
    v37 = v4;
    v25 = v19;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v13 = v29;
    v6 = v30;
    v14 = v28;
  }

LABEL_9:
}

- (void)performUndo:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (PXStoryModel)model
{
  return self->_model;
}

- (PXFastEnumeration)movedAssets
{
  return self->_movedAssets;
}

- (PHAsset)targetAsset
{
  return self->_targetAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetAsset, 0);
  objc_storeStrong((id *)&self->_movedAssets, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

void __52__PXStoryRearrangeMemoryAssetsAction_performAction___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PXStoryRearrangeMemoryAssetsAction_performAction___block_invoke_2;
  v5[3] = &unk_1E5143098;
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 80);
  v7 = v3;
  v11 = v4;
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  objc_msgSend(v2, "requestPersistencePermission:", v5);

}

void __52__PXStoryRearrangeMemoryAssetsAction_performAction___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  if (a2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__PXStoryRearrangeMemoryAssetsAction_performAction___block_invoke_3;
    v6[3] = &unk_1E5143070;
    v3 = *(void **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 72);
    v7 = v4;
    v12 = v5;
    v8 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 64);
    objc_msgSend(v3, "performChanges:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __52__PXStoryRearrangeMemoryAssetsAction_performAction___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstSectionIndexPath");
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }
  objc_msgSend(v4, "keyAssetsInSectionIndexPath:", &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*(_QWORD *)(a1 + 72) || objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6))
  {
    objc_msgSend(*(id *)(a1 + 48), "firstObject", v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applyKeyAsset:", v7);

  }
  PXDisplayAssetFetchResultFromArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyCustomUserAssets:", v8);

  objc_msgSend(*(id *)(a1 + 56), "chapterCollectionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 56), "chapterCollectionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performChanges:completionHandler:", &__block_literal_global_271645, *(_QWORD *)(a1 + 64));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __52__PXStoryRearrangeMemoryAssetsAction_performAction___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteAllChapters");
}

@end
