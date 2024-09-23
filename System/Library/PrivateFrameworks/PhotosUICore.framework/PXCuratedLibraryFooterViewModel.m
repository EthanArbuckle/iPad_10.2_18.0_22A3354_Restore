@implementation PXCuratedLibraryFooterViewModel

- (PXCuratedLibraryFooterViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryFooterViewModel.m"), 126, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryFooterViewModel init]");

  abort();
}

- (PXCuratedLibraryFooterViewModel)initWithItemCountsController:(id)a3 cplUIStatusProvider:(id)a4 analysisStatus:(id)a5 mode:(int64_t)a6 viewModel:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PXCuratedLibraryFooterViewModel *v17;
  uint64_t v18;
  PHPhotoLibrary *photoLibrary;
  void *v20;
  uint64_t v21;
  PXLemonadeFeatureAvailabilityMonitor *featureAvailabilityMonitor;
  void *v23;
  uint64_t v24;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  uint64_t v26;
  PXLibraryFilterState *libraryFilterState;
  PXCPLPhotoLibrarySource *v28;
  PXCPLPhotoLibrarySource *photoLibrarySource;
  PXCloudQuotaControllerHelper *v30;
  PXCloudQuotaControllerHelper *cloudQuotaHelper;
  void *v32;
  int v33;
  PXFilterFooterController *v34;
  void *v35;
  uint64_t v36;
  PXFilterFooterController *filterFooterController;
  void *v38;
  uint64_t v39;
  PXFooterSettings *settings;
  int64_t v42;
  objc_super v43;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v43.receiver = self;
  v43.super_class = (Class)PXCuratedLibraryFooterViewModel;
  v17 = -[PXFooterViewModel init](&v43, sel_init);
  if (v17)
  {
    v42 = a6;
    objc_msgSend(v16, "photoLibrary");
    v18 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v17->_photoLibrary;
    v17->_photoLibrary = (PHPhotoLibrary *)v18;

    objc_msgSend(v16, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "featureAvailabilityMonitor");
    v21 = objc_claimAutoreleasedReturnValue();
    featureAvailabilityMonitor = v17->_featureAvailabilityMonitor;
    v17->_featureAvailabilityMonitor = (PXLemonadeFeatureAvailabilityMonitor *)v21;

    -[PXLemonadeFeatureAvailabilityMonitor observable](v17->_featureAvailabilityMonitor, "observable");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "registerChangeObserver:context:", v17, PXLemonadeFeatureAvailabilityMonitorObservationContext);

    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v17->_photoLibrary);
    v24 = objc_claimAutoreleasedReturnValue();
    sharedLibraryStatusProvider = v17->_sharedLibraryStatusProvider;
    v17->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v24;

    -[PXSharedLibraryStatusProvider registerChangeObserver:context:](v17->_sharedLibraryStatusProvider, "registerChangeObserver:context:", v17, PXSharedLibraryStatusProviderObservationContext_91193);
    objc_msgSend(v16, "libraryFilterState");
    v26 = objc_claimAutoreleasedReturnValue();
    libraryFilterState = v17->_libraryFilterState;
    v17->_libraryFilterState = (PXLibraryFilterState *)v26;

    -[PXLibraryFilterState registerChangeObserver:context:](v17->_libraryFilterState, "registerChangeObserver:context:", v17, PXLibraryFilterStateObservationContext_91195);
    objc_storeStrong((id *)&v17->_itemCountsController, a3);
    -[PXAssetsDataSourceCountsController prepareCountsIfNeeded](v17->_itemCountsController, "prepareCountsIfNeeded");
    -[PXAssetsDataSourceCountsController registerChangeObserver:context:](v17->_itemCountsController, "registerChangeObserver:context:", v17, CuratedLibraryItemCountsControllerObserverContext);
    objc_storeStrong((id *)&v17->_cplUIStatusProvider, a4);
    -[PXCPLUIStatusProvider registerChangeObserver:context:](v17->_cplUIStatusProvider, "registerChangeObserver:context:", v17, PXCPLUIStatusProviderObserverContext);
    v28 = -[PXCPLPhotoLibrarySource initWithPhotoLibrary:]([PXCPLPhotoLibrarySource alloc], "initWithPhotoLibrary:", v17->_photoLibrary);
    photoLibrarySource = v17->_photoLibrarySource;
    v17->_photoLibrarySource = v28;

    -[PXCPLPhotoLibrarySource registerChangeObserver:context:](v17->_photoLibrarySource, "registerChangeObserver:context:", v17, PXCPLPhotoLibrarySourceObservationContext_91197);
    v30 = objc_alloc_init(PXCloudQuotaControllerHelper);
    cloudQuotaHelper = v17->_cloudQuotaHelper;
    v17->_cloudQuotaHelper = v30;

    -[PXCloudQuotaControllerHelper setDelegate:](v17->_cloudQuotaHelper, "setDelegate:", v17);
    +[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "showFilterView");

    if (v33)
    {
      objc_storeStrong((id *)&v17->_curatedLibraryViewModel, a7);
      v34 = [PXFilterFooterController alloc];
      objc_msgSend(v16, "actionManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[PXFilterFooterController initWithActionManager:photoLibrary:](v34, "initWithActionManager:photoLibrary:", v35, v17->_photoLibrary);
      filterFooterController = v17->_filterFooterController;
      v17->_filterFooterController = (PXFilterFooterController *)v36;

      -[PXFilterFooterController setSharedLibraryStatusProvider:](v17->_filterFooterController, "setSharedLibraryStatusProvider:", v17->_sharedLibraryStatusProvider);
      -[PXFilterFooterController setLibraryFilterState:](v17->_filterFooterController, "setLibraryFilterState:", v17->_libraryFilterState);
      -[PXCuratedLibraryViewModel currentContentFilterState](v17->_curatedLibraryViewModel, "currentContentFilterState");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFilterFooterController setContentFilterState:](v17->_filterFooterController, "setContentFilterState:", v38);

      objc_msgSend(v16, "registerChangeObserver:context:", v17, PXCuratedLibraryViewModelObserverContext_91191);
    }
    objc_storeStrong((id *)&v17->_analysisStatus, a5);
    -[PXCuratedLibraryAnalysisStatus registerChangeObserver:context:](v17->_analysisStatus, "registerChangeObserver:context:", v17, CuratedLibraryAnalysisStatusObserverContext);
    v17->_mode = v42;
    +[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance");
    v39 = objc_claimAutoreleasedReturnValue();
    settings = v17->_settings;
    v17->_settings = (PXFooterSettings *)v39;

    -[PXSettings addDeferredKeyObserver:](v17->_settings, "addDeferredKeyObserver:", v17);
    -[PXCuratedLibraryFooterViewModel _updateExposedPropertiesForReason:](v17, "_updateExposedPropertiesForReason:", CFSTR("<initial>"));
    -[PXCuratedLibraryFooterViewModel _updateHasImportantInformation](v17, "_updateHasImportantInformation");
  }

  return v17;
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[PXCuratedLibraryFooterViewModel _updateExposedPropertiesForReason:](self, "_updateExposedPropertiesForReason:", CFSTR("PXCuratedLibraryFooterViewModelMode"));
    -[PXCuratedLibraryFooterViewModel _updateHasImportantInformation](self, "_updateHasImportantInformation");
  }
}

- (void)didShowFooter
{
  -[PXCuratedLibraryFooterViewModel setIsFooterShown:](self, "setIsFooterShown:", 1);
}

- (void)didHideFooter
{
  int64_t v3;
  int64_t v4;
  id v5;

  -[PXCuratedLibraryFooterViewModel setIsFooterShown:](self, "setIsFooterShown:", 0);
  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PXFooterViewModel animatedIconMode](self, "animatedIconMode");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v5, "setDidShowCurationFooter:", MEMORY[0x1E0C9AAB0]);
    if (v4 == 3)
    {
      objc_msgSend(v5, "setDidShowCompletedCurationFooterAnimation:", MEMORY[0x1E0C9AAB0]);
      -[PXCuratedLibraryFooterViewModel _updateExposedPropertiesForReason:](self, "_updateExposedPropertiesForReason:", CFSTR("DidShowCompletedCurationFooterAnimation"));
    }
  }

}

- (void)setIsFooterShown:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_isFooterShown != a3)
  {
    v3 = a3;
    self->_isFooterShown = a3;
    if (!-[PXCuratedLibraryFooterViewModel shouldAlternateTitleWithAnimatedGridCycle](self, "shouldAlternateTitleWithAnimatedGridCycle"))
    {
      -[PXCuratedLibraryFooterViewModel analysisStatus](self, "analysisStatus");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v3)
        objc_msgSend(v5, "startCyclingThroughAlternateTitles");
      else
        objc_msgSend(v5, "stopCyclingThroughAlternateTitles");

    }
  }
}

- (void)footerAnimationCrossedGridCycleBoundary
{
  void *v3;
  int64_t v4;
  double v5;
  dispatch_time_t v6;
  _QWORD block[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryFooterViewModel;
  -[PXFooterViewModel footerAnimationCrossedGridCycleBoundary](&v8, sel_footerAnimationCrossedGridCycleBoundary);
  -[PXCuratedLibraryFooterViewModel settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXCuratedLibraryFooterViewModel shouldAlternateTitleWithAnimatedGridCycle](self, "shouldAlternateTitleWithAnimatedGridCycle"))
  {
    v4 = self->_animatedGridCycleIndex + 1;
    self->_animatedGridCycleIndex = v4;
    if (!(v4 % objc_msgSend(v3, "alternateTitleGridCycleCount")))
    {
      objc_msgSend(v3, "alternateTitleGridCycleDelay");
      v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__PXCuratedLibraryFooterViewModel_footerAnimationCrossedGridCycleBoundary__block_invoke;
      block[3] = &unk_1E5149198;
      block[4] = self;
      dispatch_after(v6, MEMORY[0x1E0C80D38], block);
    }
  }

}

- (BOOL)shouldAlternateTitleWithAnimatedGridCycle
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  char v8;

  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didShowCompletedCurationFooterAnimation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
    return 0;
  -[PXCuratedLibraryFooterViewModel settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldAlternateTitleWithGridCycle");

  return v8;
}

- (void)_updateHasImportantInformation
{
  void *v3;
  BOOL v4;
  int64_t v5;
  char v6;
  void *v7;
  char v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  char v19;

  -[PXCPLUIStatusProvider status](self->_cplUIStatusProvider, "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (PXCPLUIStatusHasImportantInformation(v3))
  {
    -[PXCuratedLibraryFooterViewModel mode](self, "mode");
LABEL_4:
    v6 = 1;
    goto LABEL_5;
  }
  v4 = -[PXCloudQuotaControllerHelper hasAnyInformationViews](self->_cloudQuotaHelper, "hasAnyInformationViews");
  v5 = -[PXCuratedLibraryFooterViewModel mode](self, "mode");
  if (v4)
    goto LABEL_4;
  v9 = v5;
  if ((unint64_t)(v5 - 1) > 1)
  {
    v6 = 0;
  }
  else
  {
    +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didShowCurationFooter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "BOOLValue") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v12 = (void *)objc_opt_class();
      -[PXCuratedLibraryFooterViewModel analysisStatus](self, "analysisStatus");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v12, "hasAnalysisProgressForMode:analysisStatus:cplUIStatus:userDefaults:outAnimatedIconMode:outProgress:outTitle:outDescription:", v9, v13, v3, v14, 0, 0, 0, 0);

    }
    objc_msgSend(v10, "didShowCompletedCurationFooterAnimation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "BOOLValue") & 1) == 0)
    {
      -[PXCuratedLibraryFooterViewModel analysisStatus](self, "analysisStatus");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "state");

      if (v17 == 1)
        v6 = 1;
    }

  }
LABEL_5:
  +[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "simulateImportantInformation");

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__PXCuratedLibraryFooterViewModel__updateHasImportantInformation__block_invoke;
  v18[3] = &__block_descriptor_33_e36_v16__0___PXMutableFooterViewModel__8l;
  v19 = v8 | v6;
  -[PXFooterViewModel performChanges:](self, "performChanges:", v18);

}

- (void)_updateExposedPropertiesForReason:(id)a3
{
  PXCuratedLibraryFooterViewModel *v3;
  PXCPLUIStatusProvider *cplUIStatusProvider;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  int v31;
  PXCuratedLibraryFooterViewModel *v32;
  void *v33;
  void *v34;
  char v35;
  char v36;
  uint64_t v37;
  double v38;
  float v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  _BOOL8 v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  char v55;
  char v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  PXCuratedLibraryFooterViewModel *v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  PXCuratedLibraryFooterViewModel *v74;
  _BOOL8 v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  PXCuratedLibraryFooterViewModel *v89;
  uint64_t v90;
  id v91;
  void *v92;
  _QWORD v93[4];
  id v94;
  PXCuratedLibraryFooterViewModel *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  uint64_t v107;
  _BOOL8 v108;
  float v109;
  char v110;
  char v111;
  _QWORD aBlock[4];
  id v113;
  NSObject *v114;
  id v115;
  id v116;
  uint64_t v117;
  int v118;
  id v119;
  int v120;
  float v121;
  uint8_t buf[4];
  PXCuratedLibraryFooterViewModel *v123;
  __int16 v124;
  id v125;
  __int16 v126;
  id v127;
  __int16 v128;
  void *v129;
  uint64_t v130;

  v3 = self;
  v130 = *MEMORY[0x1E0C80C00];
  v121 = -1.0;
  cplUIStatusProvider = self->_cplUIStatusProvider;
  v5 = a3;
  -[PXCPLUIStatusProvider status](cplUIStatusProvider, "status");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (PXCloudQuotaCanShowInformationView(v6))
  {
    -[PXCloudQuotaControllerHelper informationView](v3->_cloudQuotaHelper, "informationView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCloudQuotaControllerHelper premiumInformationView](v3->_cloudQuotaHelper, "premiumInformationView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v83 = 0;
    v86 = 0;
  }
  v7 = -[PXCuratedLibraryFooterViewModel mode](v3, "mode");
  -[PXCuratedLibraryFooterViewModel itemCountsController](v3, "itemCountsController");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryFooterViewModel analysisStatus](v3, "analysisStatus");
  v8 = objc_claimAutoreleasedReturnValue();
  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v9 = objc_claimAutoreleasedReturnValue();
  v120 = 0;
  -[PXCuratedLibraryFooterViewModel photoLibrary](v3, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasSyncProgressReturningImportOperations:", &v120);

  if (v11)
  {
    PLProgressDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PLAlbumImportOperationDebugDescription();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PLUserStatusUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v123 = v3;
      v124 = 2114;
      v125 = v12;
      v126 = 2114;
      v127 = v13;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing status for import operation: \"%{public}@\" (%{public}@)", buf, 0x20u);
    }

  }
  else
  {
    v12 = 0;
  }
  v119 = 0;
  LOBYTE(v67) = (v120 & 0x10) != 0;
  objc_msgSend((id)objc_opt_class(), "_titleWithOptionalDescription:progress:forMode:itemCountsController:analysisStatus:cplUIStatus:inRebuild:reason:", &v119, &v121, v7, v88, v8, v6, v67, v5);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v119;
  v16 = v15;
  if (v15)
  {
    v17 = v15;

    v12 = v17;
  }
  *(float *)&v118 = -1.0;
  v117 = 0;
  v81 = (void *)v9;
  if ((v11 & 1) != 0)
  {
    v90 = 0;
    v78 = 0;
    v79 = 0;
    LOBYTE(v18) = 1;
  }
  else
  {
    v115 = 0;
    v116 = 0;
    LODWORD(v18) = objc_msgSend((id)objc_opt_class(), "hasAnalysisProgressForMode:analysisStatus:cplUIStatus:userDefaults:outAnimatedIconMode:outProgress:outTitle:outDescription:", v7, v8, v6, v9, &v117, &v118, &v116, &v115);
    v19 = v116;
    v20 = v115;
    v21 = v20;
    if ((_DWORD)v18)
    {
      if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
      {
        v78 = v21;
        v79 = v19;
        v90 = 0;
        LOBYTE(v18) = 0;
      }
      else
      {
        v22 = v19;

        v23 = v21;
        v121 = *(float *)&v118;
        v90 = v117;
        PLUserStatusUIGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v123 = v3;
          v124 = 2114;
          v125 = v22;
          v126 = 2114;
          v127 = v23;
          _os_log_impl(&dword_1A6789000, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Did provide analysis status: \"%{public}@\", \"%{public}@\", buf, 0x20u);
        }

        LOBYTE(v18) = 1;
        v78 = v23;
        v79 = v22;
        v12 = v23;
        v92 = v22;
      }
    }
    else
    {
      v78 = v20;
      v79 = v19;
      v90 = 0;
    }
  }
  +[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "showFilterView");

  v85 = (void *)v8;
  if (v25)
  {
    -[PXFilterFooterController view](v3->_filterFooterController, "view");
    v26 = objc_claimAutoreleasedReturnValue();
    -[PXFilterFooterController contentFilterState](v3->_filterFooterController, "contentFilterState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (void *)v26;
    if (v26)
    {
      PLUserStatusUIGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v123 = v3;
        v124 = 2114;
        v125 = v27;
        _os_log_impl(&dword_1A6789000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ Show filter view in footer: %{public}@", buf, 0x16u);
      }

    }
    if ((v18 & 1) != 0)
      LOBYTE(v18) = 1;
    else
      LOBYTE(v18) = objc_msgSend(v27, "isFiltering");

  }
  else
  {
    v77 = 0;
  }
  v29 = MEMORY[0x1E0C809B0];
  v89 = v3;
  v80 = v16;
  if (!v6 || (v18 & 1) != 0)
  {
    if ((v18 & 1) != 0)
      goto LABEL_64;
    +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v33, "forceShowProcessingUI") & 1) != 0
      || -[PXLemonadeFeatureAvailabilityMonitor state](v3->_featureAvailabilityMonitor, "state") == 1)
    {

      if (v7)
      {

        v121 = -1.0;
        v12 = 0;
        v32 = 0;
        v34 = 0;
        v72 = 0;
        v73 = 0;
        v35 = 0;
        v70 = 0;
        v71 = 0;
        v68 = 0;
        v69 = 0;
        v75 = 0;
        v83 = 0;
        v86 = 0;
        v92 = 0;
        v36 = 1;
        goto LABEL_71;
      }
    }
    else
    {

    }
    if (!-[PXCPLPhotoLibrarySource isRebuildingThumbnails](v3->_photoLibrarySource, "isRebuildingThumbnails"))
    {
LABEL_64:
      v75 = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v35 = 0;
      v34 = 0;
      v32 = 0;
      goto LABEL_70;
    }
    PXLocalizedStringFromTable(CFSTR("PXCPLStatusRebuildingThumbnails"), CFSTR("PhotosUICore"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    PLUserStatusUIGetLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v123 = v89;
      v124 = 2114;
      v125 = v92;
      v126 = 2114;
      v127 = v42;
      v128 = 2114;
      v129 = 0;
      _os_log_impl(&dword_1A6789000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ Did provide thumbnail rebuild status: \"%{public}@\", \"%{public}@\", \"%{public}@\", buf, 0x2Au);
    }
    v75 = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v35 = 0;
    v34 = 0;
    v32 = 0;
  }
  else
  {
    objc_msgSend(v85, "localizedTitle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v92, "isEqualToString:", v30);

    if (v31)
    {

      v92 = 0;
    }
    if (v7)
    {
      v32 = 0;
    }
    else
    {
      objc_msgSend(v6, "referencedItemsDescription");
      v32 = (PXCuratedLibraryFooterViewModel *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "stateDescription");
    v37 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "failureDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "internalInformationMessage");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v6, "isPaused");
    *(float *)&v38 = v121;
    if (v121 == -1.0)
    {
      objc_msgSend(v6, "progress", v38);
      v121 = v39;
    }
    objc_msgSend(v6, "actionTitle");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionConfirmationAlertTitle");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionConfirmationAlertSubtitle");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionConfirmationAlertButtonTitle");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "action");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v40)
    {
      aBlock[0] = v29;
      aBlock[1] = 3221225472;
      aBlock[2] = __69__PXCuratedLibraryFooterViewModel__updateExposedPropertiesForReason___block_invoke;
      aBlock[3] = &unk_1E5148CE0;
      v114 = v40;
      v113 = v6;
      v68 = _Block_copy(aBlock);

    }
    else
    {
      v68 = 0;
    }
    v42 = (void *)v37;
    v44 = objc_msgSend(v6, "pauseReason") == 2 && v86 != 0;
    v75 = v44;
    if (v7 == 2)
    {
      v45 = v92;
      if (!v92 && !v32 && (PXCPLUIStatusHasImportantInformation(v6) & 1) == 0)
      {
        objc_msgSend(v6, "actionTitle");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v46)
        {

          v34 = 0;
          v42 = 0;
          v121 = -1.0;
        }
      }
    }
    else
    {
      v45 = v92;
    }
    PLUserStatusUIGetLog();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v123 = v89;
      v124 = 2114;
      v125 = v45;
      v126 = 2114;
      v127 = v42;
      v128 = 2114;
      v129 = v34;
      _os_log_impl(&dword_1A6789000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ Did provide CPL status: \"%{public}@\", \"%{public}@\", \"%{public}@\", buf, 0x2Au);
    }

  }
  v12 = v42;
  v3 = v89;
LABEL_70:
  v36 = 0;
  if (!v90)
  {
LABEL_71:
    PXLocalizedStringFromTable(CFSTR("PXCuratedLibraryFooterCuratedLibraryCurationCompleteTitle"), CFSTR("PhotosUICore"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v92, "isEqualToString:", v48))
    {
      v49 = v6;
      v50 = objc_msgSend(v12, "length");

      if (v50)
      {
        v90 = 0;
        v6 = v49;
        v3 = v89;
        goto LABEL_78;
      }
      PLUserStatusUIGetLog();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v123 = v89;
        _os_log_impl(&dword_1A6789000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ Special case: Erasing curation specific title", buf, 0xCu);
      }

      v48 = v92;
      v92 = 0;
      v6 = v49;
      v3 = v89;
    }

    v90 = 0;
  }
LABEL_78:
  v82 = v6;
  if (v32 && !v92)
  {
    PXAssertGetLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v123 = v32;
      _os_log_error_impl(&dword_1A6789000, v52, OS_LOG_TYPE_ERROR, "Ignoring extended title because there's no title: \"%@\", buf, 0xCu);
    }

    PLUserStatusUIGetLog();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v123 = v3;
      _os_log_impl(&dword_1A6789000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ Special case: Erasing extended title because there's no title", buf, 0xCu);
    }

    v32 = 0;
  }
  v74 = v32;
  +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "forceHideProcessingUI");

  v93[0] = MEMORY[0x1E0C809B0];
  v56 = v36 & (v55 ^ 1);
  v93[1] = 3221225472;
  v93[2] = __69__PXCuratedLibraryFooterViewModel__updateExposedPropertiesForReason___block_invoke_164;
  v93[3] = &unk_1E5124BB0;
  v94 = v92;
  v95 = v32;
  v96 = v77;
  v97 = v12;
  v57 = v12;
  v98 = v34;
  v99 = v73;
  v110 = v35;
  v109 = v121;
  v100 = v72;
  v101 = v71;
  v102 = v70;
  v103 = v69;
  v106 = v68;
  v107 = v90;
  v104 = v86;
  v105 = v83;
  v108 = v75;
  v111 = v56;
  v76 = v83;
  v91 = v86;
  v58 = v68;
  v87 = v69;
  v59 = v70;
  v84 = v71;
  v60 = v72;
  v61 = v73;
  v62 = v34;
  v63 = v57;
  v64 = v77;
  v65 = v74;
  v66 = v92;
  -[PXFooterViewModel performChanges:](v89, "performChanges:", v93);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v9 = a3;
  if ((void *)CuratedLibraryItemCountsControllerObserverContext == a5)
  {
    if ((v6 & 1) != 0)
    {
      v10 = CFSTR("PXAssetsDataSourceCountsController");
      goto LABEL_13;
    }
  }
  else
  {
    if ((void *)CuratedLibraryAnalysisStatusObserverContext == a5)
    {
      v10 = CFSTR("PXCuratedLibraryAnalysisStatus");
      goto LABEL_13;
    }
    if ((void *)PXCPLUIStatusProviderObserverContext == a5)
    {
      v15 = v9;
      -[PXCuratedLibraryFooterViewModel _updateExposedPropertiesForReason:](self, "_updateExposedPropertiesForReason:", CFSTR("PXCPLUIStatusProvider"));
      -[PXCuratedLibraryFooterViewModel _updateHasImportantInformation](self, "_updateHasImportantInformation");
      goto LABEL_16;
    }
    if ((void *)PXCuratedLibraryViewModelObserverContext_91191 == a5)
    {
      if ((v6 & 0x2000000) == 0)
        goto LABEL_17;
      v15 = v9;
      -[PXCuratedLibraryViewModel currentContentFilterState](self->_curatedLibraryViewModel, "currentContentFilterState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFilterFooterController setContentFilterState:](self->_filterFooterController, "setContentFilterState:", v11);

      v10 = CFSTR("PXCuratedLibraryViewModel");
      goto LABEL_14;
    }
    if ((void *)PXSharedLibraryStatusProviderObservationContext_91193 == a5)
    {
      if ((v6 & 3) == 0)
        goto LABEL_17;
      v15 = v9;
      -[PXCuratedLibraryFooterViewModel sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFilterFooterController setSharedLibraryStatusProvider:](self->_filterFooterController, "setSharedLibraryStatusProvider:", v12);

      v10 = CFSTR("PXSharedLibraryStatusProvider");
      goto LABEL_14;
    }
    if ((void *)PXLibraryFilterStateObservationContext_91195 == a5)
    {
      if ((v6 & 1) == 0)
        goto LABEL_17;
      v15 = v9;
      -[PXCuratedLibraryFooterViewModel libraryFilterState](self, "libraryFilterState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFilterFooterController setLibraryFilterState:](self->_filterFooterController, "setLibraryFilterState:", v13);

      v10 = CFSTR("PXLibraryFilterState");
      goto LABEL_14;
    }
    if ((void *)PXCPLPhotoLibrarySourceObservationContext_91197 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryFooterViewModel.m"), 634, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 8) != 0)
    {
      v10 = CFSTR("PXCPLPhotoLibrarySource");
LABEL_13:
      v15 = v9;
LABEL_14:
      -[PXCuratedLibraryFooterViewModel _updateExposedPropertiesForReason:](self, "_updateExposedPropertiesForReason:", v10);
LABEL_16:
      v9 = v15;
    }
  }
LABEL_17:

}

- (void)cloudQuotaControllerHelper:(id)a3 informationViewDidChange:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__PXCuratedLibraryFooterViewModel_cloudQuotaControllerHelper_informationViewDidChange___block_invoke;
  v4[3] = &unk_1E5124BD8;
  v4[4] = self;
  -[PXFooterViewModel performChanges:](self, "performChanges:", v4, a4);
}

- (id)presentingViewControllerForCloudQuotaControllerHelper:(id)a3
{
  void *v4;
  void *v5;

  -[PXCuratedLibraryFooterViewModel presentingDelegate](self, "presentingDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerForFooterViewModel:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("simulateAnimatedIconMode")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("simulatedAnimatedIconMode")))
  {
    -[PXCuratedLibraryFooterViewModel _updateExposedPropertiesForReason:](self, "_updateExposedPropertiesForReason:", CFSTR("SimulateAnimatedIconMode"));
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("simulateImportantInformation")))
    -[PXCuratedLibraryFooterViewModel _updateHasImportantInformation](self, "_updateHasImportantInformation");

}

- (PXCuratedLibraryFooterViewModelPresentationDelegate)presentingDelegate
{
  return (PXCuratedLibraryFooterViewModelPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentingDelegate);
}

- (void)setPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentingDelegate, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (PXCuratedLibraryAnalysisStatus)analysisStatus
{
  return self->_analysisStatus;
}

- (PXAssetsDataSourceCountsController)itemCountsController
{
  return self->_itemCountsController;
}

- (PXFooterSettings)settings
{
  return self->_settings;
}

- (BOOL)isFooterShown
{
  return self->_isFooterShown;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXLemonadeFeatureAvailabilityMonitor)featureAvailabilityMonitor
{
  return self->_featureAvailabilityMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureAvailabilityMonitor, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_itemCountsController, 0);
  objc_storeStrong((id *)&self->_analysisStatus, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_storeStrong((id *)&self->_filterFooterController, 0);
  objc_storeStrong((id *)&self->_curatedLibraryViewModel, 0);
  objc_storeStrong((id *)&self->_cloudQuotaHelper, 0);
  objc_storeStrong((id *)&self->_cplUIStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrarySource, 0);
}

uint64_t __87__PXCuratedLibraryFooterViewModel_cloudQuotaControllerHelper_informationViewDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateExposedPropertiesForReason:", CFSTR("PXCloudQuotaControllerHelper"));
  return objc_msgSend(*(id *)(a1 + 32), "_updateHasImportantInformation");
}

uint64_t __69__PXCuratedLibraryFooterViewModel__updateExposedPropertiesForReason___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __69__PXCuratedLibraryFooterViewModel__updateExposedPropertiesForReason___block_invoke_164(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 136);
  v5 = a2;
  objc_msgSend(v5, "setAnimatedIconMode:", v3);
  objc_msgSend(v5, "setTitle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setExtendedTitle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setFilterView:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setSubtitle1:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v5, "setSubtitle2:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v5, "setInternalMessageSubtitle:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v5, "setIsPaused:", *(unsigned __int8 *)(a1 + 156));
  LODWORD(v4) = *(_DWORD *)(a1 + 152);
  objc_msgSend(v5, "setProgress:", v4);
  objc_msgSend(v5, "setActionTitle:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v5, "setActionConfirmationAlertTitle:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v5, "setActionConfirmationAlertSubtitle:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v5, "setActionConfirmationAlertButtonTitle:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v5, "setAction:", *(_QWORD *)(a1 + 128));
  objc_msgSend(v5, "setAccessoryView:", *(_QWORD *)(a1 + 112));
  objc_msgSend(v5, "setTopAccessoryView:", *(_QWORD *)(a1 + 120));
  objc_msgSend(v5, "setSubtitle1Style:", *(_QWORD *)(a1 + 144));
  objc_msgSend(v5, "setIsProcessing:", *(unsigned __int8 *)(a1 + 157));

}

uint64_t __65__PXCuratedLibraryFooterViewModel__updateHasImportantInformation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHasImportantInformation:", *(unsigned __int8 *)(a1 + 32));
}

void __74__PXCuratedLibraryFooterViewModel_footerAnimationCrossedGridCycleBoundary__block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isFooterShown"))
  {
    objc_msgSend(*(id *)(a1 + 32), "analysisStatus");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cycleToNextAlternateTitle");

  }
}

+ (id)_titleWithOptionalDescription:(id *)a3 progress:(float *)a4 forMode:(int64_t)a5 itemCountsController:(id)a6 analysisStatus:(id)a7 cplUIStatus:(id)a8 inRebuild:(BOOL)a9 reason:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  float v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  float v28;
  NSObject *v30;
  const __CFString *v31;
  const char *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  double v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a10;
  v20 = -1.0;
  if ((unint64_t)(a5 - 1) < 2)
  {
    objc_msgSend(v17, "localizedTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_16;
LABEL_15:
    *a3 = objc_retainAutorelease(v22);
    goto LABEL_16;
  }
  if (!a5)
  {
    if (v16)
      objc_msgSend(v16, "counts");
    v23 = objc_msgSend(v18, "inResetSync");
    v22 = 0;
    if (v18 && a9 | v23)
    {
      v24 = objc_msgSend(v18, "numberOfPhotoAssets", 0);
      v25 = objc_msgSend(v18, "numberOfVideoAssets");
      v26 = objc_msgSend(v18, "numberOfOtherAssets");
      v27 = v25 + v24 + v26;
      if (v27 && v27 > v33)
      {
        v34 = v24;
        v35 = v25;
        v36 = v26;
        v28 = (float)v27;
        if (a9)
        {
          PXLocalizedStringFromTable(CFSTR("PXCPLStatus_Rebuild"), CFSTR("PhotosUICore"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        v20 = (float)v33 / v28;
        PLUserStatusUIGetLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
LABEL_30:

          PLLocalizedCountDescription();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (a3)
            goto LABEL_15;
          goto LABEL_16;
        }
        v31 = CFSTR("reset");
        if (a9)
          v31 = CFSTR("rebuild");
        *(_DWORD *)buf = 138544898;
        v38 = a1;
        v39 = 2114;
        v40 = (uint64_t)v31;
        v41 = 2048;
        v42 = v20;
        v43 = 2048;
        v44 = v34;
        v45 = 2048;
        v46 = v35;
        v47 = 2048;
        v48 = v36;
        v49 = 2114;
        v50 = v19;
        v32 = "%{public}@ Cloud counts for <%{public}@, progress:%f>: photos:%lu, videos:%lu, others:%lu [Reason: %{public}@]";
LABEL_29:
        _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_DEFAULT, v32, buf, 0x48u);
        goto LABEL_30;
      }
      if (a9)
      {
        PXLocalizedStringFromTable(CFSTR("PXCPLStatus_Rebuild"), CFSTR("PhotosUICore"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
    }
    PLUserStatusUIGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    *(_DWORD *)buf = 138544898;
    v38 = a1;
    v39 = 2114;
    v40 = objc_opt_class();
    v41 = 2048;
    v42 = *(double *)&v16;
    v43 = 2048;
    v44 = 0;
    v45 = 2048;
    v46 = 0;
    v47 = 2048;
    v48 = 0;
    v49 = 2114;
    v50 = v19;
    v32 = "%{public}@ Local counts for <%{public}@:%p>: photos:%lu, videos:%lu, others:%lu [Reason: %{public}@]";
    goto LABEL_29;
  }
  v22 = 0;
  v21 = 0;
  if (a3)
    goto LABEL_15;
LABEL_16:
  if (a4)
    *a4 = v20;

  return v21;
}

+ (BOOL)hasAnalysisProgressForMode:(int64_t)a3 analysisStatus:(id)a4 cplUIStatus:(id)a5 userDefaults:(id)a6 outAnimatedIconMode:(int64_t *)a7 outProgress:(float *)a8 outTitle:(id *)a9 outDescription:(id *)a10
{
  id v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  BOOL v21;
  id v23;
  id v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  uint64_t v29;
  int64_t v30;
  float v31;
  float v32;
  uint64_t v33;
  float v34;
  void *v36;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  if ((unint64_t)(a3 - 1) > 1)
    goto LABEL_5;
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hideAnalyzingStatus");

  if ((v19 & 1) != 0)
    goto LABEL_5;
  if ((PXCPLUIStatusHasImportantInformation(v16) & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v16, "actionTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    goto LABEL_5;
  v23 = v15;
  v24 = v17;
  +[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "simulateAnimatedIconMode");

  if ((v26 & 1) != 0)
  {
    +[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v36, "simulatedAnimatedIconMode");

    if (v30)
      goto LABEL_19;
  }
  else
  {
    objc_msgSend(v24, "didShowCompletedCurationFooterAnimation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");

    if ((v28 & 1) == 0)
    {
      v29 = objc_msgSend(v23, "state");
      if (v29 == 1)
      {
        v30 = 3;
LABEL_18:

        goto LABEL_19;
      }
      if (v29 == 2)
      {
        if (objc_msgSend(v23, "isDevicePlugged"))
          v30 = 2;
        else
          v30 = 1;
        goto LABEL_18;
      }
    }

  }
  if (objc_msgSend(v23, "state") != 2)
  {
LABEL_5:
    v21 = 0;
    goto LABEL_6;
  }
  v30 = 0;
LABEL_19:
  if (a8)
  {
    objc_msgSend(v23, "displayProgress");
    v32 = v31;
    v33 = objc_msgSend(v23, "state");
    v34 = -1.0;
    if (v32 != -1.0 && v33 != 1)
      v34 = v32;
    *a8 = v34;
  }
  if (a10)
  {
    objc_msgSend(v23, "localizedDescription");
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a9)
  {
    objc_msgSend(v23, "localizedTitle");
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
    *a7 = v30;
  v21 = 1;
LABEL_6:

  return v21;
}

@end
