@implementation PXPhotoKitCollectionListCreateCollectionActionPerformer

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  return objc_msgSend(a3, "canPerformEditOperation:", 4);
}

+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = localizedTitleForActionType_collectionList__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&localizedTitleForActionType_collectionList__onceToken, &__block_literal_global_70550);
  objc_msgSend((id)localizedTitleForActionType_collectionList__titles, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4
{
  id v4;
  const __CFString *v5;

  v4 = a4;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXCollectionListActionTypeCreateAlbum")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("PXCollectionListActionTypeCreateAlbumWithPhotosPicker_Old")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("PXCollectionListActionTypeCreateAlbumWithPhotosPicker")) & 1) != 0)
  {
    v5 = CFSTR("rectangle.stack.badge.plus");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("PXCollectionListActionTypeCreateFolder")))
  {
    v5 = CFSTR("folder.badge.plus");
  }
  else
  {
    v5 = 0;
  }

  return (id)v5;
}

void __102__PXPhotoKitCollectionListCreateCollectionActionPerformer_localizedTitleForActionType_collectionList___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("PXCollectionListActionTypeCreateAlbum");
  PXLocalizedStringFromTable(CFSTR("CREATE_NEW_ALBUM"), CFSTR("PhotosUICore"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v0;
  v8[1] = CFSTR("PXCollectionListActionTypeCreateAlbumWithPhotosPicker_Old");
  PXLocalizedStringFromTable(CFSTR("CREATE_NEW_ALBUM"), CFSTR("PhotosUICore"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v1;
  v8[2] = CFSTR("PXCollectionListActionTypeCreateAlbumWithPhotosPicker");
  PXLocalizedStringFromTable(CFSTR("CREATE_NEW_ALBUM"), CFSTR("PhotosUICore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v2;
  v8[3] = CFSTR("PXCollectionListActionTypeCreateSharedAlbum");
  PXLocalizedStringFromTable(CFSTR("CREATE_NEW_SHARED_ALBUM"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v3;
  v8[4] = CFSTR("PXCollectionListActionTypeCreateSmartAlbum");
  PXLocalizedStringFromTable(CFSTR("CREATE_NEW_SMART_ALBUM"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v4;
  v8[5] = CFSTR("PXCollectionListActionTypeCreateFolder");
  PXLocalizedStringFromTable(CFSTR("CREATE_NEW_FOLDER"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)localizedTitleForActionType_collectionList__titles;
  localizedTitleForActionType_collectionList__titles = v6;

}

- (void)performUserInteractionTask
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  _QWORD v10[5];

  -[PXActionPerformer actionType](self, "actionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXCollectionListActionTypeCreateAlbumWithPhotosPicker"));

  if (v4)
  {
    -[PXPhotoKitCollectionListActionPerformer collectionList](self, "collectionList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXLemonadeCollectionCustomizationAlbumsFactory albumsCustomizationViewControllerWithRootCollectionList:](PXLemonadeCollectionCustomizationAlbumsFactory, "albumsCustomizationViewControllerWithRootCollectionList:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (id)v6;

    objc_msgSend(v9, "setModalPresentationStyle:", 2);
    -[PXActionPerformer presentViewController:](self, "presentViewController:", v9);

    return;
  }
  -[PXActionPerformer actionType](self, "actionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("PXCollectionListActionTypeCreateFolder"));

  if (v8)
  {
    -[PXPhotoKitCollectionListActionPerformer collectionList](self, "collectionList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXLemonadeCollectionCustomizationFoldersFactory foldersCustomizationViewControllerWithRootCollectionList:](PXLemonadeCollectionCustomizationFoldersFactory, "foldersCustomizationViewControllerWithRootCollectionList:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__PXPhotoKitCollectionListCreateCollectionActionPerformer_performUserInteractionTask__block_invoke;
  v10[3] = &unk_1E5120D78;
  v10[4] = self;
  -[PXPhotoKitCollectionListCreateCollectionActionPerformer presentSetupUIForAlbumCreationWithCompletionHandler:](self, "presentSetupUIForAlbumCreationWithCompletionHandler:", v10);
}

- (void)presentSetupUIForAlbumCreationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  char v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  PXPhotoKitCollectionListCreateCollectionActionPerformer *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;
  id v30;
  id location[2];

  v4 = a3;
  -[PXActionPerformer actionType](self, "actionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PXCollectionListActionTypeCreateFolder"));

  if ((v6 & 1) != 0)
  {
    v7 = CFSTR("CREATE_FOLDER_ALERT_MESSAGE");
    v8 = CFSTR("CREATE_FOLDER_ALERT_TITLE");
  }
  else
  {
    -[PXActionPerformer actionType](self, "actionType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("PXCollectionListActionTypeCreateSmartAlbum"));

    if (v10)
      v8 = CFSTR("CREATE_SMART_ALBUM_ALERT_TITLE");
    else
      v8 = CFSTR("CREATE_ALBUM_ALERT_TITLE");
    if (v10)
      v7 = CFSTR("CREATE_SMART_ALBUM_ALERT_MESSAGE");
    else
      v7 = CFSTR("CREATE_ALBUM_ALERT_MESSAGE");
  }
  PXLocalizedStringFromTable(v8, CFSTR("PhotosUICore"));
  v11 = objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("CREATE_ALBUM_TITLE_PLACEHOLDER"), CFSTR("PhotosUICore"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("CREATE_ALBUM_SAVE_BUTTON_TITLE"), CFSTR("PhotosUICore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v11;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, v15);
  v16 = (void *)MEMORY[0x1E0DC3448];
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __111__PXPhotoKitCollectionListCreateCollectionActionPerformer_presentSetupUIForAlbumCreationWithCompletionHandler___block_invoke;
  v28[3] = &unk_1E512EBC0;
  objc_copyWeak(&v30, location);
  v28[4] = self;
  v18 = v4;
  v29 = v18;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v14, 0, v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitCollectionListCreateCollectionActionPerformer _setCreateAlbumAlertAction:](self, "_setCreateAlbumAlertAction:", v19);
  objc_msgSend(v15, "addAction:", v19);
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __111__PXPhotoKitCollectionListCreateCollectionActionPerformer_presentSetupUIForAlbumCreationWithCompletionHandler___block_invoke_2;
  v27[3] = &unk_1E5144530;
  v27[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v13, 1, v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v20);

  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __111__PXPhotoKitCollectionListCreateCollectionActionPerformer_presentSetupUIForAlbumCreationWithCompletionHandler___block_invoke_3;
  v24[3] = &unk_1E51322C0;
  v21 = v23;
  v25 = v21;
  v26 = self;
  objc_msgSend(v15, "addTextFieldWithConfigurationHandler:", v24);
  -[PXActionPerformer presentViewController:](self, "presentViewController:", v15);

  objc_destroyWeak(&v30);
  objc_destroyWeak(location);

}

- (void)_didChooseAlbumTitle:(id)a3 completionHandler:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void (**v12)(id, _QWORD, void *);

  v12 = (void (**)(id, _QWORD, void *))a4;
  -[PXPhotoKitCollectionListCreateCollectionActionPerformer _validateNewCollectionTitle:](self, "_validateNewCollectionTitle:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCollectionListCreateCollectionActionPerformer.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("validAlbumTitle"));

  }
  -[PXActionPerformer actionType](self, "actionType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("PXCollectionListActionTypeCreateAlbumWithPhotosPicker_Old")))
  {

  }
  else
  {
    -[PXActionPerformer actionType](self, "actionType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("PXCollectionListActionTypeCreateAlbumWithPhotosPicker"));

    if (!v10)
    {
      v12[2](v12, 0, v7);
      goto LABEL_8;
    }
  }
  -[PXPhotoKitCollectionListCreateCollectionActionPerformer _presentPickerWithValidAlbumTitle:completionHandler:](self, "_presentPickerWithValidAlbumTitle:completionHandler:", v7, v12);
LABEL_8:

}

- (void)_presentPickerWithValidAlbumTitle:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0CD2168]);
  -[PXPhotoKitCollectionListActionPerformer collectionList](self, "collectionList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithPhotoLibraryAndOnlyReturnsIdentifiers:", v10);

  objc_msgSend(v11, "setSelectionLimit:", 0);
  objc_msgSend(v11, "setDisabledCapabilities:", 16);
  objc_msgSend(v11, "_setDisabledPrivateCapabilities:", 7);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v11);
  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v12, "presentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __111__PXPhotoKitCollectionListCreateCollectionActionPerformer__presentPickerWithValidAlbumTitle_completionHandler___block_invoke;
  v17[3] = &unk_1E5120DA0;
  v19 = v6;
  v20 = v7;
  v18 = v11;
  v14 = v6;
  v15 = v7;
  v16 = v11;
  -[PXPhotoKitCollectionListCreateCollectionActionPerformer setFinishedPickingBlock:](self, "setFinishedPickingBlock:", v17);
  -[PXActionPerformer presentViewController:](self, "presentViewController:", v12);

}

- (id)_validateNewCollectionTitle:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CD13C8], "validateAssetCollectionTitle:error:", a3, 0);
}

- (void)_updateCreateAlbumTextField:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitCollectionListCreateCollectionActionPerformer _validateNewCollectionTitle:](self, "_validateNewCollectionTitle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  -[PXPhotoKitCollectionListCreateCollectionActionPerformer createAlbumAlertAction](self, "createAlbumAlertAction");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v6);

}

- (void)createAlbumWithAssets:(id)a3 albumTitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PXCreateCollectionListAction *v10;
  void *v11;
  id *v12;
  PXCreateCollectionListAction *v13;
  PXCreateCollectionListAction *v14;
  uint64_t *v15;
  PXCreateAssetCollectionAction *v16;
  PXCreateSmartAlbumAction *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *);
  void *v21;
  PXPhotoKitCollectionListCreateCollectionActionPerformer *v22;
  PXCreateSmartAlbumAction *v23;
  _QWORD v24[5];
  PXCreateAssetCollectionAction *v25;
  _QWORD v26[5];
  PXCreateCollectionListAction *v27;

  v6 = a3;
  v7 = a4;
  -[PXPhotoKitCollectionListActionPerformer collectionList](self, "collectionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer actionType](self, "actionType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("PXCollectionListActionTypeCreateFolder")))
  {
    v10 = -[PXCreateCollectionListAction initWithTitle:parentCollectionList:childCollections:]([PXCreateCollectionListAction alloc], "initWithTitle:parentCollectionList:childCollections:", v7, v8, 0);
    -[PXActionPerformer undoManager](self, "undoManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __92__PXPhotoKitCollectionListCreateCollectionActionPerformer_createAlbumWithAssets_albumTitle___block_invoke;
    v26[3] = &unk_1E5147B40;
    v12 = (id *)&v27;
    v26[4] = self;
    v27 = v10;
    v13 = v10;
    v14 = v13;
    v15 = v26;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PXCollectionListActionTypeCreateAlbum")) & 1) != 0
         || objc_msgSend(v9, "isEqualToString:", CFSTR("PXCollectionListActionTypeCreateAlbumWithPhotosPicker_Old")))
  {
    v16 = -[PXCreateAssetCollectionAction initWithTitle:parentCollectionList:selectedAssets:]([PXCreateAssetCollectionAction alloc], "initWithTitle:parentCollectionList:selectedAssets:", v7, v8, v6);
    -[PXActionPerformer undoManager](self, "undoManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __92__PXPhotoKitCollectionListCreateCollectionActionPerformer_createAlbumWithAssets_albumTitle___block_invoke_2;
    v24[3] = &unk_1E5147B40;
    v12 = (id *)&v25;
    v24[4] = self;
    v25 = v16;
    v13 = v16;
    v14 = v13;
    v15 = v24;
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("PXCollectionListActionTypeCreateSmartAlbum")))
      goto LABEL_7;
    v17 = -[PXCreateSmartAlbumAction initWithTitle:parentCollectionList:]([PXCreateSmartAlbumAction alloc], "initWithTitle:parentCollectionList:", v7, v8);
    -[PXActionPerformer undoManager](self, "undoManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __92__PXPhotoKitCollectionListCreateCollectionActionPerformer_createAlbumWithAssets_albumTitle___block_invoke_3;
    v21 = &unk_1E5147B40;
    v12 = (id *)&v23;
    v22 = self;
    v23 = v17;
    v13 = v17;
    v14 = v13;
    v15 = &v18;
  }
  -[PXAction executeWithUndoManager:completionHandler:](v13, "executeWithUndoManager:completionHandler:", v11, v15, v18, v19, v20, v21, v22);

LABEL_7:
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD);
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
  PXMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PLUIGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_INFO, "Picker in collection list action finished with selected identifiers: %@", (uint8_t *)&v10, 0xCu);
  }

  -[PXPhotoKitCollectionListCreateCollectionActionPerformer finishedPickingBlock](self, "finishedPickingBlock");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v9)[2](v9, v7);

  -[PXPhotoKitCollectionListCreateCollectionActionPerformer setFinishedPickingBlock:](self, "setFinishedPickingBlock:", 0);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  NSObject *v5;
  void (**v6)(_QWORD, _QWORD);
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PXPhotoKitCollectionListActionPerformer collectionList](self, "collectionList", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "Picker in collection list action manually dismissed with no picked assets for collection list: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PXPhotoKitCollectionListCreateCollectionActionPerformer finishedPickingBlock](self, "finishedPickingBlock");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6[2](v6, MEMORY[0x1E0C9AA60]);

  -[PXPhotoKitCollectionListCreateCollectionActionPerformer setFinishedPickingBlock:](self, "setFinishedPickingBlock:", 0);
}

- (PHCollection)createdCollection
{
  return self->_createdCollection;
}

- (void)setCreatedCollection:(id)a3
{
  objc_storeStrong((id *)&self->_createdCollection, a3);
}

- (UIAlertAction)createAlbumAlertAction
{
  return (UIAlertAction *)objc_loadWeakRetained((id *)&self->_createAlbumAlertAction);
}

- (void)_setCreateAlbumAlertAction:(id)a3
{
  objc_storeWeak((id *)&self->_createAlbumAlertAction, a3);
}

- (id)finishedPickingBlock
{
  return self->_finishedPickingBlock;
}

- (void)setFinishedPickingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishedPickingBlock, 0);
  objc_destroyWeak((id *)&self->_createAlbumAlertAction);
  objc_storeStrong((id *)&self->_createdCollection, 0);
}

uint64_t __83__PXPhotoKitCollectionListCreateCollectionActionPerformer_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetIdentifier");
}

void __92__PXPhotoKitCollectionListCreateCollectionActionPerformer_createAlbumWithAssets_albumTitle___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v7 = a3;
  objc_msgSend(v5, "createdCollectionList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCreatedCollection:", v6);

  objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, v7);
}

void __92__PXPhotoKitCollectionListCreateCollectionActionPerformer_createAlbumWithAssets_albumTitle___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  objc_msgSend(v5, "createdAssetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCreatedCollection:", v7);

  objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, v6);
  PLSAggregateDictionaryAddValueForScalarKey();
  v8 = (void *)MEMORY[0x1E0D09910];
  v12 = *MEMORY[0x1E0D09820];
  objc_msgSend(*(id *)(a1 + 32), "createdCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.albumCreated"), v11);

}

void __92__PXPhotoKitCollectionListCreateCollectionActionPerformer_createAlbumWithAssets_albumTitle___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v7 = a3;
  objc_msgSend(v5, "createdAssetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCreatedCollection:", v6);

  objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, v7);
}

void __111__PXPhotoKitCollectionListCreateCollectionActionPerformer__presentPickerWithValidAlbumTitle_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  if (objc_msgSend(v14, "count"))
  {
    v3 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchAssetsWithLocalIdentifiers:options:", v14, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD *)(a1 + 48);
    v8 = (void *)MEMORY[0x1E0C99E40];
    objc_msgSend(v6, "fetchedObjects");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = v9;
    else
      v11 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v8, "orderedSetWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v12, *(_QWORD *)(a1 + 40));

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v6, *(_QWORD *)(a1 + 40));
  }

}

void __111__PXPhotoKitCollectionListCreateCollectionActionPerformer_presentSetupUIForAlbumCreationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_didChooseAlbumTitle:completionHandler:", v5, *(_QWORD *)(a1 + 40));
}

void __111__PXPhotoKitCollectionListCreateCollectionActionPerformer_presentSetupUIForAlbumCreationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "completeUserInteractionTaskWithSuccess:error:", 0, v2);

}

void __111__PXPhotoKitCollectionListCreateCollectionActionPerformer_presentSetupUIForAlbumCreationWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setPlaceholder:", v3);
  objc_msgSend(v4, "setAutocapitalizationType:", 2);
  objc_msgSend(v4, "setAutocorrectionType:", 0);
  objc_msgSend(v4, "setEnablesReturnKeyAutomatically:", 1);
  objc_msgSend(*(id *)(a1 + 40), "_updateCreateAlbumTextField:", v4);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel__updateCreateAlbumTextField_, 0x20000);

}

uint64_t __85__PXPhotoKitCollectionListCreateCollectionActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "createAlbumWithAssets:albumTitle:", a2, a3);
}

@end
