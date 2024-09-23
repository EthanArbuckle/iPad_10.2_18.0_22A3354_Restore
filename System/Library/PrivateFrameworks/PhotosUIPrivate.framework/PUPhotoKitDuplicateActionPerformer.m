@implementation PUPhotoKitDuplicateActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v15[5];

  -[PUAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7B6F0];
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceWithAssetCollections:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "selectionSnapshotForAssetsByAssetCollection:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D7B720]);
  -[PUAssetActionPerformer undoManager](self, "undoManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithSelectionSnapshot:undoManager:", v7, v9);

  -[PUPhotoKitDuplicateActionPerformer setDuplicateActionController:](self, "setDuplicateActionController:", v10);
  if ((objc_msgSend(v10, "shouldUseAlertController") & 1) != 0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__PUPhotoKitDuplicateActionPerformer_performUserInteractionTask__block_invoke;
    v15[3] = &unk_1E58A5338;
    v15[4] = self;
    objc_msgSend(v10, "alertConfigurationForDuplicateActionWithUserConfirmationHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B190]), "initWithConfiguration:", v11);
    objc_msgSend(v12, "alertController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v13);

    if (!v14)
      -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);

  }
  else
  {
    -[PUPhotoKitDuplicateActionPerformer setAction:](self, "setAction:", 1);
    -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }

}

- (void)performBackgroundTask
{
  void *v3;
  int64_t v4;
  _QWORD v5[4];
  id v6;
  _BYTE v7[24];
  id location;

  objc_initWeak(&location, self);
  -[PUPhotoKitDuplicateActionPerformer duplicateActionController](self, "duplicateActionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUPhotoKitDuplicateActionPerformer action](self, "action");
  -[PUPhotoKitDuplicateActionPerformer newStillImageTime](self, "newStillImageTime");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PUPhotoKitDuplicateActionPerformer_performBackgroundTask__block_invoke;
  v5[3] = &unk_1E58AA420;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "performDuplicateAction:newStillImageTime:completionHandler:", v4, v7, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (PXPhotoKitDuplicateActionController)duplicateActionController
{
  return self->_duplicateActionController;
}

- (void)setDuplicateActionController:(id)a3
{
  objc_storeStrong((id *)&self->_duplicateActionController, a3);
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)newStillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (void)setNewStillImageTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_newStillImageTime.value = *(_OWORD *)&a3->var0;
  self->_newStillImageTime.epoch = var3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateActionController, 0);
}

void __59__PUPhotoKitDuplicateActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completeBackgroundTaskWithSuccess:error:", a2, 0);

}

uint64_t __64__PUPhotoKitDuplicateActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setAction:");
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, 0);
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(MEMORY[0x1E0D7B340], "canPerformOnAsset:inAssetCollection:", a3, a4);
}

@end
