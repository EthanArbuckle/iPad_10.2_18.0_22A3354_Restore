@implementation PXCMMGridController

- (PXCMMGridController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMGridController.m"), 51, CFSTR("%s is not available as initializer"), "-[PXCMMGridController init]");

  abort();
}

- (PXCMMGridController)initWithCMMSession:(id)a3 enableDismissAction:(BOOL)a4 assetActionManager:(id)a5 assetCollectionActionManager:(id)a6 performerDelegate:(id)a7 photosViewConfigurationBlock:(id)a8
{
  id v13;
  PXPhotoKitMessagesAssetActionManager *v14;
  PXPhotoKitAssetCollectionActionManager *v15;
  id v16;
  void (**v17)(id, void *);
  PXCMMGridController *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t isKindOfClass;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  void *v29;
  PXPhotosViewConfiguration *v30;
  void *v31;
  void *v32;
  PXPhotosViewConfiguration *v33;
  void *v34;
  uint64_t v35;
  PXMomentShareStatusPresentation *statusPresentation;
  PXCMMFooterViewModel *v37;
  PXStatusViewModel *v38;
  PXCMMStatusController *v39;
  PXCMMStatusController *statusController;
  PXPhotosUIViewController *v41;
  UIViewController *gridViewController;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  objc_super v52;
  uint8_t buf[16];

  v50 = a4;
  v13 = a3;
  v14 = (PXPhotoKitMessagesAssetActionManager *)a5;
  v15 = (PXPhotoKitAssetCollectionActionManager *)a6;
  v16 = a7;
  v17 = (void (**)(id, void *))a8;
  v52.receiver = self;
  v52.super_class = (Class)PXCMMGridController;
  v18 = -[PXCMMGridController init](&v52, sel_init);
  if (!v18)
    goto LABEL_25;
  objc_msgSend(v13, "viewModel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "selectionManager");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v20 = v13;
    v21 = v51;
    objc_msgSend(v21, "dataSourceManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v14 = -[PXPhotoKitAssetActionManager initWithSelectionManager:]([PXPhotoKitMessagesAssetActionManager alloc], "initWithSelectionManager:", v21);
      objc_msgSend(v20, "importStatusManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotoKitAssetActionManager setImportStatusManager:](v14, "setImportStatusManager:", v24);

      objc_msgSend(v20, "importSessionID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotoKitAssetActionManager setImportSessionID:](v14, "setImportSessionID:", v25);

      +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v27, "addObject:", CFSTR("PXAssetActionTypeAddToLibrary"));
      if ((-[NSObject disableShareAction](v26, "disableShareAction") & 1) == 0)
        objc_msgSend(v27, "addObject:", CFSTR("PXAssetActionTypeShare"));
      if ((-[NSObject disableCopyAction](v26, "disableCopyAction") & 1) == 0)
        objc_msgSend(v27, "addObject:", CFSTR("PXAssetActionTypeCopy"));
      -[PXActionManager setAllowedActionTypes:](v14, "setAllowedActionTypes:", v27);

    }
    else
    {
      PLSharingGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_ERROR, "Unable to provide action manager because data source manager is not of type PXPhotoKitAssetsDataSourceManager.", buf, 2u);
      }
      v14 = 0;
    }

    -[PXActionManager setPerformerDelegate:](v14, "setPerformerDelegate:", v16);
    if (v15)
      goto LABEL_18;
LABEL_15:
    v28 = v13;
    if (v28)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_17:
        objc_msgSend(v28, "momentShare");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[PXAssetCollectionActionManager initWithAssetCollection:displayTitleInfo:]([PXPhotoKitAssetCollectionActionManager alloc], "initWithAssetCollection:displayTitleInfo:", v29, 0);

        -[PXActionManager setPerformerDelegate:](v15, "setPerformerDelegate:", v16);
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXPhotoKitAssetCollectionActionManager *_AssetCollectionActionManager(PXCMMSession *__strong)");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "px_descriptionForAssertionMessage");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("PXCMMGridController.m"), 146, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("session"), v47, v49);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXPhotoKitAssetCollectionActionManager *_AssetCollectionActionManager(PXCMMSession *__strong)");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("PXCMMGridController.m"), 146, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("session"), v47);
    }

    goto LABEL_17;
  }
  if (!v15)
    goto LABEL_15;
LABEL_18:
  v30 = [PXPhotosViewConfiguration alloc];
  objc_msgSend(v13, "dataSourceManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mediaProvider");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[PXPhotosViewConfiguration initWithDataSourceManager:mediaProvider:selectionManager:assetActionManager:assetCollectionActionManager:](v30, "initWithDataSourceManager:mediaProvider:selectionManager:assetActionManager:assetCollectionActionManager:", v31, v32, v51, v14, v15);

  -[PXPhotosViewConfiguration setFooterVisibilityStyle:](v33, "setFooterVisibilityStyle:", 2);
  -[PXPhotosViewConfiguration setAllowedActions:](v33, "setAllowedActions:", 196769);
  if (v50)
    -[PXPhotosViewConfiguration setAllowedActions:](v33, "setAllowedActions:", -[PXPhotosViewConfiguration allowedActions](v33, "allowedActions") | 0x2000);
  -[PXPhotosViewConfiguration setSectionBodyStyle:](v33, "setSectionBodyStyle:", 2);
  -[PXPhotosViewConfiguration setWantsModernNavBarButtons:](v33, "setWantsModernNavBarButtons:", 1);
  -[PXPhotosViewConfiguration setNavBarStyle:](v33, "setNavBarStyle:", 3);
  -[PXPhotosViewConfiguration setWantsTabBarHidden:](v33, "setWantsTabBarHidden:", 1);
  -[PXPhotosViewConfiguration setPrefersActionsInToolbar:](v33, "setPrefersActionsInToolbar:", 1);
  objc_msgSend(v13, "importStatusManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewConfiguration setAssetImportStatusManager:](v33, "setAssetImportStatusManager:", v34);

  objc_msgSend(v13, "momentShareStatusPresentationWithPresentationStyle:", 2);
  v35 = objc_claimAutoreleasedReturnValue();
  statusPresentation = v18->_statusPresentation;
  v18->_statusPresentation = (PXMomentShareStatusPresentation *)v35;

  if (v18->_statusPresentation)
  {
    v37 = -[PXCMMFooterViewModel initWithMomentShareStatusPresentation:mode:]([PXCMMFooterViewModel alloc], "initWithMomentShareStatusPresentation:mode:", v18->_statusPresentation, 1);
    -[PXPhotosViewConfiguration setFooterViewModel:](v33, "setFooterViewModel:", v37);
    v38 = objc_alloc_init(PXStatusViewModel);
    v39 = -[PXCMMStatusController initWithStatusPresentation:viewModel:]([PXCMMStatusController alloc], "initWithStatusPresentation:viewModel:", v18->_statusPresentation, v38);
    statusController = v18->_statusController;
    v18->_statusController = v39;

    -[PXPhotosViewConfiguration setEmptyPlaceholderStatusViewModel:](v33, "setEmptyPlaceholderStatusViewModel:", v38);
  }
  if (v17)
    v17[2](v17, v33);
  v41 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v33);
  gridViewController = v18->_gridViewController;
  v18->_gridViewController = &v41->super;

LABEL_25:
  return v18;
}

- (UIViewController)gridViewController
{
  return self->_gridViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridViewController, 0);
  objc_storeStrong((id *)&self->_statusController, 0);
  objc_storeStrong((id *)&self->_statusPresentation, 0);
}

+ (BOOL)useGridZeroForCMMSession:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;
  BOOL v7;

  v3 = a3;
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enableInCMM");

  v6 = objc_msgSend(v3, "activityType") == 3 || objc_msgSend(v3, "activityType") == 2;
  v7 = v5 & v6;

  return v7;
}

@end
