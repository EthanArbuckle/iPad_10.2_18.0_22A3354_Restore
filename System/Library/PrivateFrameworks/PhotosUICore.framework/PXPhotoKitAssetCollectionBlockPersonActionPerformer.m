@implementation PXPhotoKitAssetCollectionBlockPersonActionPerformer

+ (BOOL)canPerformOn:(id)a3
{
  return 1;
}

+ (id)localizedTitleForPerson:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  v3 = a3;
  objc_msgSend(v3, "px_localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchPropertySetsIfNeeded");
  objc_msgSend(v3, "userFeedbackProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "length");
  if (!v6)
  {
    if (v7)
    {
      v8 = CFSTR("PXPeopleBlockPersonActionTitleNamed");
      goto LABEL_6;
    }
    v11 = CFSTR("PXPeopleBlockPersonActionTitleNoName");
LABEL_9:
    PXLocalizedStringForPersonOrPetAndVisibility(v3, 0, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!v7)
  {
    v11 = CFSTR("PXPeopleBlockPersonRevertResetActionTitleNoName");
    goto LABEL_9;
  }
  v8 = CFSTR("PXPeopleBlockPersonRevertResetActionTitleNamed");
LABEL_6:
  PXLocalizedStringForPersonOrPetAndVisibility(v3, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v10;
}

+ (id)systemImageNameForPerson:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "fetchPropertySetsIfNeeded");
  objc_msgSend(v3, "userFeedbackProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return CFSTR("plus.circle");
  else
    return CFSTR("xmark.circle");
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "people");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v6, "count") == 1)
    v7 = objc_msgSend(a1, "canPerformOn:", v6);
  else
    v7 = 0;

  return v7;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeBlockPerson"), a5);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (a3 - 1 >= 2)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionBlockPersonActionPerformer.m"), 96, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v13 = 0;
  }
  else
  {
    PXFirstPersonFromAssetCollectionActionPerformerInput(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "localizedTitleForPerson:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v5;
  void *v6;

  PXFirstPersonFromAssetCollectionActionPerformerInput(a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNameForPerson:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isActionDestructive
{
  return 1;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  PXSuggestLessPeopleHelper *v7;
  PXSuggestLessPeopleHelper *suggestLessPeopleHelper;
  PXSuggestLessPeopleHelper *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PXAssetCollectionActionPerformer people](self, "people");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLMemoriesGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to block person: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!self->_suggestLessPeopleHelper)
    {
      v7 = objc_alloc_init(PXSuggestLessPeopleHelper);
      suggestLessPeopleHelper = self->_suggestLessPeopleHelper;
      self->_suggestLessPeopleHelper = v7;

      -[PXSuggestLessPeopleHelper setDelegate:](self->_suggestLessPeopleHelper, "setDelegate:", self);
    }
    objc_initWeak((id *)buf, self);
    v9 = self->_suggestLessPeopleHelper;
    v17 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__PXPhotoKitAssetCollectionBlockPersonActionPerformer_performUserInteractionTask__block_invoke;
    v15[3] = &unk_1E5144F70;
    objc_copyWeak(&v16, (id *)buf);
    -[PXSuggestLessPeopleHelper suggestLessPeople:completionHandler:](v9, "suggestLessPeople:completionHandler:", v10, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_msgSend(v4, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to block person because person and/or its photo library was nil. Person: %@ photoLibrary: %@"), v4, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PLMemoriesGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Failed to block person because needed objects were nil. Error: %@", buf, 0xCu);
    }

    v14 = v12;
    px_dispatch_on_main_queue();

  }
}

- (BOOL)suggestLessPeopleHelper:(id)a3 presentViewController:(id)a4
{
  return -[PXActionPerformer presentViewController:](self, "presentViewController:", a4);
}

- (BOOL)suggestLessPeopleHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestLessPeopleHelper, 0);
}

void __81__PXPhotoKitAssetCollectionBlockPersonActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char v8;

  v5 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v8 = a2;
  v6 = v5;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v7);
}

uint64_t __81__PXPhotoKitAssetCollectionBlockPersonActionPerformer_performUserInteractionTask__block_invoke_153(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, *(_QWORD *)(a1 + 40));
}

void __81__PXPhotoKitAssetCollectionBlockPersonActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

@end
