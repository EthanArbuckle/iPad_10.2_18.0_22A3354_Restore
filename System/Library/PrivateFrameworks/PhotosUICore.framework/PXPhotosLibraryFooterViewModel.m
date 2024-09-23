@implementation PXPhotosLibraryFooterViewModel

- (PXPhotosLibraryFooterViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLibraryFooterViewModel.m"), 52, CFSTR("%s is not available as initializer"), "-[PXPhotosLibraryFooterViewModel init]");

  abort();
}

- (PXPhotosLibraryFooterViewModel)initWithDataSource:(id)a3
{
  id v4;
  PXPhotosLibraryFooterViewModel *v5;
  PXPhotoKitAssetsDataSourceManager *v6;
  PXPhotoKitAssetsDataSourceManager *assetsDataSourceManager;
  uint64_t v8;
  PHPhotoLibrary *photoLibrary;
  PXPhotoKitCPLActionManager *v10;
  PXCPLUIStatusProvider *v11;
  PXCPLUIStatusProvider *cplUIStatusProvider;
  PXCloudQuotaControllerHelper *v13;
  PXCloudQuotaControllerHelper *cloudQuotaHelper;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXPhotosLibraryFooterViewModel;
  v5 = -[PXFooterViewModel init](&v16, sel_init);
  if (v5)
  {
    v6 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v4);
    assetsDataSourceManager = v5->_assetsDataSourceManager;
    v5->_assetsDataSourceManager = v6;

    -[PXSectionedDataSourceManager registerChangeObserver:context:](v5->_assetsDataSourceManager, "registerChangeObserver:context:", v5, PXPhotosLibraryFooterViewModelObserverContext);
    objc_msgSend(v4, "photoLibrary");
    v8 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v5->_photoLibrary;
    v5->_photoLibrary = (PHPhotoLibrary *)v8;

    v10 = -[PXPhotoKitCPLActionManager initWithPhotoLibrary:]([PXPhotoKitCPLActionManager alloc], "initWithPhotoLibrary:", v5->_photoLibrary);
    v11 = -[PXCPLUIStatusProvider initWithPhotoLibrary:actionManager:]([PXCPLUIStatusProvider alloc], "initWithPhotoLibrary:actionManager:", v5->_photoLibrary, v10);
    cplUIStatusProvider = v5->_cplUIStatusProvider;
    v5->_cplUIStatusProvider = v11;

    -[PXCPLUIStatusProvider registerChangeObserver:context:](v5->_cplUIStatusProvider, "registerChangeObserver:context:", v5, PXCPLUIStatusProviderObservationContext_297979);
    v13 = objc_alloc_init(PXCloudQuotaControllerHelper);
    cloudQuotaHelper = v5->_cloudQuotaHelper;
    v5->_cloudQuotaHelper = v13;

    -[PXCloudQuotaControllerHelper setDelegate:](v5->_cloudQuotaHelper, "setDelegate:", v5);
    -[PXPhotosLibraryFooterViewModel _updateExposedProperties](v5, "_updateExposedProperties");

  }
  return v5;
}

- (void)_updateExposedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  void *v24;
  uint64_t v25;
  char *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  char v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  PXPhotosLibraryFooterViewModel *v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  double v61;
  char v62;
  _QWORD aBlock[4];
  id v64;
  id v65;
  _DWORD v66[3];

  -[PXPhotosLibraryFooterViewModel assetsDataSourceManager](self, "assetsDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "estimatedPhotosCount");
  objc_msgSend(v5, "estimatedVideosCount");
  objc_msgSend(v5, "estimatedOtherCount");
  PLLocalizedCountDescription();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCPLUIStatusProvider status](self->_cplUIStatusProvider, "status");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (PXCloudQuotaCanShowInformationView(v7))
  {
    -[PXCloudQuotaControllerHelper informationView](self->_cloudQuotaHelper, "informationView");
    v8 = objc_claimAutoreleasedReturnValue();
    -[PXCloudQuotaControllerHelper premiumInformationView](self->_cloudQuotaHelper, "premiumInformationView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v66[0] = 0;
  -[PXPhotosLibraryFooterViewModel photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasSyncProgressReturningImportOperations:", v66);

  v48 = v5;
  v49 = v4;
  v47 = self;
  v12 = (void *)v8;
  if (v11)
  {
    PLProgressDescription();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
LABEL_10:
    v27 = -1.0;
    v25 = MEMORY[0x1E0C809B0];
    v26 = "LemonadeProfileButtonFactory" + 16;
    goto LABEL_13;
  }
  if (!v7)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v13 = 0;
    goto LABEL_10;
  }
  v45 = v6;
  objc_msgSend(v7, "stateDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "failureDescription");
  v43 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internalInformationMessage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v7, "isPaused");
  objc_msgSend(v7, "progress");
  v22 = v21;
  objc_msgSend(v7, "actionTitle");
  v41 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionConfirmationAlertTitle");
  v39 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionConfirmationAlertButtonTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "action");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    v26 = "uttonFactory";
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PXPhotosLibraryFooterViewModel__updateExposedProperties__block_invoke;
    aBlock[3] = &unk_1E5148CE0;
    v65 = v23;
    v64 = v7;
    v18 = _Block_copy(aBlock);

  }
  else
  {
    v18 = 0;
    v25 = MEMORY[0x1E0C809B0];
    v26 = "uttonFactory";
  }

  v27 = v22;
  v20 = (void *)v43;
  v6 = v45;
  v16 = (void *)v39;
  v15 = (void *)v41;
  v14 = v38;
LABEL_13:
  v50[0] = v25;
  v50[1] = *((_QWORD *)v26 + 7);
  v50[2] = __58__PXPhotosLibraryFooterViewModel__updateExposedProperties__block_invoke_2;
  v50[3] = &unk_1E5148180;
  v51 = v6;
  v52 = v13;
  v53 = v20;
  v54 = v19;
  v62 = v14;
  v61 = v27;
  v55 = v15;
  v56 = v16;
  v57 = v17;
  v58 = v12;
  v59 = v9;
  v60 = v18;
  v28 = v20;
  v29 = v15;
  v30 = v9;
  v31 = v16;
  v40 = v30;
  v46 = v12;
  v32 = v18;
  v44 = v17;
  v42 = v31;
  v33 = v29;
  v34 = v19;
  v35 = v28;
  v36 = v13;
  v37 = v6;
  -[PXFooterViewModel performChanges:](v47, "performChanges:", v50);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  _QWORD v14[4];
  int v15;

  v6 = a4;
  v9 = a3;
  if ((void *)PXPhotosLibraryFooterViewModelObserverContext == a5)
  {
    if ((v6 & 1) == 0)
      goto LABEL_7;
LABEL_6:
    -[PXPhotosLibraryFooterViewModel _updateExposedProperties](self, "_updateExposedProperties");
    goto LABEL_7;
  }
  if ((void *)PXCPLUIStatusProviderObservationContext_297979 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLibraryFooterViewModel.m"), 166, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0x10) == 0)
    goto LABEL_6;
  -[PXCPLUIStatusProvider status](self->_cplUIStatusProvider, "status");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "progress");
  v12 = v11;

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__PXPhotosLibraryFooterViewModel_observable_didChange_context___block_invoke;
  v14[3] = &__block_descriptor_36_e36_v16__0___PXMutableFooterViewModel__8l;
  v15 = v12;
  -[PXFooterViewModel performChanges:](self, "performChanges:", v14);
LABEL_7:

}

- (id)presentingViewControllerForCloudQuotaControllerHelper:(id)a3
{
  void *v4;
  void *v5;

  -[PXPhotosLibraryFooterViewModel presentingDelegate](self, "presentingDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerForViewModel:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PXPhotosLibraryFooterViewModelPresentationDelegate)presentingDelegate
{
  return (PXPhotosLibraryFooterViewModelPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentingDelegate);
}

- (void)setPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentingDelegate, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXPhotoKitAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (PXCPLUIStatusProvider)cplUIStatusProvider
{
  return self->_cplUIStatusProvider;
}

- (void)setCplUIStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_cplUIStatusProvider, a3);
}

- (PXCloudQuotaControllerHelper)cloudQuotaHelper
{
  return self->_cloudQuotaHelper;
}

- (void)setCloudQuotaHelper:(id)a3
{
  objc_storeStrong((id *)&self->_cloudQuotaHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudQuotaHelper, 0);
  objc_storeStrong((id *)&self->_cplUIStatusProvider, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
}

uint64_t __63__PXPhotosLibraryFooterViewModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "setProgress:", a3);
}

uint64_t __58__PXPhotosLibraryFooterViewModel__updateExposedProperties__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58__PXPhotosLibraryFooterViewModel__updateExposedProperties__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setTitle:", v3);
  objc_msgSend(v5, "setSubtitle1:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setSubtitle2:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setInternalMessageSubtitle:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v5, "setIsPaused:", *(unsigned __int8 *)(a1 + 120));
  v4 = *(double *)(a1 + 112);
  *(float *)&v4 = v4;
  objc_msgSend(v5, "setProgress:", v4);
  objc_msgSend(v5, "setActionTitle:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v5, "setActionConfirmationAlertTitle:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v5, "setActionConfirmationAlertButtonTitle:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v5, "setAction:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v5, "setAccessoryView:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v5, "setTopAccessoryView:", *(_QWORD *)(a1 + 96));

}

@end
