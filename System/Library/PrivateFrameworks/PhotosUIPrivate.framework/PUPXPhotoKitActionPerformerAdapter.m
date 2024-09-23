@implementation PUPXPhotoKitActionPerformerAdapter

- (unint64_t)actionType
{
  void *v2;
  unint64_t v3;

  -[PUPXPhotoKitActionPerformerAdapter pxActionType](self, "pxActionType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PUAssetActionTypeForPXAssetActionType(v2);

  return v3;
}

- (PUPXPhotoKitActionPerformerAdapter)initWithActionType:(unint64_t)a3 assets:(id)a4 orAssetsByAssetCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  PUPXPhotoKitActionPerformerAdapter *v13;

  v8 = a5;
  v9 = a4;
  v10 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "pxActionPerformerClass"));
  -[PUPXPhotoKitActionPerformerAdapter pxActionType](self, "pxActionType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithActionType:", v11);
  v13 = -[PUPXPhotoKitActionPerformerAdapter initWithActionType:assets:orAssetsByAssetCollection:pxActionPerformer:](self, "initWithActionType:assets:orAssetsByAssetCollection:pxActionPerformer:", a3, v9, v8, v12);

  return v13;
}

- (PUPXPhotoKitActionPerformerAdapter)initWithActionType:(unint64_t)a3 assets:(id)a4 orAssetsByAssetCollection:(id)a5 pxActionPerformer:(id)a6
{
  id v11;
  PUPXPhotoKitActionPerformerAdapter *v12;
  PUPXPhotoKitActionPerformerAdapter *v13;
  id *p_pxActionPerformer;
  objc_super v16;

  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PUPXPhotoKitActionPerformerAdapter;
  v12 = -[PUAssetActionPerformer initWithActionType:assets:orAssetsByAssetCollection:](&v16, sel_initWithActionType_assets_orAssetsByAssetCollection_, a3, a4, a5);
  v13 = v12;
  if (v12)
  {
    p_pxActionPerformer = (id *)&v12->_pxActionPerformer;
    objc_storeStrong((id *)&v12->_pxActionPerformer, a6);
    objc_msgSend(*p_pxActionPerformer, "setDelegate:", v13);
    -[PUPXPhotoKitActionPerformerAdapter _configureActionPerformer:](v13, "_configureActionPerformer:", *p_pxActionPerformer);
  }

  return v13;
}

- (void)_configureActionPerformer:(id)a3
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  SEL v23;
  _BYTE v24[32];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  PUPXPhotoKitActionPerformerAdapter *v31;
  id v32;
  id v33;
  SEL v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[PUPhotoKitActionPerformer photosDataSource](self, "photosDataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "immutableCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B6F0]), "initWithImmutablePhotosDataSource:withChange:", v6, 0);
    v8 = objc_alloc_init(MEMORY[0x1E0D7CD48]);
    -[PUAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[PUAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __64__PUPXPhotoKitActionPerformerAdapter__configureActionPerformer___block_invoke;
      v29[3] = &unk_1E58A51D0;
      v34 = a2;
      v30 = v6;
      v31 = self;
      v32 = v8;
      v33 = v7;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v29);

    }
    else
    {
      v23 = a2;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      -[PUAssetActionPerformer assets](self, "assets");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(v6, "indexPathForAsset:hintIndexPath:hintCollection:", v19, 0, 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v20)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v22 = v19;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v23, self, CFSTR("PUPhotoKitAssetActionManager.m"), 753, CFSTR("Unable to find asset %@ in dataSource %@"), v22, v6);

            }
            objc_msgSend(v7, "identifier");
            PXSimpleIndexPathFromIndexPath();
            objc_msgSend(v8, "addIndexPath:", v24);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
        }
        while (v16);
      }

    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CD88]), "initWithDataSource:selectedIndexPaths:", v7, v8);
  }
  else
  {
    -[PUAssetActionPerformer assets](self, "assets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7B6F0], "dataSourceWithAssets:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(v8, "numberOfItemsInSection:", 0));
    objc_msgSend(MEMORY[0x1E0D7CD10], "indexPathSetWithItemIndexes:dataSourceIdentifier:section:", v11, objc_msgSend(v8, "identifier"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CD88]), "initWithDataSource:selectedIndexPaths:", v8, v12);

  }
  -[PXPhotoKitAssetActionPerformer setSelectionSnapshot:](self->_pxActionPerformer, "setSelectionSnapshot:", v13);
  -[PXPhotoKitAssetActionPerformer setDelegate:](self->_pxActionPerformer, "setDelegate:", self);

}

- (void)performUserInteractionTask
{
  PXPhotoKitAssetActionPerformer *pxActionPerformer;
  _QWORD v3[5];

  pxActionPerformer = self->_pxActionPerformer;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__PUPXPhotoKitActionPerformerAdapter_performUserInteractionTask__block_invoke;
  v3[3] = &unk_1E58AB060;
  v3[4] = self;
  -[PXPhotoKitAssetActionPerformer performActionWithCompletionHandler:](pxActionPerformer, "performActionWithCompletionHandler:", v3);
}

- (NSString)pxActionType
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetActionManager.m"), 786, CFSTR("Method %s is a responsibility of subclass %@"), "-[PUPXPhotoKitActionPerformerAdapter pxActionType]", v6);

  abort();
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return -[PUAssetActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", a4, a5);
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  return -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", a4);
}

- (id)hostViewControllerForActionPerformer:(id)a3
{
  return 0;
}

- (id)actionPerformerHostViewControllerForPresentingToast:(id)a3
{
  void *v4;
  void *v5;

  -[PUAssetActionPerformer delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetActionPerformerHostViewControllerForPresentingToast:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)actionPerformerBottomPaddingForPresentingToast:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[PUAssetActionPerformer delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetActionPerformerBottomPaddingForPresentingToast:", self);
  v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pxActionPerformer, 0);
}

uint64_t __64__PUPXPhotoKitActionPerformerAdapter_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, a3);
}

void __64__PUPXPhotoKitActionPerformerAdapter__configureActionPerformer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(*(id *)(a1 + 32), "sectionForAssetCollection:", a2);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "assetsInSection:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("PUPhotoKitAssetActionManager.m"), 736, CFSTR("Missing fetchResult in section %ld in dataSource %@"), v7, *(_QWORD *)(a1 + 32));

    }
    v22 = v7;
    v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = v5;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v16 = objc_msgSend(v8, "indexOfObject:", v15);
          if (v16 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v21 = v15;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("PUPhotoKitAssetActionManager.m"), 740, CFSTR("Unable to find asset %@ in dataSource %@"), v21, *(_QWORD *)(a1 + 32));

          }
          objc_msgSend(v9, "addIndex:", v16);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v9, "count"))
    {
      v18 = *(void **)(a1 + 48);
      v19 = objc_msgSend(*(id *)(a1 + 56), "identifier");
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __64__PUPXPhotoKitActionPerformerAdapter__configureActionPerformer___block_invoke_2;
      v24[3] = &unk_1E58A58F0;
      v25 = v9;
      objc_msgSend(v18, "modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:", v19, v22, v24);

    }
    v5 = v23;
  }

}

uint64_t __64__PUPXPhotoKitActionPerformerAdapter__configureActionPerformer___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexes:", *(_QWORD *)(a1 + 32));
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  LOBYTE(a1) = objc_msgSend((id)objc_msgSend(a1, "pxActionPerformerClass"), "canPerformOnAsset:inAssetCollection:person:socialGroup:", v7, v6, 0, 0);

  return (char)a1;
}

+ (Class)pxActionPerformerClass
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPhotoKitAssetActionManager.m"), 782, CFSTR("Method %s is a responsibility of subclass %@"), "+[PUPXPhotoKitActionPerformerAdapter pxActionPerformerClass]", v6);

  abort();
}

@end
