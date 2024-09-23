@implementation PUPhotoKitRemoveSharingSuggestionAssetActionPerformer

- (id)pxActionType
{
  return (id)*MEMORY[0x1E0D7C0B8];
}

- (void)performUserInteractionTask
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint8_t buf[16];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD aBlock[6];

  -[PUAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer_performUserInteractionTask__block_invoke;
  aBlock[3] = &unk_1E58A8DE8;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __83__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer_performUserInteractionTask__block_invoke_2;
  v21[3] = &unk_1E58A8DE8;
  v21[4] = self;
  v6 = _Block_copy(v21);
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __83__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer_performUserInteractionTask__block_invoke_3;
  v20[3] = &unk_1E58A8DE8;
  v20[4] = self;
  v7 = _Block_copy(v20);
  objc_msgSend(MEMORY[0x1E0D7B718], "warningStringForAssets:isDeleting:", v3, 1);
  v8 = objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("CANCEL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("REMOVE_FROM_ALBUM_BUTTON"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("DELETE_FROM_LIBRARY_BUTTON_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v9, 1, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v13);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v10, 0, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v14);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v11, 2, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v15);

  if (!-[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v12))
  {
    PLUIGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, "Failed to present remove confirmation. User must confirm to perform removal.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present confirmation dialog."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v17);

  }
}

- (void)_performTrashTask
{
  PUPhotoKitTrashActionPerformer *v3;
  void *v4;
  void *v5;
  PUPhotoKitTrashActionPerformer *v6;
  _QWORD v7[5];

  v3 = [PUPhotoKitTrashActionPerformer alloc];
  -[PUAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUAssetActionPerformer initWithActionType:assets:orAssetsByAssetCollection:](v3, "initWithActionType:assets:orAssetsByAssetCollection:", 8, v4, v5);

  -[PUAssetActionPerformer setDelegate:](v6, "setDelegate:", self);
  -[PUPhotoKitRemoveSharingSuggestionAssetActionPerformer setTrashActionPerformer:](self, "setTrashActionPerformer:", v6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer__performTrashTask__block_invoke;
  v7[3] = &unk_1E58AB060;
  v7[4] = self;
  -[PUAssetActionPerformer performWithCompletionHandler:](v6, "performWithCompletionHandler:", v7);

}

- (id)undoManagerForAssetActionPerformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUAssetActionPerformer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "undoManagerForAssetActionPerformer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)assetActionPerformer:(id)a3 presentViewController:(id)a4
{
  return -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", a4);
}

- (BOOL)assetActionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  -[PUAssetActionPerformer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "assetActionPerformer:dismissViewController:completionHandler:", self, v8, v7);

  return (char)self;
}

- (PUPhotoKitTrashActionPerformer)trashActionPerformer
{
  return self->_trashActionPerformer;
}

- (void)setTrashActionPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_trashActionPerformer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trashActionPerformer, 0);
}

uint64_t __74__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer__performTrashTask__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, 0);
}

void __83__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Remove shared library suggestion canceled."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "completeUserInteractionTaskWithSuccess:error:", 0, v2);

}

id __83__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PUPhotoKitRemoveSharingSuggestionAssetActionPerformer;
  return objc_msgSendSuper2(&v2, sel_performUserInteractionTask);
}

uint64_t __83__PUPhotoKitRemoveSharingSuggestionAssetActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performTrashTask");
}

+ (Class)pxActionPerformerClass
{
  return (Class)objc_opt_class();
}

@end
