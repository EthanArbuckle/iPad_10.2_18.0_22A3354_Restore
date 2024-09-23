@implementation PUWallpaperSmartAlbumPreviewReloadRequest

void __93___PUWallpaperSmartAlbumPreviewReloadRequest_passiveContentDataSourcePreviewAssetsDidChange___block_invoke(uint64_t a1)
{
  void (**v1)(_QWORD, _QWORD);
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completion");
  v1 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "smartAlbumDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setCompletion:", 0);
  objc_msgSend(WeakRetained, "setSmartAlbumDataSource:", 0);
  if (v1)
    ((void (**)(_QWORD, void *))v1)[2](v1, v3);

}

@end
