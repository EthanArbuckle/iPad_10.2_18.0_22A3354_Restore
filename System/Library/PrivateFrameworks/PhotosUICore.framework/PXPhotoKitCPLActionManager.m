@implementation PXPhotoKitCPLActionManager

- (PXPhotoKitCPLActionManager)initWithPhotoLibrary:(id)a3
{
  id v6;
  PXPhotoKitCPLActionManager *v7;
  PXPhotoKitCPLActionManager *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCPLActionManager.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXPhotoKitCPLActionManager;
  v7 = -[PXPhotoKitCPLActionManager init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_photoLibrary, a3);

  return v8;
}

- (PXPhotoKitCPLActionManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCPLActionManager.m"), 17, CFSTR("%s is not available as initializer"), "-[PXPhotoKitCPLActionManager init]");

  abort();
}

- (id)actionPerformerForActionType:(id)a3
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitCPLActionManager.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionType"));

  }
  if (((objc_msgSend(v5, "isEqualToString:", CFSTR("PXCPLActionTypePause")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("PXCPLActionTypeResume")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("PXCPLActionTypeManageCloudStorage")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("PXCPLActionTypeManageLocalStorage")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("PXCPLActionTypeManageCellularDataDisabled")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("PXCPLActionTypeManageAirplaneMode")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("PXCPLActionTypeManageExitMode")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("PXCPLActionTypeLearnMoreClientVersionTooOld")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("PXCPLActionTypeManageClientAuthentication")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("PXCPLActionTypeLearnMoreUpgradeSuggested")) & 1) != 0
     || objc_msgSend(v5, "isEqualToString:", CFSTR("PXCPLActionTypeViewItemsFailingToUpload")))
    && (v6 = (objc_class *)objc_opt_class()) != 0)
  {
    v7 = (void *)objc_msgSend([v6 alloc], "initWithActionType:photoLibrary:", v5, self->_photoLibrary);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
