@implementation PXPhotoKitMergeDuplicatesActionPerformer

- (BOOL)shouldExitSelectModeForState:(unint64_t)a3
{
  return a3 == 20;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  PXPhotoKitMergeDuplicatesActionPerformer *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  PXPhotoKitMergeDuplicatesActionPerformer *v17;

  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXDeduplicationAssetsThatCanBeMergedInSelection(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "selectedIndexPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    v7 = self;
    v8 = 0;
    goto LABEL_5;
  }
  if (-[PXPhotoKitAssetActionPerformer shouldSkipUserConfirmation](self, "shouldSkipUserConfirmation"))
  {
    objc_storeStrong((id *)&self->_mergeableSelection, v4);
    v7 = self;
    v8 = 1;
LABEL_5:
    -[PXPhotoKitMergeDuplicatesActionPerformer completeUserInteractionTaskWithSuccess:error:](v7, "completeUserInteractionTaskWithSuccess:error:", v8, 0);
    goto LABEL_11;
  }
  PXDeduplicationIdenticalSelectionFromSelection(v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedIndexPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 == v6 || !v11)
  {
    v12 = v11 == v6;
    PXDeduplicationLocalizedMergeConfirmationMessage(v4, 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitMergeDuplicatesActionPerformer performMergeWithSelection:localizedMessage:onlyIdenticalItemsSelected:](self, "performMergeWithSelection:localizedMessage:onlyIdenticalItemsSelected:", v4, v13, v12);

  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__PXPhotoKitMergeDuplicatesActionPerformer_performUserInteractionTask__block_invoke;
    v14[3] = &unk_1E511C2F8;
    v15 = v9;
    v16 = v4;
    v17 = self;
    -[PXPhotoKitMergeDuplicatesActionPerformer _presentDuplicatesTypeDialogWithIdenticalCount:totalCount:completion:](self, "_presentDuplicatesTypeDialogWithIdenticalCount:totalCount:completion:", v11, v6, v14);

  }
LABEL_11:

}

- (void)_presentDuplicatesTypeDialogWithIdenticalCount:(int64_t)a3 totalCount:(int64_t)a4 completion:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  int64_t v28;
  int64_t v29;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[16];

  v7 = a5;
  if (a4 == a3)
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Shouldn't need this dialog if there are no different types", buf, 2u);
    }

  }
  v9 = (void *)MEMORY[0x1E0DC3450];
  PXLocalizedStringFromTable(CFSTR("MERGE_DUPLICATES_ACTION_CONFIRMATION_IDENTICAL_AND_PERCEPTUAL"), CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", 0, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(CFSTR("MERGE_%ld_IDENITICAL_DUPLICATES_ACTION_FORMAT"), CFSTR("PhotosUICore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = a3;
  PXLocalizedStringWithValidatedFormat(v12, CFSTR("%ld"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0DC3448];
  v15 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __113__PXPhotoKitMergeDuplicatesActionPerformer__presentDuplicatesTypeDialogWithIdenticalCount_totalCount_completion___block_invoke;
  v35[3] = &unk_1E5142658;
  v16 = v7;
  v36 = v16;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v13, 0, v35, v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v17);

  PXLocalizedStringFromTable(CFSTR("MERGE_%ld_ALL_DUPLICATES_ACTION_FORMAT"), CFSTR("PhotosUICore"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = a4;
  PXLocalizedStringWithValidatedFormat(v18, CFSTR("%ld"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0DC3448];
  v33[0] = v15;
  v33[1] = 3221225472;
  v33[2] = __113__PXPhotoKitMergeDuplicatesActionPerformer__presentDuplicatesTypeDialogWithIdenticalCount_totalCount_completion___block_invoke_2;
  v33[3] = &unk_1E5142658;
  v21 = v16;
  v34 = v21;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v19, 0, v33, v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v22);

  v23 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v15;
  v31[1] = 3221225472;
  v31[2] = __113__PXPhotoKitMergeDuplicatesActionPerformer__presentDuplicatesTypeDialogWithIdenticalCount_totalCount_completion___block_invoke_3;
  v31[3] = &unk_1E5142658;
  v25 = v21;
  v32 = v25;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 1, v31);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v26);

  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v11))
  {
    PLSharedLibraryGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v27, OS_LOG_TYPE_ERROR, "Failed to present duplicates merge warning.", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v25 + 2))(v25, 0, 0);
  }

}

- (void)performMergeWithSelection:(id)a3 localizedMessage:(id)a4 onlyIdenticalItemsSelected:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  uint8_t buf[4];
  PXPhotoKitMergeDuplicatesActionPerformer *v33;
  uint64_t v34;

  v5 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "sectionIndexPathsContainingSelection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  PLDuplicateDetectionGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = self;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Present Confirmation Dialog", buf, 0xCu);
  }

  if (v5)
    v13 = CFSTR("MERGE_%ld_DUPLICATES_CONFIRMATION_IDENTICAL_FORMAT");
  else
    v13 = CFSTR("MERGE_%ld_DUPLICATES_ACTION_FORMAT");
  PXLocalizedStringFromTable(v13, CFSTR("PhotosUICore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedIndexPaths");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v15, "count");
  PXLocalizedStringWithValidatedFormat(v14, CFSTR("%ld"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v9, 0, v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v19 = (void *)MEMORY[0x1E0DC3448];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __114__PXPhotoKitMergeDuplicatesActionPerformer_performMergeWithSelection_localizedMessage_onlyIdenticalItemsSelected___block_invoke;
  v29[3] = &unk_1E5136EC8;
  v29[4] = self;
  v20 = v8;
  v30 = v20;
  v31 = v11;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v16, 2, v29);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v21);

  v22 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __114__PXPhotoKitMergeDuplicatesActionPerformer_performMergeWithSelection_localizedMessage_onlyIdenticalItemsSelected___block_invoke_2;
  v28[3] = &unk_1E5144530;
  v28[4] = self;
  objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 1, v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v24);

  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v17))
  {
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.deduplicationEventFailed"), MEMORY[0x1E0C9AA70]);
    PLUIGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_ERROR, "Failed to present unshared unowned confirmation. User must confirm to perform move.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present confirmation dialog."));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitMergeDuplicatesActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v26);

  }
}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXPhotoKitMergeDuplicatesActionPerformer;
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](&v6, sel_completeUserInteractionTaskWithSuccess_error_, a3, a4);
  if (v4)
    -[PXPhotoKitMergeDuplicatesActionPerformer _clearSelection](self, "_clearSelection");
}

- (void)performBackgroundTask
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  PXPhotoKitMergeDuplicatesActionPerformer *v27;
  uint8_t buf[4];
  PXPhotoKitMergeDuplicatesActionPerformer *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  PXDuplicateGroupingAssetIdentifiersFromSelection(self->_mergeableSelection);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  PLDuplicateDetectionGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      -[PXSelectionSnapshot selectedIndexPaths](self->_mergeableSelection, "selectedIndexPaths");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = self;
      v30 = 2048;
      v31 = v5;
      v32 = 2048;
      v33 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will attempt merging %tu duplicate groups with a total of %tu assets", buf, 0x20u);

    }
    PXLocalizedStringFromTable(CFSTR("MERGE_DUPLICATES_ACTION_ONGOING_TOAST_TITLE"), CFSTR("PhotosUICore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("MERGE_DUPLICATES_ACTION_SUCCESS_TOAST_TITLE"), CFSTR("PhotosUICore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedAssetCountForUsage(v5, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "createIndeterminateProgressToastForActionPerformer:title:description:", self, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "willStartProgress");
    -[PXSelectionSnapshot firstObject](self->_mergeableSelection, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_6:
        objc_msgSend(v13, "photoLibrary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x1E0CD1518];
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __65__PXPhotoKitMergeDuplicatesActionPerformer_performBackgroundTask__block_invoke;
        v24[3] = &unk_1E5146AF0;
        v25 = v12;
        v26 = v10;
        v27 = self;
        v16 = v10;
        v17 = v12;
        objc_msgSend(v15, "mergeDuplicateAssetWithLocalIdentifierGroupingContainer:inPhotoLibrary:completionHandler:", v4, v14, v24);

        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_descriptionForAssertionMessage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v23;
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitMergeDuplicatesActionPerformer.m"), 186, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("_mergeableSelection.firstObject"), v20, v22);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitMergeDuplicatesActionPerformer.m"), 186, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("_mergeableSelection.firstObject"), v20);
    }

    goto LABEL_6;
  }
  if (v7)
  {
    *(_DWORD *)buf = 138543362;
    v29 = self;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Merge skipped, no assets selected.", buf, 0xCu);
  }

  -[PXPhotoKitMergeDuplicatesActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 0, 0);
LABEL_10:

}

- (void)completeBackgroundTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  objc_super v13;
  uint8_t buf[4];
  PXPhotoKitMergeDuplicatesActionPerformer *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PLDuplicateDetectionGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 138543362;
    v15 = self;
    v9 = "%{public}@ Merge succeeded";
    v10 = v8;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)buf = 138543618;
    v15 = self;
    v16 = 2112;
    v17 = v6;
    v9 = "%{public}@ Merge failed with error %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
  }
  _os_log_impl(&dword_1A6789000, v10, v11, v9, buf, v12);
LABEL_7:

  v13.receiver = self;
  v13.super_class = (Class)PXPhotoKitMergeDuplicatesActionPerformer;
  -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](&v13, sel_completeBackgroundTaskWithSuccess_error_, v4, v6);
  if (!v4)
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.deduplicationEventFailed"), MEMORY[0x1E0C9AA70]);

}

- (BOOL)canPresentAlertInBackgroudState
{
  return 1;
}

- (void)_presentGenericFailureAlertAndCompleteBackgroundTaskWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  PXPhotoKitMergeDuplicatesActionPerformer *v18;
  id v19;
  uint8_t buf[4];
  PXPhotoKitMergeDuplicatesActionPerformer *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLDuplicateDetectionGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Present Server Side Disabled Alert", buf, 0xCu);
  }

  PXLocalizedStringFromTable(CFSTR("MERGE_DUPLICATES_ACTION_ERROR_TITLE"), CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("MERGE_DUPLICATES_ACTION_ERROR_MESSAGE"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __106__PXPhotoKitMergeDuplicatesActionPerformer__presentGenericFailureAlertAndCompleteBackgroundTaskWithError___block_invoke;
  v17 = &unk_1E51458F8;
  v18 = self;
  v11 = v4;
  v19 = v11;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12, v14, v15, v16, v17, v18);

  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v8))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present failure alert."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitMergeDuplicatesActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 0, v13);

  }
}

- (void)_clearSelection
{
  NSObject *v3;
  void *v4;
  int v5;
  PXPhotoKitMergeDuplicatesActionPerformer *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLDuplicateDetectionGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Will clear selection", (uint8_t *)&v5, 0xCu);
  }

  -[PXAssetActionPerformer selectionManager](self, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performChanges:", &__block_literal_global_40285);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableSelection, 0);
}

uint64_t __59__PXPhotoKitMergeDuplicatesActionPerformer__clearSelection__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

uint64_t __106__PXPhotoKitMergeDuplicatesActionPerformer__presentGenericFailureAlertAndCompleteBackgroundTaskWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", 0, *(_QWORD *)(a1 + 40));
}

void __65__PXPhotoKitMergeDuplicatesActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v5 = v4;
  px_dispatch_on_main_queue();

}

uint64_t __65__PXPhotoKitMergeDuplicatesActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "finishProgressMarkingAsComplete:updatedLocalizedTitle:updatedLocalizedDescription:", 1, *(_QWORD *)(a1 + 40), 0);
  v2 = *(void **)(a1 + 48);
  if (*(_BYTE *)(a1 + 64))
    return objc_msgSend(v2, "completeBackgroundTaskWithSuccess:error:", 1, *(_QWORD *)(a1 + 56));
  else
    return objc_msgSend(v2, "_presentGenericFailureAlertAndCompleteBackgroundTaskWithError:", *(_QWORD *)(a1 + 56));
}

void __114__PXPhotoKitMergeDuplicatesActionPerformer_performMergeWithSelection_localizedMessage_onlyIdenticalItemsSelected___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 192), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "dataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  PXDeduplicationSendMergeAnalytics(v2, objc_msgSend(v3, "numberOfSections"));

}

uint64_t __114__PXPhotoKitMergeDuplicatesActionPerformer_performMergeWithSelection_localizedMessage_onlyIdenticalItemsSelected___block_invoke_2(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.deduplicationEventSkip"), MEMORY[0x1E0C9AA70]);
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

uint64_t __113__PXPhotoKitMergeDuplicatesActionPerformer__presentDuplicatesTypeDialogWithIdenticalCount_totalCount_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.deduplicationSkipPerceptualMerge"), MEMORY[0x1E0C9AA70]);
}

uint64_t __113__PXPhotoKitMergeDuplicatesActionPerformer__presentDuplicatesTypeDialogWithIdenticalCount_totalCount_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __113__PXPhotoKitMergeDuplicatesActionPerformer__presentDuplicatesTypeDialogWithIdenticalCount_totalCount_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__PXPhotoKitMergeDuplicatesActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  id v7;

  if ((a2 & 1) != 0 || (_DWORD)a3)
  {
    v5 = 40;
    if ((_DWORD)a2)
      v5 = 32;
    v6 = *(id *)(a1 + v5);
    PXDeduplicationLocalizedMergeConfirmationMessage(v6, 0, a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "performMergeWithSelection:localizedMessage:onlyIdenticalItemsSelected:", v6, v7, a2);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "completeUserInteractionTaskWithSuccess:error:", a3, 0);
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.deduplicationEventSkip"), MEMORY[0x1E0C9AA70]);
  }
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return 1;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a3;
  objc_msgSend(a5, "selectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXDeduplicationLocalizedMergeActionTitleForSelection(v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v10, 0, v7, a4);
  return v11;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a4, "selectionManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXDeduplicationLocalizedMergeActionTitleForSelection(v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)shouldEnableWithActionManager:(id)a3
{
  void *v3;
  void *v4;
  BOOL CanEnableMergeActionForSelection;

  objc_msgSend(a3, "selectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CanEnableMergeActionForSelection = PXDeduplicationCanEnableMergeActionForSelection(v4);

  return CanEnableMergeActionForSelection;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  return 0;
}

+ (BOOL)canPerformWithActionManager:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;

  objc_msgSend(a3, "selectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitMergeDuplicatesActionPerformer.m"), 60, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("actionManager.selectionManager.dataSourceManager"), v13);
LABEL_9:

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
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitMergeDuplicatesActionPerformer.m"), 60, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("actionManager.selectionManager.dataSourceManager"), v13, v15);

    goto LABEL_9;
  }
LABEL_3:
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_descriptionForAssertionMessage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitMergeDuplicatesActionPerformer.m"), 61, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("dataSourceManager.dataSource.containerCollection"), v18, v19);

    }
  }
  v9 = objc_msgSend(v8, "assetCollectionSubtype") == 1000000212;

  return v9;
}

@end
