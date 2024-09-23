@implementation PXPhotoKitFeatureLessActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10 && (objc_msgSend(v10, "px_isSyndicatedAsset") & 1) == 0)
  {
    objc_msgSend(a1, "_facesInCurrentAsset:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "count") != 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  objc_msgSend(a4, "selectionManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  objc_msgSend((id)objc_opt_class(), "_facesInCurrentAsset:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 1)
  {
    v10 = (void *)objc_opt_class();
    objc_msgSend(v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_personFromFace:asset:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchPropertySetsIfNeeded");
    objc_msgSend(v13, "px_localizedName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userFeedbackProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userFeedback");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (objc_msgSend(v14, "length"))
      {
        PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, CFSTR("PXPeopleBlockPersonRevertResetActionTitleNamed"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        PXStringWithValidatedFormat();
        v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
        goto LABEL_14;
      }
      PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, CFSTR("PXPeopleBlockPersonRevertResetActionTitleNoName"));
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PXLocalizedStringFromTable(CFSTR("PXForYouRecentInterestSuggestionSuggestLessPersonActionTitle"), CFSTR("PhotosUICore"));
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v19;
    goto LABEL_13;
  }
  PXLocalizedStringFromTable(CFSTR("PXForYouRecentInterestSuggestionSuggestLessPeopleActionTitle"), CFSTR("PhotosUICore"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v18;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a3, "selectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  objc_msgSend((id)objc_opt_class(), "_facesInCurrentAsset:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("xmark.circle");
  if (objc_msgSend(v8, "count") == 1)
  {
    v10 = (void *)objc_opt_class();
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_personFromFace:asset:", v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchPropertySetsIfNeeded");
    objc_msgSend(v13, "userFeedbackProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userFeedback");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      v9 = CFSTR("plus.circle");

  }
  return (id)v9;
}

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (id)_facesInCurrentAsset:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CD1570];
  v4 = a3;
  objc_msgSend(v3, "fetchOptionsWithPhotoLibrary:orObject:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchLimit:", 2);
  objc_msgSend(v5, "setPersonContext:", 5);
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesInAsset:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_personFromFace:(id)a3 asset:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CD1570];
  v6 = a3;
  objc_msgSend(v5, "fetchOptionsWithPhotoLibrary:orObject:", 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchLimit:", 1);
  v11[0] = *MEMORY[0x1E0CD1D60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v8);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonWithFace:options:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)performUserInteractionTask
{
  PXSuggestLessPeopleHelper *v3;
  PXSuggestLessPeopleHelper *suggestLessPeopleHelper;
  PXSuggestLessPeopleHelper *v5;
  void *v6;
  _QWORD v7[5];

  v3 = objc_alloc_init(PXSuggestLessPeopleHelper);
  suggestLessPeopleHelper = self->_suggestLessPeopleHelper;
  self->_suggestLessPeopleHelper = v3;

  -[PXSuggestLessPeopleHelper setDelegate:](self->_suggestLessPeopleHelper, "setDelegate:", self);
  v5 = self->_suggestLessPeopleHelper;
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__PXPhotoKitFeatureLessActionPerformer_performUserInteractionTask__block_invoke;
  v7[3] = &unk_1E5148B78;
  v7[4] = self;
  -[PXSuggestLessPeopleHelper suggestLessPeopleFromAssets:completionHandler:](v5, "suggestLessPeopleFromAssets:completionHandler:", v6, v7);

}

- (BOOL)suggestLessPeopleHelper:(id)a3 presentViewController:(id)a4
{
  return -[PXActionPerformer presentViewController:](self, "presentViewController:", a4);
}

- (BOOL)suggestLessPeopleHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", a4, a5);
}

- (id)_personFromFace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchLimit:", 1);
  v11[0] = *MEMORY[0x1E0CD1D60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v8);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonWithFace:options:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestLessPeopleHelper, 0);
}

void __66__PXPhotoKitFeatureLessActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD block[5];
  id v10;
  char v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Could not suggest this person less: %@", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PXPhotoKitFeatureLessActionPerformer_performUserInteractionTask__block_invoke_142;
  block[3] = &unk_1E51473C0;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = a2;
  block[4] = v7;
  v10 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __66__PXPhotoKitFeatureLessActionPerformer_performUserInteractionTask__block_invoke_142(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

@end
