@implementation PXDeleteCollectionsAction

- (PXDeleteCollectionsAction)initWithCollections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXDeleteCollectionsAction *v8;
  uint64_t v9;
  PXFastEnumeration *collections;
  PXDeleteCollectionsAction *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)PXDeleteCollectionsAction;
    v8 = -[PXPhotosAction initWithPhotoLibrary:](&v13, sel_initWithPhotoLibrary_, v7);

    if (v8)
    {
      v9 = objc_msgSend(v4, "copy");
      collections = v8->_collections;
      v8->_collections = (PXFastEnumeration *)v9;

    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PXDeleteCollectionsAction)initWithCollection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PXDeleteCollectionsAction *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXDeleteCollectionsAction initWithCollections:](self, "initWithCollections:", v6, v9, v10);
  return v7;
}

- (id)actionIdentifier
{
  return CFSTR("DeleteCollections");
}

- (id)actionNameLocalizationKey
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;

  -[PXDeleteCollectionsAction collections](self, "collections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("PXDeleteActionName");
    if (v3)
    {
      if ((objc_msgSend(v3, "canContainAssets") & 1) != 0)
      {
        v5 = CFSTR("PXDeleteAlbumActionName");
      }
      else if (objc_msgSend(v4, "canContainCollections"))
      {
        v5 = CFSTR("PXDeleteFolderActionName");
      }
    }
  }
  else
  {
    v4 = 0;
    v5 = CFSTR("PXDeleteActionName");
  }

  return (id)v5;
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PXDeleteCollectionsAction *v9;

  v4 = a3;
  -[PXDeleteCollectionsAction collections](self, "collections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__PXDeleteCollectionsAction_performAction___block_invoke;
  v7[3] = &unk_1E5148D08;
  v8 = v5;
  v9 = self;
  v6 = v5;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v7, v4);

}

- (void)performUndo:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__PXDeleteCollectionsAction_performUndo___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (void)performRedo:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__PXDeleteCollectionsAction_performRedo___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (id)collections
{
  return self->_collections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_collectionLists, 0);
  objc_storeStrong((id *)&self->_assetCollections, 0);
}

uint64_t __41__PXDeleteCollectionsAction_performRedo___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD13C8], "deleteAssetCollections:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  return objc_msgSend(MEMORY[0x1E0CD14E8], "deleteCollectionLists:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

uint64_t __41__PXDeleteCollectionsAction_performUndo___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD13C8], "undeleteAssetCollections:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  return objc_msgSend(MEMORY[0x1E0CD14E8], "undeleteCollectionLists:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

void __43__PXDeleteCollectionsAction_performAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v9, "canPerformEditOperation:", 6, (_QWORD)v19))
        {
          v10 = objc_msgSend(v9, "canContainAssets");
          v11 = v2;
          if ((v10 & 1) != 0 || (v12 = objc_msgSend(v9, "canContainCollections"), v11 = v3, v12))
            objc_msgSend(v11, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v13 = objc_msgSend(v2, "copy");
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(v14 + 80);
  *(_QWORD *)(v14 + 80) = v13;

  v16 = objc_msgSend(v3, "copy");
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(void **)(v17 + 88);
  *(_QWORD *)(v17 + 88) = v16;

  objc_msgSend(MEMORY[0x1E0CD13C8], "deleteAssetCollections:", v2);
  objc_msgSend(MEMORY[0x1E0CD14E8], "deleteCollectionLists:", v3);

}

@end
