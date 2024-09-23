@implementation PUPhotoKitAirPlayActionPerformer

- (void)performUserInteractionTask
{
  void *v4;
  uint64_t v5;
  void *v6;

  -[PUAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetActionManager.m"), 1925, CFSTR("There can be only one asset when starting an AirPlay action"));

  }
  -[PUPhotoKitAirPlayActionPerformer _showAirPlayPicker](self, "_showAirPlayPicker");
}

- (void)_showAirPlayPicker
{
  PUScreenRoutePickerViewController *v3;
  PUScreenRoutePickerViewController *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = [PUScreenRoutePickerViewController alloc];
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __54__PUPhotoKitAirPlayActionPerformer__showAirPlayPicker__block_invoke;
  v8 = &unk_1E58AB2F8;
  objc_copyWeak(&v9, &location);
  v4 = -[PUScreenRoutePickerViewController initWithCompletionBlock:](v3, "initWithCompletionBlock:", &v5);
  -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_handleDismissedAirPlayPicker
{
  -[PUAssetActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", 0, 0);
  -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

void __54__PUPhotoKitAirPlayActionPerformer__showAirPlayPicker__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDismissedAirPlayPicker");

}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 1;
}

@end
