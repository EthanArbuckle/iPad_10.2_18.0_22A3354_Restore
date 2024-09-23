@implementation PUPXPhotoKitSlideShowAssetActionPerformer

- (BOOL)shouldExitSelectModeForState:(unint64_t)a3
{
  return 0;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedIndexPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 1)
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  else
    -[PUPXPhotoKitSlideShowAssetActionPerformer _startSlideshow](self, "_startSlideshow");
}

- (void)_startSlideshow
{
  void *v4;
  void *v5;
  PUSlideshowViewController *v6;
  PUSlideshowNavigationController *v7;
  void *v8;
  void *v9;
  id v10;

  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedIndexPaths");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "itemCount") <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXPhotoKitAssetActionManager.m"), 537, CFSTR("Expected at least one selected index path."));

  }
  if (objc_msgSend(v10, "itemCount") == 1)
    -[PUPXPhotoKitSlideShowAssetActionPerformer _getLegacySlideshowSession](self, "_getLegacySlideshowSession");
  else
    -[PUPXPhotoKitSlideShowAssetActionPerformer _getSlideshowSession:](self, "_getSlideshowSession:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXPhotoKitAssetActionManager.m"), 547, CFSTR("Slideshow session was unable to be created"));

  }
  v6 = -[PUSlideshowViewController initWithSession:]([PUSlideshowViewController alloc], "initWithSession:", v5);
  -[PUSlideshowViewController setDelegate:](v6, "setDelegate:", self);
  v7 = -[PUSlideshowNavigationController initWithRootViewController:]([PUSlideshowNavigationController alloc], "initWithRootViewController:", v6);
  -[PUSlideshowNavigationController setModalTransitionStyle:](v7, "setModalTransitionStyle:", 2);
  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v7))
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);

}

- (id)_getLegacySlideshowSession
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PUSlideshowSession *v14;
  void *v16;

  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotoKitAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotoKitAssetActionPerformer photosDataSourceSnapshot](self, "photosDataSourceSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXPhotoKitAssetActionManager.m"), 568, CFSTR("Share performer should have a photosDataSource set."));

  }
  objc_msgSend(v9, "indexPathForAsset:inCollection:", v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, objc_msgSend(v10, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetsStartingAtIndexPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[PUSlideshowSession initWithFetchResult:assetCollection:startIndex:]([PUSlideshowSession alloc], "initWithFetchResult:assetCollection:startIndex:", v13, v8, objc_msgSend(v11, "item"));
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_getSlideshowSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PUSlideshowSession *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  -[PXPhotoKitAssetActionPerformer photosDataSourceSnapshot](self, "photosDataSourceSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchResultWithAssetsAtIndexPaths:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__PUPXPhotoKitSlideShowAssetActionPerformer__getSlideshowSession___block_invoke;
    v10[3] = &unk_1E58A3950;
    v10[4] = &v11;
    objc_msgSend(v4, "enumerateItemIndexSetsUsingBlock:", v10);
    if (v12[3] == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "firstAssetCollection");
    else
      objc_msgSend(v5, "assetCollectionForSection:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PUSlideshowSession initWithFetchResult:assetCollection:]([PUSlideshowSession alloc], "initWithFetchResult:assetCollection:", v6, v8);

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)slideshowViewControllerDidFinish:(id)a3 withVisibleAssets:(id)a4
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a3, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v5, 0);

  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", v6, 0);
}

uint64_t __66__PUPXPhotoKitSlideShowAssetActionPerformer__getSlideshowSession___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  if (v4 >= a3)
    v4 = a3;
  *(_QWORD *)(v3 + 24) = v4;
  return result;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PULocalizedString(CFSTR("SLIDESHOW_TITLE"));
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0D7B1B0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "enableSlideshowAction");

  if (!v9)
  {
    LOBYTE(v12) = 0;
    goto LABEL_10;
  }
  objc_msgSend(v7, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPXPhotoKitAssetActionManager.m"), 481, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("selectionSnapshot.dataSource"), v16, v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPXPhotoKitAssetActionManager.m"), 481, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("selectionSnapshot.dataSource"), v16);
  }

LABEL_4:
  objc_msgSend(v10, "containerCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isAnyItemSelected")
    && (objc_msgSend(v11, "px_isRecentlyDeletedSmartAlbum") & 1) == 0)
  {
    v12 = objc_msgSend(v11, "px_isRecoveredSmartAlbum") ^ 1;
  }
  else
  {
    LOBYTE(v12) = 0;
  }

LABEL_10:
  return v12;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3
{
  return 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return a3 != 0;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  objc_msgSend(a1, "localizedTitleForUseCase:actionManager:", 1, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v9, 0, v8, a4);

  return v10;
}

+ (id)createActivityWithActionManager:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "localizedTitleForUseCase:actionManager:", 2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7B150], "activityWithActionTitle:actionType:activityType:systemImageName:", v3, *MEMORY[0x1E0D7C0E8], *MEMORY[0x1E0D7BE38], CFSTR("play.rectangle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("play.rectangle");
}

@end
