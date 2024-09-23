@implementation PUPXPhotoKitAlbumStreamActionPerformer

- (void)performUserInteractionTask
{
  PUAlbumStreamActivity *v3;
  PUAlbumStreamActivity *albumStreamActivity;
  PUAlbumStreamActivity *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = objc_alloc_init(PUAlbumStreamActivity);
  albumStreamActivity = self->_albumStreamActivity;
  self->_albumStreamActivity = v3;

  -[PUAlbumStreamActivity setPresentedFromActivityViewController:](self->_albumStreamActivity, "setPresentedFromActivityViewController:", 0);
  -[PXActivity setActionDelegate:](self->_albumStreamActivity, "setActionDelegate:", self);
  v5 = self->_albumStreamActivity;
  v6 = (void *)MEMORY[0x1E0C99E40];
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedSetWithArray:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  -[PUAlbumStreamActivity prepareWithAssets:](v5, "prepareWithAssets:", v8);

  -[PUAlbumStreamActivity activityViewController](self->_albumStreamActivity, "activityViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = -[PXActionPerformer presentViewController:](self, "presentViewController:", v9);

  if ((v8 & 1) == 0)
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

- (void)activity:(id)a3 didFinishWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;

  v5 = a4;
  v10 = a5;
  -[PUAlbumStreamActivity activityViewController](self->_albumStreamActivity, "activityViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v7, 0);

  objc_msgSend(v10, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    v9 = objc_msgSend(v10, "code") == 3072;
  else
    v9 = 0;

  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", v5 | v9, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumStreamActivity, 0);
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v7;
  BOOL v8;
  void *v9;

  v7 = a3;
  if ((objc_msgSend(a4, "px_isRecentlyDeletedSmartAlbum") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObjects:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[PUAlbumStreamActivity canPerformWithAssets:](PUAlbumStreamActivity, "canPerformWithAssets:", v9);

  }
  return v8;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PULocalizedString(CFSTR("PUBLISH_ALBUM_STREAMING_SERVICE"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("rectangle.stack.badge.person.crop");
}

@end
