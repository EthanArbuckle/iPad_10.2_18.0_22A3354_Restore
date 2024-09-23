@implementation PXPhotoKitAssetCollectionMomentShareActionPerformer

- (void)performUserInteractionTask
{
  PXCMMPhotoKitContext *v3;
  void *v4;
  PXCMMWorkflowCoordinator *v5;
  PXCMMWorkflowCoordinator *workflowCoordinator;
  void *v7;
  void *v8;
  PXCMMPhotoKitContext *v9;

  v3 = [PXCMMPhotoKitContext alloc];
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXCMMPhotoKitContext initWithAssetCollection:activityType:sourceType:](v3, "initWithAssetCollection:activityType:sourceType:", v4, 1, 0);

  -[PXCMMContext setHideActionMenu:](v9, "setHideActionMenu:", 1);
  v5 = objc_alloc_init(PXCMMWorkflowCoordinator);
  workflowCoordinator = self->_workflowCoordinator;
  self->_workflowCoordinator = v5;

  -[PXCMMWorkflowCoordinator setDelegate:](self->_workflowCoordinator, "setDelegate:", self);
  -[PXCMMWorkflowCoordinator workflowViewControllerWithContext:embedInNavigationControllerOfClass:](self->_workflowCoordinator, "workflowViewControllerWithContext:embedInNavigationControllerOfClass:", v9, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1002, CFSTR("Failed to present the CMM view controller"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitAssetCollectionMomentShareActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v8);

  }
}

- (int64_t)shareOriginForSession:(id)a3 workflowCoordinator:(id)a4
{
  return 3;
}

- (void)workflowCoordinator:(id)a3 workflowViewController:(id)a4 didFinishSession:(id)a5 withActivityState:(unint64_t)a6
{
  _BOOL8 v7;
  uint64_t v8;
  id v9;

  v7 = -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", a4, 0, a5, a6);
  v8 = 0;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1002, CFSTR("Failed to dismiss the CMM view controller"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v8;
  -[PXPhotoKitAssetCollectionMomentShareActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", v7, v8);

}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  PXCMMWorkflowCoordinator *workflowCoordinator;
  id v7;
  objc_super v8;

  v4 = a3;
  workflowCoordinator = self->_workflowCoordinator;
  self->_workflowCoordinator = 0;
  v7 = a4;

  v8.receiver = self;
  v8.super_class = (Class)PXPhotoKitAssetCollectionMomentShareActionPerformer;
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](&v8, sel_completeUserInteractionTaskWithSuccess_error_, v4, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowCoordinator, 0);
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;

  objc_msgSend(a3, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1996, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v13);
LABEL_10:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1996, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v13, v15);

    goto LABEL_10;
  }
LABEL_3:
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PXCMMHasSendAndReceiveCapabilities(v7);

  v9 = v8 && objc_msgSend(v6, "assetCollectionType") != 8 && objc_msgSend(v6, "assetCollectionType") != 7;
  return v9;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  if (a3 > 2)
    v6 = 0;
  else
    v6 = off_1E5124918[a3];
  v7 = v6;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("PXPhotoKitAssetCollectionActionManager%@Title_Share"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(v8, CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
