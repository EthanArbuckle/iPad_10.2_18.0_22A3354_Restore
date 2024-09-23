@implementation PXPhotosMapSelectionHandler

- (PXPhotosMapSelectionHandler)initWithViewModel:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  PXPhotosMapSelectionHandler *v9;
  PXPhotosMapSelectionHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotosMapSelectionHandler;
  v9 = -[PXPhotosMapSelectionHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
  }

  return v10;
}

- (PXPhotosMapSelectionHandler)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosMapSelectionHandler.m"), 42, CFSTR("%s is not available as initializer"), "-[PXPhotosMapSelectionHandler init]");

  abort();
}

- (void)didSelectGeotaggableItems:(id)a3 fromMapView:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  PXPhotosUIViewController *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  uint8_t buf[8];
  __int128 v43;
  uint64_t v44;

  objc_msgSend(a3, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "allObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v8;
      v10 = v9;
      if (v9)
      {
        if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EEA2AEE0) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "px_descriptionForAssertionMessage");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosMapSelectionHandler.m"), 57, CFSTR("%@ should be nil or conform to protocol %@, but %@ doesn't"), CFSTR("selectedGeotaggable"), CFSTR("PXDisplayAsset"), v36);

        }
        -[PXPhotosMapSelectionHandler viewModel](self, "viewModel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "currentDataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "identifier");

        *(_QWORD *)buf = v13;
        v43 = xmmword_1A7C0C1F0;
        v44 = 0x7FFFFFFFFFFFFFFFLL;
        v14 = objc_msgSend(objc_alloc((Class)off_1E50B1688), "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v10, 0, buf);
        -[PXPhotosMapSelectionHandler viewModel](self, "viewModel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dataSourceManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "createDataSourceManagerForAsset:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotosMapSelectionHandler setOneUpDataSourceManager:](self, "setOneUpDataSourceManager:", v17);

        -[PXPhotosMapSelectionHandler presentingViewController](self, "presentingViewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "px_enableOneUpPresentation");

        -[PXPhotosMapSelectionHandler presentingViewController](self, "presentingViewController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "px_oneUpPresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "setDelegate:", self);
        objc_msgSend(v20, "startWithConfigurationHandler:", 0);

      }
      else
      {
        PLUIGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Unable to provide selectedGeotaggableAsset", buf, 2u);
        }
      }

      goto LABEL_23;
    }
    objc_msgSend(v6, "anyObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "px_descriptionForAssertionMessage");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosMapSelectionHandler.m"), 73, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("selectedGeotaggables.anyObject"), v32, v34);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosMapSelectionHandler.m"), 73, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("selectedGeotaggables.anyObject"), v32);
    }

LABEL_9:
    objc_msgSend(v21, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      PLUIGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_ERROR, "Missing photoLibrary required to show selectedGeotaggables", buf, 2u);
      }

      v10 = 0;
      goto LABEL_23;
    }
    if (!+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled")
      || (+[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "presentZoomableGridFromMapCluster"),
          v22,
          !v23))
    {
      PXPhotosViewConfigurationForPlacesMomentsWithAllowedAssets(v6, v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringFromTable(CFSTR("PXPlacesFullSizeViewTitle"), CFSTR("PhotosUICore"));
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setTitle:", v24);
      goto LABEL_16;
    }
    v24 = v6;
    if (v24)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_14:
        PXPhotosViewConfigurationForPlacesGridWithAssetSet(v24, v10);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

        objc_msgSend(v25, "setOneUpPresentationOrigin:", 7);
        v26 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v25);
        -[PXPhotosMapSelectionHandler presentingViewController](self, "presentingViewController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "navigationController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "pushViewController:animated:", v26, 1);

LABEL_23:
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "px_descriptionForAssertionMessage");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosMapSelectionHandler.m"), 80, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("selectedGeotaggables"), v39, v41);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosMapSelectionHandler.m"), 80, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("selectedGeotaggables"), v39);
    }

    goto LABEL_14;
  }
LABEL_24:

}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  void *v5;
  void *v6;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;

  -[PXPhotosMapSelectionHandler viewModel](self, "viewModel", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosMapSelectionHandler.m"), 106, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.viewModel.mediaProvider"), v10);
LABEL_6:

    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosMapSelectionHandler.m"), 106, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.viewModel.mediaProvider"), v10, v12);

    goto LABEL_6;
  }
  return v6;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 7;
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PXPhotosMapSelectionHandler oneUpDataSourceManager](self, "oneUpDataSourceManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startingAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (PXAssetsDataSourceManager)oneUpDataSourceManager
{
  return self->_oneUpDataSourceManager;
}

- (void)setOneUpDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
