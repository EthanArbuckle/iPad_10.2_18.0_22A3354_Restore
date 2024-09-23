@implementation PUPhotoKitNavigateToPhotosActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[PUAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PUPhotoKitNavigateToPhotosActionPerformer_performUserInteractionTask__block_invoke;
  v6[3] = &unk_1E58AA4C8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "px_navigateToMomentsViewRevealingAsset:completionHandler:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __71__PUPhotoKitNavigateToPhotosActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", a2, v5);

}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 1;
}

@end
