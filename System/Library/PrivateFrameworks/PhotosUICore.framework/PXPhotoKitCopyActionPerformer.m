@implementation PXPhotoKitCopyActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v6;
  int v7;

  v6 = a3;
  if (objc_msgSend(v6, "isPhoto") && (objc_msgSend(v6, "isTrashed") & 1) == 0)
    v7 = objc_msgSend(v6, "isRecoveredAsset") ^ 1;
  else
    LOBYTE(v7) = 0;

  return v7;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  if (a3 > 2)
    v5 = 0;
  else
    v5 = off_1E5124918[a3];
  v6 = v5;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PXPhotoKitAssetActionManager%@Title_Copy"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("doc.on.doc");
}

- (void)performUserInteractionTask
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PXSharingConfidentialityController confidentialWarningRequiredForAssets:](PXSharingConfidentialityController, "confidentialWarningRequiredForAssets:", v3);

  if (v4)
  {
    v7[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__PXPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke;
    v8[3] = &unk_1E5144530;
    v8[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__PXPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke_2;
    v7[3] = &unk_1E5144530;
    +[PXSharingConfidentialityController confidentialityAlertWithConfirmAction:abortAction:](PXSharingConfidentialityController, "confidentialityAlertWithConfirmAction:abortAction:", v8, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v5))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present confidentiality alert"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v6);

    }
  }
  else
  {
    -[PXPhotoKitCopyActionPerformer _performCopy](self, "_performCopy");
  }
}

- (void)_performCopy
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v3 = PXDefaultAssetSharingHelperClass();
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PXPhotoKitCopyActionPerformer__performCopy__block_invoke;
  v5[3] = &unk_1E5148B78;
  v5[4] = self;
  objc_msgSend(v3, "copyAssets:completionHandler:", v4, v5);

}

uint64_t __45__PXPhotoKitCopyActionPerformer__performCopy__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, a3);
}

uint64_t __59__PXPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performCopy");
}

void __59__PXPhotoKitCopyActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("User cancelled because of confidentiality alert"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "completeUserInteractionTaskWithSuccess:error:", 0, v2);

}

@end
