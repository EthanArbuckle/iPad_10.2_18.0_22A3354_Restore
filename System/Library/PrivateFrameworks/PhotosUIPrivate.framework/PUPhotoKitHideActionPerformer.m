@implementation PUPhotoKitHideActionPerformer

- (void)performUserInteractionTask
{
  PUHidePhotosActionController *v3;
  void *v4;
  void *v5;
  PUHidePhotosActionController *v6;
  void *v7;
  _QWORD v8[5];

  v3 = [PUHidePhotosActionController alloc];
  -[PUAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetActionPerformer undoManager](self, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUHidePhotosActionController initWithAssets:undoManager:](v3, "initWithAssets:undoManager:", v4, v5);

  -[PUPhotoKitHideActionPerformer setHideActionController:](self, "setHideActionController:", v6);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PUPhotoKitHideActionPerformer_performUserInteractionTask__block_invoke;
  v8[3] = &unk_1E58A9910;
  v8[4] = self;
  -[PUHidePhotosActionController alertControllerForTogglingAssetsVisibilityWithCompletionHandler:](v6, "alertControllerForTogglingAssetsVisibilityWithCompletionHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (-[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v7))
      goto LABEL_6;
  }
  else
  {
    -[PUPhotoKitHideActionPerformer setIsHiding:](self, "setIsHiding:", 0);
  }
  -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", v7 == 0, 0);
LABEL_6:

}

- (void)performBackgroundTask
{
  void *v3;
  _QWORD v4[5];

  -[PUPhotoKitActionPerformer instantlyExcludeAssetsFromDataSource](self, "instantlyExcludeAssetsFromDataSource");
  -[PUAssetActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 1, 0);
  -[PUPhotoKitHideActionPerformer hideActionController](self, "hideActionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__PUPhotoKitHideActionPerformer_performBackgroundTask__block_invoke;
  v4[3] = &unk_1E58AB060;
  v4[4] = self;
  objc_msgSend(v3, "performActionWithCompletionHandler:", v4);

}

- (PUHidePhotosActionController)hideActionController
{
  return self->_hideActionController;
}

- (void)setHideActionController:(id)a3
{
  objc_storeStrong((id *)&self->_hideActionController, a3);
}

- (BOOL)isHiding
{
  return self->_isHiding;
}

- (void)setIsHiding:(BOOL)a3
{
  self->_isHiding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideActionController, 0);
}

uint64_t __54__PUPhotoKitHideActionPerformer_performBackgroundTask__block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "stopExcludingAssetsFromDataSource");
  return result;
}

uint64_t __59__PUPhotoKitHideActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsHiding:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, 0);
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(MEMORY[0x1E0D7B4E8], "canPerformOnAsset:inAssetCollection:", a3, a4);
}

@end
