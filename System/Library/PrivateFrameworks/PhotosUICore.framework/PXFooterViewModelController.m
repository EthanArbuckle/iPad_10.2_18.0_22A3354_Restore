@implementation PXFooterViewModelController

- (PXFooterViewModelController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFooterViewModelController.m"), 64, CFSTR("%s is not available as initializer"), "-[PXFooterViewModelController init]");

  abort();
}

- (PXFooterViewModelController)initWithPhotoLibrary:(id)a3 provideLibraryCounts:(BOOL)a4 provideCloudQuotaOffers:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v10;
  PXFooterViewModelController *v11;
  uint64_t v12;
  PXEventCoalescer *updateCoalescer;
  uint64_t v14;
  PXUpdater *updater;
  PXFooterViewModel *v16;
  PXFooterViewModel *footerViewModel;
  NSObject *v18;
  PXPhotoKitCPLActionManager *v19;
  PXCPLUIStatusProvider *v20;
  PXCPLUIStatusProvider *cplUIStatusProvider;
  PXCloudQuotaControllerHelper *v22;
  PXCloudQuotaControllerHelper *cloudQuotaHelper;
  void *v25;
  _QWORD block[4];
  id v27;
  id location;
  objc_super v29;

  v5 = a5;
  v6 = a4;
  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFooterViewModelController.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v29.receiver = self;
  v29.super_class = (Class)PXFooterViewModelController;
  v11 = -[PXFooterViewModelController init](&v29, sel_init);
  if (v11)
  {
    objc_msgSend(off_1E50B23F8, "delayedCoalescerWithDelay:", 1.0);
    v12 = objc_claimAutoreleasedReturnValue();
    updateCoalescer = v11->_updateCoalescer;
    v11->_updateCoalescer = (PXEventCoalescer *)v12;

    -[PXEventCoalescer registerObserver:](v11->_updateCoalescer, "registerObserver:", v11);
    v14 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v11, sel__setNeedsUpdate);
    updater = v11->_updater;
    v11->_updater = (PXUpdater *)v14;

    -[PXUpdater addUpdateSelector:](v11->_updater, "addUpdateSelector:", sel__updateFooterViewModel);
    v16 = objc_alloc_init(PXFooterViewModel);
    footerViewModel = v11->_footerViewModel;
    v11->_footerViewModel = v16;

    objc_storeStrong((id *)&v11->_photoLibrary, a3);
    if (v6)
    {
      objc_initWeak(&location, v11);
      +[PXFooterViewModelController updateQueue](PXFooterViewModelController, "updateQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __97__PXFooterViewModelController_initWithPhotoLibrary_provideLibraryCounts_provideCloudQuotaOffers___block_invoke;
      block[3] = &unk_1E5148D30;
      objc_copyWeak(&v27, &location);
      dispatch_async(v18, block);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
    v19 = -[PXPhotoKitCPLActionManager initWithPhotoLibrary:]([PXPhotoKitCPLActionManager alloc], "initWithPhotoLibrary:", v10);
    v20 = -[PXCPLUIStatusProvider initWithPhotoLibrary:actionManager:]([PXCPLUIStatusProvider alloc], "initWithPhotoLibrary:actionManager:", v10, v19);
    cplUIStatusProvider = v11->_cplUIStatusProvider;
    v11->_cplUIStatusProvider = v20;

    -[PXCPLUIStatusProvider registerChangeObserver:context:](v11->_cplUIStatusProvider, "registerChangeObserver:context:", v11, PXCPLUIStatusProviderObservationContext);
    if (v5)
    {
      v22 = objc_alloc_init(PXCloudQuotaControllerHelper);
      cloudQuotaHelper = v11->_cloudQuotaHelper;
      v11->_cloudQuotaHelper = v22;

      -[PXCloudQuotaControllerHelper setDelegate:](v11->_cloudQuotaHelper, "setDelegate:", v11);
    }

  }
  return v11;
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    -[PXFooterViewModelController _updateIfNeeded](self, "_updateIfNeeded");
  }
}

- (void)_updateIfNeeded
{
  id v3;

  if (-[PXFooterViewModelController isActive](self, "isActive"))
  {
    -[PXFooterViewModelController updater](self, "updater");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateIfNeeded");

  }
}

- (void)_setNeedsUpdate
{
  id v2;

  -[PXFooterViewModelController updateCoalescer](self, "updateCoalescer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputEvent");

}

- (void)_prepareCounts
{
  void *v3;
  PXPhotosDataSourceConfiguration *v4;
  PXPhotosDataSource *v5;
  PXPhotoKitAssetsDataSourceManager *v6;
  PXAssetsDataSourceCountsController *v7;
  PXAssetsDataSourceCountsController *countsController;
  id v9;

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIncludeAllPhotosSmartAlbum:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 1000000205, v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v3, 3);
  v5 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v4);
  v6 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v5);
  v7 = (PXAssetsDataSourceCountsController *)objc_msgSend(objc_alloc((Class)off_1E50B16E8), "initWithAssetsDataSourceManager:", v6);
  countsController = self->_countsController;
  self->_countsController = v7;

  -[PXAssetsDataSourceCountsController registerChangeObserver:context:](self->_countsController, "registerChangeObserver:context:", self, PXAssetsDataSourceCountsControllerObserverContext);
  -[PXPhotoKitAssetsDataSourceManager performChanges:](v6, "performChanges:", &__block_literal_global_153_15069);
  -[PXAssetsDataSourceCountsController prepareCountsIfNeeded](self->_countsController, "prepareCountsIfNeeded");

}

- (void)_invalidateFooterViewModel
{
  id v2;

  -[PXFooterViewModelController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFooterViewModel);

}

- (void)_updateFooterViewModel
{
  void *v3;
  void *v4;
  PXAssetsDataSourceCountsController *countsController;
  PHPhotoLibrary *v6;
  NSObject *v7;
  PHPhotoLibrary *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PHPhotoLibrary *v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  id location;
  __int128 v17;
  uint64_t v18;

  -[PXCPLUIStatusProvider status](self->_cplUIStatusProvider, "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v17 = 0uLL;
  v18 = 0;
  countsController = self->_countsController;
  if (countsController)
    -[PXAssetsDataSourceCountsController counts](countsController, "counts");
  v6 = self->_photoLibrary;
  objc_initWeak(&location, self);
  +[PXFooterViewModelController updateQueue](PXFooterViewModelController, "updateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__PXFooterViewModelController__updateFooterViewModel__block_invoke;
  v10[3] = &unk_1E51187A0;
  v14 = v17;
  v15 = v18;
  v11 = v4;
  v12 = v6;
  v8 = v6;
  v9 = v4;
  objc_copyWeak(&v13, &location);
  dispatch_async(v7, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_mainQueue_finishUpdateWithCPLStatus:(id)a3 viewModelConfiguration:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  char v22;
  BOOL v23;

  v6 = a3;
  v7 = a4;
  if ((PXCPLUIStatusHasImportantInformation(v6) & 1) != 0
    || -[PXCloudQuotaControllerHelper hasAnyInformationViews](self->_cloudQuotaHelper, "hasAnyInformationViews"))
  {
    v8 = 1;
  }
  else
  {
    +[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "simulateImportantInformation");

  }
  if (PXCloudQuotaCanShowInformationView(v6))
  {
    -[PXCloudQuotaControllerHelper informationView](self->_cloudQuotaHelper, "informationView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCloudQuotaControllerHelper premiumInformationView](self->_cloudQuotaHelper, "premiumInformationView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "pauseReason") == 2 && v10 != 0;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v13 = 0;
  }
  -[PXFooterViewModelController footerViewModel](self, "footerViewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91__PXFooterViewModelController__mainQueue_finishUpdateWithCPLStatus_viewModelConfiguration___block_invoke;
  v18[3] = &unk_1E51187C8;
  v20 = v11;
  v21 = v7;
  v22 = v8;
  v19 = v10;
  v23 = v13;
  v15 = v11;
  v16 = v10;
  v17 = v7;
  objc_msgSend(v14, "performChanges:", v18);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXAssetsDataSourceCountsControllerObserverContext == a5)
  {
    if ((v6 & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  if ((void *)PXCPLUIStatusProviderObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFooterViewModelController.m"), 363, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0x3FF) != 0)
  {
LABEL_4:
    v11 = v9;
    -[PXFooterViewModelController _invalidateFooterViewModel](self, "_invalidateFooterViewModel");
    v9 = v11;
  }
LABEL_5:

}

- (id)presentingViewControllerForCloudQuotaControllerHelper:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v8[16];

  -[PXFooterViewModelController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Missing PXFooterViewModelControllerDelegate when providing presenting view controller for PXCloudQuotaControllerHelper", v8, 2u);
    }

  }
  objc_msgSend(v4, "presentingViewControllerForFooterViewModelController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXFooterViewModel)footerViewModel
{
  return self->_footerViewModel;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PXFooterViewModelControllerDelegate)delegate
{
  return (PXFooterViewModelControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)setUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_updater, a3);
}

- (PXEventCoalescer)updateCoalescer
{
  return self->_updateCoalescer;
}

- (void)setUpdateCoalescer:(id)a3
{
  objc_storeStrong((id *)&self->_updateCoalescer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateCoalescer, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cloudQuotaHelper, 0);
  objc_storeStrong((id *)&self->_cplUIStatusProvider, 0);
  objc_storeStrong((id *)&self->_countsController, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_footerViewModel, 0);
}

void __91__PXFooterViewModelController__mainQueue_finishUpdateWithCPLStatus_viewModelConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(v3, "setHasImportantInformation:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(v3, "setAccessoryView:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTopAccessoryView:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 57))
    objc_msgSend(v3, "setSubtitle1Style:", 1);

}

void __53__PXFooterViewModelController__updateFooterViewModel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  __int128 v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v10 = *(_OWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 72);
  +[PXFooterViewModelController _updateQueue_viewModelConfigurationWithStatus:counts:photoLibrary:](PXFooterViewModelController, "_updateQueue_viewModelConfigurationWithStatus:counts:photoLibrary:", v2, &v10, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PXFooterViewModelController__updateFooterViewModel__block_invoke_2;
  block[3] = &unk_1E51422C8;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 32);
  v8 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __53__PXFooterViewModelController__updateFooterViewModel__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_mainQueue_finishUpdateWithCPLStatus:viewModelConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __45__PXFooterViewModelController__prepareCounts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startBackgroundFetchIfNeeded");
}

void __97__PXFooterViewModelController_initWithPhotoLibrary_provideLibraryCounts_provideCloudQuotaOffers___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__PXFooterViewModelController_initWithPhotoLibrary_provideLibraryCounts_provideCloudQuotaOffers___block_invoke_2;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __97__PXFooterViewModelController_initWithPhotoLibrary_provideLibraryCounts_provideCloudQuotaOffers___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_prepareCounts");

}

+ (void)loadAsyncUpdatesImmediately
{
  NSObject *v2;
  dispatch_block_t v3;
  NSObject *queue;

  +[PXFooterViewModelController updateQueue](PXFooterViewModelController, "updateQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v2);

  +[PXFooterViewModelController updateQueue](PXFooterViewModelController, "updateQueue");
  queue = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, &__block_literal_global_15102);
  dispatch_async(queue, v3);

}

+ (id)_updateQueue_viewModelConfigurationWithStatus:(id)a3 counts:(id *)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  unint64_t var1;
  unint64_t var2;
  unint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  uint64_t v33;
  float v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  char v38;
  int v39;
  int v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  unint64_t v64;
  __CFString *v65;
  __CFString *v66;
  NSObject *v67;
  char v68;
  unint64_t v69;
  void *v70;
  uint64_t v71;
  char v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  _QWORD v82[4];
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  uint64_t v93;
  float v94;
  char v95;
  char v96;
  _QWORD aBlock[4];
  id v98;
  id v99;
  int v100;
  uint8_t buf[4];
  id v102;
  __int16 v103;
  _BYTE v104[10];
  _BYTE v105[10];
  void *v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "updateQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  var1 = a4->var1;
  var2 = a4->var2;
  if (a4->var0 == 0x7FFFFFFFFFFFFFFFLL || var1 == 0x7FFFFFFFFFFFFFFFLL || var2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PXLocalizedStringFromTable(CFSTR("PXCuratedLibraryLoadingCountsDescription"), CFSTR("PhotosUICore"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
  }
  else
  {
    v15 = var1 + a4->var0 + var2;
    PLLocalizedCountDescription();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v100 = 0;
  v17 = objc_msgSend(v9, "hasSyncProgressReturningImportOperations:", &v100);

  if (v17)
  {
    PLProgressDescription();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PLAlbumImportOperationDebugDescription();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PLUserStatusUIGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v102 = a1;
      v103 = 2114;
      *(_QWORD *)v104 = v18;
      *(_WORD *)&v104[8] = 2114;
      *(_QWORD *)v105 = v19;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing status for import operation: \"%{public}@\" (%{public}@)", buf, 0x20u);
    }

  }
  else
  {
    v18 = 0;
  }
  v21 = MEMORY[0x1E0C809B0];
  v81 = v8;
  if (!v8)
  {
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    LOBYTE(v28) = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = -1.0;
    goto LABEL_44;
  }
  v69 = v15;
  if (v16)
  {
    objc_msgSend(v8, "referencedItemsDescription");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  v79 = (void *)v22;
  objc_msgSend(v8, "stateDescription");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "failureDescription");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internalInformationMessage");
  v33 = objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v8, "isPaused");
  objc_msgSend(v8, "progress");
  v32 = v34;
  objc_msgSend(v8, "actionTitle");
  v35 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionConfirmationAlertTitle");
  v71 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionConfirmationAlertSubtitle");
  v75 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionConfirmationAlertButtonTitle");
  v74 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "action");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v36;
  if (v36)
  {
    aBlock[0] = v21;
    aBlock[1] = 3221225472;
    aBlock[2] = __97__PXFooterViewModelController__updateQueue_viewModelConfigurationWithStatus_counts_photoLibrary___block_invoke;
    aBlock[3] = &unk_1E5148CE0;
    v99 = v36;
    v98 = v8;
    v25 = _Block_copy(aBlock);

  }
  else
  {
    v25 = 0;
  }
  v77 = (void *)v33;
  if (!v28 || objc_msgSend(v8, "pauseReason") == 2 || objc_msgSend(v8, "pauseReason") == 1)
  {
    v37 = v21;
  }
  else
  {
    v37 = v21;
    if (objc_msgSend(v8, "pauseReason"))
    {
      v64 = objc_msgSend(v8, "pauseReason");
      if (v64 > 0x12)
        v65 = 0;
      else
        v65 = off_1E5143300[v64];
      v66 = v65;
      PLUserStatusUIGetLog();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v102 = a1;
        v103 = 2114;
        *(_QWORD *)v104 = v66;
        _os_log_impl(&dword_1A6789000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing badge to status – reason: (%{public}@)", buf, 0x16u);
      }

      v72 = 1;
      goto LABEL_28;
    }
  }
  v72 = 0;
LABEL_28:
  v76 = (void *)v35;
  v38 = v100;
  v39 = objc_msgSend(v8, "inResetSync");
  v40 = v39;
  if ((v38 & 0x10) != 0 || v39)
  {
    v68 = v28;
    v41 = v38 & 0x10;
    v42 = objc_msgSend(v8, "numberOfPhotoAssets");
    v43 = objc_msgSend(v8, "numberOfVideoAssets");
    v44 = v43 + v42 + objc_msgSend(v8, "numberOfOtherAssets");
    if (v44 > v69)
    {
      PLLocalizedCountDescription();
      v45 = objc_claimAutoreleasedReturnValue();

      v32 = (float)v69 / (float)v44;
      PLUserStatusUIGetLog();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v102 = a1;
        v103 = 1024;
        *(_DWORD *)v104 = v41 >> 4;
        *(_WORD *)&v104[4] = 1024;
        *(_DWORD *)&v104[6] = v40;
        *(_WORD *)v105 = 2048;
        *(double *)&v105[2] = v32;
        _os_log_impl(&dword_1A6789000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing status for rebuild: %d, reset: %d, progress: %f", buf, 0x22u);
      }

      v16 = (void *)v45;
    }
    v8 = (id)v71;
    v21 = v37;
    if (v41)
    {
      PXLocalizedStringFromTable(CFSTR("PXCPLStatus_Rebuild"), CFSTR("PhotosUICore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      PLUserStatusUIGetLog();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v102 = a1;
        _os_log_impl(&dword_1A6789000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing rebuild placeholder status title", buf, 0xCu);
      }

    }
    else
    {
      v18 = v70;
    }
    LOBYTE(v28) = v68;
  }
  else
  {
    v18 = v70;
    v8 = (id)v71;
    v21 = v37;
  }
  PLUserStatusUIGetLog();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v102 = a1;
    v103 = 2114;
    *(_QWORD *)v104 = v16;
    *(_WORD *)&v104[8] = 2114;
    *(_QWORD *)v105 = v18;
    *(_WORD *)&v105[8] = 2114;
    v106 = v30;
    _os_log_impl(&dword_1A6789000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ Did provide CPL status: \"%{public}@\", \"%{public}@\", \"%{public}@\", buf, 0x2Au);
  }

  v29 = v77;
  v31 = v79;
  v23 = (void *)v75;
  v27 = v76;
  v24 = (void *)v74;
  v26 = v72;
LABEL_44:
  v82[0] = v21;
  v82[1] = 3221225472;
  v82[2] = __97__PXFooterViewModelController__updateQueue_viewModelConfigurationWithStatus_counts_photoLibrary___block_invoke_160;
  v82[3] = &unk_1E51187F0;
  v83 = v16;
  v84 = v31;
  v85 = v18;
  v86 = v30;
  v95 = v28;
  v94 = v32;
  v87 = v29;
  v88 = v27;
  v89 = v8;
  v90 = v23;
  v91 = v24;
  v92 = v25;
  v93 = 0;
  v96 = v26;
  v49 = v16;
  v50 = v30;
  v51 = v23;
  v52 = v25;
  v53 = v24;
  v54 = v52;
  v80 = v53;
  v78 = v51;
  v55 = v8;
  v56 = v27;
  v57 = v29;
  v58 = v50;
  v59 = v18;
  v60 = v31;
  v61 = v49;
  v62 = _Block_copy(v82);

  return v62;
}

+ (OS_dispatch_queue)updateQueue
{
  if (updateQueue_onceToken != -1)
    dispatch_once(&updateQueue_onceToken, &__block_literal_global_161);
  return (OS_dispatch_queue *)(id)updateQueue_queue;
}

void __42__PXFooterViewModelController_updateQueue__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  void *v4;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_initially_inactive(v1);
  attr = objc_claimAutoreleasedReturnValue();

  v2 = dispatch_queue_create("com.apple.PXFooterViewModelController.Update", attr);
  v3 = (void *)updateQueue_queue;
  updateQueue_queue = (uint64_t)v2;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleDeferredMainQueueTask:", &__block_literal_global_164);

}

void __42__PXFooterViewModelController_updateQueue__block_invoke_2()
{
  dispatch_activate((dispatch_object_t)updateQueue_queue);
}

uint64_t __97__PXFooterViewModelController__updateQueue_viewModelConfigurationWithStatus_counts_photoLibrary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __97__PXFooterViewModelController__updateQueue_viewModelConfigurationWithStatus_counts_photoLibrary___block_invoke_160(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setTitle:", v3);
  objc_msgSend(v5, "setExtendedTitle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setSubtitle1:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setSubtitle2:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v5, "setInternalMessageSubtitle:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v5, "setIsPaused:", *(unsigned __int8 *)(a1 + 124));
  LODWORD(v4) = *(_DWORD *)(a1 + 120);
  objc_msgSend(v5, "setProgress:", v4);
  objc_msgSend(v5, "setActionTitle:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v5, "setActionConfirmationAlertTitle:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v5, "setActionConfirmationAlertSubtitle:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v5, "setActionConfirmationAlertButtonTitle:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v5, "setAction:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v5, "setSubtitle1Style:", *(_QWORD *)(a1 + 112));
  objc_msgSend(v5, "setShowBadge:", *(unsigned __int8 *)(a1 + 125));

}

@end
