@implementation PXPhotoKitUnifiedDestructiveActionPerformer

- (void)performUserInteractionTask
{
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[8];
  _QWORD v16[4];
  id v17;
  PXPhotoKitUnifiedDestructiveActionPerformer *v18;
  id v19;
  SEL v20;
  _QWORD v21[5];

  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PXPhotoKitUnifiedDestructiveActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  }
  else
  {
    -[PXPhotoKitUnifiedDestructiveActionPerformer performerClasses](self, "performerClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 1)
    {
      v8 = objc_msgSend(v7, "lastObject");
      -[PXActionPerformer actionType](self, "actionType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotoKitAssetActionPerformer createPerformerWithClass:actionType:](self, "createPerformerWithClass:actionType:", v8, v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke;
      v21[3] = &unk_1E5148B78;
      v21[4] = self;
      objc_msgSend(v10, "performActionWithCompletionHandler:", v21);
    }
    else
    {
      -[PXPhotoKitAssetActionPerformer assets](self, "assets");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke_2;
      v16[3] = &unk_1E5117CC8;
      v17 = v11;
      v18 = self;
      v19 = v7;
      v20 = a2;
      v10 = v11;
      objc_msgSend(v12, "presentAlertWithConfigurationHandler:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        PLUIGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Failed to present delete confirmation. User must confirm to perform removal.", v15, 2u);
        }

        -[PXPhotoKitUnifiedDestructiveActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
      }

    }
  }
}

- (NSArray)performerClasses
{
  NSArray *performerClasses;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  id *location;
  id obj;
  NSArray *v22;
  PXPhotoKitUnifiedDestructiveActionPerformer *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  void *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  BOOL v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  performerClasses = self->_performerClasses;
  if (performerClasses)
  {
    v22 = performerClasses;
  }
  else
  {
    location = (id *)&self->_performerClasses;
    v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v23 = self;
    objc_msgSend((id)objc_opt_class(), "_containedPerformerClasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (NSArray *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    -[PXAssetActionPerformer selectionSnapshot](v23, "selectionSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedIndexPaths");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotoKitAssetActionPerformer person](v23, "person");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitAssetActionPerformer socialGroup](v23, "socialGroup");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitAssetActionPerformer photosDataSourceSnapshot](v23, "photosDataSourceSnapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend((id)objc_opt_class(), "_containedPerformerClasses");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v32 = 0;
          v33 = &v32;
          v34 = 0x2020000000;
          v35 = 0;
          v35 = objc_msgSend(v7, "count", location) > 0;
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __63__PXPhotoKitUnifiedDestructiveActionPerformer_performerClasses__block_invoke;
          v26[3] = &unk_1E5117D18;
          v27 = v8;
          v30 = &v32;
          v31 = v12;
          v28 = v25;
          v29 = v24;
          objc_msgSend(v7, "enumerateItemIndexSetsUsingBlock:", v26);
          if (*((_BYTE *)v33 + 24))
          {
            if (objc_msgSend(v12, "isEqual:", objc_opt_class()))
            {
              -[PXActionPerformer delegate](v23, "delegate");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_opt_respondsToSelector();

              if ((v14 & 1) != 0)
              {
                -[PXActionPerformer delegate](v23, "delegate");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "hostViewControllerForActionPerformer:", v23);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EEBEAC60))
                  *((_BYTE *)v33 + 24) = 0;
                -[PXActionPerformer sender](v23, "sender");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) != 0)
                  *((_BYTE *)v33 + 24) = 0;

              }
            }
          }
          if (*((_BYTE *)v33 + 24))
            -[NSArray addObject:](v22, "addObject:", v12);

          _Block_object_dispose(&v32, 8);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v9);
    }

    objc_storeStrong(location, v22);
  }
  return v22;
}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  unint64_t v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[PXActionPerformer state](self, "state") == 10)
  {
    v8.receiver = self;
    v8.super_class = (Class)PXPhotoKitUnifiedDestructiveActionPerformer;
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](&v8, sel_completeUserInteractionTaskWithSuccess_error_, v4, v6);
  }
  else
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v10 = -[PXActionPerformer state](self, "state");
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "[PXPhotoKitUnifiedDestructiveActionPerformer]: Failed to completeUserInteractionTaskWithSuccess because state is %lu", buf, 0xCu);
    }

  }
}

- (void)_handleActionPickForPerformerClass:(Class)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[PXActionPerformer actionType](self, "actionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetActionPerformer createPerformerWithClass:actionType:](self, "createPerformerWithClass:actionType:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setShouldSkipUserConfirmation:", -[objc_class isActionDestructive](a3, "isActionDestructive") ^ 1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__PXPhotoKitUnifiedDestructiveActionPerformer__handleActionPickForPerformerClass___block_invoke;
  v7[3] = &unk_1E5148B78;
  v7[4] = self;
  objc_msgSend(v6, "performActionWithCompletionHandler:", v7);

}

- (id)createContainedPerformers
{
  void *v2;
  void *v3;

  -[PXPhotoKitUnifiedDestructiveActionPerformer performerClasses](self, "performerClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performerClasses, 0);
}

id __72__PXPhotoKitUnifiedDestructiveActionPerformer_createContainedPerformers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "actionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createPerformerWithClass:actionType:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __82__PXPhotoKitUnifiedDestructiveActionPerformer__handleActionPickForPerformerClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, a3);
}

void __63__PXPhotoKitUnifiedDestructiveActionPerformer_performerClasses__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  objc_msgSend(v6, "assetCollectionForSection:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "assetsInSection:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__PXPhotoKitUnifiedDestructiveActionPerformer_performerClasses__block_invoke_2;
  v12[3] = &unk_1E5117CF0;
  v17 = *(_OWORD *)(a1 + 56);
  v13 = v9;
  v14 = v8;
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  v10 = v8;
  v11 = v9;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v12);

}

void __63__PXPhotoKitUnifiedDestructiveActionPerformer_performerClasses__block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 72), "canPerformOnAsset:inAssetCollection:person:socialGroup:");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    *a3 = 1;

}

uint64_t __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, a3);
}

void __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id obj;
  _QWORD v16[4];
  id v17[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id location;
  _QWORD v23[5];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = a1;
  +[PXPhotoKitDeletePhotosActionController warningStringForAssets:isDeleting:](PXPhotoKitDeletePhotosActionController, "warningStringForAssets:isDeleting:", *(_QWORD *)(a1 + 32), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v13);
  objc_msgSend(v3, "setStyle:", 0);
  PXLocalizedStringFromTable(CFSTR("PXPhotoKitUnifiedDestructiveActionPerformer_Cancel"), CFSTR("PhotosUICore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke_3;
  v23[3] = &unk_1E5149198;
  a1 += 40;
  v23[4] = *(_QWORD *)a1;
  objc_msgSend(v3, "addActionWithTitle:style:action:", v12, 1, v23);
  objc_initWeak(&location, *(id *)a1);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = *(id *)(v14 + 48);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v14 + 56), *(_QWORD *)(v14 + 40), CFSTR("PXPhotoKitUnifiedDestructiveActionPerformer.m"), 179, CFSTR("Code which should be unreachable has been reached"));

          abort();
        }
        objc_msgSend(v7, "localizedTitleForUseCase:actionManager:", 1, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isActionDestructive");
        v16[0] = MEMORY[0x1E0C809B0];
        if (v9)
          v10 = 2;
        else
          v10 = 0;
        v16[1] = 3221225472;
        v16[2] = __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke_4;
        v16[3] = &unk_1E5117CA0;
        objc_copyWeak(v17, &location);
        v17[1] = v7;
        objc_msgSend(v3, "addActionWithTitle:style:action:", v8, v10, v16);
        objc_destroyWeak(v17);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v4);
  }

  objc_destroyWeak(&location);
}

uint64_t __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

void __73__PXPhotoKitUnifiedDestructiveActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleActionPickForPerformerClass:", *(_QWORD *)(a1 + 40));

}

+ (id)_containedPerformerClasses
{
  if (_containedPerformerClasses_onceToken != -1)
    dispatch_once(&_containedPerformerClasses_onceToken, &__block_literal_global_9853);
  return (id)_containedPerformerClasses_containedPerformerClasses;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a1, "_containedPerformerClasses", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v14);
        if ((v17 & 1) != 0)
          v17 = 1;
        else
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "canPerformOnAsset:inAssetCollection:person:socialGroup:", v10, v11, v12, v13);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "_containedPerformerClasses", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "canPerformOnSubsetOfSelection") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  objc_class *v6;
  id v7;
  void *v8;

  v6 = (objc_class *)MEMORY[0x1E0DC34F0];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithBarButtonSystemItem:target:action:", 16, v7, a4);

  return v8;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  void *v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  if (a3 > 2)
    v8 = 0;
  else
    v8 = off_1E5124918[a3];
  v9 = v8;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("PXPhotoKitAssetActionManager%@Title_Trash"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXPhotoKitAssetActionManager selectedAssetForActionManager:](PXPhotoKitAssetActionManager, "selectedAssetForActionManager:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(a1, "_localizedTitleForAsset:titleUseCase:key:", v11, a3, v10);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v10, CFSTR("Library"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(v12, CFSTR("PhotosUICore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_localizedTitleForAsset:(id)a3 titleUseCase:(unint64_t)a4 key:(id)a5
{
  id v6;
  id v7;
  const __CFString *v8;
  unint64_t v9;
  uint64_t v10;

  v6 = a3;
  v7 = a5;
  if ((objc_msgSend(v6, "isCloudSharedAsset") & 1) != 0)
  {
    v8 = CFSTR("SharedAlbum");
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
    goto LABEL_8;
  }
  if (!objc_msgSend(v6, "px_isUnsavedSyndicatedAsset"))
  {
    v8 = CFSTR("Library");
    goto LABEL_7;
  }
  v9 = objc_msgSend(v6, "mediaType");
  if (v9 <= 3)
  {
    v8 = off_1E5117D60[v9];
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

+ (id)_localizedTitleForAssets:(id)a3 titleUseCase:(unint64_t)a4 key:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a3;
  v9 = a5;
  if ((unint64_t)objc_msgSend(v8, "count") <= 1)
  {
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    objc_msgSend(a1, "_localizedTitleForAsset:titleUseCase:key:", v12, a4, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v9;
  }

  return v10;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("trash");
}

+ (BOOL)isActionDestructive
{
  return 1;
}

void __73__PXPhotoKitUnifiedDestructiveActionPerformer__containedPerformerClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_containedPerformerClasses_containedPerformerClasses;
  _containedPerformerClasses_containedPerformerClasses = v0;

}

@end
