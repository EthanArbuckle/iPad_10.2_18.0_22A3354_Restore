@implementation PXPhotoKitAssetCollectionSharedAlbumOptionsActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionSharedAlbumOptionsActionPerformer.m"), 38, CFSTR("Method %s is a responsibility of subclass %@"), "+[PXPhotoKitAssetCollectionSharedAlbumOptionsActionPerformer canPerformOnAssetCollectionReference:withInputs:]", v11);

  abort();
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionSharedAlbumOptionsActionPerformer.m"), 52, CFSTR("Method %s is a responsibility of subclass %@"), "+[PXPhotoKitAssetCollectionSharedAlbumOptionsActionPerformer localizedTitleForUseCase:assetCollectionReference:withInputs:]", v12);

  abort();
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionSharedAlbumOptionsActionPerformer.m"), 56, CFSTR("Method %s is a responsibility of subclass %@"), "+[PXPhotoKitAssetCollectionSharedAlbumOptionsActionPerformer systemImageNameForAssetCollectionReference:withInputs:]", v11);

  abort();
}

- (void)performUserInteractionTask
{
  PXAlbumStreamingOptionsViewController *v3;
  PXAlbumStreamingOptionsViewController *presentedOptionsController;
  void *v5;
  void *v6;
  id v7;

  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PXAlbumStreamingOptionsViewController initWithPHAlbum:]([PXAlbumStreamingOptionsViewController alloc], "initWithPHAlbum:", v7);
  presentedOptionsController = self->_presentedOptionsController;
  self->_presentedOptionsController = v3;

  -[PXAlbumStreamingOptionsViewController setDelegate:](self->_presentedOptionsController, "setDelegate:", self);
  -[PXAlbumStreamingOptionsViewController setPresentedModally:](self->_presentedOptionsController, "setPresentedModally:", 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_presentedOptionsController);
  objc_msgSend(v5, "setModalPresentationStyle:", 2);
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completionHandler:", v5, 1, 0);

}

- (BOOL)_shouldDismissOptionsForReason:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 2;
}

- (void)albumStreamingOptionsViewController:(id)a3 didCompleteWithReason:(int)a4
{
  void *v5;
  _BOOL4 v6;
  id v7;

  if (-[PXPhotoKitAssetCollectionSharedAlbumOptionsActionPerformer _shouldDismissOptionsForReason:](self, "_shouldDismissOptionsForReason:", *(_QWORD *)&a4))
  {
    -[PXAlbumStreamingOptionsViewController navigationController](self->_presentedOptionsController, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v5, 0);

    if (v6)
    {
      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to dismiss shared album options"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v7);

    }
  }
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  void *v7;
  uint64_t v8;
  _BOOL8 v10;

  objc_msgSend(a3, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "modalPresentationStyle");
  v10 = a4 != -1 || v8 != 7;

  -[PXAlbumStreamingOptionsViewController setPresentedModally:](self->_presentedOptionsController, "setPresentedModally:", v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedOptionsController, 0);
}

@end
