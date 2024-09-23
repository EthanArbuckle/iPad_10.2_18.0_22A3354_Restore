@implementation PUPXPhotoKitCompositeVideoActionPerformer

- (void)performUserInteractionTask
{
  PUCompositeVideoActivity *v3;
  PUCompositeVideoActivity *compositeVideoActivity;
  PUCompositeVideoActivity *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(PUCompositeVideoActivity);
  compositeVideoActivity = self->_compositeVideoActivity;
  self->_compositeVideoActivity = v3;

  -[PXActivity setActionDelegate:](self->_compositeVideoActivity, "setActionDelegate:", self);
  v5 = self->_compositeVideoActivity;
  -[PXActionPerformer hostViewController](self, "hostViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCompositeVideoActivity prepareWithViewController:assets:](v5, "prepareWithViewController:assets:", v6, v7);

  -[PUCompositeVideoActivity activityViewController](self->_compositeVideoActivity, "activityViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = -[PXActionPerformer presentViewController:](self, "presentViewController:", v8);

  if ((v6 & 1) == 0)
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
  -[PUCompositeVideoActivity activityViewController](self->_compositeVideoActivity, "activityViewController");
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
  objc_storeStrong((id *)&self->_compositeVideoActivity, 0);
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v7;
  void *v8;
  int v9;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObjects:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PUCompositeVideoActivity canPerformWithAssets:](PUCompositeVideoActivity, "canPerformWithAssets:", v8))
  {
    v9 = objc_msgSend(v7, "isTrashBin") ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PULocalizedString(CFSTR("SHARING_SAVE_LIVE_PHOTO_VIDEO_ACTIVITY_TITLE"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("video");
}

@end
