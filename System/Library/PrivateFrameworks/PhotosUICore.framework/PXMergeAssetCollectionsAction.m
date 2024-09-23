@implementation PXMergeAssetCollectionsAction

- (PXMergeAssetCollectionsAction)initWithSourceAssetCollections:(id)a3 targetAssetCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PXMergeAssetCollectionsAction *v9;
  uint64_t v10;
  PXFastEnumeration *sourceAssetCollections;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)PXMergeAssetCollectionsAction;
  v9 = -[PXPhotosAction initWithPhotoLibrary:](&v13, sel_initWithPhotoLibrary_, v8);

  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    sourceAssetCollections = v9->_sourceAssetCollections;
    v9->_sourceAssetCollections = (PXFastEnumeration *)v10;

    objc_storeStrong((id *)&v9->_targetAssetCollection, a4);
  }

  return v9;
}

- (id)actionIdentifier
{
  return CFSTR("MergeAssetCollection");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXMergeAlbumActionName");
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PXDeleteCollectionsAction *v13;
  PXAddAssetsToAssetCollectionAction *v14;
  void *v15;
  PXAddAssetsToAssetCollectionAction *v16;
  void *v17;
  _QWORD v18[4];
  PXDeleteCollectionsAction *v19;
  id v20;
  _QWORD v21[4];
  PXAddAssetsToAssetCollectionAction *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMergeAssetCollectionsAction sourceAssetCollections](self, "sourceAssetCollections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
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
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10), 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fetchedObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }
  v13 = -[PXDeleteCollectionsAction initWithCollections:]([PXDeleteCollectionsAction alloc], "initWithCollections:", v6);
  -[PXMergeAssetCollectionsAction setDeleteCollectionsAction:](self, "setDeleteCollectionsAction:", v13);
  if (objc_msgSend(v5, "count"))
  {
    v14 = [PXAddAssetsToAssetCollectionAction alloc];
    -[PXMergeAssetCollectionsAction targetAssetCollection](self, "targetAssetCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PXAddAssetsToAssetCollectionAction initWithAssets:assetCollection:](v14, "initWithAssets:assetCollection:", v5, v15);

    -[PXMergeAssetCollectionsAction setAddAssetsToCollectionAction:](self, "setAddAssetsToCollectionAction:", v16);
    if (v16)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __47__PXMergeAssetCollectionsAction_performAction___block_invoke_2;
      v18[3] = &unk_1E5148348;
      v20 = v4;
      v19 = v13;
      -[PXAddAssetsToAssetCollectionAction performAction:](v16, "performAction:", v18);

      v17 = v20;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Unable to merge asset collections"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v17);
    }

    goto LABEL_15;
  }
  if (v13)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __47__PXMergeAssetCollectionsAction_performAction___block_invoke;
    v21[3] = &unk_1E51417E8;
    v22 = (PXAddAssetsToAssetCollectionAction *)v4;
    -[PXDeleteCollectionsAction performAction:](v13, "performAction:", v21);
    v16 = v22;
LABEL_15:

  }
}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[PXMergeAssetCollectionsAction deleteCollectionsAction](self, "deleteCollectionsAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMergeAssetCollectionsAction addAssetsToCollectionAction](self, "addAssetsToCollectionAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__PXMergeAssetCollectionsAction_performUndo___block_invoke;
    v8[3] = &unk_1E5148348;
    v10 = v4;
    v9 = v6;
    objc_msgSend(v5, "performUndo:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Unable to undo merge of asset collections"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v7);

  }
}

- (PXFastEnumeration)sourceAssetCollections
{
  return self->_sourceAssetCollections;
}

- (PHAssetCollection)targetAssetCollection
{
  return self->_targetAssetCollection;
}

- (PXAddAssetsToAssetCollectionAction)addAssetsToCollectionAction
{
  return self->_addAssetsToCollectionAction;
}

- (void)setAddAssetsToCollectionAction:(id)a3
{
  objc_storeStrong((id *)&self->_addAssetsToCollectionAction, a3);
}

- (PXDeleteCollectionsAction)deleteCollectionsAction
{
  return self->_deleteCollectionsAction;
}

- (void)setDeleteCollectionsAction:(id)a3
{
  objc_storeStrong((id *)&self->_deleteCollectionsAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteCollectionsAction, 0);
  objc_storeStrong((id *)&self->_addAssetsToCollectionAction, 0);
  objc_storeStrong((id *)&self->_targetAssetCollection, 0);
  objc_storeStrong((id *)&self->_sourceAssetCollections, 0);
}

void __45__PXMergeAssetCollectionsAction_performUndo___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    if (v6)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __45__PXMergeAssetCollectionsAction_performUndo___block_invoke_2;
      v7[3] = &unk_1E51417E8;
      v8 = *(id *)(a1 + 40);
      objc_msgSend(v6, "performUndo:", v7);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __45__PXMergeAssetCollectionsAction_performUndo___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__PXMergeAssetCollectionsAction_performAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__PXMergeAssetCollectionsAction_performAction___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    if (v6)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __47__PXMergeAssetCollectionsAction_performAction___block_invoke_3;
      v7[3] = &unk_1E51417E8;
      v8 = *(id *)(a1 + 40);
      objc_msgSend(v6, "performAction:", v7);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __47__PXMergeAssetCollectionsAction_performAction___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)canPerformOnCollection:(id)a3
{
  return objc_msgSend(a3, "canPerformEditOperation:", 3);
}

@end
