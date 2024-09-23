@implementation PXPhotosGridFooterStatusController

- (PXPhotosGridFooterStatusController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridFooterStatusController.m"), 72, CFSTR("%s is not available as initializer"), "-[PXPhotosGridFooterStatusController init]");

  abort();
}

- (PXPhotosGridFooterStatusController)initWithViewModel:(id)a3 itemsCountsController:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PXPhotosGridFooterStatusController *v11;
  PXPhotosGridFooterStatusController *v12;
  void *v13;
  uint64_t v14;
  PXLemonadeFeatureAvailabilityMonitor *featureAvailabilityMonitor;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  PHPhotoLibrary *photoLibrary;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  PHPhotoLibrary *v28;
  objc_class *cplActionManagerClass;
  void *v30;
  PXCPLUIStatusProvider *v31;
  PXCPLUIStatusProvider *cplUIStatusProvider;
  PXCPLPhotoLibrarySource *v33;
  PXCPLPhotoLibrarySource *photoLibrarySource;
  PXCloudQuotaControllerHelper *v35;
  PXCloudQuotaControllerHelper *cloudQuotaHelper;
  PXFetchResultCountObserver *v37;
  PHPhotoLibrary *v38;
  PXPhotosGridFooterStatusController *v39;
  uint64_t v40;
  PXFetchResultCountObserver *renderingCountObserver;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  PXLibraryFilterState *libraryFilterState;
  void *v48;
  int v49;
  PXFilterFooterController *v50;
  void *v51;
  uint64_t v52;
  PXFilterFooterController *filterFooterController;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  NSObject *p_super;
  id v61;
  objc_super v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridFooterStatusController.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridFooterStatusController.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemsCountsController"));

LABEL_3:
  v62.receiver = self;
  v62.super_class = (Class)PXPhotosGridFooterStatusController;
  v11 = -[PXPhotosGridFooterStatusController init](&v62, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewModel, a3);
    objc_msgSend(v8, "footerViewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "featureAvailabilityMonitor");
    v14 = objc_claimAutoreleasedReturnValue();
    featureAvailabilityMonitor = v12->_featureAvailabilityMonitor;
    v12->_featureAvailabilityMonitor = (PXLemonadeFeatureAvailabilityMonitor *)v14;

    -[PXLemonadeFeatureAvailabilityMonitor observable](v12->_featureAvailabilityMonitor, "observable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerChangeObserver:context:", v12, PXLemonadeFeatureAvailabilityMonitorObservationContext_181116);

    objc_msgSend(v8, "dataSourceManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "containerCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;

    objc_msgSend(v20, "photoLibrary");
    v21 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v12->_photoLibrary;
    v12->_photoLibrary = (PHPhotoLibrary *)v21;

    if (!v12->_photoLibrary)
    {
      PLUIGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "dataSourceManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "dataSourceManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "dataSource");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v64 = v8;
        v65 = 2112;
        v66 = v24;
        v67 = 2112;
        v68 = v26;
        v69 = 2112;
        v70 = v20;
        _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "Failed to acquire photo library from vm:%@, dsm:%@, ds:%@, collection:%@", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v12->_photoLibrary;
      v12->_photoLibrary = (PHPhotoLibrary *)v27;

    }
    objc_storeStrong((id *)&v12->_countsController, a4);
    -[PXAssetsDataSourceCountsController registerChangeObserver:context:](v12->_countsController, "registerChangeObserver:context:", v12, PXAssetsDataSourceCountsControllerObserverContext_181114);
    if (objc_msgSend(v8, "wantsCPLStatus"))
    {
      cplActionManagerClass = (objc_class *)objc_msgSend(v8, "cplActionManagerClass");
      v12->_cplActionManagerClass = cplActionManagerClass;
      if (!cplActionManagerClass)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("PXPhotosGridFooterStatusController.m"), 100, CFSTR("a class is needed for CPL status"));

        cplActionManagerClass = v12->_cplActionManagerClass;
      }
      v30 = (void *)objc_msgSend([cplActionManagerClass alloc], "initWithPhotoLibrary:", v12->_photoLibrary);
      v31 = -[PXCPLUIStatusProvider initWithPhotoLibrary:actionManager:]([PXCPLUIStatusProvider alloc], "initWithPhotoLibrary:actionManager:", v12->_photoLibrary, v30);
      cplUIStatusProvider = v12->_cplUIStatusProvider;
      v12->_cplUIStatusProvider = v31;

      -[PXCPLUIStatusProvider registerChangeObserver:context:](v12->_cplUIStatusProvider, "registerChangeObserver:context:", v12, PXCPLUIStatusProviderObservationContext_181115);
      v33 = -[PXCPLPhotoLibrarySource initWithPhotoLibrary:]([PXCPLPhotoLibrarySource alloc], "initWithPhotoLibrary:", v12->_photoLibrary);
      photoLibrarySource = v12->_photoLibrarySource;
      v12->_photoLibrarySource = v33;

      -[PXCPLPhotoLibrarySource registerChangeObserver:context:](v12->_photoLibrarySource, "registerChangeObserver:context:", v12, PXCPLPhotoLibrarySourceObservationContext_181120);
      v35 = objc_alloc_init(PXCloudQuotaControllerHelper);
      cloudQuotaHelper = v12->_cloudQuotaHelper;
      v12->_cloudQuotaHelper = v35;

      -[PXCloudQuotaControllerHelper setDelegate:](v12->_cloudQuotaHelper, "setDelegate:", v12);
    }
    if (objc_msgSend(v8, "wantsRenderingStatus"))
    {
      if (v20)
      {
        v37 = [PXFetchResultCountObserver alloc];
        v38 = v12->_photoLibrary;
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __78__PXPhotosGridFooterStatusController_initWithViewModel_itemsCountsController___block_invoke;
        v59[3] = &unk_1E51323C0;
        v39 = v12;
        p_super = &v39->super;
        v61 = v20;
        v40 = -[PXFetchResultCountObserver initWithQOSClass:photoLibrary:fetchResultBlock:](v37, "initWithQOSClass:photoLibrary:fetchResultBlock:", 17, v38, v59);
        renderingCountObserver = v39->_renderingCountObserver;
        v39->_renderingCountObserver = (PXFetchResultCountObserver *)v40;

        -[PXFetchResultCountObserver setDelegate:](v39->_renderingCountObserver, "setDelegate:", v39);
        v42 = p_super;
      }
      else
      {
        PLUIGetLog();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "dataSourceManager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "dataSourceManager");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "dataSource");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v64 = v8;
          v65 = 2112;
          v66 = v43;
          v67 = 2112;
          v68 = v45;
          _os_log_impl(&dword_1A6789000, v42, OS_LOG_TYPE_ERROR, "Failed to acquire asset collection from vm:%@, dsm:%@, ds:%@", buf, 0x20u);

        }
      }

    }
    objc_msgSend(v8, "libraryFilterState");
    v46 = objc_claimAutoreleasedReturnValue();
    libraryFilterState = v12->_libraryFilterState;
    v12->_libraryFilterState = (PXLibraryFilterState *)v46;

    -[PXLibraryFilterState registerChangeObserver:context:](v12->_libraryFilterState, "registerChangeObserver:context:", v12, PXLibraryFilterStateObservationContext_181119);
    +[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "showFilterView");

    if (v49)
    {
      v50 = [PXFilterFooterController alloc];
      objc_msgSend(v8, "gridActionManager");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = -[PXFilterFooterController initWithActionManager:photoLibrary:](v50, "initWithActionManager:photoLibrary:", v51, v12->_photoLibrary);
      filterFooterController = v12->_filterFooterController;
      v12->_filterFooterController = (PXFilterFooterController *)v52;

      -[PXFilterFooterController setLibraryFilterState:](v12->_filterFooterController, "setLibraryFilterState:", v12->_libraryFilterState);
      objc_msgSend(v8, "contentFilterState");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFilterFooterController setContentFilterState:](v12->_filterFooterController, "setContentFilterState:", v54);

      objc_msgSend(v8, "registerChangeObserver:context:", v12, PXPhotosViewModelObserverContext_181118);
    }

  }
  return v12;
}

- (void)viewWillAppear
{
  -[PXPhotosGridFooterStatusController _updateFooterIfNeededWithReason:](self, "_updateFooterIfNeededWithReason:", CFSTR("ViewWillAppear"));
}

- (void)viewDidAppear
{
  -[PXPhotosGridFooterStatusController _updateFooterIfNeededWithReason:](self, "_updateFooterIfNeededWithReason:", CFSTR("ViewDidAppear"));
}

- (void)_updateFooterIfNeededWithReason:(id)a3
{
  PXAssetsDataSourceCountsController *countsController;
  id v5;

  countsController = self->_countsController;
  v5 = a3;
  -[PXAssetsDataSourceCountsController prepareCountsIfNeeded](countsController, "prepareCountsIfNeeded");
  -[PXPhotosGridFooterStatusController _updateHasImportantInformation](self, "_updateHasImportantInformation");
  -[PXPhotosGridFooterStatusController _updateFooterViewModelWithReason:](self, "_updateFooterViewModelWithReason:", v5);

}

- (void)_updateHasImportantInformation
{
  void *v3;
  char HasImportantInformation;
  char v5;
  PXPhotosViewModel *viewModel;
  void *v7;
  _QWORD v8[4];
  char v9;

  if (-[PXPhotosViewModel wantsCPLStatus](self->_viewModel, "wantsCPLStatus"))
  {
    -[PXCPLUIStatusProvider status](self->_cplUIStatusProvider, "status");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    HasImportantInformation = PXCPLUIStatusHasImportantInformation(v3);

    if ((HasImportantInformation & 1) != 0
      || -[PXCloudQuotaControllerHelper hasAnyInformationViews](self->_cloudQuotaHelper, "hasAnyInformationViews")
      || -[PXFetchResultCountObserver fetchResultCount](self->_renderingCountObserver, "fetchResultCount") > 0)
    {
      v5 = 1;
    }
    else
    {
      +[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "simulateImportantInformation");

    }
    viewModel = self->_viewModel;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__PXPhotosGridFooterStatusController__updateHasImportantInformation__block_invoke;
    v8[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
    v9 = v5;
    -[PXPhotosViewModel performChanges:](viewModel, "performChanges:", v8);
  }
}

- (void)_updateFooterViewModelWithReason:(id)a3
{
  id v5;
  void *v6;
  char v7;
  PXAssetsDataSourceCountsController *countsController;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  PXPhotosViewModel **p_viewModel;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  PXAssetsDataSourceCountsController *v17;
  void *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  float v31;
  int v32;
  char v33;
  uint64_t v34;
  double v35;
  NSObject *v36;
  double v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  float v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  _BOOL8 v47;
  char v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  const __CFString *v58;
  NSObject *v59;
  NSObject *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  id v68;
  NSObject *v69;
  PXLemonadeFeatureAvailabilityMonitor *featureAvailabilityMonitor;
  __objc2_class **v71;
  void *v72;
  void *v73;
  void *v74;
  char v75;
  id *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  char v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  uint64_t v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _BOOL8 v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  char v104;
  id v105;
  void *v106;
  SEL v107;
  double v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  char v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  _QWORD v120[4];
  id v121;
  id v122;
  double v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  _BOOL8 v134;
  float v135;
  char v136;
  BOOL v137;
  char v138;
  _QWORD v139[4];
  id v140;
  _QWORD v141[4];
  id v142;
  id v143;
  int v144;
  _QWORD aBlock[5];
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint8_t buf[4];
  PXPhotosGridFooterStatusController *v150;
  __int16 v151;
  uint64_t v152;
  __int16 v153;
  double v154;
  __int16 v155;
  uint64_t v156;
  __int16 v157;
  uint64_t v158;
  __int16 v159;
  uint64_t v160;
  __int16 v161;
  id v162;
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "forceShowProcessingUI");

  v146 = 0;
  v147 = 0;
  v148 = 0;
  countsController = self->_countsController;
  v107 = a2;
  if (countsController)
  {
    -[PXAssetsDataSourceCountsController counts](countsController, "counts");
    v9 = v146;
    v10 = v147;
    v11 = v148;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
  }
  v12 = v10 + v11 + v9;
  p_viewModel = &self->_viewModel;
  if (-[PXPhotosViewModel hidesAssetCountInFooter](self->_viewModel, "hidesAssetCountInFooter"))
  {
    v14 = 0;
  }
  else
  {
    PLLocalizedCountDescription();
    v14 = objc_claimAutoreleasedReturnValue();
    PLUserStatusUIGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      v17 = self->_countsController;
      *(_DWORD *)buf = 138544898;
      v150 = self;
      v151 = 2114;
      v152 = v16;
      v153 = 2048;
      v154 = *(double *)&v17;
      v155 = 2048;
      v156 = v146;
      v157 = 2048;
      v158 = v147;
      v159 = 2048;
      v160 = v148;
      v161 = 2114;
      v162 = v5;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Local counts for <%{public}@:%p>: photos:%lu, videos:%lu, others:%lu [Reason: %{public}@]", buf, 0x48u);
    }

  }
  +[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "showFilterView");

  if (v19
    && (-[PXFilterFooterController view](self->_filterFooterController, "view"),
        (v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v112 = (void *)v20;
    PLUserStatusUIGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[PXFilterFooterController contentFilterState](self->_filterFooterController, "contentFilterState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v150 = self;
      v151 = 2114;
      v152 = (uint64_t)v22;
      _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Show filter view in footer: %{public}@", buf, 0x16u);

    }
  }
  else
  {
    v112 = 0;
  }
  v23 = -[PXPhotosViewModel wantsRenderingStatus](*p_viewModel, "wantsRenderingStatus");
  v24 = MEMORY[0x1E0C809B0];
  v114 = v5;
  v115 = v7;
  if (v23)
  {
    v25 = -[PXFetchResultCountObserver fetchResultCount](self->_renderingCountObserver, "fetchResultCount");
    if (v25 >= 1)
    {
      PXLocalizedAssetCountForUsage(v25, 2, 0, 10);
      v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      PXLocalizedStringFromTable(CFSTR("PXRenderStatus_Render_Now"), CFSTR("PhotosUICore"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = v24;
      aBlock[1] = 3221225472;
      aBlock[2] = __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke;
      aBlock[3] = &unk_1E5149198;
      aBlock[4] = self;
      v28 = _Block_copy(aBlock);
      PLUserStatusUIGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v150 = self;
        v151 = 2114;
        v152 = *(_QWORD *)&v26;
        _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing rendering status: \"%{public}@\", buf, 0x16u);
      }

      v117 = 0;
      *(double *)&v30 = 0.0;
      v109 = 0;
      v111 = 0;
      v104 = 0;
      v106 = 0;
      v102 = 0;
      v103 = 0;
      v99 = 0;
      v100 = 0;
      v31 = -1.0;
      goto LABEL_67;
    }
  }
  if (-[PXPhotosViewModel wantsCPLStatus](*p_viewModel, "wantsCPLStatus"))
  {
    v144 = 0;
    v32 = -[PHPhotoLibrary hasSyncProgressReturningImportOperations:](self->_photoLibrary, "hasSyncProgressReturningImportOperations:", &v144);
    v33 = v32;
    if (v32)
    {
      v34 = v14;
      PLProgressDescription();
      v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      PLAlbumImportOperationDebugDescription();
      v35 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      PLUserStatusUIGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v150 = self;
        v151 = 2114;
        v152 = *(_QWORD *)&v26;
        v153 = 2114;
        v154 = v35;
        _os_log_impl(&dword_1A6789000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing status for import operation: \"%{public}@\" (%{public}@)", buf, 0x20u);
      }

      v14 = v34;
    }
    else
    {
      v26 = 0.0;
    }
    -[PXCPLUIStatusProvider status](self->_cplUIStatusProvider, "status");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v40 = v39;
      if (v14)
      {
        objc_msgSend(v39, "referencedItemsDescription");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v117 = 0;
      }
      v41 = MEMORY[0x1E0C809B0];
      objc_msgSend(v40, "stateDescription");
      v94 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

      objc_msgSend(v40, "failureDescription");
      *(double *)&v30 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      objc_msgSend(v40, "internalInformationMessage");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = objc_msgSend(v40, "isPaused");
      objc_msgSend(v40, "progress");
      v31 = v42;
      objc_msgSend(v40, "actionTitle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "actionConfirmationAlertTitle");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "actionConfirmationAlertSubtitle");
      v43 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "actionConfirmationAlertButtonTitle");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "action");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = v44;
      if (v44)
      {
        v141[0] = v41;
        v141[1] = 3221225472;
        v141[2] = __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke_178;
        v141[3] = &unk_1E5148CE0;
        v143 = v44;
        v142 = v40;
        v96 = _Block_copy(v141);

      }
      else
      {
        v96 = 0;
      }
      if (PXCloudQuotaCanShowInformationView(v40))
      {
        -[PXCloudQuotaControllerHelper informationView](self->_cloudQuotaHelper, "informationView");
        v45 = objc_claimAutoreleasedReturnValue();
        -[PXCloudQuotaControllerHelper premiumInformationView](self->_cloudQuotaHelper, "premiumInformationView");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = (void *)v45;
        v47 = objc_msgSend(v40, "pauseReason") == 2 && v45 != 0;
        v99 = v47;
      }
      else
      {
        v99 = 0;
        v100 = 0;
        v102 = 0;
      }
      v48 = v144;
      v49 = objc_msgSend(v40, "inResetSync");
      v106 = (void *)v43;
      if ((v48 & 0x10) != 0 || v49)
      {
        v118 = (void *)v14;
        v50 = objc_msgSend(v40, "numberOfPhotoAssets");
        v51 = objc_msgSend(v40, "numberOfVideoAssets");
        v52 = objc_msgSend(v40, "numberOfOtherAssets");
        v53 = v50;
        v54 = v51 + v50 + v52;
        if (v54 > v12)
        {
          v55 = v51;
          v56 = v52;
          PLLocalizedCountDescription();
          v93 = objc_claimAutoreleasedReturnValue();

          v31 = (float)v12 / (float)v54;
          PLUserStatusUIGetLog();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            v58 = CFSTR("reset");
            *(_DWORD *)buf = 138544898;
            v150 = self;
            if ((v48 & 0x10) != 0)
              v58 = CFSTR("rebuild");
            v151 = 2114;
            v152 = (uint64_t)v58;
            v153 = 2048;
            v154 = v31;
            v155 = 2048;
            v156 = v53;
            v157 = 2048;
            v158 = v55;
            v159 = 2048;
            v160 = v56;
            v161 = 2114;
            v162 = v114;
            _os_log_impl(&dword_1A6789000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ Cloud counts for <%{public}@, progress:%f>: photos:%lu, videos:%lu, others:%lu [Reason: %{public}@]", buf, 0x48u);
          }

          v14 = v93;
          if ((v48 & 0x10) == 0)
            goto LABEL_58;
LABEL_61:
          PXLocalizedStringFromTable(CFSTR("PXCPLStatus_Rebuild"), CFSTR("PhotosUICore"));
          v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

          PLUserStatusUIGetLog();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v150 = self;
            _os_log_impl(&dword_1A6789000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing rebuild placeholder status title", buf, 0xCu);
          }

          goto LABEL_64;
        }
        v14 = (uint64_t)v118;
        if ((v48 & 0x10) != 0)
          goto LABEL_61;
      }
LABEL_58:
      v26 = v94;
LABEL_64:
      PLUserStatusUIGetLog();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v150 = self;
        v151 = 2114;
        v152 = v14;
        v153 = 2114;
        v154 = v26;
        v155 = 2114;
        v156 = v30;
        _os_log_impl(&dword_1A6789000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@ Did provide CPL status: \"%{public}@\", \"%{public}@\", \"%{public}@\", buf, 0x2Au);
      }

      v28 = v96;
      p_viewModel = &self->_viewModel;
      goto LABEL_67;
    }
    if ((v33 & 1) != 0)
    {
      v117 = 0;
      *(double *)&v30 = 0.0;
      v109 = 0;
      v111 = 0;
      v104 = 0;
      v27 = 0;
      v106 = 0;
      v102 = 0;
      v103 = 0;
      v28 = 0;
      v99 = 0;
      v100 = 0;
      v31 = -1.0;
      p_viewModel = &self->_viewModel;
      goto LABEL_67;
    }
    v37 = v26;
    p_viewModel = &self->_viewModel;
  }
  else
  {
    v37 = 0.0;
  }
  v31 = -1.0;
  if (-[PXCPLPhotoLibrarySource isRebuildingThumbnails](self->_photoLibrarySource, "isRebuildingThumbnails"))
  {
    PXLocalizedStringFromTable(CFSTR("PXCPLStatusRebuildingThumbnails"), CFSTR("PhotosUICore"));
    v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

    PLUserStatusUIGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v150 = self;
      v151 = 2114;
      v152 = v14;
      v153 = 2114;
      v154 = v26;
      v155 = 2114;
      v156 = 0;
      _os_log_impl(&dword_1A6789000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ Did provide thumbnail rebuild status: \"%{public}@\", \"%{public}@\", \"%{public}@\", buf, 0x2Au);
    }

    v117 = 0;
    *(double *)&v30 = 0.0;
    v109 = 0;
    v111 = 0;
    v104 = 0;
    v27 = 0;
    v106 = 0;
    v102 = 0;
    v103 = 0;
    v28 = 0;
    v99 = 0;
    v100 = 0;
  }
  else
  {
    v117 = 0;
    *(double *)&v30 = 0.0;
    v109 = 0;
    v111 = 0;
    v104 = 0;
    v27 = 0;
    v106 = 0;
    v102 = 0;
    v103 = 0;
    v28 = 0;
    v99 = 0;
    v100 = 0;
    v26 = v37;
  }
LABEL_67:
  -[PXPhotosViewModel footerSubtitle](*p_viewModel, "footerSubtitle", v93);
  *(double *)&v61 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  v62 = (void *)v61;
  v119 = (void *)v14;
  v63 = v28;
  if (v14 && *(double *)&v61 != 0.0)
  {
    -[PXPhotosViewModel dataSourceManager](*p_viewModel, "dataSourceManager");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "dataSource");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "containerCollection");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v66, "px_isSharedAlbum"))
    {
      if (v26 == 0.0)
      {
        v67 = 0.0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "handleFailureInMethod:object:file:lineNumber:description:", v107, self, CFSTR("PXPhotosGridFooterStatusController.m"), 334, CFSTR("Shared album subitle1 is not nil!"));

        v67 = v26;
      }
      v26 = *(double *)&v62;
    }
    else
    {
      v67 = *(double *)&v30;
      v30 = (uint64_t)v62;
    }
    v68 = v62;

    PLUserStatusUIGetLog();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v150 = self;
      v151 = 2114;
      v152 = (uint64_t)v68;
      _os_log_impl(&dword_1A6789000, v69, OS_LOG_TYPE_DEFAULT, "%{public}@ Using subtitle from footer view model: \"%{public}@\", buf, 0x16u);
    }

  }
  featureAvailabilityMonitor = self->_featureAvailabilityMonitor;
  v108 = v26;
  if (featureAvailabilityMonitor)
  {
    v71 = off_1E50B3000;
    if (-[PXLemonadeFeatureAvailabilityMonitor state](featureAvailabilityMonitor, "state") == 1)
    {
      v115 = 1;
    }
    else
    {
      +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = objc_msgSend(v72, "forceShowProcessingUI");

    }
  }
  else
  {
    v71 = off_1E50B3000;
  }
  v98 = v62;
  v73 = (void *)v30;
  -[__objc2_class sharedInstance](v71[77], "sharedInstance");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "forceHideProcessingUI");

  v76 = (id *)p_viewModel;
  -[PXPhotosViewModel footerLearnMoreURL](*p_viewModel, "footerLearnMoreURL");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    PXLocalizedStringFromTable(CFSTR("PXStatusLearnMoreActionTitle"), CFSTR("PhotosUICore"));
    v78 = objc_claimAutoreleasedReturnValue();

    v79 = MEMORY[0x1E0C809B0];
    v139[0] = MEMORY[0x1E0C809B0];
    v139[1] = 3221225472;
    v139[2] = __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke_191;
    v139[3] = &unk_1E5149198;
    v140 = v77;
    v80 = _Block_copy(v139);

    v81 = (void *)v78;
  }
  else
  {
    v79 = MEMORY[0x1E0C809B0];
    v80 = v63;
    v81 = v27;
  }
  v82 = v115 & ~v75;
  objc_msgSend(*v76, "footerViewModel");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v79;
  v120[1] = 3221225472;
  v120[2] = __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke_2_192;
  v120[3] = &unk_1E5132408;
  v121 = v119;
  v122 = v117;
  v123 = v108;
  v124 = v73;
  v136 = v104;
  v135 = v31;
  v125 = v111;
  v126 = v81;
  v137 = v77 != 0;
  v127 = v109;
  v128 = v106;
  v116 = v77;
  v129 = v103;
  v130 = v102;
  v133 = v80;
  v134 = v99;
  v131 = v100;
  v132 = v112;
  v138 = v82;
  v105 = v112;
  v101 = v100;
  v83 = v102;
  v84 = v80;
  v85 = v103;
  v86 = v106;
  v113 = v109;
  v110 = v81;
  v87 = v111;
  v88 = v73;
  v89 = *(id *)&v108;
  v90 = v117;
  v91 = v119;
  objc_msgSend(v97, "performChanges:", v120);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  const __CFString *v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;

  v9 = a3;
  if ((void *)PXAssetsDataSourceCountsControllerObserverContext_181114 == a5)
  {
    if ((a4 & 1) != 0)
    {
      v14 = v9;
      v10 = CFSTR("PXAssetsDataSourceCountsController");
      goto LABEL_19;
    }
  }
  else if ((void *)PXCPLUIStatusProviderObservationContext_181115 == a5)
  {
    if ((a4 & 0x3FF) != 0)
    {
      v14 = v9;
      v10 = CFSTR("PXCPLUIStatusProvider");
      goto LABEL_19;
    }
  }
  else if ((void *)PXLemonadeFeatureAvailabilityMonitorObservationContext_181116 == a5)
  {
    v14 = v9;
    v11 = (+[PXLemonadeFeatureAvailabilityMonitor stateChangedChangeDescriptor](PXLemonadeFeatureAvailabilityMonitor, "stateChangedChangeDescriptor") & a4) == 0;
    v9 = v14;
    if (!v11)
    {
      v10 = CFSTR("PXLemonadeFeatureAvailabilityMonitor");
      goto LABEL_19;
    }
  }
  else if ((void *)PXPhotosViewModelObserverContext_181118 == a5)
  {
    if ((a4 & 0x2000000) != 0)
    {
      v14 = v9;
      -[PXPhotosViewModel contentFilterState](self->_viewModel, "contentFilterState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFilterFooterController setContentFilterState:](self->_filterFooterController, "setContentFilterState:", v12);

      v10 = CFSTR("PXPhotosViewModel");
      goto LABEL_19;
    }
  }
  else if ((void *)PXLibraryFilterStateObservationContext_181119 == a5)
  {
    if ((a4 & 1) != 0)
    {
      v14 = v9;
      v10 = CFSTR("PXLibraryFilterState");
      goto LABEL_19;
    }
  }
  else
  {
    if ((void *)PXCPLPhotoLibrarySourceObservationContext_181120 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridFooterStatusController.m"), 424, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((a4 & 8) != 0)
    {
      v14 = v9;
      v10 = CFSTR("PXCPLPhotoLibrarySource");
LABEL_19:
      -[PXPhotosGridFooterStatusController _updateFooterViewModelWithReason:](self, "_updateFooterViewModelWithReason:", v10);
      v9 = v14;
    }
  }

}

- (void)cloudQuotaControllerHelper:(id)a3 informationViewDidChange:(id)a4
{
  -[PXPhotosGridFooterStatusController _updateHasImportantInformation](self, "_updateHasImportantInformation", a3, a4);
  -[PXPhotosGridFooterStatusController _updateFooterViewModelWithReason:](self, "_updateFooterViewModelWithReason:", CFSTR("PXCloudQuotaControllerHelper"));
}

- (id)presentingViewControllerForCloudQuotaControllerHelper:(id)a3
{
  void *v4;
  void *v5;

  -[PXPhotosGridFooterStatusController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerForFooterStatusController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)fetchResultCountObserver:(id)a3 didChangeFetchResultCount:(int64_t)a4
{
  -[PXPhotosGridFooterStatusController _updateHasImportantInformation](self, "_updateHasImportantInformation", a3, a4);
  -[PXPhotosGridFooterStatusController _updateFooterViewModelWithReason:](self, "_updateFooterViewModelWithReason:", CFSTR("PXFetchResultCountObserver"));
}

- (BOOL)assetsSharingHelper:(id)a3 presentViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[PXPhotosGridFooterStatusController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewControllerForFooterStatusController:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "presentViewController:animated:completion:", v5, 1, 0);
  return v5 != 0;
}

- (BOOL)assetsSharingHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  -[PXPhotosGridFooterStatusController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentingViewControllerForFooterStatusController:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "presentedViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v8)
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, v7);

  return v11 == v8;
}

- (PXPhotosGridFooterStatusControllerDelegate)delegate
{
  return (PXPhotosGridFooterStatusControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_renderingCountObserver, 0);
  objc_storeStrong((id *)&self->_filterFooterController, 0);
  objc_storeStrong((id *)&self->_cloudQuotaHelper, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityMonitor, 0);
  objc_storeStrong((id *)&self->_cplUIStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrarySource, 0);
  objc_storeStrong((id *)&self->_countsController, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  PXCreateDefaultAssetSharingHelper(*(void **)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "fetchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ensureLocalAssetsForRendering:completion:", v3, &__block_literal_global_181164);

}

uint64_t __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke_178(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke_191(uint64_t a1)
{
  PXOpenURL(*(void **)(a1 + 32), 0);
}

void __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke_2_192(uint64_t a1, void *a2)
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
  objc_msgSend(v5, "setIsPaused:", *(unsigned __int8 *)(a1 + 148));
  LODWORD(v4) = *(_DWORD *)(a1 + 144);
  objc_msgSend(v5, "setProgress:", v4);
  objc_msgSend(v5, "setActionTitle:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v5, "setUseBlankActionSeparator:", *(unsigned __int8 *)(a1 + 149));
  objc_msgSend(v5, "setActionConfirmationAlertTitle:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v5, "setActionConfirmationAlertSubtitle:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v5, "setActionConfirmationAlertButtonTitle:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v5, "setAction:", *(_QWORD *)(a1 + 128));
  objc_msgSend(v5, "setAccessoryView:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v5, "setTopAccessoryView:", *(_QWORD *)(a1 + 112));
  objc_msgSend(v5, "setSubtitle1Style:", *(_QWORD *)(a1 + 136));
  objc_msgSend(v5, "setFilterView:", *(_QWORD *)(a1 + 120));
  objc_msgSend(v5, "setIsProcessing:", *(unsigned __int8 *)(a1 + 150));

}

uint64_t __68__PXPhotosGridFooterStatusController__updateHasImportantInformation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFooterHasImportantInformation:", *(unsigned __int8 *)(a1 + 32));
}

id __78__PXPhotosGridFooterStatusController_initWithViewModel_itemsCountsController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != 0"), CFSTR("deferredProcessingNeeded"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInternalPredicate:", v3);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", *(_QWORD *)(a1 + 40), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
