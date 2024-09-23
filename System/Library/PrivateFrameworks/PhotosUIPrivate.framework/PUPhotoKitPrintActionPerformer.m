@implementation PUPhotoKitPrintActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  v3 = (void *)PXDefaultAssetSharingHelperClass();
  -[PUAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D96E00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PUPhotoKitPrintActionPerformer_performUserInteractionTask__block_invoke;
  v6[3] = &unk_1E58A5310;
  v6[4] = self;
  objc_msgSend(v3, "prepareAssets:forActivityType:completion:", v4, v5, v6);

}

void __60__PUPhotoKitPrintActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA8D0], "sharedPrintController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXDefaultPrintInfo();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrintInfo:", v7);

    objc_msgSend(v6, "setPrintingItems:", v5);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__PUPhotoKitPrintActionPerformer_performUserInteractionTask__block_invoke_2;
    v8[3] = &unk_1E58A52E8;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "presentAnimated:completionHandler:", 1, v8);

  }
}

uint64_t __60__PUPhotoKitPrintActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:");
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4;
  int v5;

  v4 = a4;
  if (objc_msgSend(MEMORY[0x1E0CEA8D0], "isPrintingAvailable"))
    v5 = objc_msgSend(v4, "isTrashBin") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

@end
