@implementation PXPhotoKitDestructiveActionPerformer

+ (BOOL)canExpungeAsset:(id)a3 inAssetCollection:(id)a4
{
  return PXCanExpungeAssetFromAssetCollection(a3, a4);
}

- (int64_t)destructivePhotosAction
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitDestructiveActionPerformer.m"), 42, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXPhotoKitDestructiveActionPerformer destructivePhotosAction]", v6);

  abort();
}

- (void)getConfirmationMessage:(id *)a3 confirmationButtonTitle:(id *)a4 isDestructive:(BOOL *)a5
{
  PXPhotoKitDeletePhotosActionController *v9;
  int64_t v10;
  void *v11;
  void *v12;
  PXPhotoKitDeletePhotosActionController *v13;

  v9 = [PXPhotoKitDeletePhotosActionController alloc];
  v10 = -[PXPhotoKitDestructiveActionPerformer destructivePhotosAction](self, "destructivePhotosAction");
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer undoManager](self, "undoManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PXPhotoKitDeletePhotosActionController initWithAction:assets:undoManager:delegate:](v9, "initWithAction:assets:undoManager:delegate:", v10, v11, v12, self);

  -[PXPhotoKitDeletePhotosActionController getConfirmationMessage:destructiveButtonTitle:cancelButtonTitle:isDestructiveBehavior:](v13, "getConfirmationMessage:destructiveButtonTitle:cancelButtonTitle:isDestructiveBehavior:", a3, a4, 0, a5);
}

- (id)_assetsAllowedToExpunge:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "canPerformEditOperation:", 101, (_QWORD)v12))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_presentAllDuplicatesDeletionAlertWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v4 = a3;
  PXLocalizedStringFromTable(CFSTR("DELETE_ALL_DUPLICATES_WARNING_TITLE"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("DELETE_ALL_DUPLICATES_WARNING_MESSAGE"), CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__PXPhotoKitDestructiveActionPerformer__presentAllDuplicatesDeletionAlertWithCompletion___block_invoke;
  v14[3] = &unk_1E5136710;
  v15 = v5;
  v16 = v6;
  v8 = v4;
  v17 = v8;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "presentAlertWithConfigurationHandler:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    PLSharedLibraryGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Failed to present all duplicates removal warning.", v13, 2u);
    }

    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

- (void)_logCompletionAnalyticsForAssets:(id)a3 withAction:(int64_t)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _BYTE v50[128];
  _QWORD v51[2];
  _QWORD v52[2];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v13, "px_isUnsavedSyndicatedAsset"))
          v14 = v7;
        else
          v14 = v6;
        objc_msgSend(v14, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v10);
  }

  v15 = objc_msgSend(v6, "count");
  v16 = (_QWORD *)MEMORY[0x1E0D09830];
  v17 = (_QWORD *)MEMORY[0x1E0D09828];
  if (v15)
  {
    if ((unint64_t)a4 > 5)
      v18 = 0;
    else
      v18 = off_1E5129C78[a4];
    v19 = v18;
    v20 = (void *)MEMORY[0x1E0D09910];
    v51[0] = *v16;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = *v17;
    v52[0] = v22;
    v23 = (void *)objc_msgSend(v6, "copy");
    v52[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendEvent:withPayload:", v19, v24);

  }
  if (objc_msgSend(v7, "count"))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v7;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v25)
    {
      v26 = v25;
      v35 = 0;
      v38 = *v16;
      v39 = *(_QWORD *)v41;
      v37 = *v17;
LABEL_19:
      v27 = 0;
      v28 = 9;
      if (v35 > 9)
        v28 = v35;
      v29 = v35 - v28;
      while (1)
      {
        if (*(_QWORD *)v41 != v39)
          objc_enumerationMutation(obj);
        v30 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v27);
        v31 = (void *)MEMORY[0x1E0D09910];
        v48[0] = v38;
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v48[1] = v37;
        v49[0] = v33;
        v49[1] = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.syndicationSuggestionRemoved"), v34);

        if (!(v29 + v27))
          break;
        if (v26 == ++v27)
        {
          v35 += v27;
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
          if (v26)
            goto LABEL_19;
          break;
        }
      }
    }

  }
}

- (void)_performAction:(int64_t)a3 onAssets:(id)a4
{
  id v6;
  PXPhotoKitDeletePhotosActionController *v7;
  void *v8;
  PXPhotoKitDeletePhotosActionController *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  int64_t v14;
  _QWORD v15[6];
  _QWORD v16[3];
  char v17;

  v6 = a4;
  v7 = [PXPhotoKitDeletePhotosActionController alloc];
  -[PXActionPerformer undoManager](self, "undoManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXPhotoKitDeletePhotosActionController initWithAction:assets:undoManager:delegate:](v7, "initWithAction:assets:undoManager:delegate:", a3, v6, v8, self);

  -[PXPhotoKitDeletePhotosActionController setShouldSkipDeleteConfirmation:](v9, "setShouldSkipDeleteConfirmation:", -[PXPhotoKitAssetActionPerformer shouldSkipUserConfirmation](self, "shouldSkipUserConfirmation"));
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__PXPhotoKitDestructiveActionPerformer__performAction_onAssets___block_invoke;
  v15[3] = &unk_1E5148AA8;
  v15[4] = self;
  v15[5] = v16;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__PXPhotoKitDestructiveActionPerformer__performAction_onAssets___block_invoke_2;
  v11[3] = &unk_1E512D5A0;
  v13 = v16;
  v11[4] = self;
  v10 = v6;
  v12 = v10;
  v14 = a3;
  -[PXPhotoKitDeletePhotosActionController performWithWillDeleteHandler:completionHandler:](v9, "performWithWillDeleteHandler:completionHandler:", v15, v11);

  _Block_object_dispose(v16, 8);
}

- (void)performUserInteractionTask
{
  int64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  __CFString *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  objc_class *v67;
  void *v68;
  objc_class *v69;
  void *v70;
  void *v71;
  objc_class *v72;
  void *v73;
  objc_class *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  __CFString *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  __CFString *v86;
  void *v87;
  void *v88;
  _QWORD v89[5];
  id v90;
  uint64_t v91;
  _QWORD v92[5];
  _QWORD v93[5];
  _QWORD v94[5];
  id v95;
  int64_t v96;
  uint8_t buf[8];
  _QWORD v98[5];
  _QWORD v99[5];
  _QWORD v100[5];
  id v101;
  int64_t v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD v105[2];

  v4 = -[PXPhotoKitDestructiveActionPerformer destructivePhotosAction](self, "destructivePhotosAction");
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(v4 - 5) <= 1)
  {
    -[PXPhotoKitAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = (objc_class *)objc_opt_class();
      NSStringFromClass(v69);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_descriptionForAssertionMessage");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitDestructiveActionPerformer.m"), 181, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetsByAssetCollection.allKeys.firstObject"), v68, v70);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (objc_class *)objc_opt_class();
      NSStringFromClass(v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitDestructiveActionPerformer.m"), 181, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetsByAssetCollection.allKeys.firstObject"), v68);
    }

LABEL_4:
    if (!objc_msgSend(v8, "isTrashBin"))
    {
LABEL_21:

      goto LABEL_22;
    }
    -[PXPhotoKitAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_7;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (objc_class *)objc_opt_class();
      NSStringFromClass(v74);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "px_descriptionForAssertionMessage");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitDestructiveActionPerformer.m"), 183, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetsByAssetCollection.allKeys.firstObject"), v73, v75);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = (objc_class *)objc_opt_class();
      NSStringFromClass(v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitDestructiveActionPerformer.m"), 183, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetsByAssetCollection.allKeys.firstObject"), v73);
    }

LABEL_7:
    objc_msgSend(v11, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "exiting");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v13, "hasSharedLibrary");
    if (v14)
    {
      -[PXPhotoKitDestructiveActionPerformer _assetsAllowedToExpunge:](self, "_assetsAllowedToExpunge:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v5, "count");
      v88 = v16;
      if (v17 != objc_msgSend(v16, "count"))
      {
        v18 = objc_msgSend(v5, "count");
        v104 = 0;
        v105[0] = 0;
        v103 = 0;
        +[PXPhotoKitDeletePhotosActionController assetTypeCountsForAssets:photosCount:videosCount:othersCount:](PXPhotoKitDeletePhotosActionController, "assetTypeCountsForAssets:photosCount:videosCount:othersCount:", v5, v105, &v104, &v103);
        if (v105[0] == v18)
        {
          v19 = CFSTR("SHAREDLIBRARY_EXPUNGE_EXITING_TITLE_PHOTO");
          v20 = CFSTR("SHAREDLIBRARY_EXPUNGE_EXITING_MESSAGE_PHOTO");
        }
        else
        {
          if (v104 == v18)
            v20 = CFSTR("SHAREDLIBRARY_EXPUNGE_EXITING_MESSAGE_VIDEO");
          else
            v20 = CFSTR("SHAREDLIBRARY_EXPUNGE_EXITING_MESSAGE_ITEM");
          if (v104 == v18)
            v19 = CFSTR("SHAREDLIBRARY_EXPUNGE_EXITING_TITLE_VIDEO");
          else
            v19 = CFSTR("SHAREDLIBRARY_EXPUNGE_EXITING_TITLE_ITEM");
        }
        if (v18 >= 2)
        {
          -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("S"));
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v20, "stringByAppendingString:", CFSTR("S"));
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        PLServicesSharedLibraryLocalizedFrameworkString();
        v26 = objc_claimAutoreleasedReturnValue();
        v86 = v20;
        PLServicesSharedLibraryLocalizedFrameworkString();
        v27 = objc_claimAutoreleasedReturnValue();
        v76 = *MEMORY[0x1E0D724E0];
        v82 = (void *)v27;
        PFLocalizedStringWithValidatedFormat();
        v28 = objc_claimAutoreleasedReturnValue();
        PLServicesSharedLibraryLocalizedFrameworkString();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = (void *)v26;
        v80 = (void *)v28;
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v26, v28, 0, v76);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v88, "count"))
        {
          v31 = v88;

          v78 = v11;
          v32 = v30;
          v33 = v29;
          v34 = v13;
          v35 = v19;
          v36 = (void *)MEMORY[0x1E0DC3448];
          v100[0] = MEMORY[0x1E0C809B0];
          v100[1] = 3221225472;
          v100[2] = __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke;
          v100[3] = &unk_1E5136EC8;
          v100[4] = self;
          v102 = v4;
          v5 = v31;
          v101 = v5;
          v37 = v36;
          v19 = v35;
          v13 = v34;
          v29 = v33;
          v30 = v32;
          v11 = v78;
          objc_msgSend(v37, "actionWithTitle:style:handler:", v29, 2, v100);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addAction:", v38);

          v39 = (void *)MEMORY[0x1E0DC3448];
          PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v99[0] = MEMORY[0x1E0C809B0];
          v99[1] = 3221225472;
          v99[2] = __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_2;
          v99[3] = &unk_1E5144530;
          v99[4] = self;
          objc_msgSend(v39, "actionWithTitle:style:handler:", v40, 1, v99);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addAction:", v41);

          v42 = v101;
        }
        else
        {
          v43 = (void *)MEMORY[0x1E0DC3448];
          PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v98[0] = MEMORY[0x1E0C809B0];
          v98[1] = 3221225472;
          v98[2] = __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_3;
          v98[3] = &unk_1E5144530;
          v98[4] = self;
          objc_msgSend(v43, "actionWithTitle:style:handler:", v42, 0, v98);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addAction:", v44);

        }
        if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v30))
        {
          PLSharedLibraryGetLog();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A6789000, v45, OS_LOG_TYPE_ERROR, "Failed to present shared library item removal warning.", buf, 2u);
          }

          -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
        }

LABEL_58:
        goto LABEL_59;
      }
    }
    else
    {
      if (!v15)
      {
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
      -[PXPhotoKitDestructiveActionPerformer _assetsAllowedToExpunge:](self, "_assetsAllowedToExpunge:", v5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v5, "count");
      v88 = v24;
      if (v25 != objc_msgSend(v24, "count"))
      {
        v46 = objc_msgSend(v5, "count");
        v104 = 0;
        v105[0] = 0;
        v103 = 0;
        +[PXPhotoKitDeletePhotosActionController assetTypeCountsForAssets:photosCount:videosCount:othersCount:](PXPhotoKitDeletePhotosActionController, "assetTypeCountsForAssets:photosCount:videosCount:othersCount:", v5, v105, &v104, &v103);
        if (v105[0] == v46)
        {
          v47 = CFSTR("SHAREDLIBRARY_EXPUNGE_UNOWNED_MESSAGE_PHOTO");
          v19 = CFSTR("SHAREDLIBRARY_EXPUNGE_UNOWNED_TITLE_PHOTO");
        }
        else
        {
          if (v104 == v46)
            v19 = CFSTR("SHAREDLIBRARY_EXPUNGE_UNOWNED_TITLE_VIDEO");
          else
            v19 = CFSTR("SHAREDLIBRARY_EXPUNGE_UNOWNED_TITLE_ITEM");
          if (v104 == v46)
            v47 = CFSTR("SHAREDLIBRARY_EXPUNGE_UNOWNED_MESSAGE_VIDEO");
          else
            v47 = CFSTR("SHAREDLIBRARY_EXPUNGE_UNOWNED_MESSAGE_ITEM");
        }
        if (v46 >= 2)
        {
          -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("S"));
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v47, "stringByAppendingString:", CFSTR("S"));
          v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        PLServicesSharedLibraryLocalizedFrameworkString();
        v48 = objc_claimAutoreleasedReturnValue();
        v79 = v47;
        PLServicesSharedLibraryLocalizedFrameworkString();
        v49 = objc_claimAutoreleasedReturnValue();
        v77 = *MEMORY[0x1E0D724E0];
        v83 = (void *)v49;
        PFLocalizedStringWithValidatedFormat();
        v50 = objc_claimAutoreleasedReturnValue();
        PLServicesSharedLibraryLocalizedFrameworkString();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = (void *)v48;
        v81 = (void *)v50;
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v48, v50, 0, v77);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = v52;
        if (objc_msgSend(v88, "count"))
        {
          v53 = v88;

          v54 = v51;
          v55 = v19;
          v56 = (void *)MEMORY[0x1E0DC3448];
          v94[0] = MEMORY[0x1E0C809B0];
          v94[1] = 3221225472;
          v94[2] = __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_200;
          v94[3] = &unk_1E5136EC8;
          v94[4] = self;
          v96 = v4;
          v5 = v53;
          v95 = v5;
          v57 = v56;
          v19 = v55;
          v51 = v54;
          v52 = v87;
          objc_msgSend(v57, "actionWithTitle:style:handler:", v51, 2, v94);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "addAction:", v58);

          v59 = (void *)MEMORY[0x1E0DC3448];
          PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v93[0] = MEMORY[0x1E0C809B0];
          v93[1] = 3221225472;
          v93[2] = __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_2_201;
          v93[3] = &unk_1E5144530;
          v93[4] = self;
          objc_msgSend(v59, "actionWithTitle:style:handler:", v60, 1, v93);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "addAction:", v61);

          v62 = v95;
        }
        else
        {
          v63 = (void *)MEMORY[0x1E0DC3448];
          PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v92[0] = MEMORY[0x1E0C809B0];
          v92[1] = 3221225472;
          v92[2] = __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_3_202;
          v92[3] = &unk_1E5144530;
          v92[4] = self;
          objc_msgSend(v63, "actionWithTitle:style:handler:", v62, 0, v92);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addAction:", v64);

        }
        if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v52))
        {
          PLSharedLibraryGetLog();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A6789000, v65, OS_LOG_TYPE_ERROR, "Failed to present shared library item removal warning.", buf, 2u);
          }

          -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
        }

        goto LABEL_58;
      }
    }

    goto LABEL_19;
  }
  if (!v4)
  {
    -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "dataSource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "containerCollection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "px_isAllLibraryDuplicatesSmartAlbum");

      if (v23 && PXDeduplicationEntireDuplicatesGroupsAreSelected(v8))
      {
        v89[0] = MEMORY[0x1E0C809B0];
        v89[1] = 3221225472;
        v89[2] = __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_204;
        v89[3] = &unk_1E512D5C8;
        v89[4] = self;
        v91 = 0;
        v5 = v5;
        v90 = v5;
        -[PXPhotoKitDestructiveActionPerformer _presentAllDuplicatesDeletionAlertWithCompletion:](self, "_presentAllDuplicatesDeletionAlertWithCompletion:", v89);

LABEL_59:
        goto LABEL_23;
      }
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_22:
  -[PXPhotoKitDestructiveActionPerformer _performAction:onAssets:](self, "_performAction:onAssets:", v4, v5);
LABEL_23:

}

- (void)deletePhotosActionController:(id)a3 presentConfirmationViewController:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", a4))
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Failed to present delete confirmation. User must confirm to perform removal.", v6, 2u);
    }

    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  }
}

- (void)deletePhotosActionController:(id)a3 dismissConfirmationViewController:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  if (!-[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", a4, 0))
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Failed to dismiss delete confirmation.", v5, 2u);
    }

  }
}

- (BOOL)isCancellable
{
  return -[PXActionPerformer state](self, "state") == 10;
}

uint64_t __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_performAction:onAssets:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

uint64_t __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

uint64_t __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

uint64_t __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_200(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performAction:onAssets:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_2_201(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

uint64_t __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_3_202(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

uint64_t __66__PXPhotoKitDestructiveActionPerformer_performUserInteractionTask__block_invoke_204(_QWORD *a1, int a2)
{
  void *v3;

  v3 = (void *)a1[4];
  if (a2)
    return objc_msgSend(v3, "_performAction:onAssets:", a1[6], a1[5]);
  else
    return objc_msgSend(v3, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

uint64_t __64__PXPhotoKitDestructiveActionPerformer__performAction_onAssets___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result == 10)
  {
    objc_msgSend(*(id *)(a1 + 32), "instantlyExcludeAssetsFromDataSource");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }
  return result;
}

uint64_t __64__PXPhotoKitDestructiveActionPerformer__performAction_onAssets___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t result;

  if ((a2 & 1) == 0 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "stopExcludingAssetsFromDataSource");
  v4 = objc_msgSend(*(id *)(a1 + 32), "state");
  v5 = *(void **)(a1 + 32);
  if (v4 == 10)
  {
    result = objc_msgSend(v5, "completeUserInteractionTaskWithSuccess:error:", a2, 0);
  }
  else
  {
    result = objc_msgSend(v5, "state");
    if (result == 20)
      result = objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, 0);
  }
  if ((_DWORD)a2)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "count");
    if (result)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "_logCompletionAnalyticsForAssets:withAction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
      if (*(_QWORD *)(a1 + 56) <= 1uLL)
        return +[PXTipsAppDonation donateSignalForEvent:](PXTipsAppDonation, "donateSignalForEvent:", 0);
    }
  }
  return result;
}

void __89__PXPhotoKitDestructiveActionPerformer__presentAllDuplicatesDeletionAlertWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setMessage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setStyle:", 0);
  PXLocalizedStringFromTable(CFSTR("PXContinue"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__PXPhotoKitDestructiveActionPerformer__presentAllDuplicatesDeletionAlertWithCompletion___block_invoke_2;
  v10[3] = &unk_1E5148A40;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v4, "addActionWithTitle:style:action:", v5, 0, v10);

  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __89__PXPhotoKitDestructiveActionPerformer__presentAllDuplicatesDeletionAlertWithCompletion___block_invoke_3;
  v8[3] = &unk_1E5148A40;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "addActionWithTitle:style:action:", v7, 0, v8);

}

uint64_t __89__PXPhotoKitDestructiveActionPerformer__presentAllDuplicatesDeletionAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__PXPhotoKitDestructiveActionPerformer__presentAllDuplicatesDeletionAlertWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
