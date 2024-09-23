@implementation PXPhotoKitNotThisPersonActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  BOOL v6;

  if (a3)
    v6 = a5 == 0;
  else
    v6 = 1;
  return !v6;
}

+ (id)_assetsForActionManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "objectReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "selectionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "selectionSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allItemsEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;

  v5 = a4;
  objc_msgSend(a1, "_assetsForActionManager:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(v5, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "px_localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    if (v7 == 1)
      v10 = CFSTR("PXPeopleAssetNotThisNamedPersonFormat");
    else
      v10 = CFSTR("PXPeopleAssetsNotThisNamedPersonFormat");
    PXLocalizedStringForPersonOrPetAndVisibility(v8, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v7 == 1)
      v13 = CFSTR("PXPeopleAssetNotThisUnnamedPerson");
    else
      v13 = CFSTR("PXPeopleAssetsNotThisUnnamedPerson");
    PXLocalizedStringForPersonOrPetAndVisibility(v8, 0, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("person.crop.circle.badge.xmark");
}

- (void)performBackgroundTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PXNotThisPersonAction *v7;
  void *v8;
  PXNotThisPersonAction *v9;
  void *v10;
  _QWORD v11[5];

  -[PXPhotoKitAssetActionPerformer instantlyExcludeAssetsFromDataSource](self, "instantlyExcludeAssetsFromDataSource");
  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedIndexPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotoKitAssetActionPerformer photosDataSourceSnapshot](self, "photosDataSourceSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchResultWithAssetsAtIndexPaths:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [PXNotThisPersonAction alloc];
  -[PXPhotoKitAssetActionPerformer person](self, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXNotThisPersonAction initWithPerson:assets:](v7, "initWithPerson:assets:", v8, v6);

  -[PXActionPerformer undoManager](self, "undoManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__PXPhotoKitNotThisPersonActionPerformer_performBackgroundTask__block_invoke;
  v11[3] = &unk_1E5148B78;
  v11[4] = self;
  -[PXAction executeWithUndoManager:completionHandler:](v9, "executeWithUndoManager:completionHandler:", v10, v11);

}

void __63__PXPhotoKitNotThisPersonActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  objc_class *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((_DWORD)a2)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v8;
      v9 = "[%@] Not This Person succeeded.";
      v10 = v6;
      v11 = OS_LOG_TYPE_INFO;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v10, v11, v9, (uint8_t *)&v14, v12);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "stopExcludingAssetsFromDataSource");
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v5;
      v9 = "[%@] Not This Person failed: %@.";
      v10 = v6;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
      goto LABEL_6;
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, v5);
}

@end
