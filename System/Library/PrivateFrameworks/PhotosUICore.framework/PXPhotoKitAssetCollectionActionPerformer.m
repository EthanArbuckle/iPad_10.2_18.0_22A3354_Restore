@implementation PXPhotoKitAssetCollectionActionPerformer

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  -[PXAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedTitleForUseCase:assetCollectionReference:withInputs:", a3, v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_confirmationAlertTitleForBlacklistingAction:(id)a3 viewSpec:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureTimeDate")))
  {
    v7 = CFSTR("PXBlockMemoryDayConfirmationTitle");
LABEL_13:
    PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureTimeDateInterval")))
  {
    v7 = CFSTR("PXBlockMemoryDateIntervalConfirmationTitle");
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureHoliday")))
  {
    v7 = CFSTR("PXBlockMemoryHolidayConfirmationTitle");
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeaturePlace")))
  {
    v7 = CFSTR("PXBlockMemoryPlaceConfirmationTitle");
    goto LABEL_13;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeaturePerson")))
  {
    v7 = CFSTR("PXBlockMemoryGenericConfirmationTitle");
    goto LABEL_13;
  }
  objc_msgSend(v6, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    PXLocalizedStringFromTable(CFSTR("PXBlockMemoryPersonSpecificConfirmationTitle"), CFSTR("PhotosUICore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringWithValidatedFormat(v10, CFSTR("%@"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXBlockMemoryPersonConfirmationTitle"), CFSTR("PhotosUICore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_14:
  return v11;
}

- (void)_promptBlacklistingConfirmatonForUserAction:(id)a3 viewSpec:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  PXMemoriesBlacklistAccessoryViewController *v25;
  PXPhotoKitAssetCollectionActionPerformer *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v26 = self;
  -[PXPhotoKitAssetCollectionActionPerformer _confirmationAlertTitleForBlacklistingAction:viewSpec:](self, "_confirmationAlertTitleForBlacklistingAction:viewSpec:", v10, v8);
  v11 = objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXBlockMemoryResetDescription_iOS"), CFSTR("PhotosUICore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXBlockConfirmationDialogButtonTitle_Confirm"), CFSTR("PhotosUICore"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXBlockConfirmationDialogButtonTitle_Cancel"), CFSTR("PhotosUICore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v11;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@\n%@"), v11, v12);
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v10, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeaturePerson"));

  v16 = 0;
  if ((_DWORD)v11)
  {
    objc_msgSend(v8, "person");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryViewFrame");
    +[PXMemoriesBlacklistAccessoryViewHelper avatarViewWithFrame:person:](PXMemoriesBlacklistAccessoryViewHelper, "avatarViewWithFrame:person:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v18 = (void *)MEMORY[0x1E0DC3448];
  v19 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __115__PXPhotoKitAssetCollectionActionPerformer__promptBlacklistingConfirmatonForUserAction_viewSpec_completionHandler___block_invoke;
  v31[3] = &unk_1E5142658;
  v20 = v9;
  v32 = v20;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v28, 2, v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v21);

  v22 = (void *)MEMORY[0x1E0DC3448];
  v29[0] = v19;
  v29[1] = 3221225472;
  v29[2] = __115__PXPhotoKitAssetCollectionActionPerformer__promptBlacklistingConfirmatonForUserAction_viewSpec_completionHandler___block_invoke_2;
  v29[3] = &unk_1E5142658;
  v23 = v20;
  v30 = v23;
  objc_msgSend(v22, "actionWithTitle:style:handler:", v13, 1, v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v24);

  if (v16)
  {
    v25 = -[PXMemoriesBlacklistAccessoryViewController initWithAccessoryView:viewSpec:]([PXMemoriesBlacklistAccessoryViewController alloc], "initWithAccessoryView:viewSpec:", v16, v8);
    objc_msgSend(v15, "_setHeaderContentViewController:", v25);

  }
  -[PXActionPerformer presentViewController:](v26, "presentViewController:", v15);

}

- (id)_createAndConfigurePhotoStreamComposeServiceViewControllerWithAlbumTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  +[PXPhotoStreamComposeServiceViewController createCanonicalInstance](PXPhotoStreamComposeServiceViewController, "createCanonicalInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setModalPresentationStyle:", 5);
  objc_msgSend(v5, "setShouldAllowAlbumPicking:", 0);
  objc_msgSend(v5, "setAlbumTitle:", v4);

  objc_msgSend(v5, "setDelegate:", self);
  return v5;
}

- (void)_cleanupTemporaryFiles
{
  void *v3;
  NSURL *exportCopyDirectoryParent;
  int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSURL *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  NSURL *v14;
  id v15;
  uint8_t buf[4];
  NSURL *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  exportCopyDirectoryParent = self->_exportCopyDirectoryParent;
  v15 = 0;
  v5 = objc_msgSend(v3, "removeItemAtURL:error:", exportCopyDirectoryParent, &v15);
  v6 = v15;

  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_exportCopyDirectoryParent;
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      v10 = "Removed existing folder at URL: %@";
      v11 = v8;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v11, v12, v10, buf, v13);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v14 = self->_exportCopyDirectoryParent;
    *(_DWORD *)buf = 138412546;
    v17 = v14;
    v18 = 2112;
    v19 = v6;
    v10 = "Did not remove folder at URL: %@, error: %@";
    v11 = v8;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 22;
    goto LABEL_6;
  }

}

- (void)_addStreamShareSources:(id)a3 toSharedAlbum:(id)a4
{
  void *v5;
  UINavigationController *v6;
  UINavigationController *presentedViewController;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__PXPhotoKitAssetCollectionActionPerformer__addStreamShareSources_toSharedAlbum___block_invoke;
  v8[3] = &unk_1E5147360;
  v8[4] = self;
  +[PXSharedAlbumAddToViewFactory contentHostedViewControllerWithSharedAlbum:mediaSources:doneCallback:](_TtC12PhotosUICore29PXSharedAlbumAddToViewFactory, "contentHostedViewControllerWithSharedAlbum:mediaSources:doneCallback:", a4, a3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
  presentedViewController = self->_presentedViewController;
  self->_presentedViewController = v6;

  -[UINavigationController setModalPresentationStyle:](self->_presentedViewController, "setModalPresentationStyle:", 1);
  -[PXActionPerformer presentViewController:completionHandler:](self, "presentViewController:completionHandler:", self->_presentedViewController, 0);

}

- (void)_addAssets:(id)a3 toSharedAlbum:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  UINavigationController *v10;
  UINavigationController *presentedViewController;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, int);
  void *v15;
  PXPhotoKitAssetCollectionActionPerformer *v16;
  id v17;

  v6 = a3;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __69__PXPhotoKitAssetCollectionActionPerformer__addAssets_toSharedAlbum___block_invoke;
  v15 = &unk_1E5144558;
  v16 = self;
  v17 = v6;
  v7 = v6;
  +[PXSharedAlbumAddToViewFactory contentHostedViewControllerWithSharedAlbum:assets:doneCallback:](_TtC12PhotosUICore29PXSharedAlbumAddToViewFactory, "contentHostedViewControllerWithSharedAlbum:assets:doneCallback:", a4, v7, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0DC3A40]);
  v10 = (UINavigationController *)objc_msgSend(v9, "initWithRootViewController:", v8, v12, v13, v14, v15, v16);
  presentedViewController = self->_presentedViewController;
  self->_presentedViewController = v10;

  -[UINavigationController setModalPresentationStyle:](self->_presentedViewController, "setModalPresentationStyle:", 1);
  -[PXActionPerformer presentViewController:completionHandler:](self, "presentViewController:completionHandler:", self->_presentedViewController, 0);

}

- (void)addAssets:(id)a3 toSharedAlbum:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  SEL v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLSharedAlbumsGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v10;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "PXPhotoKitAssetCollectionActionPerformer: Posting assets to shared album with UUID=%{public}@", buf, 0xCu);

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 813, CFSTR("%s must be called on the main thread"), "-[PXPhotoKitAssetCollectionActionPerformer addAssets:toSharedAlbum:]");

  }
  if (objc_msgSend(v7, "count"))
  {
    v11 = v8;
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_8:
        -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __68__PXPhotoKitAssetCollectionActionPerformer_addAssets_toSharedAlbum___block_invoke;
        v22[3] = &unk_1E511CB10;
        v23 = v11;
        v24 = a2;
        v22[4] = self;
        v13 = v11;
        PXSharedAlbumsValidateSharedAlbumAddAssets(v13, v7, v12, v22);

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "px_descriptionForAssertionMessage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 820, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v19, v21);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 820, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollection"), v19);
    }

    goto LABEL_8;
  }
  PLSharedAlbumsGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v15;
    _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "PXPhotoKitAssetCollectionActionPerformer: No assets to add to shared album with UUID=%{public}@", buf, 0xCu);

  }
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
LABEL_12:

}

- (void)photoStreamComposeService:(id)a3 didPostComment:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__PXPhotoKitAssetCollectionActionPerformer_photoStreamComposeService_didPostComment___block_invoke;
  v8[3] = &unk_1E5148D08;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", a3, v8);

}

- (void)photoStreamComposeServiceDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__PXPhotoKitAssetCollectionActionPerformer_photoStreamComposeServiceDidCancel___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", a3, v3);
}

- (void)controller:(id)a3 presentViewController:(id)a4
{
  -[PXActionPerformer presentViewController:](self, "presentViewController:", a4);
}

- (void)controller:(id)a3 dismissViewControllerWithCompletion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PXActionPerformer presentedViewController](self, "presentedViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v6, v5);

}

- (void)controller:(id)a3 didFinishTrimmingVideoSources:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  PXVideoTrimQueueController *trimController;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PXPhotoKitAssetCollectionActionPerformer *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "album");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EEB1DAD8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 873, CFSTR("Attempting to edit a non-editable album: %@"), v7);

  }
  objc_msgSend(v6, "videosSources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commentText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "videosSourcesSharingInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customExportsInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trimmedVideoInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PXVideoTrimQueueController areVideoSourcesStreamShareSources:](PXVideoTrimQueueController, "areVideoSourcesStreamShareSources:", v8))
  {
    v29 = v11;
    v30 = v10;
    v31 = v9;
    v32 = self;
    v33 = v7;
    v34 = v6;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v18, "mediaURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setMediaURL:", v22);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v15);
    }

    v7 = v33;
    v9 = v31;
    objc_msgSend(MEMORY[0x1E0D71648], "publishMediaFromSources:toSharedAlbum:withCommentText:completionHandler:", v13, v33, v31, 0);
    v6 = v34;
    self = v32;
    v11 = v29;
    v10 = v30;
  }
  else
  {
    objc_msgSend(v7, "userEditableAssets");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    v25 = objc_msgSend(v8, "count");
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertInternalUserEditableAssets:atIndexes:assetsSharingInfos:customExportsInfo:trimmedVideoPathInfo:commentText:", v8, v26, v10, v11, v12, v9);

  }
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  trimController = self->_trimController;
  self->_trimController = 0;

}

- (void)controller:(id)a3 didCancelTrimmingVideoSources:(id)a4
{
  id v5;
  NSObject *v6;
  PXVideoTrimQueueController *trimController;
  uint8_t v8[16];

  v5 = a3;
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Adding to Shared Albums cancelled. Cleaning up temporarily exported files", v8, 2u);
  }

  -[PXPhotoKitAssetCollectionActionPerformer _cleanupTemporaryFiles](self, "_cleanupTemporaryFiles");
  objc_msgSend(v5, "cleanupResources");

  trimController = self->_trimController;
  self->_trimController = 0;

  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

- (BOOL)assetsSharingHelper:(id)a3 presentViewController:(id)a4
{
  return -[PXActionPerformer presentViewController:](self, "presentViewController:", a4);
}

- (BOOL)assetsSharingHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", a4, a5);
}

- (UIAction)sendingAction
{
  return self->_sendingAction;
}

- (void)setSendingAction:(id)a3
{
  objc_storeStrong((id *)&self->_sendingAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingAction, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_exportCopyDirectoryParent, 0);
  objc_storeStrong((id *)&self->_composeServiceController, 0);
  objc_storeStrong((id *)&self->_trimController, 0);
}

uint64_t __79__PXPhotoKitAssetCollectionActionPerformer_photoStreamComposeServiceDidCancel___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t v8[16];

  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Adding to Shared Albums cancelled. Cleaning up temporarily exported files", v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_cleanupTemporaryFiles");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "cleanupResources");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 160);
  *(_QWORD *)(v3 + 160) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

uint64_t __85__PXPhotoKitAssetCollectionActionPerformer_photoStreamComposeService_didPostComment___block_invoke(uint64_t a1)
{
  id *v2;

  v2 = *(id **)(a1 + 32);
  if (!v2[19])
    return objc_msgSend(v2, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  objc_msgSend(v2[19], "setCommentText:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "start");
}

void __68__PXPhotoKitAssetCollectionActionPerformer_addAssets_toSharedAlbum___block_invoke(uint64_t *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  v14 = v3;
  if (v3)
  {
    v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a1[6];
      v10 = a1[4];
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 823, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("validatedAssets"), v12, v13, v14);

    }
    v5 = +[PXVideoTrimQueueController areVideoSourcesStreamShareSources:](PXVideoTrimQueueController, "areVideoSourcesStreamShareSources:", v4);
    v6 = (void *)a1[4];
    v7 = a1[5];
    if (v5)
      objc_msgSend(v6, "_addStreamShareSources:toSharedAlbum:", v4, v7);
    else
      objc_msgSend(v6, "_addAssets:toSharedAlbum:", v4, v7);

  }
  else
  {
    objc_msgSend((id)a1[4], "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  }

}

uint64_t __69__PXPhotoKitAssetCollectionActionPerformer__addAssets_toSharedAlbum___block_invoke(uint64_t result, int a2)
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[5];
  char v9;
  uint8_t buf[16];

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 176))
  {
    v3 = result;
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Adding assets to Shared Albums succeeded.", buf, 2u);
      }

      PXIncrementShareCountForAssets(*(void **)(v3 + 40));
    }
    else
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Adding assets to Shared Albums cancelled.", buf, 2u);
      }

    }
    v6 = *(_QWORD **)(v3 + 32);
    v7 = v6[22];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__PXPhotoKitAssetCollectionActionPerformer__addAssets_toSharedAlbum___block_invoke_406;
    v8[3] = &unk_1E5144398;
    v8[4] = v6;
    v9 = a2;
    return objc_msgSend(v6, "dismissViewController:completionHandler:", v7, v8);
  }
  return result;
}

uint64_t __69__PXPhotoKitAssetCollectionActionPerformer__addAssets_toSharedAlbum___block_invoke_406(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 40), 0);
}

uint64_t __81__PXPhotoKitAssetCollectionActionPerformer__addStreamShareSources_toSharedAlbum___block_invoke(uint64_t result, int a2)
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v9[5];
  char v10;
  uint8_t buf[16];

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 176))
  {
    v3 = result;
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        v6 = "Adding media sources to Shared Albums succeeded.";
LABEL_7:
        _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      }
    }
    else if (v5)
    {
      *(_WORD *)buf = 0;
      v6 = "Adding media sources to Shared Albums cancelled.";
      goto LABEL_7;
    }

    v7 = *(_QWORD **)(v3 + 32);
    v8 = v7[22];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__PXPhotoKitAssetCollectionActionPerformer__addStreamShareSources_toSharedAlbum___block_invoke_402;
    v9[3] = &unk_1E5144398;
    v9[4] = v7;
    v10 = a2;
    return objc_msgSend(v7, "dismissViewController:completionHandler:", v8, v9);
  }
  return result;
}

uint64_t __81__PXPhotoKitAssetCollectionActionPerformer__addStreamShareSources_toSharedAlbum___block_invoke_402(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 40), 0);
}

uint64_t __115__PXPhotoKitAssetCollectionActionPerformer__promptBlacklistingConfirmatonForUserAction_viewSpec_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __115__PXPhotoKitAssetCollectionActionPerformer__promptBlacklistingConfirmatonForUserAction_viewSpec_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)canPerformActionType:(id)a3 onAssetCollectionReference:(id)a4 withInputs:(id)a5
{
  return objc_msgSend(a1, "canPerformOnAssetCollectionReference:withInputs:", a4, a5);
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return 0;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return 0;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return 0;
}

+ (id)createBarButtonItemForAssetCollectionReference:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  return 0;
}

+ (id)createStandardActionForAssetCollectionReference:(id)a3 withInput:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "localizedTitleForUseCase:assetCollectionReference:withInputs:", 1, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(a1, "systemImageNameForAssetCollectionReference:withInputs:", v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "systemImageNamed:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", v11, v14, 0, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "isActionDestructive"))
      objc_msgSend(v15, "setAttributes:", objc_msgSend(v15, "attributes") | 2);
  }
  else
  {
    PXAssertGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = a1;
      _os_log_error_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "Action performer class %@ cannot provide standard actions", (uint8_t *)&v18, 0xCu);
    }

    v15 = 0;
  }

  return v15;
}

+ (id)menuElementsForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return 0;
}

@end
