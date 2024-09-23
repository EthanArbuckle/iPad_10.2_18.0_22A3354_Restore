@implementation PXContentSyndicationAssetSavingHelper

- (PXContentSyndicationAssetSavingHelper)initWithAssetCollection:(id)a3
{
  id v6;
  PXContentSyndicationAssetSavingHelper *v7;
  PXContentSyndicationAssetSavingHelper *v8;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationAssetSavingHelper.m"), 53, CFSTR("%@ requires a non-nil asset collection"), v11);

  }
  v12.receiver = self;
  v12.super_class = (Class)PXContentSyndicationAssetSavingHelper;
  v7 = -[PXContentSyndicationAssetSavingHelper init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_assetCollection, a3);
    *(_WORD *)&v8->_userCanContinueAfterSavingSyndicatedAssets = 257;
  }

  return v8;
}

- (void)_handleAlertResponseForUnsavedSyndicatedAssets:(id)a3 helperResult:(unint64_t)a4 error:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[16];

  v11 = a3;
  v12 = a5;
  v13 = a6;
  switch(a4)
  {
    case 0uLL:
      PLSyndicationUIGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: No unsaved syndicated assets to process", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationAssetSavingHelper.m"), 68, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1uLL:
      PLSyndicationUIGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: User chose to save unsaved syndicated assets and stop", buf, 2u);
      }

      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __125__PXContentSyndicationAssetSavingHelper__handleAlertResponseForUnsavedSyndicatedAssets_helperResult_error_completionHandler___block_invoke;
      v24[3] = &unk_1E51425A0;
      v25 = v13;
      -[PXContentSyndicationAssetSavingHelper saveUnsavedSyndicatedAssetsWithCompletion:](self, "saveUnsavedSyndicatedAssetsWithCompletion:", v24);
      v15 = v25;
      goto LABEL_8;
    case 2uLL:
      PLSyndicationUIGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: User chose to save unsaved syndicated assets and continue", buf, 2u);
      }

      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __125__PXContentSyndicationAssetSavingHelper__handleAlertResponseForUnsavedSyndicatedAssets_helperResult_error_completionHandler___block_invoke_142;
      v22[3] = &unk_1E51425A0;
      v23 = v13;
      -[PXContentSyndicationAssetSavingHelper saveUnsavedSyndicatedAssetsWithCompletion:](self, "saveUnsavedSyndicatedAssetsWithCompletion:", v22);
      v15 = v23;
LABEL_8:

      break;
    case 3uLL:
      PLSyndicationUIGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: User chose to skip saving unsaved syndicated assets", buf, 2u);
      }

      PXMap();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, void *, id))v13 + 2))(v13, 3, v18, v12);

      break;
    case 4uLL:
      PLSyndicationUIGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: User canceled saving unsaved syndicated assets", buf, 2u);
      }

      (*((void (**)(id, uint64_t, _QWORD, id))v13 + 2))(v13, 4, 0, v12);
      break;
    default:
      break;
  }

}

- (void)performSaveActionIfNeededOnUnsavedSyndicatedAssetsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  _BOOL4 v17;
  _BOOL8 v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXContentSyndicationAssetSavingHelper presentationEnvironment](self, "presentationEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationAssetSavingHelper.m"), 100, CFSTR("%@ requires a non-nil presentation environment"), v21);

  }
  -[PXContentSyndicationAssetSavingHelper assetCollection](self, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationAssetSavingHelper.m"), 103, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetCollection"), v24, v26);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationAssetSavingHelper.m"), 103, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetCollection"), v24);
  }

LABEL_5:
  PXContentSyndicationUnsavedSyndicatedAssetsInAssetCollection(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  PLSyndicationUIGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      v33 = v9;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: Found %lu unsaved content syndication assets that need to be saved before continuing", buf, 0xCu);
    }

    if (-[PXContentSyndicationAssetSavingHelper skipUserPromptForSavingAssets](self, "skipUserPromptForSavingAssets"))
    {
      PLSyndicationUIGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: Skipping user prompt and directly saving assets", buf, 2u);
      }

      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __106__PXContentSyndicationAssetSavingHelper_performSaveActionIfNeededOnUnsavedSyndicatedAssetsWithCompletion___block_invoke;
      v30[3] = &unk_1E51425A0;
      v31 = v5;
      -[PXContentSyndicationAssetSavingHelper saveUnsavedSyndicatedAssetsWithCompletion:](self, "saveUnsavedSyndicatedAssetsWithCompletion:", v30);

    }
    else
    {
      objc_msgSend(v7, "photoLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "librarySpecificFetchOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setIncludeGuestAssets:", 1);
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v7, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      v17 = -[PXContentSyndicationAssetSavingHelper allowSkippingUnsavedAssets](self, "allowSkippingUnsavedAssets");
      v18 = v16 > v9 && v17;
      v19 = -[PXContentSyndicationAssetSavingHelper userCanContinueAfterSavingSyndicatedAssets](self, "userCanContinueAfterSavingSyndicatedAssets");
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __106__PXContentSyndicationAssetSavingHelper_performSaveActionIfNeededOnUnsavedSyndicatedAssetsWithCompletion___block_invoke_2;
      v27[3] = &unk_1E5142608;
      v27[4] = self;
      v28 = v8;
      v29 = v5;
      -[PXContentSyndicationAssetSavingHelper presentSaveAlertForUnsavedSyndicatedAssets:canContinueAfterSaving:allowSkippingUnsavedAssets:withCompletion:](self, "presentSaveAlertForUnsavedSyndicatedAssets:canContinueAfterSaving:allowSkippingUnsavedAssets:withCompletion:", v28, v19, v18, v27);

    }
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: No unsaved syndicated assets to process", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0);
  }

}

- (void)presentSaveAlertForUnsavedSyndicatedAssets:(id)a3 canContinueAfterSaving:(BOOL)a4 allowSkippingUnsavedAssets:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  PXContentSyndicationAssetSavingHelper *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  BOOL v57;

  v7 = a5;
  v8 = a4;
  v11 = a3;
  v44 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationAssetSavingHelper.m"), 142, CFSTR("%@ requires a non-nil fetch result of unsaved assets"), v39);

  }
  -[PXContentSyndicationAssetSavingHelper presentationEnvironment](self, "presentationEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationAssetSavingHelper.m"), 143, CFSTR("%@ requires a non-nil presentation environment"), v41);

  }
  v13 = PXMediaTypeForAssets();
  v14 = objc_msgSend(v11, "count");
  v48 = self;
  v49 = v11;
  v47 = v7;
  if (v8 && v7)
  {
    v15 = CFSTR("PXContentSyndicationSaveAndContinueOrSkipPhotosAlertMessage");
    v16 = CFSTR("PXContentSyndicationSaveAndContinueOrSkipVideosAlertMessage");
    v17 = CFSTR("PXContentSyndicationSaveAndContinueOrSkipItemsAlertMessage");
  }
  else if (v8)
  {
    v15 = CFSTR("PXContentSyndicationSaveAndContinuePhotosAlertMessage");
    v16 = CFSTR("PXContentSyndicationSaveAndContinueVideosAlertMessage");
    v17 = CFSTR("PXContentSyndicationSaveAndContinueItemsAlertMessage");
  }
  else if (v7)
  {
    v15 = CFSTR("PXContentSyndicationSaveOrSkipPhotosAlertMessage");
    v16 = CFSTR("PXContentSyndicationSaveOrSkipVideossAlertMessage");
    v17 = CFSTR("PXContentSyndicationSaveOrSkipVideosAlertMessage");
  }
  else
  {
    v15 = CFSTR("PXContentSyndicationSavePhotosAlertMessage");
    v16 = CFSTR("PXContentSyndicationSaveVideosAlertMessage");
    v17 = CFSTR("PXContentSyndicationSaveItemsAlertMessage");
  }
  PXLocalizationKeyForMediaType(v13, v15, v16, v17);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v46, CFSTR("PhotosUICore"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringWithValidatedFormat(v18, CFSTR("%lu"));
  v19 = objc_claimAutoreleasedReturnValue();

  if (v8)
    v20 = CFSTR("PXContentSyndicationAssetSavingHelper_CanContinue_SaveButtonTitle");
  else
    v20 = CFSTR("PXContentSyndicationAssetSavingHelper_SaveButtonTitle");
  PXLocalizedStringFromTable(v20, CFSTR("PhotosUICore"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXContentSyndicationAssetSavingHelper_CancelButtonTitle"), CFSTR("PhotosUICore"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizationKeyForMediaType(v13, CFSTR("PXContentSyndicationSkipPhotosButtonTitle"), CFSTR("PXContentSyndicationSkipVideosButtonTitle"), CFSTR("PXContentSyndicationSkipItemsButtonTitle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v22, CFSTR("PhotosUICore"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringWithValidatedFormat(v23, CFSTR("%lu"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizationKeyForMediaType(v13, CFSTR("PXContentSyndicationRequiresPhotosSaveAlertTitle"), CFSTR("PXContentSyndicationRequiresVideosSaveAlertTitle"), CFSTR("PXContentSyndicationRequiresItemsSaveAlertTitle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v24, CFSTR("PhotosUICore"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v14;
  PXLocalizedStringWithValidatedFormat(v25, CFSTR("%lu"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = (void *)v19;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v26, v19, 1, v42);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0DC3448];
  v29 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __149__PXContentSyndicationAssetSavingHelper_presentSaveAlertForUnsavedSyndicatedAssets_canContinueAfterSaving_allowSkippingUnsavedAssets_withCompletion___block_invoke;
  v55[3] = &unk_1E5142630;
  v30 = v44;
  v56 = v30;
  v57 = v8;
  objc_msgSend(v28, "actionWithTitle:style:handler:", v21, 0, v55);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAction:", v31);
  if (v47)
  {
    v32 = (void *)MEMORY[0x1E0DC3448];
    v53[0] = v29;
    v53[1] = 3221225472;
    v53[2] = __149__PXContentSyndicationAssetSavingHelper_presentSaveAlertForUnsavedSyndicatedAssets_canContinueAfterSaving_allowSkippingUnsavedAssets_withCompletion___block_invoke_2;
    v53[3] = &unk_1E5142658;
    v54 = v30;
    objc_msgSend(v32, "actionWithTitle:style:handler:", v50, 0, v53);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAction:", v33);

  }
  v34 = (void *)MEMORY[0x1E0DC3448];
  v51[0] = v29;
  v51[1] = 3221225472;
  v51[2] = __149__PXContentSyndicationAssetSavingHelper_presentSaveAlertForUnsavedSyndicatedAssets_canContinueAfterSaving_allowSkippingUnsavedAssets_withCompletion___block_invoke_3;
  v51[3] = &unk_1E5142658;
  v52 = v30;
  v35 = v30;
  objc_msgSend(v34, "actionWithTitle:style:handler:", v43, 1, v51);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAction:", v36);
  -[PXContentSyndicationAssetSavingHelper presentationEnvironment](v48, "presentationEnvironment");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "presentViewController:animated:completionHandler:", v27, 1, 0);

}

- (void)saveUnsavedSyndicatedAssetsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  PXDisplayTitleInfo *v10;
  void *v11;
  PXDisplayTitleInfo *v12;
  PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer *v13;
  void *v14;
  NSObject *v15;
  PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer *v21;
  id v22;
  uint8_t buf[16];
  uint64_t v24;
  __int128 v25;
  uint64_t v26;

  v5 = a3;
  -[PXContentSyndicationAssetSavingHelper presentationEnvironment](self, "presentationEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationAssetSavingHelper.m"), 245, CFSTR("%@ requires a non-nil presentation environment"), v19);

  }
  v7 = objc_alloc((Class)off_1E50B1668);
  -[PXContentSyndicationAssetSavingHelper assetCollection](self, "assetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)off_1E50B7E98;
  v25 = xmmword_1A7C0C1F0;
  v26 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = (void *)objc_msgSend(v7, "initWithAssetCollection:keyAssetReference:indexPath:", v8, 0, &v24);

  v10 = [PXDisplayTitleInfo alloc];
  -[PXContentSyndicationAssetSavingHelper assetCollection](self, "assetCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXDisplayTitleInfo initWithAssetCollection:useVerboseSmartDescription:](v10, "initWithAssetCollection:useVerboseSmartDescription:", v11, 0);

  v13 = -[PXAssetCollectionActionPerformer initWithActionType:assetCollectionReference:displayTitleInfo:]([PXPhotoKitAssetCollectionContentSyndicationSaveToLibraryActionPerformer alloc], "initWithActionType:assetCollectionReference:displayTitleInfo:", CFSTR("PXAssetCollectionActionTypeContentSyndicationSaveToLibrary"), v9, v12);
  -[PXContentSyndicationAssetSavingHelper presentationEnvironment](self, "presentationEnvironment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer setPresentationEnvironment:](v13, "setPresentationEnvironment:", v14);

  PLSyndicationUIGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "ContentSyndicationAssetSavingHelper: Performing save action...", buf, 2u);
  }

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __83__PXContentSyndicationAssetSavingHelper_saveUnsavedSyndicatedAssetsWithCompletion___block_invoke;
  v20[3] = &unk_1E5148348;
  v21 = v13;
  v22 = v5;
  v16 = v13;
  v17 = v5;
  -[PXActionPerformer performActionWithCompletionHandler:](v16, "performActionWithCompletionHandler:", v20);

}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (BOOL)userCanContinueAfterSavingSyndicatedAssets
{
  return self->_userCanContinueAfterSavingSyndicatedAssets;
}

- (void)setUserCanContinueAfterSavingSyndicatedAssets:(BOOL)a3
{
  self->_userCanContinueAfterSavingSyndicatedAssets = a3;
}

- (BOOL)allowSkippingUnsavedAssets
{
  return self->_allowSkippingUnsavedAssets;
}

- (void)setAllowSkippingUnsavedAssets:(BOOL)a3
{
  self->_allowSkippingUnsavedAssets = a3;
}

- (BOOL)skipUserPromptForSavingAssets
{
  return self->_skipUserPromptForSavingAssets;
}

- (void)setSkipUserPromptForSavingAssets:(BOOL)a3
{
  self->_skipUserPromptForSavingAssets = a3;
}

- (PXPresentationEnvironment)presentationEnvironment
{
  return self->_presentationEnvironment;
}

- (void)setPresentationEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_presentationEnvironment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationEnvironment, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

void __83__PXContentSyndicationAssetSavingHelper_saveUnsavedSyndicatedAssetsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  objc_msgSend(v5, "savedAssetsFetchResult");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, id))(v4 + 16))(v4, a2, v7, v6);

}

uint64_t __149__PXContentSyndicationAssetSavingHelper_presentSaveAlertForUnsavedSyndicatedAssets_canContinueAfterSaving_allowSkippingUnsavedAssets_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 40))
    v1 = 2;
  else
    v1 = 1;
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v1, 0);
}

uint64_t __149__PXContentSyndicationAssetSavingHelper_presentSaveAlertForUnsavedSyndicatedAssets_canContinueAfterSaving_allowSkippingUnsavedAssets_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __149__PXContentSyndicationAssetSavingHelper_presentSaveAlertForUnsavedSyndicatedAssets_canContinueAfterSaving_allowSkippingUnsavedAssets_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __106__PXContentSyndicationAssetSavingHelper_performSaveActionIfNeededOnUnsavedSyndicatedAssetsWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = 1;
  else
    v3 = 4;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

uint64_t __106__PXContentSyndicationAssetSavingHelper_performSaveActionIfNeededOnUnsavedSyndicatedAssetsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlertResponseForUnsavedSyndicatedAssets:helperResult:error:completionHandler:", *(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 48));
}

uint64_t __125__PXContentSyndicationAssetSavingHelper__handleAlertResponseForUnsavedSyndicatedAssets_helperResult_error_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = 1;
  else
    v3 = 4;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

uint64_t __125__PXContentSyndicationAssetSavingHelper__handleAlertResponseForUnsavedSyndicatedAssets_helperResult_error_completionHandler___block_invoke_142(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = 2;
  else
    v3 = 4;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

id __125__PXContentSyndicationAssetSavingHelper__handleAlertResponseForUnsavedSyndicatedAssets_helperResult_error_completionHandler___block_invoke_143(int a1, id a2)
{
  return a2;
}

+ (id)assetSavingHelperFromAssetCollectionActionPerformer:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PXContentSyndicationAssetSavingHelper *v8;
  void *v9;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;

  v5 = a3;
  objc_msgSend(v5, "assetCollectionReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXContentSyndicationAssetSavingHelper.m"), 44, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("actionPerformer.assetCollectionReference.assetCollection"), v13);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXContentSyndicationAssetSavingHelper.m"), 44, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("actionPerformer.assetCollectionReference.assetCollection"), v13, v15);

    goto LABEL_6;
  }
LABEL_3:
  v8 = -[PXContentSyndicationAssetSavingHelper initWithAssetCollection:]([PXContentSyndicationAssetSavingHelper alloc], "initWithAssetCollection:", v7);
  objc_msgSend(v5, "presentationEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXContentSyndicationAssetSavingHelper setPresentationEnvironment:](v8, "setPresentationEnvironment:", v9);
  -[PXContentSyndicationAssetSavingHelper setUserCanContinueAfterSavingSyndicatedAssets:](v8, "setUserCanContinueAfterSavingSyndicatedAssets:", 0);
  -[PXContentSyndicationAssetSavingHelper setAllowSkippingUnsavedAssets:](v8, "setAllowSkippingUnsavedAssets:", 0);

  return v8;
}

@end
