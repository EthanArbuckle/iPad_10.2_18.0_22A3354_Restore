@implementation PXPhotoKitPrintAssetActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v6;
  int v7;

  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0CEA8D0], "isPrintingAvailable"))
    v7 = objc_msgSend(v6, "isTrashBin") ^ 1;
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (void)performUserInteractionTask
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  v3 = PXDefaultAssetSharingHelperClass();
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D96E00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PXPhotoKitPrintAssetActionPerformer_performUserInteractionTask__block_invoke;
  v6[3] = &unk_1E51158F8;
  v6[4] = self;
  objc_msgSend(v3, "prepareAssets:forActivityType:completion:", v4, v5, v6);

}

void __65__PXPhotoKitPrintAssetActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
    v8[2] = __65__PXPhotoKitPrintAssetActionPerformer_performUserInteractionTask__block_invoke_2;
    v8[3] = &unk_1E51158D0;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "presentAnimated:completionHandler:", 1, v8);

  }
}

uint64_t __65__PXPhotoKitPrintAssetActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:");
}

@end
