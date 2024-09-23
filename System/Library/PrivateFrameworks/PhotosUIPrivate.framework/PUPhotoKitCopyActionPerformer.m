@implementation PUPhotoKitCopyActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x1E0D7B978];
  -[PUAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "confidentialWarningRequiredForAssets:", v4);

  if ((_DWORD)v3)
  {
    v7[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__PUPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke;
    v8[3] = &unk_1E58A8DE8;
    v8[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__PUPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke_2;
    v7[3] = &unk_1E58A8DE8;
    objc_msgSend(MEMORY[0x1E0D7B978], "confidentialityAlertWithConfirmAction:abortAction:", v8, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v5))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present confidentiality alert"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v6);

    }
  }
  else
  {
    -[PUPhotoKitCopyActionPerformer _performCopy](self, "_performCopy");
  }
}

- (void)_performCopy
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)PXDefaultAssetSharingHelperClass();
  -[PUAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PUPhotoKitCopyActionPerformer__performCopy__block_invoke;
  v5[3] = &unk_1E58AB060;
  v5[4] = self;
  objc_msgSend(v3, "copyAssets:completionHandler:", v4, v5);

}

uint64_t __45__PUPhotoKitCopyActionPerformer__performCopy__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, a3);
}

uint64_t __59__PUPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performCopy");
}

void __59__PUPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("User cancelled because of confidentiality alert"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "completeUserInteractionTaskWithSuccess:error:", 0, v2);

}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v5;
  int v6;

  v5 = a4;
  if (objc_msgSend(a3, "isPhoto"))
    v6 = objc_msgSend(v5, "isTrashBin") ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

@end
