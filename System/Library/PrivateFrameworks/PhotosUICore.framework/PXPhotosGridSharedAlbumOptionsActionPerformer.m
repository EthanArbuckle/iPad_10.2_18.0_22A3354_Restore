@implementation PXPhotosGridSharedAlbumOptionsActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  int v7;

  objc_msgSend(a4, "currentDataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "px_isSharedAlbum"))
  {
    +[PXSharedAlbumsSettings sharedInstance](PXSharedAlbumsSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "useLemonadeSettingsView") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeSharedAlbumOptions");
  return CFSTR("PXActivityTypeSharedAlbumOptions");
}

- (id)activitySystemImageName
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridSharedAlbumOptionsActionPerformer.m"), 45, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXPhotosGridSharedAlbumOptionsActionPerformer activitySystemImageName]", v6);

  abort();
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridSharedAlbumOptionsActionPerformer.m"), 50, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXPhotosGridSharedAlbumOptionsActionPerformer localizedTitleForUseCase:]", v7);

  abort();
}

- (void)performUserInteractionTask
{
  void *v4;
  void *v5;
  void *v6;
  PXAlbumStreamingOptionsViewController *v7;
  PXAlbumStreamingOptionsViewController *presentedOptionsController;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v6;
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridSharedAlbumOptionsActionPerformer.m"), 56, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("containerCollection"), v14, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridSharedAlbumOptionsActionPerformer.m"), 56, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("containerCollection"), v14);
  }

LABEL_3:
  v7 = -[PXAlbumStreamingOptionsViewController initWithPHAlbum:]([PXAlbumStreamingOptionsViewController alloc], "initWithPHAlbum:", v17);
  presentedOptionsController = self->_presentedOptionsController;
  self->_presentedOptionsController = v7;

  -[PXAlbumStreamingOptionsViewController setDelegate:](self->_presentedOptionsController, "setDelegate:", self);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_presentedOptionsController);
  objc_msgSend(v9, "setModalPresentationStyle:", 7);
  objc_msgSend(v9, "popoverPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v9))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present shared album options for %@"), v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v11);

  }
}

- (BOOL)_shouldDismissOptionsForReason:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 2;
}

- (BOOL)_shouldRequestGridDismissalForReason:(int)a3
{
  void *v3;
  char v4;

  if (a3 != 3)
    return 0;
  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsPopOnContainerDeleteBehavior");

  return v4;
}

- (void)albumStreamingOptionsViewController:(id)a3 didCompleteWithReason:(int)a4
{
  uint64_t v4;
  void *v6;
  _BOOL4 v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  if (-[PXPhotosGridSharedAlbumOptionsActionPerformer _shouldDismissOptionsForReason:](self, "_shouldDismissOptionsForReason:", *(_QWORD *)&a4))
  {
    -[PXAlbumStreamingOptionsViewController navigationController](self->_presentedOptionsController, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v6, 0);

    if (v7)
    {
      if (-[PXPhotosGridSharedAlbumOptionsActionPerformer _shouldRequestGridDismissalForReason:](self, "_shouldRequestGridDismissalForReason:", v4))
      {
        -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "performChanges:", &__block_literal_global_116233);

      }
      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to dismiss shared album options"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v9);

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

uint64_t __107__PXPhotosGridSharedAlbumOptionsActionPerformer_albumStreamingOptionsViewController_didCompleteWithReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDismissRequested:", 1);
}

@end
