@implementation PUPhotoKitSuggestLessPersonActionPerformer

- (void)performUserInteractionTask
{
  id v3;
  void *v4;
  PXSuggestLessPeopleHelper *v5;
  PXSuggestLessPeopleHelper *suggestLessPeopleHelper;
  PXSuggestLessPeopleHelper *v7;
  void *v8;
  _QWORD v9[5];

  v3 = objc_alloc(MEMORY[0x1E0D7BAA0]);
  -[PUAssetActionPerformer undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (PXSuggestLessPeopleHelper *)objc_msgSend(v3, "initWithUndoManager:", v4);
  suggestLessPeopleHelper = self->_suggestLessPeopleHelper;
  self->_suggestLessPeopleHelper = v5;

  -[PXSuggestLessPeopleHelper setDelegate:](self->_suggestLessPeopleHelper, "setDelegate:", self);
  v7 = self->_suggestLessPeopleHelper;
  -[PUAssetActionPerformer assets](self, "assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__PUPhotoKitSuggestLessPersonActionPerformer_performUserInteractionTask__block_invoke;
  v9[3] = &unk_1E58AB060;
  v9[4] = self;
  -[PXSuggestLessPeopleHelper suggestLessPeopleFromAssets:completionHandler:](v7, "suggestLessPeopleFromAssets:completionHandler:", v8, v9);

}

- (BOOL)suggestLessPeopleHelper:(id)a3 presentViewController:(id)a4
{
  return -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", a4);
}

- (BOOL)suggestLessPeopleHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return -[PUAssetActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestLessPeopleHelper, 0);
}

void __72__PUPhotoKitSuggestLessPersonActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, char a2, void *a3)
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
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Could not suggest this person less: %@", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PUPhotoKitSuggestLessPersonActionPerformer_performUserInteractionTask__block_invoke_467;
  block[3] = &unk_1E58AA878;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = a2;
  block[4] = v7;
  v10 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __72__PUPhotoKitSuggestLessPersonActionPerformer_performUserInteractionTask__block_invoke_467(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 1;
}

@end
