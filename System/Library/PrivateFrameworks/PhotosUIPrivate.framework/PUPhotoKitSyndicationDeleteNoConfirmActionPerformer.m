@implementation PUPhotoKitSyndicationDeleteNoConfirmActionPerformer

- (void)performUserInteractionTask
{
  -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

- (void)performBackgroundTask
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;

  -[PUAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__PUPhotoKitSyndicationDeleteNoConfirmActionPerformer_performBackgroundTask__block_invoke;
  v8[3] = &unk_1E58ABD10;
  v9 = v3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__PUPhotoKitSyndicationDeleteNoConfirmActionPerformer_performBackgroundTask__block_invoke_2;
  v7[3] = &unk_1E58AB060;
  v6 = v3;
  objc_msgSend(v5, "performChanges:completionHandler:", v8, v7);

}

- (BOOL)shouldConfirmDestructiveAction
{
  return 0;
}

- (int64_t)destructivePhotosAction
{
  return 1;
}

uint64_t __76__PUPhotoKitSyndicationDeleteNoConfirmActionPerformer_performBackgroundTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD13B0], "deleteAssets:", *(_QWORD *)(a1 + 32));
}

void __76__PUPhotoKitSyndicationDeleteNoConfirmActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PUPhotoKitSyndicationDeleteNoConfirmActionPerformer_performBackgroundTask__block_invoke_3;
  block[3] = &unk_1E58AA878;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = v6;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __76__PUPhotoKitSyndicationDeleteNoConfirmActionPerformer_performBackgroundTask__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a3, "px_isSyndicatedAsset");
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a3, "px_isSyndicatedAsset");
}

@end
