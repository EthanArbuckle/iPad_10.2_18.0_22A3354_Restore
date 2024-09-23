@implementation PXPhotoKitAssetCollectionSortActionPerformer

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeSort"), a5);
}

+ (BOOL)canPerformActionType:(id)a3 onAssetCollectionReference:(id)a4 withInputs:(id)a5
{
  void *v7;
  BOOL v8;
  BOOL IsCloudShared;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;

  objc_msgSend(a4, "assetCollection", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionSortActionPerformer.m"), 97, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v16, v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionSortActionPerformer.m"), 97, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v16);
  }

LABEL_3:
  v8 = objc_msgSend(v7, "assetCollectionType") == 2 && objc_msgSend(v7, "assetCollectionSubtype") == 1000000204;
  IsCloudShared = _PXAssetCollectionIsCloudShared(v7);
  if (objc_msgSend(v7, "canPerformEditOperation:", 5))
    v10 = (unint64_t)objc_msgSend(v7, "estimatedAssetCount") > 1;
  else
    v10 = 0;
  v11 = IsCloudShared || v10;
  v12 = v8 || v11;

  return v12;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotosGridsSort"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled", a3, a4))
    return 0;
  else
    return CFSTR("arrow.up.arrow.down");
}

+ (id)createStandardActionForAssetCollectionReference:(id)a3 withInput:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _BOOL4 IsCloudShared;
  void *v24;
  void *v25;
  id *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v7 = a4;
  v8 = a3;
  PXLocalizedStringFromTable(CFSTR("PXContentSortingMenuTitle"), CFSTR("PhotosUICore"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(a1, "systemImageNameForAssetCollectionReference:withInputs:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "systemImageNamed:", v10);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  objc_msgSend(v8, "assetCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = _PXSortActionTypeForAssetCollection(v12);
  v14 = (void *)MEMORY[0x1E0DC3428];
  PXLocalizedStringFromTable(CFSTR("PXContentSortingMenuOldestFirst"), CFSTR("PhotosUICore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke;
  v39[3] = &unk_1E513C038;
  v17 = v12;
  v40 = v17;
  objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v15, 0, 0, v39);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setState:", v13 == 3);
  objc_msgSend(v11, "addObject:", v18);
  v19 = (void *)MEMORY[0x1E0DC3428];
  PXLocalizedStringFromTable(CFSTR("PXContentSortingMenuNewestFirst"), CFSTR("PhotosUICore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v16;
  v37[1] = 3221225472;
  v37[2] = __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke_2;
  v37[3] = &unk_1E513C038;
  v21 = v17;
  v38 = v21;
  objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", v20, 0, 0, v37);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setState:", v13 == 4);
  objc_msgSend(v11, "addObject:", v22);
  IsCloudShared = _PXAssetCollectionIsCloudShared(v21);
  v24 = (void *)MEMORY[0x1E0DC3428];
  if (IsCloudShared)
  {
    PXLocalizedStringFromTable(CFSTR("PXContentSortingMenuDateAdded"), CFSTR("PhotosUICore"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v16;
    v35[1] = 3221225472;
    v35[2] = __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke_3;
    v35[3] = &unk_1E513C038;
    v26 = &v36;
    v36 = v21;
    objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v25, 0, 0, v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 2;
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXContentSortingMenuCustomOrder"), CFSTR("PhotosUICore"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v16;
    v33[1] = 3221225472;
    v33[2] = __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke_4;
    v33[3] = &unk_1E513C038;
    v26 = &v34;
    v34 = v21;
    objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v25, 0, 0, v33);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 1;
  }

  objc_msgSend(v27, "setState:", v13 == v28);
  objc_msgSend(v11, "addObject:", v27);

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", v32, v31, 0, 0, v11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (void)_handleSortOrderSelected:(int64_t)a3 forAssetCollection:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t v21;
  BOOL v22;
  uint8_t buf[4];
  int64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = _PXSortActionTypeForAssetCollection(v5);
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 == a3)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v24 = (int64_t)v5;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Sort Action: User selected a custom sort key that is already set for %@", buf, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 134218242;
      v24 = a3;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Sort Action: setting sort key %ld for asset collection %@", buf, 0x16u);
    }

    v9 = objc_msgSend(v5, "assetCollectionType") == 2 && objc_msgSend(v5, "assetCollectionSubtype") == 1000000204;
    v10 = 0x100000000;
    v11 = 1;
    switch(a3)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXSortActionResult _PXSortActionResultForType(PXSortActionType)");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v14;
        v17 = v15;
        v18 = 82;
        goto LABEL_16;
      case 1:
      case 2:
        v11 = 0;
        goto LABEL_12;
      case 3:
        goto LABEL_12;
      case 4:
        v10 = 0;
        v11 = 1;
LABEL_12:
        v12 = v10 | v11;
        objc_msgSend(v5, "photoLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __92__PXPhotoKitAssetCollectionSortActionPerformer__handleSortOrderSelected_forAssetCollection___block_invoke;
        v19[3] = &unk_1E512C5E8;
        v22 = v9;
        v20 = v5;
        v21 = v12;
        objc_msgSend(v13, "performChanges:completionHandler:", v19, &__block_literal_global_136537);

        v7 = v20;
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXSortActionResult _PXSortActionResultForType(PXSortActionType)");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v14;
        v17 = v15;
        v18 = 86;
LABEL_16:
        objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXPhotoKitAssetCollectionSortActionPerformer.m"), v18, CFSTR("Code which should be unreachable has been reached"));

        abort();
    }
  }

}

void __92__PXPhotoKitAssetCollectionSortActionPerformer__handleSortOrderSelected_forAssetCollection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(MEMORY[0x1E0CD17B8], "changeRequestForSmartAlbum:", v2);
  else
    objc_msgSend(MEMORY[0x1E0CD13C8], "changeRequestForAssetCollection:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCustomSortKey:", *(unsigned int *)(a1 + 40));
  objc_msgSend(v3, "setCustomSortAscending:", *(unsigned __int8 *)(a1 + 44));

}

void __92__PXPhotoKitAssetCollectionSortActionPerformer__handleSortOrderSelected_forAssetCollection___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      v7 = "Sort Action: change request succeeded";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEFAULT;
      v10 = 2;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = v4;
    v7 = "Sort Action: change request failed with error: %@";
    v8 = v6;
    v9 = OS_LOG_TYPE_ERROR;
    v10 = 12;
    goto LABEL_6;
  }

}

uint64_t __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke(uint64_t a1)
{
  return +[PXPhotoKitAssetCollectionSortActionPerformer _handleSortOrderSelected:forAssetCollection:](PXPhotoKitAssetCollectionSortActionPerformer, "_handleSortOrderSelected:forAssetCollection:", 3, *(_QWORD *)(a1 + 32));
}

uint64_t __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke_2(uint64_t a1)
{
  return +[PXPhotoKitAssetCollectionSortActionPerformer _handleSortOrderSelected:forAssetCollection:](PXPhotoKitAssetCollectionSortActionPerformer, "_handleSortOrderSelected:forAssetCollection:", 4, *(_QWORD *)(a1 + 32));
}

uint64_t __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke_3(uint64_t a1)
{
  return +[PXPhotoKitAssetCollectionSortActionPerformer _handleSortOrderSelected:forAssetCollection:](PXPhotoKitAssetCollectionSortActionPerformer, "_handleSortOrderSelected:forAssetCollection:", 2, *(_QWORD *)(a1 + 32));
}

uint64_t __114__PXPhotoKitAssetCollectionSortActionPerformer_createStandardActionForAssetCollectionReference_withInput_handler___block_invoke_4(uint64_t a1)
{
  return +[PXPhotoKitAssetCollectionSortActionPerformer _handleSortOrderSelected:forAssetCollection:](PXPhotoKitAssetCollectionSortActionPerformer, "_handleSortOrderSelected:forAssetCollection:", 1, *(_QWORD *)(a1 + 32));
}

@end
